<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();
    String Status = (String) request.getParameter("status");
    if (Status.equalsIgnoreCase("lineuF")) {
        String[] ids = request.getParameter("id").split("/");
        String dt = db.getValue(XMLDataModel.SERVICE_LINK_TABLENAME, "UTILIZATION_FREQUENCY", "ID='" + ids[1] + "'");
        out.print(dt);
    } else if (Status.equalsIgnoreCase("nodeData")) {
        String[] ids = request.getParameter("id").split("/");
        String[] dt = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID='" + ids[1] + "'");

        dt[9] = getd(dt[9]);
        dt[11] = getd(dt[11]);
        out.print(Arrays.deepToString(dt));
    } else if (Status.equalsIgnoreCase("getCollectors")) {

        String modid = request.getParameter("id");
        db.openCon();

        String returnData = "";
        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "MODEL_ID='" + modid + "' and TAG='collector'");
        while (rs.next()) {

            returnData += rs.getString("ID") + "__" + rs.getString("NAME") + ";";
        }
        out.print(returnData);

        db.closeCon();

    } else if (Status.equalsIgnoreCase("getServesName")) {
        try {

            if (request.getParameter("id") != null) {
                String[] ids = request.getParameter("id").split("/");

                String[] dt = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID='" + ids[1] + "'");

                out.print(dt[2]);
            }
        } catch (Exception e) {
        }
    }


%>


<%!
    String getd(String dir) {

        double num = Double.parseDouble(dir);
        int days = (int) num / 86400;

        double reminder = num % 86400;
        int hrs = (int) reminder / 3600;
        reminder = reminder % 3600;
        int mins = (int) reminder / 60;
        double seconds = reminder % 60;

        return days + "__" + hrs + "__" + mins + "__" + seconds;
    }
%>