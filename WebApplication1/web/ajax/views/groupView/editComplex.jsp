<%@page import="lib.Options.DbInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.tools.Utils"%>
<%@page import="cat.read.Manufacturer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Processor"%>
<%@page import="cat.read.Catalog"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Arrays"%>
<%    
    String serverId = request.getParameter("serverId");
    
    String comlexID = request.getParameter("com_di");
    String sataus = request.getParameter("status");
    lib.engine.db.operations db = new lib.engine.db.operations();
    
    String printData = "";
    
    String id = request.getParameter("id");
    String[] ids = id.split(",");
    
    
    String sid = ids[2];
    
    
    String[] serverData = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + serverId);
    String catIndex = serverData[5];
    
    if (!sid.equals("null")) {
        catIndex = Utils.getScenarioPram(ids[3], sid, serverId, "CATALOG", serverData[5], "SERVER_INST");
    }
    Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);
    ArrayList cats = c.ListCatalogs();
    
    
    
    String[] htis_complex = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID='" + comlexID + "'");
    
    String constructorIndex = htis_complex[9];
    String processorIndex = htis_complex[10];
    if (!sid.equals("null")) {
        
        constructorIndex = Utils.getScenarioPram(ids[3], sid, comlexID, "CAT_CONSTRUCTOR_INDEX", htis_complex[9], "com.acrtek.xact_services.data.server.COMPLEX_INST");
        processorIndex = Utils.getScenarioPram(ids[3], sid, comlexID, "CAT_CPU_INDEX", htis_complex[10], "com.acrtek.xact_services.data.server.COMPLEX_INST");
        catIndex = Utils.getScenarioPram(ids[3], sid, serverId, "CATALOG", serverData[5], "com.acrtek.xact_services.data.server.SERVER_INST");
        out.print(catIndex);
    }
    c.ListCatalogs();
    c.setCatByOffset(Integer.parseInt(catIndex));
    Manufacturer manufacturer = new Manufacturer(c);
    ArrayList cList = manufacturer.ListManufacturers();
    if (Integer.parseInt(constructorIndex) >= cList.size()) {
        constructorIndex = "0";
    }
    manufacturer.setManufacturer(Integer.parseInt(constructorIndex));
    Processor uc = new Processor(c);
    ArrayList pList = uc.ListProcessors();
    if (Integer.parseInt(processorIndex) >= pList.size()) {
        processorIndex = "0";
    }
    uc.setProcessors(Integer.parseInt(processorIndex));
    
    
    
    String[] comData = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID='" + comlexID + "'");
    String selectedManufacturer, selectedProcesor = "";
    String vServewr = comData[4];
    if (!sid.equals("null")) {
        vServewr = Utils.getScenarioPram(ids[3], sid, comlexID, "VSNAME", comData[4], "COMPLEX_INST");
    }
    String virtaul = "";
    String virtServer = "";
    String vmWare = "";
    String xen = "";
    if (!vServewr.equals("-1")) {
        virtaul = "checked='checked'";
    }
    if (vServewr.equals("0")) {
        virtServer = "selected='selected'";
    }
    if (vServewr.equals("1")) {
        vmWare = "selected='selected'";
    }
    if (vServewr.equals("2")) {
        xen = "selected='selected'";
    }
    if (sataus.equals("create")) {
        // out.print(vServewr);
        printData += "<script>EditComplexActions('" + serverId + "','" + comlexID + "','" + serverData[5] + "','" + id + "'); </script><div class='mydata'>";
        if (sid.equals("null")) {
        printData += "";
        
        
        
        }
        
        printData += " <div class=\"frm_row do_left  \" > "
                + "<div class=\"frm_label\">Virtual Platform:</div><div class=\"frm_input\">"
                + "<select class=\"Virtual_Platform\"  >"
                + "<option value='-1' " + virtaul + ">None</option>"
                + "<option value='0' " + virtServer + ">Virtual Server</option>"
                + "<option value='1' " + vmWare + ">VMware</option>"
                + "<option value='2' " + xen + ">XenEnterprise</option>"
                + "</select>"
                + "</div></div>";
        
        
        
        
        printData += " <div class=\"frm_row do_left  \" > "
                + "<div class=\"frm_label\">Constructor</div><div class=\"frm_input\">"
                + "<select class=\"CAT_CONSTRUCTOR_INDEX\">";
        for (int i = 0; i < cList.size(); i++) {
            selectedManufacturer = "";
            if (Integer.parseInt(constructorIndex) == i) {
                selectedManufacturer = "selected='selected'";
            }
            printData += "<option value='" + i + "'" + selectedManufacturer + ">" + cList.get(i) + "</option>";
        }
        printData += "</select>"
                + "</div></div>";
        
        
        
        printData += " <div class=\"frm_row do_left  \" > "
                + "<div class=\"frm_label\">CPU </div><div class=\"frm_input\">"
                + "<select class=\"CAT_CPU_INDEX\"  >";
        for (int i = 0; i < pList.size(); i++) {
            selectedProcesor = "";
            if (Integer.parseInt(processorIndex) == i) {
                selectedProcesor = "selected='selected'";
            }
            printData += "<option value='" + i + "'" + selectedProcesor + ">" + pList.get(i) + "</option>";
        }
        printData += "</select>"
                + "</div></div>";
        
        
        
        
        printData += "</div><div class='do_center'>"
                + "<input type='button' class='editComOk' value='Ok'>"
                + "<input type='button'  class='editComCancel' value='Cancel'>"
                + "</div>";
        out.print(printData);
    } else if (sataus.equals("save")) {
        double oldpower = Double.parseDouble((String) uc.getData().get(1).toArray()[1]);
        String index = request.getParameter("catIndex");
        if(index==null){
            index=catIndex;
        }
         if(index.equalsIgnoreCase("undefined")){
            index=catIndex;
        }
        String Virtual_Platform = request.getParameter("Virtual_Platform");
        
        String CAT_CONSTRUCTOR_INDEX = request.getParameter("CAT_CONSTRUCTOR_INDEX");
        c.setCatByOffset(Integer.parseInt(index));
        String CAT_CPU_INDEX = request.getParameter("CAT_CPU_INDEX");
        Manufacturer m = new Manufacturer(c);
        m.ListManufacturers();
        
        manufacturer.setManufacturer(Integer.parseInt(CAT_CONSTRUCTOR_INDEX));
        Processor u = new Processor(c);
        ArrayList pc = u.ListProcessors();
        
        u.setProcessors(Integer.parseInt(CAT_CPU_INDEX));
        int n_pro = Integer.parseInt((String) (u.getData().get(2).toArray())[1]);
        double newpower = Double.parseDouble((String) u.getData().get(1).toArray()[1]);
        out.print("old=" + oldpower + "__new=" + newpower+";");
        if (!sid.equals("null")) {
            String outData = "";
            out.print(sid + "scenario");
            String where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + comlexID + "' and  S_PARAMETER='CAT_CONSTRUCTOR_INDEX' ";
            outData += db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
            where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + comlexID + "' and  S_PARAMETER='CAT_CPU_INDEX' ";
            outData += db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
            where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + comlexID + "' and  S_PARAMETER='VSNAME' ";
            outData += db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
            String inData[][] = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, comlexID, "CAT_CONSTRUCTOR_INDEX", constructorIndex, CAT_CONSTRUCTOR_INDEX, "com.acrtek.xact_services.data.server.COMPLEX_INST", ids[3]}};
            outData += db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, inData);
            String[][] inData2 = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, comlexID, "CAT_CPU_INDEX", processorIndex, CAT_CPU_INDEX, "com.acrtek.xact_services.data.server.COMPLEX_INST", ids[3]}};
            outData += db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, inData2);
            String[][] inData3 = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, comlexID, "VSNAME", vServewr, Virtual_Platform, "com.acrtek.xact_services.data.server.COMPLEX_INST", ids[3]}};
            outData += db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, inData3);
            where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + comlexID + "' and  S_PARAMETER='COMPLEX_TYPE' ";
            outData += db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
            String[][] inDatanumProc = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, comlexID, "COMPLEX_TYPE", comData[5], "" + n_pro, "com.acrtek.xact_services.data.server.COMPLEX_INST", ids[3]}};
            outData += db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, inDatanumProc);
             

            /*where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + serverId + "' and  S_PARAMETER='CATALOG' ";
             outData += db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
            
             String inDataCat[][] = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, serverId, "CATALOG", catIndex, index, "com.acrtek.xact_services.data.server.SERVER_INST", ids[3]}};
             outData += db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, inData);*/
            int servers = db.getRowCount(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "COMPLEX_INST_ID=" + comlexID);
            db.openCon();
            int totLogServers=0;
            ResultSet serversInst = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "COMPLEX_INST_ID=" + comlexID);
            while (serversInst.next()) {
                int newProc = serversInst.getInt("LOGICAL_PROCESSORS") * n_pro / Integer.parseInt(comData[5]);
                totLogServers+=newProc;
                where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + serversInst.getString("ID") + "' and  S_PARAMETER='LOGICAL_PROCESSORS' ";
                outData += db.setDeleteNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
                String[][] serverInstProc = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, serversInst.getString("ID"), "LOGICAL_PROCESSORS", serversInst.getString("LOGICAL_PROCESSORS"), "" + newProc, "com.acrtek.xact_services.data.server.LOGICAL_SERVER_INST", ids[3]}};
                outData += db.setInsertNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, serverInstProc);
                ResultSet aciList = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + serversInst.getString("ID"));
                while (aciList.next()) {
                    double newcpu = aciList.getDouble("TOTAL_CPU")*newpower/oldpower;
                    out.print("<br>old cpu="+aciList.getDouble("TOTAL_CPU")+"__new cpu="+newcpu+"__ratio="+newpower/oldpower+"<br>");
                    where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + aciList.getString("ID") + "' and  S_PARAMETER='TOTAL_CPU' ";
                    outData += db.setDeleteNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
                    String[][] aciPower = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, aciList.getString("ID"), "TOTAL_CPU", aciList.getString("TOTAL_CPU"), "" + newcpu, "com.acrtek.xact_services.data.server.APPLICATION_COMPONENT_INST", ids[3]}};
                    outData += db.setInsertNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, aciPower);
                }
            }
            db.closeCon();
            where = "SCENARIO_ID='" + sid + "' and  OBJECT_ID='" + comlexID + "' and  S_PARAMETER='TOT_LOGICAL_PROC' ";
            outData += db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
            String[][] numLogProc = {{"SCENARIO_ID", "OBJECT_ID", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE", "OBJECT_CLASS", "MODEL_ID"}, {sid, comlexID, "TOT_LOGICAL_PROC", comData[7], "" + totLogServers, "com.acrtek.xact_services.data.server.COMPLEX_INST", ids[3]}};
            outData += db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, numLogProc);
            
        } else {
            out.print("numproc:" + n_pro);
            out.print(Virtual_Platform);
            
            String[][] mydata = {
                {"VSNAME", "CAT_CONSTRUCTOR_INDEX", "CAT_CPU_INDEX", "NUM_PROCESSORS"},
                {Virtual_Platform, CAT_CONSTRUCTOR_INDEX, CAT_CPU_INDEX, "" + n_pro}
            };
            printData += db.setUpdate(XMLDataModel.COMPLEX_INST_TABLENAME, mydata, "ID=" + comlexID);
            out.print(printData);
            String udata[][] = {{"CATALOG"}, {index}};
            out.print(db.setUpdate(XMLDataModel.SERVER_INST_TABLENAME, udata, "ID='" + serverId + "'"));
        }
    }
    

%>
