<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();

    db.openDBCon(lib.Options.DbInfo.connectionStringUsers);
    ResultSet rs = db.getData(XMLDataModel.USER_TABLENAME, "*", "cid='" + request.getParameter("cid") + "'");
    out.print("<table class=\"data_grid users\">");

    out.print("<thead><th>User Name</th></thead>");
    
    int nu=0;
            String style="";
    while (rs.next()) {

        nu++;
     
        
           if (style.equals("")) {
                    style = "one";
                } else {
                    style = "";
                }
        
        
        
        out.print("<tr class='"+style+"' id='" + rs.getString("username") + "'><td>" + rs.getString("username") + "</td></tr>");

    }
    out.print("</table>");


    db.closeCon();
    %>