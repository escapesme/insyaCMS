<%@page import="java.sql.SQLException"%>
<%@page import="xact.ServerNodeOperations"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String status = request.getParameter("status");
    String outData = "";
    String id = "";
    String[] rdata = null;
    String idins = "";
    ResultSet srdata = null;
    xact.utils u = new xact.utils();
    //<editor-fold defaultstate="collapsed" desc="data">
    if (status.equalsIgnoreCase("DBinstances")) {

        id = request.getParameter("id");
        outData = "" + db.getRow(XMLDataModel.DB_INST_TABLENAME, "LOGICAL_SERVER_INST_ID='" + id + "'")[0];

    } else if (status.equalsIgnoreCase("DBinstancesName")) {

        id = request.getParameter("id");
        outData = "" + db.getRow(XMLDataModel.DB_INST_TABLENAME, "LOGICAL_SERVER_INST_ID='" + id + "'")[3];

    } else if (status.equalsIgnoreCase("DBinstancestype")) {

        id = request.getParameter("id");
        outData = "" + db.getRow(XMLDataModel.DB_INST_TABLENAME, "LOGICAL_SERVER_INST_ID='" + id + "'")[4];

    } else if (status.equalsIgnoreCase("addDBinstances")) {

        String mid = Utils.getNewID();
        String[][] data = {{"ID", "MODEL_ID", "LOGICAL_SERVER_INST_ID", "DB_CONFIG_NAME", "TYPE"}, {mid,
            request.getParameter("mod_id"), request.getParameter("id"), request.getParameter("name"), request.getParameter("type")
        }};

        db.setInsert(XMLDataModel.DB_INST_TABLENAME, data);

        id = request.getParameter("id");
        outData = "" + db.getRow(XMLDataModel.DB_INST_TABLENAME, "LOGICAL_SERVER_INST_ID='" + id + "'")[0];

    } else if (status.equalsIgnoreCase("updateDBinstances")) {

        id = request.getParameter("id");

        String[][] data = {{"DB_CONFIG_NAME", "TYPE"}, {
            request.getParameter("name"), request.getParameter("type")
        }};

        db.setUpdate(XMLDataModel.DB_INST_TABLENAME, data, "ID='" + id + "'");

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Buffer">
    if (status.equalsIgnoreCase("addBuffer")) {

        String mid = Utils.getNewID();
        String[][] data = {{"ID", "PROJECT_ID", "BUFPOOL_SIZE", "PAGE_SIZE", "NAME", "DB_CONFIG_NAME"}, {mid,
            request.getParameter("proid"), request.getParameter("poolsize"), request.getParameter("pagesize"), request.getParameter("buffername"), request.getParameter("DBinsname")
        }};
        out.print(db.setInsert(XMLDataModel.LOGBUF_DESC_TABLENAME, data));

        String midins = Utils.getNewID();
        String[][] datains = {{"ID", "MODEL_ID", "LOGBUF_DESC_ID", "LOGICAL_DRIVE_NAME", "PGS_PER_IO", "OTHER_APPS", "DB_INST_ID"}, {midins,
            request.getParameter("mod_id"), mid, request.getParameter("logicaldrive"), request.getParameter("pageper"), request.getParameter("otheraccess"), request.getParameter("DBins")
        }};
        out.print(db.setInsert(XMLDataModel.LOGBUF_INST_TABLENAME, datains));

    } else if (status.equalsIgnoreCase("editBuffer")) {

        id = request.getParameter("id");
        idins = request.getParameter("idins");

        String[] ids = request.getParameter("ids").split("/");

        if (!ids[2].equalsIgnoreCase("null")) {

            String SCENARIO_ID = ids[2];
            String MODEL_ID = ids[3];

            String[] S_PARAMETER = {"BUFPOOL_SIZE", "PAGE_SIZE", "PGS_PER_IO", "OTHER_APPS"};
            String[] OLD_VALUE = {request.getParameter("poolsize"), request.getParameter("pagesize"), request.getParameter("pageper"), request.getParameter("otheraccess")};
            String[] NEW_VALUE = {request.getParameter("poolsize_new"), request.getParameter("pagesize_new"), request.getParameter("pageper_new"), request.getParameter("otheraccess_new")};
            String[] ObjectClass = {"LOGBUF_DESC", "LOGBUF_DESC", "LOGBUF_INST", "LOGBUF_INST"};
            String[] OBJECT_ID = {id, id, idins, idins};

            u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

        } else {

            String[][] eBdata = {{"BUFPOOL_SIZE", "PAGE_SIZE", "NAME"}, {
                request.getParameter("poolsize"), request.getParameter("pagesize"), request.getParameter("buffername")
            }};

            out.print(Arrays.deepToString(eBdata));
            out.print(db.setUpdate(XMLDataModel.LOGBUF_DESC_TABLENAME, eBdata, "ID='" + id + "'"));

            String[][] eBdatains = {{"LOGICAL_DRIVE_NAME", "PGS_PER_IO", "OTHER_APPS", "DB_INST_ID"}, {
                request.getParameter("logicaldrive"), request.getParameter("pageper"), request.getParameter("otheraccess"), request.getParameter("DBins")
            }};

            out.print(db.setUpdate(XMLDataModel.LOGBUF_INST_TABLENAME, eBdatains, "ID='" + idins + "'"));

        }

    } else if (status.equalsIgnoreCase("removeBuffer")) {
        id = request.getParameter("id");
        out.print(db.setDelete(XMLDataModel.LOGBUF_DESC_TABLENAME, "ID='" + id + "'"));
    } else if (status.equalsIgnoreCase("removeBufferinst")) {
        id = request.getParameter("id");
        out.print(db.setDelete(XMLDataModel.LOGBUF_INST_TABLENAME, "ID='" + id + "'"));

    } else if (status.equalsIgnoreCase("getBufferDatarows")) {

        db.openCon();
        id = request.getParameter("id");
        String[] ids = request.getParameter("ids").split("/");

        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        srdata = db.getData(XMLDataModel.LOGBUF_INST_TABLENAME, "*", "DB_INST_ID='" + id + "'");

        while (srdata.next()) {

            rdata = db.getRowNocon(XMLDataModel.LOGBUF_DESC_TABLENAME, "ID='" + srdata.getString("LOGBUF_DESC_ID") + "'");

            outData += "<tr  data-insid='" + srdata.getString("ID") + "' data-decid='" + rdata[0] + "'  >";
            outData += "<td>" + rdata[3] + "</td>";

            if (ids[2].equalsIgnoreCase("null")) {
                outData += "<td>" + rdata[4] + "</td>";
                outData += "<td>" + rdata[5] + "</td>";
                outData += "<td> " + Utils.numberFormat(Double.parseDouble(srdata.getString("PGS_PER_IO")), 0) + "</td>";
            } else {
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "BUFPOOL_SIZE"), rdata[4]) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "PAGE_SIZE"), rdata[5]) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdata.getString("ID"), "PGS_PER_IO"), Utils.numberFormat(Double.parseDouble(srdata.getString("PGS_PER_IO")), 0)) + "</td>";
            }
            outData += "<td>" + srdata.getString("LOGICAL_DRIVE_NAME") + "</td>";
            //   outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdata.getString("OTHER_APPS")), 0) + "</td>";
            outData += "</tr><br/>";

        }

        db.closeCon();

    } else if (status.equalsIgnoreCase("getBufferData")) {

        id = request.getParameter("id");
        rdata = db.getRow(XMLDataModel.LOGBUF_DESC_TABLENAME, "id='" + id + "'");
        outData = Arrays.deepToString(rdata);
    } else if (status.equalsIgnoreCase("getBufferinstData")) {

        id = request.getParameter("id");
        rdata = db.getRow(XMLDataModel.LOGBUF_INST_TABLENAME, "ID='" + id + "'");
        outData = Arrays.deepToString(rdata);
    } else if (status.equalsIgnoreCase("getBufferScenarioData")) {

        String[] ids = request.getParameter("ids").split("/");
        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];

        String[] S_PARAMETER = {"BUFPOOL_SIZE", "PAGE_SIZE", "PGS_PER_IO", "OTHER_APPS"};

        id = request.getParameter("id");
        idins = request.getParameter("idins");
        String[] OBJECT_ID = {id, id, idins, idins};

        rdata = u.getScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER);
        outData = Arrays.deepToString(updatePram(rdata));

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Table">
    if (status.equalsIgnoreCase("addTable")) {

        String midins = Utils.getNewID();

        String CACHE_DESC_ID = addtoCahceXref(midins, request.getParameterValues("CACHE_DESC_ID[]"), request, response);
        out.print(test);
        String mid = Utils.getNewID();
        String[][] data = {{"ID", "NAME", "DB_NAMESPACE_DESC_ID", "CACHE_DESC_ID", "USEFUL_SIZE", "INDEX_TYPE_NAME", "ROW_LEN", "TOT_NUM_INDEX", "DEFAULT_IND"}, {mid,
            request.getParameter("tablename"), request.getParameter("DB_NAMESPACE_DESC_ID"), CACHE_DESC_ID, request.getParameter("USEFUL_SIZE"), "", request.getParameter("ROW_LEN"), "0", "0"
        }};
        out.print(db.setInsert(XMLDataModel.TABLE_DESC_TABLENAME, data));

        String[][] datains = {{"ID", "MODEL_ID", "TABLE_DESC_ID",
            "LOGICAL_DRIVE_NAME", "TOT_PG_PER_TRAN",
            "OTHER_ACCESS", "DB_NAMESPACE_INST_ID", "MIN_IO_PER_TRAN", "PHYSICAL_IO", "OCCUP_RATE", "SYN_NUM"

        }, {midins,
            request.getParameter("mod_id"), mid, request.getParameter("LOGICAL_DRIVE_NAME"), "0.00000", request.getParameter("OTHER_ACCESS"),
            request.getParameter("DB_NAMESPACE_INST_ID"), request.getParameter("MIN_IO_PER_TRAN"), "0.00000", request.getParameter("OCCUP_RATE"), "0.00000"
        }};

        out.print(db.setInsert(XMLDataModel.TABLE_INST_TABLENAME, datains));

    } else if (status.equalsIgnoreCase("editTable")) {

        id = request.getParameter("id");
        idins = request.getParameter("idins");

        String[] ids = request.getParameter("ids").split("/");

        if (!ids[2].equalsIgnoreCase("null")) {

            String SCENARIO_ID = ids[2];
            String MODEL_ID = ids[3];

            String[] S_PARAMETER = {"ROW_LEN", "USEFUL_SIZE", "MIN_IO_PER_TRAN", "OTHER_ACCESS", "OCCUP_RATE"};
            String[] OLD_VALUE = {request.getParameter("ROW_LEN"), request.getParameter("USEFUL_SIZE"), request.getParameter("MIN_IO_PER_TRAN"), request.getParameter("OTHER_ACCESS"), request.getParameter("OCCUP_RATE")};
            String[] NEW_VALUE = {request.getParameter("ROW_LEN_new"), request.getParameter("USEFUL_SIZE_new"), request.getParameter("MIN_IO_PER_TRAN_new"), request.getParameter("OTHER_ACCESS_new"), request.getParameter("OCCUP_RATE_new")};
            String[] ObjectClass = {"TABLE_DESC", "TABLE_DESC", "TABLE_INST", "TABLE_INST", "TABLE_INST"};
            String[] OBJECT_ID = {id, id, idins, idins, idins};
            u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

        } else {

            String CACHE_DESC_ID = addtoCahceXref(idins, request.getParameterValues("CACHE_DESC_ID[]"), request, response);

            String[][] data = {{"NAME", "CACHE_DESC_ID", "USEFUL_SIZE", "INDEX_TYPE_NAME", "ROW_LEN", "TOT_NUM_INDEX", "DEFAULT_IND"}, {
                request.getParameter("tablename"), CACHE_DESC_ID, request.getParameter("USEFUL_SIZE"), "", request.getParameter("ROW_LEN"), "0", "0"
            }};

            out.print(db.setUpdate(XMLDataModel.TABLE_DESC_TABLENAME, data, "ID='" + id + "'"));

            //          out.print(Arrays.deepToString(data));
            //    out.print(db.returnSQL);
            String[][] datains = {{
                "LOGICAL_DRIVE_NAME", "TOT_PG_PER_TRAN",
                "OTHER_ACCESS", "MIN_IO_PER_TRAN", "PHYSICAL_IO", "OCCUP_RATE", "SYN_NUM"

            }, {
                request.getParameter("LOGICAL_DRIVE_NAME"), "0.00000", request.getParameter("OTHER_ACCESS"), request.getParameter("MIN_IO_PER_TRAN"), "0.00000", request.getParameter("OCCUP_RATE"), "0.00000"
            }};
            out.print(db.setUpdate(XMLDataModel.TABLE_INST_TABLENAME, datains, "ID='" + idins + "'"));

            out.print(test);

        }

    } else if (status.equalsIgnoreCase("removeTable")) {
        id = request.getParameter("id");
        out.print(db.setDelete(XMLDataModel.TABLE_DESC_TABLENAME, "ID='" + id + "'"));

        out.print(db.setDelete(XMLDataModel.INDEX_DESC_TABLENAME, "TABLE_DESC_ID='" + id + "'"));

    } else if (status.equalsIgnoreCase("removeTableinst")) {

        id = request.getParameter("id");
        out.print(db.setDelete(XMLDataModel.TABLE_INST_TABLENAME, "ID='" + id + "'"));
        out.print(db.setDelete(XMLDataModel.CACHE_XREF_TABLENAME, "CACHE_USER_ID='" + id + "'"));

    } else if (status.equalsIgnoreCase("getTableData")) {

        id = request.getParameter("id");
        rdata = db.getRow(XMLDataModel.TABLE_DESC_TABLENAME, "id='" + id + "'");
        outData = Arrays.deepToString(rdata);
    } else if (status.equalsIgnoreCase("getTableinstData")) {

        id = request.getParameter("id");
        rdata = db.getRow(XMLDataModel.TABLE_INST_TABLENAME, "ID='" + id + "'");
        outData = Arrays.deepToString(rdata);
    } else if (status.equalsIgnoreCase("getTableScenarioData")) {

        String[] ids = request.getParameter("ids").split("/");
        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];

        id = request.getParameter("id");
        idins = request.getParameter("idins");
        String[] OBJECT_ID = {id, id, idins, idins, idins};
        String[] S_PARAMETER = {"ROW_LEN", "USEFUL_SIZE", "MIN_IO_PER_TRAN", "OTHER_ACCESS", "OCCUP_RATE"};
        rdata = u.getScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER);
        outData = Arrays.deepToString(updatePram(rdata));

    } else if (status.equalsIgnoreCase("tableDatarows")) {

        db.openCon();
        id = request.getParameter("id");

        srdata = db.getData(XMLDataModel.TABLE_INST_TABLENAME, "*", "DB_NAMESPACE_INST_ID='" + id + "'");

        while (srdata.next()) {

            rdata = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME, "ID='" + srdata.getString("TABLE_DESC_ID") + "'");

            String cache = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + rdata[3] + "'")[3];
            String[] ids = request.getParameter("ids").split("/");

            String SCENARIO_ID = ids[2];
            String MODEL_ID = ids[3];

            outData += "<tr data-name='" + rdata[1] + "'  data-locgical='" + srdata.getString("LOGICAL_DRIVE_NAME") + "'   data-insid='" + srdata.getString("ID") + "'  data-decid='" + rdata[0] + "'  >";
            outData += "<td>" + rdata[1] + "</td>";
            outData += "<td>" + cache + "</td>";

            if (ids[2].equalsIgnoreCase("null")) {

                outData += "<td>" + rdata[6] + "</td>";

                outData += "<td>" + rdata[4] + "</td>";

                outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdata.getString("OTHER_ACCESS")), 0) + "</td>";
                outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdata.getString("MIN_IO_PER_TRAN")), 0) + "</td>";
                outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdata.getString("OCCUP_RATE")), 0) + "</td>";

            } else {

                //            String[] S_PARAMETER = {"ROW_LEN", "USEFUL_SIZE", "MIN_IO_PER_TRAN", "OTHER_ACCESS", "OCCUP_RATE"};
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "ROW_LEN"), rdata[6]) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "USEFUL_SIZE"), rdata[4]) + "</td>";
                
                
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdata.getString("ID"), "OTHER_ACCESS"), Utils.numberFormat(Double.parseDouble(srdata.getString("OTHER_ACCESS")), 0)) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdata.getString("ID"), "MIN_IO_PER_TRAN"), Utils.numberFormat(Double.parseDouble(srdata.getString("MIN_IO_PER_TRAN")), 0)) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdata.getString("ID"), "OCCUP_RATE"), Utils.numberFormat(Double.parseDouble(srdata.getString("OCCUP_RATE")), 0)) + "</td>";

            }
            outData += "<td>" + srdata.getString("LOGICAL_DRIVE_NAME") + "</td>";

            outData += "</tr>";

        }
    } else if (status.equalsIgnoreCase("getcahexref")) {
        id = request.getParameter("id");
        outData = getCahceXref(id, request, response);

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Index">
    if (status.equalsIgnoreCase("indxDatarows")) {

        db.openCon();
        id = request.getParameter("id");
        srdata = db.getData(XMLDataModel.INDEX_INST_TABLENAME, "*", "TABLE_INST_ID='" + id + "'");

        String[] ids = request.getParameter("ids").split("/");

        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];

        while (srdata.next()) {
            rdata = db.getRowNocon(XMLDataModel.INDEX_DESC_TABLENAME, "ID='" + srdata.getString("INDEX_DESC_ID") + "'");
            String cache = "";

            String cacheId = db.getRowNocon(XMLDataModel.CACHE_XREF_TABLENAME, "CACHE_USER_ID='" + srdata.getString("ID") + "'")[2];

            if (cacheId != null) {
                String cacheins = db.getRowNocon(XMLDataModel.CACHE_INST_TABLENAME, "ID='" + cacheId + "'")[1];
                cache = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + cacheins + "'")[3];
            }

            outData += "<tr  data-insid='" + srdata.getString("ID") + "' data-decid='" + rdata[0] + "'  >";
            outData += "<td>" + rdata[1] + "</td>";
            outData += "<td>" + cache + "</td>";

            if (ids[2].equalsIgnoreCase("null")) {
                outData += "<td>" + rdata[5] + "</td>";
                outData += "<td>" + rdata[3] + "</td>";
                outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdata.getString("OTHER_ACCESS")), 0) + "</td>";
                outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdata.getString("MIN_IO_PER_TRAN")), 0) + "</td>";
                outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdata.getString("OCCUP_RATE")), 0) + "</td>";

            } else {

                //            String[] S_PARAMETER = {"ROW_LEN", "USEFUL_SIZE", "MIN_IO_PER_TRAN", "OTHER_ACCESS", "OCCUP_RATE"};
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID,  rdata[0], "ROW_LEN"), rdata[5]) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "USEFUL_SIZE"), rdata[3]) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdata.getString("ID"), "OTHER_ACCESS"), Utils.numberFormat(Double.parseDouble(srdata.getString("OTHER_ACCESS")), 0)) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdata.getString("ID"), "MIN_IO_PER_TRAN"), Utils.numberFormat(Double.parseDouble(srdata.getString("MIN_IO_PER_TRAN")), 0)) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdata.getString("ID"), "OCCUP_RATE"), Utils.numberFormat(Double.parseDouble(srdata.getString("OCCUP_RATE")), 0)) + "</td>";
            }

            outData += "<td>" + rdata[4] + "</td>";
            outData += "<td>" + srdata.getString("LOGICAL_DRIVE_NAME") + "</td>";

            outData += "</tr>";

        }

    } else if (status.equalsIgnoreCase("editIndex")) {

        id = request.getParameter("id");
        idins = request.getParameter("idins");

        String[] ids = request.getParameter("ids").split("/");

        if (!ids[2].equalsIgnoreCase("null")) {

            String SCENARIO_ID = ids[2];
            String MODEL_ID = ids[3];

            String[] S_PARAMETER = {"ROW_LEN", "USEFUL_SIZE", "MIN_IO_PER_TRAN", "OTHER_ACCESS", "OCCUP_RATE"};

            String[] OLD_VALUE = {request.getParameter("ROW_LEN"), request.getParameter("USEFUL_SIZE"), request.getParameter("MIN_IO_PER_TRAN"), request.getParameter("OTHER_ACCESS"), request.getParameter("OCCUP_RATE")};

            String[] NEW_VALUE = {request.getParameter("ROW_LEN_new"), request.getParameter("USEFUL_SIZE_new"), request.getParameter("MIN_IO_PER_TRAN_new"), request.getParameter("OTHER_ACCESS_new"), request.getParameter("OCCUP_RATE_new")};

            String[] ObjectClass = {"INDEX_DESC", "INDEX_DESC", "INDEX_INST", "INDEX_INST", "INDEX_INST"};

            String[] OBJECT_ID = {id, id, idins, idins, idins};

            u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

        } else {
            String CACHE_DESC_ID = addtoCahceXref(idins, request.getParameterValues("CACHE_DESC_ID[]"), request, response);

            String[][] data = {{"NAME", "USEFUL_SIZE", "INDEX_TYPE_NUM", "ROW_LEN", "DEFAULT_IND"}, {
                request.getParameter("indexname"),
                request.getParameter("USEFUL_SIZE"),
                request.getParameter("INDEX_TYPE_NUM"),
                request.getParameter("ROW_LEN"), "0"
            }};

            out.print(db.setUpdate(XMLDataModel.INDEX_DESC_TABLENAME, data, "ID='" + id + "'"));

            String[][] datains = {{
                "TOT_PG_PER_TRAN",
                "OTHER_ACCESS", "LOGICAL_DRIVE_NAME", "MIN_IO_PER_TRAN", "PHYSICAL_IO", "OCCUP_RATE"

            }, {
                "0.00000", request.getParameter("OTHER_ACCESS"),
                request.getParameter("LOGICAL_DRIVE_NAME"), request.getParameter("MIN_IO_PER_TRAN"), "0.00000", request.getParameter("OCCUP_RATE")
            }};

            out.print(Arrays.deepToString(datains));

            out.print(db.setUpdate(XMLDataModel.INDEX_INST_TABLENAME, datains, "ID='" + idins + "'"));
        }

    } else if (status.equalsIgnoreCase("addIndex")) {

        String mid = Utils.getNewID();

        String midins = Utils.getNewID();

        String CACHE_DESC_ID = addtoCahceXref(midins, request.getParameterValues("CACHE_DESC_ID[]"), request, response);

        String[][] data = {{"ID", "NAME", "TABLE_DESC_ID", "USEFUL_SIZE", "INDEX_TYPE_NUM", "ROW_LEN", "DEFAULT_IND"}, {mid,
            request.getParameter("indexname"), request.getParameter("TABLE_DESC_ID"), request.getParameter("USEFUL_SIZE"), request.getParameter("INDEX_TYPE_NUM"), request.getParameter("ROW_LEN"), "0"
        }};
        out.print(db.setInsert(XMLDataModel.INDEX_DESC_TABLENAME, data));

        String[][] datains = {{"ID", "MODEL_ID", "INDEX_DESC_ID",
            "TABLE_INST_ID", "TOT_PG_PER_TRAN",
            "OTHER_ACCESS", "LOGICAL_DRIVE_NAME", "MIN_IO_PER_TRAN", "PHYSICAL_IO", "OCCUP_RATE"

        }, {midins,
            request.getParameter("mod_id"), mid,
            request.getParameter("TABLE_INST_ID"), "0.00000", request.getParameter("OTHER_ACCESS"),
            request.getParameter("LOGICAL_DRIVE_NAME"), request.getParameter("MIN_IO_PER_TRAN"), "0.00000", request.getParameter("OCCUP_RATE")
        }};
        out.print(db.setInsert(XMLDataModel.INDEX_INST_TABLENAME, datains));

    } else if (status.equalsIgnoreCase("removeIndex")) {
        id = request.getParameter("id");
        out.print(db.setDelete(XMLDataModel.INDEX_DESC_TABLENAME, "ID='" + id + "'"));
    } else if (status.equalsIgnoreCase("removeIndexinst")) {
        id = request.getParameter("id");
        out.print(db.setDelete(XMLDataModel.INDEX_INST_TABLENAME, "ID='" + id + "'"));

        out.print(db.setDelete(XMLDataModel.CACHE_XREF_TABLENAME, "CACHE_USER_ID='" + id + "'"));

    } else if (status.equalsIgnoreCase("getIndexData")) {

        id = request.getParameter("id");
        rdata = db.getRow(XMLDataModel.INDEX_DESC_TABLENAME, "id='" + id + "'");
        outData = Arrays.deepToString(rdata);
    } else if (status.equalsIgnoreCase("getIndexinstData")) {

        id = request.getParameter("id");
        rdata = db.getRow(XMLDataModel.INDEX_INST_TABLENAME, "ID='" + id + "'");
        outData = Arrays.deepToString(rdata);
    } else if (status.equalsIgnoreCase("getIndexScenarioData")) {
        String[] ids = request.getParameter("ids").split("/");
        id = request.getParameter("id");
        idins = request.getParameter("idins");
        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        String[] S_PARAMETER = {"ROW_LEN", "USEFUL_SIZE", "MIN_IO_PER_TRAN", "OTHER_ACCESS", "OCCUP_RATE"};
        
        
            String[] OBJECT_ID = {id, id, idins, idins, idins};

        rdata = u.getScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER);
        outData = Arrays.deepToString(updatePram(rdata));
    } else if (status.equalsIgnoreCase("getcache")) {

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Cache">
    if (status.equalsIgnoreCase("addCache")) {

        String mid = Utils.getNewID();
        String[][] data = {{"ID", "PROJECT_ID", "CACHE_SIZE", "PAGE_SIZE", "CACHE_NAME", "DB_CONFIG_NAME"}, {
            mid,
            request.getParameter("proid"), request.getParameter("poolsize"),
            request.getParameter("pagesize"), request.getParameter("Cachename"),
            request.getParameter("DBinsname")
        }};
        out.print(db.setInsert(XMLDataModel.CACHE_DESC_TABLENAME, data));

        String midins = Utils.getNewID();
        String[][] datains = {{"ID", "MODEL_ID", "CACHE_DESC_ID", "CPU", "PGS_PER_IO", "OTHER_ACCESS", "DB_INST_ID"}, {
            midins,
            request.getParameter("mod_id"), mid, request.getParameter("CPU"),
            request.getParameter("pageper"), request.getParameter("otheraccess"),
            request.getParameter("DBins")
        }};
        out.print(db.setInsert(XMLDataModel.CACHE_INST_TABLENAME, datains));

    } else if (status.equalsIgnoreCase("editCache")) {

        String[] ids = request.getParameter("ids").split("/");

        id = request.getParameter("id");
        idins = request.getParameter("idins");

        if (!ids[2].equalsIgnoreCase("null")) {
            String SCENARIO_ID = ids[2];
            String MODEL_ID = ids[3];

            String[] S_PARAMETER = {"CACHE_SIZE", "PAGE_SIZE", "OTHER_ACCESS", "PGS_PER_IO"};

            String[] OLD_VALUE = {request.getParameter("poolsize"), request.getParameter("pagesize"), request.getParameter("otheraccess"), request.getParameter("pageper")};

            String[] NEW_VALUE = {request.getParameter("poolsize_new"), request.getParameter("pagesize_new"), request.getParameter("otheraccess_new"), request.getParameter("pageper_new")};

            String[] ObjectClass = {"CACHE_DESC", "CACHE_DESC", "CACHE_INST", "CACHE_INST"};
            String[] OBJECT_ID = {id, id, idins, idins};

            u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

        } else {

            String[][] eBdata = {{"CACHE_SIZE", "PAGE_SIZE", "CACHE_NAME"}, {
                request.getParameter("poolsize"), request.getParameter("pagesize"), request.getParameter("Cachename")
            }};

            out.print(db.setUpdate(XMLDataModel.CACHE_DESC_TABLENAME, eBdata, "ID='" + id + "'"));

            String[][] eBdatains = {{"CPU", "PGS_PER_IO", "OTHER_ACCESS", "DB_INST_ID"}, {
                request.getParameter("CPU"), request.getParameter("pageper"), request.getParameter("otheraccess"), request.getParameter("DBins")
            }};

            out.print(db.setUpdate(XMLDataModel.CACHE_INST_TABLENAME, eBdatains, "ID='" + idins + "'"));
            out.print(db.returnSQL);

        }

    } else if (status.equalsIgnoreCase("removeCache")) {
        id = request.getParameter("id");
        out.print(db.setDelete(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + id + "'"));
    } else if (status.equalsIgnoreCase("removeCacheinst")) {
        id = request.getParameter("id");
        out.print(db.setDelete(XMLDataModel.CACHE_INST_TABLENAME, "ID='" + id + "'"));

    } else if (status.equalsIgnoreCase("getCacheDatarows")) {

        db.openCon();
        outData = "";

        id = request.getParameter("id");

        //CACHE_INST_TABLENAME
        ResultSet srdatan = db.getData(XMLDataModel.CACHE_INST_TABLENAME, "*", "DB_INST_ID='" + request.getParameter("id") + "'");
        String[] ids = request.getParameter("ids").split("/");

        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        while (srdatan.next()) {
            String[] rdatar = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + srdatan.getString("CACHE_DESC_ID") + "'");

            if (rdatar[0] != null) {

                idins = srdatan.getString("ID");

                outData += "<tr  data-insid='" + srdatan.getString("ID") + "' data-decid='" + rdatar[0] + "'  >";
                outData += "<td>" + rdatar[3] + "</td>";

                if (ids[2].equalsIgnoreCase("null")) {
                    outData += "<td>" + rdatar[4] + "</td>";
                    outData += "<td>" + rdatar[5] + "</td>";
                    outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdatan.getString("PGS_PER_IO")), 0) + "</td>";
                    outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdatan.getString("CPU")), 0) + "</td>";
                    outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdatan.getString("OTHER_ACCESS")), 0) + "</td>";

                } else {
                    //  1410462944161           String[] S_PARAMETER = {"CACHE_SIZE", "PAGE_SIZE", "OTHER_ACCESS", "PGS_PER_IO"};

                    outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdatar[0], "CACHE_SIZE"), rdatar[4]) + "</td>";
                    outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdatar[0], "PAGE_SIZE"), rdatar[5]) + "</td>";
                    
                    outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdatan.getString("id"), "PGS_PER_IO"), Utils.numberFormat(Double.parseDouble(srdatan.getString("PGS_PER_IO")), 0)) + "</td>";
                    
                    outData += "<td>" + Utils.numberFormat(Double.parseDouble(srdatan.getString("CPU")), 0) + "</td>";
                    outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdatan.getString("id"), "OTHER_ACCESS"), Utils.numberFormat(Double.parseDouble(srdatan.getString("OTHER_ACCESS")), 0)) + "</td>";

                }
                outData += "<td>0</td>";
                outData += "</tr>";

            }

        }
        db.closeCon();
    } else if (status.equalsIgnoreCase("getCacheDataOptions")) {

        db.openCon();
        id = request.getParameter("id");
        String[] values = request.getParameter("value").split(",");

        srdata = db.getData(XMLDataModel.CACHE_INST_TABLENAME, "*", "DB_INST_ID='" + id + "'");
        while (srdata.next()) {

            rdata = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + srdata.getString("CACHE_DESC_ID") + "'");

            String selected = "";

            for (String value : values) {

                if (value.equalsIgnoreCase(rdata[0])) {

                    selected = " selected ";
                }
            }

            outData += "<option " + selected + "  value='" + rdata[0] + "'>" + rdata[3] + "</option>";

        }

        db.closeCon();
    } else if (status.equalsIgnoreCase("getCacheData")) {

        id = request.getParameter("id");
        rdata = db.getRow(XMLDataModel.CACHE_DESC_TABLENAME, "id='" + id + "'");
        outData = Arrays.deepToString(rdata);
    } else if (status.equalsIgnoreCase("getCacheinstData")) {

        id = request.getParameter("id");
        rdata = db.getRow(XMLDataModel.CACHE_INST_TABLENAME, "ID='" + id + "'");
        outData = Arrays.deepToString(rdata);
    } else if (status.equalsIgnoreCase("getCacheScenarioData")) {
        String[] ids = request.getParameter("ids").split("/");
        String SCENARIO_ID = ids[2];

        id = request.getParameter("id");
        idins = request.getParameter("idins");
        String MODEL_ID = ids[3];
        String[] S_PARAMETER = {"CACHE_SIZE", "PAGE_SIZE", "OTHER_ACCESS", "PGS_PER_IO"};
        String[] OBJECT_ID = {id, id, idins, idins};
        rdata = u.getScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER);
        outData = Arrays.deepToString(updatePram(rdata));
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="NAMESPACE">
    if (status.equalsIgnoreCase("addDB_NAMESPACE")) {

        String mid = Utils.getNewID();
        String[][] data = {{"ID", "PROJECT_ID", "NAME"}, {mid,
            request.getParameter("proid"), request.getParameter("name")
        }};
        out.print(db.setInsert(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, data));

        String midins = Utils.getNewID();
        String[][] datains = {{"ID", "MODEL_ID", "DB_NAMESPACE_DESC_ID", "DB_INST_ID"}, {midins,
            request.getParameter("mod_id"), mid, request.getParameter("DBins")
        }};
        out.print(db.setInsert(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, datains));

    } else if (status.equalsIgnoreCase("getDB_NAMESPACE")) {

        db.openCon();
        id = request.getParameter("id");
        srdata = db.getData(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "*", "DB_INST_ID='" + id + "'");

        while (srdata.next()) {

            rdata = db.getRowNocon(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "ID='" + srdata.getString("DB_NAMESPACE_DESC_ID") + "'");

            outData += "<option  value='" + srdata.getString("DB_NAMESPACE_DESC_ID") + "' >" + rdata[2] + "</option>";

        }

        db.closeCon();

    } else if (status.equalsIgnoreCase("getDB_NAMESPACE_INST_ID")) {

        id = request.getParameter("id");
        outData = "" + db.getRow(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "DB_NAMESPACE_DESC_ID='" + id + "'")[0];
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Buffer">
    if (status.equalsIgnoreCase("getLOGICALDRIVEOptions")) {

        String ids = request.getParameter("ids");

        String nodid1 = ids.split("/")[1];

        ServerNodeOperations s = new ServerNodeOperations();

        String noid = s.getConnectedStorageNode(nodid1);

        //  outData = noid;
        String[] data = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + noid);

        db.openCon();
        ResultSet lds = db.getData(XMLDataModel.LOGICAL_DRIVE_INST_TABLENAME, "*", "server_inst_id=" + data[0]);
        String value = request.getParameter("value");

        while (lds.next()) {
            String selected = "";

            if (value.equalsIgnoreCase(lds.getString("NAME"))) {

                selected = " selected ";
            }

            outData += "<option " + selected + "  value='" + lds.getString("NAME") + "'>" + lds.getString("NAME") + "</option>";
        }

        db.closeCon();
    }

    //</editor-fold>
    //</editor-fold>
    out.print(outData);


