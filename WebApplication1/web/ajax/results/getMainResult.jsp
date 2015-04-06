<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page  import="lib.Options.MyVariables" %>
<%
    String js_link = MyVariables.jsFolder;
%>





<style> 
    #demo-frame > div.demo { padding: 10px !important; }
</style> 
<%
    lib.engine.db.operations db = new lib.engine.db.operations();
    String[] mydata = request.getParameter("res_data").split("__");
    String mod_id = mydata[1];
    String s_id = mydata[2];
    String scenariotype = db.getValue(XMLDataModel.SCENARIO_TABLENAME, "SCENARIO_TYPE", "ID=" + s_id);
    String resultId = Utils.getResultID(mod_id, s_id);
    db.openDBCon(lib.Options.DbInfo.connectionStringRes);
    String[] ret = db.getRowNocon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "ID=" + resultId);
    db.closeCon();
    String max = Integer.toString(Integer.parseInt(ret[5]));
    xact.users.users u = new xact.users.users();
    Boolean canFinancialView = u.userper(request, "financial");

%>


<script>


    function getChronoWinwods(resid, point, id) {
        $.get("ajax/results/chronograph/chronoWinwods.jsp?id=" + id + "&res_id=" + resid + "&point=" + point, function(data) {
            makeWinDows("Chronograph Trajectory Selection", "chronoWinwods", data, 420, 220, 300, null);
        })
    }
    $(function() {
        var chronStatus = 1;

        clearSesstion("smv_template");
        $(".mxWindow").remove();
        var point = 0;
        var resid = "<%=request.getParameter("res_data")%>";
        var status = "<%=request.getParameter("status")%>";
        if (status == "1") {
            open_Diagnosis_Repair(resid, "0");
        } else if (status == "2") {
            open_Service_Result(resid, "0");
            clearSesstion("smv_template");
        } else if (status == "3") {
            open_Resource_View(resid, "0");
            clearSesstion("smv_template");
        } else if (status == "4") {
            call(2, "#show_chronoview");
            $.get("ajax/results/chronograph/chronoWinwods.jsp?res_id=" + resid + "&point=" + point, function(data) {
                makeWinDows("Chronograph Trajectory Selection", "chronoWinwods", data, 420, 220, 500, null);
                showMyloading(".main", "end");
            })
        } else if (status == "5") {
            open_reports(resid, "0");
        } else if (status == "6") {
            open_financial_graph(resid, point);
            $(".pointsSlider").hide();
        }
        else if (status == "7") {
            open_chro_graph(resid, point);
            $(".chrono_graph").addClass("act");
            $(".pointsSlider").show();
            show = 7;
        }

        else {

        }






        $("#show_data").click(function() {
            $(".mxWindow").remove();
            $(".pointsSlider").show();
            open_Diagnosis_Repair(resid, point);
        })


        $("#show_datasmv").click(function() {
            clearSesstion("smv_template");
            $(".mxWindow").remove();
            $(".pointsSlider").show();
            open_Resource_View(resid, point, "-1");
        })
        $("#show_datasmv2").click(function() {
            clearSesstion("smv_template");
            $(".mxWindow").remove();
            $(".pointsSlider").show();
            open_Resource_View2(resid, point, "-1");
            $("#show_datasmv2").addClass("act");
            $("#show_datasmv").removeClass("act");
        })

        $("#show_datafav").click(function() {
            $(".mxWindow").remove();
            $(".pointsSlider").show();
            open_Service_Result(resid, point);
        })


        $("#show_reports").click(function() {

            $(".mxWindow").remove();
            $(".pointsSlider").show();
            open_reports(resid, point);
        })




        $("#financial_graph").click(function() {
            $(".mxWindow").remove();
            open_financial_graph(resid, point);
            $(".pointsSlider").hide();
        })





        $(".chrono_graph").click(function() {
            chronStatus = 1;
            $(".mxWindow").remove();
            $(".pointsSlider").show();
            open_chro_graph(resid, point);
            $(".chrono_graph").addClass("act");
        })
        $(".chronoParentT").click(function() {
            chronStatus = 1;
            $(".mxWindow").remove();
            $(".pointsSlider").show();
            open_chro_graph(resid, point);
            $(".chrono_graph").addClass("act");
        })
        $(".through_graph").click(function() {
            chronStatus = 2;
            $(".mxWindow").remove();
            $(".pointsSlider").show();
            open_chro_graph(resid, point, 2);
            $(".through_graph").addClass("act");
        })





        $("#show_chronoview").click(function() {
            $(".mxWindow").remove();
            call(2, "#show_chronoview");
            $.get("ajax/results/chronograph/chronoWinwods.jsp?res_id=" + resid + "&point=" + point, function(data) {
                makeWinDows("Chronograph Trajectory Selection", "chronoWinwods", data, 420, 220, 500, null);
                showMyloading(".main", "end");
            })



        })














        function lodatat(mypoint, myresid) {



            if (show == 7) {

                if (chronStatus == 2) {
                    open_chro_graph(resid, point, 2);
                    $(".through_graph").addClass("act");
                }

                else {
                    open_chro_graph(resid, point);
                    $(".chrono_graph").addClass("act");
                }
            }



            if (show == 1 || show == 4) {


                open_Diagnosis_Repair(myresid, mypoint);
            }
            if (show == 2 || show == 4) {

                $(".pointsSlider").show();
                open_Resource_View(myresid, mypoint, $(".mysmvid").val());
            }
            if (show == 10) {

                $(".pointsSlider").show();
                open_Resource_View2(myresid, mypoint, $(".mysmvid").val());
                $("#show_datasmv2").addClass("act");
                $("#show_datasmv").removeClass("act");
            }


            if (show == 3 || show == 4) {



                open_Service_Result(myresid, mypoint);
            }

        }


        $("#slider-range-max").slider({
            range: "max",
            min: 0,
            max: <%=max%>,
            value: 0,
            stop: function(event, ui) {
                var data = ui.value;
                $("#amount").val(data);
                point = data;
                lodatat(data, "<%=request.getParameter("res_data")%>");
            }
        });
        if ($("#slider-range-max").slider("value") > 0) {

            $("#amount").val($("#slider-range-max").slider("value"));
        }




    });
