<%@page import="java.util.List"%>
<%@page import="xact.results.resultes"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.util.Arrays,javax.servlet.jsp.JspWriter;"%>
<%@ page import="java.io.*"  %>


<%@page  import="lib.Options.MyVariables" %>
<%
    String js_link = MyVariables.jsFolder;
    String siteLink = MyVariables.siteUrl;
%>

<script type="text/javascript" src="<%= siteLink%><%= js_link%>/xact/speedometer.js"></script>
<!--<script type="text/javascript" src="/Xact/<%=js_link%>/excanvas.js"></script>-->
<script>

 
    function show_data(div, data) {
        $("." + div).append(data);
    }


    function done() {

        showMyloading(".main", "start");
    }




    function gwt(ddt) {

        var headr = "<thead><th>Action</th><th>Time</th><th>Complexity</th></thead>";
        var Throughput = "<tr><td>Upgrade Resources</td><td>Short</td><td>Simple</td></tr>\n\
                        <tr><td>Distribute Processing</td><td>Medium</td><td>Complex</td></tr>\n\
                        <tr><td>Sunset/Delay Less Priority Tasks</td><td>Medium</td><td>Complex</td></tr>\n\
                        <tr><td>Optimize Database</td><td>Medium</td><td>Medium</td></tr>\n\
<tr><td>Re-Architect/Redesign</td><td>Long</td><td>Complex</td></tr>";

        var Elongation = "<tr><td>Remove Bottlenecks (All Levels)</td><td>Short to Medium</td><td>Simple to Complex</td></tr><tr><td>Clustering/Partition Tables</td><td>Medium</td><td>Medium</td></tr><tr><td>Re-Architect/Redesign</td><td>Long</td><td>Complex</td></tr><tr><td>Sunset/Delay Less Priority Tasks</td><td>Short to Medium</td><td>Medium</td></tr><tr><td>Upgrade Resources</td><td>Short</td><td>Simple</td></tr>"
        var CHR = "<tr><td>Reduce logical I/O's - Redesign</td><td>Medium to Long</td><td>Medium to Complex</td></tr><tr><td>Data-in-Memory and Clustering</td><td>Short to Medium</td><td>Medium</td></tr><tr><td>Separate supply from demand</td><td>Long</td><td>Complex</td></tr>";
        var Availability = "<tr><td>Repair/Change component</td><td>Short</td><td>Simple</td></tr><tr><td>Distribute processing</td><td>Short</td><td>Medium</td></tr><tr><td>Virtualization</td><td>Medium</td><td>Complex</td></tr>";
        if (ddt == "Avial_div") {


            $(".tbviewdata").html(headr + Availability);



        } else if (ddt == "Elong_div") {
            $(".tbviewdata").html(headr + Elongation);


        } else if (ddt == "CHR_div") {
            $(".tbviewdata").html(headr + CHR);


        } else if (ddt == "Throughput_div") {

            $(".tbviewdata").html(headr + Throughput);


        } else if (ddt == "") {

            $(".tbviewdata").html("");


        }







    }


    var mytype = "";






    $(".act_btt,.nact_btt").click(function() {

        var ddt = $(this).attr("id");

        $("label").removeClass("dact");
        $("lable").removeClass("dact");



        $("." + ddt + "_b").prev("label").addClass("dact");
        $("." + ddt + "_b").next("lable").addClass("dact");


        mytype = $(this).attr("id");

        $(".viewdata").html($("." + $(this).attr("id")).html());


    })



    $(".nact_btt").click(function() {
        $("label").removeClass("dact");

        $(this).prev("label").addClass("dact");

        $(".viewdata").html("");
        $(".tbviewdata").html("");
        $(".Impact_view").html("");



    })




</script>


<style>

    .dact{
        text-decoration: underline;
        font-weight: bold;
    }
