/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import lib.Options.XMLDataModel;

/**
 *
 * @author escapes
 */
public class NodeExtension {

    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     * Generates the html data for the green tab in the node extension dialog.
     *
     * @param nodeId the node id to display the extension dialog for.
     * @return a string containing the html data for the green tab.
     * @throws SQLException
     */
    public String getGreen(String nodeId) throws SQLException {
        String data = "";
        String energy = "0.0";
        String heat = "0.0";
        db.openCon();
        ResultSet nodeExt = db.getData(XMLDataModel.NODE_EXT_TABLENAME, "*", "ID=" + nodeId);
        while (nodeExt.next()) {
            energy = nodeExt.getString("ENERGY_USAGE");
            heat = nodeExt.getString("HEAT_EMISSION");
        }

        data += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Energy Usage (KWH)</div>"
                + "<div class=\"frm_input\"> <input type=\"text\"   class=\"greenenergy\"   value='" + energy + "'maxlength='10' /> </div></div>";
        data += "<div class=\"frm_row do_left \" ><div class=\"frm_label\">Heat Emission (BTU)</div>"
                + "<div class=\"frm_input\"><input type=\"text\"   class=\"greenheat\"   value='" + heat + "' maxlength='10' /></div></div>";
        return data;
    }

    /**
     * Generates the html data for the general tab in the node extension dialog.
     *
     * @param nodeId the node id to display the extension dialog for.
     * @return a string containing the html data for the general tab.
     * @throws SQLException
     */
    public String getGeneral(String nodeId) throws SQLException {
        String data = "";
        String capacity = "0";
        String space = "0.0";
        db.openCon();
        ResultSet nodeExt = db.getData(XMLDataModel.NODE_EXT_TABLENAME, "*", "ID=" + nodeId);
        while (nodeExt.next()) {
            capacity = nodeExt.getString("CAPACITY");
            space = nodeExt.getString("FOOTPRINT");
        }
        db.closeCon();
        data += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Capacity (Units)</div>"
                + "<div class=\"frm_input\"> <input type=\"text\"   class=\"generalcapacity\"   value='" + capacity + "'maxlength='10' /> </div></div>";
        data += "<div class=\"frm_row do_left \" ><div class=\"frm_label\">Space Requirements (SQFT)</div>"
                + "<div class=\"frm_input\"><input type=\"text\"   class=\"generalspace\"   value='" + space + "' maxlength='10' /></div></div>";
        return data;
    }

    /**
     * Generates the html data for the availability tab in the node extension
     * dialog.
     *
     * @param nodeId the node id to display the extension dialog for.
     * @return a string containing the html data for the availability tab.
     * @throws SQLException
     */
    public String getAvailability(String nodeId) throws SQLException {
        String data = "";
        String mtbf = "0.0";
        String mttr = "0.0";
        String upTime = "0.0";
        String serviceLevel = "0.0";
        db.openCon();
        ResultSet nodeExt = db.getData(XMLDataModel.NODE_EXT_TABLENAME, "*", "ID=" + nodeId);
        while (nodeExt.next()) {
            mtbf = nodeExt.getString("MTBF");
            mttr = nodeExt.getString("MTTR");
            upTime = nodeExt.getString("EXPUPTIME");
            serviceLevel = nodeExt.getString("NODESLG");
        }
        data += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Mean Time Between Failure (MTBF)</div>"
                + "<div class=\"frm_input\"> <input type=\"text\"   class=\"availmtbf\"   value='" + mtbf + "' maxlength='10' /> </div></div>";
        data += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Mean Time To Repair (MTTR)</div>"
                + "<div class=\"frm_input\"><input type=\"text\"   class=\"availmttr\"   value='" + mttr + "'maxlength='10' /></div></div>";
        data += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Node Expected UpTime</div>"
                + "<div class=\"frm_input\"> <input type=\"text\"   class=\"availuptime\"   value='" + upTime + "' maxlength='10'/> </div></div>";
        data += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Node Service Level Guarantee</div>"
                + "<div class=\"frm_input\"><input type=\"text\"   class=\"availservice\"   value='" + serviceLevel + "'maxlength='10' /></div></div>";
        return data;
    }

    public String getCost(String nodeId) throws SQLException {
        String data = "";
        String costValue = "0.0";
        String checked = "";
        String disabled = "disabled";
        String[] costRow = db.getRow(XMLDataModel.COST_TABLENAME, "OBJECT_ID=" + nodeId);
        String costType = "";
        if (costRow[0] != null) {
            disabled = "";
            checked = "checked='checked'";
            costType = costRow[2];
            costValue=costRow[5];
          
        }
        String mid = db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + nodeId)[1];
        ArrayList<String> costIds = new ArrayList<String>();
        ArrayList<String> costNames = new ArrayList<String>();
        db.openCon();
        ResultSet nodest = db.getData(XMLDataModel.COST_TYPE_TABLENAME, "*", "");
        String costTypes = "";
       