%>  


<%!
    lib.engine.db.operations db = new lib.engine.db.operations();
    String test = "";

    String updatePram(String v, String o) {
        return (v.equalsIgnoreCase("-1")) ? o : v;
    }

    String[] updatePram(String[] vs) {
        String r[] = new String[vs.length];
        for (int i = 0; i < vs.length; i++) {
            r[i] = (vs[i].equalsIgnoreCase("-1")) ? "" : vs[i];
        }
        return r;
    }

    String addtoCahceXref(String userid, String[] CACHE_DESC_IDs, HttpServletRequest request, HttpServletResponse response) {

        String CACHE_DESC_ID = "";
        db.setDelete(XMLDataModel.CACHE_XREF_TABLENAME, "CACHE_USER_ID='" + userid + "'");

        for (String a : CACHE_DESC_IDs) {

            if (CACHE_DESC_ID.equals("")) {
                CACHE_DESC_ID = a;
            }

            String midix = Utils.getNewID();

            String[] rdata = db.getRow(XMLDataModel.CACHE_INST_TABLENAME, "CACHE_DESC_ID='" + a + "'");

            String[][] datax = {{"ID", "CACHE_USER_ID", "CACHE_INST_ID", "MODEL_ID"

            }, {midix, userid, rdata[0], request.getParameter("mod_id")
            }};

            test += Arrays.deepToString(datax);
            test += db.setInsert(XMLDataModel.CACHE_XREF_TABLENAME, datax);

        }
        return CACHE_DESC_ID;
    }

    String getCahceXref(String userid, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String r = "";

        db.openCon();
        ResultSet srdata = db.getData(XMLDataModel.CACHE_XREF_TABLENAME, "", "CACHE_USER_ID='" + userid + "'");
        while (srdata.next()) {
            String[] rdatainst = db.getRowNocon(XMLDataModel.CACHE_INST_TABLENAME, "ID='" + srdata.getString("CACHE_INST_ID") + "'");
            String[] rdata = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + rdatainst[1] + "'");
            r += rdata[0] + ",";
        }
        db.closeCon();
        return r;
    }


%>





