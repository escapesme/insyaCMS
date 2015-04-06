<%@page import="java.text.NumberFormat"%>
<%@page import="lib.Options.DbInfo"%>
<%@page import="xact.ServerNodeOperations"%>
<%@page import="lib.tools.Utils"%>
<%@page import="org.directwebremoting.dwrp.ArrayOutboundVariable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Processor"%>
<%@page import="cat.read.Manufacturer"%>
<%@page import="cat.read.Catalog"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.results.resultes"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    // ServerNodeOperations s = new ServerNodeOperations();
    lib.engine.db.operations db = new lib.engine.db.operations();
    xact.utils u = new xact.utils();
    NumberFormat nf = NumberFormat.getInstance();

    String noid = request.getParameter("nod_id");
    //  String ids = request.getParameter("ids");
    String sid = request.getParameter("sid");
    String status = request.getParameter("status");

    String outData = "";
    if (status.equalsIgnoreCase("getCOMPLEX")) {
        db.openCon();

        String[] data = db.getRowNocon(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + noid);

        ResultSet datars = db.getData(XMLDataModel.COMPLEX_INST_TABLENAME, "*", "SERVER_INST_ID=" + data[0]);
        outData += "<option></option>";
        while (datars.next()) {

            outData += "<option value='" + datars.getString("id") + "'>" + datars.getString("NAME") + "</option>";

        }

        db.closeCon();

    } else if (status.equalsIgnoreCase("servercount")) {
        int rowCount = db.getRowCount(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID='" + noid + "'");

        outData = "" + rowCount;
    } else if (status.equalsIgnoreCase("gtenodeName")) {

        outData = "" + db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + noid)[2];

    } else if (status.equalsIgnoreCase("getcomlpexdata")) {
        String com_id = request.getParameter("com_id");
        String modID = request.getParameter("mod_id");;

        //get maxProcessors
        String[] htis_complex = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "id=" + com_id);

        outData += Arrays.deepToString(htis_complex);
        int maxProcessors = Integer.parseInt(htis_complex[14]);

        String[] data = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + noid);
        String catIndex = data[5];
        String constructorIndex = htis_complex[9];
        String processorIndex = htis_complex[10];
        //  manufacturer
        Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);

        if (!sid.equals("null")) {

            constructorIndex = Utils.getScenarioPram(modID, sid, com_id, "CAT_CONSTRUCTOR_INDEX", htis_complex[9], "com.acrtek.xact_services.data.server.COMPLEX_INST");
            processorIndex = Utils.getScenarioPram(modID, sid, com_id, "CAT_CPU_INDEX", htis_complex[10], "com.acrtek.xact_services.data.server.COMPLEX_INST");
            catIndex = Utils.getScenarioPram(modID, sid, data[0], "CATALOG", data[5], "com.acrtek.xact_services.data.server.SERVER_INST");
            //  out.print(processorIndex);
        }
        c.ListCatalogs();
        c.setCatByOffset(Integer.parseInt(catIndex));
        Manufacturer manufacturer = new Manufacturer(c);
        manufacturer.ListManufacturers();
        manufacturer.setManufacturer(Integer.parseInt(constructorIndex));

        //get   model 
        String model = "";
        Processor uc = new Processor(c);
        ArrayList pList = uc.ListProcessors();
        try {

            uc.setProcessors(Integer.parseInt(processorIndex));
        } catch (IndexOutOfBoundsException ex) {
            model = "The selected processor model isn't available from this manufacturer. Please reselect the processor model";
        }

        ArrayList list = uc.getData();
        ArrayList param = (ArrayList) list.get(1);

        try {

            model = (String) pList.get(Integer.parseInt(processorIndex));
        } catch (IndexOutOfBoundsException ex) {
            model = "The selected processor model isn't available from this manufacturer. Please reselect the processor model";
        }

        outData = maxProcessors + "," + param.get(1) + "," + manufacturer.getManufacturerName() + "," + model;

    } else if (status.equalsIgnoreCase("getSoftweraLoackTable")) {

        db.openCon();

        String AC_ID = request.getParameter("acid");

        outData = "";

        if (!AC_ID.equals("")) {
            ResultSet datarapp = db.getData(XMLDataModel.SOFTWARE_LOCK_INST_TABLENAME, "*", "LOCK_COMPONENT_INST_ID=" + AC_ID);
            while (datarapp.next()) {

                String[] ldata = db.getRowNocon(XMLDataModel.SOFTWARE_LOCK_TABLENAME, "ID=" + datarapp.getString("SOFTWARE_LOCK_ID"));

                String[] rdata = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + datarapp.getString("AC_INST_ID"));

                outData += "<tr data-value='" + datarapp.getString("id") + "' >"
                        + "<td >" + ldata[4] + "</td>"
                        + "<td >" + rdata[6] + "</td>"
                        + "<td >" + nf.format(Double.parseDouble(ldata[5])) + "</td>"
                        + "</tr>";

            }

        }

        if (outData.equalsIgnoreCase("")) {
            outData = "<tr>"
                    + "<td colspan='3'>No locks found</td>"
                    + "</tr>";

        }
        db.closeCon();

    } else if (status.equalsIgnoreCase("getSoftweraLoackInsert")) {

        String id = Utils.getNewID();

        String[] lacd = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "id=" + request.getParameter("AC_INST_ID"));
        String[] acd = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "id=" + request.getParameter("LOCK_COMPONENT_INST_ID"));

        String[][] prioInstData = {
            {"ID", "LOCK_COMPONENT_ID", "AC_ID", "MODEL_ID", "NAME", "PROPORTION"},
            {id, acd[2], lacd[2], request.getParameter("mid"), request.getParameter("NAME"), request.getParameter("PROPORTION")}
        };
        db.setInsert(XMLDataModel.SOFTWARE_LOCK_TABLENAME, prioInstData);
        String id2 = Utils.getNewID();

        String[][] prioInstData2 = {
            {"ID", "SOFTWARE_LOCK_ID", "LOCK_COMPONENT_INST_ID", "AC_INST_ID", "MODEL_ID", "PROPORTION"},
            {id2, id, request.getParameter("LOCK_COMPONENT_INST_ID"), request.getParameter("AC_INST_ID"), request.getParameter("mid"), request.getParameter("PROPORTION")}
        };
        db.setInsert(XMLDataModel.SOFTWARE_LOCK_INST_TABLENAME, prioInstData2);

    } else if (status.equalsIgnoreCase("getSoftweraLoackDElete")) {

        String id = request.getParameter("id");

        String[] sli = db.getRow(XMLDataModel.SOFTWARE_LOCK_INST_TABLENAME, "*", "id=" + request.getParameter("id"));

        db.setDelete(XMLDataModel.SOFTWARE_LOCK_INST_TABLENAME, "ID=" + request.getParameter("id"));

        db.setDelete(XMLDataModel.SOFTWARE_LOCK_TABLENAME, "ID=" + sli[1]);

    } else if (status.equalsIgnoreCase("getSoftweraLoackdata")) {

        String[] sli = db.getRow(XMLDataModel.SOFTWARE_LOCK_INST_TABLENAME, "*", "id=" + request.getParameter("id"));

        String[] sl = db.getRow(XMLDataModel.SOFTWARE_LOCK_TABLENAME, "*", "id=" + sli[1]);

        outData = sl[4] + "," + sli[3] + "," + sl[5];

    } else if (status.equalsIgnoreCase("getSoftweraLoackUpdate")) {

        String id = request.getParameter("id");

        String[] acd = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "id=" + request.getParameter("AC_INST_ID"));
        String[] sli = db.getRow(XMLDataModel.SOFTWARE_LOCK_INST_TABLENAME, "*", "id=" + request.getParameter("id"));

        String[][] prioInstData = {
            {"AC_ID", "NAME", "PROPORTION"},
            {acd[2], request.getParameter("NAME"), request.getParameter("PROPORTION")}
        };
        db.setUpdate(XMLDataModel.SOFTWARE_LOCK_TABLENAME, prioInstData, "ID=" + sli[1]);

        String[][] prioInstData2 = {
            {"AC_INST_ID", "PROPORTION"},
            {request.getParameter("AC_INST_ID"), request.getParameter("PROPORTION")}
        };

        db.setUpdate(XMLDataModel.SOFTWARE_LOCK_INST_TABLENAME, prioInstData2, "ID=" + id);

    } else if (status.equalsIgnoreCase("getSerComponentlist")) {

        db.openCon();

        String logServer = request.getParameter("logServer");
        if (!logServer.equals("")) {
            ResultSet datarapp = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + logServer);

            while (datarapp.next()) {

                //   String[] app = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "ID=" + datarapp.getString("AC_ID"));
                String s = nf.format(Double.parseDouble(datarapp.getString("INST_MULTIPRO")));
                if (!sid.equalsIgnoreCase("null") && !sid.equalsIgnoreCase("")) {

                    String MODEL_ID = request.getParameter("mod_id");

                    s = u.getISScenarioPram(MODEL_ID, sid, datarapp.getString("id"), "INST_MULTIPRO");

                }

                outData += "<tr data-value='" + datarapp.getString("id") + "' data-name='" + datarapp.getString("INST_NAME") + "' >"
                        + "<td >" + datarapp.getString("INST_NAME") + "</td>"
                        + "<td >" + nf.format(Double.parseDouble(datarapp.getString("TOTAL_CPU"))) + "</td>"
                        + "<td >" + nf.format(Double.parseDouble(datarapp.getString("MEAN_DASD_IO"))) + "</td>"
                        + "<td >" + s + "</td>"
                        + "<td >" + nf.format(Double.parseDouble(datarapp.getString("AVG_AUX_DELAY"))) + "</td>"
                        + "<td >" + nf.format(Double.parseDouble(datarapp.getString("MEAN_AUX_DELAY"))) + "</td>"
                        + "</tr>";
            }

        }

        db.closeCon();

    } else if (status.equalsIgnoreCase("getSerComponentData")) {

        String id = request.getParameter("id");
        String[] datarapp = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "ID=" + id);
        outData += Arrays.deepToString(datarapp);

    } else if (status.equalsIgnoreCase("updateaci")) {

        String id = request.getParameter("id");

        String[][] prioInstData = {
            {"INST_NAME", "TOTAL_CPU", "MEAN_DASD_IO", "INST_MULTIPRO", "AVG_AUX_DELAY", "MEAN_AUX_DELAY"},
            {request.getParameter("INST_NAME"), request.getParameter("TOTAL_CPU"), request.getParameter("MEAN_DASD_IO"), request.getParameter("INST_MULTIPRO"), request.getParameter("AVG_AUX_DELAY"), request.getParameter("MEAN_AUX_DELAY")}
        };

        db.setUpdate(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, prioInstData, "ID=" + id);

    } else if (status.equalsIgnoreCase("getSerComponentDatascenarios")) {

        String id = request.getParameter("id");
        String MODEL_ID = request.getParameter("mod_id");
        String SCENARIO_ID = sid;
        String[] datarapp = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "ID=" + id);
        String s = u.getISScenarioPram(MODEL_ID, SCENARIO_ID, id, "INST_MULTIPRO");

        outData += Arrays.deepToString(datarapp).replace("]", "") + "," + s;

    } else if (status.equalsIgnoreCase("updateaciscenario")) {

        String id = request.getParameter("id");
        String MODEL_ID = request.getParameter("mod_id");

        String SCENARIO_ID = sid;
        String[] S_PARAMETER = {"INST_MULTIPRO"};
        String[] OLD_VALUE = {request.getParameter("INST_MULTIPRO")};
        String[] NEW_VALUE = {request.getParameter("INST_MULTIPRO_new")};
        String[] ObjectClass = {"APPLICATION_COMPONENT_INST"};
        String[] OBJECT_ID = {id};
        u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

    } else if (status.equalsIgnoreCase("getlogServerList")) {
        String com_id = request.getParameter("com_id");
        db.openCon();
        ResultSet datarL = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "COMPLEX_INST_ID=" + com_id);

        outData += "<option></option>";

        while (datarL.next()) {

            String[] datarln = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "id=" + datarL.getString("LOGICAL_SERVER_ID"));

            outData += "<option value='" + datarL.getString("id") + "' >" + datarln[2] + "</option>";

        }

        db.closeCon();

    } else if (status.equalsIgnoreCase("LOCK_COMPONENT_Data")) {
        String ServerId = request.getParameter("ServerId");

        String acid = request.getParameter("acid");

        db.openCon();
        ResultSet datarL = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + ServerId);
        String select = request.getParameter("selected");
        outData += "<option></option>";

        while (datarL.next()) {

            String[] datarln = db.getRowNocon(XMLDataModel.application_component_desc_TABLENAME, "id=" + datarL.getString("ACD_ID"));

            if (datarln[5].equalsIgnoreCase("1")) {

                String mor = "";
                if (select.equalsIgnoreCase(datarL.getString("id"))) {
                    mor = "selected";
                }

                if (!acid.equalsIgnoreCase(datarL.getString("id"))) {
                    outData += "<option " + mor + "  value='" + datarL.getString("id") + "' >" + datarL.getString("INST_NAME") + "</option>";
                }
            }
        }

        db.closeCon();

        /*
        
         1. Get all APPLICATION_COMPONENT_INST that have the LOGICAL_SERVER_INST_ID
         same as the $Application Instance.LOGICAL_SERVER_INST_ID
         show only those who have
         2. APPLICATION_COMPONENT_DESC.WORKLOAD_TYPE==1 (you can get the APPLICATION_COMPONENT_DESC ID from
         APPLICATION_COMPONENT_INST.ACD_ID
         */
    } else if (status.equalsIgnoreCase("getlogServerData")) {

        String logServerid = request.getParameter("logServer");
        db.openCon();
        ResultSet datarL = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "ID=" + logServerid);

        String logicals = "";
        String processor = "";

        String logServer = "";
        String ischack = "";

        int count = 0;
        while (datarL.next()) {
            if (count == 0) {
                logServer = datarL.getString("id");
            }

            String[] datarln = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "id=" + datarL.getString("LOGICAL_SERVER_ID"));

            if (datarln[3] != null) {
                if (!datarln[3].equals("")) {
                    if (Integer.parseInt(datarln[3]) > 0) {
                        ischack = "chacked";
                    }
                }
            } else {

                ischack = "";
            }

            if ("".equals(logicals)) {
                logicals = datarL.getString("LOGICAL_PROCESSORS");
            }

            count++;
        }

        outData = logicals + "," + ischack;

        db.closeCon();
    } else if (status.equalsIgnoreCase("getConnectedStorageNode")) {
        ServerNodeOperations s = new ServerNodeOperations();

        outData = s.getConnectedStorageNode(noid);

    }

    out.print(outData);


%>
