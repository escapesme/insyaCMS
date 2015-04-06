<%@page import="java.util.HashMap"%>
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
    String noid = request.getParameter("nod_id");
    String ids = request.getParameter("ids");
    String sid = request.getParameter("sid");
    String status = request.getParameter("status");
    String modID = request.getParameter("mod_id");;

    String outData = "";

    Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);
    String[] data = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + noid);
    if (status.equalsIgnoreCase("getCOMPLEX")) {
        db.openCon();

        ResultSet datars = db.getData(XMLDataModel.COMPLEX_INST_TABLENAME, "*", "SERVER_INST_ID=" + data[0]);
        while (datars.next()) {

            String[] CList = getComplesCONSTRUCTOR(sid, modID, data[0], datars.getString("id"), c);

            outData += "<tr data-id='" + datars.getString("id") + "'   data-pro='" + CList[4] + "'>";
            outData += "<td class='Complex_Name'>" + datars.getString("NAME") + "</td>";
            outData += "<td class='constructorTd' data-old='" + CList[1] + "'><select data-comid='" + datars.getString("id") + "'  class='constructorSelect' >" + CList[0] + "</select></td>";
            outData += "<td class='cpuTd'  data-old='" + CList[3] + "' ><select class='cpuSelect'>" + CList[2] + "</select></td>";
            outData += "<td class='pnum' data-old='" + CList[5] + "' >" + CList[4] + "</td>";
            outData += "</tr>";

        }

        db.closeCon();

    } else if (status.equalsIgnoreCase("pnum")) {
        String com_id = request.getParameter("com_id");
        String constructorIndex = request.getParameter("constructorIndex");
        String cupIndex = request.getParameter("cupIndex");
        outData = getListProcessorNumber(constructorIndex, data[0], c, sid, modID, com_id, cupIndex);

    } else if (status.equalsIgnoreCase("pnumbyselect")) {
        String com_id = request.getParameter("com_id");
        String constructorIndex = request.getParameter("constructorIndex");
        String cupIndex = request.getParameter("cupIndex");
        outData = getListProcessorNumberBySeelect(constructorIndex, data[0], c, sid, modID, com_id, cupIndex);

    } else if (status.equalsIgnoreCase("getCPU")) {
        String com_id = request.getParameter("com_id");

        String constructorIndex = request.getParameter("constructorIndex");
        outData = getListProcessors(constructorIndex, data[0], c, sid, modID, com_id);

    } else if (status.equalsIgnoreCase("getCONSTRUCTOR")) {

        String comID = request.getParameter("mod_id");
        String[] CList = getComplesCONSTRUCTOR(sid, modID, data[0], comID, c);

        outData = CList[0];
    } else if (status.equalsIgnoreCase("update")) {

        updateData(modID, sid, request);

    } else if (status.equalsIgnoreCase("getPartitions")) {

        String com_id = request.getParameter("com_id");
        String proid = request.getParameter("proid");
        db.openCon();
        ResultSet datarL = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "COMPLEX_INST_ID=" + com_id);

        while (datarL.next()) {

            outData += "<tr class='_" + com_id + "'  style='display:none' data-id='" + datarL.getString("id") + "' data-comid='" + com_id + "'>";
            String[] datarln = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "id=" + datarL.getString("LOGICAL_SERVER_ID"));

            outData += "<td value='" + datarL.getString("id") + "' >" + datarln[2] + "</td>";

            int num = Integer.parseInt(proid);

            String d = datarL.getString("LOGICAL_PROCESSORS");

            if (!sid.equals("null")) {
                //            u.setScenarioParameters(modID, sid, data.get("id"), "com.acrtek.xact_services.data.server.LOGICAL_SERVER_INST", "LOGICAL_PROCESSOR", data.get("iold"), data.get("inew"));

                d = Utils.getScenarioPram(modID, sid, datarL.getString("ID"), "LOGICAL_PROCESSOR", "" + datarL.getString("LOGICAL_PROCESSORS"), "com.acrtek.xact_services.data.server.LOGICAL_SERVER_INST");
            }

            outData += "<td><select data-old='" + datarL.getString("LOGICAL_PROCESSORS") + "' class='ProcessorsSelect' >" + getproSelect(num, d) + "</select></td>";

            outData += "</tr>";

        }

        db.closeCon();

    }
    out.print(outData);
%>


