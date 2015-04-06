/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.drawing;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import lib.Options.XMLDataModel;
import xact.viewsClass;

/**
 *
 * @author ismail
 */
public class servicesView {

    lib.engine.db.operations mydb = new lib.engine.db.operations();

    public String get_Childrens(String parentID, String sce_id, String mod_id) throws java.sql.SQLException {
        String returnData = "";
        int me = 0;

        xact.viewsClass v = new xact.viewsClass();
        // v.services(parentID);

        mydb.openCon();
        //int mynodesall = mydb.getRowCount(XMLDataModel.SERVICE_DATA_VIEW, "  PARENT_ID ='" + parentID + "' order By FROM_ID");

        int mynodesall = mydb.getRowCount(XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME, "  PARENT_ID ='" + parentID + "'");

        returnData += " /* alert ( '" + parentID + "::" + mynodesall + "');*/ ";


        if (mynodesall > 0) {

            String pid = "l_node" + parentID;
            returnData += "if (" + pid + "!=null){"
                    
                    + "  var v=" + pid + ".getValue();  "
                    + "  v=v.replace('texth','texth par');"
                    + " " + pid + ".setValue(v); "
                    + "  var myAn" + parentID + " = new Array();  "
                    + " var kkkkkk" + parentID + "=gra.insertVertex(l_node" + parentID + ",kkkkkk" + parentID + ",\"\", 100, 100, 100,100);"
                    + " myAn" + parentID + "[0]=l_node" + parentID + ";"
                    + " gra.foldCells (true,false,myAn" + parentID + ");"
                   // + " var geo = gra.getModel().getGeometry(l_node" + parentID + ");"
                /*    + " geo.width=130; "
                    + "geo.height=130;"*/
                   // + " l_node" + parentID + ".setGeometry(geo); "
                    + " }";
        }

        return returnData;

    }

    public String getStylesArrays() throws SQLException {


        String returndata = "<script type=\"text/javascript\"> "
                + " function arraystyle(type,act){ "
                + "var myArray = new Array(); ";
        mydb.openCon();
        ResultSet rsetyles = mydb.getData(XMLDataModel.STYLES_TABLENAME, "", " TYPE like '%service_%' ");

        while (rsetyles.next()) {

            String mytype = rsetyles.getString("TYPE").replace("service_", "");

            returndata += " if (type==\"" + mytype + "\" ){ "
                    + "var myimage='" + rsetyles.getString("IMAGE") + "';"
                    
                    + " if (act=='0'){"
                    + " myimage= myimage.replace(\".png\", \"\");"
                    + " myimage+='_notactive.png';"
                    
                    + "}"
                    + "else if (act=='1'){"
                    + "myimage= myimage.replace('.png', '');" 
                    +" myimage+='_halfactive.png';"
                   
                    + "}"
                   
                    + " myArray[0]=\"#" + rsetyles.getString("STYLE_GRADIENTCOLOR") + "\"; "
                    + " myArray[1]=\"#" + rsetyles.getString("STYLE_STROKECOLOR") + "\";   "
                    + " myArray[2]=\"#" + rsetyles.getString("STYLE_FILLCOLOR") + "\";     "
                    + " myArray[2]=\"#" + rsetyles.getString("STYLE_FONTCOLOR") + "\";     "
                    + " myArray[4]=\"Verdana\";"
                    + " myArray[6]=\"1\";"
                    + " myArray[8]=\"\"; "
                    + " myArray[9]=\"bottom\"; "
                    + " myArray[10]=\"0\"; "
                    + " myArray[11]=true;"
                    + " myArray[12]=\"\"; "
                    + " myArray[13]=\"image\"; "
                    + " myArray[14]= \"images/\"+myimage; "
                    + " }";
        }

        mydb.closeCon();



        returndata += " return  myArray; "
                + " }</script>";































        return returndata;
    }

    
    
    
    
    public String getStylesSeting() throws SQLException {


        String returndata = "<script type=\"text/javascript\"> function arraystyleseting(type){ var myArray = new Array();";
        mydb.openCon();
        ResultSet rsetyles = mydb.getData(XMLDataModel.STYLES_TABLENAME, "", "TYPE like '%service_%'");

        while (rsetyles.next()) {

            String mytype = rsetyles.getString("TYPE").replace("service_", "");
            returndata += "if (type==\"" + mytype + "\" ){  myArray[0]=\"" + rsetyles.getString("WIDTH") + "\";    myArray[1]=\"" + rsetyles.getString("HEIGHT") + "\";  }";
        }

        mydb.closeCon();
        returndata += "return  myArray;}</script>";

        return returndata;
    }

