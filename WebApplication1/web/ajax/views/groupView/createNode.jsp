<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.impl.logging.UtilSystemException"%>
<%@page import="xact.MDLOperations"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String sataus = (String) request.getParameter("status");

    lib.engine.db.operations db = new lib.engine.db.operations();

    if (request.getParameter("updateLine") == null && request.getParameter("updateNode") == null
            && request.getParameter("deleteNode") == null
            && request.getParameter("addJLine") == null
            && request.getParameter("deleteLine") == null) {

        String[] groupData = null;
        String GROUP_ID = "";
        String MODEL_ID = "";

        if (request.getParameter("GROUP_ID") != null) {

            GROUP_ID = request.getParameter("GROUP_ID");

            groupData = db.getRow(XMLDataModel.NET_GROUP_TABLENAME, "`ID`=" + GROUP_ID);

            MODEL_ID = groupData[1];
        }

        String NAME = request.getParameter("name");
        String HOSTNAME = groupData[3] + "_" + NAME;
        String REPETITION = "1";

        String REFERENCE = "0";
        if (request.getParameter("active") != null) {
            REFERENCE = request.getParameter("active");
        }

        String nodeid = Utils.getNewID();

        String RESPONSE_TIME = "0";
        String SERVICE_TIME = "0";
        String MODEL_FILENAME = "";

        if (sataus.equalsIgnoreCase("server") || sataus.equalsIgnoreCase("storage")) {
            RESPONSE_TIME = request.getParameter("responseTime");
            MODEL_FILENAME = request.getParameter("platform");
            REPETITION = request.getParameter("Repetition");

        } else if (sataus.equalsIgnoreCase("human")) {

            SERVICE_TIME = request.getParameter("serviceTime");
            MODEL_FILENAME = request.getParameter("modelFile");
            REPETITION = request.getParameter("Repetition");

        } else if (sataus.equalsIgnoreCase("equipment")) {
            REPETITION = request.getParameter("Repetition");
            MODEL_FILENAME = "MECA";
            SERVICE_TIME = request.getParameter("serviceTime");
        } else if (sataus.equalsIgnoreCase("vehicle")) {
            REPETITION = request.getParameter("Repetition");
            MODEL_FILENAME = "VEHI";
            SERVICE_TIME = request.getParameter("serviceTime");

        } else if (sataus.equalsIgnoreCase("router") || sataus.equalsIgnoreCase("ROUTER")) {
            RESPONSE_TIME = request.getParameter("responseTime");
            MODEL_FILENAME = request.getParameter("platform");

        } else if (sataus.equalsIgnoreCase("switch") || sataus.equalsIgnoreCase("terminal")) {

            if (sataus.equalsIgnoreCase("terminal")) {
                String ttype = request.getParameter("status");

                if (!ttype.equalsIgnoreCase("default")) {
                    sataus = ttype;
                }
            }

            RESPONSE_TIME = request.getParameter("responseTime");
        }
        if (REPETITION == null) {
            REPETITION = "1";
        }

        String[][] data = {
            {"ID", "MODEL_ID", "HOSTNAME", "MODEL_FILENAME", "GROUP_ID", "NAME", "REPETITION", "TYPE", "REFERENCE", "X", "Y", "RESPONSE_TIME", "SERVICE_TIME"},
            {nodeid, MODEL_ID, HOSTNAME, MODEL_FILENAME, GROUP_ID, NAME, REPETITION, sataus.trim().toUpperCase(), REFERENCE, "0", "0", RESPONSE_TIME, SERVICE_TIME}
        };

        out.print(db.setInsert(XMLDataModel.NODE_TABLENAME, data));

        if (!sataus.equalsIgnoreCase("server")) {
            MDLOperations mdlo = new MDLOperations();
            String proId = db.getRow(XMLDataModel.PMXREF_TABLENAME, "mid=" + MODEL_ID)[1];

            //  out.print(nodeid + ";" + MODEL_ID + ";" + proId);
            mdlo.importMDL(proId, MODEL_ID, nodeid, MODEL_FILENAME.trim());

            if (sataus.equalsIgnoreCase("storage")) {
                String newId = Utils.getNewID();
                String[] serverInstdata = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + nodeid);
                String[][] driveData = {{"ID", "Model_ID", "SERVER_INST_ID", "NAME"}, {newId, MODEL_ID, serverInstdata[0], "ALL_DRIVE"}};

                out.print(db.setInsert(XMLDataModel.LOGICAL_DRIVE_INST_TABLENAME, driveData));
                db.openCon();
                ResultSet diskSub = db.getData(XMLDataModel.LOGICAL_DISK_SUBSYSTEM_INST_TABLENAME, "*", "server_inst_id=" + serverInstdata[0]);

                while (diskSub.next()) {
                    ResultSet diskString = db.getData(XMLDataModel.DISK_STRING_INST_TABLENAME, "*", "lds_id=" + diskSub.getString("ID"));
                    while (diskString.next()) {

                        ResultSet diskGroup = db.getData(XMLDataModel.DISK_GROUP_INST_TABLENAME, "*", "DISK_STRING_INST_ID=" + diskString.getString("ID"));
                        while (diskGroup.next()) {
                            String newProxyId = Utils.getNewID();
                            String[][] proxydata = {{"ID", "Model_ID", "LOGICAL_DRIVE_INST_ID", "DISK_GROUP_INST_ID"}, {newProxyId, MODEL_ID, newId, diskGroup.getString("ID")}};

                            out.print(db.setInsertNocon(XMLDataModel.DISK_PROXY_TABLENAME, proxydata));

                        }
                    }
                }
                db.closeCon();
            }

        }

        if (request.getParameter("addLine") != null) {

            String id = Utils.getNewID();
            String ERROR_RATE = request.getParameter("errorRate");
            String LENGTH = request.getParameter("length");
            String PROTOCOL = request.getParameter("protocol");
            String REFERENCEline = request.getParameter("errorRate");
            String THROUGHPUT = request.getParameter("throughbut");
            String OVERHEAD = request.getParameter("overhead");
            String NODE_ID1 = request.getParameter("parent").split("/")[1];

            String wirelessVal = request.getParameter("wireless");

            String[][] dataline = {
                {"ID", "MODEL_ID", "ERROR_RATE", "LENGTH", "NODE_ID1", "NODE_ID2", "PROTOCOL", "REFERENCE", "THROUGHPUT", "OVERHEAD", "WIRELESS"},
                {id, MODEL_ID, ERROR_RATE, LENGTH, NODE_ID1, nodeid, PROTOCOL, REFERENCEline, THROUGHPUT, OVERHEAD, wirelessVal}
            };

            out.print(db.setInsert(XMLDataModel.LINE_TABLENAME, dataline));

        }

    } else if (request.getParameter("updateLine") != null) {

        String id = request.getParameter("ID");

        String ERROR_RATE = request.getParameter("errorRate");
        String LENGTH = request.getParameter("length");
        String PROTOCOL = request.getParameter("protocol");
        String REFERENCEuLine = request.getParameter("active");
        String THROUGHPUT = request.getParameter("throughbut");
        String OVERHEAD = request.getParameter("overhead");

        String wireless = request.getParameter("wireless").trim();
        String wirelessVal = "0";

        if (wireless != null) {
            if (wireless.equalsIgnoreCase("1")) {
                wirelessVal = "1";
            }
        }
        out.print(wireless + "__" + wirelessVal);
        String[][] datauline = {
            {"ERROR_RATE", "LENGTH", "PROTOCOL", "REFERENCE", "THROUGHPUT", "OVERHEAD", "WIRELESS"},
            {ERROR_RATE, LENGTH, PROTOCOL, REFERENCEuLine, THROUGHPUT, OVERHEAD, wirelessVal}
        };

        out.print(db.setUpdate(XMLDataModel.LINE_TABLENAME, datauline, "ID=" + id));

    } else if (request.getParameter("updateNode") != null) {
        String overWrite = "";
        String id = request.getParameter("id");
        String[] NodeData = db.getRow(XMLDataModel.NODE_TABLENAME, "`ID`=" + id);
        String NAME = request.getParameter("name");
        String HOSTNAME = NodeData[2].split("_")[0] + "_" + NAME;
        String REPETITION = "1";
        String REFERENCE = "0";
        if (request.getParameter("active") != null) {
            REFERENCE = request.getParameter("active");
        }
        String status = request.getParameter("status");
        String RESPONSE_TIME = "0";
        String SERVICE_TIME = "0";
        String MODEL_FILENAME = "";
        if (sataus.equalsIgnoreCase("server") || sataus.equalsIgnoreCase("storage")) {
            RESPONSE_TIME = request.getParameter("responseTime");
            MODEL_FILENAME = request.getParameter("platform");
            REPETITION = request.getParameter("Repetition");
            overWrite = request.getParameter("overwrite");
        } else if (sataus.equalsIgnoreCase("human")) {
            SERVICE_TIME = request.getParameter("serviceTime");
            MODEL_FILENAME = request.getParameter("modelFile");
            REPETITION = request.getParameter("Repetition");
            overWrite = request.getParameter("overwrite");
        } else if (sataus.equalsIgnoreCase("equipment")) {
            REPETITION = request.getParameter("Repetition");
            MODEL_FILENAME = "MECA";
            SERVICE_TIME = request.getParameter("serviceTime");
            overWrite = request.getParameter("rewrite");
        } else if (sataus.equalsIgnoreCase("vehicle")) {
            MODEL_FILENAME = "VEHI";
            SERVICE_TIME = request.getParameter("serviceTime");
            overWrite = request.getParameter("overwrite");
            REPETITION = request.getParameter("Repetition");

        } else if (sataus.equalsIgnoreCase("router")) {
            RESPONSE_TIME = request.getParameter("responseTime");
            MODEL_FILENAME = request.getParameter("platform");

            overWrite = request.getParameter("overwrite");
        } else if (sataus.equalsIgnoreCase("terminal") || sataus.equalsIgnoreCase("POINT_OF_SALE") || sataus.equalsIgnoreCase("SMART_PHONE")) {

            REPETITION = request.getParameter("Repetition");
            RESPONSE_TIME = request.getParameter("responseTime");
//out.print(RESPONSE_TIME);
            overWrite = request.getParameter("overwrite");

        } else if (sataus.equalsIgnoreCase("switch")) {

            RESPONSE_TIME = request.getParameter("responseTime");
//out.print(RESPONSE_TIME);
            overWrite = request.getParameter("overwrite");

        }
        if (REPETITION == null) {
            REPETITION = "1";
        }
        out.print(MODEL_FILENAME);
        String[][] data2 = {
            {"HOSTNAME", "MODEL_FILENAME", "NAME", "REPETITION", "TYPE", "REFERENCE", "X", "Y", "RESPONSE_TIME", "SERVICE_TIME"},
            {HOSTNAME, MODEL_FILENAME, NAME, REPETITION, status.trim().toUpperCase(), REFERENCE, "0", "0", RESPONSE_TIME, SERVICE_TIME}
        };
//out.print(Arrays.deepToString(data2));

        out.print(db.setUpdate(XMLDataModel.NODE_TABLENAME, data2, "ID=" + id));
        if (!MODEL_FILENAME.equals("")) {
            if (overWrite.equalsIgnoreCase("1")) {

                int servers = db.getRowCount(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + id);
                String MODEL_ID = db.getRow(XMLDataModel.NODE_TABLENAME, "id=" + id)[1];
                String proId = db.getRow(XMLDataModel.PMXREF_TABLENAME, "mid=" + MODEL_ID)[1];
                MDLOperations mdlo = new MDLOperations();
                if (servers >= 1) {
                    for (int i = 0; i < servers; i++) {

                        mdlo.removeServer(proId, MODEL_ID, id);
                    }
                }

                out.print(mdlo.importMDL(proId, MODEL_ID, id, MODEL_FILENAME.trim()));

            }
        }

    } else if (request.getParameter("deleteLine") != null) {

        String id = request.getParameter("ID");

        out.print(db.setDelete(XMLDataModel.LINE_TABLENAME, "ID=" + id));

    } else if (request.getParameter("deleteNode") != null) {

        String myid = request.getParameter("ID");
        String[] ids = myid.split(",");
        for (String id : ids) {

            if (id != null && !id.equals("")) {
                out.print(db.setDelete(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NODE_ID=" + id));
                out.print(db.setDelete(XMLDataModel.LINE_TABLENAME, "NODE_ID2=" + id + " OR NODE_ID1=" + id));
                out.print(db.setDelete(XMLDataModel.NODE_TABLENAME, "ID=" + id));
            }
        }

    } else if (request.getParameter("addJLine") != null) {

        String[] groupData = null;
        String GROUP_ID = "";

        if (request.getParameter("GROUP_ID") != null) {

            //   out.print(request.getParameter("GROUP_ID"));
            GROUP_ID = request.getParameter("GROUP_ID");

            groupData = db.getRow(XMLDataModel.NET_GROUP_TABLENAME, "`ID`=" + GROUP_ID);

            //MODEL_ID = groupData[1];
        }

        String id = Utils.getNewID();
        String ERROR_RATE = request.getParameter("errorRate");
        String LENGTH = request.getParameter("length");
        String PROTOCOL = request.getParameter("protocol");
        String REFERENCEline = request.getParameter("errorRate");
        String THROUGHPUT = request.getParameter("throughbut");
        String OVERHEAD = request.getParameter("overhead");
        String NODE_ID1 = request.getParameter("parent").split("/")[1];
        String NODE_ID = request.getParameter("target").split("/")[1];
        String wirelessVal = request.getParameter("wireless");

        String MODEL_ID = request.getParameter("GROUP_ID");

        String[][] dataline = {
            {"ID", "MODEL_ID", "ERROR_RATE", "LENGTH", "NODE_ID1", "NODE_ID2", "PROTOCOL", "REFERENCE", "THROUGHPUT", "OVERHEAD", "WIRELESS"},
            {id, MODEL_ID, ERROR_RATE, LENGTH, NODE_ID1, NODE_ID, PROTOCOL, REFERENCEline, THROUGHPUT, OVERHEAD, wirelessVal}
        };

        out.print(db.setInsert(XMLDataModel.LINE_TABLENAME, dataline));
        out.print(id);

    }


%>
