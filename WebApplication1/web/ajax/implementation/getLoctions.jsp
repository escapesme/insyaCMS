<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();
    String modID = request.getParameter("modID");
    ResultSet rs = db.getData(XMLDataModel.LOCATION_TABLENAME, "*", "TYPE='City' and CLOUD_ID='-1' and MODEL_ID=" + modID);
    String returnData = "";
    while (rs.next()) {
        returnData += rs.getString("ID") + "__" + rs.getString("NAME")+";";
    }
    out.print(returnData); 
     db.closeCon();
%>