</style>
<%

    String[] resdata = request.getParameter("res_data").split("__");
    String pro_id = resdata[0];
    String mod_id = resdata[1];
    String sce_id = resdata[2];
    String th_poent = request.getParameter("poent");

    String Beffciency = "63";
    String effciency = "63";;

    String pro_index = "";

    String ostvariation = "";

    xact.users.users us = new xact.users.users();
    String Cid = us.userReturn(request, "cid");
    String Gid = us.userReturn(request, "gid");
    xact.results.resultes res = new xact.results.resultes(pro_id, mod_id, sce_id, th_poent, Cid, Gid);
    //out.print(pro_id+"::"+"::"+mod_id+"::"+sce_id+"::"+Cid+"::"+Gid);
    boolean up = true;
    double riskindex = 1;
    double compgrade = 35;
    String Avial_sl = "";
    String Elong_sl = "";
    String CHR_SL = "";
    String Throughput_sl = "";
    String viewdata = "";
    String Throughput_slstyle = "";
    String CHR_SLstyle = "";
    String Elong_slstyle = "";
    String Avial_slstyle = "";
    String myred = "do_red act_btt bt_des";
    String mygreen = "do_green  nact_btt bt_des";
    String myyallow = "do_yall act_btt bt_des";

    String av_list = res.av_itmes();

    String list = res.getAciList();
    effciency = res.getEffciency();
    pro_index = res.getProductivityIndex();
    //  out.print("pr"+pro_index);

    if (pro_index == null || pro_index.equals("") || pro_index.equalsIgnoreCase("nan")) {
        pro_index = "0";

    }

    Beffciency = "" + res.getBatchEfficiency();
    compgrade = res.getComplexityGradient();
    //out.print(res.test);

    riskindex = res.getRiskIndex(list, av_list);
    ostvariation = "" + res.getCostvariation();

