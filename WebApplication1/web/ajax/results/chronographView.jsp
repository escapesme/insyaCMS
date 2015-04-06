<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.Arrays"%>
<%@page import="xact.results.TimeBoxChronograph"%><%@page  import="lib.Options.MyVariables" %>

<%

    String js_link = MyVariables.jsFolder;
%>

<script type="text/javascript" src="<%=js_link%>escharts/jcanvas.min.js" ></script>
<script type="text/javascript" src="<%=js_link%>escharts/escanvas.js" ></script>
<script type="text/javascript" src="<%=js_link%>escharts/escharts.js" ></script>

<%
    String[] resdata = request.getParameter("res_id").split("__");
    String pro_id = resdata[0];
    String mod_id = resdata[1];
    String sce_id = resdata[2];

    String type = request.getParameter("type");
    int point = Integer.parseInt(request.getParameter("point"));
    TimeBoxChronograph tb = new TimeBoxChronograph(mod_id, sce_id, point);
    tb.getScenarioSeries();
    tb.fillDurations();
    tb.fillResults();
    //out.print(tb.test);
%>



<%!
    String rrTostring(ArrayList<String> data) {
        String Data = "";

        Data = "[";
        for (int i = 0; i < data.size(); i++) {
            Data += "'" + data.get(i) + "',";
        }
        Data += "]";
        return Data;

    }
%>


<script type="text/javascript" >
    $(function() {

        $("canvas").charts({
            point: "<%=point%>",
            proid: "<%=pro_id%>",
            moid: "<%=mod_id%>",
            sid: "<%=sce_id%>",
            cols:<%=   rrTostring(tb.seriesnames)%>,
            ids:<%=   rrTostring(tb.seriesIds)%>,
            rowids:<%=   rrTostring(tb.trajectories)%>,
            colsBottom:<%=  rrTostring(tb.durationsValues)%>,
            colsBottomView:<%=  rrTostring(tb.durations)%>,
            rows:<%=tb.bpData%>

        });
    })
</script>





<div class='toolTip'> hih  dfggfh gfhfghfgh</div>

<div style='overflow: auto'>
    <canvas  width="1000" height="300" style=" margin-top: 20px; cursor: auto;"></canvas>
</div>

<style>


    .toolTip{
        display: none;
        z-index: 10000000;
        position: absolute;
        background: rgba(0,0,0,0.8);
        color:#afa;
        font-size: 9pt;
        padding: 3px;
        border-radius: 10px; 
        width:auto
            ;
        height:auto
            ;
    }
</style>
