
<%@page import="xact.results.ChronoResults"%>
<%@page import="java.util.HashMap"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.Connection"%>
<%@page import="lib.tools.EndTimeDisplay"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="lib.Options.MyVariables"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Arrays"%>
<%




    String res_id = request.getParameter("res_id");

    String id = request.getParameter("id");
    String[] results = res_id.split("__");




%>


<%!    

lib.engine.db.operations db = new lib.engine.db.operations();
    

   


String udara(String name, String from, String to, String des1, String des2, String color) {

        String mycolor = "ganttGreen";

        if (!color.equalsIgnoreCase("")) {
            mycolor = "ganttRed";


        }
        String data = "";
        if (from != "") {



            data = " {'name':'" + name + "','desc':'" + des1 + "','values':[{'from':\"/Date(" + from + ")/\" ,'to':\"/Date(" + to + ")/\""
                    + ",'desc':'" + des2 + "', 'label':'CRM','customClass':'" + mycolor + "'} ] }";




        }
        return data;
    }

%>




<script>
    
    function toTimestamp(strDate){
     
        var datum = Date.parse(strDate);
        
       
        return datum;

    }
</script>
<div class="gantt_p">
    <div style="position:relative" class="gantt" id="GanttChartDIV"></div></div>
<%
/*
 * 
 * 
    String data = ""
            + "<script type=\"text/javascript\">  "
            + "     var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'hour'); "
            + "g.setShowRes(0); "
            + " g.setShowDur(0); "
            + " g.setShowComp(0);"
            + " g.setCaptionType('Resource'); "
            + " g.setFormatArr(\"hours\",\"minutes\",\"day\",\"month\",\"Week\" ,\"Quarter\"  );       if( g ) {";



   String results_id = Utils.getResultID(results[1], results[2]);
    String modelName = Utils.getModName(results[1], results[2]);
    ChronoResults cr=new ChronoResults(results_id,modelName);

    cr.getdata(id);
    ArrayList<String> mydata = cr.mydata;
    String bpName = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + id)[3];
//out.print("sp_id=" + id + " AND MODEL_ID=" + results_id + " AND NAME='" + modelName + "_0'");
    db.openConres();
    double bpResponsetime = Double.parseDouble(db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + id + " AND MODEL_ID=" + results_id + " AND NAME='" + modelName + "_0'")[8]);
    // out.print("" + Arrays.deepToString(starts1.keySet().toArray()));
    // out.print("<br>" + Arrays.deepToString(starts1.values().toArray()));
    out.print("<br>" + cr.getbpEnddate());
    db.closeCon();
    String bpActualEnd = "";
    for (int i = 0; i < mydata.size(); i++) {

        String[] mydataarr = mydata.get(i).split("__");





        String coma = "";
        if (i > 0) {
            coma = ",";

        } else {
            //add here
            data += "  g.AddTaskItem(new JSGantt.TaskItem(12,  '" + bpName + "','" + bpstart + "','" + bpend + "',  '00ff00', '',0, '',   0, 0, 1, 1));";
            data += "  g.AddTaskItem(new JSGantt.TaskItem(12,  '','" + bpstart + "','" + bpActualEnd + "',  'CC0000', '',0, '',   0, 0, 1, 1));";

            data += coma + udara(bpName, "toTimestamp('" + cr.getbpStartdate() + "')", "toTimestamp('" + cr.getbpEnddate() + "')", "", "Name:" + bpName + ";<br/>From:" + cr.getbpStartdate() + ";<br/> To:" + cr.getbpEnddate() + "; ", "");
            coma = ",";
            data += coma + udara("", "toTimestamp('" + cr.getbpStartdate2() + "')", "toTimestamp('" + cr.getbpEnddate2() + "')", "", "Name:" + bpName + ";<br/>From:" + cr.getbpStartdate2() + ";<br/> To:" + cr.getbpEnddate2() + "; ", "red");
        }

        data += "  g.AddTaskItem(new JSGantt.TaskItem(12,  '" + mydataarr[0] + "','" + mydataarr[1] + "','" + mydataarr[2] + "',  '00ff00', '',0, '',   0, 0, 1, 1));";

        data += "  g.AddTaskItem(new JSGantt.TaskItem(12,  '','" + mydataarr[1] + "','" + mydataarr[3] + "',  'CC0000', '',0, '',   0, 0, 1, 1));";





    }








    data += "g.Draw();"
            + " g.DrawDependencies();"
            + " } else{ "
            + "alert(\"not defined\");"
            + "}"
            + "\n</script>";



    out.print(data);*/
%>


<iframe style='width:80%; height:80% ;overflow: auto; border:none' src='<%=MyVariables.siteUrl%>chart.jsp?id=<%= request.getParameter("id")%>&res_id=<%= request.getParameter("res_id")%>'>



</iframe>










<script>


       

      

    /*

        g.AddTaskItem(new JSGantt.TaskItem(1,   'Add minutes/hours',     		'',          		'',          		'ff0000', 'http://help.com',	 	0, 'Ilan',     0, 1, 0, 1));
        g.AddTaskItem(new JSGantt.TaskItem(11,  'Add support for half days',    '5/14/2009 14:00', 	'5/14/2009 15:30', 	'ff00ff', 'http://www.jsgantt.com', 0, 'Ilan',  100, 0, 1, 1));
        g.AddTaskItem(new JSGantt.TaskItem(12,  'Add minute view',         		'5/14/2009 16:00',  '5/14/2009 17:00',  '00ff00', '',						0, 'Ilan',   40, 0, 1, 1));
        g.AddTaskItem(new JSGantt.TaskItem(13, 	'Add hours view',     			'5/14/2009 16:00', 	'5/14/2009 17:00',  '00ffff', 'http://www.yahoo.com', 	0, 'Ilan', 60, 0, 1, 1));
        g.AddTaskItem(new JSGantt.TaskItem(14, 	'Add support for format options',     			'5/14/2009 18:00', 	'5/14/2009 19:00',  '00ffff', 'http://www.yahoo.com', 	0, 'Shlomy', 60, 0, 14, 1));

     */
       

</script>