//   out.print(res.returndata2);
    ////////////////////////////////////////////////////////////////////////////////////////////////// Throughput_sl & Elong_sl;
    String[] dataup1 = list.split("///");

    String Throughput_style_arrya = "";
    String CHR_SLstyle_array = "";
    String Elong_style_array = "";
    String Avial_style_array = "";

    ArrayList<String> chrArray = new ArrayList<String>();
    ArrayList<String> throuArray = new ArrayList<String>();
    ArrayList<String> elonArray = new ArrayList<String>();

    for (int u1 = 0; u1 < dataup1.length; u1++) {

        String[] u1x = dataup1[u1].split("--");

        if (u1x.length > 1) {

            double d = Double.parseDouble(u1x[1]);
            //  out.print(d);
            if (Double.parseDouble(u1x[5]) < 3) {

                if (!throuArray.contains(u1x[0] + u1x[4])) {
                    if (d > 1) {
                        up = false;
                        Throughput_sl = "red";
                        Throughput_style_arrya += "red;";
                        viewdata = "<div  id=\"" + u1x[0] + ":" + u1x[4] + "\"  onclick=\"sh(this);\"  class=\"thered msg\"> <B>Component " + u1x[0] + "</B>on node" + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + "Resource near saturation  Bottleneck identified Parallelism insufficient  Servicetime elongation due to database performance ";
                        out.print("<script>show_data('Throughput_div' , '" + viewdata + "');\n</script>");
                        //Add text ?(component name) on node (server name Resource near saturation \n Bottleneck identified Parallelism insufficient \n Servicetime elongation due to database performance

                        throuArray.add(u1x[0] + u1x[4]);

                        // break;
                    } else if (d > 0.8 && d < 1) {

                        Throughput_sl = "yellow";
                        viewdata = "<div id=\"" + u1x[0] + ":" + u1x[4] + "\" onclick=\"sh(this)\"   class=\"theyellow msg\"><B>Component  " + u1x[0] + "</B> on node " + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + " Resource near saturation   Bottleneck identified Parallelism insufficient   Servicetime elongation due to database performance";
                        out.print("<script>show_data('Throughput_div' , '" + viewdata + "');\n</script>");

                        throuArray.add(u1x[0] + u1x[4]);
                        Throughput_style_arrya += "yellow;";

                        //  break;
                    } else {
                        Throughput_sl = "green";

                        Throughput_style_arrya += "green;";

                    }

                }
            } else {
                Throughput_sl = "green";

                Throughput_style_arrya += "green;";

            }

            if (!elonArray.contains(u1x[0] + u1x[4])) {

                if (Double.parseDouble(u1x[2]) > 100) {

                    up = false;

                    Elong_sl = "red";
                    viewdata = "<div  id=\"" + u1x[0] + ":" + u1x[4] + "\"  onclick=\"sh(this)\" class=\"thered msg\"> <B> Component " + u1x[0] + " </B>on node " + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + " has  Degradation in response time due to:  Resource saturation   Higher priority preemption  Physical I Os need redistribution  High number of logical I Os   Degradation due to code aging";
                    out.print("<script>show_data('Elong_div' , '" + viewdata + "');\n</script>");

                    elonArray.add(u1x[0] + u1x[4]);
                    Elong_style_array += "red;";

                } else if (Double.parseDouble(u1x[2]) < 100 && Double.parseDouble(u1x[2]) > 70) {
                    Elong_sl = "yellow";
                    viewdata = "<div  id=\"" + u1x[0] + ":" + u1x[4] + "\"  onclick=\"sh(this)\" class=\"theyellow msg\"> <B>Component " + u1x[0].replace("^/^", " on Node ") + " </B>on node " + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + " has -> Degradation in response time due to: Resource saturation   Higher priority preemption  Physical I Os need redistribution High number of logical I Os   Degradation due to code aging";
                    out.print("<script>show_data('Elong_div' , '" + viewdata + "');\n</script>");
                    elonArray.add(u1x[0] + u1x[4]);
                    Elong_style_array += "yellow;";
                } else {
                    Elong_sl = "green";

                    Elong_style_array += "green;";
                }

            }

            if (Double.parseDouble(u1x[3]) != 0) {
                if (!chrArray.contains(u1x[0] + u1x[4])) {

                    if (Double.parseDouble(u1x[3]) < 50) {
                        up = false;

                        CHR_SL = "red";

                        viewdata = "<div id=\"" + u1x[0] + ":" + u1x[4] + "\" onclick=\"sh(this)\" class=\"thered msg\"> <B>Component " + u1x[0].replace("^/^", " on Node ") + " </B>on node " + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + " has High number of logical I O s   High number of physical IO s    Cache too small   inefficient Select, Join   Index inefficiency   Cost escalation</div>";

                        out.print("<script>show_data('CHR_div' , '" + viewdata + "');\n</script>");
                        chrArray.add(u1x[0] + u1x[4]);
                        CHR_SLstyle_array += "red;";
                        //return;
                    } else if (Double.parseDouble(u1x[3]) > 50 && Double.parseDouble(u1x[3]) < 90) {

                        CHR_SL = "yellow";
                        viewdata = "<div id=\"" + u1x[0] + ":" + u1x[4] + "\"  onclick=\"sh(this)\" class=\"theyellow msg\"><B> Component " + u1x[0].replace("^/^", " on Node ") + "</B> on node " + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + " has High number of logical I O s   High number of physical IO s   Cache too small   inefficient Select, Join   Index inefficiency  Cost escalation</div>";
                        out.print("<script>show_data('CHR_div' , '" + viewdata + "');\n</script>");

                        chrArray.add(u1x[0] + u1x[4]);
                        CHR_SLstyle_array += "yellow;";
                    } else {

                        CHR_SL = "green";

                        CHR_SLstyle_array += "green;";

                    }

                }

            }
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////// Avial_sl
    if (av_list != null) {
//out.print("ffffffff");       

        String[] dataup3 = av_list.split("///");
        for (int u3 = 0; u3 < dataup3.length; u3++) {
            String[] u3x = dataup1[u3].split("--");

            double value = Math.abs(Double.parseDouble(u3x[1]) - Double.parseDouble(u3x[2])) / Double.parseDouble(u3x[2]);

            if (value < Double.parseDouble(u3x[3])) {
                up = false;
                Avial_sl = "red";

                viewdata = "<div id=\"" + u3x[0] + "\"  onclick=\"sh(this)\" class=\"thered  msg\"> <B>Component " + u3x[0].replace("^/^", " on Node ") + " </B> has exceeded its SLG, SLG possibly missed <br/> Outstanding on-time throughput<br/> Cost escalation<br/></div>";
                out.print("<script> show_data(\"Avial_div\" , '" + viewdata + "')\n; </script>");
                Avial_slstyle = myred;

                Avial_style_array += "red;";
            } else if (value < (1.0 - ((1.0 - Double.parseDouble(u3x[3])) * .8))) {

                Avial_sl = "yellow";
                viewdata = "<div  id=\"" + u3x[0] + "\" onclick=\"sh(this)\" class=\"theyellow msg\"> <B>Component " + u3x[0].replace("^/^", " on Node ") + "</B> has is approaching its SLG, SLG possibly missed <br/> Outstanding on-time throughput<br/>  Cost escalation<br/></div> ";
                out.print("<script> show_data(\"Avial_div\" , '" + viewdata + "')\n; </script>");
                Avial_style_array += "yellow;";

            } else {

                Avial_style_array += "green;";

            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////

    List<String> CHR_sarray = Arrays.asList(CHR_SLstyle_array.split(";"));
    List<String> Elong_sarray = Arrays.asList(Elong_style_array.split(";"));
    List<String> Avial_sarray = Arrays.asList(Avial_style_array.split(";"));

    List<String> Throughput_sarray = Arrays.asList(Throughput_style_arrya.split(";"));

    if (Throughput_sarray.contains("red")) {
        Throughput_slstyle = myred;
    } else if (Throughput_sarray.contains("yellow")) {
        Throughput_slstyle = myyallow;

    } else {

        Throughput_slstyle = mygreen;

    }

    if (Elong_sarray.contains("red")) {
        Elong_slstyle = myred;
    } else if (Elong_sarray.contains("yellow")) {

        Elong_slstyle = myyallow;
    } else {

        Elong_slstyle = mygreen;
    }

    if (CHR_sarray.contains("red")) {
        CHR_SLstyle = myred;
    } else if (CHR_sarray.contains("yellow")) {

        CHR_SLstyle = myyallow;
    } else {
        CHR_SLstyle = mygreen;
    }

    if (Avial_sarray.contains("red")) {
        Avial_slstyle = myred;
    } else if (Avial_sarray.contains("yellow")) {
        Avial_slstyle = myyallow;
    } else {
        Avial_sl = "green";
        Avial_slstyle = mygreen;
    }

    // out.print(Arrays.binarySearch(Throughput_sarray,"red888"));

%>




<div style="display: none;" class="Avial_div"></div>
<div style="display: none;"  class="Elong_div"></div>
<div style="display: none;"  class="CHR_div"></div>
<div style="display: none;"  class="Throughput_div"></div>


<%    if (riskindex > 100) {
        riskindex = 100;
    };
    if (riskindex < 0) {
        riskindex = 0;
    };

    if (compgrade > 200) {
        compgrade = 200;
    };


%>

<div class="div_top">
    <div class="rs_bt_close"> </div> 

    <a data-res_data="<%=request.getParameter("res_data")%>"  class="advanced_projection" ></a>

    <div class="div_rdk_top"> 
        <!--<div class="label_div">Risk Diagnosis Ratios </div>-->
        <div  class="bat Monthly_Availability"> 
            <div class="button">
                <label> Availability</label> 
                <div  class="<%=Avial_slstyle%> Avial_div_b" id="Avial_div"   ></div>
            </div></div>
        <div  class="bat Throughput"> <div class="button">
                <label>Throughput</label> 
                <div  class="<%=Throughput_slstyle%> Throughput_div_b" id="Throughput_div"  ></div> </div>
        </div>


        <div class="bat Singularity_Ebongation" >

            <div class="button">
                <label>Dynamic Complexity</label> <div class="<%=Elong_slstyle%> Elong_div_b " id="Elong_div" ></div>

            </div>
        </div>
        <div class="bat Data_Effciency"> 
            <div class="button"> 
                <label>Data Effeciency</label>
                <div class="<%=CHR_SLstyle%> CHR_div_b" id="CHR_div" ></div></div> </div>
    </div>





    <div class="top_data">


        <div class="div_rdk"> 
            <!--<div class="label_div">Risk Diagnosis Ratios </div>-->
            <div  class="bat Monthly_Availability">
                <div class="button">
                    <div  class="<%=Avial_slstyle%> Avial_div_b" id="Avial_div" ></div>

                    <lable> Availability</lable>
                </div> 
            </div>


            <div  class="bat Throughput"> <div class="button">
                    <div  class="<%=Throughput_slstyle%> Throughput_div_b" id="Throughput_div"  ></div> <lable>Throughput</lable> </div>
            </div>


            <div class="bat Singularity_Ebongation" >
                <div class="button"> <div class="<%=Elong_slstyle%> Elong_div_b" id="Elong_div"  ></div>
                    <lable>Dynamic Complexity</lable>
                </div>

            </div>
            <div class="bat Data_Effciency"> <div class="button"> 
                    <div class="<%=CHR_SLstyle%> CHR_div_b" id="CHR_div"></div><lable>Data Effciency</lable></div> </div>
        </div>
        <div class="div_main">

            <div class="all_pro pro_index">  <div class="label_div">Productivity index:</div> <div id="pro_index"><%=pro_index%></div></div>
            <div class="all_pro ostvariation"> <div class="label_div">Cost variation: </div> <div id="ostvariation"><%=ostvariation%></div></div>
            <div class="all_pro  effciency"> <div class="label_div">Efficiency ratio:</div>  <div id="effciency"><%=effciency%></div></div>
            <div class="all_pro Batchefficiency"> <div class="label_div">Batch efficiency:</div>     <div id="Batchefficiency"><%=Beffciency%> </div></div>
            <div class="all_pro Batchefficiency"> <div class="label_div">Complexity Gradient:     </div><div id="compgrade"><%=compgrade%></div></div>
            <div class="all_pro Batchefficiency"> <div class="label_div">Risk index :   </div> <div id="riskindex"><%=riskindex%></div></div>
        </div>


    </div>

</div>






<div class="div_bottom">

    <div class="bottom_data">


        <div class="diagnosis_div">
            <div class="me_title label_div">Diagnosis </div>
            <div class="viewdata">    </div>
        </div>

        <div class="Impact_div">
            <div class="me_title label_div">Impact Path </div>

            <div  class="Impact_view" >  </div>
        </div>

        <div class=" Posslble_div">   <div class="me_title label_div">Possible Remedies </div>  <table class="tbviewdata"></table></div>
            <%if (MyVariables.siteUrl.equalsIgnoreCase("/Xact2/")) {%>
        <div class='viewTest'> <input type="button" value="View Test" /></div>
            <%}%>
    </div>
</div>



<script>
    $(".viewTest").click(function() {

        var modId =<%=mod_id%>;
        var proId =<%=pro_id%>;
        var sid =<%=sce_id%>;
        var point =<%=request.getParameter("poent")%>;

        window.open(
                "ajax/results/diagnosisTest.jsp?modId=" + modId + "&sid=" + sid + "&proid=" + proId + "&status=diagnosis&point=" + point,
                '_blank' // <- This is what makes it open in a new window.
                );


    });
</script>


<style>

    .thered {
        background-color: lightcoral ;

    }

    .theyellow {
        background-color: lightgoldenrodyellow    ;

    }





    .div_bottom .me_title{
        background: #1E1E1E;
        position: absolute;
        top:0px;
        color:#fff;
    }
    .advanced_projection{
        display: block;
        background: url("images/advp.png") no-repeat;
        width: 128px;
        height: 28px;
        margin: auto;
        position: absolute;
        right: 32px;
        top: 10px;
        /* bottom: 10px;*/
        /*  left: 45%;
        */

    }
    .viewTest{
        display: block;

        width: 128px;
        height: 28px;
        margin-right: 150px;
        position: absolute;
        right: 32px;
        top: 10px;
        /* bottom: 10px;*/
        /*  left: 45%;
        */

    }

    .div_rdk_top .bat{
        margin-top: -20px;
    }
    .div_rdk_top{

        display: none;
    }



    .div_rdk_top .do_green{
        width:35px;
        height:35px;
        background: url("images/rs_top_gree.png") no-repeat;
        cursor: pointer;
    }

    .div_rdk_top .do_red{
        width:35px;
        height:35px;
        background: url("images/rs_top_red.png") no-repeat;   cursor: pointer;
    }
    .div_rdk_top .do_yall{
        width:35px;
        height:35px;
        background: url("images/rs_top_yall.png") no-repeat;   cursor: pointer;
    }

    .div_rdk .do_green{
        width:40px;
        height:40px;margin: auto;
        background: url("images/rs_gree.png") no-repeat;   cursor: pointer;
    }

    .div_rdk .do_red{
        width:40px;
        height:40px;margin: auto;
        background: url("images/rs_red.png") no-repeat;   cursor: pointer;
    }
    .div_rdk .do_yall{
        width:40px;
        height:40px;margin: auto;
        background: url("images/rs_yall.png") no-repeat;   cursor: pointer;
    }

    .div_rdk_top  .bt_des{
        float: left;
        margin-left: 5px;
        margin-top: -12px;

    }  .div_rdk_top label{
        color:#fff;
        float:left;
    } .div_rdk_top .button{
        width: 170px;
        float: left;
        margin-right: 10px;
    }

    .div_bottom,.div_top{
        box-shadow: 3px 3px 12px #C0C0C0;
        background: #1E1E1E;
        border-radius: 3px 3px 3px 3px;

        padding : 35px 5px 5px 5px;
        overflow: hidden;

    }
    .div_bottom{
        margin-top: 9px;



    }

    .fullshow.div_bottom{

        height:450px;

    }

    .fullshow.div_bottom .diagnosis_div, .fullshow.div_bottom .Posslble_div, .fullshow.div_bottom .Impact_div{

        height: 412px;
    }


    .fullshow.div_bottom .diagnosis_div .viewdata,    


    .fullshow.div_bottom .Impact_div .Impact_view{

        height: 395px;


    }

    .Posslble_div .tbviewdata td{
        border:1px solid #1E1E1E;
    }


    .Posslble_div .tbviewdata th{
        background:  #1E1E1E;
        color:#fff;
    }

    .div_top{

        height:370px;


    }
    .div_bottom{
        margin-top: 5px;
        padding-top: 9px
    }
    .show_advanced_projection{


        display: none;
        height: 530px;
        margin-left: 18%;
        position: fixed;
        top: 70px;
        width: 930px;
        z-index: 1000;;padding-top: 20px;




    }



    .mybtclos{
        height: 20px;
        width: 19px;
        cursor: pointer;
        text-align: center;
        color: white;
        background: #1C1A1B;
        position: absolute;
        right:2px;;
        top:2px;
        background: url("images/close_bt.png") no-repeat;   

    }

    .mybtclos:hover{

        background-position: 100% 100%

    }

    .show_advanced_projection iframe{

        width:100%; height:515px; border:none;

    }



    .bottom_data,.top_data{

        overflow: hidden;
        padding: 5px;
        background: white;
        -moz-border-radius: 9px 9px 9px 9px;
        border-radius: 5px 5px 5px 5px;
        overflow: hidden;
        clear: both;


    }.bottom_data{
        padding-bottom: 30px; 
    }


    *{
        font-family:helvetica,tahoma,verdana,sans-serif;
        font-size: 8pt;
    }
    .label_div{
        text-align: center;
        font-family: "Arial";
        /*color:#fff;*/
        /* background: #1c1a1b;*/
        width:99%;
        margin: auto;
        font-size: 8pt;
        padding: 2px;
    }

    .div_main {width:660px; float:left;margin-left: 20px;}
    .div_bottom  { clear: both; width: 950px;}




    .diagnosis_div,.Posslble_div, .Impact_div{
        float:left;


        border:1px #e3e3e3 solid;
        background: #f9f9f9;

        position: relative

    }

    .diagnosis_div .viewdata,.Posslble_div .tbviewdata, .Impact_div .Impact_view{
        height:90px;
        width:300px;
        overflow: auto;
        margin-top: 18px;

    }

    .tbviewdata{
        width:100%;
    }

    .tbviewdata{
        float:left;


    }
    .msg{

        margin-top: 10px;
        border:1px #eee solid;
        cursor: pointer
    }

    .msg.act{

        text-decoration: underline;
        border:1px #000 solid;
    }



    .act_btt{
        width:42px;
        height: 42px;
        cursor: pointer
    }




    .div_rdk{
        width:174px;
        float:left;
        border:1px #eee solid;
        margin-top: 0px;

        background: #e3e3e3;
        margin-left: 20px;

    }




    .div_rdk .bat{
        height:85px; 
        width:99%;
        margin-top: 1px;

        background: #f9f9f9;
    }



    .div_rdk .button{
        height:41px; 
        width:124px; 
        padding-top: 20px;
        margin: auto;
        background: transparent;


    }
    .div_rdk  lable{
        display: block;
        width:99%;
        text-align: center;


    }



    .all_pro{
        float:left;
        border:1px #e3e3e3 solid;
        margin: 3px;
        background: #f9f9f9;
    }










    #ostvariation{
        background: url("images/results_mtop.jpg");

    }



    #Batchefficiency{
        background: url("images/results_mtop.jpg");

    }

    #compgrade{
        background: url("images/results_double.jpg");

    }



    #riskindex{
        background: url("images/results_gtor.jpg");

    }
    #pro_index{
        background: url("images/results_rtog.jpg");
        height:120px;

    }
    #effciency{
        background: url("images/results_gtor.jpg");

    }


