<%-- 
    Document   : getSesstion
    Created on : Oct 11, 2012, 12:14:25 AM
    Author     : ismail
--%>
<%
    String type = request.getParameter("type");
    HttpSession s = request.getSession(true);
    out.print(s.getAttribute(type));
%>