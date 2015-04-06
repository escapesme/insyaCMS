<%-- 
    Document   : deletBaseSql
    Created on : Jun 19, 2013, 1:33:20 PM
    Author     : Ahmed
--%>
<%@page import="lib.Options.XMLDataModel"%>
<%

 lib.engine.db.operations db = new lib.engine.db.operations();
 String ids=request.getParameter("id");
 String descId=ids.split("__")[0];
 String instId=ids.split("__")[1];
 out.print(db.setDelete(XMLDataModel.BASE_SQL_DESC_TABLENAME, "ID="+instId));
 out.print("<br>"+db.setDelete(XMLDataModel.BASE_SQL_INST_TABLENAME, "ID="+descId));


%>
