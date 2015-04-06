<%@page import="lib.Options.XMLDataModel"%>
<%
xact.users.users us = new xact.users.users();
lib.engine.db.operations db = new lib.engine.db.operations();
    String status = request.getParameter("locked").trim();
    String model = request.getParameter("modelName");
    String id = request.getParameter("id");
     String comment = request.getParameter("comment");
     String locked="";
     if(status.equalsIgnoreCase("1")){
         locked="<@b'1'@>";
     }
     String[][]data={{"MODEL_NAME","COMMENT","STATUS"},
     {model,comment,locked}};
     out.print(locked);
     out.print(db.setUpdate(XMLDataModel.MODEL_TABLENAME, data, "id="+id));
    %>