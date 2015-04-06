<%@page import="xact.ServerOperations"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    // String complexId = request.getParameter("complexId");
    String modelId = request.getParameter("modelId");
    String serverId = request.getParameter("serverId");
    ServerOperations so = new ServerOperations();
    String status = "";
    if (request.getParameter("status") != null) {
        status = request.getParameter("status");
    }
    String printData = "";
    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();

    if (status.equals("save")) {

        String servers = request.getParameter("serversData");

        String[] totalServers = servers.split(",");

        for (int i = 0; i < totalServers.length; i++) {

            String newId = Utils.getNewID();

            String lsId = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId)[1];

            String data[] = {newId, modelId, totalServers[i], lsId};
            String[][] xrefData = {
                {"ID", "MODEL_ID", "ACD_ID", "LS_ID"},
                data};
            out.print(db.setInsertNocon(XMLDataModel.ACD2LS_LIST_TABLENAME, xrefData));
            out.print(Arrays.deepToString(data));

        }

    } else if (status.equals("create")) {

        boolean done = false;
        String server = request.getParameter("servers");
        String priorities = request.getParameter("tdata");
        String acdId = Utils.getNewID();
        String catalogIndex = "0";

        String[] servers = server.split(",");

        String[] prios = priorities.split(";");

        for (String d : prios) {

            String[] priosData = d.split("__");

            String prioName = priosData[0];
            String prioID = Utils.getNewID();
            String prioNum = "";

            if (prioName.startsWith("f")) {
                int second = 0;
                int first = Integer.parseInt("" + prioName.charAt(1));
                try {
                    second = Integer.parseInt("" + prioName.charAt(2));
                } catch (StringIndexOutOfBoundsException e) {

                }
                int total = 2 * (10 * first + second) + 1;
                prioNum = "" + total;
            } else if (prioName.startsWith("m")) {
                int first = Integer.parseInt("" + prioName.charAt(1));

                int total = 20 * first;
                prioNum = "" + total;
            } else {
                prioNum = prioName;
                catalogIndex = "1";
            }
            String[][] prioRowData = {
                {"ID", "MODEL_ID", "Name", "AC_ID", "TIME", "LEVEL_NUM"},
                {prioID, modelId, prioName, acdId, priosData[1], prioNum}};
            out.print(db.setInsertNocon(XMLDataModel.APPLICATION_PRIO_TABLENAME, prioRowData));

        }

        String name = request.getParameter("name");
        String newAcdFactor = request.getParameter("newAcdFactor");
        String newAcdIo = request.getParameter("newAcdIo");
        String newAcdLoad = request.getParameter("newAcdLoad");
        String newAcdTerminals = request.getParameter("newAcdTerminals");
        String virtual = request.getParameter("newAcdVertual");

        //&modelId=1394233179467&serverId=1401274790204&acdId=undefined&status=create&name=dfgdfgdg&newAcdFactor=0&newAcdIo=0&newAcdLoad=0&newAcdTerminals=1&newAcdVertual=0&servers=1401274790204,
        String[] values = {acdId, modelId, name, newAcdFactor, newAcdIo, newAcdLoad, newAcdTerminals, virtual, "0", catalogIndex};
        String[][] acdData = {
            {"ID", "MODEL_ID", "NAME", "CPU_FACTOR", "IO_FACTOR", "WORKLOAD_TYPE", "NUM_TERMINAL", "VIRTUAL", "MPL", "CATALOG"},
            values};
        out.print(db.setInsertNocon(XMLDataModel.application_component_desc_TABLENAME, acdData));


         
        out.print(Arrays.deepToString(values));

        for (int i = 0; i < servers.length; i++) {

            String newId = Utils.getNewID();
            String serverID = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "id=" + servers[i])[1];
            String data[] = {newId, modelId, acdId, serverID};
            if (servers[i].equals(serverID)) {
                done = true;
            }
            String[][] xrefData = {
                {"ID", "MODEL_ID", "ACD_ID", "LS_ID"},
                data};
            out.print(db.setInsertNocon(XMLDataModel.ACD2LS_LIST_TABLENAME, xrefData));

        }

        if (done) {
            String newId = Utils.getNewID();

            String data[] = {newId, modelId, acdId, "0"};
            String[][] xrefData = {
                {"ID", "MODEL_ID", "ACD_ID", "LS_ID"},
                data};
            out.print(db.setInsertNocon(XMLDataModel.ACD2LS_LIST_TABLENAME, xrefData));
        }

    } else if (status.equals("edit")) {

        String priorities = request.getParameter("tdata");
        String acdId = request.getParameter("acdId");

        String[] prios = priorities.split(";");
        out.print(db.setDeleteNocon(XMLDataModel.APPLICATION_PRIO_TABLENAME, "AC_ID=" + acdId));
        for (String d : prios) {
            String[] priosData = d.split("__");
            String prioName = priosData[0];
            String prioID = Utils.getNewID();
            String prioNum = "";

            if (prioName.startsWith("f")) {
                int second = 0;
                int first = Integer.parseInt("" + prioName.charAt(1));
                try {
                    second = Integer.parseInt("" + prioName.charAt(2));
                } catch (StringIndexOutOfBoundsException e) {

                }
                int total = 2 * (10 * first + second) + 1;
                prioNum = "" + total;
            } else if (prioName.startsWith("m")) {
                int first = Integer.parseInt("" + prioName.charAt(1));

                int total = 20 * first;
                prioNum = "" + total;
            } else {
                prioNum = prioName;
            }
            String[][] prioRowData = {
                {"ID", "MODEL_ID", "Name", "AC_ID", "TIME", "LEVEL_NUM"},
                {prioID, modelId, prioName, acdId, priosData[1], prioNum}};
            out.print(db.setInsertNocon(XMLDataModel.APPLICATION_PRIO_TABLENAME, prioRowData));

        }
        String name = request.getParameter("name");
        String[][] acdData = {
            {"NAME"},
            {name}};
        out.print(db.setUpdateNocon(XMLDataModel.application_component_desc_TABLENAME, acdData, "ID=" + acdId));

    } else if (status.equals("editInst")) {

        String priorities = request.getParameter("tdata");
        String acdId = request.getParameter("acdId");

        String[] prios = priorities.split(";");
        out.print(db.setDeleteNocon(XMLDataModel.APPLICATION_PRIO_INST_TABLENAME, "AC_INST_ID=" + acdId));
        for (String d : prios) {
            String[] priosData = d.split("__");
            String prioName = priosData[0].toUpperCase();
            String prioID = Utils.getNewID();
            String prioNum = "";

            if (prioName.startsWith("F")) {
                int second = 0;
                int first = Integer.parseInt("" + prioName.charAt(1));
                try {
                    second = Integer.parseInt("" + prioName.charAt(2));
                } catch (StringIndexOutOfBoundsException e) {

                }
                int total = 2 * (10 * first + second) + 1;
                prioNum = "" + total;
            } else if (prioName.startsWith("M")) {
                int first = Integer.parseInt("" + prioName.charAt(1));

                int total = 20 * first;
                prioNum = "" + total;
            } else {
                prioNum = prioName;
            }
            String[][] prioRowData = {
                {"ID", "MODEL_ID", "INST_NAME", "AC_INST_ID", "TIME", "LEVEL_NUM", "APPLICATION_PRIO_ID"},
                {prioID, modelId, prioName, acdId, priosData[1], prioNum, "1"}};
            out.print(db.setInsertNocon(XMLDataModel.APPLICATION_PRIO_INST_TABLENAME, prioRowData));

        }

    } else if (status.equals("availableAcds")) {

        db.openCon();
        String lsId = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId)[1];

        ResultSet servercData = db.getData(XMLDataModel.ACD2LS_LIST_TABLENAME, "", " MODEL_ID='" + modelId + "' AND LS_ID <>" + lsId);

        while (servercData.next()) {
            String[] serverRow = db.getRowNocon(XMLDataModel.application_component_desc_TABLENAME, "ID=" + servercData.getString("ACD_ID"));

            Map<String, String> data = so.getACDList(modelId, serverId);

            if (!data.containsValue(serverRow[2])) {
                printData += "<option value='" + serverRow[0] + "'>" + serverRow[2] + "</option>";
            }
        }
        db.closeCon();
        out.print(printData);

    } else if (status.equals("logicalServersCompelx")) {

        db.openCon();

        Map<String, String> data = so.getACDList(modelId, serverId);

        for (String k : data.keySet()) {

            printData += "<option value='" + k + "'>" + data.get(k) + "</option>";
        }
        db.closeCon();
        out.print(printData);

    } else if (status.equals("delete")) {

        String servers = request.getParameter("serversData");
        String lsId = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId)[1];
        String[] totalServers = servers.split(",");

        for (int i = 0; i < totalServers.length; i++) {
            out.print("ACD_ID=" + totalServers[i] + " AND LS_ID=" + lsId);
            out.print(db.setDeleteNocon(XMLDataModel.ACD2LS_LIST_TABLENAME, "ACD_ID=" + totalServers[i] + " AND LS_ID=" + lsId));

        }

    }
%>
