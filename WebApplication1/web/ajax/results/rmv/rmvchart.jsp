<script type="text/javascript" src="https://www.google.com/jsapi"></script>


<% xact.results.rmv em = new xact.results.rmv(request.getParameter("modid"), request.getParameter("sid"),request.getParameter("point"));


    String mdata = "";



    if (request.getParameter("id") != null && !request.getParameter("id").trim().equals("")) {

        //    out.print("aa"+ request.getParameter("id"));


em.openConnections();



   mdata = em.getcharts(request.getParameter("id"), request.getParameter("part"), request.getParameter("type"), request.getParameter("mac"));

em.closeConnections();
      /*  mdata = request.getParameter("id") + "::" + request.getParameter("part") + "::" + request.getParameter("type") + "::"
                + request.getParameter("mac") + "::" + request.getParameter("modid") + "::" + request.getParameter("sid");



*/


    }
%>
<script type="text/javascript">
    google.load('visualization', '1.0', {'packages':['corechart']});
    
    google.setOnLoadCallback(drawChart);
      
    function drawChart() {
        var data = new google.visualization.DataTable();
      
      
       // alert ("<%=mdata%>")       ;        
      
      
      
        var mydata="<%=mdata%>";
        
        
     



 
        
        
        
        var arr=   mydata.split(";;;");
        
        
   
        
        data.addColumn('number', 'Slices');
        
        
 
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows(arr.length-1);
      
        for (var i=0;i<arr.length ;i++){
            var assr=   arr[i].split("___");
                 
         
            if (assr[0]!=""){
          
           
                data.setValue(i, 0, assr[0]);
                data.setValue(i, 1,  Number(assr[1]) );
           
           
            }
            
            
        }
      
      


        var options = {'title':'',
            'width':250,
            'height':250};
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
</script>

<div style="border-radius:  18px; overflow: hidden; width:250px ;height:150px;" >
    <div id="chart_div" style="overflow: hidden; border-radius:  18px; margin-top: -30px; margin-left: -27px;  background: #fff"></div>

</div>
