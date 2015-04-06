<%@page import="lib.tools.Utils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.MathContext"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>



<script type="text/javascript" src="includes/js/jquery.tablescroll.js" ></script>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();

    String Service = "0";
    String Process = "0";

    String pti = "";
    String point = request.getParameter("point");

    String res_id = request.getParameter("res_id");

    String mod_id = res_id.split("__")[1];
    String s_id = res_id.split("__")[2];
    String resultId = Utils.getResultID(mod_id, s_id);
    String modName = Utils.getModName(mod_id, s_id);

    String myHumanBatch = "";
    String myHumanTrans = "";
    String myMachen = "";
    String myNetwork = "";
    String myTransportion = "";
    String myServerBatch = "";
    String getServerTrnasaction = "";

    String myother = "";

    String chrtnet = "";
    String chrtTransport = "";
    String chrthumen = "";
    String chrtserver = "";
    String chrtmachen = "";

    xact.results.smv sm = new xact.results.smv(request.getParameter("id").trim(), mod_id, s_id, point);

    if (request.getParameter("state") != null) {
        db.openConres();
        xact.results.smv2 sm2 = new xact.results.smv2(request.getParameter("id").trim(), mod_id, s_id, point);

        ResultSet mynode2 = db.getData(XMLDataModel.SP_RESULTS_TABLENAME, "*", "SP_ID='" + sm.getbbid(request.getParameter("id").trim()) + "' and name = '" + modName.trim() + "_" + point.trim() + "' and MODEL_ID=" + resultId);
//out.print("SP_ID='" + sm.getbbid(request.getParameter("id")) + "' and name = '"+modName.trim()+"_" + point + "' and MODEL_ID="+resultId);
        while (mynode2.next()) {
            Service = mynode2.getString("SERVICE_TIME");
            Process = mynode2.getString("RESPONSE_TIME");

        }
        db.closeCon();

        myHumanBatch = sm2.getSMVTableValuesALL("Human (Batch)", "6", "6");
        myHumanTrans = sm2.getSMVTableValuesALL("Human (Transactional)", "5", "5");
        myMachen = sm2.getSMVTableValuesALL("Machine", "7", "7");
        myNetwork = sm2.getSMVTableValuesALL("Network", "10", "10");
        myTransportion = sm2.getSMVTableValuesALL("Transportation", "8", "8");
        myServerBatch = sm2.getSMVTableValuesALL("Servers (Batch)", "2", "2");
        getServerTrnasaction = sm2.getSMVTableValuesALL("Server (Transactional)", "0", "1");
        pti = "" + sm2.gettotallTime;
        myother = sm2.getOther();
        chrtnet = "" + sm2.net;
        chrtTransport = "" + sm2.Transport;
        chrthumen = "" + sm2.humen;
        chrtserver = "" + sm2.server;
        chrtmachen = "" + sm2.machen;
    } else {

        db.openConres();
        ResultSet mynode2 = db.getData(XMLDataModel.SP_RESULTS_TABLENAME, "*", "SP_ID='" + sm.getbbid(request.getParameter("id").trim()) + "' and name = '" + modName.trim() + "_" + point + "' and MODEL_ID=" + resultId);
//out.print("SP_ID='" + sm.getbbid(request.getParameter("id")) + "' and name = '"+modName.trim()+"_" + point + "' and MODEL_ID="+resultId);
        while (mynode2.next()) {
            Service = mynode2.getString("SERVICE_TIME");
            Process = mynode2.getString("RESPONSE_TIME");

        }
        db.closeCon();
        myHumanBatch = sm.getSMVTableValuesALL("Human (Batch)", "6", "6");
        myHumanTrans = sm.getSMVTableValuesALL("Human (Transactional)", "5", "5");
        myMachen = sm.getSMVTableValuesALL("Machine", "7", "7");
        myNetwork = sm.getSMVTableValuesALL("Network", "10", "10");
        myTransportion = sm.getSMVTableValuesALL("Transportation", "8", "8");
        myServerBatch = sm.getSMVTableValuesALL("Servers (Batch)", "2", "2");
        getServerTrnasaction = sm.getSMVTableValuesALL("Server (Transactional)", "0", "1");
        myother = sm.getOther();
        pti = "" + sm.gettotallTime;
        chrtnet = "" + sm.net;
        chrtTransport = "" + sm.Transport;
        chrthumen = "" + sm.humen;
        chrtserver = "" + sm.server;
        chrtmachen = "" + sm.machen;

        out.println(sm.out);
    }

    String temp = request.getParameter("temp");
    /*if(!temp.equals("0")){
     Service=sm.getServiceTime(temp);
     Process=sm.getProcessTime(temp);
     }*/
    // out.print(Service+"__"+Process);

    String vre = "net=" + chrtnet + "&Transport=" + chrtTransport + "&humen=" + chrthumen + "&server=" + chrtserver + "&machen=" + chrtmachen + "&other=" + pti;

%>


<%!    DecimalFormat df = new DecimalFormat("#.####");

%>


<div class="smv_med">




    <table>
        <thead><th>Process Name</th><th>Process Time</th><th>Service Time</th><th>Preparation Time Included</th><th>Dynamic  Complexity<br/> Loss Factor</th></thead>
        <tr><td><%= sm.getbbname(request.getParameter("id").trim())%></td>
            <td><%= Utils.convertToDHMS(Double.parseDouble(Process))%></td>
            <td><%= Utils.convertToDHMS(Double.parseDouble(Service))%></td>
            <td><%= Utils.convertToDHMS(Double.parseDouble(pti))%></td>
            <td><%=   df.format(sm.dvl)%></td></tr>





    </table>


    <div class="Showchart">
        <iframe  scrolling="no" style="border: none; overflow: hidden; width:250px ;height:150px" src="ajax/results/smv/smvChart.jsp?<%=vre%>">



        </iframe>



    </div>    
