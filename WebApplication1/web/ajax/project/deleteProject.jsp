<%@page import="xact.DeleteModel"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();
    String id = request.getParameter("id");
    String status = request.getParameter("status");
    String mid = "";
    if(status.equalsIgnoreCase("project")){
    DeleteModel.deleteProject(id);
      }else{
        
       out.print(DeleteModel.delete(id));
      }
%>