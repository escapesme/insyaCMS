<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String pro_id = request.getParameter("pro_id");



    String username = request.getParameter("username");
    testdata += "username:" + username + ";<br/>";


    testdata += "pro_id:" + pro_id + ";<br/>";

    db.openDBCon(lib.Options.DbInfo.connectionStringUsers);
    String[] userdata = db.getRowNocon(XMLDataModel.USER_TABLENAME, " username='" + username + "' ");
    db.closeCon();
    String cid = userdata[7];
    testdata += "cid:" + cid + ";<br/>";
    String gid = userdata[8];
    testdata += "gid:" + gid + ";<br/>";
    String[] values = {username, cid, gid};
    
    String[] modles = getmodels(pro_id);

    testdata += "Modles:" + Arrays.deepToString(modles) + ";<br/>";






    for (int i = 0; i < modles.length; i++) {


        db.openCon();

    
         String[] fieldsReport = {"user_name", "cid", "gid"};
        changdata(XMLDataModel.REPORT_TABLENAME, fieldsReport, values, "pro_id", pro_id);
       
            String[] fields = {"OWNER", "CLIENT_ID", "GROUP_ID"};
        changdata(XMLDataModel.REPORT_TEMPLATES_TABLENAME, fields, values, "MODEL_ID", modles[i]);
         changdata(XMLDataModel.REPORT_DATA_TABLENAME, fieldsReport, values, "pro_id", pro_id);
          changdata(XMLDataModel.REPORT_IMAGES_TABLENAME, fieldsReport, values, "pro_id", pro_id);

        String[] fields2 = {"OWNER", "cid", "gid"};
        changdata(XMLDataModel.PROJECT_TABLENAME, fields2, values, "pid", pro_id);

        String[] fields3 = {"OWNER"};
        String[] values3 = {username};
        changdata(XMLDataModel.MODEL_TABLENAME, fields3, values3, "ID", modles[i]);

        db.closeCon();



        db.openConres();


        String[] fields4 = {"USERNAME", "CLIENT_ID", "GROUP_ID"};
        changdata_res(XMLDataModel.COST_RESULTS_TABLENAME, fields4, values, "MODEL_ID", modles[i]);
        changdata_res(XMLDataModel.RESOURCE_BPRT_TABLENAME, fields4, values, "MODEL_ID", modles[i]);
        changdata_res(XMLDataModel.SERVICE_ACRT_TABLENAME, fields4, values, "MODEL_ID", modles[i]);
        changdata_res(XMLDataModel.SERVICE_BPRT_TABLENAME, fields4, values, "MODEL_ID", modles[i]);
        changdata_res(XMLDataModel.SERVICE_CPC_TABLENAME, fields4, values, "MODEL_ID", modles[i]);
        changdata_res(XMLDataModel.SERVICE_DISK_TABLENAME, fields4, values, "MODEL_ID", modles[i]);
        changdata_res(XMLDataModel.SP_RESULTS_TABLENAME, fields4, values, "MODEL_ID", modles[i]);
        changdata_res(XMLDataModel.SVR_USE_RESULTS_TABLENAME, fields4, values, "MODEL_ID", modles[i]);
        db.closeCon();




    }


    xact.users.users us = new xact.users.users();



    out.print(us.userlogout_do(request));







%>

<%!    String testdata = "";
    lib.engine.db.operations db = new lib.engine.db.operations();

    void changdata(String table, String[] fields, String[] values, String mod_field, String mod_id) {

        String[][] data = {fields, values};
        String Where = mod_field + "=" + mod_id;
        testdata += "Where:" + Where + ";<br/>";
        String data2 = db.setUpdateNocon(table, data, Where);

        testdata += "status:" + data2 + ";<br/>";

    }

    void changdata_res(String table, String[] fields, String[] values, String mod_field, String mod_id) {
        String[][] data = {fields, values};
        String Where = mod_field + "=" + mod_id;
        testdata += "Where:" + Where + ";<br/>";
        String data2 = db.setUpdateNocon(table, data, Where);

        testdata += "status:" + data2 + ";<br/>";
    }

    String[] getmodels(String proid) {
        String[] cl_pmxref = db.getColumn(lib.Options.XMLDataModel.PMXREF_TABLENAME, "mid", " pid=" + proid);
        return cl_pmxref;
    }

%>


