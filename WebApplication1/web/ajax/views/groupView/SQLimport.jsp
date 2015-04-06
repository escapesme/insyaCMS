<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.tools.files"%>
<%
    String filename = request.getParameter("loction") + "/" + request.getParameter("filename");

    String status = request.getParameter("status");
    ArrayList<String[]> datacsv = f.ImportCSV(filename, request, response);

    String r = status;
    String MODEL_ID = request.getParameter("mod_id");

    if (status.equalsIgnoreCase("sql")) {

        r += " Application,Component,Number Per,User/Architectre,Base SQL,Table,Index,Monotony,Fraction,Cluster,SQL,Pre-fetch,Number In,Complex SQL,Complex,Complex Number\n";
        for (int i = 0; i < datacsv.size(); i++) {
            if (i > 1) {
                String[] m = datacsv.get(i);
                r += addSQL(m, request, response);
            }
        }
    }

    out.print(test);

    f.exportCSV("log-" + Utils.getNewID() + ".csv", r, request, response);

%>



<%!
    lib.engine.db.operations db = new lib.engine.db.operations();

    String test = "";
    String error = "";
    files f = new files();

    String[] isInSQLComponentList(String lsiID, String name) throws SQLException {

        String[] r = new String[2];
        db.openCon();

        ResultSet srdata = db.getData(XMLDataModel.BASE_SQL_DESC_TABLENAME, "*", "SQL_COMPONENT_DESC_ID='" + lsiID + "' ");
        while (srdata.next()) {
            String[] r777data = db.getRowNocon(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, "ID='" + srdata.getString("SQL_COMPONENT_DESC_ID") + "'");

            if (r777data[0].equals(name)) {

                r[0] = srdata.getString("AC_ID");
                r[1] = srdata.getString("ID");
            }

        }

        db.closeCon();

        return r;
    }

    String[] saveData(String TableName, String where, String[] filesd, String[] values) {

        String[] r = new String[2];

        String addID = Utils.getNewID();

        String[] rdata = db.getRow(TableName, where);

        if (rdata[0] != null) {
            addID = rdata[0];
            String[][] data = {filesd, values};

            error = db.setUpdate(TableName, data, "ID='" + rdata[0] + "'");

            test += "<br>-----------------------------------------------<br>" + TableName + " Update <br>" + Arrays.deepToString(data) + " >>" + error + "<br>";

        } else {

            String[] filesdm = new String[filesd.length + 1];

            String[] valuesm = new String[values.length + 1];

            for (int i = 0; i < filesd.length; i++) {
                filesdm[i] = filesd[i];
            }

            for (int i = 0; i < values.length; i++) {
                valuesm[i] = values[i];
            }

            filesdm[filesd.length] = "ID";

            valuesm[values.length] = addID;

            String[][] data = {filesdm, valuesm};

            error = db.setInsert(TableName, data);
            test += "<br>-----------------------------------------------<br>" + TableName + " Insert <br>" + Arrays.deepToString(data) + " >>" + error + "<br>";

        }

        if (error.equals("")) {
            r[0] = "1";
            r[1] = addID;

        } else {
            r[0] = "0";
            r[1] = error;

        }

        test += "" + Arrays.deepToString(r) + "<br>-----------------------------------------------<br>";

        return r; // r;
    }

    String[] saveData(String TableName, String where, String[] filesd, String[] values, boolean nocon) {

        String[] r = new String[2];

        String addID = Utils.getNewID();

        String[] rdata = db.getRowNocon(TableName, where);

        if (rdata[0] != null) {
            addID = rdata[0];
            String[][] data = {filesd, values};

            error = db.setUpdateNocon(TableName, data, "ID='" + rdata[0] + "'");

            test += "<br>-----------------------------------------------<br>" + TableName + " Update <br>" + Arrays.deepToString(data) + " >>" + error + "<br>";

        } else {

            String[] filesdm = new String[filesd.length + 1];

            String[] valuesm = new String[values.length + 1];

            for (int i = 0; i < filesd.length; i++) {
                filesdm[i] = filesd[i];
            }

            for (int i = 0; i < values.length; i++) {
                valuesm[i] = values[i];
            }

            filesdm[filesd.length] = "ID";

            valuesm[values.length] = addID;

            String[][] data = {filesdm, valuesm};

            error = db.setInsertNocon(TableName, data);
            test += "<br>-----------------------------------------------<br>" + TableName + " Insert <br>" + Arrays.deepToString(data) + " >>" + error + "<br>";

        }

        if (error.equals("")) {
            r[0] = "1";
            r[1] = addID;

        } else {
            r[0] = "0";
            r[1] = error;

        }

        test += "" + Arrays.deepToString(r) + "<br>-----------------------------------------------<br>";

        return r; // r;
    }

    String isINACIList(String lsiID, String name) throws SQLException {

        String r = null;
        db.openCon();

        ResultSet srdata = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID='" + lsiID + "'");
        while (srdata.next()) {

            if (srdata.getString("INST_NAME").equals(name)) {
                r = srdata.getString("AC_ID") + ";" + srdata.getString("ID");
            }

        }

        db.closeCon();

        return r;
    }

    int convertSQLActions(String a
    ) {
        int r = 0;
        if (a.equalsIgnoreCase("count")) {
            r = 0;

        } else if (a.equalsIgnoreCase("direct read")) {

            r = 1;

        } else if (a.equalsIgnoreCase("generic read")) {

            r = 2;

        } else if (a.equalsIgnoreCase("sequential read")) {

            r = 3;

        } else if (a.equalsIgnoreCase("insert")) {

            r = 4;

        } else if (a.equalsIgnoreCase("update")) {

            r = 5;

        } else if (a.equalsIgnoreCase("delete")) {

            r = 6;

        } else if (a.equalsIgnoreCase("sort")) {

            r = 7;

        } else if (a.equalsIgnoreCase("cursor")) {

            r = 8;

        } else if (a.equalsIgnoreCase("fetch")) {

            r = 9;

        } else if (a.equalsIgnoreCase("unload")) {

            r = 10;

        } else {
            r = -1;

        }

        return r;

    }

    int convertType(String a) {
        int r = 0;
        if (a.equalsIgnoreCase("Nested")) {
            r = 0;

        } else if (a.equalsIgnoreCase("Join")) {

            r = 1;

        } else {
            r = -1;

        }

        return r;

    }

    String addSQL(String[] m, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String r = "";

        String MODEL_ID = request.getParameter("mod_id");
        String SERVER_INST_ID = request.getParameter("SERVER_INST_ID");
        String LOGICAL_SERVER_INST_ID = request.getParameter("LOGICAL_SERVER_INST_ID");

        test = "";
        String arrs = Arrays.deepToString(m).replace("[", "");
        r += arrs.replace("]", "");
        String error = "";

        String aciDatas = isINACIList(LOGICAL_SERVER_INST_ID, m[0]);

        if (aciDatas != null) {
            String[] aciData = aciDatas.split(";");

            String acid = aciData[0];
            String acidins = aciData[1];

            String[] status = saveData(XMLDataModel.SQL_APPLICATION_DESC_TABLENAME,
                    "NAME='" + m[0] + "' and AC_ID='" + acid + "'",
                    new String[]{"AC_ID", "MODEL_ID", "NAME"},
                    new String[]{acid, MODEL_ID, m[0]});

            if (status[0].equalsIgnoreCase("1")) {

                String[] status2 = saveData(XMLDataModel.SQL_APPLICATION_INST_TABLENAME,
                        "SQL_APPLICATION_DESC_ID='" + status[1] + "' and MODEL_ID='" + MODEL_ID + "' and AC_INST_ID='" + acidins + "'",
                        new String[]{"MODEL_ID", "SQL_APPLICATION_DESC_ID", "AC_INST_ID", "NUM_TRANS_BEFORE", "CPU_BEFORE", "IO_BEFORE", "TOTAL_ORDERS", "ACTIVATION"},
                        new String[]{MODEL_ID, status[1], acidins, "0.000", "0.000", "0.000", "0", "0"});
                //  r += test;

                if (status2[0].equalsIgnoreCase("1")) {

                    String m3 = "" + updatenumber(m[3]);
                    String m2 = "" + updatenumber(m[2]);

                    if (Double.parseDouble(m3) >= 1 && Double.parseDouble(m3) <= 20) {

                        if (Double.parseDouble(m2) >= 0 && Double.parseDouble(m2) <= 100000000) {

                            String[] status3 = saveData(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME,
                                    "SQL_APPLICATION_DESC_ID='" + status[1] + "' and MODEL_ID='" + MODEL_ID + "' and Name='" + m[1] + "'",
                                    new String[]{"MODEL_ID", "SQL_APPLICATION_DESC_ID", "Name", "WEIGHT"},
                                    new String[]{MODEL_ID, status[1], m[1], m[3]});

                            if (status3[0].equalsIgnoreCase("1")) {

                                String[] status4 = saveData(XMLDataModel.SQL_COMPONENT_INST_TABLENAME,
                                        "SQL_APPLICATION_INST_ID=" + status2[1] + " and MODEL_ID=" + MODEL_ID + " and SQL_COMPONENT_DESC_ID='" + status3[1] + "'",
                                        new String[]{"MODEL_ID", "SQL_APPLICATION_INST_ID", "SQL_COMPONENT_DESC_ID", "ORDER_FREQ", "TOTAL_ORDERS"},
                                        new String[]{MODEL_ID, status2[1], status3[1], m[2], "0"});

                                if (status4[0].equalsIgnoreCase("1")) {

                                    m[5] = m[5].replace(".", ":");

                                    String[] TableNames = m[5].split(":");

                                    String DB_Namespaces = TableNames[0];
                                    String TableName = TableNames[1];
                                    String complex0 = db.getRowMinData(XMLDataModel.COMPLEX_INST_TABLENAME, "SERVER_INST_ID='" + SERVER_INST_ID + "'")[0];
                                    String partition0 = db.getRowMinData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "COMPLEX_INST_ID='" + complex0 + "'")[0];
                                    String DBInstance = db.getRow(XMLDataModel.DB_INST_TABLENAME, "LOGICAL_SERVER_INST_ID='" + partition0 + "'")[0];

                                    db.openCon();

                                    ResultSet srdata = db.getData(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "*", "DB_INST_ID='" + DBInstance + "'");

                                    while (srdata.next()) {

                                        String[] DB_NAMESPACEData = db.getRowNocon(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "ID='" + srdata.getString("DB_NAMESPACE_DESC_ID") + "'");

                                        if (DB_Namespaces.equals(DB_NAMESPACEData[2])) {
                                            String DB_NAMESPACE_ID = DB_NAMESPACEData[0];
                                            String DB_NAMESPACE_INST_ID = srdata.getString("ID");

                                            String[] TableData = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME, "NAME='" + TableName + "' and DB_NAMESPACE_DESC_ID='" + DB_NAMESPACE_ID + "'");

                                            String[] TableinstData = db.getRowNocon(XMLDataModel.TABLE_INST_TABLENAME, "TABLE_DESC_ID='" + TableData[0] + "'");

                                            if (TableData[0] != null) {

                                                String indname = "!!!!";

                                                if (!m[6].equalsIgnoreCase("!!!!")) {

                                                    m[6] = m[6].replace(".", ":");

                                                    String[] IndexNames = m[6].split(":");

                                                    indname = IndexNames[1];

                                                }

                                                if (indname != null) {
                                                    int botype = convertSQLActions(m[10]);
                                                    switch (botype) {
                                                        case 7:
                                                            indname = "!!!!";
                                                            break;
                                                        case 0:
                                                        case 1:
                                                        case 2:
                                                            //                case 5 :
                                                            if (indname == null || indname.compareToIgnoreCase("No Index") == 0) {
                                                                error = "ERROR:ImpDialog:Index Name is required!";
                                                            }
                                                            break;
                                                        case 3:
                                                        case 4:
                                                        case 5:
                                                        case 6:
                                                        case 8:
                                                        case 9:
                                                        case 10:
                                                            break;
                                                        case -1:
                                                            error = "Error: Incorrect SQL Action Type!";

                                                            break;

                                                    }

                                                    if (error.equals("")) {

                                                        String[] INDEX_DESC_Data = db.getRowNocon(XMLDataModel.INDEX_DESC_TABLENAME, "TABLE_DESC_ID='" + TableData[0] + "' and  NAME='" + indname + "'");

                                                        if (indname.equalsIgnoreCase("!!!!")) {
                                                            INDEX_DESC_Data[0] = "!!!!";
                                                        }

                                                        try {
                                                            int mono = Integer.parseInt(m[7]);
                                                            if (mono < 0) {
                                                                error = "ERROR:Base SQL Invalid Monotonies value.";
                                                            }
                                                            if (botype != 7 && mono != 0) {
                                                                error = "ERROR:Base SQL Monotonies must be 0 on non Sort order type.";
                                                            }
                                                        } catch (NumberFormatException ex) {
                                                            error = "Error:Base SQL Monotony must be a number!";
                                                        }
                                                        try {
                                                            double dbl = Double.parseDouble(m[8]);
                                                            if (dbl > 1.0 || dbl < 0.0) {
                                                                error = "ERROR:Base SQL Fraction Table must be between 0 and 1 inclusive.";
                                                            }

                                                        } catch (NumberFormatException e) {
                                                            error = "ERROR:Base SQL Fraction of Table Visited must be numeric.";
                                                        }
                                                        try {
                                                            double dbl = Double.parseDouble(m[9]);
                                                            if (dbl < 0.0 || dbl > 1.0) {
                                                                error = "ERROR:Base SQL Cluster Efficency invalid value must be between 0.0 and 1.0";
                                                            }

                                                        } catch (Exception d) {
                                                            error = "ERROR:Base SQL Cluster Efficency must be numeric.";
                                                        }
                                                        try {
                                                            double dbl = Double.parseDouble(m[11]);
                                                            if (dbl < 0.0) {
                                                                error = "ERROR:Base SQL Prefetch cannot be negitive.";
                                                            }

                                                        } catch (NumberFormatException e2) {
                                                            error = "ERROR:Base SQL Prefetch must be numeric.";
                                                        }
                                                        try {
                                                            double dbl = Double.parseDouble(m[12]);
                                                            if (dbl >= 100000000 || dbl <= 0.0) {
                                                                error = "ERROR:Base SQL Number in Component is invalid.";
                                                            }

                                                        } catch (NumberFormatException e3) {
                                                            error = "ERROR:Base SQL Number in Component must be numeric.";
                                                        }

                                                        if (error.equalsIgnoreCase("")) {
                                                            if (INDEX_DESC_Data[0] != null) {

                                                                //     test = out("", Arrays.deepToString(new String[]{MODEL_ID, TableData[0], status3[1], INDEX_DESC_Data[0], m[4], "" + botype, m[7]}));//ORDER_TYPE
                                                                String[] status5 = saveData(XMLDataModel.BASE_SQL_DESC_TABLENAME,
                                                                        "NAME='" + m[4] + "' and MODEL_ID='" + MODEL_ID + "' and SQL_COMPONENT_DESC_ID='" + status3[1] + "'",
                                                                        new String[]{"MODEL_ID", "TABLE_DESC_ID", "SQL_COMPONENT_DESC_ID", "INDEX_DESC_ID", "NAME", "ORDER_TYPE", "NUM_MONOTONIES"},
                                                                        new String[]{MODEL_ID, TableData[0], status3[1], INDEX_DESC_Data[0], m[4], "" + botype, m[7]}, true);

                                                                if (status5[0].equalsIgnoreCase("1")) {

                                                                    //       test += out("", "BASE_SQL_DESC_ID='" + status5[1] + "' and MODEL_ID=" + MODEL_ID + "' and SQL_COMPONENT_INST_ID='" + status4[1] + "'");
                                                                    String[] status6 = saveData(XMLDataModel.BASE_SQL_INST_TABLENAME,
                                                                            "BASE_SQL_DESC_ID='" + status5[1] + "' and MODEL_ID='" + MODEL_ID + "' and SQL_COMPONENT_INST_ID='" + status4[1] + "'",
                                                                            new String[]{"MODEL_ID", "TABLE_INST_ID", "BASE_SQL_DESC_ID", "SQL_COMPONENT_INST_ID", "ORDER_FREQ", "JOIN_MISSES", "ACCESS_PER_TRAN", "DISPERSMENT", "PREFETCH"},
                                                                            new String[]{MODEL_ID, TableinstData[0], status5[1], status4[1], m[12], m[8], "1.0", m[9], m[11]}, true);

                                                                    if (status6[0].equalsIgnoreCase("1")) {

                                                                        try {
                                                                            if (m[13] != null
                                                                                    && m[15] != null
                                                                                    && m[14] != null
                                                                                    && !m[13].equalsIgnoreCase("")
                                                                                    && !m[15].equalsIgnoreCase("")
                                                                                    && !m[14].equalsIgnoreCase("")) {

                                                                                String[] status7 = saveData(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME,
                                                                                        "NAME='" + m[13] + "' and MODEL_ID='" + MODEL_ID + "' and SQL_COMPONENT_DESC_ID='" + status3[1] + "'",
                                                                                        new String[]{"MODEL_ID", "SQL_COMPONENT_DESC_ID", "NAME", "TYPE"},
                                                                                        new String[]{MODEL_ID, status3[1], m[13], "" + convertType(m[14])}, true);

                                                                                if (status7[0].equalsIgnoreCase("1")) {

                                                                                    String[] status8 = saveData(XMLDataModel.COMPLEX_SQL_INST_TABLENAME,
                                                                                            "COMPLEX_SQL_DESC_ID='" + status7[1] + "' and MODEL_ID='" + MODEL_ID + "' and SQL_COMPONENT_INST_ID='" + status4[1] + "'",
                                                                                            new String[]{"MODEL_ID", "SQL_COMPONENT_INST_ID", "COMPLEX_SQL_DESC_ID", "ORDER_FREQ"},
                                                                                            new String[]{MODEL_ID, status4[1], status7[1], m[15]}, true);

                                                                                    if (status8[0].equalsIgnoreCase("1")) {

                                                                                    } else {
                                                                                        error = status8[1];

                                                                                    }
                                                                                } else {
                                                                                    error = status7[1];

                                                                                }
                                                                            } else {

                                                                            }

                                                                        } catch (Exception e) {

                                                                        }

                                                                    } else {
                                                                        error = status6[1];

                                                                    }

                                                                } else {

                                                                    error = status5[1];
                                                                }

                                                            } else {

                                                                error = "Error: index name not found";
                                                            }

                                                        }
                                                    }
                                                }
                                            } else {

                                                error = "Error: Table name not found";

                                            }
                                            //Error: Table name not found
                                        } else {

                                            error = "Error: Namespace not found";

                                        }

                                    }
                                    db.closeCon();
                                    //complex0
                                } else {

                                    error = status4[1];

                                }
                            } else {
                                error = status3[1];
                            }
                        } else {
                            error = "Error: SQL Component Number per transaction is in correct. It cannot exceed 100000000 [" + m[2] + "]";
                        }
                    } else {

                        error = "Error: SQL Component Weight must be greater or equal to 1 and less than or equal to 20 [" + m[3] + "]";

                    }

                } else {
                    error = status2[1];

                }

            } else {

                error = status[1];

            }

        } else {

            error = "Error:Application Name not found for this Logical Server Instance";
        }

        if (error.equals("")) {

            error = " Done";
        }

        r += "," + error + "\n";
        // r += test;
        return r;

    }

    String updatenumber(String a) {

        String r = "0";
        String d = "";
        a = a.trim();
        if (Utils.isNumeric(a)) {

            d = Utils.numberFormat(Double.parseDouble(a), 0);

        }
        return d;

    }

    String out(String Title, String a) {

        return "<br>--------------------------<br>" + Title + ":::" + a + "<br/>--------------------<br>";

    }
%>