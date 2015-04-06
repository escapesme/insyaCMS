<%@page import="xact.MDLOperations"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.tools.Utils"%>
<%@page import="cat.read.Manufacturer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Processor"%>
<%@page import="cat.read.Catalog"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Arrays"%>
<%
    String comlexID = request.getParameter("com_di");
    String sataus = request.getParameter("status");
    String removeMdl = request.getParameter("removeMdl");
    String nodeData = request.getParameter("nodeData");
    lib.engine.db.operations db = new lib.engine.db.operations();
    MDLOperations mdlo = new MDLOperations();
    if (sataus.equals("delete")) {
        out.print(comlexID);
        if (removeMdl.equals("true")) {
            int servers = db.getRowCount(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + nodeData);
            String MODEL_ID = db.getRow(XMLDataModel.NODE_TABLENAME, "id=" + nodeData)[1];
            String proId = db.getRow(XMLDataModel.PMXREF_TABLENAME, "mid=" + MODEL_ID)[1];
            if (servers >= 1) {
                for (int i = 0; i < servers; i++) {
                    mdlo.removeServer(proId, MODEL_ID, nodeData);
                }
            }
        }
        db.setDelete(XMLDataModel.COMPLEX_INST_TABLENAME, "ID='" + comlexID + "'");
    }
%>
