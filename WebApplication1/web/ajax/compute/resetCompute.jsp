<%-- 
    Document   : resetCompute
    Created on : Aug 5, 2014, 12:56:49 PM
    Author     : ahmed
--%>

<%@page import="lib.Options.XMLDataModel"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openConres();
    String id = request.getParameter("id");
     String[][] data = {{"status"},
                {"2"}};
             db.setUpdateNocon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, data, "id=" + id);
             db.closeCon();
%>
