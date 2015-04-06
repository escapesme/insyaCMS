<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();
    String modelId = request.getParameter("modelId");
    String status = request.getParameter("status");
    String printData = "";

    if (status != null) {
        if (status.equalsIgnoreCase("getAcdData")) {
            String acdId = request.getParameter("acdId");
            String[] acdData = db.getRowNocon(XMLDataModel.application_component_desc_TABLENAME, "ID=" + acdId);
            out.print(acdData[2] + ";");
            ResultSet prios = db.getData(XMLDataModel.APPLICATION_PRIO_TABLENAME, "*", " AC_ID=" + acdId);
            while (prios.next()) {
                out.print(prios.getString("NAME") + "__" + prios.getString("TIME") + ";");
            }
        } else {
            String acdId = request.getParameter("acdId");
            
            
            ResultSet prios = db.getData(XMLDataModel.APPLICATION_PRIO_INST_TABLENAME, "*", " AC_INST_ID=" + acdId);
            while (prios.next()) {
                out.print(prios.getString("INST_NAME") + "__" + prios.getString("TIME") + ";");
            }
        }
    } else {
        ResultSet servercData = db.getData(XMLDataModel.ACD2LS_LIST_TABLENAME, "*", " MODEL_ID=" + modelId + " AND LS_ID<>'0'");

    //out.print(db.ErrorMsg);
        while (servercData.next()) {
            String[] serverRow = db.getRowNocon(XMLDataModel.application_component_desc_TABLENAME, "ID=" + servercData.getString("ACD_ID"));

            printData += servercData.getString("ID") + "__" + serverRow[2] + ";";

        }
    }
    db.closeCon();
    out.print(printData);
%>