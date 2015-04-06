<%@page import="xact.NodeExtension"%>
<%
    String nodeId = request.getParameter("nod_id");
    out.print("<ul class='tabs'><li class='act dataser' id='gen'>General</li>");
    out.print("<li class=' dataser' id='green'>Green</li>");
    out.print("<li class=' dataser' id='avail'>Availability</li>");
    out.print("<li class=' dataser' id='fail'>Failover</li>");
    out.print("<li class=' dataser' id='cost'>Cost</li></ul>");
    NodeExtension ext = new NodeExtension();
    out.print("<div class=gen>");
    out.print(ext.getGeneral(nodeId));
    out.print("</div>");
    out.print("<div class=green>");
    out.print(ext.getGreen(nodeId));
    out.print("</div>");
    out.print("<div class=avail>");
    out.print(ext.getAvailability(nodeId));
    out.print("</div>");
    out.print("<div class=fail>");
    out.print(ext.getFailover(nodeId));
    out.print("</div>");
    out.print("</div>");
    out.print("<div class=cost>");
    out.print(ext.getCost(nodeId));
    out.print("</div>");
    out.print("</div>");



%>
<style>
    .nodeExtensionWindow{
        height: 100%;

    }
    .extensionText{
        width:25%;
    }
    .tabs li.dataser{
        list-style: none;
        float:left;
        border:1px solid #333;
        box-shadow: 1px -1px 5px #333333;
        padding: 2px;
        margin: 2px;
        cursor: pointer;
        width: 75px;
        text-align: center;
        height:30px;
        font-size: 10pt ;
        height: 16px;
        line-height: 16px;
    }

    .tabs li.act.dataser{

        background: #333;
        color:#fff;


    }





    .tabs ,.divtab{
        width:100%;
        clear: both;
        height:30px;

    }.divtab{

        width:97%;
        border:1px solid #333;
        box-shadow: -1px 5px 5px #333333;
        padding: 2px;
        margin: 2px
            ;
        float:left;
        position: relative;
        height:250px;
        overflow: auto;
        margin-top:-18px; 



    }

    .view_pre .frm_label{
        width: 30%;
    }

</style>
<script>



    $(function() {

        $(".green").hide();
        $(".fail").hide();
        $(".avail").hide();
        $(".cost").hide();
        $(".tabs li.dataser").click(function() {

            $(".tabs li.dataser").removeClass("act");
            $(this).addClass("act");



        })
        $("#gen").click(function() {

            $(".green").hide();
            $(".fail").hide();
            $(".avail").hide();
            $(".gen").show();
            $(".cost").hide();

        })
        $("#green").click(function() {

            $(".gen").hide();
            $(".fail").hide();
            $(".avail").hide();
            $(".green").show();
            $(".cost").hide();

        })
        $("#avail").click(function() {

            $(".gen").hide();
            $(".fail").hide();
            $(".avail").show();
            $(".green").hide();
            $(".cost").hide();

        })
        $("#fail").click(function() {

            $(".gen").hide();
            $(".green").hide();
            $(".avail").hide();
            $(".cost").hide();
            $(".fail").show();

        })
        $("#cost").click(function() {
            $(".cost").show();
            $(".gen").hide();
            $(".green").hide();
            $(".avail").hide();
            $(".fail").hide();


        })
        $(".nodeExtension_Ok_bt").click(function() {
            var nod_id = "<%=nodeId%>";
            var capacity = $(".generalcapacity").val();
            var space = $(".generalspace").val();
            var energy = $(".greenenergy").val();
            var heat = $(".greenheat").val();
            var mtbf = $(".availmtbf").val();
            var mttr = $(".availmttr").val();
            var uptime = $(".availuptime").val();
            var serviceLevel = $(".availservice").val();
            var checked = $('.failoverProvided').attr('checked');
            var costChecked = $('.costProvided').attr('checked');
            var failNode = "";
            var addCost="";
            var costValue="";
            if (checked) {
                failNode = $(".failoverTargets").val();
            }
            if (costChecked) {
                addCost = $(".costTypes").val();
                costValue=$(".costValue").val();
            }
            var delay = $(".faildelay").val();
            var link = "?id=" + nod_id + "&capacity=" + capacity + "&space=" + space + "&energy=" + energy + "&heat=" + heat + "&mtbf=" + mtbf + "&mttr=" + mttr + "&uptime=" + uptime + "&serviceLevel=" + serviceLevel + "\n\
            &checked=" + checked + "&failNode=" + failNode + "&delay=" + delay+"&costChecked="+costChecked+"&costValue="+costValue+"&costType="+addCost;
            $.get("ajax/views/groupView/saveExtension.jsp" + link, function(mdata) {
                closeWindows("nodeExtensionWindow");
            })

        })
        $(".newCost").click(function() {
             makeWinDows("New Cost Type ", "newCostType", CreateNewCostType($(this).attr("id")), 300, 3, 350, null);
        });
        $(".failoverProvided").change(function() {

            var checked = $('.failoverProvided').attr('checked');
            if (checked) {
                $(".failoverTargets").removeAttr("disabled");
            } else {
                $(".failoverTargets").attr("disabled", "disabled");
            }

        });
         $(".costProvided").change(function() {

            var checked = $('.costProvided').attr('checked');
            if (checked) {
                $(".costTypes").removeAttr("disabled");
                $(".costValue").removeAttr("disabled");
                
            } else {
                $(".costTypes").attr("disabled", "disabled");
                $(".costValue").attr("disabled", "disabled");
                
            }

        });
    })

</script>