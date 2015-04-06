<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Arrays"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();
    ;
    String value=request.getParameter("status");
    String id=request.getParameter("id");
String output=db.getValue(XMLDataModel.MODEL_TABLENAME, value.toUpperCase(), "ID="+id);
out.print(output);
    
%>