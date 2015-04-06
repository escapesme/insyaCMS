 
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();

    String id = request.getParameter("id");
    out.print(db.setDelete(XMLDataModel.NET_GROUP_TABLENAME, "ID='" + id + "'"));
%>                   