</style>


<script>
    function sh(obj) {

        $(".Impact_view").html("")
        var name = obj.getAttribute('id');

        $(".msg").removeClass('act');

        $(obj).addClass('act');

        gwt("");
        $.get("ajax/results/getImpactPath.jsp?name=" + name + "&modelid=" +<%=mod_id%>, function(val) {



            $(".Impact_view").html(val);

            if (mytype != "") {
                gwt(mytype);
            }
            ;
        })





    }
    $(function() {

        // $('#ostvariation').speedometer({ scale :100});



        var bartext = parseFloat($('#ostvariation').text()) + 100;
        $('#ostvariation').speedometer({scale: 200, percentage: bartext, maximum: 200, status: "1"});


        var bartext2 = parseFloat($('#Batchefficiency').text()) + 10;

        if (bartext2 > 200) {
            bartext2 = 200;


        }
        $('#Batchefficiency').speedometer({scale: 200, textanimate: false, percentageText: parseFloat($('#Batchefficiency').text()), percentage: bartext2, maximum: 200, status: "1"});




        $('#compgrade').speedometer({scale: 200, maximum: 200, suffix: ""});


        $('#riskindex').speedometer({scale: 100});
        $('#pro_index').speedometer({scale: 100});
        $('#effciency').speedometer({scale: 100});

        /*$('.changeSpeedometer').click(function(){
         $('#test').speedometer({ percentage: $('.speedometer').val() || 0 });
         });*/






    })

