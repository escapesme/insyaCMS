<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String retuData = "";
    lib.engine.db.operations db = new lib.engine.db.operations();
db.openCon();
    ResultSet res = db.getData(XMLDataModel.GROUP_TYPE_TABLENAME);

    while (res.next()) {

        retuData += ";" + res.getString("ID") + "__" + res.getString("NAME");
    }
    out.print(retuData);
db.closeCon();
%>