<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="xact.complexList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.util.Arrays"%>
<%

    complexList c = new complexList();

    ArrayList<HashMap<String, String>> m = c.getAllIdAttrs();
    out.print("<div class='rightList'><ul>");
    int num = 0;
    for (HashMap<String, String> a : m) {

        if (a.get("name") != null && !a.get("name").equalsIgnoreCase("null")) {
            num++;
            out.print("<li id='" + a.get("id") + "'  class='notselected'><div class='mytitle'>" + num + "-" + a.get("name") + "</div>"
                    + "<div  class='mydata'style='display:none'>"
                    + "<ul>"
                    + "<li><lable>complexType</lable> <div>" + a.get("complexType") + "</div></li>"
                    + "<li><lable>numberOfProcessors</lable> <div>" + a.get("numberOfProcessors") + "</div></li>"
                    + "<li><lable>totalLogicalProcessors</lable> <div>" + a.get("totalLogicalProcessors") + "</div></li>"
                    + "<li><lable>vsName</lable> <div>" + a.get("vsName") + "</div></li>"
                    + "</ul></div>"
                    + "</li>"
                    + "");
        }
        // name="Complex0" vsName="-1" complexType="2" totalLogicalProcessors="0" numberOfProcessors="1"/>
    }

    out.print("</ul></div>");

    out.print("<div class='leftList'>");

    out.print("<ul class='tabs'>");

    out.print("</ul>");

    out.print("<div class='tabsBodys'>");

    out.print("</div>");

    out.print("</div>");

%>

<script>

    $(function() {
        $(".rightList li").toggle(function() {
            $(this).removeClass("notselected");
            $(this).addClass("selected");
        }, function() {

            $(this).addClass("notselected");
            $(this).removeClass("selected");

        }


        );

        $(".rightList li").click(function() {
            var Myhtmtt = "";
            var Myhtmb = "";

            var nu = 0;
            $(".rightList li.selected").each(function() {




                var dis = "none";
                var cls = "";
                if (nu == 0) {

                    dis = "block";
                    cls = "act";
                } else {

                    dis = "none";
                    cls = "";

                }

                Myhtmtt += "<li class='" + cls + "' id='_" + $(this).index() + $(this).text().replaceAll(" ", "-") + "' >" + $(this).children(".mytitle").text() + "</li>";





                Myhtmb += "<div  style='display:" + dis + "' class='tabsBody _" + $(this).index() + $(this).text().replaceAll(" ", "-") + "'  >" + $(this).children(".mydata").html() + "</div>";

                nu++;

            })

            $(".leftList .tabs").html(Myhtmtt);

            $(".leftList .tabsBodys").html(Myhtmb);
        })






        $(document).on("click", ".leftList .tabs li", function() {
            $(".leftList .tabs li").removeClass("act");
            $(this).addClass("act");

            $(".tabsBody").hide();
            $("." + $(this).attr("id")).show();
        })



    })

</script>

<style>

    .selected{
        background: #111;
        color:#fff;
    }

    .rightList,.leftList{
        width:29%;
        float:left;
    }


    .leftList{
        width:70%;

    }

    .leftList .tabs{
        clear: both;
        width:100%;
        margin-top: 10px;

        min-height: 30px;

    }.leftList .tabs li{ min-height: 30px;
                         margin-bottom: 10px;
    }
    .leftList .tabs li{
        float: left;

    }.leftList .tabs li.act{

        background: #111;
        color:#fff;  

    }

    .tabsBodys{
        border:  1px #8DB2E3 solid;clear: both;
    }

</style>
