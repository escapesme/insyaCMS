<%@page import="xact.MDLOperations"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>

<%

    lib.engine.db.operations db = new lib.engine.db.operations();

    boolean status = true;
    String MODEL_ID = request.getParameter("MODEL_ID");
    String sid = request.getParameter("sid");

    String check = request.getParameter("check");
    db.openCon();
    ResultSet rs = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID=" + MODEL_ID);
    while (rs.next()) {
        if (rs.getString("COUNTER_ID").equalsIgnoreCase("null") && check.equalsIgnoreCase("1")) {
            status = false;
        }
    }
    db.closeCon();

    if (status) {

        MDLOperations i = new MDLOperations();

        String rid = MODEL_ID;

        if (!sid.equalsIgnoreCase("null") && !sid.equalsIgnoreCase("")) {
            rid = sid;
        }
        i.buildCase(MODEL_ID);
    } else {
        out.print(status);
    }


%>