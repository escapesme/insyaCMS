<%@page import="lib.tools.Utils"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.xml.transform.Result"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();
    String id = request.getParameter("id");

    String[] ids = id.split("__");
    String resultId=Utils.getResultID(ids[1], ids[2]);

    db.openDBCon(lib.Options.DbInfo.connectionStringRes);




    
    out.print("<table>");
    out.print("<thead><th style=\"width:20%\">LOG TIME</th><th style=\"width:80%\">MSG TEXT</th></thead>");

    String Where = "";
/*
    if (request.getParameter("date") != "") {
        
        
        
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        
        Date today = df.parse(request.getParameter("date"));
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        
        String folderName = formatter.format(today);
        
        
        
        
        Where = "COMP_ID='" + comcon + "'";

    } else {

       
    }*/

 Where = "COMP_ID='" + resultId + "' ORDER BY `LOG_TIME` DESC";



    ResultSet rse = db.getData(XMLDataModel.COMPUTE_MSG_LOG_TABLENAME, "*", Where);
    while (rse.next()) {
        out.print("<tr><td>" + rse.getString("LOG_TIME") + "</td><td>" + rse.getString("MSG_TEXT") + "</td></tr>");
    }
    db.closeCon();


    out.print("</table>");


%>
