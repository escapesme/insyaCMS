<%-- 
    Document   : insertSql
    Created on : Jun 16, 2013, 1:05:04 PM
    Author     : Ahmed
--%>
<%@page import="xact.DatabaseImport"%>
<%
 lib.engine.db.operations db = new lib.engine.db.operations();
 DatabaseImport dbimports=new DatabaseImport();
  String values = request.getParameter("values");
  String id=request.getParameter("id");
  String outData=dbimports.saveSqlData(values, id);
  out.print(values);


%>