<%-- 
    Document   : opspram
    Created on : Dec 25, 2011, 2:57:09 PM
    Author     : ismail
--%>
<%@page import="xact.users.users"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>





<%
    /*
     * 
     * 
     * A bottom table edit
     * 
     * 
     * B recursion**/



    String mod_id = request.getParameter("mod_id");
    String pro_id = request.getParameter("pro_id");

    String sid = request.getParameter("sid");

    String Group_Name = request.getParameter("Group_Name");
    String defnum = request.getParameter("defnum");

    String type = request.getParameter("type");


    if (type.equals("")) {

        type = "a";

    }



    String des = request.getParameter("des");
    String winnum = request.getParameter("winnum");




    users u = new users();


    String print_id_b = request.getParameter("print_id_b");
    String print_id_a = request.getParameter("print_id_a");



    if (print_id_b != null && print_id_b.equals("")) {
        print_id_b = mod_id;
    }
    if (print_id_b != null && print_id_a.equals("")) {
        print_id_a = mod_id;
    }
%>



<script>

    $(function() {

        var num_id = 0;






        var pro_id = "<%=pro_id%>";
        var mod_id = "<%=mod_id%>";
        var s_id = "<%=sid%>";

        $(".ops_Finish").click(function() {
            var Group_name = "<%=Group_Name%>";






            var defnum = "<%=defnum%>";

            var winnum = "<%=winnum%>";


            winnum--;



            var des = "<%=des%>";

            var print_id_b = "<%=print_id_b%>";

            var print_id_a = "<%=print_id_a%>";

            var type = "<%=type%>";


            var ins_name = $(".ins_name").val();








            var owner = "<%=u.userReturn(request, "username")%>";

            var CLIENT_ID = "<%=u.userReturn(request, "cid")%>";
            var GROUP_ID = "<%=u.userReturn(request, "gid")%>";






            $.get("ajax/engine/DBDelete.jsp?table=<%=XMLDataModel.SCENARIO_PARAMETERS_TABLENAME%>&filed=SCENARIO_ID&id=" + s_id, function(dat22a) {


                // alert("table=<%=XMLDataModel.SCENARIO_PARAMETERS_TABLENAME%>&filed=id&id="+s_id);





                do_prme(s_id);


                // id_name__arr__inc__0

                var mydata = "";
                var benum = "";
                var be2 = "";





                $(".mycomval").each(function() {




                    mydata += $(this).next(".bb_id").val() + "__" + $(this).val().split("__")[0] + "__" + $(this).next().next(".Override").val() + "__0__100;";

                    be2 += $(this).next(".bb_id").val() + ";";
                    benum += $(this).next().next(".Override").val() + ";";





                })






                $(".mxWindow").remove();





                if (type == "p") {




                    $.get("ajax/engine/returnValue.jsp?table=<%=XMLDataModel.SCENARIO_TABLENAME%>&filde=id&ofilde=PARENT_ID&id=" + s_id, function(dat22a) {

                        if ($.trim(dat22a) != "") {

                            // alert (":"+pro_id+":"+mod_id+":"+dat22a);
                            makeWinDows("Ops Compute Edit", "Create_ops_compute_eidt", Create_ops_compute_eidt(pro_id, mod_id, $.trim(dat22a), "p"), 450, 150, 400, null);
                        }


                    })

                } else if (type == "cs") {





                    makeWinDows("Compute", "Create_ops_compute_eidt", computemsg("cs", mydata, pro_id, mod_id, s_id, be2, benum), 450, 150, 400, null);




                } else if (type == "ca") {



                    makeWinDows("Compute", "Create_ops_compute_eidt", computemsg("ca", mydata, pro_id, mod_id, s_id, be2, benum), 450, 150, 400, null);




                }



            })





        })







        $(".do_cancel").click(function() {

            $(".mxWindow").remove();
        })







        function do_prme(sid) {






            $(".bb_id").each(function() {
                var oldid = $(this).next(".Override").attr("id");
                var newid = $(this).next(".Override").val();
                var my_id = $(this).val();


                if (newid != oldid) {


                    do_data(newid, oldid, my_id, sid);


                }
                ;
            })


            $(".ins_id").each(function() {


                var oldid = $(this).next(".Override").attr("id");
                var newid = $(this).next(".Override").val();
                var my_id = $(this).val();
                if (newid != oldid) {

                    do_data2(newid, oldid, my_id, sid);

                }
            })


        }


        function do_data2(newid, oldid, my_id, sid) {



            $.get("ajax/engine/getID.jsp", function(myggid) {

                var fildes = "MODEL_ID;SCENARIO_ID;ID;OBJECT_ID;OBJECT_CLASS;S_PARAMETER;NEW_VALUE;OLD_VALUE";




                var values =<%=mod_id%> + ";" + sid + ";" + myggid + ";" + my_id + ";com.acrtek.xact.data.bo.BoInsertion;OCCURENCE;" + newid + ";" + oldid;




                $.get("ajax/engine/DBInsert.jsp?table=<%=XMLDataModel.SCENARIO_PARAMETERS_TABLENAME%>&fildes=" + fildes + "&values=" + values, function(data2) {





                });
            });
        }








        function do_data(newid, oldid, my_id, sid) {





            $.get("ajax/engine/getID.jsp", function(myggid) {

                var fildes = "MODEL_ID;SCENARIO_ID;ID;OBJECT_ID;OBJECT_CLASS;S_PARAMETER;NEW_VALUE;OLD_VALUE";

                var values =<%=mod_id%> + ";" + sid + ";" + myggid + ";" + my_id + ";com.acrtek.xact.data.bo.BoBusinessEntity;number;" + newid + ";" + oldid;



                $.get("ajax/engine/DBInsert.jsp?table=<%=XMLDataModel.SCENARIO_PARAMETERS_TABLENAME%>&fildes=" + fildes + "&values=" + values, function(data2) {


                });
            });
        }




        var type = "<%=type%>";



        if (type == "csr" || type == "tsr") {

            var mydata = "";
            var benum = "";
            var be2 = "";





            $(".mycomval").each(function() {




                mydata += $(this).next(".bb_id").val() + "__" + $(this).val().split("__")[0] + "__" + $(this).next().next(".Override").val() + "__0__100;";

                be2 += $(this).next(".bb_id").val() + ";";


                benum += $(this).next().next(".Override").val() + ";";


            })



            $(".mxWindow").remove();
            makeWinDows("Compute", "Create_ops_compute_eidt", computemsg(type, mydata, pro_id, mod_id, s_id, be2, benum), 450, 150, 400, null);


        }







    })

