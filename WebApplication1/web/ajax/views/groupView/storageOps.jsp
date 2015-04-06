<%-- 
    Document   : storageOps
    Created on : Mar 6, 2014, 1:05:24 PM
    Author     : Ahmed
--%>

<%@page import="xact.ServerNodeOperations"%>
<%

    String status = request.getParameter("type");
    lib.engine.db.operations db = new lib.engine.db.operations();
    String[] ids = request.getParameter("id").split(",");
    String myout = "";
    for (String id : ids) {

        if (id != null && !id.equals("")) {
            if (status.equalsIgnoreCase("diskDeletable")) {
                ServerNodeOperations sno = new ServerNodeOperations();
                myout += "," + sno.isDisksDeletable(id);
            } else if (status.equalsIgnoreCase("nodeType")) {
                ServerNodeOperations sno = new ServerNodeOperations();
                myout += "," + sno.getNodeType(id);
            } else if (status.equalsIgnoreCase("hasMDL")) {

            } else if (status.equalsIgnoreCase("hasStorage")) {
                ServerNodeOperations sno = new ServerNodeOperations();
                myout += "," + !sno.getConnectedStorageNode(id).equals("");
            }
        }
    }

    out.print(myout);


%>
