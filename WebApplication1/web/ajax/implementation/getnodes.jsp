<%@page import="javax.xml.bind.annotation.XmlAccessOrder"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%

    String id = request.getParameter("id");
    lib.engine.db.operations db = new lib.engine.db.operations();

    db.openCon();
    ResultSet rs = db.getData(XMLDataModel.NODE_TABLENAME, "*", "GROUP_ID=" + id);
    String data = "";
    while (rs.next()) {
        String more = "";
        if (request.getParameter("value") != null) {
            if (request.getParameter("value").equalsIgnoreCase(rs.getString("id"))) {

                more = "selected";
            }else{
            
                more = "";
            
            }
        }

        data += "<option "+more+" value='" + rs.getString("id") + "'>" + rs.getString("NAME") + "</option>";

    }
    db.closeCon();
    out.print(data);

%> 