<%@page import="xact.DatabaseImport"%>
<%

String tableId=request.getParameter("table");
DatabaseImport db=new DatabaseImport();
out.print(db.getIndeces(tableId));

%>
