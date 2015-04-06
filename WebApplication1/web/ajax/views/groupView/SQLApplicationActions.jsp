<%@page import="java.util.Arrays"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%
    String Status = request.getParameter("status");
    xact.utils u = new xact.utils();
//  
if (Status.equalsIgnoreCase("getsqlid")) {
    
    /*
    String[] APPLICATION_COMPONENT_INST_data = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID='" + request.getParameter("ACI_ID") + "'");
        String[] APPLICATION_COMPONENT_Data = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + APPLICATION_COMPONENT_INST_data[3] + "'");
        String[] APPLICATION_COMPONENT_DESC_Data = db.getRow(XMLDataModel.application_component_desc_TABLENAME, "ID='" + APPLICATION_COMPONENT_INST_data[2] + "'");
    
    */
  String[] sql_app = db.getRow(XMLDataModel.SQL_APPLICATION_INST_TABLENAME, "AC_INST_ID=" + request.getParameter("ACI_ID"));
        outData = sql_app[1] + ";" + sql_app[0];


}else
    if (Status.equalsIgnoreCase("ceatrsql")) {
        outData = "";
        String[] APPLICATION_COMPONENT_INST_data = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID='" + request.getParameter("ACI_ID") + "'");
        String[] APPLICATION_COMPONENT_Data = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + APPLICATION_COMPONENT_INST_data[3] + "'");
        String[] APPLICATION_COMPONENT_DESC_Data = db.getRow(XMLDataModel.application_component_desc_TABLENAME, "ID='" + APPLICATION_COMPONENT_INST_data[2] + "'");

        String mid = Utils.getNewID();
        String[][] data = {{"ID", "MODEL_ID", "AC_ID", "NAME"}, {
            mid, request.getParameter("mod_id"), APPLICATION_COMPONENT_INST_data[3], APPLICATION_COMPONENT_INST_data[6]
        }};

        out.print(db.setInsert(XMLDataModel.SQL_APPLICATION_DESC_TABLENAME, data));
        String midins = Utils.getNewID();
        String[][] datains = {
            {"ID", "MODEL_ID", "SQL_APPLICATION_DESC_ID", "AC_INST_ID", "NUM_TRANS_BEFORE", "CPU_BEFORE", "IO_BEFORE", "TOTAL_ORDERS", "ACTIVATION"},
            {midins, request.getParameter("mod_id"), mid, APPLICATION_COMPONENT_INST_data[0], "0.0000", "0.0000", "0.0000", "1", "0"}
        };
        out.print(db.setInsert(XMLDataModel.SQL_APPLICATION_INST_TABLENAME, datains));

        outData = mid + ";" + midins;
    }

    //////////////////////////////////////////////////////////////stored
    if (Status.equalsIgnoreCase("addstored")) {
        outData = "";
        //SQL_APPLICATION_INST_ID
        String mid = Utils.getNewID();
        String[][] data = {{"ID", "MODEL_ID", "SQL_APPLICATION_DESC_ID", "WEIGHT", "NAME"}, {
            mid, request.getParameter("mod_id"), request.getParameter("SQL_APPLICATION_DESC_ID"), request.getParameter("WEIGHT"), request.getParameter("Name")
        }};

        //out.print(Arrays.deepToString(data));
        out.print(db.setInsert(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, data));

        String midins = Utils.getNewID();
        String[][] datains = {
            {"ID", "MODEL_ID", "SQL_COMPONENT_DESC_ID", "SQL_APPLICATION_INST_ID", "ORDER_FREQ", "TOTAL_ORDERS"},
            {midins, request.getParameter("mod_id"), mid, request.getParameter("SQL_APPLICATION_INST_ID"), request.getParameter("ORDER_FREQ"), "0"}
        };
        out.print(db.setInsert(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, datains));

    } else if (Status.equalsIgnoreCase("editstored")) {

        outData = "";

        String id = request.getParameter("id");
        String idins = request.getParameter("idins");

        String[] ids = request.getParameter("ids").split("/");

        if (!ids[2].equalsIgnoreCase("null")) {

            String SCENARIO_ID = ids[2];
            String MODEL_ID = ids[3];
            String[] S_PARAMETER = {"WEIGHT", "ORDER_FREQ"};
            String[] OLD_VALUE = {request.getParameter("WEIGHT"), request.getParameter("ORDER_FREQ")};
            String[] NEW_VALUE = {request.getParameter("WEIGHT_new"), request.getParameter("ORDER_FREQ_new")};
            String[] ObjectClass = {"SQL_COMPONENT_DESC", "SQL_COMPONENT_INST"};
            String[] OBJECT_ID = {id, idins};
            u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

        } else {

            String[][] data = {{"WEIGHT", "NAME"}, {
                request.getParameter("WEIGHT"), request.getParameter("NAME")
            }};
            out.print(db.setUpdate(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, data, "id='" + id + "'"));

            String[][] datains = {
                {"ORDER_FREQ"},
                {request.getParameter("ORDER_FREQ")}
            };
            out.print(db.setUpdate(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, datains, "id='" + idins + "'"));

        }

    } else if (Status.equalsIgnoreCase("deletestored")) {
        outData = "";
        String delid = request.getParameter("id");

        String[] rdata = db.getRow(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, "ID='" + delid + "'");

        out.print(db.setDelete(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, "ID='" + delid + "'"));
        if (rdata.length > 1) {
            if (rdata[0] != null) {
                out.print(db.setDelete(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, "SQL_COMPONENT_DESC_ID='" + rdata[0] + "'"));
            }
        }
    } else if (Status.equalsIgnoreCase("getstored")) {
        outData = "";
        db.openCon();

        ResultSet srdatan = db.getData(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, "*", "SQL_APPLICATION_DESC_ID='" + request.getParameter("id") + "'");

        while (srdatan.next()) {
            String[] rdata = db.getRowNocon(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, "SQL_COMPONENT_DESC_ID='" + srdatan.getString("ID") + "'");

            if (rdata.length > 1) {
                if (rdata[0] != null) {
                    outData += "<option  data-idins='" + rdata[0] + "'   value='" + srdatan.getString("ID") + "'>" + srdatan.getString("NAME") + "</option>";
                }
            }
        }
        db.closeCon();

    } else if (Status.equalsIgnoreCase("storedNamesInfo")) {
        outData = "";
        db.openCon();
        String[] ids = request.getParameter("ids").split("/");
        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        ResultSet srdatan = db.getData(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, "*", "ID='" + request.getParameter("id") + "'");

        while (srdatan.next()) {
            String[] rdata = db.getRowNocon(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, "SQL_COMPONENT_DESC_ID='" + srdatan.getString("ID") + "'");

            if (!ids[2].equalsIgnoreCase("null")) {

                outData += "<div class='info '><label>User and Architecture Weight: </label><span class=''>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, srdatan.getString("ID"), "WEIGHT"), Utils.numberFormat(Double.parseDouble(srdatan.getString("WEIGHT")), 0))
                        + "</span>"
                        + "</div><div class='info '><label>Number Per Transaction: </label><span class=''>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "ORDER_FREQ"), Utils.numberFormat(Double.parseDouble(rdata[4]), 0)) + "</span></div>";

                //     String[] S_PARAMETER = {"WEIGHT", "ORDER_FREQ"};
            } else {
                outData += "<div class='info '><label>User and Architecture Weight: </label><span class=''>" + Utils.numberFormat(Double.parseDouble(srdatan.getString("WEIGHT")), 0) + "</span>"
                        + "</div><div class='info '><label>Number Per Transaction: </label><span class=''>" + Utils.numberFormat(Double.parseDouble(rdata[4]), 0) + "</span></div>";
            }
        }
        db.closeCon();

    } else if (Status.equalsIgnoreCase("getstoredrow")) {
        outData = "";
        String id = request.getParameter("id");
        String[] rdata = db.getRow(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, "ID='" + id + "'");

        outData = Arrays.deepToString(rdata);

    } else if (Status.equalsIgnoreCase("getstoredinsrow")) {

        outData = "";
        String id = request.getParameter("id");

        String[] rdata = db.getRow(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, "ID='" + id + "'");
        outData = Arrays.deepToString(rdata);

    } else if (Status.equalsIgnoreCase("getstoredScenarioData")) {
        String[] ids = request.getParameter("ids").split("/");
        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        String id = request.getParameter("id");
        String idins = request.getParameter("idins");
        String[] OBJECT_ID = {id, idins};

        String[] S_PARAMETER = {"WEIGHT", "ORDER_FREQ"};
        String[] rdata = u.getScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER);
        outData = Arrays.deepToString(updatePram(rdata));
    }

    //
