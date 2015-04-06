<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String status = request.getParameter("status");

    String retdata = "";

    if (status.equalsIgnoreCase("getactivitites")) {

        String MODEL_ID = request.getParameter("MODEL_ID");
        String OuT = MODEL_ID;

        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "", "MODEL_ID=" + MODEL_ID);
        retdata += "<table class='activitites'>";
        while (rs.next()) {
            String tid = rs.getString("ID");
            ArrayList<String[]> a = Utils.getallacs(tid, db);

            for (String[] d : a) {
                String checked = "";
                if (tid.equalsIgnoreCase(d[2])) {
                    checked = "checked";
                }

                retdata += "<tr  class='_" + tid + "' data-value='" + d[0] + "' ><td><input  data-tid='" + tid + "'  type='checkbox' " + checked + " value='" + d[0] + "'/>" + d[1] + "</td></tr>";
            }

        }

        retdata += "</table>";

        db.closeCon();
    } else if (status.equalsIgnoreCase("saveactivity")) {

        String MODEL_ID = request.getParameter("MODEL_ID");

        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "", "MODEL_ID=" + MODEL_ID);

        while (rs.next()) {
            String tid = rs.getString("ID");
            ArrayList<String[]> a = Utils.getallacs(tid, db);

            String checked = "";

            for (String[] d : a) {

                String[][] updateData = {{"OBC_FLAG"}, {"0"}};
                db.setUpdateNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, updateData, "id=" + d[0]);

            }

        }

        db.closeCon();

        String data = request.getParameter("data");
        if (!data.equalsIgnoreCase("")) {

            String[] a = data.split(";");
            for (String b : a) {
                String[] c = b.split(",");
                String[][] updateData = {{"OBC_FLAG"}, {c[0]}};
                db.setUpdate(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, updateData, "id=" + c[1]);

            }
        }
    } else if (status.equalsIgnoreCase("savecounter")) {
        String data = request.getParameter("data");

        String cdata = request.getParameter("data");

        String[] a = data.split(";");
        
        for (String b : a) {
            String[] c = b.split(",");
            if (!c[1].equalsIgnoreCase("0")) {

                String[] cd = db.getRow(XMLDataModel.COUNTER_TABLENAME, "*", "id=" + c[1]);

                String[][] updateData = {{"COUNTER_ID", "IDENTIFIER"}, {c[1], cd[6]}};
                db.setUpdate(XMLDataModel.BUSINESS_PROCESS_TABLENAME, updateData, "id=" + c[0]);
            } else {
                String[][] updateData = {{"COUNTER_ID", "IDENTIFIER"}, {"0", ""}};
                db.setUpdate(XMLDataModel.BUSINESS_PROCESS_TABLENAME, updateData, "id=" + c[0]);
            }
        }

    } else {

        String MODEL_ID = request.getParameter("MODEL_ID");
        String OuT = MODEL_ID;

        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "", "MODEL_ID=" + MODEL_ID);
        retdata += "<table class=' data_grid trajectory'>";
        while (rs.next()) {

            retdata += "<tr data-value='" + rs.getString("ID") + "' ><td >" + rs.getString("NAME") + "</td><td><select>" + getCOUNTER(rs.getString("COUNTER_ID")) + "</select></td></tr>";
        }
        retdata += "</table>";

    }

    out.print(retdata);


%>


<%!
    lib.engine.db.operations db = new lib.engine.db.operations();

    String getCOUNTER(String selectedvalue) throws SQLException {
        String r = "";

        ResultSet rs = db.getData(XMLDataModel.COUNTER_TABLENAME);
        r += "<option  value='0' ></option>";
        while (rs.next()) {

            String d = rs.getString("DESCRIPTION");

            if (d == null) {
                try {
                    d = rs.getString("IDENTIFIER");
                } catch (Exception e) {
                }
            }

            //  COUNTER.DESCRIPTION field and if thats emtpy it reads from the COUNTER.IDENTIFIER
            String selected = "";

            if (selectedvalue != null) {
                if (selectedvalue.equalsIgnoreCase(rs.getString("ID"))) {
                    selected = "selected";
                }
            }

            r += "<option " + selected + " value='" + rs.getString("ID") + "' >" + d + "</option>";

        }

        return r;

    }

%>