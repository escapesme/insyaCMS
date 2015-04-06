<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<div style=" height:120px; overflow: auto"class="mydata"> 
    <%
        lib.engine.db.operations db = new lib.engine.db.operations();
        String[] ids = request.getParameter("id").split("/");


        String[] server = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + ids[1]);
        String[] complex = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "SERVER_INST_ID=" + server[0]);

        db.openCon();
        String data = "";
        ResultSet logicalServers = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "COMPLEX_INST_ID=" + complex[0]);
        while (logicalServers.next()) {
            ResultSet rs = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + logicalServers.getString("ID"));






            int num = 0;
            while (rs.next()) {
                num++;
                data += "<li class=\"scstyle\">" + rs.getString("inst_name") + "</li>";
            }
            if (num == 0) {
                data = "No component defined for this node";

            }
        }

        out.print(data);
        db.closeCon();

    %>

</div>

<style>

    .scstyle{
        color: #416AA3;
        font-family: helvetica,tahoma,verdana,sans-serif;
        font-size: 11px;
        font-weight: bold;
        width:100%;
        border:1px solid #eee;
        margin-top: 4px;
    }

</style>