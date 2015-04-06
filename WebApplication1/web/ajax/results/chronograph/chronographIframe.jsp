
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="xact.results.ChronoResults"%>
<%@page import="lib.tools.Utils"%>
<!-- Place this tag in your head or just before your close body tag -->
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>

<script src="/Xact/includes/js/jgantt/RGraph.common.core.js" ></script>
<script src="/Xact/includes/js/jgantt/RGraph.common.tooltips.js" ></script>
<script src="/Xact/includes/js/jgantt/RGraph.gantt.js" ></script>
<!--[if lt IE 9]><script src="/Xact/includes/js/jgantt/excanvas.original.js"></script><![endif]-->

<%




    String res_id = request.getParameter("res_id");

    String id = request.getParameter("id");
    String[] results = res_id.split("__");
    String results_id = Utils.getResultID(results[1], results[2]);
    String modelName = Utils.getModName(results[1], results[2]);
    ChronoResults cr = new ChronoResults(results_id, modelName);
    cr.getdata(id);
    ArrayList<String> mydata = cr.mydata;
    /*out.print("startdate for bp"+cr.getbpStartdate());
    out.print("end date for bp"+cr.getbpEnddate()+"<br>");
    out.print(Arrays.deepToString(mydata.toArray()));*/



%>

<script>
    window.onload = function ()
    {
        gantt1 = new RGraph.Gantt('cvs');
        gantt1.Set('chart.xmax', 122);
        gantt1.Set('chart.gutter.right', 35);
        gantt1.Set('chart.labels', ['January', 'February', 'March', 'April']);
        gantt1.Set('chart.title', 'Work schedule for Xyz Ltd');
        gantt1.Set('chart.defaultcolor', '#faa');
        gantt1.Set('chart.background.grid', false);

        if (!RGraph.isOld()) {
            gantt1.Set('chart.tooltips', ["<b>Richard Crenshaw</b><br />Working through adding something<br /> to the website.",
                null,
                "<b>Rachel Higgenbottom</b><br />Singing sweetly",
                "<b>Rachel Higgenbottom(2)</b><br />Still singing very nicely",
                "<b>Fred Bloggs</b><br />Building a new drive",
                "<b>Barney Rubble</b><br />Not started adding the new garden",
                "<b>Gloria Crockford</b><br />Just started dinner",
                "<b>Paul Josford</b><br />Nearly finished the front garden",
                "<b>Harry Secjom</b><br />Roughly half way through the book reading",
                "<b>Shane Ritchford</b><br />Comedian",
                "<b>Kyle Jasford</b><br />Gardening",
                "<b>Cynthia Frances</b><br />Not entirely sure what she's doing",
                "<b>Mabel Mincy</b><br />Making more lunches",
                "<b>Paul MacFord</b><br />Putting everyone off their work",
                "<b>Kiffen Longbottom</b><br />Farming Maize",
                "<b>John Blussford</b><br />A deer"]);
            gantt1.Set('chart.tooltips.effect', 'expand');
        }

        gantt1.Set('chart.events', [
            [[31, 28, 67, 'Richard'], [90,15, 50, null, 'blue', 'red']],
            
            [[0, 28, 50, 'Rachel'], [80,25, 74]],
            [12, 28, 45, 'Fred'],
            [59, 14, 0, 'Barney'],
            [59, 21, 5, 'Gloria'],
            [46, 31, 92, 'Paul'],
            [80, 21, 46, 'Harry'],
            [94, 17, 84, 'Shane'],
            [34, 14, 32, 'Kyle'],
            [64, 14, 28, 'Cynthia'],
            [13, 61, 74, 'Mabel'],
            [84, 31, 16, 'Paul'],
            [100, 22, 45, 'Kiffen'],
            [0, 365, 50, 'John']
        ]);
        var color = 'rgba(192,255,192,0.5)';
        gantt1.Set('chart.vbars', [
            [0, 10, color],
            [20, 10, color],
            [40, 10, color],
            [60, 10, color],
            [80, 10, color],
            [100, 10, color]
        ]);
        gantt1.Set('chart.borders', false);
        gantt1.Set('chart.title.vpos', 0.6);
        gantt1.Set('chart.labels.align', 'bottom');
        gantt1.Draw();
    }
</script>





<script>
    if (RGraph.isOld()) {
        document.write('<div style="background-color: #fee; border: 2px dashed red; padding: 5px"><b>Important</b><br /><br /> Internet Explorer does not natively support the HTML5 canvas tag, so if you want to see the charts, you can either:<ul><li>Install <a href="http://code.google.com/chrome/chromeframe/">Google Chrome Frame</a></li><li>Use ExCanvas. This is provided in the RGraph Archive.</li><li>Use another browser entirely. Your choices are Firefox 3.5+, Chrome 2+, Safari 4+ or Opera 10.5+. </li></ul> <b>Note:</b> Internet Explorer 9 fully supports the canvas tag.</div>');
    }
</script>




<div style="text-align: center">
    <canvas id="cvs" width="850" height="300">[No canvas support]</canvas>
</div>


<%!    lib.engine.db.operations db = new lib.engine.db.operations();

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








