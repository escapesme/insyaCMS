<%-- 
    Document   : getNodeList
    Created on : Jul 7, 2013, 11:12:39 AM
    Author     : Ahmed
--%>

<%@page import="xact.ServerNodeOperations"%>
<%
    String mid = request.getParameter("mid").trim();
    String type = request.getParameter("type");
    String status = request.getParameter("status");
    ServerNodeOperations sno = new ServerNodeOperations();
    if (status != null) {
        if (status.equalsIgnoreCase("groups")) {
            out.print(sno.getGroups(mid));
        } else if (status.equalsIgnoreCase("servers")) {
            String groupid = request.getParameter("groupid");
            out.print(sno.getServeses(mid, groupid));

        } else if (status.equalsIgnoreCase("allServers")) {

            out.print(sno.getAlllogicalServers(mid));

        } else if (status.equalsIgnoreCase("complex")) {
            String serversid = request.getParameter("serversid");
            out.print(sno.getComplex(mid, serversid));

        } else if (status.equalsIgnoreCase("logical_servers")) {
            String complexid = request.getParameter("complexid");
            out.print(sno.getlogical_servers(mid, complexid));

        } else if (status.equalsIgnoreCase("ACIs")) {
            String logical_serversid = request.getParameter("logical_serversid");
            out.print(sno.getACIs(mid, logical_serversid));
        } else if (status.equalsIgnoreCase("getACD")) {
            String logical_serversid = request.getParameter("lsiId");
            out.print(sno.getACDs(mid, logical_serversid));

        }
    } else {
        out.print(sno.getNodeListNoMDL(mid, type));
    }


%>
