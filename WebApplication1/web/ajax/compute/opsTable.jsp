<%-- 
    Document   : opsTable
    Created on : Feb 7, 2013, 3:55:06 PM
    Author     : ismil
--%>


<%@page import="xact.users.users"%>


<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>





<%

    String mod_id = request.getParameter("mod_id");

    String sid = "";
    if (request.getParameter("sid") != null) {

        sid = request.getParameter("sid");

    }

    String print_id_b = request.getParameter("print_id_b");
    String print_id_a = request.getParameter("print_id_a");



    if (print_id_b != null && print_id_b.equals("")) {
        print_id_b = mod_id;
    }
    if (print_id_b != null && print_id_a.equals("")) {
        print_id_a = mod_id;
    }
%>



<%
    xact.ArrivalRateCalculator a = new xact.ArrivalRateCalculator();


    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();
    ResultSet rs = db.getData(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "*", "model_id='" + mod_id + "'");




    out.print("<table class='data_grid'><thead><th>Name</th><th>RefModel</th><th>Override</th> <thead>");

    while (rs.next()) {
        String Override_val = lib.tools.Utils.getScenarioPram(mod_id, sid, rs.getString("id"), "NUMBER", rs.getString("number"), "com.acrtek.xact_services.data.bo.BoBusinessEntity");


        if (!rs.getString("number").equalsIgnoreCase("-1")) {

            //   Utils.getScenarioPram(mod_id, id, rs.getString("id"), "NUMBER", rs.getString("number") , "com.acrtek.xact_services.data.bo.BoCorporate");


            out.print("<tr><td>" + rs.getString("name") + "</td>"
                    + "<td>" + rs.getString("number") + "</td><td>"
                    + "<input type=\"hidden\" class=\"bb_id\" name=\"obs_id\" value=\"" + rs.getString("id") + "\" >"
                    + "<input type=\"text\" style=\"width:98%;\" name=\"Override\" class=\"Override\" id=\"" + rs.getString("number") + "\" value=\"" + Override_val + "\" ></td></tr> ");
        }
    }

    out.print("<table/>");

    db.closeCon();
%>
