<%@page import="lib.tools.Utils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.ComputeTester"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    int planpoint = Integer.parseInt(request.getParameter("ppoint"));

    String status = "";
    if (request.getParameter("status") != null) {


        status = request.getParameter("status").trim();
    }


    String allrows = request.getParameter("allrow");


    String[] allbe = allrows.split(";");


    String lim = "";
    String inc = "";
    for (int i = 0; i < allbe.length; i++) {
        inc += allbe[i].split("__")[3] + ";";
        lim += allbe[i].split("__")[4] + ";";
    }

    String[] incrr = inc.split(";");
    String[] inlim = lim.split(";");
    String[] beid = request.getParameter("be").split(";");

    String modelID = request.getParameter("modelID");

    String scenarioid = request.getParameter("scenarioid");

    String name = Utils.getModName(modelID, scenarioid);
    if (scenarioid.equals("")) {
        scenarioid = modelID;
    }
    if (request.getParameter("be2") != null && !request.getParameter("be2").equals("")) {
        String[] beid2 = request.getParameter("be2").split(";");
    }
    String[] benum = request.getParameter("benum").split(";");
    int ctype;
    if (planpoint == 0) {
        ctype = 1;
    } else {
        ctype = 2;
    }
    if (request.getParameter("type") != null) {
        ctype = Integer.parseInt(request.getParameter("type"));
    }
    status = status.trim();
    if (!status.equalsIgnoreCase("") && !status.equalsIgnoreCase("undefined")) {

        ctype = Integer.parseInt(status);

    }


    putparamdata(modelID, scenarioid, beid, benum, incrr, inlim, ctype);
    putCapacityPlanData(planpoint, beid, modelID, incrr, scenarioid, ctype);

    double systemlimit = 0;
    if (request.getParameter("systemlimt") != null && !request.getParameter("systemlimt").equals("")) {
        systemlimit = 2;
    }
    //out.print("points:" + planpoint + "system limit:" + request.getParameter("systemlimt"));

    ComputeTester com = new ComputeTester();
    String[] proj = db.getRow(XMLDataModel.PMXREF_TABLENAME, "mid=" + modelID);

    xact.users.users u = new xact.users.users();

    String des = "Project ID:" + proj[1] + "Model Id:" + modelID + "Scenario ID :" + scenarioid + "Compute Type:" + ctype + " PlanPoint:" + planpoint + "SL:" + systemlimit;
    u.audit_log(request, lib.Options.AuditLogEvents.COMPUTE_STARTED, des);

    int back = com.ComputeWS(proj[1], modelID, scenarioid, ctype, planpoint, systemlimit);


    out.print(back + ";" + name);


%>


