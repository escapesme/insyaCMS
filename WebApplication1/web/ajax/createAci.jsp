<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String complexId = request.getParameter("complexId");
    String modelId = request.getParameter("modelId");
    String serverId = request.getParameter("serverId");
    String status = request.getParameter("status");
    String printData = "";
    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();
    out.print(serverId);
    if (status.equals("save")) {
        String servers = request.getParameter("serversData");
        String[] totalServers = servers.split(",");
        for (int i = 0; i < totalServers.length; i++) {
            String id = Utils.getNewID();
            String[] row = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "id=" + totalServers[i]);
            String[][] mydata = {
                {"ID", "LOGICAL_SERVER_ID", "COMPLEX_INST_ID", "MODEL_ID", "LOGICAL_PROCESSORS", "TOTAL_PRIO", "TIME_SLICE", "CPU_LIMIT", "CPU_QUANTUM"},
                {id, row[1], complexId, modelId, row[4], row[5], row[6], row[7], row[8]}
            };
            out.print(db.setInsertNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, mydata));
            ResultSet aci = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + totalServers[i]);
            while (aci.next()) {
                String[] aciRow = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "id=" + aci.getString("ID"));
                String aciId = Utils.getNewID();
                aciRow[0] = aciId;
                aciRow[4] = id;
                String[][] aciData = {
                    {"ID", "MODEL_ID", "ACD_ID", "AC_ID", "LOGICAL_SERVER_INST_ID", "DISK_VOL_ID", "INST_NAME", "INST_MULTIPRO", "ARRIVAL_RATE", "TOTAL_CPU", "MEAN_DASD_IO", "MEAN_AUX_DELAY", "AVG_AUX_DELAY", "MEAN_EXT_STORAGE", "AVG_PAGE_XFER", "PGRP_OVERLAP", "DGRP_OVERLAP", "MEAN_IO", "MEAN_LOCK_REQ", "TEMP", "DISTANCE", "FAILOVER_DELAY", "ACTIVE_STATUS", "NUM_TERMINAL"},
                    aciRow
                };
                out.print(db.setInsertNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, aciData));
            }
        }

    } else if (status.equalsIgnoreCase("delete")) {

        String myID = request.getParameter("id");
        String ACID = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "id=" + myID)[3];

        out.print(db.setDeleteNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "id=" + ACID));

        out.print(db.setDeleteNocon(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "AC_ID=" + ACID));

        out.print(db.setDeleteNocon(XMLDataModel.ACI2ACT_TABLENAME, "AC_INST_ID=" + myID));

        out.print(db.setDeleteNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "id=" + myID));

    }


%>