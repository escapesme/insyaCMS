<%@page import="lib.tools.Utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.jboss.weld.util.collections.Arrays2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String test = "";


    String groupID = request.getParameter("groupid");
    String loactionid = request.getParameter("loactionid");

    String s_id = request.getParameter("sid");
    String[] data = request.getParameter("data").split(";");
    String modelId = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + s_id)[1];
    String oldLocation = db.getRow(XMLDataModel.NET_GROUP_TABLENAME, "`ID`=" + groupID)[2];
    oldLocation= Utils.getScenarioPram(modelId, s_id, groupID, "LOCATION", oldLocation, "com.acrtek.xact_services.data.bo.BoGroup");

    for (int l = 0; l < data.length; l++) {
        if (!"".equals(data[l])) {
            String[] th_data = data[l].split("__");

            String[] line = db.getRow(XMLDataModel.LINE_TABLENAME, " id='" + th_data[0] + "'");

            out.print(updateGroups(th_data[0], s_id, th_data[1], line[3], modelId, oldLocation, loactionid));
            //updateGrroup(th_data[0], s_id, th_data[1], line[3]);
        }
    }







    String len = request.getParameter("len");
    String lines = request.getParameter("lines");







    test += "oldLocation: " + oldLocation;
    test += " <br />groupID: " + groupID;

    changeLaction(oldLocation, loactionid, groupID, s_id, modelId);







%>

<%!    lib.engine.db.operations db = new lib.engine.db.operations();

    String updateGroups(String LineID, String sID, String newValue, String oldValue, String modelid, String oldLoaction, String NewLoadtion) {
//        

        String outdata = "";

        String where = "SCENARIO_ID='" + sID + "' and  OBJECT_ID='" + LineID + "' and  S_PARAMETER='LENGTH' ";
        db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);




        if (!NewLoadtion.equalsIgnoreCase(oldLoaction)) {


            String inData[][] = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sID, LineID, "LENGTH", oldValue, newValue, "com.acrtek.xact_services.data.bo.BoLine", modelid}};

            outdata = db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, inData);
        }
        return outdata;
    }
    void changeLaction(String oldLoaction, String NewLoadtion, String GroupID, String sID, String modelid) {
        String where = "SCENARIO_ID='" + sID + "' and  OBJECT_ID='" + GroupID + "' and  S_PARAMETER='LOCATION' ";
        db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);

        if (!NewLoadtion.equalsIgnoreCase(oldLoaction)) {


            String inData[][] = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sID, GroupID, "LOCATION", oldLoaction, NewLoadtion, "com.acrtek.xact_services.data.bo.BoGroup", modelid}};

            db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, inData);


        }






    }
%>