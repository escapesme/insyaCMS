<%@page import="lib.Options.XMLDataModel"%>
<%
lib.engine.db.operations db=new lib.engine.db.operations();
String table=request.getParameter("table");



if ( XMLDataModel.STATUS=="upper") {table=table.toUpperCase();}else{table=table.toLowerCase();}   

String fff=db.setDelete(table, "pid="+request.getParameter("id"));



%>


<%= table +request.getParameter("id") +fff %>