    public String get_Childrens_ajax(String parentID) throws java.sql.SQLException {
        String returnData = "";


        String myfrom = "((`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "` inner join `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "` "
                + "on(`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`CHILD_ID` = `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID`)) join `" + XMLDataModel.SERVICE_LINK_TABLENAME + "` "
                + "on(`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`FROM_ID` or `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`TO_ID`))";
        String mywhere = "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID`='" + parentID + "'";
        String myGet = "" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + ".ID AS `nodes_ID`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`Name` AS `Name`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`TAG` AS `TAG`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`TYPE` AS `TYPE`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`ID`AS `link_ID1`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`FROM_ID` AS `FROM_ID`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`PARENT_ID` AS `PARENT_ID`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`TO_ID` AS `TO_ID`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID` AS `PID`";



        returnData += mydb.creatview(XMLDataModel.SERVICE_DATA_VIEW, myGet, myfrom, mywhere);

        return returnData;

    }

    public String get_Childrens_all_ajax(String parentID) throws java.sql.SQLException {



        xact.drawing.mxgraph mx = new xact.drawing.mxgraph();
        String returnData = "";


        ResultSet mynodesall = mydb.getData(XMLDataModel.SERVICE_DATA_VIEW, "*", "  PARENT_ID ='" + parentID + "' order By FROM_ID");

        ArrayList<String> mynn3 = new ArrayList<String>();


        while (mynodesall.next()) {
            String myID = mynodesall.getString("nodes_ID");
            if (!mynn3.contains(myID)) {

                mynn3.add(myID);

                String retTAG = "";

                String myTAG = mynodesall.getString("TAG");

                String Name = mynodesall.getString("Name");
                String TYPE = mynodesall.getString("TYPE");

                retTAG = myTAG;
                if (myTAG.equalsIgnoreCase("task") || myTAG.equalsIgnoreCase("activity")) {

                    retTAG = myTAG + "_" + TYPE;
                } else if (myTAG.equalsIgnoreCase("service") && TYPE.equalsIgnoreCase("Simple Link")) {


                    retTAG = "message";
                }
                returnData += myID + "__" + Name + "__" + retTAG + get_Childrens_ch_ajax(myID) + ";";
                lib.tools.test.addMessage("service view,sv-nodes,sv-child-nodes", "SV-Child Nodes", "Drawing Service View Node (Child) via Ajax call", "Drawing SV Node Name: " + Name + " ID: " + myID + " Tag_Type: " + retTAG + ".", XMLDataModel.successClass);

            }

        }

        return returnData;

    }

    public String get_Childrens_all_edg_ajax(String parentID) throws java.sql.SQLException {



        xact.drawing.mxgraph mx = new xact.drawing.mxgraph();
        String returnData = "";
        ArrayList<String> mynn3 = new ArrayList<String>();

        ResultSet mynodesall = mydb.getData(XMLDataModel.SERVICE_DATA_VIEW, "*", "  PARENT_ID ='" + parentID + "' order By FROM_ID");


        while (mynodesall.next()) {
            String link_ID1 = mynodesall.getString("link_ID1");

            if (!mynn3.contains(link_ID1)) {

                mynn3.add(link_ID1);

                String myID = mynodesall.getString("nodes_ID");
                ;
                String myTO_ID = mynodesall.getString("TO_ID");
                String myFROM_ID = mynodesall.getString("FROM_ID");




                returnData += myID + "__" + link_ID1 + "__" + myFROM_ID + "__" + myTO_ID + ";";
            }

        }

        return returnData;

    }

    String get_Childrens_ch_ajax(String parentID) throws java.sql.SQLException {
        String returnData = "";

        int me = 0;
        String myfrom = "((`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "` inner join `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "` "
                + "on(`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`CHILD_ID` = `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID`)) join `" + XMLDataModel.SERVICE_LINK_TABLENAME + "` "
                + "on(`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`FROM_ID` or `" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`ID` = " + XMLDataModel.SERVICE_LINK_TABLENAME + ".`TO_ID`))";
        String mywhere = "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID`='" + parentID + "'";
        String myGet = "" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + ".ID AS `nodes_ID`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`Name` AS `Name`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME + "`.`TAG` AS `TAG`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`ID`AS `link_ID1`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`FROM_ID` AS `FROM_ID`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`PARENT_ID` AS `PARENT_ID`,"
                + "`" + XMLDataModel.SERVICE_LINK_TABLENAME + "`.`TO_ID` AS `TO_ID`,"
                + "`" + XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME + "`.`PARENT_ID` AS `PID`";
        mydb.creatviewNOCON(XMLDataModel.SERVICE_DATA_VIEW + "_CH", myGet, myfrom, mywhere);



        ResultSet mynodesall = mydb.getData(XMLDataModel.SERVICE_DATA_VIEW + "_CH", "*", "  PARENT_ID ='" + parentID + "'");
        while (mynodesall.next()) {

            returnData = "__in";

        }

        return returnData;

    }
}