</div>


<div class="smv_bottom">

    <table>


        <thead class="htop"><th colspan="3"></th><th class="heit top" colspan="3">Computed Analytics</th><th></th><th class="heit top" colspan="4">Dynamic Complexity: DCPC =&sum;<sub>i</sub> a<sub>i</sub> Analysis  </th></thead>
        <thead class="th_header">
        <th>Type</th>
        <th>Component Name</th>
        <th>Ideal Service Time
            <br/>with CHR = 100%</th>


        <th  class="heit">Throughput
            Maximum</th>

        <th  class="heit">Response
            Time</th>
        <th  class="heit">Throughput
            Actual</th>





        <th>Loss/Opportunity in
            Throughput</th>
        <th  class="heit">a1 = Conflicts
            Contentions</th>
        <th  class="heit">a2 = 
            Availability
            Delays</th>
        <th  class="heit">a3 = 
            Database impact
            on Service</th>
        <th  class="heit">   a4 = 
            Incidental</th>







        </thead>


        <tbody style="height:48px; overflow:auto;" class="tablebody">
            <%=getServerTrnasaction
                    + myServerBatch
                    + myTransportion
                    + myHumanBatch
                    + myHumanTrans
                    + myMachen
                    + "" + myNetwork
                    + myother%>

        </tbody>



    </table>





    <style>
        .smv_bottom{
            overflow: auto;

            position: absolute;
            bottom: 0px;
            top:200px;
            width:96%;
        }


        .net_2 td{
            padding-left:10px;
            cursor: pointer

        }

        .net_2 { display: none}

        .net_3 { display: none}
        .net_4 { display: none}

        .net_3 td{
            padding-left:20px;

            cursor: pointer
        }
        .net_4 td{
            padding-left:30px;

            cursor: pointer


        }

        .st_parent,.hu_parent,.sb_parent,.net_parent ,.ma_parent{


            background: lightgreen;
        }


        .st_child,.sb_child,.net_child,.hu_child,.ma_child,.tr_child
        {
            background: lightyellow;

        }

        .st_child td,.sb_child td,.net_child td,.hu_child td,.ma_child td,.tr_child td
        {


        }



        .st_sub_parent{


            background: gray    ;
        }

        .st_sub_parent.act td{
            text-decoration: underline;
            font-weight: bold
        }


        .smv td {
            font-size: 9pt;
        }





        .tablebody{
            height: 205px;
            overflow: scroll;


        }



    </style>


    <script>


        $('.smv_bottom table').tableScroll({height: 150});



        function doopen(parent, child) {
            $("." + parent).toggle(function() {

                $("." + child).hide();

            }, function() {


                $("." + child).show();

            }



            )

        }


        $(function() {





            doopen("st_parent", "st_child");
            doopen("sb_parent", "sb_child");
            doopen("net_parent", "net_child");
            doopen("ma_parent", "ma_child");
            doopen("hu_parent", "hu_child");
            doopen("tr_parent", "tr_child");





            $(".net_1").toggle(
                    function() {
                        $(".net_2").show();
                    },
                    function() {
                        $(".net_2").hide();
                        $(".net_3").hide();
                        $(".net_4").hide();

                    }


            )




            $(".net_2").toggle(
                    function() {
                        $(".net_3." + $(this).attr("id")).show();
                    },
                    function() {
                        $(".net_3." + $(this).attr("id")).hide();
                        $(".net_4").hide();
                    }


            )


            $(".net_3").toggle(
                    function() {
                        $(".net_4." + $(this).attr("id")).show();
                    },
                    function() {
                        $(".net_4." + $(this).attr("id")).hide();

                    }


            )



            $(".st_sub_parent").toggle(
                    function() {
                        $(".ch_" + $.trim($(this).attr("id"))).show();
                    },
                    function() {
                        $(".ch_" + $.trim($(this).attr("id"))).hide();

                    }


            )



            $(".net_2").toggle(function() {

                $(this).next(".net_3").slideDown()


            },
                    function() {

                        $(this).next(".net_3").slideUP()


                    }


            )




            $(".st_sub_parent").click(function() {



                $(".st_sub_parent").removeClass("act");


                $(this).addClass("act");
                $(".bt.Detail").css("color", "#000");





            })
            $(".bt.Detail").click(function() {
                var myname = $.trim($(".st_sub_parent.act td").eq(1).text());
                if (myname != "") {
                    var x2 = new Array(defajax, defajax2, defajax3);
                    ajaxAbort(x2);
                    showMyloading(".Detailoding", "start", "small");
                    var id = $(".select_ch").val();


                    defajax = $.get("ajax/results/smv/getServerDetail.jsp?point=<%=point%>&res_id=<%=res_id%>&servername=" + myname + "&id=" + id, function(mdata) {


                        $(".mxWindow").remove();

                        makeWinDows("Server Detail", "Server_Detail", mdata, 450, 150, 600, 350);

                        showMyloading(".Detailoding", "end", "small");
                    })




                } else {
                    alert("No server selected. Select a server first to display its detail")
                }



            })




        })



    </script>



















