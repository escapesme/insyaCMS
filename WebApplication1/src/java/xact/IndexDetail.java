/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;

/**
 * This is the class to get the data to be displayed in the index detail dialog.
 *
 * @author A7med
 */
public class IndexDetail {

    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     *
     * @param descId
     * @param instanceId
     * @return an html string represents the data in the dialog.
     */
    public String indexTable(String descId, String instanceId) {
        //contains the logical drives names for this index instance
        ArrayList instances = new ArrayList();
        //contains all the instances fro this index desc
        ArrayList instancesIds = new ArrayList();
        //contains the instances names
        ArrayList instancesNames = new ArrayList();
        //contains the desks for this instance
        ArrayList disks = new ArrayList();
        double minIO, totalPages, otherAccess, physicalIO, occupationRate = 0;
        String out = "";
        String[] indexDesc = db.getRow(XMLDataModel.INDEX_DESC_TABLENAME, "ID=" + descId);
        String[] tableDesc = db.getRow(XMLDataModel.TABLE_DESC_TABLENAME, "ID=" + indexDesc[2]);
        String dbNmaespaceId = tableDesc[2];
        String dbName = db.getRow(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "ID=" + dbNmaespaceId)[2];
        String tableName = tableDesc[1];
        String indexName = indexDesc[1];
        String rowLen = indexDesc[5];
        String indexTypeNum = indexDesc[4];
        String usefulSize = indexDesc[3];
        String defultInd = indexDesc[6];
        String driveName = "";
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMaximumIntegerDigits(5);
        nf.setMinimumFractionDigits(5);
        nf.setRoundingMode(RoundingMode.DOWN);

        db.openCon();
        ResultSet indexInst = db.getData(XMLDataModel.INDEX_INST_TABLENAME, "*", "INDEX_DESC_ID=" + descId);
        try {
            while (indexInst.next()) {
                String tableinst = db.getRowNocon(XMLDataModel.TABLE_INST_TABLENAME, "id=" + indexInst.getString("TABLE_INST_ID"))[2];
                String[] dbNamespace = db.getRowNocon(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "id=" + tableinst);
                String instanceName = db.getRowNocon(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "id=" + dbNamespace[1])[2];
                instances.add(indexInst.getString("LOGICAL_DRIVE_NAME"));
                instancesIds.add(indexInst.getString("ID"));
                instancesNames.add(instanceName + "." + indexName);
            }
        } catch (SQLException ex) {
            Logger.getLogger(IndexDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
        //get the properties of the selected instance from the list
        if (instanceId != null) {
            String[] indexInstCurrent = db.getRow(XMLDataModel.INDEX_INST_TABLENAME, "ID=" + instanceId);
            driveName = indexInstCurrent[4];
            minIO = Double.parseDouble(indexInstCurrent[6]);
            totalPages = Double.parseDouble(indexInstCurrent[5]);
            otherAccess = Double.parseDouble(indexInstCurrent[7]);
            physicalIO = Double.parseDouble(indexInstCurrent[8]);
            occupationRate = Double.parseDouble(indexInstCurrent[9]);

        } else {
            //get the properties of the default instance
            String[] indexInstCurrent = db.getRow(XMLDataModel.INDEX_INST_TABLENAME, "ID=" + instancesIds.get(0));
            minIO = Double.parseDouble(indexInstCurrent[6]);
            totalPages = Double.parseDouble(indexInstCurrent[5]);
            otherAccess = Double.parseDouble(indexInstCurrent[7]);
            physicalIO = Double.parseDouble(indexInstCurrent[8]);
            occupationRate = Double.parseDouble(indexInstCurrent[9]);
            driveName = (String) instances.get(0);
        }
        viewsClass views = new viewsClass();
        views.serverdata();
        String[] driveInst = db.getRow(XMLDataModel.LOGICAL_DRIVE_INST_TABLENAME, "name='" + driveName + "'");
        String[] LdriveView = db.getRow(XMLDataModel.LOGICAL_DRIVE_VIEW_ITEM_TABLENAME, "LOGICAL_DRIVE_INST_ID=" + driveInst[0]);

        db.openCon();


        ResultSet diskeGroup = db.getData(XMLDataModel.DISK_GROUP_INST_TABLENAME, "*", "DISK_STRING_INST_ID=" + LdriveView[1]);
        try {
            while (diskeGroup.next()) {
                disks.add(diskeGroup.getString("NAME"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(IndexDetail.class.getName()).log(Level.SEVERE, null, ex);
        }

        db.closeCon();
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Database Namespace</div>"
                + "<div class=\"class=\"frm_input\"\">" + dbName + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">DTable Name</div>"
                + "<div class=\"class=\"frm_input\"\">" + tableName + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Index Name</div>"
                + "<div class=\"class=\"frm_input\"\">" + indexName + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Row Length</div>"
                + "<div class=\"class=\"frm_input\"\">" + rowLen + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Index Type #</div>"
                + "<div class=\"class=\"frm_input\"\">" + indexTypeNum + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Usefule Size</div>"
                + "<div class=\"class=\"frm_input\"\">" + usefulSize + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Default Ind.</div>"
                + "<div class=\"class=\"frm_input\"\">" + defultInd + "</div></div>";
        String indexInstances = "";
        for (int i = 0; i < instancesIds.size(); i++) {
            if (instanceId != null) {
                if (instanceId.equalsIgnoreCase((String) instancesIds.get(i))) {
                    indexInstances += " <option id='" + instancesIds.get(i) + "' selected='selected'>" + instancesNames.get(i) + "</option>";
                } else {
                    indexInstances += " <option id='" + instancesIds.get(i) + "'>" + instancesNames.get(i) + "</option>";
                }
            } else {
                indexInstances += " <option id='" + instancesIds.get(i) + "'>" + instancesNames.get(i) + "</option>";
            }

        }
        String indexInstancesPanel = "";
        String instancesList = "<div class=\"frm_row do_left  \" ><div class=\"class=\"frm_input\"\"><select class=\"indexinstances\">" + indexInstances + "</select></div>";
        indexInstancesPanel += instancesList;

        indexInstancesPanel += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Total Pages per Tran</div>"
                + "<div class=\"class=\"frm_input\"\">" + nf.format(totalPages) + "</div></div>";
        indexInstancesPanel += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Minumum IO per Tran</div>"
                + "<div class=\"class=\"frm_input\"\">" + nf.format(minIO) + "</div></div>";
        indexInstancesPanel += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Other Access</div>"
                + "<div class=\"class=\"frm_input\"\">" + nf.format(otherAccess) + "</div></div>";
        indexInstancesPanel += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Physical IO</div>"
                + "<div class=\"class=\"frm_input\"\">" + nf.format(physicalIO) + "</div></div>";
        indexInstancesPanel += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Occupation Rate</div>"
                + "<div class=\"class=\"frm_input\"\">" + nf.format(occupationRate) + "</div></div>";
        String diskList = "";
        for (int i = 0; i < disks.size(); i++) {

            diskList += " <option >" + disks.get(i) + "</option>";

        }

        String disksArray = "<div class=\"frm_row do_right  \" ><select multiple='multiple'>" + diskList + "</select></div>";

        indexInstancesPanel += lib.tools.Utils.HtmlPalnel("Disk", disksArray);
        out += lib.tools.Utils.HtmlPalnel("Index Instances", indexInstancesPanel);

        return out;
    }
}
