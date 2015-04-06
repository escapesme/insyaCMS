
<%@page import="xact.utils"%>
<%@page import="lib.Options.MyVariables"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>

<%

    xact.users.users us = new xact.users.users();
    lib.engine.db.operations db = new lib.engine.db.operations();
    String Cid = us.userReturn(request, "cid");
    String Gid = us.userReturn(request, "gid");

    utils u = new utils();

    int rs_num = db.getRowCount(XMLDataModel.PROJECT_TABLENAME, "(gid=" + Gid + " and cid=" + Cid + ") or (gid=0 and cid=0) ");

    db.openCon();

    ResultSet rs = db.getData(XMLDataModel.PROJECT_TABLENAME, "*", "(gid=" + Gid + " and cid=" + Cid + ")  or (gid=0 and cid=0) ");

    int i = 0;
    int x = 0;
   



   // out.print(db.isclose());
    String myclass = "on";
    while (rs.next()) {
        i++;
        x = 0;
        String clss = "";
        String clss2 = "";
        if (i == rs_num) {
            clss = "last";
        }
        if (myclass.equals("")) {
            myclass = "one";
        } else {
            myclass = "";
        }
        
        
        out.print("<tr class=\"" + myclass + "\"><td  class=\"" + clss + "\">"
                + "<a class=\"prolist_link\" id=\"" + rs.getString("pid") + "\" href=\"?alias=xact&pro_is=" + rs.getString("pid") + "\" ><span class=\"folder\">" + rs.getString("NAME") + "</span></a></td><td>" + rs.getString("descfull") + "</td></tr>");
    }

    db.closeCon();





%>