////////////////////////////////////////////////////////////addComplex
    if (Status.equalsIgnoreCase("addComplex")) {
        outData = "";
        String mid = Utils.getNewID();
        String[][] data = {{"ID", "MODEL_ID", "SQL_COMPONENT_DESC_ID", "NAME", "TYPE"}, {
            mid, request.getParameter("mod_id"), request.getParameter("SQL_COMPONENT_DESC_ID"), request.getParameter("NAME"), request.getParameter("TYPE")
        }};

        out.print(db.setInsert(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME, data));
        String midins = Utils.getNewID();
        String[][] datains = {
            {"ID", "MODEL_ID", "COMPLEX_SQL_DESC_ID", "SQL_COMPONENT_INST_ID", "ORDER_FREQ"},
            {midins, request.getParameter("mod_id"),
                mid,
                request.getParameter("SQL_COMPONENT_INST_ID"), request.getParameter("ORDER_FREQ")
            }
        };
        out.print(db.setInsert(XMLDataModel.COMPLEX_SQL_INST_TABLENAME, datains));

    } else if (Status.equalsIgnoreCase("editComplex")) {

        outData = "";
        String id = request.getParameter("id");
        String idins = request.getParameter("idins");

        String[] ids = request.getParameter("ids").split("/");

        if (!ids[2].equalsIgnoreCase("null")) {

            String SCENARIO_ID = ids[2];
            String MODEL_ID = ids[3];
            String[] S_PARAMETER = {"ORDER_FREQ"};
            String[] OLD_VALUE = {request.getParameter("ORDER_FREQ")};
            String[] NEW_VALUE = {request.getParameter("ORDER_FREQ_new")};
            String[] ObjectClass = {"COMPLEX_SQL_INST"};
            String[] OBJECT_ID = {idins};
            u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

        } else {

            String[][] data = {{"SQL_COMPONENT_DESC_ID", "NAME", "TYPE"}, {
                request.getParameter("SQL_COMPONENT_DESC_ID"), request.getParameter("NAME"), request.getParameter("TYPE")
            }};

            out.print(db.setUpdate(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME, data, "ID='" + id + "'"));

            String[][] datains = {
                {"SQL_COMPONENT_INST_ID", "ORDER_FREQ"},
                {
                    request.getParameter("SQL_COMPONENT_INST_ID"), request.getParameter("ORDER_FREQ")
                }
            };
            out.print(db.setUpdate(XMLDataModel.COMPLEX_SQL_INST_TABLENAME, datains, "ID='" + idins + "'"));
        }

    } else if (Status.equalsIgnoreCase("getComplexrow")) {
        outData = "";
        String id = request.getParameter("id");
        String[] rdata = db.getRow(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME, "ID='" + id + "'");

        outData = Arrays.deepToString(rdata);

    } else if (Status.equalsIgnoreCase("getCompleXScenarioData")) {
        String id = request.getParameter("id");
        String idins = request.getParameter("idins");
        String[] ids = request.getParameter("ids").split("/");
        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        String[] OBJECT_ID = {idins};

        String[] S_PARAMETER = {"ORDER_FREQ"};
        String[] rdata = u.getScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER);
        outData = Arrays.deepToString(updatePram(rdata));

    } else if (Status.equalsIgnoreCase("getComplexinsrow")) {
        outData = "";
        String id = request.getParameter("id");
        String[] rdata = db.getRow(XMLDataModel.COMPLEX_SQL_INST_TABLENAME, "ID='" + id + "'");
        outData = Arrays.deepToString(rdata);

    } else if (Status.equalsIgnoreCase("deleteComplex")) {
        outData = "";
        String delid = request.getParameter("id");

        String[] rdata = db.getRow(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME, "ID='" + delid + "'");

        out.print(db.setDelete(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME, "ID='" + delid + "'"));
        if (rdata.length > 1) {
            if (rdata[0] != null) {
                out.print(db.setDelete(XMLDataModel.COMPLEX_SQL_INST_TABLENAME, "COMPLEX_SQL_DESC_ID='" + rdata[0] + "'"));
            }
        }
    } else if (Status.equalsIgnoreCase("getComplexRows")) {

        db.openCon();
        outData = "";

        String id = request.getParameter("id");

        ResultSet srdatac = db.getData(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME, "*", "SQL_COMPONENT_DESC_ID='" + id + "'");
        String[] ids = request.getParameter("ids").split("/");
        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        while (srdatac.next()) {
            String[] rdata = db.getRowNocon(XMLDataModel.COMPLEX_SQL_INST_TABLENAME, "COMPLEX_SQL_DESC_ID='" + srdatac.getString("ID") + "'");

            outData += "<tr  data-insid='" + rdata[0] + "' data-decid='" + srdatac.getString("ID") + "'  >";

            outData += "<td>" + srdatac.getString("NAME") + "</td>";

            outData += "<td>" + getComType(Integer.parseInt(srdatac.getString("TYPE"))) + "</td>";

            if (rdata[4] != null) {

                if (!ids[2].equalsIgnoreCase("null")) {
                    outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "ORDER_FREQ"), Utils.numberFormat(Double.parseDouble(rdata[4]), 0)) + "</td>";

                } else {
                    outData += "<td>" + Utils.numberFormat(Double.parseDouble(rdata[4]), 0) + "</td>";

                }

            }

            outData += "</tr>";

        }

        db.closeCon();
    }

    //////////////////////////////////////////////////////////////addComplex
    //////////////////////////////////////////////////////////////addBase
    if (Status.equalsIgnoreCase("addBase")) {
        outData = "";
        //SQL_APPLICATION_INST_ID
        String mid = Utils.getNewID();

        if ((request.getParameter("INDEX_DESC_ID") == null) || (request.getParameter("INDEX_DESC_ID").equalsIgnoreCase("null")) || (request.getParameter("INDEX_DESC_ID").equalsIgnoreCase("0"))) {

            String[][] data = {{"ID", "MODEL_ID", "TABLE_DESC_ID", "SQL_COMPONENT_DESC_ID", "NAME", "ORDER_TYPE", "NUM_MONOTONIES"}, {
                mid, request.getParameter("mod_id"),
                request.getParameter("TABLE_DESC_ID"),
                request.getParameter("SQL_COMPONENT_DESC_ID"),
                request.getParameter("NAME"),
                request.getParameter("ORDER_TYPE"),
                request.getParameter("NUM_MONOTONIES")
            }};

            out.print(db.setInsert(XMLDataModel.BASE_SQL_DESC_TABLENAME, data));

        } else {

            String[][] data = {{"ID", "MODEL_ID", "TABLE_DESC_ID", "SQL_COMPONENT_DESC_ID", "INDEX_DESC_ID", "NAME", "ORDER_TYPE", "NUM_MONOTONIES"}, {
                mid, request.getParameter("mod_id"),
                request.getParameter("TABLE_DESC_ID"),
                request.getParameter("SQL_COMPONENT_DESC_ID"),
                request.getParameter("INDEX_DESC_ID"),
                request.getParameter("NAME"),
                request.getParameter("ORDER_TYPE"),
                request.getParameter("NUM_MONOTONIES")
            }};

            out.print(db.setInsert(XMLDataModel.BASE_SQL_DESC_TABLENAME, data));

        }

        String midins = Utils.getNewID();
        String[][] datains = {
            {"ID", "MODEL_ID", "BASE_SQL_DESC_ID", "SQL_COMPONENT_INST_ID", "TABLE_INST_ID", "ORDER_FREQ", "JOIN_MISSES", "ACCESS_PER_TRAN", "DISPERSMENT", "PREFETCH"},
            {midins, request.getParameter("mod_id"), mid, request.getParameter("SQL_COMPONENT_INST_ID"),
                request.getParameter("TABLE_INST_ID"), request.getParameter("ORDER_FREQ"), request.getParameter("JOIN_MISSES"), "1.0", request.getParameter("DISPERSMENT"), request.getParameter("PREFETCH")
            }
        };
        out.print(db.setInsert(XMLDataModel.BASE_SQL_INST_TABLENAME, datains));

    } else if (Status.equalsIgnoreCase("editBase")) {
        outData = "";

        String id = request.getParameter("id");
        String idins = request.getParameter("idins");

        String[] ids = request.getParameter("ids").split("/");

        if (!ids[2].equalsIgnoreCase("null")) {

            String SCENARIO_ID = ids[2];
            String MODEL_ID = ids[3];

            /*
        
             ORDER_FREQ
             JOIN_MISSES
             PREFETCH
             DISPERSMENT
             ACCESS_PER_TRAN
             */
            String[] S_PARAMETER = {"ORDER_FREQ", "JOIN_MISSES", "PREFETCH", "DISPERSMENT", "ACCESS_PER_TRAN"};
            String[] OLD_VALUE = {request.getParameter("ORDER_FREQ"), request.getParameter("JOIN_MISSES"), request.getParameter("PREFETCH"), request.getParameter("DISPERSMENT"), request.getParameter("ACCESS_PER_TRAN")};
            String[] NEW_VALUE = {request.getParameter("ORDER_FREQ_new"), request.getParameter("JOIN_MISSES_new"), request.getParameter("PREFETCH_new"), request.getParameter("DISPERSMENT_new"), request.getParameter("ACCESS_PER_TRAN_new")};
            String[] ObjectClass = {"BASE_SQL_INST", "BASE_SQL_INST", "BASE_SQL_INST", "BASE_SQL_INST", "BASE_SQL_INST"};
            String[] OBJECT_ID = {idins, idins, idins, idins, idins};
            u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

        } else {

//SQL_APPLICATION_INST_ID
            if ((request.getParameter("INDEX_DESC_ID") == null) || (request.getParameter("INDEX_DESC_ID").equalsIgnoreCase("null")) || (request.getParameter("INDEX_DESC_ID").equalsIgnoreCase("0"))
                    || (request.getParameter("INDEX_DESC_ID").trim().equalsIgnoreCase(""))) {

                String[][] data = {{"TABLE_DESC_ID", "SQL_COMPONENT_DESC_ID", "NAME", "ORDER_TYPE", "NUM_MONOTONIES"}, {
                    request.getParameter("TABLE_DESC_ID"),
                    request.getParameter("SQL_COMPONENT_DESC_ID"),
                    request.getParameter("NAME"),
                    request.getParameter("ORDER_TYPE"),
                    request.getParameter("NUM_MONOTONIES")
                }};

                out.print(db.setUpdate(XMLDataModel.BASE_SQL_DESC_TABLENAME, data, "ID='" + id + "'"));

            } else {

                String[][] data = {{"TABLE_DESC_ID", "SQL_COMPONENT_DESC_ID", "INDEX_DESC_ID", "NAME", "ORDER_TYPE", "NUM_MONOTONIES"}, {
                    request.getParameter("TABLE_DESC_ID"),
                    request.getParameter("SQL_COMPONENT_DESC_ID"),
                    ((request.getParameter("INDEX_DESC_ID") == null) || (request.getParameter("INDEX_DESC_ID").equalsIgnoreCase("null")) || (request.getParameter("INDEX_DESC_ID").equalsIgnoreCase("0")) ? "0" : request.getParameter("INDEX_DESC_ID")),
                    request.getParameter("NAME"),
                    request.getParameter("ORDER_TYPE"),
                    request.getParameter("NUM_MONOTONIES")
                }};

                out.print(db.setUpdate(XMLDataModel.BASE_SQL_DESC_TABLENAME, data, "ID='" + id + "'"));

            }

            String[][] datains = {
                {"SQL_COMPONENT_INST_ID", "TABLE_INST_ID", "ORDER_FREQ", "JOIN_MISSES", "ACCESS_PER_TRAN", "DISPERSMENT", "PREFETCH"},
                {request.getParameter("SQL_COMPONENT_INST_ID"),
                    request.getParameter("TABLE_INST_ID"), request.getParameter("ORDER_FREQ"), request.getParameter("JOIN_MISSES"), "1.0", request.getParameter("DISPERSMENT"), request.getParameter("PREFETCH")
                }
            };

            out.print(db.setUpdate(XMLDataModel.BASE_SQL_INST_TABLENAME, datains, "ID='" + idins + "'"));

        }

    } else if (Status.equalsIgnoreCase("getBaserow")) {
        outData = "";
        outData = Arrays.deepToString(db.getRow(XMLDataModel.BASE_SQL_DESC_TABLENAME, "ID='" + request.getParameter("id") + "'"));

    } else if (Status.equalsIgnoreCase("getBaseInstrow")) {
        outData = "";
        String id = request.getParameter("id");
        String[] rdata = db.getRow(XMLDataModel.BASE_SQL_INST_TABLENAME, "ID='" + id + "'");
        outData = Arrays.deepToString(rdata);

    } else if (Status.equalsIgnoreCase("getBaseScenarioData")) {

        String[] ids = request.getParameter("ids").split("/");

        String id = request.getParameter("id");
        String idins = request.getParameter("idins");
        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        String[] OBJECT_ID = {idins, idins, idins, idins, idins};

        String[] S_PARAMETER = {"ORDER_FREQ", "JOIN_MISSES", "PREFETCH", "DISPERSMENT", "ACCESS_PER_TRAN"};
        String[] rdata = u.getScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER);
        outData = Arrays.deepToString(updatePram(rdata));

    } else if (Status.equalsIgnoreCase("deleteBase")) {
        outData = "";
        String delid = request.getParameter("id");

        String[] rdata = db.getRow(XMLDataModel.BASE_SQL_DESC_TABLENAME, "ID='" + delid + "'");

        out.print(db.setDelete(XMLDataModel.BASE_SQL_DESC_TABLENAME, "ID='" + delid + "'"));
        if (rdata.length > 1) {
            if (rdata[0] != null) {
                out.print(db.setDelete(XMLDataModel.BASE_SQL_INST_TABLENAME, "BASE_SQL_DESC_ID='" + rdata[0] + "'"));
            }
        }
    } else if (Status.equalsIgnoreCase("getNAMESPACEOptions")) {
        outData = "";
        String SERVER_INST_ID = request.getParameter("id");
        String[] complex0 = db.getRowMinData(XMLDataModel.COMPLEX_INST_TABLENAME, "SERVER_INST_ID='" + SERVER_INST_ID + "'");
        String partition0 = db.getRowMinData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "COMPLEX_INST_ID='" + complex0[0] + "'")[0];
        String DBInstance = db.getRow(XMLDataModel.DB_INST_TABLENAME, "LOGICAL_SERVER_INST_ID='" + partition0 + "'")[0];
        db.openCon();
        ResultSet srdata = db.getData(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "*", "DB_INST_ID='" + DBInstance + "'");

        outData = "<option   value='0'></option>";

        while (srdata.next()) {
            String[] DB_NAMESPACEData = db.getRowNocon(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "ID='" + srdata.getString("DB_NAMESPACE_DESC_ID") + "'");

            outData += "<option  data-idins='" + srdata.getString("ID") + "'   value='" + DB_NAMESPACEData[0] + "'>" + DB_NAMESPACEData[2] + "</option>";
        }
        db.closeCon();
    } else if (Status.equalsIgnoreCase("getTableOptions")) {
        outData = "";
        db.openCon();
        String id = request.getParameter("id");
        ResultSet srdata = db.getData(XMLDataModel.TABLE_DESC_TABLENAME, "*", "DB_NAMESPACE_DESC_ID='" + id + "'");

        outData = "<option   value='0'></option>";

        while (srdata.next()) {
            String[] DB_INS = db.getRowNocon(XMLDataModel.TABLE_INST_TABLENAME, " TABLE_DESC_ID='" + srdata.getString("ID") + "'");

            outData += "<option    data-idins='" + DB_INS[0] + "'   value='" + srdata.getString("ID") + "'>" + srdata.getString("NAME") + "</option>";
        }
        db.closeCon();
    } else if (Status.equalsIgnoreCase("getIndexOptions")) {
        outData = "";
        db.openCon();
        String id = request.getParameter("id");
        ResultSet srdata = db.getData(XMLDataModel.INDEX_DESC_TABLENAME, "*", "TABLE_DESC_ID='" + id + "'");
        outData = "<option   value='0'></option>";

        while (srdata.next()) {
            String[] DB_INS = db.getRowNocon(XMLDataModel.INDEX_INST_TABLENAME, " INDEX_DESC_ID='" + srdata.getString("ID") + "'");

            outData += "<option  data-idins='" + DB_INS[0] + "'   value='" + srdata.getString("ID") + "'>" + srdata.getString("NAME") + "</option>";
        }

        db.closeCon();

    } else if (Status.equalsIgnoreCase("getTableOption")) {
        outData = "";
        db.openCon();
        String id = request.getParameter("id");
        ResultSet srdata = db.getData(XMLDataModel.TABLE_DESC_TABLENAME, "*", "ID='" + id + "'");
        while (srdata.next()) {
            String[] DB_INS = db.getRowNocon(XMLDataModel.TABLE_INST_TABLENAME, " TABLE_DESC_ID='" + srdata.getString("ID") + "'");

            outData += "<option    data-idins='" + DB_INS[0] + "'   value='" + srdata.getString("ID") + "'>" + srdata.getString("NAME") + "</option>";
        }
        db.closeCon();
    } else if (Status.equalsIgnoreCase("getIndexOption")) {
        outData = "";
        db.openCon();
        String id = request.getParameter("id");
        ResultSet srdata = db.getData(XMLDataModel.INDEX_DESC_TABLENAME, "*", "ID='" + id + "'");
        while (srdata.next()) {
            String[] DB_INS = db.getRowNocon(XMLDataModel.INDEX_INST_TABLENAME, " INDEX_DESC_ID='" + srdata.getString("ID") + "'");

            outData += "<option  data-idins='" + DB_INS[0] + "'   value='" + srdata.getString("ID") + "'>" + srdata.getString("NAME") + "</option>";
        }

        db.closeCon();

    } else if (Status.equalsIgnoreCase("getBaseRows")) {
        outData = "";
        db.openCon();
        outData = "";
        String id = request.getParameter("id");
        String isScenario = request.getParameter("isScenario");
        srdata = db.getData(XMLDataModel.BASE_SQL_DESC_TABLENAME, "*", "SQL_COMPONENT_DESC_ID='" + id + "'");
        String[] ids = request.getParameter("ids").split("/");

        String SCENARIO_ID = ids[2];
        String MODEL_ID = ids[3];
        while (srdata.next()) {
            String[] rdata = db.getRowNocon(XMLDataModel.BASE_SQL_INST_TABLENAME, "BASE_SQL_DESC_ID='" + srdata.getString("ID") + "'");

            String[] TableData = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME, " ID='" + srdata.getString("TABLE_DESC_ID") + "'");

            String[] IndexData = db.getRowNocon(XMLDataModel.INDEX_DESC_TABLENAME, " ID='" + srdata.getString("INDEX_DESC_ID") + "'");

            String a = "0";
            String b = "0";
            String c = "0";

            if (rdata[5] != null) {

                a = rdata[5];
            }
            if (rdata[8] != null) {

                b = rdata[8];
            }
            if (rdata[9] != null) {

                c = rdata[9];
            }

            outData += "<tr  data-insid='" + rdata[0] + "' data-decid='" + srdata.getString("ID") + "'  >";
            outData += "<td>" + srdata.getString("NAME") + "</td>";
            outData += "<td>" + getOrderType(Integer.parseInt(srdata.getString("ORDER_TYPE"))) + "</td>";
            outData += "<td>" + TableData[1] + "</td>";
            outData += "<td>" + ((IndexData[1] == null) ? "!!!!" : IndexData[1]) + "</td>";

            if (!ids[2].equalsIgnoreCase("null")) {

                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "ORDER_FREQ"), Utils.numberFormat(Double.parseDouble(a), 0)) + "</td>";

                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "DISPERSMENT"), Utils.numberFormat(Double.parseDouble(b), 0)) + "</td>";
                outData += "<td>" + updatePram(u.getISScenarioPram(MODEL_ID, SCENARIO_ID, rdata[0], "PREFETCH"), Utils.numberFormat(Double.parseDouble(a), 0)) + "</td>";

            } else {
                outData += "<td>" + Utils.numberFormat(Double.parseDouble(a), 0) + "</td>";
                outData += "<td>" + Utils.numberFormat(Double.parseDouble(b), 0) + "</td>";
                outData += "<td>" + Utils.numberFormat(Double.parseDouble(c), 0) + "</td>";

            }

            outData += "</tr>";

        }

        db.closeCon();

    }
    if (outData.equals("")) {

        outData += "<br/>";
    }
    out.print(outData.trim());
%>

<%!
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

    String outData = "";
    lib.engine.db.operations db = new lib.engine.db.operations();
    ResultSet srdata = null;

    String getOrderType(int id) {
        String r = "";
        String[] data = new String[]{"Count", "Direct Read", "Generic Read", "Sequential Read", "Insert", "Update", "Delete", "Sort", "Cursor", "Fetch", "Unload"};

        return data[id];
    }

    String getComType(int id) {
        String r = "";
        String[] data = new String[]{"Nested", "Join"};
        return data[id];
    }

%>


