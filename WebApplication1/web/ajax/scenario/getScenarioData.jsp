<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String id = request.getParameter("id");
    String MODEL_ID = request.getParameter("modid");

    lib.engine.db.operations db = new lib.engine.db.operations();
    String[] sData = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "ID='" + id + "'");
    String[] cData = db.getRow(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID='" + MODEL_ID + "'");
    
    
    
    String number = Utils.getScenarioPram(MODEL_ID, id, cData[0], "NUMBER", cData[3], "com.acrtek.xact_services.data.bo.BoCorporate");
    
    
    String WINDOW_DURATION = Utils.getScenarioPram(MODEL_ID, id, cData[0], "WINDOW_DURATION", cData[5], "com.acrtek.xact_services.data.bo.BoCorporate");
    String WINDOW_DURATION_type = Utils.getScenarioPram(MODEL_ID, id, cData[0], "WINDOW_DURATION_TYPE", cData[6], "com.acrtek.xact_services.data.bo.BoCorporate");
   


          String returnData = sData[3] + "," + number + "," + WINDOW_DURATION + "," + sData[4] + "," + WINDOW_DURATION_type;
    out.print(returnData);


%>