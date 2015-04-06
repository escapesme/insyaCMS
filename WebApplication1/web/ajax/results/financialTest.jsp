<%@page import="xact.utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="lib.engine.db.operations"%>
<%@page import="xact.results.FinancialView"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lib.tools.Utils"%>
<%
xact.users.users us = new xact.users.users();
    String Cid = us.userReturn(request, "cid");
    String Gid = us.userReturn(request, "gid");
    String pro_id=request.getParameter("pro_id");
    String mod_id=request.getParameter("modId");
    String scenarioId=request.getParameter("sid");
   utils u=new utils();
    FinancialView fi = new FinancialView();

    String bbid = request.getParameter("bpid");
     String resultId = "";
    String modName = "";
    
        resultId = getResultID(mod_id, scenarioId);
       modName = getModName(mod_id, scenarioId);
        int planPoints = fi.getpp(resultId);
      //  out.print(modName);
        ArrayList<String> acList = fi.getACList(bbid,mod_id, scenarioId);
        int index = fi.getACWithMaxRate(mod_id, scenarioId, acList);
       fi.getMaxRate(acList.get(index), resultId, modName, planPoints);
        
     out.print("<h2>Active Components for Business Process:"+Utils.getBPName(bbid) +" in "+modName+"</h2>");
   out.print("<table border='2'><thead><th>Application Component</th><th>Server</th></thead>");
  String data=fi.test;
  String[]dataBits=data.split("__");
  for(int i=0;i<dataBits.length;i++){
      String []status=dataBits[i].split(";");
      out.print("<tr><td>"+status[0]+"</td><td>"+status[1]+"<td></tr>");
  }

  
  if(u.isBatch(bbid)){
      String elongation = fi.getElongation(bbid, mod_id, scenarioId, planPoints);
    out.print("</table>");
      out.print("<h2>Computed Dyration, Window Duration and Dynamic Complexity Values</h2>");
   out.print("<table border='2'><thead><th>Point</th><th>Computed Dyration</th><th>Window Duration</th><th>Dynamic Complexity</th></thead>");
  String data2=fi.test2;
 
  String[]dataBits2=data2.split("__");
  for(int i=0;i<dataBits2.length;i++){
      String []status=dataBits2[i].split(";");
      out.print("<tr><td>"+i+"</td><td>"+status[0]+"</td><td>"+status[1]+"</td><td>"+status[2]+"</tr>");
  }

    out.print("</table>");
     }
%>
<%!
lib.engine.db.operations db = new operations();
 public  String getMOdelId(String sid) throws SQLException {
        String mid = "";
        ResultSet rs = db.getData(XMLDataModel.SCENARIO_TABLENAME, "*", "ID=" + sid);
        if (rs.next()) {
            mid = rs.getString("MODEL_ID");
        }
        return mid;
    }
public  String getModName(String mod_id, String sid) {

        String data = "";

        if (sid.equals("0")) {


            data = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id)[4];

        } else {

            data = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid)[3];


        }
        return data;

    }
String getResultID(String mod_id, String sid) {
        String data = mod_id;
        if (sid != null) {
            if (!sid.equals("0") && !sid.equals("")) {


                data = sid;

            }
        }

        return data;

    }


%>