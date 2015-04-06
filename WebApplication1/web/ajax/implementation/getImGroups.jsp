<%@page import="javax.xml.bind.annotation.XmlAccessOrder"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%

    String id = request.getParameter("id");
    lib.engine.db.operations db = new lib.engine.db.operations();

    db.openCon();
    ResultSet rs = db.getData(XMLDataModel.NET_GROUP_TABLENAME, "*", "LOCATION_ID=" + id);
    String data = "";
    while (rs.next()) {
        data += rs.getString("id")+"__"+rs.getString("NAME") + ";";
    }
    db.closeCon();
    out.print(data);

    %> 