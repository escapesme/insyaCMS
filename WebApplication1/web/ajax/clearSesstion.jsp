<%-- 
    Document   : clearSesstion
    Created on : Oct 11, 2012, 12:16:40 AM
    Author     : ismail
--%>
<%
    String type = request.getParameter("type");
    HttpSession s = request.getSession(true);
    s.setAttribute(type, "");
    s.removeAttribute(type);
    
    //boolean ff=true;
%>