<%@page import="lib.Options.XMLDataModel"%>
<%
lib.engine.db.operations db=new lib.engine.db.operations();

String table=request.getParameter("table");
String tableid=request.getParameter("id");
String filed=request.getParameter("filed");

if ( XMLDataModel.STATUS=="upper") {table=table.toUpperCase();}else{table=table.toLowerCase();}   

if (filed==null){
    
    filed="id";
    
}

String fff=db.setDelete(table, filed+"='"+tableid+"'");

out.print(filed+"='"+tableid+"'");
        

%>