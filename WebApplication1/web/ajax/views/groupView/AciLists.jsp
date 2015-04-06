<%-- 
    Document   : AciLists
    Created on : Jul 29, 2013, 1:57:32 PM
    Author     : Ahmed
--%>

<%@page import="xact.ServerNodeOperations"%>
<%
String mid=request.getParameter("mid");
String status=request.getParameter("status");
ServerNodeOperations sno=new ServerNodeOperations();
  if(status.equalsIgnoreCase("groups")){
      
  }else if(status.equalsIgnoreCase("groups")){
      out.print(sno.getNodeListNoMDL(mid, "1"));
      
  }else if(status.equalsIgnoreCase("nodes")){
      out.print(sno.getNodeListNoMDL(mid, "1"));
  }else if(status.equalsIgnoreCase("complex")){
      out.print(sno.getNodeListNoMDL(mid, "1"));
  }else if(status.equalsIgnoreCase("servers")){
      out.print(sno.getNodeListNoMDL(mid, "1"));
  }else if(status.equalsIgnoreCase("aci")){
      out.print(sno.getNodeListNoMDL(mid, "1"));
  }
   
%>

