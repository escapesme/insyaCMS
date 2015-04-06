<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
  lib.engine.db.operations db = new lib.engine.db.operations();
  
    String nodeId = request.getParameter("id");
     String mid = db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + nodeId)[1];
     int rows=db.getRowCount(XMLDataModel.NODE_EXT_TABLENAME, "ID="+nodeId);
    String space = request.getParameter("space");
    String capacity = request.getParameter("capacity");
    String heat = request.getParameter("heat");
    String energy = request.getParameter("energy");
    String mtbf = request.getParameter("mtbf");
    String mttr = request.getParameter("mttr");
    String uptime = request.getParameter("uptime");
    String serviceLevel = request.getParameter("serviceLevel").trim();
    String checked = request.getParameter("checked");
    String failNode = request.getParameter("failNode");
    String delay = request.getParameter("delay");
    String failOver="";
    String costType="";
    String costValue;
    String addCost=request.getParameter("costChecked");
     db.setDelete(XMLDataModel.COST_TABLENAME, "OBJECT_ID="+nodeId);
    if(checked.equalsIgnoreCase("checked")){
        failOver="1";
    }else{
           failOver="0";
    }
    if(failNode.equals("")){
         String[][] data = {
            {"ID", "MODEL_ID", "FOOTPRINT", "ENERGY_USAGE", "HEAT_EMISSION", "FAILOVER",  "MTBF", "CAPACITY", "MTTR", "FAILOVER_DELAY", "NODESLG", "EXPUPTIME"},
            {nodeId, mid, space, energy, heat, failOver, mtbf, capacity,mttr, delay, serviceLevel, uptime}
        };
    if(rows>=1){
        out.print(db.setUpdate(XMLDataModel.NODE_EXT_TABLENAME, data,"ID="+nodeId));
    }else{
             out.print(db.setInsert(XMLDataModel.NODE_EXT_TABLENAME, data));
    }
    
    }else{
         String[][] data = {
            {"ID", "MODEL_ID", "FOOTPRINT", "ENERGY_USAGE", "HEAT_EMISSION", "FAILOVER", "FAILOVER_NODE", "MTBF", "CAPACITY", "MTTR", "FAILOVER_DELAY", "NODESLG", "EXPUPTIME"},
            {nodeId, mid, space, energy, heat, failOver, failNode,mtbf, capacity,mttr, delay, serviceLevel, uptime}
        };
    
  if(rows>=1){
        out.print(db.setUpdate(XMLDataModel.NODE_EXT_TABLENAME, data,"ID="+nodeId));
    }else{
             out.print(db.setInsert(XMLDataModel.NODE_EXT_TABLENAME, data));
    }
    }
     if(addCost.equalsIgnoreCase("checked")){
        costType=request.getParameter("costType");
        costValue=request.getParameter("costValue");
        String newId=Utils.getNewID();
       
          String[][] data = {
            {"ID", "MODEL_ID", "TYPE_ID", "OBJECT_CLASS", "OBJECT_ID", "VALUE"},
            {newId, mid, costType, "com.acrtek.xact.data.bo.BoNode", nodeId, costValue}
        };
            out.print(db.setInsert(XMLDataModel.COST_TABLENAME, data));
    }




%>