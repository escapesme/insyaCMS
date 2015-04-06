<%@page import="lib.Options.XMLDataModel"%>
<%

    //            $.get("ajax/hostdata.jsp?log_servers=" + $(this).val() + "&complex=" + $(this).val() + "", function(mdata) {
    String outDat = "0";
    String com_id = request.getParameter("complex");

    String log_servers = request.getParameter("log_servers");

    String node_id = request.getParameter("node_id");

    lib.engine.db.operations db = new lib.engine.db.operations();

    String[] data = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + node_id);

    String complex0 = db.getRowMinData(XMLDataModel.COMPLEX_INST_TABLENAME, "SERVER_INST_ID='" + data[0] + "'")[0];
    String partition0 = db.getRowMinData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "COMPLEX_INST_ID='" + complex0 + "'")[0];
    String partition0_com = db.getRowMinData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "COMPLEX_INST_ID='" + com_id + "'")[0];

    String DBInstanceType = "";

    if (partition0 != null) {

        DBInstanceType = db.getRow(XMLDataModel.DB_INST_TABLENAME, "LOGICAL_SERVER_INST_ID='" + partition0 + "'")[4];

        if ((complex0.equalsIgnoreCase(com_id)) && partition0_com.equalsIgnoreCase(log_servers)) {
            outDat = "1";
        } else if ((DBInstanceType.equalsIgnoreCase("9") || DBInstanceType.equalsIgnoreCase("12")) && partition0_com.equalsIgnoreCase(log_servers)) {
            outDat = "2";

        }

    }

    out.print(outDat);
%>