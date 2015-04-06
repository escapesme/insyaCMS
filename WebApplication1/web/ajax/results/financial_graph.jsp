<%-- 
    Document   : new_graph
    Created on : Aug 26, 2012, 10:56:38 PM
    Author     : ismail
--%>


<%@page import="lib.Options.MyVariables"%>
<%@page import="xact.results.FinancialView"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.0.min.js"></script>




<%
    xact.users.users u = new xact.users.users();
    Boolean canFinancialView = u.userper(request, "financial");

    String[] res_id = request.getParameter("res_id").split("__");
    FinancialView fnew = new FinancialView();
    String selectedModel = request.getParameter("model");
    if (canFinancialView) {
%>
<div class='mybar'>
    <select class='modlist'>
        <%
            if (selectedModel != null) {
                out.print(fnew.modelList(res_id[0], selectedModel));
            } else {
                out.print(fnew.modelList(res_id[0], res_id[2]));
            }

        %>
    </select>

    <select class='bplist'>


        <%

            out.print(fnew.BPList(res_id[1], res_id[2]));

        %>
    </select>

    <input type="button" class='button myupdate' value='Add into Palette'>
    <input type="button" class='button export' value='Export'>
    <%if (MyVariables.siteUrl.equalsIgnoreCase("/Xact2/")) {%>
    <input type="button" class='button viewTest' value='View Test'>
    <%}%>
</div>




<div class='mapkeys'> <div style="width:11px ;height:11px; background:#3366cc" ></div>Production Efficiency</div>  
<div class='mapkeys'><div style="width:11px ;height:11px; background:#dc3912"> </div>Cost Efficiency</div> 
<div class='mapkeys'><div style="width:11px ;height:11px; background:#fac020"> </div>Dynamic Complexity</div> 

<div class='myfall'>
    <div class="div0 sdata"><iframe class="myifram" ></iframe></div>
    <div class="div1 sdata"><iframe onload="processingComplete()"  class="myifram"  ></iframe></div>
    <div class="div2 sdata"><iframe onload="processingComplete()"  class="myifram" ></iframe></div>
    <div class="div3 sdata"><iframe onload="processingComplete()"  class="myifram" ></iframe></div>
    <div class="div4 sdata"><iframe onload="processingComplete()" class="myifram" ></iframe></div>
    <div class="div5 sdata"><iframe onload="processingComplete()"  class="myifram" ></iframe></div>
    <div class="div6 sdata">    <iframe onload="processingComplete()" class="myifram" ></iframe></div>
    <div class="div7 sdata">    <iframe onload="processingComplete()" class="myifram" ></iframe></div>
    <div class="div8 sdata">    <iframe  onload="processingComplete()" class="myifram" ></iframe></div>
    <div class="div9 sdata">    <iframe onload="processingComplete()" class="myifram" ></iframe></div>

</div>

<%} else {
        out.print(MyVariables.financialDisabled);
    }%>


<script>
        function processingComplete() {

        }


        $(function() {



            var mystatus = 0;



            $(".myupdate").click(function() {

                var myclass = "div" + mystatus;

                $("." + myclass).show();

                $("." + myclass).append("<div class='lodingDiv' ></div>");


                var link = "<%=MyVariables.siteUrl%>ajax/results/financialView.jsp?modid=" + $(".modlist").val() + "&bpid=" + $(".bplist").val();

                $.get(link, function(data) {

                    var mydata = data.split(";")


                    $("." + myclass + " .myifram").attr("src", "<%=MyVariables.siteUrl%>ajax/results/fiCharts.jsp?val=" + mydata[0] + "&val1=" + mydata[1] + "&val2=" + mydata[2] + "&bpid=" + $(".bplist").val() + "&modid=" + $(".modlist").val());


                    $("." + myclass + " .myifram").load(function() {

                        $(".lodingDiv").fadeOut("slow",
                                function() {

                                    $(".lodingDiv").remove();
                                    $("." + myclass).addClass('loaded');
                                    $("." + myclass).attr('id', $(".bplist").val() + "::" + $(".modlist").val() + "::" + data);
                                    $("." + myclass).append("<div><input type='button' value='Remove' id='" + myclass + "' class='removeChart' onclick='removeChart($(this));'/></div>");

                                });




                    });


                    mystatus++;
                    if (mystatus > 8) {
                        mystatus = 0;
                    }

                    var forval = mystatus + 1;






                })


            })
            $(".viewTest").click(function() {

                var modId =<%=res_id[1]%>;
                var proId =<%=res_id[0]%>;
                var sid =<%=res_id[2]%>;
                if ((parseFloat($(".modlist").val()) == parseFloat(<%=res_id[1]%>))) {
                    sid = "0";
                } else {
                    sid = $(".modlist").val();
                }
                window.open(
                        "ajax/results/financialTest.jsp?modId=" + modId + "&sid=" + sid + "&proid=" + proId + "&bpid=" + $(".bplist").val(),
                        '_blank' // <- This is what makes it open in a new window.
                        );


            });
            $(".export").click(function() {
                var values = "";
                var count = 0;
                $(".loaded").each(function() {
                    if (count > 0) {
                        values += "/";
                    }
                    values += $(this).attr('id');
                    count++;

                });
                var ids='<%=request.getParameter("res_id")%>';
                 $.get("ajax/createSession.jsp?type=financialValues&data=" + values, function(data) {
                 
                })
                 $.get("ajax/results/planPoints.jsp?mid=" + ids, function(data) {
                 makeWinDows("Export Financial Results", "exportFinancialResults", exportFinancialResults('<%=res_id[1]%>',data), 450, 150, 400, null);
                })

            });

            $(".modlist").change(function() {
                $(".bplist").html("<option>Loading...</option>");

                var sid =<%=res_id[2]%>;
                // alert(parseFloat($(".modlist").val())+"__"+parseFloat(<%=res_id[1]%>)+(parseFloat($(".modlist").val())!=parseFloat(<%=res_id[1]%>)));
                if ((parseFloat($(".modlist").val()) != parseFloat(<%=res_id[1]%>))) {
                    sid = $(".modlist").val();
                } else {
                    sid = "0";
                }
                // alert(sid);
                var resid =<%=res_id[0]%> + "__" +<%=res_id[1]%> + "__" + sid;


                $.get("ajax/results/financialGraphBPList.jsp?res_id=" + resid + "&model=" + $(".modlist").val(), function(edata) {
                    $(".bplist").html(edata);

                });

            })
        })
</script>

<style>

    .mapkeys{
        float: left;
        font-size: 90%;
        line-height: 20px;
        margin: 2px;
        padding: 2px;
    }

    .mapkeys div{
        float: left;

        margin: 5px 2px 2px;

    }
    .removeChart{
        border-radius: 3px 3px 3px 3px;
        
        margin-left: 20%;

    }
    .myfall{
        height:80%;
        width: 100%;
        overflow: auto
    }
    .sdata{
        width:32%; 
        height:300px;
        background: #fff;
        display: none;
        float: left;
        overflow: hidden;
        position: relative;
    }

    .mybar{
        clear: both;
        width:100%;
    }
    .myifram{
        width:100%;
        height:88%;

        border: none;
        border-right: #999 3px solid;

        border-top: #999 3px solid;
        overflow: hidden;
    }


</style>
