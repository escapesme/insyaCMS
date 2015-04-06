<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String printData = "";
    lib.engine.db.operations db = new lib.engine.db.operations();
    String status = request.getParameter("status");
    String complexId = request.getParameter("complexId");
    String modelId = request.getParameter("modelId");
    db.openCon();
    if (status.equalsIgnoreCase("getbf")) {
        String[] d = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "id=" + complexId);

        String[] s = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "id=" + d[1]);
        int r =Integer.parseInt(s[5]) ;
        if (r > 0) {
            r = 1;
        }
        out.print(r);

    } else {

        ResultSet servercData = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "", " MODEL_ID='" + modelId + "' AND COMPLEX_INST_ID =" + complexId);

        while (servercData.next()) {
            String[] serverRow = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + servercData.getString("LOGICAL_SERVER_ID"));

            printData += servercData.getString("ID") + "__" + serverRow[2] + ";";

        }

        out.print(printData);
    }
    db.closeCon();
%>
