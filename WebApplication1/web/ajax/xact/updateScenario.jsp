<%@page import="lib.Options.XMLDataModel"%>
<%
xact.users.users us = new xact.users.users();
lib.engine.db.operations db = new lib.engine.db.operations();

  String status = request.getParameter("locked").trim();
    String model = request.getParameter("name").trim();
    String id = request.getParameter("sid");
     String comment = request.getParameter("description").trim();
     String locked="";
     if(status.equalsIgnoreCase("1")){
         locked="<@b'1'@>";
     }
     String[][]data={{"NAME","description","LOCKED"},
     {model,comment,locked}};
     out.print(locked);
     out.print(db.setUpdate(XMLDataModel.SCENARIO_TABLENAME, data, "id="+id));
    %>