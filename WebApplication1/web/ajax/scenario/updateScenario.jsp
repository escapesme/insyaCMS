<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="xact.users.users"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.results.resultes"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String updateId = request.getParameter("uid");
    String status = request.getParameter("status");
    String name = request.getParameter("name");
    String newDuration = request.getParameter("duration");
    String newType = request.getParameter("type");
    String newNumber = request.getParameter("corporate_Number");
    String PARENT_ID = request.getParameter("PARENT_ID");
    String MODEL_ID = request.getParameter("MODEL_ID");
    String SCENARIO_ID = request.getParameter("SCENARIO_ID");
    String oldbbData = request.getParameter("bbData");
    String incheckdata = request.getParameter("incheck");
    ArrayList<String> processedInstances = new ArrayList<String>();
    String DESCRIPTION = request.getParameter("DESCRIPTION");
    String message = "";
    users u = new users();
    String cid = u.userReturn(request, "cid");
    String gid = u.userReturn(request, "gid");
    String owner = u.userReturn(request, "username");

    String ID = updateId;
    String[][] Data = {
        {"NAME", "DESCRIPTION"},
        {name, DESCRIPTION,}
    };

    //test += Arrays.deepToString(Data);
    test += db.setUpdate(XMLDataModel.SCENARIO_TABLENAME, Data, "id='" + updateId + "'");
    test += "[" + db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "SCENARIO_ID=" + updateId) + "]<br/>";
    String[] Datamodel = db.getRow(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + MODEL_ID);
    String oldNumber = Datamodel[3];
    String oldwindow_duration = Datamodel[5];
    String oldype = Datamodel[6];

    //test += "<br/>>>>>>>>>" + oldNumber + ":" + oldwindow_duration + ":" + oldype;

    if (!oldNumber.equalsIgnoreCase(newNumber)) {
        String sID = lib.tools.Utils.getNewID();
        String[] values = {sID, MODEL_ID, ID, Datamodel[0], "com.acrtek.xact_services.data.bo.BoCorporate", "NUMBER", oldNumber, newNumber};
        addToScenarioParameters(values);

    }

    if (!oldwindow_duration.equalsIgnoreCase(newDuration)) {

        String sID = lib.tools.Utils.getNewID();
        String[] values = {sID, MODEL_ID, ID, Datamodel[0], "com.acrtek.xact_services.data.bo.BoCorporate", "WINDOW_DURATION", oldwindow_duration, newDuration};
        addToScenarioParameters(values);
    }

    if (!oldype.equalsIgnoreCase(newType)) {

        String sID = lib.tools.Utils.getNewID();
        String[] values = {sID, MODEL_ID, ID, Datamodel[0], "com.acrtek.xact_services.data.bo.BoCorporate", "WINDOW_DURATION_TYPE", oldype, newType};
        addToScenarioParameters(values);
    }

    String[] arrybbdata = oldbbData.split(";");


    //test += Arrays.deepToString(arrybbdata);

    for (int i = 0; i < arrybbdata.length; i++) {
        String[] thbbdata = arrybbdata[i].split("__");

        if (thbbdata.length > 1 && !thbbdata[1].equalsIgnoreCase(thbbdata[2])) {

            //  test += Arrays.deepToString(thbbdata);

            String sID = lib.tools.Utils.getNewID();
            String[] values = {sID, MODEL_ID, ID, thbbdata[0], "com.acrtek.xact_services.data.bo.BoBusinessEntity", "NUMBER", thbbdata[2], thbbdata[1]};
            addToScenarioParameters(values);
        }

    }

    String[] incheck = incheckdata.split(";");


    for (int i = 0; i < incheck.length; i++) {

        String[] inchecks = incheck[i].split("__");

        if (inchecks.length > 1) {
            out.print("<br>"+inchecks[0]+"__"+inchecks[1]);
            String Class = "";
            String[] data = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + inchecks[0]);

            String[] data2 = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + inchecks[0]);
            if (data[1] != null) {
                if (!data[1].equalsIgnoreCase("null")) {
                    Class = returnCalss(data[1]);
                }
            } else if (data2[0] != null) {
                if (!data2[0].equalsIgnoreCase("null")) {
                    Class = "com.acrtek.xact_services.data.server.APPLICATION_COMPONENT_INST";
                }
            } else {

                Class = "com.acrtek.xact_services.data.bo.BoBusinessProcess";
            }



            if (Class.equalsIgnoreCase("com.acrtek.xact_services.data.server.APPLICATION_COMPONENT_INST")) {

                // test += "aci with id=" + inchecks[0] + " has status=" + inchecks[1] + "<br>";

                int dataXREF = db.getRowCount(XMLDataModel.ACI2ACT_TABLENAME, "AC_INST_ID=" + inchecks[0]);

                if (dataXREF > 1) {

                    db.openCon();
                    ResultSet dataF = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "AC_INST_ID=" + inchecks[0]);
                    boolean change = isActive(incheck, dataF, inchecks[1]);
                    db.closeCon();
                    test += "change=" + change + "<br>";
                    if (change) {
                        test += "aci row=" + dataXREF + "<br>";

                        String sID = lib.tools.Utils.getNewID();
                        String[] values = {sID, MODEL_ID, ID, inchecks[0], Class, "ACTIVE_STATUS", "1", inchecks[1]};

                        addToScenarioParameters(values);
                    } else {
                        if (!processedInstances.contains(inchecks[0])) {
                            if (message.equals("")) {
                                message += "Couldn't change the status for the AC instance '" + getInstanceName(inchecks[0]) + "' because it's in use by another activity";
                                out.print(message);
                                processedInstances.add(inchecks[0]);
                            }
                        }
                    }


                } else {

                    String sID = lib.tools.Utils.getNewID();
                    String[] values = {sID, MODEL_ID, ID, inchecks[0], Class, "ACTIVE_STATUS", "1", inchecks[1]};

                    addToScenarioParameters(values);
                }



            } else {

                String sID = lib.tools.Utils.getNewID();
                String[] values = {sID, MODEL_ID, ID, inchecks[0], Class, "ACTIVE_STATUS", "1", inchecks[1]};

                addToScenarioParameters(values);
            }





        }

    }


    //out.print(test);
