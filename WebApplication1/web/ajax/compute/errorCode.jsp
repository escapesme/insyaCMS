<%-- 
    Document   : errorCode
    Created on : Jan 27, 2014, 10:52:17 AM
    Author     : Ahmed
--%>

<%@page import="lib.Options.XMLDataModel"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();
    
    //Compute Failed with Error Code:1005
    db.openConres();
    String computeId=request.getParameter("computeId");
    String msg=db.getValueNocon(XMLDataModel.COMPUTE_MSG_LOG_TABLENAME, "MSG_TEXT", "MSG_TEXT like '%Code:%' AND COMP_ID="+computeId);
    String code=msg.substring(msg.lastIndexOf(":")+1, msg.length()).trim();
    out.print(code);
    
    %>
