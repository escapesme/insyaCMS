
<%@page import="xact.DatabaseImport"%>
<%@page import="xact.results.ResultsExport"%>
<%@page import="xact.results.resultes"%>
<%@page import="xact.utils"%>
<%@page import="org.apache.commons.io.filefilter.FalseFileFilter"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>

<%

//rightclick Menu new
    xact.users.users us = new xact.users.users();

    xact.general gen = new xact.general();

    xact.users.users user = new xact.users.users();
    // String Cid = us.userReturn(request, "cid");
    //  String Gid = us.userReturn(request, "gid");
    String proId = request.getParameter("pro_is");
    DatabaseImport dbi = new DatabaseImport();
    String fields = new ResultsExport().getNewDetailColumns();

    String throughputFields = new ResultsExport().getThroughputColumns();
    xact.users.users u = new xact.users.users();
    Boolean com_sataus = u.userper(request, "Compute");
    boolean hasMDL = true;
    Boolean makeScenario = u.userper(request, "makeScenario");

    //  Boolean CanCraet = u.userper(request, "create");
    xact.Models m = new xact.Models();

    String pmx_table = lib.Options.XMLDataModel.PMXREF_TABLENAME;
    String model_table = lib.Options.XMLDataModel.MODEL_TABLENAME;
    String scenario_table = lib.Options.XMLDataModel.SCENARIO_TABLENAME;

    db.openCon();
    String[] cl_pmxref = db.getColumn(pmx_table, "mid", " pid=" + request.getParameter("pro_is"));
    int i = 0;
    int x = 0;

    out.print("<ul class=\"tree treeview-red   treeview\" >");

    i++;
    x = 0;
    String clss = "";
    String clss2 = "";

    for (int B = 0; B < cl_pmxref.length; B++) {

        String[] cl_model_STATUS = db.getColumn(model_table, "STATUS", " id=" + cl_pmxref[B]);

        String[] cl_model = db.getColumn(model_table, "MODEL_NAME", " id=" + cl_pmxref[B]);
        String[] cl_model_id = db.getColumn(model_table, "ID", " id=" + cl_pmxref[B]);
        int cl_model_c = db.getRowCount(model_table, " id=" + cl_pmxref[B]);

        for (int d = 0; d < cl_model.length; d++) {

            if (d == (cl_model_c - 1)) {
                clss = " Expandable last";
                clss2 = " last Expandable-hitarea";

            } else {
                clss = "expandable";

                clss2 = "";
            }
            String computStatus = m.computeStatus(cl_pmxref[B]);
            String computStatusFinish = "3";
            String computStatusWorking = "1";
            String computStatusFinishWerror = "2";

            String pub_menu = "<div class=\"pub_menu\"></div>";;

            out.print("<li class=\" collapsable lastCollapsable \">"
                    + "<div class=\" hitarea collapsable-hitarea lastCollapsable-hitarea \"></div><span class>"
                    + "<a   class=\"get_model " + cl_model_id[d] + "\" id=\"" + request.getParameter("pro_is") + "__" + cl_model_id[d] + "__0" + "\" href=\"?alias=" + request.getParameter("alias") + "&model_id=" + cl_model_id[d] + "\"><img src=\"images/referencemodel.png\" />" + cl_model[d] + "<a/>" + pub_menu + "</span>");

            out.print(m.getScenario(request, cl_model_id[d], cl_model_id[d], scenario_table, computStatusFinish, computStatusWorking, computStatusFinishWerror, makeScenario, com_sataus));

        }

        out.print("</li>");
    }

    out.print("</ul>");
    db.closeCon();

%>


<%!    lib.engine.db.operations db = new lib.engine.db.operations();

%> 






<style>

    .tree li{
        font-family: Verdana, helvetica, arial, sans-serif;
        font-size: 7pt;
        color: #333;
    }

    .pub_menu{
        display: none;
    }
    .secnar{

    }
    fieldset{
        clear: both;

    }

    fieldset textarea{
        width:98%;
        height:80px;
    }
    .do_right{
        float: right;
    }
    .do_left{
        float: left;
    }
    .view_paramters{
        margin-top: 15px;
    }

    .treeview ul.submenu{

        margin-left:139px; 

        background: #F0F0F0;
        overflow: hidden

    }
    div.pub_menu{

        overflow: visible
    }
    .left {

        overflow: visible
    }

    div.pub_menu  li.disable{

        color:#888;  



    }

    .pub_menu{
        min-height: 50px;
    }



    .cont{
        overflow:auto;
        height:100%;
        width:100%;

    }
</style>


<script>

</script>



<script>


    $(function() {



 $(document).off("click", ".bttom_add_left", null);

        $(document).on("click", ".bttom_add_left", function() {
            var pro_id =<%=proId%>;
            if(pro_id!==null){
             
            create_new_module(pro_id);
            }else{
              alert("This operation is allowed only inside a project!");
            }


        })




        $(".tree").treeview({
            collapsed: true,
            animated: "fast",
            control: "#sidetreecontrol",
            prerendered: true,
            persist: "location"
            , collapsed: false,
                    unique: true

        });

        $(".get_model").click(function() {


            var myids = $(this).attr("id");
            var myid = myids.split("__")



            if (myid[3] === "7") {
                openConmputWindows__7(myids);
            }

            $(this).addClass("myact");
            openCorporate(this);
            return false;
        });
        $("*").click(function(e) {

            $(".pub_menu").hide();
        });
        
      /*   $(".logo").click(function(e) {

            $(".pub_menu").hide();
        });


        $(".bttom_add_left").click(function(e) {

            var mytop = e.pageY - 120;

 var myleft = e.pageX - 50;
            var obj = $(this);


            var pbdata = '<div class=" pub_menu" style="top: ' + mytop + 'px;left: ' + myleft + 'px; display: block;">\n\
    <ul><li class="addmodule disable" style="font-size: 7pt;"><div class="Icon"><img src="images/new.gif"></div>add Module</li></ul></div>'

            obj.find(".pub_menu").remove();
            obj.append(pbdata);



        })*/


        $(".get_model ,.secnar").rightClick(function(e) {




            var obj = $(this);


            is_login(function(data) {



                if ($.trim(data) === "0") {



                    window.location = "?alias=home";




                } else {






                    var mymenu = obj.parent().children(".pub_menu");
                    // mymenu.text("");
                    showMyloading(".pub_menu", "start", "small center");

                    $(".pub_menu").hide();
                    var mytop = e.pageY - 120;
                    mymenu.css("top", mytop + "px");
                    mymenu.show();
                    mymenu.html("");
                    $.get("ajax/project/rightMenu.jsp?ids=" + obj.attr("id"), function(pbdata) {

                        mymenu.html(pbdata);
                        showMyloading(".pub_menu", "end", "small center");
                    })

                }
            });








        })



    })

</script>