</script> 





<div class='pointsSlider' style="clear: both; height:30px;  right:50px;  top:2px; margin-top: 5px; z-index: 1000000; position: absolute;width:150px;">

    <label style="float: left;font-size: 15px;margin-left: -75px;" for="amount">Plan Point</label> 
    <input type="text" id="amount" style="border:0; color:#fff;  background:#000; font-weight:bold;"  value='0'/> 

    <div  id="slider-range-max"></div>

</div> 





<div class="div_result_tabs">
    <li id="show_data" > Diagnosis & Repair</li> 
    <li id="show_datasmv" > Service Management Results</li> 
    <li id="show_datafav" > Resource Management View</li> 
        <% if (s_id.equals("0") || (!s_id.equals("0") && (scenariotype.equals("4") || scenariotype.equals("5")))) {%>
    <li id="show_chronoview">
        <span id="show_chronoview">Chronograph View </span>


    </li> 
    <li id="show_reports" >Reporting Center</li> 
        <%}%>
        <% if (canFinancialView) {%>

    <li id="financial_graph" >Financial View</li> 
        <%}%>
        <% if (!s_id.equals("0") && scenariotype.equals("6")) {%>
    <li id="chro_graph" class='chronoParent' >

        <span class='chronoParentT'>Time Box Chronograph</span>

        <ul  class='subtabs'><li id="chro_graph" class="chrono_graph" >Chronograph View</li><li id='chro_graph2' class='through_graph'>Throughput View</li></ul>
    </li> 
    <%}%>
</div>




<div style="position:relative; background: transparent; overflow: auto; width:960px;height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;"class="getresuilt data show_dvs divdata"></div>
<div  style="position:relative; width:100%;height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;"  class="datasmv divdata"  ></div>
<div  style="position:relative; width:100%;height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;"  class="datasmv2 divdata"  ></div>
<div  style="position:relative; width:100%; height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;" class="datafav divdata" ></div>
<div  style="position:relative; width:100%; height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;" class="chronoview divdata" ></div>
<div  style="position:relative; width:100%; height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;"  class="reports divdata" ></div>
<div  style="position:relative; width:100%; height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;"  class="financial_graph divdata" ></div>


<div  style="position:relative; height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;"  class="chro_graph divdata" ></div>
<div  style="position:relative; width:100%; height:100%; border: 1px #eee solid; clear: both; padding: 5px;min-height: 150px; float: left;"  class="chro_graph2 divdata" ></div>


<input type="hidden" class="mysmvid"/> 












<style>



    li.act  .subtabs{

        display: block

    }
    #amount{
        margin: 2px;
        font-weight: bold;

    }
    #slider-range-max{
        margin-top: 5px;
    }
    #amount{
        border-radius: 15px 15px 15px 15px;
        float: right;
        height: 24px;
        margin-left: 400px;
        margin-right: -38px;
        margin-top: -3px;
        text-align: center;
        width: 35px;


    }
    .div_top {


        overflow: auto;
        width: 950px;
    }

    .div_main{

    }

    .ui-slider-range{
        background: #000;
        border-radius: 4px 4px 4px 4px;
        border:1px #000 solid;
        height:8px;
    }
    #slider-range-max{
        background: url("images/slider_bg.png") repeat-x; 
        border:1px #000 solid;
        height:8px;

    }
    .ui-slider-handle.ui-state-default.ui-corner-all{
        background: url("images/slide_bt.png") no-repeat; 
        height:24px;
        width:24px;
        margin-top: -5px;
        border:none
    }
</style>



