<%!    lib.engine.db.operations db = new lib.engine.db.operations();

    public String putCapacityPlanData(int planpoint, String[] beid, String modelID, String[] increment_arr, String scenarioid, int type) {

        String mydata = "";


        if (scenarioid.equals("0")) {


            scenarioid = modelID;

        }



        double[] beNumbers = new double[beid.length];
        // db.openCon();

        String[][] insert;
        String[][] update;

        db.openDBCon(lib.Options.DbInfo.connectionStringRes);

        db.setDeleteNocon(XMLDataModel.CAPACITY_PLAN_TABLENAME, "ID=" + scenarioid);
        db.closeCon();

        for (int j = 0; j < planpoint + 1; j++) {
            for (int i = 0; i < beNumbers.length; i++) {

                if (type == 5) {
                    ArrayList<String> children = getChildren(scenarioid);
                    for (int k = 0; k < children.size(); k++) {
                        db.openCon();
                        beNumbers[i] = Double.parseDouble(db.getRowNocon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "ID=" + beid[i])[4]);
                        db.closeCon();
                        db.openDBCon(lib.Options.DbInfo.connectionStringRes);

                        double num = beNumbers[i] * (1 + ((Double.parseDouble(increment_arr[i]) / 100d) * j));
                        insert = new String[][]{{"ID", "PLAN_POINT", "BE_ID", "BE_NUM"}, {children.get(k), "" + j, beid[i], "" + num}};

                        mydata = "" + db.setInsertNocon(XMLDataModel.CAPACITY_PLAN_TABLENAME, insert);

                        db.closeCon();
                    }


                } else {


                    db.openCon();
                    beNumbers[i] = Double.parseDouble(db.getRowNocon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "ID=" + beid[i])[4]);
                    db.closeCon();
                    db.openDBCon(lib.Options.DbInfo.connectionStringRes);

                    double num = beNumbers[i] * (1 + ((Double.parseDouble(increment_arr[i]) / 100d) * j));
                    insert = new String[][]{{"ID", "PLAN_POINT", "BE_ID", "BE_NUM"}, {scenarioid, "" + j, beid[i], "" + num}};

                    mydata = "" + db.setInsertNocon(XMLDataModel.CAPACITY_PLAN_TABLENAME, insert);

                    db.closeCon();


                }

            }
        }
        //   db.closeCon();


        return mydata;
    }

    public String putparamdata(String modelid, String scenarioid, String[] beid, String[] benum, String[] increment_arr, String[] limit_arr, int ctype) {

        String[][] insert;
        String[] name;
        String retdata = "";

        if (scenarioid.equals("0")) {


            scenarioid = modelid;

        }
        db.openDBCon(lib.Options.DbInfo.connectionStringRes);

        retdata += db.setDeleteNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, "MODEL_ID=" + modelid + " AND M_ID=" + scenarioid);

        db.closeCon();

        retdata += "beis=" + beid.length;

        for (int i = 0; i < beid.length; i++) {


            if (ctype == 5) {

                ArrayList<String> children = new ArrayList<String>();
                children.add(scenarioid);
                children.addAll(getChildren(scenarioid));
                db.openDBCon(lib.Options.DbInfo.connectionStringRes);
                for (int j = 0; j < children.size(); j++) {
                    db.setDeleteNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, "MODEL_ID=" + modelid + " AND M_ID=" + children.get(j));
                    name = db.getRow(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "ID=" + beid[i]);
                    db.openDBCon(lib.Options.DbInfo.connectionStringRes);
                    retdata += children.get(j) + ";";
                    String ar = lib.tools.Utils.getScenarioPram(modelid, children.get(j), name[0], "number", name[4], XMLDataModel.BUSINESS_ENTITY_TABLENAME);

                    insert = new String[][]{{"MODEL_ID", "M_ID", "BE_ID", "BE_NAME", "NUMBER", "INCREMENT", "BE_LIMIT"}, {modelid, children.get(j), beid[i], name[3], ar, increment_arr[i], limit_arr[i]}};

                    retdata += db.setInsertNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, insert);
                }
                db.closeCon();

            } else {

                retdata += "beis=" + beid.length;
                db.openDBCon(lib.Options.DbInfo.connectionStringRes);




                name = db.getRow(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "ID=" + beid[i]);
                db.openDBCon(lib.Options.DbInfo.connectionStringRes);





                String ar = lib.tools.Utils.getScenarioPram(modelid, scenarioid, name[0], "number", name[4], XMLDataModel.BUSINESS_ENTITY_TABLENAME);



                insert = new String[][]{{"MODEL_ID", "M_ID", "BE_ID", "BE_NAME", "NUMBER", "INCREMENT", "BE_LIMIT"}, {modelid, scenarioid, beid[i], name[3], ar, increment_arr[i], limit_arr[i]}};

                retdata += db.setInsertNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, insert);


                db.closeCon();
            }
        }

        return retdata;
    }

    private ArrayList<String> getChildren(String scenarioId) {
        ArrayList<String> series = new ArrayList<String>();

        db.openCon();
        ResultSet scenarios = db.getData(XMLDataModel.SCENARIO_TABLENAME, "*", "PARENT_ID=" + scenarioId);
        try {
            while (scenarios.next()) {
                series.add(scenarios.getString("ID"));
                series.addAll(getChildren(scenarios.getString("ID")));

            }
        } catch (SQLException ex) {
        }
        db.closeCon();
        return series;
    }


%>