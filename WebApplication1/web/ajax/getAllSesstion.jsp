<%-- 
    Document   : getAllSesstion
    Created on : Oct 11, 2012, 12:45:58 AM
    Author     : ismail
--%>

<%@page import="java.util.Enumeration"%>
<%
Enumeration keys = session.getAttributeNames();
while (keys.hasMoreElements())
{
  String key = (String)keys.nextElement();
  out.println(key + ": " + session.getValue(key) + "<br>");
}

%>