</script>

<%!

    /*
     String get_Throughput_sl(HttpServletRequest rq,String[] dataup1){
    
    
    
     String Throughput_style_arrya="";
     String viewdata="";
    
     for (int u1 = 0; u1 < dataup1.length; u1++) {
    
    
    
    
    
    
    
     String[] u1x = dataup1[u1].split("--");
    
    
     double d = Double.parseDouble(u1x[1]);
     //  out.print(d);
    
     if (d > 1) {
    
     // up = false;
     // Throughput_sl = "red";
    
    
     Throughput_style_arrya += "red;";
     viewdata = "<div  id=\"" + u1x[0] + "\"  onload=\"sh(this);\"  class=\"msg\"> <B>Component " + u1x[0].replace("^/^", " on Node ") + "</B>on node" + "" + " Resource near saturation <br/> Bottleneck identified Parallelism insufficient  <br/> Servicetime elongation due to database performance ";
     rq.s("<script>show_data('Throughput_div' , '" + viewdata + "');\n</script>");
     //Add text ?(component name) on node (server name Resource near saturation \n Bottleneck identified Parallelism insufficient \n Servicetime elongation due to database performance
    
     JspWriter out = getJspContext().getOut();
    
    
    
     // break;
     } else if (d > 0.8 && d < 1) {
    
     //   Throughput_sl = "yellow";
     viewdata = "<div id=\"" + u1x[0] + "\" onclick=\"sh(this)\"   class=\"msg\"><B>Component  " + u1x[0].replace("^/^", " on Node ") + "</B> on node  Resource near saturation <br/>  Bottleneck identified Parallelism insufficient <br/>  Servicetime elongation due to database performance";
     rq.print("<script>show_data('Throughput_div' , '" + viewdata + "');\n</script>");
    
    
     Throughput_style_arrya += "yellow;";
    
     //  break;
     } else {
     // Throughput_sl = "green";
    
    
     Throughput_style_arrya += "green;";
    
     }
    
    
     }
     return Throughput_style_arrya;
    
    
     }*/

%>

