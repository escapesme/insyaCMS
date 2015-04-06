<%-- 
    Document   : diagnosisTest
    Created on : Mar 21, 2013, 3:35:53 PM
    Author     : Ahmed
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lib.tools.Utils"%>
<%
    xact.users.users us = new xact.users.users();
    String Cid = us.userReturn(request, "cid");
    String Gid = us.userReturn(request, "gid");
    String pro_id = request.getParameter("pro_id");
    String mod_id = request.getParameter("modId");
    String sce_id = request.getParameter("sid");
    String th_poent = request.getParameter("point");
    xact.results.resultes res = new xact.results.resultes(pro_id, mod_id, sce_id, th_poent, Cid, Gid);
    String list = res.getlsit_1();
    String list2=res.getAciList();
    String avs=res.av_itmes();
    ArrayList acList=res.processedAc;
    ArrayList aciList=res.processedAci;
    //out.print(list);
    res.getPro_idx();
    res.getEffciency();
    
   out.print("<h2>Active Components for Model:" + Utils.getModName(mod_id, sce_id) + "_" + th_poent + "</h2>");
    out.print("<table border='2'><thead><th>NO.</th><th>Application Component</th><th>Server</th><th>Found in AC</th><th>Found in Aci</th></thead>");
    String data = res.testAci;
    String inAc="";
    String inAci="";
    String[] dataBits = data.split("__");
    for (int i = 0; i < dataBits.length; i++) {
        inAc="No";
        inAci="No";
        
        String[] status = dataBits[i].split(";");
        if(acList.contains(status[0]+status[1])){
            inAc="Yes";
        }
        if(aciList.contains(status[0]+status[1])){
            inAci="Yes";
        }
        out.print("<tr>"+"<td>" + i+ "</td><td>" + status[0] + "</td><td>" + status[1] + "</td><td>" + inAc + "</td><td>" + inAci + "</td></tr>");
    }

    out.print("</table>");
    out.print("<h2>Excluded Components for Model:" + Utils.getModName(mod_id, sce_id) + "_" + th_poent + "</h2>");
    out.print("<table border='2'><thead><th>NO.</th><th>Excluded Component</th><th>Server</th><th>Excluded because</th></thead>");
    String data2 = res.test2Aci;
    String[] dataBits2 = data2.split("__");
    for (int i = 0; i < dataBits2.length; i++) {
        String[] status = dataBits2[i].split(";");
        out.print("<tr><td>"+i+"<td>" + status[0] + "</td><td>" + status[1] + "</td><td>" + status[2] + "</td></tr>");
    }

    out.print("</table>");

    String data3=res.test3;
    double acRisk=res.rexindex(list, avs);
    double aciRisk=res.rexindex(list2, avs);
    out.print("<h2>Risk Index Values</h2>");
 out.print("Risk Index Due to AC List: "+acRisk);
 out.print("<br>Risk Index Due to ACI List: "+aciRisk);
     out.print("<h2>Productivity Index Debug Data</h2>");
 out.print(data3);
 
 
%>