</script> 




<%
    xact.ArrivalRateCalculator a = new xact.ArrivalRateCalculator();


    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();
    ResultSet rs = db.getData(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "*", "model_id='" + mod_id + "'");

    String[] rsyy = db.getRowNocon(XMLDataModel.SCENARIO_TABLENAME, "id='" + request.getParameter("sid") + "'");




    out.print("<div class=\"obsTabel\"><div>Instance Name <input  name=\"ins_name\" value=\"" + rsyy[3] + "\"class=\"ins_name\"/></div><h3>Businss Entity Override values <h3><table><thead><th>Name</th><th>RefModel</th><th>Override</th> <thead>");

    while (rs.next()) {
        String Override_val = lib.tools.Utils.getScenarioPram(mod_id, request.getParameter("sid"), rs.getString("id"), "number", rs.getString("number"), "business_entity");
        out.print("<tr><td> " + rs.getString("name") + "</td><td>" + rs.getString("number") + "</td><td>"
                + "<input type=\"hidden\" class=\"mycomval\"  value=\"" + rs.getString("name") + "__" + rs.getString("id") + "__" + Override_val + "\" />"
                + "<input type=\"hidden\"    name=\"obs_id\" value=\"" + rs.getString("id") + "\" class=\"bb_id\" />"
                + "<input type=\"text\" style=\"width:98%;\" name=\"Override\" class=\"Override\" id=\"" + rs.getString("number") + "\" value=\"" + Override_val + "\" ></td></tr> ");
    }


    out.print("<table/>");



    ResultSet rs2 = db.getData(XMLDataModel.SERVICE_INSERTION_TABLENAME, "*", "model_id='" + mod_id + "'");




    out.print("<h3>Insertion Point Override values <h3><table><thead><th>Insertion Point</th><th>Collector</th><th>Override</th> <thead>");



    while (rs2.next()) {




        String[] rs3 = db.getRowNocon(XMLDataModel.SERVICE_COLLECTOR_TABLENAME, "id='" + rs2.getString("ATTRIB_ID") + "'");



        String Override_val = lib.tools.Utils.getScenarioPram(mod_id, request.getParameter("sid"), rs2.getString("id"), "OCCURENCE", rs2.getString("OCCURENCE"), "Insertion");



        String inp = "";



        if (type.equalsIgnoreCase("a") || type.equalsIgnoreCase("ca")) {

            inp = "<input type=\"text\" style=\"width:98%;\" name=\"Override\" class=\"Override\" id=\"" + rs2.getString("OCCURENCE") + "\" value=\"" + Override_val + "\" >";
        } else {
            inp = Override_val;
        }



        out.print("<tr><td>" + rs2.getString("name") + "</td><td>" + rs3[2] + "</td><td><input type=\"hidden\" class=\"ins_id\" name=\"obs_id\" value=\"" + rs2.getString("id") + "\" >" + inp + "</td></tr>  ");



    }


    out.print("<table/></div><div class=\"do_center\"><input type=\"button\" class=\" ops_Finish\"  value=\"Finish\">      <input type=\"button\" class=\"do_cancel\"  value=\"Cancel\">");



    db.closeCon();
%>




<style>

    .obsTabel th{

        border:2px #888 solid;
    }
    .obsTabel td{

        border:1px #888 solid;
    }

    .obsTabel table {
        width:100%;

    }
</style>
