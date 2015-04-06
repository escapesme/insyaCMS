<%@page import="lib.tools.Utils"%>
<%@page import="com.sun.corba.se.impl.logging.UtilSystemException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.xml.transform.Result"%>
<%@page import="xact.results.resultes"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<%

    lib.engine.db.operations db = new lib.engine.db.operations();

    xact.users.users us = new xact.users.users();
    String outID = "";
    String myout = "";
    myout = us.userReturn(request, "username");
    String status = us.userReturn(request, "status");
    String mystatus = request.getParameter("status");
    
    
    if (mystatus.equalsIgnoreCase("creatcorporate")) {

        String myname = request.getParameter("name").trim();
        String Number = request.getParameter("Number").trim();
        String wd = request.getParameter("wd").trim();
        String type = request.getParameter("type").trim();
        String mod_id = request.getParameter("mod_id").trim();
        String UnitType = request.getParameter("UnitType").trim();
        String mid = Utils.getNewID();

        String[][] data = {{"ID", "NAME", "NUMBER", "WINDOW_DURATION_TYPE",
            "WINDOW_DURATION", "MODEL_ID", "UNIT_TYPE"},
        {mid, myname, Number, UnitType, wd, mod_id, type}};

        myout = Arrays.deepToString(data);

        outID = mid;
        out.print(db.setInsert(XMLDataModel.CORPORATE_TABLENAME, data));

    } else if (mystatus.equalsIgnoreCase("createnode")) {

        
        
        
        
        
        
        String myid = Utils.getNewID();

        String otype = request.getParameter("otype").trim();

        String mod_id = (String) session.getAttribute("mymodeID");

        String parent = request.getParameter("parentData").trim();
        String parentId=parent.split("/")[1];
        double Link = Double.parseDouble(request.getParameter("create_Node_Link").trim()) / 100;

        String parenttype = parent.split("/")[0];

        //  out.print(otype);
       if (otype.equalsIgnoreCase("Line of Business")) {
            String comment = request.getParameter("des").trim();
            String myname = request.getParameter("name").trim();
            String Number = request.getParameter("create_Node_Number").trim();
            String beType = "Line of Business";
            String type=request.getParameter("beType").trim();
            String[][] data = {{"ID", "MODEL_ID", "COMMENT", "NAME", "NUMBER", "TYPE","UNIT_TYPE"},
            {myid, mod_id, comment, myname, Number, beType,type}};

            myout = Arrays.deepToString(data);

            db.setInsert(XMLDataModel.BUSINESS_ENTITY_TABLENAME, data);

            myout = Arrays.deepToString(data);

            myout += parenttype;

            outID = myid;

            if (parenttype.equalsIgnoreCase("corporate")) {

                String myid2 = Utils.getNewID();
                String[][] dataxref = {{"ID", "MODEL_ID", "CORPORATE_FROM_ID", "BE_TO_ID", "UTILIZATION_FREQUENCY"},
                {myid2, mod_id, parentId, myid, "" + Link}};

                myout += Arrays.deepToString(dataxref);

                //  out.print(myout);
                myout += db.setInsert(XMLDataModel.CORPORATE_BE_TABLENAME, dataxref);

                // out.print(myout);
            } else {
                String myid2 = Utils.getNewID();
                String[][] dataxref = {{"ID", "MODEL_ID", "BE_FROM_ID", "BE_TO_ID", "UTILIZATION_FREQUENCY"},
                {myid2, mod_id, parentId, myid, "" + Link}};

                db.setInsert(XMLDataModel.BE_BE_TABLENAME, dataxref);

            }

            
            
            
            
            
            
            
            
            
            
            
        }else {
            String comment = request.getParameter("bpDes").trim();
            String myname = request.getParameter("bpName").trim();
            String selector = request.getParameter("selector").trim().trim();

            String duration = request.getParameter("duration").trim();

            //   out.print(SELECTOR);
            String days = request.getParameter("days").trim();
            String hrs = request.getParameter("hours").trim();
            String mins = request.getParameter("minutes").trim();
            String seconds = request.getParameter("seconds").trim();

            if (selector.equals("1")) {

                duration = "" + (Double.parseDouble(days) * (60 * 60 * 24) + Double.parseDouble(hrs) * (60 * 60) + Double.parseDouble(mins) * (60) + Double.parseDouble(seconds));
            }
            String[][] data = {{"ID", "MODEL_ID", "COMMENT", "NAME", "SELECTOR", "DURATION"},
            {myid, mod_id, comment, myname, selector, duration}};

            myout = Arrays.deepToString(data);

            out.print(db.setInsert(XMLDataModel.BUSINESS_PROCESS_TABLENAME, data));

            outID = myid;

            String myid2 = Utils.getNewID();
            String[][] dataxref = {{"ID", "MODEL_ID", "BE_FROM_ID", "BP_TO_ID", "UTILIZATION_FREQUENCY"},
            {myid2, mod_id, parentId, myid, "" + Link}};
            out.print(db.setInsert(XMLDataModel.BE_BP_TABLENAME, dataxref));

            String myid3 = Utils.getNewID();
            String[][] dataStart = {{"ID", "MODEL_ID", "NAME", "TAG", "PARENT_ID"},
            {myid3, mod_id, "start", "start", myid}};
            out.print(db.setInsert(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, dataStart));

        }

    } else {

        String name = request.getParameter("name").trim();
        String des = request.getParameter("des").trim();

        if (request.getParameter("pro_id") == null) {

            String[][] data = {{"name", "descfull", "owner", "cid", "gid"}, {name, des, us.userReturn(request, "username"), us.userReturn(request, "cid"), us.userReturn(request, "gid")}};
            myout = Arrays.deepToString(data);
            db.setInsert(XMLDataModel.PROJECT_TABLENAME, data);
            db.openCon();
            ResultSet max = db.getData(XMLDataModel.PROJECT_TABLENAME, " max(pid) as pid2 ");
            max.next();
            out.print(max.getString("pid2"));

            session.setAttribute("myproID", max.getString("pid2"));

        } else {

            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            String currentDate = dateFormat.format(date);

            String Lid = Utils.getNewID();

            String mid = Utils.getNewID();

            String[][] data = {{"ID", "MODEL_NAME", "COMMENT", "OWNER", "VERSION", "CREATION_DATE", "REPRESENTATION_DATE", "DEFAULT_CATALOG_SYSTEM"},
            {mid, name, des, us.userReturn(request, "username"), "18", currentDate, currentDate, "1"}};

            myout = Arrays.deepToString(data);
            db.setInsert(XMLDataModel.MODEL_TABLENAME, data);

            String[][] loacData = {{"ID", "MODEL_ID", "NAME", "PATH", "TYPE", "VISIBLE"}, {Lid, mid, "Global", "Global", "Region", "0"}};
            db.setInsert(XMLDataModel.LOCATION_TABLENAME, loacData);

            String[][] data2 = {{"pid", "mid"}, {request.getParameter("pro_id"), mid}};
            myout = Arrays.deepToString(data);
            db.setInsert(XMLDataModel.PMXREF_TABLENAME, data2);
            out.print(mid);
            session.setAttribute("mymodeID", mid);

        }

    }

    out.print(outID);

    db.closeCon();
%>