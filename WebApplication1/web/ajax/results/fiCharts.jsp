

<%@page import="lib.tools.Utils"%>
<%@page import="com.mysql.jdbc.Util"%>
<%@page import="java.util.Arrays"%>
<%
    String[] val = request.getParameter("val").split("__");
    String[] val1 = request.getParameter("val1").split("__");
    String[] val2 = request.getParameter("val2").split("__");



    String modid = request.getParameter("modid");
    String bpid = request.getParameter("bpid");

    String bpName = Utils.getBPName(bpid);

    String Sname = Utils.getModName(modid);
    int points=(int)(val.length);


%>




<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.0.min.js"></script>

<script type="text/javascript">
  
    function addChart(divId){
        google.load("visualization", "1", {packages:["corechart"]});
       
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('number', 'Points');
            data.addColumn('number', 'Production Efficiency');
            data.addColumn('number', 'Cost Efficiency');
            data.addColumn('number', 'Dynamic Complexity');

    <% for (int i = 0; i < val.length; i++) {
            out.print("data.addRow([" + i + ", " + val[i] + ", " + val1[i] + ", " + val2[i] + "]);");

        }%>
                    var points=<%=points%>;
                    var gridlines="";
                    if(points<10){
                        gridlines=",gridlines:{count:"+ 10+"}";
                    }
                    //alert(gridlines);
                    var options = {
                        width: '100%',
                        height: 275,
                        title: '<%=Sname + " - " + bpName%>',
                       
                        lineWidth:1,
                        chartArea:{left:80,top:50, width:"70%",height:"55%"},
                        pointSize: 3,
                        legend: 'none',

                        vAxis: {title: "Value", titleTextStyle: {color: "green"}},
                        hAxis: {title: "Plan Points", titleTextStyle: {color: "green"}+gridlines}
                        //
                    };

                    var chart = new google.visualization.ScatterChart(document.getElementById(divId));
                    chart.draw(data, options);
                    
                    google.visualization.events.addListener(chart, 'ready',
                    function() {
                      
                    });
      
    
                }
    
    
    
            }
       
 
         
          
         
            addChart("chart_div");    
            
         
    
</script>

<div id="chart_div" style="width: 100%; height:100%">
</div>


