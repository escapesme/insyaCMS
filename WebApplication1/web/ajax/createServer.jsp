<%@page import="java.util.Arrays"%>
<%@page import="xact.ServerOperations"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String complexId = request.getParameter("complexId");
    String modelId = request.getParameter("modelId");
    String status = "";
    if (request.getParameter("status") != null) {
        status = request.getParameter("status");
    }
    String printData = "";
    ServerOperations so = new ServerOperations();
    db.openCon();

    if (status.equals("save")) {

        String firstAciId = "";
        String servers = request.getParameter("serversData");
        String[] totalServers = servers.split(",");
        for (int i = 0; i < totalServers.length; i++) {

            String id = so.addServer(totalServers[i], complexId, modelId, null, "");
            so.copyACI(totalServers[i], id);
        }

    } else if (status.equals("create")) {

        String serverId = Utils.getNewID();

        String acd = request.getParameter("acds");
        String[] acds = acd.split(",");
        String name = request.getParameter("name");
        String vm = request.getParameter("vm");
        String lp = request.getParameter("lp");
        String tp = request.getParameter("tp");
        String ts = request.getParameter("ts");
        String cpuLimit = request.getParameter("cpuLimit");
        String serverInstId = Utils.getNewID();
        String cpuQuantum = request.getParameter("cpuQuantum");

        String[][] serverData = {
            {"ID", "MODEL_ID", "NAME", "VM"},
            {serverId, modelId, name, vm
            }};
        out.print(db.setInsertNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, serverData));

        String[] addArray = {serverInstId, serverId, complexId, modelId, lp, tp, ts, cpuLimit, cpuQuantum};
        so.addServer(null, complexId, modelId, addArray, "create");

        for (int i = 0; i < acds.length; i++) {

            String newId = Utils.getNewID();
            String[][] xrefData = {
                {"ID", "MODEL_ID", "ACD_ID", "LS_ID"},
                {newId, modelId, acds[i], serverId
                }};
            out.print(db.setInsertNocon(XMLDataModel.ACD2LS_LIST_TABLENAME, xrefData));
        }

    } else if (status.equals("delete")) {

        db.openCon();
        String firstAciId = "";
        String servers = request.getParameter("serversData");
        String[] totalServers = servers.split(",");
        //out.print(totalServers.length);
        for (int i = 0; i < totalServers.length; i++) {

            so.delServer(totalServers[i]);

        }

        db.closeCon();

    } else if (status.equals("deleteimage")) {

        db.openCon();
        String firstAciId = "";
        String servers = request.getParameter("removed");
        String[] totalServers = servers.split(",");
        //out.print(totalServers.length);
        for (int i = 0; i < totalServers.length; i++) {

            so.delServerimage(totalServers[i]);

        }

        db.closeCon();

    } else if (status.equals("logicalServers")) {
        db.openCon();
        ArrayList<String> added = new ArrayList<String>();
        ResultSet servercData = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "", " MODEL_ID='" + modelId + "' AND COMPLEX_INST_ID <>" + complexId);
        Map<String, String> data = so.getComplexList(modelId, complexId);

        if (data != null) {
            while (servercData.next()) {

                String[] serverRow = db.getRow(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + servercData.getString("LOGICAL_SERVER_ID"));

                if (!data.containsValue(serverRow[2])) {
                    if (!added.contains(serverRow[2])) {

                        printData += "<option value='" + servercData.getString("ID") + "'>" + serverRow[2] + "</option>";
                        added.add(serverRow[2]);
                    }
                }
            }
        } else {

            while (servercData.next()) {

                String[] serverRow = db.getRow(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + servercData.getString("LOGICAL_SERVER_ID"));

                printData += "<option value='" + servercData.getString("ID") + "'>" + serverRow[2] + "</option>";

            }

        }
        db.closeCon();
        out.print(printData);

    } else if (status.equals("logicalServersCompelx")) {

        db.openCon();

        Map<String, String> data = so.getComplexList(modelId, complexId);
        if (data != null) {
            for (String k : data.keySet()) {

                printData += "<option value='" + k + "'>" + data.get(k) + "</option>";
            }
        }
        db.closeCon();
        out.print(printData);

    } ///////////////////////////////////////
    else if (status.equals("COMPLEX_INST_ID")) {

        db.openCon();
        ResultSet serversInsts = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "COMPLEX_INST_ID=" + complexId);
        String loptions = "";
        while (serversInsts.next()) {

            String[] datarln = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "id=" + serversInsts.getString("LOGICAL_SERVER_ID"));
            loptions += "<option value='" + serversInsts.getString("id") + "' >" + datarln[2] + "</option>";
        }
        db.closeCon();
        out.print(loptions);

    } else if (status.equals("LOGICAL_SERVER_INST_ID")) {

        String firstAciId = request.getParameter("firstAciId");
        db.openCon();
        ResultSet acInsts = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + firstAciId);
        String aciOptions = "";
        while (acInsts.next()) {

            aciOptions += "<option value='" + acInsts.getString("id") + "' >" + acInsts.getString("INST_NAME") + "</option>";
        }

        db.closeCon();

        out.print(printData);

    } else if (status.equals("getserverdata")) {

        String serversData = request.getParameter("serversData");
        String[] acInsts = db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "id=" + serversData);
        String serverName = db.getRow(XMLDataModel.LOGICAL_SERVER_TABLENAME, "id=" + acInsts[1])[2];
        acInsts[0] = serverName;
        acInsts[6] = Utils.numberFormat(Double.parseDouble(acInsts[6]), 2);

        acInsts[7] = Utils.numberFormat(Double.parseDouble(acInsts[7]), 2);
        acInsts[8] = Utils.numberFormat(Double.parseDouble(acInsts[8]), 2);

        out.print(Arrays.deepToString(acInsts));

    } else if (status.equals("updateserver")) {

        String serverId = request.getParameter("serverId[]");
        out.print(serverId);
        String lp = request.getParameter("lp");
        String tp = request.getParameter("tp");
        String ts = request.getParameter("ts");
        String cpuLimit = request.getParameter("cpuLimit");
        String serverInstId = Utils.getNewID();
        String cpuQuantum = request.getParameter("cpuQuantum");

        String[] addArray = {lp, tp, ts, cpuLimit, cpuQuantum};

        out.print(so.updateServer(addArray, serverId));

        /*
         String serversData = request.getParameter("serversData");
         String[] acInsts = db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "id=" + serversData);
         out.print(Arrays.deepToString(acInsts));*/
    }

%>


<%!
    lib.engine.db.operations db = new lib.engine.db.operations();


%>