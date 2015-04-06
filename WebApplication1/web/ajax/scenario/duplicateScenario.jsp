<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.results.resultes"%>
<%
  /*  lib.engine.db.operations db = new lib.engine.db.operations();

    db.openCon();

    ResultSet rs = db.getData( XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "*", "SCENARIO_ID=" + request.getParameter("parent_id"));

    while (rs.next()) {



        String[] arrfiles = {"MODEL_ID",  "OBJECT_ID", "OBJECT_CLASS", "S_PARAMETER", "NEW_VALUE", "OLD_VALUE", "SCENARIO_ID"};
        String[] arrvalues = {rs.getString("MODEL_ID"),  rs.getString("OBJECT_ID"), rs.getString("OBJECT_CLASS"), 
        rs.getString("S_PARAMETER"),  request.getParameter("NEW_VALUE"),  rs.getString("OLD_VALUE"), request.getParameter("id")};
        String[][] dbdata = {arrfiles, arrvalues};

    out.print(db.setInsertNocon( XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, dbdata));
        
        
        
    }
  db.closeCon();*/



   

%>