        while (nodest.next()) {
            if(!costNames.contains(nodest.getString("DESCRIPTION")))
            {
            costIds.add(nodest.getString("ID"));
            costNames.add(nodest.getString("DESCRIPTION"));
            }
        }
        for (int i = 0; i < costIds.size(); i++) {

            if (disabled.equals("")) {



                if (costType.equalsIgnoreCase(costIds.get(i))) {
                     System.err.println("cost type="+costIds.get(i));
                    costTypes += " <option value='" + costIds.get(i) + "' selected='selected'>" + costNames.get(i) + "</option>";
                } else {
                    costTypes += " <option value='" + costIds.get(i) + "'>" + costNames.get(i) + "</option>";
                }
            } else {

                costTypes += " <option value='" + costIds.get(i) + "'>" + costNames.get(i) + "</option>";
            }


        }

        data += " <div class=\"frm_row do_left  \" >"
                + "<div class=\"frm_label\">Cost Provided:</div>"
                + "<div class=\"frm_input\"><input type=\"checkbox\"  class='costProvided'" + checked + " /> </div></div>";




        data += " <div class=\"frm_row do_left\" >"
                + "<div class=\"frm_label\">Cost Type:</div>"
                + "<div class=\"frm_input\"><select " + disabled + "   class=\"costTypes\" >" + costTypes + "</select></div></div>";


        data += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Cost Value</div>"
                + "<div class=\"frm_input\"> <input type=\"text\"   class=\"costValue\" " + disabled + "  value='" + costValue + "' maxlength='10'/> </div>";

        return data;
    }

    /**
     * Generates the html data for the failover tab in the node extension
     * dialog. The list of nodes to failover to will be only enabled if failover
     * is selected.
     *
     * @param nodeId the node id to display the extension dialog for.
     * @return a string containing the html data for the failover tab.
     * @throws SQLException
     */
    public String getFailover(String nodeId) throws SQLException {
        String data = "";
        String delay = "0.0";
        String checked = "";
        String disabled = "disabled";
        String mid = db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + nodeId)[1];
        String failoverNode = "";
        String failover = "";
        ArrayList<String> nodeIds = new ArrayList<String>();
        ArrayList<String> nodeNames = new ArrayList<String>();
        db.openCon();
        ResultSet nodeExt = db.getData(XMLDataModel.NODE_EXT_TABLENAME, "*", "ID=" + nodeId);
        while (nodeExt.next()) {
            delay = nodeExt.getString("ENERGY_USAGE");

            failoverNode = nodeExt.getString("FAILOVER_NODE");
            failover = nodeExt.getString("FAILOVER");

        }
        ResultSet nodest = db.getData(XMLDataModel.NODE_TABLENAME, "*", "ID<>" + nodeId + " AND MODEL_ID=" + mid);

        while (nodest.next()) {
            nodeIds.add(nodest.getString("ID"));
            nodeNames.add(nodest.getString("NAME"));
        }
        System.out.println(failover);
        if (failover.equals("1")) {
            checked = "checked='checked'";
            disabled = "";
        }


        data += " <div class=\"frm_row do_left  \" >"
                + "<div class=\"frm_label\">Failover Provided:</div>"
                + "<div class=\"frm_input\"><input type=\"checkbox\"  class='failoverProvided'" + checked + " /> </div></div>";
        String indexInstances = "";
        for (int i = 0; i < nodeIds.size(); i++) {

            if (failoverNode != null) {

                if (!failoverNode.trim().equals("")) {

                    if (failoverNode.equalsIgnoreCase((String) nodeIds.get(i)) && failover.equals("1")) {
                        indexInstances += " <option value='" + nodeIds.get(i) + "' selected='selected'>" + nodeNames.get(i) + "</option>";
                    } else {
                        indexInstances += " <option value='" + nodeIds.get(i) + "'>" + nodeNames.get(i) + "</option>";
                    }
                } else {

                    indexInstances += " <option value='" + nodeIds.get(i) + "'>" + nodeNames.get(i) + "</option>";
                }
            } else {

                indexInstances += " <option value='" + nodeIds.get(i) + "'>" + nodeNames.get(i) + "</option>";
            }


        }



        data += " <div class=\"frm_row do_left\" >"
                + "<div class=\"frm_label\">Failover Target:</div>"
                + "<div class=\"frm_input\"><select " + disabled + "   class=\"failoverTargets\" >" + indexInstances + "</select></div></div>";


        data += "<div class=\"frm_row do_left \" >"
                + "<div class=\"frm_label\">Failover Delay</div>"
                + "<div class=\"frm_input\"> <input type=\"text\"   class=\"faildelay\"   value='" + delay + "' maxlength='10'/> </div>";

        return data;
    }
}
