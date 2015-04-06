<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.results.resultes"%>





<%
lib.engine.db.operations db=new lib.engine.db.operations();
db.openCon();
ResultSet rs= db.getData(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME ,"*","SCENARIO_ID="+request.getParameter("id"));

        while(rs.next()){
        
        out.print ( rs.getString("S_PARAMETER") +";"+getmyclass(rs.getString("OBJECT_CLASS"))+";"+ rs.getString("OLD_VALUE") +";"+ rs.getString("NEW_VALUE") +"__");
        
        }
        
        
        

db.closeCon();



%>

<%! 
String getmyclass(String Type){
    String retunData = "";
        if (Type.equalsIgnoreCase("corporate")) {

            retunData = "com.acrtek.xact_services_services.data.bo.BoCorporate";

        } else if (Type.equalsIgnoreCase("CORPORATE_BE")) {

            retunData = "com.acrtek.xact_services.data.bo.BoCorporateToBE";

        } else if (Type.equalsIgnoreCase("business_entity")) {

            retunData = "com.acrtek.xact_services_services.data.bo.BoBusinessEntity";

        } else if (Type.equalsIgnoreCase("be_be")) {

            retunData = "com.acrtek.xact_services.data.bo.BoBEToBE";

        } else if (Type.equalsIgnoreCase("BE_BP")) {

            retunData = "com.acrtek.xact_services.data.bo.BoBEToBP";

        } else if (Type.equalsIgnoreCase("group_node")) {

            retunData = "com.acrtek.xact_services.data.bo.BoNode";

        } else if (Type.equalsIgnoreCase("process")) {

            retunData = "com.acrtek.xact_services.data.bo.BoProcess";

        } else if (Type.equalsIgnoreCase("component")) {

            retunData = "com.acrtek.xact_services.data.bo.BoComponent";

        } else if (Type.equalsIgnoreCase("task")) {

            retunData = "com.acrtek.xact_services.data.bo.BoTask";

        } else if (Type.equalsIgnoreCase("act_xref")) {

            retunData = "com.acrtek.xact_services.data.bo.ActivityACListElement";

        } else if (Type.equalsIgnoreCase("message")) {

            retunData = "com.acrtek.xact_services.data.bo.BoMessage";

        } else if (Type.equalsIgnoreCase("Activity")) {

            retunData = "com.acrtek.xact_services.data.bo.BoActivity";

        } else if (Type.equalsIgnoreCase("service_link")) {

            retunData = "com.acrtek.xact_services.data.bo.BoSPVLine";

        } else if (Type.equalsIgnoreCase("lineconnector")) {

            retunData = "BoLine";

        } else {

            retunData = Type;

        }
        return retunData;
    }





%>