<%-- 
    Document   : getSesstion
    Created on : Oct 11, 2012, 12:14:25 AM
    Author     : ismail
--%>
<%
    String type = request.getParameter("type");
    HttpSession s = request.getSession(true);

    String d = "";
    if (null == session.getAttribute(type)) {
        d = "false";
    } else {
        d = "true";
    }

out.print(d);
%>