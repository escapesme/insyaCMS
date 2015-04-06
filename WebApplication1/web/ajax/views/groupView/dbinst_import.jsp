<%-- 
    Document   : dbinst_import
    Created on : Sep 2, 2014, 11:42:29 PM
    Author     : eScapes
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="xact.ServerNodeOperations"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lib.tools.files"%>
<%

    String filename = request.getParameter("loction") + "/" + request.getParameter("filename");
    String status = request.getParameter("status");

    // out.print(filename);
    ArrayList<String[]> datacsv = f.ImportCSV(filename, request, response);

    String r = status;
    String MODEL_ID = request.getParameter("mod_id");

    if (status.equalsIgnoreCase("buffer")) {

        BufferNamesList = getBufferNames("MODEL_ID='" + MODEL_ID + "' and DB_INST_ID='" + request.getParameter("DBins") + "'");

        //
        r = "Name,Pool Size (KB),Page size,Page Per IO,Logical Drive ,action\n";
        for (int i = 0; i < datacsv.size(); i++) {
            if (i > 0) {
                String[] m = datacsv.get(i);

                r += addBuffer(m, request, response);

                r += checkInList(BufferNamesList, m[0]);

            }
        }
    } else if (status.equalsIgnoreCase("Cache")) {

        CacheNames = getCacheNames("MODEL_ID='" + MODEL_ID + "' and DB_INST_ID='" + request.getParameter("DBins") + "'");

        r = "Cache Name,Cache Size (KB),Page Size (KB),Nb of Other IO,Nb Pages Per IO,CPU per IO (ms),Level\n";
        for (int i = 0; i < datacsv.size(); i++) {
            if (i > 0) {
                String[] m = datacsv.get(i);
                r += addCache(m, request, response);
            }
        }

    } else if (status.equalsIgnoreCase("index")) {

        IndexNames = getIndexNames("MODEL_ID='" + MODEL_ID + "' and TABLE_INST_ID='" + request.getParameter("TABLE_INST_ID") + "'");

        r += "Index Name,Table Name,Useful Size,Row Length,Cache Name,Other Access,Min IO Per Tran,Occupation Rate,Index Type,Logical Disk Name\n";
        for (int i = 0; i < datacsv.size(); i++) {
            if (i > 0) {
                String[] m = datacsv.get(i);
                r += addIndex(m, request, response);
            }
        }
    } else if (status.equalsIgnoreCase(
            "table")) {

        //
        TableNames = getTableNames("MODEL_ID='" + MODEL_ID + "' and DB_NAMESPACE_INST_ID='" + request.getParameter("DB_NAMESPACE_INST_ID") + "'");

        r += " Table Name,Useful Size,Row Length,Cache Name,Other Access,Min IO Per Tran,Occupation Rate,Disk \n";

        for (int i = 0; i < datacsv.size(); i++) {
            if (i > 0) {
                String[] m
                        = datacsv.get(i);
                r += addTable(m, request, response);
            }
        }

    } else if (status.equalsIgnoreCase("sql")) {
        r += " Application,Component,Number Per,User/Architectre,Base SQL,Table,Index,Monotony,Fraction,Cluster,SQL,Pre-fetch,Number In,Complex SQL,Complex,Complex Number\n";
        for (int i = 0; i < datacsv.size(); i++) {
            if (i > 0) {
                String[] m = datacsv.get(i);
                r += Arrays.deepToString(m);

                //   r += addSQL(m, request, response);
            }
        }
    }

    out.print(r);

    f.exportCSV("log-" + Utils.getNewID() + ".csv", r, request, response);

%>

