

<%@page import="lib.tools.files"%>
<%@page import="xact.viewsClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String Status = request.getParameter("status");
    String LOGICAL_SERVER_INST_ID = request.getParameter("LOGICAL_SERVER_INST_ID");
    String mod_id = request.getParameter("mod_id");

    lib.engine.db.operations db = new lib.engine.db.operations();
    viewsClass v = new viewsClass();

    db.openCon();

    ResultSet srdata = db.getSQL(v.SQLEXPORT(LOGICAL_SERVER_INST_ID));;

    String outData = "Application,Component,Number Per,User/Architectre,Base SQL,Table,Index,,Fraction,Cluster,SQL,,Number In,Complex SQL,Complex, Number\n";
    outData += "Name,Name,Transaction,Weight,Name,Name,Name,Monotony,Table,Efficiency,Action,Pre-fetch,Component,Name,Type,Per Component";

    while (srdata.next()) {
        /*
         String table_id = srdata.getString("BASE_SQL_DESC_TABLE_DESC_ID");
         String index_id = srdata.getString("BASE_SQL_DESC_INDEX_DESC_ID");*/

        if (srdata.getString("SQL_APPLICATION_DESC_NAME") != null) {
            String[] dataindes = db.getRowNocon(XMLDataModel.INDEX_DESC_TABLENAME, "ID='" + srdata.getString("BASE_SQL_DESC_INDEX_DESC_ID") + "'");
            String[] datatable = db.getRowNocon(XMLDataModel.TABLE_DESC_TABLENAME, "ID='" + srdata.getString("BASE_SQL_DESC_TABLE_DESC_ID") + "'");
            String[] datatablename = db.getRowNocon(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "ID='" + datatable[2] + "'");

            String table_name = "";

            if (datatable[1] != null) {
                table_name = datatablename[2] + "." + datatable[1];

            }

            String index_name = "";

            if (dataindes[1] != null) {

                index_name = datatablename[2] + "." + dataindes[1];
            } else {

                index_name = "!!!!";
            }

            outData += "\n";

            outData += srdata.getString("SQL_APPLICATION_DESC_NAME") == null ? "" : srdata.getString("SQL_APPLICATION_DESC_NAME") + ",";
            outData += srdata.getString("SQL_COMPONENT_DESC_NAME") == null ? "" : srdata.getString("SQL_COMPONENT_DESC_NAME") + ",";
            outData += srdata.getString("SQL_COMPONENT_INST_ORDER_FREQ") == null ? "" : srdata.getString("SQL_COMPONENT_INST_ORDER_FREQ") + ",";
            outData += srdata.getString("SQL_COMPONENT_DESC_WEIGHT") == null ? "" : srdata.getString("SQL_COMPONENT_DESC_WEIGHT") + ",";

            if (srdata.getString("BASE_SQL_DESC_NAME") != null) {

                outData += srdata.getString("BASE_SQL_DESC_NAME") == null ? "" : srdata.getString("BASE_SQL_DESC_NAME") + ",";

                outData += table_name + ",";
                outData += index_name + ",";

                outData += srdata.getString("BASE_SQL_DESC_NUM_MONOTONIES") == null ? "" : srdata.getString("BASE_SQL_DESC_NUM_MONOTONIES") + ",";
                outData += srdata.getString("BASE_SQL_INST_JOIN_MISSES") == null ? "" : srdata.getString("BASE_SQL_INST_JOIN_MISSES") + ",";
                outData += srdata.getString("BASE_SQL_INST_DISPERSMENT") == null ? "" : srdata.getString("BASE_SQL_INST_DISPERSMENT") + ",";
                outData += convertSQLActions(srdata.getString("BASE_SQL_DESC_ORDER_TYPE")) + ",";

                outData += srdata.getString("BASE_SQL_INST_PREFETCH") == null ? "" : srdata.getString("BASE_SQL_INST_PREFETCH") + ",";
                outData += srdata.getString("BASE_SQL_INST_ORDER_FREQ") == null ? "" : srdata.getString("BASE_SQL_INST_ORDER_FREQ") + ",";
                outData += srdata.getString("COMPLEX_SQL_DESC_NAME") == null ? "" : srdata.getString("COMPLEX_SQL_DESC_NAME") + ",";
                outData += convertCom(srdata.getString("COMPLEX_SQL_DESC_TYPE")) + ",";

                outData += srdata.getString("COMPLEX_SQL_INST_ORDER_FREQ") == null ? "" : srdata.getString("COMPLEX_SQL_INST_ORDER_FREQ") + ",";
            } else {

                outData += "," + "," + "," + "," + "," + "," + "," + "," + "," + "," + "," + ",";

            }
        }

    }

    db.closeCon();

    files f = new files();
    out.print(f.exportCSV("SQL-" + LOGICAL_SERVER_INST_ID + ".csv", outData, request, response));
    db.closeCon();
    out.print(outData);

%>

<%!
    String convertCom(String a) {
        String r = "";
        if (a != null) {
            if (a.equalsIgnoreCase("0")) {
                r = "Nested";

            } else if (a.equalsIgnoreCase("1")) {

                r = "Join";

            } else {

                r = " ";

            }

        }
        return r;

    }

    String convertSQLActions(String a) {
        String r = "";
        if (a != null) {
            if (a.equalsIgnoreCase("0")) {
                r = "Count";

            } else if (a.equalsIgnoreCase("1")) {

                r = "Direct Read";

            } else if (a.equalsIgnoreCase("2")) {

                r = "Generic Read";

            } else if (a.equalsIgnoreCase("3")) {

                r = "Sequential Read";

            } else if (a.equalsIgnoreCase("4")) {

                r = "Insert";

            } else if (a.equalsIgnoreCase("5")) {

                r = "Update";

            } else if (a.equalsIgnoreCase("6")) {

                r = "Delete";

            } else if (a.equalsIgnoreCase("7")) {

                r = "Sort";

            } else if (a.equalsIgnoreCase("8")) {

                r = "Cursor";

            } else if (a.equalsIgnoreCase("9")) {

                r = "Fetch";

            } else if (a.equalsIgnoreCase("10")) {

                r = "Unload";

            } else {
                r = "";

            }
        }
        return r;

    }

%>
