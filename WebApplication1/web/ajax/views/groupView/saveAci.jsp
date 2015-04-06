<%-- 
    Document   : saveAci
    Created on : Sep 23, 2013, 11:26:34 AM
    Author     : Ahmed
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%

    String mid = request.getParameter("mid");
    //out.print(request.getParameter("allLogicalServers"));
    String lsid = request.getParameter("allLogicalServers").trim();
    String acdid = request.getParameter("acds").trim();
    String instName = request.getParameter("instName").trim();
    String multiPro = request.getParameter("multiPro").trim();
    String arrivalRate = request.getParameter("arrivalRate").trim();
    String totalCPU = request.getParameter("totlaCPU").trim();
    String dasdIo = request.getParameter("dasdIo").trim();
    String auxDelayMean = request.getParameter("auxDelayMean").trim();
    String auxDelayAvg = request.getParameter("auxDelayAvg").trim();
    String dgrp = request.getParameter("dgrp").trim();
    String MEAN_IO = request.getParameter("MEAN_IO").trim();
    String MEAN_LOG_REQ = request.getParameter("MEAN_LOG_REQ").trim();
    String failDelay = request.getParameter("failDelay").trim();
    String TEMP = request.getParameter("TEMP").trim();
    String logicaldrive = request.getParameter("logicaldrive").trim();
    String nod_id = request.getParameter("nod_id").trim();

    String Distance = request.getParameter("Distance").trim();
    lib.engine.db.operations db = new lib.engine.db.operations();

    int dlCnt = db.getRowCount(XMLDataModel.DISK_PROXY_TABLENAME, "LOGICAL_DRIVE_INST_ID=" + logicaldrive);
    BigDecimal trfr = new BigDecimal("100").divide(new BigDecimal(dlCnt), 18, RoundingMode.DOWN);
    BigDecimal dftBlk = new BigDecimal(4.0).setScale(18, RoundingMode.DOWN);
    BigDecimal two = new BigDecimal(2.0).setScale(18, RoundingMode.DOWN);
    BigDecimal avgSt = BigDecimal.ONE;
    BigDecimal rf = new BigDecimal("0.7").setScale(18, RoundingMode.DOWN);
    BigDecimal rh = new BigDecimal("0.98").setScale(18, RoundingMode.DOWN);
    String id = Utils.getNewID();

    int rows = db.getRowCount(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "LOGICAL_SERVER_INST_ID=" + lsid + " AND INST_NAME='" + instName + "'");

    String[] logicaldriveData = db.getRow(XMLDataModel.LOGICAL_DRIVE_INST_TABLENAME, "id='" + logicaldrive + "'");

    String APPLICATION_COMPONENT_ID = Utils.getNewID();

       
    if (rows < 1) {
        String[][] data = {
            {"ID", "MODEL_ID", "ACD_ID", "AC_ID", "LOGICAL_SERVER_INST_ID", "DISK_VOL_ID", "INST_NAME", "INST_MULTIPRO", "ARRIVAL_RATE", "TOTAL_CPU", "MEAN_DASD_IO", "MEAN_AUX_DELAY", "AVG_AUX_DELAY", "MEAN_EXT_STORAGE", "AVG_PAGE_XFER", "PGRP_OVERLAP", "DGRP_OVERLAP", "MEAN_IO", "MEAN_LOCK_REQ", "TEMP", "DISTANCE", "FAILOVER_DELAY", "ACTIVE_STATUS", "NUM_TERMINAL"},
            {id, mid, acdid, APPLICATION_COMPONENT_ID, lsid, logicaldriveData[3], instName, multiPro, arrivalRate, totalCPU, dasdIo, auxDelayMean, auxDelayAvg, "0", "0", "0", dgrp, MEAN_IO, MEAN_LOG_REQ, TEMP, Distance, failDelay, "1", "100"}
        };
        db.setInsert(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, data);

        db.openCon();

//////// APPLICATION_COMPONENT_TABLENAME SAve
        String[] APPLICATION_COMPONENT_INST_DATA = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + lsid);

        String[] COMPLEX_INST_Data = db.getRowNocon(XMLDataModel.COMPLEX_INST_TABLENAME, "ID=" + APPLICATION_COMPONENT_INST_DATA[2]);
        
        
        
        

        String[] LOGICAL_SERVER_DATA = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + APPLICATION_COMPONENT_INST_DATA[1]);

        String[] ACDAta = db.getRowNocon(XMLDataModel.application_component_desc_TABLENAME, "id='" + acdid + "'");

        String[][] datac = {
            {"ID", "MODEL_ID", "COMPLEX", "CPU_FACTOR", "IO_FACTOR", "NODE_ID", "NAME", "PARALLELE_FACTOR",  "VIRTUAL", "WORKLOAD_TYPE", "NB_INTERRUPT", "AVG_INTERRUPT_TIME", "FAILOVER", "FAILOVER_ID", "COMPONENT_NAME", "NUM_TERMINAL", "OS_INSTANCE_NAME"},
            {APPLICATION_COMPONENT_ID, mid, COMPLEX_INST_Data[3], totalCPU, dasdIo, nod_id, instName, multiPro,  ACDAta[7], ACDAta[5], "0", "0", "0", "0", "NULL", "100", LOGICAL_SERVER_DATA[2]}
        };
        db.setInsertNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, datac);

        

        

        //////// APPLICATION_COMPONENT_TABLENAME SAve
        ResultSet diskProxy = db.getData(XMLDataModel.DISK_PROXY_TABLENAME, "*", "LOGICAL_DRIVE_INST_ID=" + logicaldrive);

        while (diskProxy.next()) {
            String linkid = Utils.getNewID();
            String[] diskGroupData = db.getRowNocon(XMLDataModel.DISK_GROUP_INST_TABLENAME, "id='" + diskProxy.getString("DISK_GROUP_INST_ID") + "'");
            String[][] appDisk = {
                {"ID", "MODEL_ID", "AC_INST_ID", "DISK_GROUP_INST_ID", "TRAFFIC_FRACTION", "BLOCK_LENGTH", "XFER_TIME2", "AVG_SEEK_TIME", "MEAN_LATENCY", "CACHED_FRACTION", "READ_FRACTION", "READ_HITS", "WRITE_HITS"},
                {linkid, mid, id, diskGroupData[0], trfr.toPlainString(), dftBlk.toPlainString(), two.multiply(dftBlk).multiply(dftBlk).toPlainString(), avgSt.toPlainString(), two.multiply(avgSt).multiply(avgSt).setScale(18, RoundingMode.DOWN).toPlainString(), "1", rf.toPlainString(), rf.toPlainString(), "1"}
            };
            db.setInsertNocon(XMLDataModel.APP_DISK_GROUP_INST_TABLENAME, appDisk);
        }
        ResultSet prios = db.getData(XMLDataModel.APPLICATION_PRIO_TABLENAME, "*", "AC_ID=" + acdid);
        while (prios.next()) {
            String instId = Utils.getNewID();
            String[][] prioInstData = {
                {"ID", "APPLICATION_PRIO_ID", "AC_INST_ID", "MODEL_ID", "INST_NAME", "LEVEL_NUM", "TIME"},
                {instId, prios.getString("ID"), id, mid, prios.getString("NAME"), prios.getString("LEVEL_NUM"), prios.getString("TIME")}
            };
            db.setInsertNocon(XMLDataModel.APPLICATION_PRIO_INST_TABLENAME, prioInstData);
        }

        db.closeCon();
        out.print("0_" + id);
    } else {
        out.print("1_");
    }

%>