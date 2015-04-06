<%@page import="lib.tools.Utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>


<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();

%>
<%@page  import="lib.Options.MyVariables" %>
<%
    String js_link = MyVariables.jsFolder;






%>



<div class="mybtclos"></div>



<%
    String nyb = request.getParameter("be");
    String allRows = "";
    String inc = request.getParameter("increment");
    String[] increments = inc.split(";");
//1361913986760__Cards__900__50__100;1361913987258__Trading__180__4__100;1361913987424__Retail Services__900__7__100;
    String status = "";
    if (request.getParameter("status") != null) {


        status = request.getParameter("status");
    }




    String[] allbe = nyb.split(";");
    String retdt = "";




    String nums = "";
    for (int i = 0; i < allbe.length; i++) {


        String[] sp = allbe[i].split("__");


        allRows += sp[0] + "__" + sp[1] + "__" + sp[2] + "__" + increments[i] + "__" + sp[4] + ";";

        allbe[i] = sp[0];

        retdt += allbe[i] + ";";

        nums += sp[2] + ";";


    }


    String modelID = request.getParameter("modelID");
    String scenarioid = request.getParameter("scenarioid");
    String resultName = Utils.getModName(modelID, scenarioid);
    String proID = db.getValue(XMLDataModel.PMXREF_TABLENAME, "pid", "mid=" + modelID);

    String resultsId = proID + "__" + modelID + "__" + scenarioid;

    String[] be = allbe;

    String[] incrr = inc.split(";");
    String s_id = "";
    s_id = modelID;
    if (!scenarioid.equals("0")) {

        s_id = scenarioid;

    }





    out.print(getCapacityPlan(modelID, Integer.parseInt(request.getParameter("ppoint")), incrr, be, nums));

%>




<%!    lib.engine.db.operations db = new lib.engine.db.operations();

    String getCapacityPlan(String modelID, int planpoint, String[] increment_arr, String[] beid, String mums) {
        String tableData = "";
        db.openCon();

        tableData += "<div><table><tr><td>PlanPoint</td><td>Business Trajectory</td><td>Number</td></tr>";

        String[] ar = mums.split(";");


        double[] beNumbers = new double[beid.length];
        double num = 0;

        for (int j = 0; j < planpoint + 1; j++) {
            for (int i = 0; i < beNumbers.length; i++) {


                num = Double.parseDouble(ar[i]) * (1 + ((Double.parseDouble(increment_arr[i]) / 100d) * j));

                String name = db.getRow(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "id=" + beid[i])[3];
                tableData += "<tr><td>" + j + "</td><td  class=\"be2\">" + name + "</td><td ><input class=\"benum\" type\"text\" value=\"" + num + "\"></td></tr>";

            }

            db.closeCon();

        }
        tableData += "</table><input type=\"button\" class=\"next_bt\" value=\"next\" /><div class=\"retdata\" /></div>";
        return tableData;

    }


%>

<script>


    function foaj() {



        var benum = "";
        var be2 = "";

        $(".benum").each(function() {

            benum += $(this).val() + ";";

        })

        $(".be2").each(function() {

            be2 += $(this).text() + ";";

        })


        var att = "allrow=<%=allRows%>&modelID=<%=modelID%>&be=<%=retdt%>&ppoint=<%=request.getParameter("ppoint")%>&systemlimt=<%=request.getParameter("systemlimt")%>&benum=" + benum + "&be2=" + be2 + "&scenarioid=<%=scenarioid%>" + "&status=<%=status%>";

        //  alert ("dsfdsf");
        // modelID


        if (showMyloadingCompute("<%=s_id%>") == "0") {
            var modName ='<%=resultName%>';
            var resultsId = '<%=resultsId%>';
            $(".comblog .data").html("");
            $(".comblog_title").text("");
            getlog("<%= request.getParameter("res_data")%>", "addDate", "delete", modName, resultsId);



            $(".comblog").slideDown();

            


            $.get("ajax/compute/compute3.jsp?" + att, function(data) {
                
               var dataArray = data.split(";");
                 
              /*   if (dataArray[0] == 0) {
                 showMessage("info", "", "Compute for " + dataArray[1] + " finished successfully.", "View Results", function() {
                 computeDone(resultsId);
                 
                 });
                 } else {
                 showMessage("wor", "", "Compute for " + dataArray[1] + " Failed. Error code:" + dataArray[0], "", function() {
                 
                 });
                 }*/
                
                $(".comp_bt").val("Compute");
                $(".comp_bt").removeAttr('disabled');
            })



        }




    }

    function computeDone(id) {

        $(".info").remove();
        $(".showframe").hide();
        $(".comblog").hide();
        openDaignosis(id, "1");
    }
    $(function() {

        $(".mybtclos").click(function() {


            $(this).parent().hide();



        })




        var stat = "<%=request.getParameter("showst")%>";


        if (stat == "1") {


            foaj();
        }



        $(".next_bt").click(function() {

            foaj();

        })


    }
    )


</script>