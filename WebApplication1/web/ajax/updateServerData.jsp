<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String ac_id = request.getParameter("aciId").trim();
    String app_id = request.getParameter("acId").trim();
    String batch = request.getParameter("batch").trim();
    String appCpu = request.getParameter("appCpu").trim();
    String appIo = request.getParameter("appIo").trim();
    String appDelay = request.getParameter("appDelay").trim();
    String appStreams = request.getParameter("mpl").trim();
    String sqlCpu = request.getParameter("sqlCpu").trim();
    String sqlIo = request.getParameter("sqlIo").trim();
    String sqlActive = request.getParameter("sqlActive").trim();
    String MEAN_AUX_DELAY = request.getParameter("MEAN_AUX_DELAY").trim();

    lib.engine.db.operations db = new lib.engine.db.operations();
    String[] data = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + ac_id);
    String printData = "";

    // + "&MEAN_AUX_DELAY=" + $(".MEAN_AUX_DELAY").val()
    String[][] mydata = {
        {"TOTAL_CPU", "MEAN_DASD_IO", "AVG_AUX_DELAY", "INST_MULTIPRO", "MEAN_AUX_DELAY"},
        {appCpu, appIo, appDelay, "" + appStreams, MEAN_AUX_DELAY}
    };
    printData += db.setUpdate(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, mydata, "ID=" + ac_id);
    String[][] myappdata = {
        {"PARALLELE_FACTOR", "CPU_FACTOR", "IO_FACTOR"},
        {appStreams, appCpu, appIo}
    };
    printData += db.setUpdate(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, myappdata, "ID=" + app_id);
        //out.print(Arrays.deepToString(data));

    String[][] myAcdData = {
        {"WORKLOAD_TYPE"},
        {batch}
    };
    printData += db.setUpdate(XMLDataModel.application_component_desc_TABLENAME, myAcdData, "ID=" + data[2]);
    String[][] mySqldata = {
        {"CPU_BEFORE", "IO_BEFORE", "ACTIVATION"},
        {sqlCpu, sqlIo, sqlActive}
    };
    printData += db.setUpdate(XMLDataModel.SQL_APPLICATION_INST_TABLENAME, mySqldata, "AC_INST_ID=" + ac_id);
    out.print(printData);


%>