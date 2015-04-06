<%-- 
    Document   : usres
    Created on : Apr 21, 2013, 5:05:23 PM
    Author     : ismil
--%>
<%@page import="xact.users.users"%>
<%
    users u = new users();
    String myEmail = u.userReturn(request, "email");

    if (myEmail.trim().equalsIgnoreCase("") || myEmail.trim().equalsIgnoreCase("null") || myEmail == null) {
        out.print("x");
    }
%>

