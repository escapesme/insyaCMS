/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact;

import java.math.RoundingMode;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;

/**
 *
 * @author A7med
 */
/**
 * *
 * This class is where the data for the table detail dialog is created.
 *
 */
public class TableDetail {

    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     * the method responsible for creating the data in the table detail
     * dialog.<br> it starts from the instance id and the description id of the
     * selected table and builds the rest of the data from there.
     *
     * @param descId the id of the table description
     * @param instanceId the id of the table instance
     * @return a string containing the html data for the table
     *
     */
    public String tableData(String descId, String instanceId) {
        String out = "";
        //to hold the logical drives for this instance
        ArrayList instances = new ArrayList();
        //holds the names for the index descs names for this table
        ArrayList indexesArray = new ArrayList();
        ArrayList instancesIds = new ArrayList();
        ArrayList instancesNames = new ArrayList();
        String driveName = "";
        ArrayList disks = new ArrayList();
        double minIO, totalPages, otherAccess, physicalIO, occupationRate, synNum = 0;
        String[] tableDesc = db.getRow(XMLDataModel.TABLE_DESC_TABLENAME, "ID=" + descId);
        String dbNmaespaceId = tableDesc[2];
        String dbName = db.getRow(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "ID=" + dbNmaespaceId)[2];
        String tableName = tableDesc[1];
        String totalIndexes = tableDesc[7];
        String usefulSize = tableDesc[4];
        String rowLength = tableDesc[6];
        String[] cacheDesc = db.getRow(XMLDataModel.CACHE_DESC_TABLENAME, "ID=" + tableDesc[3]);
        String cacheName = cacheDesc[2];
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMaximumIntegerDigits(5);
        nf.setMinimumFractionDigits(5);
        nf.setRoundingMode(RoundingMode.DOWN);
        db.openCon();
        ResultSet indexes = db.getData(XMLDataModel.INDEX_DESC_TABLENAME, "*", "TABLE_DESC_ID=" + tableDesc[0]);
        try {
            while (indexes.next()) {
                indexesArray.add(indexes.getString("NAME"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDetail.class.getName()).log(Level.SEVERE, null, ex);
        }

        db.closeCon();
        db.openCon();
        ResultSet tableInstances = db.getData(XMLDataModel.TABLE_INST_TABLENAME, "*", "TABLE_DESC_ID=" + descId);

        try {
            while (tableInstances.next()) {
                instancesIds.add(tableInstances.getString("ID"));
                instances.add(tableInstances.getString("LOGICAL_DRIVE_NAME"));
                String[] dbNamespace = db.getRowNocon(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "id=" + tableInstances.getString("DB_NAMESPACE_INST_ID"));
                String instanceName = db.getRowNocon(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "id=" + dbNamespace[1])[2];
                instancesNames.add(instanceName + "." + tableName);

            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
        if (instanceId != null) {

            String[] tableInstCurrent = db.getRow(XMLDataModel.TABLE_INST_TABLENAME, "ID=" + instanceId);
            driveName = tableInstCurrent[4];
            minIO = Double.parseDouble(tableInstCurrent[6]);
            totalPages = Double.parseDouble(tableInstCurrent[5]);
            otherAccess = Double.parseDouble(tableInstCurrent[7]);
            physicalIO = Double.parseDouble(tableInstCurrent[8]);
            occupationRate = Double.parseDouble(tableInstCurrent[9]);
            synNum = Double.parseDouble(tableInstCurrent[10]);

        } else {


            String[] tableInstCurrent = db.getRow(XMLDataModel.TABLE_INST_TABLENAME, "ID=" + instancesIds.get(0));
            minIO = Double.parseDouble(tableInstCurrent[6]);
            totalPages = Double.parseDouble(tableInstCurrent[5]);
            otherAccess = Double.parseDouble(tableInstCurrent[7]);
            physicalIO = Double.parseDouble(tableInstCurrent[8]);
            occupationRate = Double.parseDouble(tableInstCurrent[9]);
            synNum = Double.parseDouble(tableInstCurrent[10]);
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
                + "<div class=\"frm_label\">Cache Name</div>"
                + "<div class=\"class=\"frm_input\"\">" + cacheName + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Row Length</div>"
                + "<div class=\"class=\"frm_input\"\">" + rowLength + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Total # of Indexes</div>"
                + "<div class=\"class=\"frm_input\"\">" + totalIndexes + "</div></div>";
        out += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Usefule Size</div>"
                + "<div class=\"class=\"frm_input\"\">" + usefulSize + "</div></div>";
        String indecec = "";
        for (int i = 0; i < indexesArray.size(); i++) {

            indecec += " <option >" + indexesArray.get(i) + "</option>";

        }

        String indexesArrays = "<div class=\"frm_row do_right  \" ><select multiple='multiple'>" + indecec + "</select></div>";

        out += lib.tools.Utils.HtmlPalnel("Indexes", indexesArrays);
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
        String instancesList = "<div class=\"frm_row do_left  \" ><div class=\"class=\"frm_input\"\"><select class=\"tableinstances\">" + indexInstances + "</select></div>";
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
        indexInstancesPanel += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Synonyms per Page</div>"
                + "<div class=\"class=\"frm_input\"\">" + nf.format(synNum) + "</div></div>";
        String diskList = "";
        for (int i = 0; i < disks.size(); i++) {

            diskList += " <option >" + disks.get(i) + "</option>";

        }

        String disksArray = "<div class=\"frm_row do_right  \" ><select multiple='multiple'>" + diskList + "</select></div>";

        indexInstancesPanel += lib.tools.Utils.HtmlPalnel("Disk", disksArray);
        out += lib.tools.Utils.HtmlPalnel("Table Instances", indexInstancesPanel);
        return out;
    }
}