<%!
    lib.engine.db.operations db = new lib.engine.db.operations();

    String getproSelect(int num, String selected) {
        String r = "";
        for (int i = 1; i <= num; i++) {

            String isSelected = "";
            if (Integer.parseInt(selected) == i) {
                isSelected = "selected='selected'";
            }
            r += "<option " + isSelected + " value='" + i + "'>" + i + "</option>";
        }

        return r;

    }

    HashMap<String, String> updateArray(String data) {
        HashMap<String, String> r = new HashMap<String, String>();
        String[] ds = data.split(",");

        for (String d : ds) {
            String[] dds = d.split(":");

            r.put(dds[0], dds[1]);
        }

        return r;
    }

    String updateData(String modID, String sid, HttpServletRequest rq) {
        String r = "";

        xact.utils u = new xact.utils();

        String[] complexeslesData = rq.getParameter("complexeslData").split(";");
        String[] partitionsData = rq.getParameter("partitionsData").split(";");
        for (String complexesleData : complexeslesData) {
            HashMap<String, String> data = updateArray(complexesleData);

            u.setScenarioParameters(modID, sid, data.get("comid"), "com.acrtek.xact_services.data.server.COMPLEX_INST", "CAT_CONSTRUCTOR_INDEX", data.get("cold"), data.get("cnew"));
            u.setScenarioParameters(modID, sid, data.get("comid"), "com.acrtek.xact_services.data.server.COMPLEX_INST", "CAT_CPU_INDEX", data.get("pold"), data.get("pnew"));
            u.setScenarioParameters(modID, sid, data.get("comid"), "com.acrtek.xact_services.data.server.COMPLEX_INST", "NUM_PROCESSORS", data.get("nold"), data.get("nnew"));

        }
        for (String partitionData : partitionsData) {
            HashMap<String, String> data = updateArray(partitionData);

            u.setScenarioParameters(modID, sid, data.get("id"), "com.acrtek.xact_services.data.server.LOGICAL_SERVER_INST", "LOGICAL_PROCESSOR", data.get("iold"), data.get("inew"));

        }

        return r;
    }

    String getListProcessors(String constructorIndex, String serverId, Catalog c, String sid, String ModileID, String complexID) {

        String[] serverData = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + serverId);
        String catId = serverData[5];
        String[] htis_complex = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID='" + complexID + "'");
        String processorIndex = htis_complex[10];

        String r = "";
        c.ListCatalogs();
        c.setCatByOffset(Integer.parseInt(catId));
        Manufacturer manufacturer = new Manufacturer(c);
        ArrayList cList = manufacturer.ListManufacturers();
        manufacturer.setManufacturer(Integer.parseInt(constructorIndex));
        Processor uc = new Processor(c);
        ArrayList pList = uc.ListProcessors();

        if (!sid.equals("null")) {

            processorIndex = Utils.getScenarioPram(ModileID, sid, complexID, "CAT_CPU_INDEX", processorIndex, "com.acrtek.xact_services.data.server.COMPLEX_INST");
        }

        for (int i = 0; i < pList.size(); i++) {

            String selectedProcesor = "";
            if (Integer.parseInt(processorIndex) == i) {
                selectedProcesor = "selected='selected'";
            }

            r += "<option " + selectedProcesor + " value='" + i + "'>" + pList.get(i) + "</option>";
        }

        return r;

    }

    String getListProcessorNumberBySeelect(String constructorIndex, String serverId, Catalog c, String sid, String ModileID, String complexID, String CAT_CPU_INDEX) {

        String[] serverData = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + serverId);
        String catId = serverData[5];
        String[] htis_complex = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID='" + complexID + "'");
        String processorIndex = htis_complex[10];

        String r = "";
        c.ListCatalogs();
        c.setCatByOffset(Integer.parseInt(catId));
        Manufacturer manufacturer = new Manufacturer(c);
        ArrayList cList = manufacturer.ListManufacturers();
        manufacturer.setManufacturer(Integer.parseInt(constructorIndex));
        Processor uc = new Processor(c);
        ArrayList pList = uc.ListProcessors();

        uc.setProcessors(Integer.parseInt(CAT_CPU_INDEX));

        String n_pro = "" + Integer.parseInt((String) (uc.getData().get(2).toArray())[1]);

        if (!sid.equals("null")) {

            // n_pro = Utils.getScenarioPram(ModileID, sid, complexID, "NUM_PROCESSORS", "" + n_pro, "com.acrtek.xact_services.data.server.COMPLEX_INST");
        }

        return n_pro;
    }

    String getListProcessorNumber(String constructorIndex, String serverId, Catalog c, String sid, String ModileID, String complexID, String CAT_CPU_INDEX) {

        String[] serverData = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + serverId);
        String catId = serverData[5];
        String[] htis_complex = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID='" + complexID + "'");
        String processorIndex = htis_complex[10];

        String r = "";
        c.ListCatalogs();
        c.setCatByOffset(Integer.parseInt(catId));
        Manufacturer manufacturer = new Manufacturer(c);
        ArrayList cList = manufacturer.ListManufacturers();
        manufacturer.setManufacturer(Integer.parseInt(constructorIndex));
        Processor uc = new Processor(c);
        ArrayList pList = uc.ListProcessors();

        uc.setProcessors(Integer.parseInt(CAT_CPU_INDEX));

        String n_pro = "" + Integer.parseInt((String) (uc.getData().get(2).toArray())[1]);

        if (!sid.equals("null")) {

            n_pro = Utils.getScenarioPram(ModileID, sid, complexID, "NUM_PROCESSORS", "" + n_pro, "com.acrtek.xact_services.data.server.COMPLEX_INST");
        }

        return n_pro;
    }

    /*
    
    
     
        
     */
    String[] getComplesCONSTRUCTOR(String sid, String ModileID, String serverId, String complexID, Catalog c) {

        //  Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);
        String[] serverData = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + serverId);
        String catIndex = serverData[5];

        if (!sid.equals("null")) {
            catIndex = Utils.getScenarioPram(ModileID, sid, serverId, "CATALOG", serverData[5], "SERVER_INST");
        }

        String[] htis_complex = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID='" + complexID + "'");

        String constructorIndex = htis_complex[9];
        String processorIndex = htis_complex[10];

        String constructorIndexdef = htis_complex[9];
        String processorIndexdef = htis_complex[10];

        if (!sid.equals("null")) {

            constructorIndex = Utils.getScenarioPram(ModileID, sid, complexID, "CAT_CONSTRUCTOR_INDEX", htis_complex[9], "com.acrtek.xact_services.data.server.COMPLEX_INST");
            processorIndex = Utils.getScenarioPram(ModileID, sid, complexID, "CAT_CPU_INDEX", htis_complex[10], "com.acrtek.xact_services.data.server.COMPLEX_INST");
            catIndex = Utils.getScenarioPram(ModileID, sid, serverId, "CATALOG", serverData[5], "com.acrtek.xact_services.data.server.SERVER_INST");
            // out.print(catIndex);
        }
        c.ListCatalogs();
        c.setCatByOffset(Integer.parseInt(catIndex));
        Manufacturer manufacturer = new Manufacturer(c);
        ArrayList cList = manufacturer.ListManufacturers();

        Processor uc = new Processor(c);
        ArrayList pList = uc.ListProcessors();

        if (Integer.parseInt(processorIndex) >= pList.size()) {
            processorIndex = "0";
        }

        String selectedProcesor = "";

        String plistStrng = "";
        String defPlist = "";

        for (int i = 0; i < pList.size(); i++) {
            selectedProcesor = "";
            if (Integer.parseInt(processorIndex) == i) {
                selectedProcesor = "selected='selected'";
            }

            plistStrng += "<option value='" + i + "'" + selectedProcesor + ">" + pList.get(i) + "</option>";
        }

        String clistStrng = "";
        for (int i = 0; i < cList.size(); i++) {
            selectedProcesor = "";
            if (Integer.parseInt(constructorIndex) == i) {
                selectedProcesor = "selected='selected'";
            }

       /*     if (cList.size() == (i - 1)) {

                if (Integer.parseInt(constructorIndex) >= i) {
                    selectedProcesor = "selected='selected'";

                }

            }
*/
            clistStrng += "<option value='" + i + "'" + selectedProcesor + ">" + cList.get(i) + "</option>";
        }

        int n_pro = Integer.parseInt((String) (uc.getData().get(2).toArray())[1]);
        String n_prodef = "" + Integer.parseInt((String) (uc.getData().get(2).toArray())[1]);

        String[] d = {clistStrng, constructorIndexdef, plistStrng, processorIndexdef, "" + n_pro, "" + n_prodef
        };
        return d;

    }

%>
