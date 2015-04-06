<%@page import="xact.users.users"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    xact.users.passwrodschang p = new xact.users.passwrodschang();
    users us = new users();
    String returnData = "";
    //  out.print(request.getParameter("oldpass"));
    if (request.getParameter("oldpass") != null && request.getParameter("oldpass") != "null") {

        returnData = p.checkOldPassword(request, request.getParameter("oldpass"));
        session.setAttribute("userNameForChange", us.userReturn(request, "username"));
    } else if (request.getParameter("newpass") != null && request.getParameter("newpass") != "null") {
        returnData = p.changePassword(request, request.getParameter("newpass"));
    }
    out.print(returnData);


%>