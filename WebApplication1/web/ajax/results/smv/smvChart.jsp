<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    google.load('visualization', '1.0', {'packages':['corechart']});
    
    google.setOnLoadCallback(drawChart);
      
    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
    
        //String vre= "net="+chrtnet+"&Transport="+chrtTransport+"&humen="+chrthumen+"&server="+chrtserver+"&machen="+chrtmachen;
    
        data.addRows([
            ['Servers', <%= request.getParameter("server")%>],
            ['Human', <%= request.getParameter("humen")%>],
            ['Network', <%= request.getParameter("net")%>], 
            ['Manchinery', <%= request.getParameter("machen")%>],
            ['Transportion', <%= request.getParameter("Transport")%>],
            ['Other', <%= request.getParameter("other")%>]
        ]);




        var options = {'title':'',
            'width':300,
            'height':200};


        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
</script>

<div style="border-radius:  18px; overflow: hidden; width:250px ;height:150px;" >
    <div id="chart_div" style="overflow: hidden; border-radius:  18px; margin-top: -30px; margin-left: -27px;  background:#000"></div>

</div>