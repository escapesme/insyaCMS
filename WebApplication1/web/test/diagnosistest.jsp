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


    $(function() {

        $(".rs_bt_close").toggle(function() {
            $(this).parent().height(0);

            $(".div_rdk_top").show();
            $(".top_data").hide();
            $(".div_bottom").addClass("fullshow");

            $(".div_top").css("overflow", "hidden");





        }, function() {
            $(this).parent().height(370);
            $(".div_rdk_top").hide();

            $(".div_top").css("overflow", "auto");

            $(".top_data").show();

            $(".div_bottom").removeClass("fullshow");
        }

        )

        $(".mybtclos").click(function() {
            $(".show_advanced_projection").hide();
        })

        $(".advanced_projection").click(function() {


            //  $.get("ajax/results/advanced_projection.jsp?res_data=<%=request.getParameter("res_data")%>",function(data){

            var data = "<iframe style=\"\" class ='advancedFrame' src=\"ajax/results/advanced_projection.jsp?res_data=<%=request.getParameter("res_data")%>\"/>";
            $(".show_advanced_projection .data").html(data);
            WaitForIFrame();



            $(".show_advanced_projection").show();

            // })





        })


    })











    function show_data(div, data) {
        $("." + div).append(data);
    }

    function WaitForIFrame() {
        if ($(".advanced_projection").attr('id') != "done") {
            setTimeout("WaitForIFrame();", 200);
        } else {
            done();
        }
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
    
    
    
    //out.print(list);
    effciency = res.getEffciency();
    pro_index = res.getPro_idx();
    
     
    Beffciency = "" + res.getBatchefficiency();
    compgrade = res.getCompogred();
    //out.print(res.test);

      
     ostvariation = "" + res.getOstvariation();
    
    
   
   out.print( list);;
     
     
     
  //  riskindex = res.rexindex(list, av_list);
       /*

   */
    
    
    
    /*
    
    
    
    
    
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

        double d = Double.parseDouble(u1x[1]);
        //  out.print(d);
        if (Double.parseDouble(u1x[5]) < 3) {

            if (!throuArray.contains(u1x[0] + u1x[4])) {
                if (d > 1) {

                    up = false;
                    Throughput_sl = "red";

                    Throughput_style_arrya += "red;";
                    viewdata = "<div  id=\"" + u1x[0] + ":" + u1x[4] + "\"  onclick=\"sh(this);\"  class=\"thered msg\"> <B>Component " + u1x[0].replace("^/^", " on Node ") + "</B>on node" + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + "Resource near saturation  Bottleneck identified Parallelism insufficient  Servicetime elongation due to database performance ";
                    out.print("<script>show_data('Throughput_div' , '" + viewdata + "');\n</script>");
                    //Add text ?(component name) on node (server name Resource near saturation \n Bottleneck identified Parallelism insufficient \n Servicetime elongation due to database performance

                    throuArray.add(u1x[0] + u1x[4]);

                    // break;
                } else if (d > 0.8 && d < 1) {

                    Throughput_sl = "yellow";
                    viewdata = "<div id=\"" + u1x[0] + ":" + u1x[4] + "\" onclick=\"sh(this)\"   class=\"theyellow msg\"><B>Component  " + u1x[0].replace("^/^", " on Node ") + "</B> on node " + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + " Resource near saturation   Bottleneck identified Parallelism insufficient   Servicetime elongation due to database performance";
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
                viewdata = "<div  id=\"" + u1x[0] + ":" + u1x[4] + "\"  onclick=\"sh(this)\" class=\"thered msg\"> <B> Component " + u1x[0].replace("^/^", " on Node ") + " </B>on node " + u1x[4] + " Complex " + u1x[6] + " Partition " + u1x[7] + " has  Degradation in response time due to:  Resource saturation   Higher priority preemption  Physical I Os need redistribution  High number of logical I Os   Degradation due to code aging";
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
*/
    // out.print(Arrays.binarySearch(Throughput_sarray,"red888"));

%>



