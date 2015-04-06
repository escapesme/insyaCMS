<%@page import="lib.Options.XMLDataModel"%>
<%

    String id = request.getParameter("id");

    String data = "";
    lib.engine.db.operations db = new lib.engine.db.operations();
    data += db.setDelete(XMLDataModel.REPORT_TABLENAME, "r_id='" + id + "'");
    data += db.setDelete(XMLDataModel.REPORT_IMAGES_TABLENAME, "report_id='" + id + "'");
    data += db.setDelete(XMLDataModel.REPORT_DATA_TABLENAME, "report_id='" + id + "'");

%>

<%=  data%>