<%!
    ArrayList<String[]> BufferNamesList = null;
    ArrayList<String[]> CacheNames = null;
    ArrayList<String[]> TableNames = null;
    ArrayList<String[]> IndexNames = null;

    String error = "";
    files f = new files();
    lib.engine.db.operations db = new lib.engine.db.operations();

    String addBuffer(String[] m, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String r = "";
        ////////////////////////////////////////////////Log
        String arrs = Arrays.deepToString(m).replace("[", "");
        r += arrs.replace("]", "");
        String erreor = "";
        String mid = Utils.getNewID();
        String midins = Utils.getNewID();
        ////////////////////////////////////////////////DESCAdd
        //String[] rdata = db.getRow(XMLDataModel.LOGBUF_DESC_TABLENAME, "NAME='" + m[0] + "'");

        String rid = checkInList(BufferNamesList, m[0]);

        // String rid = rdata[0];
        if (isLDrive(m[4], request, response, "")) {

            if (rid != null) {
                String[][] data = {{"BUFPOOL_SIZE", "PAGE_SIZE", "DB_CONFIG_NAME"}, {m[1], m[2], request.getParameter("DBinsname")}};
                erreor = db.setUpdate(XMLDataModel.LOGBUF_DESC_TABLENAME, data, "ID='" + rid + "'");
            } else {

                String[][] data = {{"ID", "PROJECT_ID",
                    "NAME", "BUFPOOL_SIZE", "PAGE_SIZE", "DB_CONFIG_NAME"}, {mid, request.getParameter("proid"), m[0], m[1], m[2], request.getParameter("DBinsname")}};
                erreor = db.setInsert(XMLDataModel.LOGBUF_DESC_TABLENAME, data);
            }

            ////////////////////////////////////////////////INSTAdd
            if (rid != null) {
                String[][] datains = {{"LOGICAL_DRIVE_NAME", "PGS_PER_IO", "OTHER_APPS", "DB_INST_ID"}, {m[4], m[3], "0", request.getParameter("DBins")}};
                erreor = db.setUpdate(XMLDataModel.LOGBUF_INST_TABLENAME, datains, "LOGBUF_DESC_ID='" + rid + "'");
            } else {
                String[][] datains = {{"ID", "MODEL_ID", "LOGBUF_DESC_ID", "LOGICAL_DRIVE_NAME", "PGS_PER_IO", "OTHER_APPS", "DB_INST_ID"}, {midins, request.getParameter("mod_id"), mid, m[4], m[3], "0", request.getParameter("DBins")}};
                erreor = db.setInsert(XMLDataModel.LOGBUF_INST_TABLENAME, datains);
            }

        }

        ////////////////////////////////////////////////errors
        if (erreor.equals("")) {

            if (!isLDrive(m[4], request, response, "")) {

                erreor = "Logical Drive not Found";

            } else if (rid != null) {
                erreor = "Up date";
            } else {
                erreor = "Done";

            }
        } else {
            db.setDelete(XMLDataModel.LOGBUF_DESC_TABLENAME, "id=" + mid);
            db.setDelete(XMLDataModel.LOGBUF_INST_TABLENAME, "id=" + midins);
        }

        r += "," + erreor + "\n";

        return r;

    }

    String addCache(String[] m, HttpServletRequest request, HttpServletResponse response) {
        String r = "";

        ////////////////////////////////////////////////Log
        String arrs = Arrays.deepToString(m).replace("[", "");
        r += arrs.replace("]", "");

        String mid = Utils.getNewID();
        String midins = Utils.getNewID();
        String erreor = "";

        //    String[] rdata = db.getRow(XMLDataModel.CACHE_DESC_TABLENAME, "CACHE_NAME='" + m[0] + "'");
        String desid = checkInList(CacheNames, m[0]);

        if (desid != null) {

            String[][] data = {{"CACHE_SIZE", "PAGE_SIZE"}, {m[1], m[2]}};
            erreor = db.setUpdate(XMLDataModel.CACHE_DESC_TABLENAME, data, "ID='" + desid + "'");

        } else {

            String[][] data = {{"ID", "PROJECT_ID", "CACHE_NAME", "CACHE_SIZE", "PAGE_SIZE", "DB_CONFIG_NAME"}, {mid, request.getParameter("proid"), m[0], m[1], m[2], request.getParameter("DBinsname")}};
            erreor = db.setInsert(XMLDataModel.CACHE_DESC_TABLENAME, data);
        }

        ////////////////////////////////////////////////INSTAdd
        if (desid != null) {

            String[][] datains = {{"PGS_PER_IO", "CPU", "OTHER_ACCESS"}, {m[4], m[5], m[3]}};

            erreor = db.setUpdate(XMLDataModel.CACHE_INST_TABLENAME, datains, "CACHE_DESC_ID='" + desid + "'");

        } else {

            String[][] datains = {{"ID", "MODEL_ID", "CACHE_DESC_ID", "PGS_PER_IO", "CPU", "OTHER_ACCESS", "DB_INST_ID"}, {midins, request.getParameter("mod_id"), mid, m[4], m[5], m[3], request.getParameter("DBins")}};

            erreor = db.setInsert(XMLDataModel.CACHE_INST_TABLENAME, datains);
        }
        ////////////////////////////////////////////////errors

        if (erreor.equals("")) {
            if (desid != null) {
                erreor = "Update";
            } else {
                erreor = "Done";

            }
        } else {
            db.setDelete(XMLDataModel.CACHE_DESC_TABLENAME, "id=" + mid);
            db.setDelete(XMLDataModel.CACHE_INST_TABLENAME, "id=" + midins);
        }

        r += "," + erreor + "\n";

        return r;

    }

    String addTable(String[] m, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String r = "";

        ////////////////////////////////////////////////Log
        String arrs = Arrays.deepToString(m).replace("[", "");
        r += arrs.replace("]", "");

        //         r += " Table Name,Useful Size,Row Length,Cache Name,Other Access,Min IO Per Tran,Occupation Rate,Disk \n";
        ////////////////////////////////////////////////DESCAdd
        String mid = Utils.getNewID();

        String midins = Utils.getNewID();

        String erreor = "";
        String CACHE_DESC_ID = "";

        String desid = checkInList(TableNames, m[0]);

        if (desid != null) {

            String[] datains = db.getRow(XMLDataModel.TABLE_INST_TABLENAME, "TABLE_DESC_ID='" + desid + "'");

            midins = datains[0];
        }

        if (m.length > 3) {

            //   String[] cNames = m[3].split(":");
            db.setDelete(XMLDataModel.CACHE_XREF_TABLENAME, "CACHE_USER_ID='" + midins + "'");

            CACHE_DESC_ID = addCacheXref(m[3], midins, request, response);

            if (!CACHE_DESC_ID.equals("")) {
                if (isLDrive(m[7], request, response, "")) {

                    if (desid != null) {

                        String[][] data = {{"CACHE_DESC_ID", "USEFUL_SIZE", "ROW_LEN"}, {CACHE_DESC_ID, m[1], m[2]}};
                        erreor = db.setUpdate(XMLDataModel.TABLE_DESC_TABLENAME, data, "ID='" + desid + "'");

                    } else {

                        double USEFUL_SIZE = 0;
                        if (m[1] != null) {
                            USEFUL_SIZE = (Double.parseDouble(m[1]) * 1024);
                        }
                        String[][] data = {{"ID", "NAME", "DB_NAMESPACE_DESC_ID", "CACHE_DESC_ID", "USEFUL_SIZE", "ROW_LEN", "INDEX_TYPE_NAME", "TOT_NUM_INDEX", "DEFAULT_IND"}, {
                            mid, m[0], request.getParameter("DB_NAMESPACE_DESC_ID"), CACHE_DESC_ID, "" + USEFUL_SIZE, m[2], "0", "0", "0"}};

                        erreor = db.setInsert(XMLDataModel.TABLE_DESC_TABLENAME, data);
                        //  r = db.returnSQL;
                    }

                    ////////////////////////////////////////////////INSTAdd
                    if (desid != null) {

                        String[][] datains = {{
                            "OTHER_ACCESS", "MIN_IO_PER_TRAN", "OCCUP_RATE"

                        }, {
                            m[4], m[5], m[6]
                        }};

                        erreor = db.setUpdate(XMLDataModel.TABLE_INST_TABLENAME, datains, "TABLE_DESC_ID='" + desid + "'");
                        // r += "," + db.returnSQL;
                    } else {

                        String[][] datains = {{"ID", "MODEL_ID", "TABLE_DESC_ID",
                            "LOGICAL_DRIVE_NAME", "TOT_PG_PER_TRAN",
                            "OTHER_ACCESS", "DB_NAMESPACE_INST_ID", "MIN_IO_PER_TRAN", "PHYSICAL_IO", "OCCUP_RATE", "SYN_NUM"

                        }, {midins, request.getParameter("mod_id"), mid, m[7], "0.00000", m[4],
                            request.getParameter("DB_NAMESPACE_INST_ID"), m[5], "0.00000", m[6], "0.00000"
                        }};

                        erreor = db.setInsert(XMLDataModel.TABLE_INST_TABLENAME, datains);
                        // r += db.returnSQL;
                    }
                } else {

                }
            }
            ////////////////////////////////////////////////errors
            if (erreor.equals("")) {
                if (!isLDrive(m[7], request, response, "")) {
                    erreor = "Logical Drive Not Found";
                } else if (CACHE_DESC_ID.equals("")) {
                    erreor = "Cache Not Found";
                } else if (desid != null) {
                    erreor = desid + " Update";

                } else {
                    erreor = "Done";

                }

            } else {
                db.setDelete(XMLDataModel.TABLE_DESC_TABLENAME, "id=" + mid);
                db.setDelete(XMLDataModel.TABLE_INST_TABLENAME, "id=" + midins);
            }

            r += "," + erreor + "\n";
        }
        return r;

    }

    String addIndex(String[] m, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String r = "";

        ////////////////////////////////////////////////Log
        String arrs = Arrays.deepToString(m).replace("[", "");
        r += arrs.replace("]", "");

        String TABLE_DESC_ID = "";
        String TABLE_INST_ID = "";

        String erreor = "";
        String mid = Utils.getNewID();
        String midins = Utils.getNewID();
        String midix = Utils.getNewID();

        String[] tabledecData = db.getRow(XMLDataModel.TABLE_DESC_TABLENAME, "NAME='" + m[1] + "' and DB_NAMESPACE_DESC_ID='" + request.getParameter("DB_NAMESPACE_DESC_ID") + "'");
        String[] tabledinsData = db.getRow(XMLDataModel.TABLE_INST_TABLENAME, "TABLE_DESC_ID='" + tabledecData[0] + "'");
        IndexNames = getIndexNames(" TABLE_INST_ID='" + tabledinsData[0] + "'");

        String CACHE_DESC_ID = "";

        String INDEX_DESC_id = null;

        INDEX_DESC_id = checkInList(IndexNames, m[0]);

        if (INDEX_DESC_id != null) {

            String[] datains = db.getRow(XMLDataModel.INDEX_INST_TABLENAME, "INDEX_DESC_ID='" + INDEX_DESC_id + "'");

            midins = datains[0];
        }

        CACHE_DESC_ID = addCacheXref(m[4], midins, request, response);

        if (!CACHE_DESC_ID.equalsIgnoreCase("")) {

            TABLE_INST_ID = tabledinsData[0];

            if (TABLE_INST_ID == null || TABLE_INST_ID == null) {

                erreor = "No Table ";
            } else {

                if (isLDrive(m[9], request, response, "")) {

                    if (INDEX_DESC_id != null) {
                        String[][] data = {
                            {"USEFUL_SIZE", "INDEX_TYPE_NUM", "ROW_LEN", "DEFAULT_IND"},
                            {m[2], m[8], m[3], "0"}
                        };
                        erreor = db.setUpdate(XMLDataModel.INDEX_DESC_TABLENAME, data, "ID='" + INDEX_DESC_id + "'");
                    } else {
                        String[][] data = {
                            {"ID", "NAME", "TABLE_DESC_ID", "USEFUL_SIZE", "INDEX_TYPE_NUM", "ROW_LEN", "DEFAULT_IND"},
                            {mid, m[0], tabledecData[0], m[2], m[8], m[3], "0"}
                        };

                        erreor = db.setInsert(XMLDataModel.INDEX_DESC_TABLENAME, data);
                    }

                    ////////////////////////////////////////////////INSTAdd
                    if (INDEX_DESC_id != null) {

                        String[][] datains = {
                            {"TOT_PG_PER_TRAN", "OTHER_ACCESS", "LOGICAL_DRIVE_NAME", "MIN_IO_PER_TRAN", "PHYSICAL_IO", "OCCUP_RATE"},
                            {"0.00000", m[5], m[9], m[6], "0.00000", m[7]}
                        };
                        erreor = db.setUpdate(XMLDataModel.INDEX_INST_TABLENAME, datains, "INDEX_DESC_ID='" + INDEX_DESC_id + "'");

                    } else {

                        String[][] datains = {{"ID", "MODEL_ID", "INDEX_DESC_ID", "TABLE_INST_ID", "TOT_PG_PER_TRAN", "OTHER_ACCESS", "LOGICAL_DRIVE_NAME", "MIN_IO_PER_TRAN", "PHYSICAL_IO", "OCCUP_RATE"},
                        {midins, request.getParameter("mod_id"), mid, TABLE_INST_ID, "0.00000", m[5], m[9], m[6], "0.00000", m[7]}};
                        erreor = db.setInsert(XMLDataModel.INDEX_INST_TABLENAME, datains);
                    }
                }
            }
        }
        ////////////////////////////////////////////////errors

        if (erreor.equals("")) {

            if (!isLDrive(m[9], request, response, "")) {
                erreor = "Logical Drive Not Found";
            } else if (CACHE_DESC_ID.equalsIgnoreCase("")) {
                erreor = "Cache Not Found";

            } else if (INDEX_DESC_id != null) {
                erreor = "Update";
            } else {
                erreor = "Done";

            }
        } else {
            db.setDelete(XMLDataModel.INDEX_DESC_TABLENAME, "id=" + mid);
            db.setDelete(XMLDataModel.INDEX_INST_TABLENAME, "id=" + midins);
        }

        r += "," + erreor + "\n";

        return r;

    }

    boolean isLDrive(String name, HttpServletRequest request, HttpServletResponse response, String type) throws SQLException {

        boolean r = false;

        String ids = request.getParameter("ids");

        String nodid1 = ids.split("/")[1];

        ServerNodeOperations s = new ServerNodeOperations();
        String noid = s.getConnectedStorageNode(nodid1);

        String[] data = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + noid);

        db.openCon();
        ResultSet lds = db.getData(XMLDataModel.LOGICAL_DRIVE_INST_TABLENAME, "*", "server_inst_id=" + data[0]);

        if (type.equals("split")) {

            name = name.split(":")[1];

        }

        while (lds.next()) {

            if (name.equalsIgnoreCase(lds.getString("NAME"))) {
                r = true;

            }

        }

        db.closeCon();

        return r;

    }

    String isCaheID(String DBins, String cname, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String r = null;
        db.openCon();

        ResultSet srdata = db.getData(XMLDataModel.CACHE_INST_TABLENAME, "*", "DB_INST_ID='" + DBins + "'    and   MODEL_ID='" + request.getParameter("mod_id") + "'");

        while (srdata.next()) {

            String[] r777data = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + srdata.getString("CACHE_DESC_ID") + "'");

            if (r777data.length > 1) {
                if (cname.equalsIgnoreCase(r777data[3])) {

                    r = srdata.getString("ID") + ":" + r777data[0];
                }
            }
        }

        db.closeCon();

        return r;

    }

    String isCaheID_test(String DBins, String cid, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String r = "";
        db.openCon();

        ResultSet srdata = db.getData(XMLDataModel.CACHE_INST_TABLENAME, "*", "DB_INST_ID='" + DBins + "'    and   MODEL_ID='" + request.getParameter("mod_id") + "'");
        ;
        while (srdata.next()) {

            String[] r777data = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + srdata.getString("CACHE_DESC_ID") + "'");

            r += cid + "::::" + r777data[3] + " <br/>";
            /*   if (r777data.length > 1) {
             if (cid.equalsIgnoreCase(r777data[0])) {
             r = true;
             }
             }*/
        }

        db.closeCon();

        return r;

    }

    String clear(String[] tbales, String[] ids, String erreor, String status) {
        String r = "";

        if (erreor.equals("")) {
            erreor = status;
        } else {

            for (int i = 0; i < tbales.length; i++) {
                db.setDelete(tbales[i], "id=" + ids[i]);
            }

        }

        return r;

    }

    String aciID = "";

    ArrayList<String[]> getBufferNames(String where) throws SQLException {
        ArrayList<String[]> r = new ArrayList<String[]>();
        db.openCon();
        ResultSet srdata = db.getData(XMLDataModel.LOGBUF_INST_TABLENAME, "*", where);

        while (srdata.next()) {

            String[] rdata = db.getRowNocon(XMLDataModel.LOGBUF_DESC_TABLENAME, "ID='" + srdata.getString("LOGBUF_DESC_ID") + "'");
            if (rdata[0] != null) {

                String[] data = new String[]{rdata[3], rdata[0], srdata.getString("ID")};

                r.add(data);

            }

        }
        db.closeCon();
        return r;

    }

    ArrayList<String[]> getCacheNames(String where) throws SQLException {

        ArrayList<String[]> r = new ArrayList<String[]>();

        db.openCon();
        ResultSet srdata = db.getData(XMLDataModel.CACHE_INST_TABLENAME, "*", where);
        while (srdata.next()) {

            //id = request.getParameter("id");
            String[] rdata = db.getRowNocon(XMLDataModel.CACHE_DESC_TABLENAME, "ID='" + srdata.getString("CACHE_DESC_ID") + "'");
            r.add(new String[]{rdata[3], rdata[0], srdata.getString("ID")});

        }

        db.closeCon();

        return r;

    }

    ArrayList<String[]> getTableNames(String where) throws SQLException {

        ArrayList<String[]> r = new ArrayList<String[]>();

        db.openCon();

        ResultSet srdata = db.getData(XMLDataModel.TABLE_INST_TABLENAME, "*", where);

        while (srdata.next()) {
            if (srdata.getString("ID") != null) {
                String[] rdata = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME, "ID='" + srdata.getString("TABLE_DESC_ID") + "'");

                if (rdata[0] != null && rdata[1] != null) {

                    r.add(new String[]{rdata[1], rdata[0], srdata.getString("ID")});

                }
            }
        }
        db.closeCon();
        return r;
    }

    ArrayList<String[]> getIndexNames(String where) throws SQLException {

        ArrayList<String[]> r = new ArrayList<String[]>();

        db.openCon();

        ResultSet srdata = db.getData(XMLDataModel.INDEX_INST_TABLENAME, "*", where);

        while (srdata.next()) {
            if (srdata.getString("ID") != null) {

                String[] rdata = db.getRowNocon(XMLDataModel.INDEX_DESC_TABLENAME, "ID='" + srdata.getString("INDEX_DESC_ID") + "'");
                if (rdata[0] != null) {
                    r.add(new String[]{rdata[1], rdata[0], srdata.getString("ID")});

                }

            }

        }

        db.closeCon();

        return r;
    }

    String checkInList(ArrayList<String[]> a, String name) {
        String r = null;

        for (int i = 0; i < a.size(); i++) {

            if (a.get(i)[0].equals(name)) {
                r = a.get(i)[1];
            }
        }
        return r;
    }

    String addCacheXref(String name, String midins, HttpServletRequest request, HttpServletResponse response) throws SQLException {

        String[] cNames = name.split(":");

        String CACHE_DESC_ID = "";

        db.setDelete(XMLDataModel.CACHE_XREF_TABLENAME, "CACHE_USER_ID='" + midins + "'");

        for (int i = 0; i < cNames.length; i++) {

            String INS_ID = isCaheID(request.getParameter("DBins"), cNames[i], request, response);

            if (INS_ID != null) {

                if (CACHE_DESC_ID.equalsIgnoreCase("")) {
                    CACHE_DESC_ID = INS_ID.split(":")[1];
                }
                String midix = Utils.getNewID();
                String[][] datax = {{"ID", "CACHE_USER_ID", "CACHE_INST_ID", "MODEL_ID"
                }, {midix, midins, INS_ID.split(":")[0], request.getParameter("mod_id")}};

                //    r += Arrays.deepToString(datax) + cNames[i] + ":" + i + ":" + "<br/>";
                db.setInsert(XMLDataModel.CACHE_XREF_TABLENAME, datax);
            }

        }

        return CACHE_DESC_ID;

    }

%>