//out.print(ID);

%>

<%!    String test = "";
    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     *
     *
     */
    boolean isActive(String[] Datagetobjects, ResultSet data, String value) throws SQLException {

        boolean returnValue = true;

        while (data.next()) {

            for (int i = 0; i < Datagetobjects.length; i++) {

                String[] thbbdata = Datagetobjects[i].split("__");


                if (thbbdata[0].equalsIgnoreCase(data.getString("SERVICE_ACTIVITY_ID"))
                        && !thbbdata[1].equalsIgnoreCase(value)) {

                    returnValue = false;

                }

            }

        }



        return returnValue;

    }

    String addToScenarioParameters(String[] values) {
        String returnData = "";
        String[][] Datas = {
            {"Id", "MODEL_ID", "SCENARIO_ID", "OBJECT_ID", "OBJECT_CLASS", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE"},
            values
        };
        test += "<br>" + Arrays.deepToString(values) + "<br>";

        returnData = db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, Datas);
        test += returnData;
        return returnData;

    }

    String returnCalss(String tag) {

        String returnData = "";


        if (tag.equalsIgnoreCase("process")) {
            returnData = "com.acrtek.xact_services.data.bo.BoProcess";

        } else if (tag.equalsIgnoreCase("component")) {

            returnData = "com.acrtek.xact_services.data.bo.BoComponent";


        } else if (tag.equalsIgnoreCase("task")) {

            returnData = "com.acrtek.xact_services.data.bo.BoTask";


        } else if (tag.equalsIgnoreCase("Activity")) {

            returnData = "com.acrtek.xact_services.data.bo.BoActivity";


        } else if (tag.equalsIgnoreCase("service")) {

            returnData = "com.acrtek.xact_services.data.bo.BoService";


        }

        return returnData;



    }

    String getInstanceName(String id) {
        String returnData = "";
        String[] row = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + id);
        returnData += row[6];
        return returnData;

    }

%>

