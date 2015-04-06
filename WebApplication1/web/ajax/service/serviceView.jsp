<%@page import="xact.utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.ArrayList"%>
<%
    xact.drawing.servicesView sview = new xact.drawing.servicesView();
    String[] ids = request.getParameter("id").split("/");
    String parent_id = ids[1];
    String sce_id = ids[2];
    String mod_id = ids[3];
    out.print(sview.get_Childrens_ajax(parent_id));
    mydb.openCon();
    if (request.getParameter("type").equals("nodes")) {
        out.print(get_Childrens_all_ajax(parent_id, sce_id, mod_id));
    } else {
        out.print(get_Childrens_all_edg_ajax(parent_id));
    }
    mydb.closeCon();
%>
<%!    lib.engine.db.operations mydb = new lib.engine.db.operations();

    String get_Childrens_all_ajax(String parentID, String sce_id, String mod_id) throws java.sql.SQLException {
        xact.drawing.mxgraph mx = new xact.drawing.mxgraph();
        String returnData = "";
        ResultSet mynodesall = mydb.getData(XMLDataModel.SERVICE_DATA_VIEW, "*", "  PARENT_ID ='" + parentID + "'   order By FROM_ID");
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


                String isact = "-1";
                if (!sce_id.equals("") && sce_id != null) {

                    String[] sedata = mydb.getRowNocon(XMLDataModel.SCENARIO_TABLENAME, "ID='" + sce_id.trim() + "' ");

                    utils u = new utils();

                    if (sedata[7].equals("6")) {
                        if (!myTAG.equalsIgnoreCase("start") && !myTAG.equalsIgnoreCase("end") && !myTAG.equalsIgnoreCase("service")) {
                            isact = u.getISScenarioPram(mod_id, sedata[0], mynodesall.getString("nodes_ID"), "ACTIVE_STATUS");
                            if(isact!="-1"){
                           if(u.isChildActive(mod_id, sedata[0], mynodesall.getString("nodes_ID"))){
                         isact = "1";
                           }
                    
                    }
                        }else if(myTAG.equalsIgnoreCase("service")){
                             isact = u.serviceProducerActive(mynodesall.getString("nodes_ID"),mod_id,sedata[0]);
                        }
                          else if (myTAG.equalsIgnoreCase("start") || myTAG.equalsIgnoreCase("end")) {
                    //out.print(myTAG);
                     isact=u.getISScenarioPram(mod_id, sedata[0], mynodesall.getString("PARENT_ID"), "ACTIVE_STATUS");
                       
                }
                    }
                }


                returnData += myID + "__" + Name + "__" + retTAG + get_Childrens_ch_ajax(myID) + "__" + isact + ";";


            }

        }




        ResultSet mynodesallStart = mydb.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "  PARENT_ID ='" + parentID + "'");
        while (mynodesallStart.next()) {
            String myID = mynodesallStart.getString("ID");
            if (!mynn3.contains(myID)) {
                mynn3.add(myID);
                String myTAG = mynodesallStart.getString("TAG");
                returnData += myID + "__" + mynodesallStart.getString("NAME") + "__" + myTAG + "__0";

            }

        }


        return returnData;

    }

    String get_Childrens_all_edg_ajax(String parentID) throws java.sql.SQLException {
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
        String returnData = "__out";

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



        //  xact.viewsClass v = new xact.viewsClass();
        // v.services(parentID);

        ResultSet mynodesall = mydb.getData(XMLDataModel.SERVICE_DATA_VIEW + "_CH", "*", "  PARENT_ID ='" + parentID + "'");
        while (mynodesall.next()) {
            returnData = "__in";

        }






        int mynodesall2 = mydb.getRowCountNocon(XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME, "  PARENT_ID ='" + parentID + "'");

        if (mynodesall2 > 0) {
            returnData = "__in";
        }



        return returnData;
    }
%>