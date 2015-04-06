/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.views;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import lib.Options.XMLDataModel;

/**
 *
 * @author ismail
 */
public class Group {

    lib.engine.db.operations db = new lib.engine.db.operations();
    ArrayList<String> mynodes = new ArrayList();
    lib.tools.MXGraphUtils mxutil = new lib.tools.MXGraphUtils();

    int y = 0;
    int x = 0;

    public String get_nodes(String[] res, String SCENARIOID, String mod_id, String myid, String heighlight, String proid) throws SQLException {
//this function draw the nodes on the group view
        mynodes.clear();

        db.openCon();

        ResultSet rs = db.getData(XMLDataModel.NODE_TABLENAME, "*", "`GROUP_ID`=" + res[0] + " and MODEL_ID=" + mod_id);

        String returnData = "var mynodes = new Array();";

// get style
        while (rs.next()) {
            Object sty[] = null;// db.getRowNocon(XMLDataModel.STYLES_TABLENAME, "TYPE='GroupView_" + rs.getString("type") + "'");

            if (heighlight.equals(rs.getString("id"))) {
                sty = mxutil.getStyle("GroupView_" + rs.getString("type") + "_highlight", "mystylvve", proid);

            } else {

                sty = mxutil.getStyle("GroupView_" + rs.getString("type"), "mystylvve", proid);

            }

            mynodes.add(rs.getString("id"));
//draw the node by calling creatNode function.
            String[] s = db.getRowNocon(XMLDataModel.LINE_TABLENAME, "  NODE_ID1=" + rs.getString("id") + " or NODE_ID2=" + rs.getString("id"));
            if (s[0] == null) {
                y++;
            }
            returnData += sty[0] + " ;var myd_g" + rs.getString("id") + " = creatNode(graph_group_" + myid + " ,\"group_node/" + rs.getString("id") + "/" + SCENARIOID + "/" + mod_id + "\" ,\"" + rs.getString("NAME") + "\",700," + (y * 90) + "," + rs.getString("id") + "," + sty[16] + "," + sty[17] + ",mystylvve);\n";

            lib.tools.test.addMessage("group view,gv-nodes", "GV-Nodes", "Drawing Group View Node", "Drawing Node: " + rs.getString("NAME") + "(" + rs.getString("id") + ") of Type: " + rs.getString("type") + ".", XMLDataModel.successClass);

        }

        // returnData += " alert (\""+mynodes.contains("ffffffffff") +"\");";
        db.closeCon();
        return returnData;

    }

    public String get_groups(String[] res, String SCENARIOID, String mod_id, String myid, String heighlight, String proid) throws SQLException {
// this function creates the group nodes for the group view and also creates the edges
        String returnData = "";
        db.openCon();

        ResultSet rsss = db.getData(XMLDataModel.GROUP_CONNECTORS_TABLENAME, "*", "Group_ID1=" + res[0] + " and MODEL_ID=" + mod_id);
        while (rsss.next()) {

            String[] mynod = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, "ID=" + rsss.getString("Group_ID2") + " and ID<>" + res[0] + " and MODEL_ID=" + mod_id);

            String[] mythnod = db.getRowNocon(XMLDataModel.NODE_TABLENAME, "ID=" + rsss.getString("NODE_ID2") + " and MODEL_ID=" + mod_id);

            Object stygg[] = null;

            if (heighlight.equals(mynod[0])) {

                stygg = mxutil.getStyle("GroupView_groupNode_highlight", "mystyle", proid);
            } else {

                stygg = mxutil.getStyle("GroupView_groupNode", "mystyle", proid);

            }

//create node and create edge
            returnData += stygg[0] + "; var myd_g" + mynod[0] + " = creatNode(graph_group_" + myid + " ,\"group/" + mynod[0] + "/" + SCENARIOID + "/" + mod_id + "/" + rsss.getString("NODE_ID2") + "\" ,\"" + mythnod[2] + " (" + mynod[3] + ")" + "\",30,50," + mynod[0] + "," + stygg[16] + "," + stygg[17] + ",mystyle);\n";
            returnData += "var ed_group" + rsss.getString("ID") + " = creatE_Group(graph_group_" + myid + " ,myd_g" + rsss.getString("NODE_ID1") + ", myd_g" + mynod[0] + ",\"line/" + rsss.getString("ID") + "/" + SCENARIOID + "/" + mod_id + "\" );\n";
            lib.tools.test.addMessage("group view,gv-group-nodes", "GV-Group Nodes", "Drawing Group Node", "Drawing Group Node: " + mynod[3] + "(" + mynod[0] + ")", XMLDataModel.successClass);

        }
        db.closeCon();

        return returnData;
    }

    public String get_groups1(String[] res, String SCENARIOID, String mod_id, String myid, String heighlight, String proid) throws SQLException {
// this function creates the group nodes for the group view and also creates the edges
        String returnData = "";
        db.openCon();

        ResultSet rsss = db.getData(XMLDataModel.GROUP_CONNECTORS_TABLENAME, "*", "Group_ID2=" + res[0]);
        while (rsss.next()) {

            String[] mynod = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, "ID=" + rsss.getString("Group_ID1") + " and ID<>" + res[0] + " and MODEL_ID=" + mod_id);

            String[] mythnod = db.getRowNocon(XMLDataModel.NODE_TABLENAME, "ID=" + rsss.getString("NODE_ID1") + " and MODEL_ID=" + mod_id);

            Object stygg[] = null;

            if (heighlight.equals(mynod[0])) {

                stygg = mxutil.getStyle("GroupView_groupNode_highlight", "mystyle", proid);
            } else {

                stygg = mxutil.getStyle("GroupView_groupNode", "mystyle", proid);

            }

            returnData += stygg[0] + "; var myd_g" + mynod[0] + " = creatNode(graph_group_" + myid + " ,\"group/" + mynod[0] + "/" + SCENARIOID + "/" + mod_id + "/" + rsss.getString("NODE_ID1") + "\" ,\"" + mythnod[2] + " (" + mynod[3] + ")" + "\",30,50," + mynod[0] + "," + stygg[16] + "," + stygg[17] + ",mystyle);\n";
            returnData += " var ed_group" + rsss.getString("ID") + " = creatE_Group(graph_group_" + myid + " ,myd_g" + rsss.getString("NODE_ID2") + ", myd_g" + mynod[0] + ",\"line/" + rsss.getString("ID") + "/" + SCENARIOID + "/" + mod_id + "\" );\n";
            lib.tools.test.addMessage("group view,gv-group-nodes", "GV-Group Nodes", "Drawing Group Node", "Drawing Group Node: " + mynod[3] + "(" + mynod[0] + ")", XMLDataModel.successClass);
        }

        db.closeCon();

        return returnData;
    }

    public String get_edgs(String[] res, String SCENARIOID, String mod_id, String myid, String proid) throws SQLException {
// thi function create the edges for the group view nodes (except the group nodes which are handlied within its own function)
        db.openCon();

        ResultSet rs = db.getData(XMLDataModel.LINE_TABLENAME, "*", "  MODEL_ID=" + mod_id);

        String returnData = "";

        while (rs.next()) {

            String node_1 = rs.getString("NODE_ID1");
            String node_2 = rs.getString("NODE_ID2");
// the line table can have more lines than needed so we check if node1 and node 2 both are present in the array of the group viw nodes and then draw the edge
            if (mynodes.contains(node_1) && mynodes.contains(node_2)) {

//type
                //  returnData += "alert('" + node_1 + "_" + node_2 + "');";
                returnData += "var ed_group" + rs.getString("ID") + " = creatE_Group(graph_group_" + myid + " ,myd_g" + node_1 + ", myd_g" + node_2 + ",\"line/" + rs.getString("ID") + "/" + SCENARIOID + "/" + mod_id + "\" ,'" + rs.getString("WIRELESS") + "');\n";

            }

        }
        db.closeCon();
        return returnData;

    }
}
