
<%@page import="java.text.DecimalFormat"%>
<%@page import="xact.utils"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="xact.NodeProperties"%>
<%@page import="xact.ArrivalRateCalculator"%>
<%
    try {
///node properties new 
        String pro_id = request.getParameter("pro_id");

        String[] pro = pro_id.split("/");

        // String corp_id = "1312481382730";
        ArrivalRateCalculator arc = new ArrivalRateCalculator();

        String MODELID = pro[3];
        String SCENARIOID = pro[2];

        NodeProperties np = new NodeProperties();

//out.print(pro[0]);//
        if (pro[0].equalsIgnoreCase("group_node")) {
            String[] prodata = db.getRow(XMLDataModel.NODE_TABLENAME, "id=" + pro[1]);
//String[] prodata2 = db.getRow("node_extension", "id=" + prodata[0]);

            String pid = db.getRow(XMLDataModel.PMXREF_TABLENAME, "mid=" + MODELID)[1];

            String rData = "<script>hostdialogue_show_fun(   '" + pid + "','" + pro_id + "','" + pro[1] + "','" + pro[2] + "');</script><table class=\"tb_Property\">"
                    + "<thead><th colspan=2 >Group Node</th></thead>"
                    + " <thead><th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                    + "<tr class=\"one\"><td>ID</td><td>" + pro[1] + "</td></tr>"
                    + "<tr><td>Tag</td><td>" + prodata[10] + "</td></tr>"
                    + "<tr class=\"one\"><td>Type</td><td>" + prodata[5] + "</td></tr>"
                    + "<tr><td>HostName</td><td>" + prodata[2] + "</td></tr>"
                    + "<tr class=\"one\"><td>Model File</td><td>" + np.createEditableCell(MODELID, SCENARIOID, prodata[0], "node", "MODEL_FILENAME", prodata[1], "group_node", request) + "</td></tr>"
                    + "<tr><td>Group</td><td>" + prodata[4] + "</td></tr>"
                    + "<tr class=\"one\"><td>Repetition</td><td>" + np.createEditableCell(MODELID, SCENARIOID, prodata[0], "node", "repetition", prodata[6], "group_node", request) + "</td></tr>"
                    + "<tr><td>Respons time</td><td> " + np.createEditableCell(MODELID, SCENARIOID, prodata[0], "node", "response_time", prodata[8], "group_node", request) + "</td></tr>"
                    + "<tr><td>Service time</td><td> " + np.createEditableCell(MODELID, SCENARIOID, prodata[0], "node", "servcice_time", prodata[9], "group_node", request) + "</td></tr>";

            if (prodata[10].equalsIgnoreCase("SERVER")) {

                rData += "<tr><td colspan=\"2\"><input type='button'  value='Host Dialog' class='hostdialogue_show_bt'/></td></tr>";

            } else if (prodata[10].equalsIgnoreCase("storage")) {

                rData += "<tr><td colspan=\"2\"><input type='button'  data-nodeid='" + pro[1] + "' value='storage properties Dialog' class='storagedialogue_show_bt'/></td></tr>";

            }

            rData += "<tr><td colspan=\"2\"><input type='button'  value='Node Extension' class='nodeExtension_show_bt'/></td></tr>";

            out.print(rData);

//id tag group node type host name model file group  repetition respons time server time
        } else if (pro[0].equalsIgnoreCase("group")) {

            String[] prodata = db.getRow(XMLDataModel.NET_GROUP_TABLENAME, "id=" + pro[1]);

            out.print("<table class=\"tb_Property\">"
                    + "<thead><th colspan=2 >Group</th></thead>"
                    + " <thead><th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                    + "<tr class=\"one\"><td>ID</td><td>" + prodata[0] + "</td></tr>"
                    + "<tr><td>Tag</td><td>Group</td></tr>"
                    + "<tr class=\"one\"><td>Group</td><td>" + prodata[3] + "</td></tr>"
                    + "<tr><td>Node</td><td></td></tr>");

            //id tag group node
        } else {

            String arrv = "";

            String th_id = "id";

            String[] prodata = db.getRow(pro[0].toUpperCase(), th_id + "=" + pro[1]);

            String[] gdata = prodata;

//out.print(Arrays.deepToString(prodata));                
  
%>


<%if (pro[0].equalsIgnoreCase("BE_BP") || pro[0].equalsIgnoreCase("BE_BE") || pro[0].equalsIgnoreCase("CORPORATE_BE")) {%>


<table class="tb_Property">
    <thead><th colspan=2 >Link</th></thead>
<thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>
<tr><td>ID</td><td><%=prodata[0]%></td></tr>
<tr  class=""><td>TAG</td><td><%=pro[0]%></td></tr>
<tr  class="one"><td>utilization %</td><td>

        <%
            String myretdata = "";

            String myretdataValue = "";

            /*
             * ;
             *
             * creatSCENARIOwithoutreturn
             *
             */
            if (pro[0].equalsIgnoreCase("CORPORATE_BE")) {

                myretdata = np.creatSCENARIOwithoutreturn(MODELID, SCENARIOID, prodata[0], "CORPORATE_BE", "UTILIZATION_FREQUENCY", prodata[4], "CORPORATE_BE", request);

                myretdataValue = Utils.getScenarioPram(MODELID, SCENARIOID, prodata[0], "UTILIZATION_FREQUENCY", prodata[4], "CORPORATE_BE");

            } else if (pro[0].equalsIgnoreCase("BE_BP")) {%>


        <%

            myretdata = np.creatSCENARIOwithoutreturn(MODELID, SCENARIOID, prodata[0], "BE_BP", "UTILIZATION_FREQUENCY", prodata[4], "BE_BP", request);

            myretdataValue = Utils.getScenarioPram(MODELID, SCENARIOID, prodata[0], "UTILIZATION_FREQUENCY", prodata[4], "BE_BP");
        %>



        <%} else if (pro[0].equalsIgnoreCase("BE_BE")) {%>


        <%
            myretdata = np.creatSCENARIOwithoutreturn(MODELID, SCENARIOID, prodata[0], "BE_BE", "UTILIZATION_FREQUENCY", prodata[4], "BE_BE", request);
            myretdataValue = Utils.getScenarioPram(MODELID, SCENARIOID, prodata[0], "UTILIZATION_FREQUENCY", prodata[4], "BE_BE");

        %>
        <%}

            double endvalue = Double.parseDouble(myretdataValue) * 100;

            out.print(endvalue + myretdata);%>

    </td></tr>








<tr><td></td><td></td></tr>
</table>



<%}
    if (pro[0].equalsIgnoreCase("CONNECTORS")) {
        if (SCENARIOID.equalsIgnoreCase("null")) {
%>






<table class="tb_Property">
    <thead><th colspan=2 >Line</th></thead>
<thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>

<tr><td>ID</td><td><%=prodata[0]%></td></tr>
<tr  class=""><td>Location 1</td><td><%=np.getval(XMLDataModel.LOCATION_TABLENAME, "NAME", prodata[2])%></td></tr>
<tr  class="one"><td>Location  2</td><td><%=np.getval(XMLDataModel.LOCATION_TABLENAME, "NAME", prodata[3])%></td></tr>




<tr  class="one"><td> Distance (km)</td><td>

        <%

//
            if (np.getval(XMLDataModel.LINE_TABLENAME, "LENGTH", prodata[0]) == "") {

                out.print(request.getParameter("more"));

            } else {

                //    double afterr=Math.round(  Double.parseDouble(np.getval(XMLDataModel.LINE_TABLENAME, "LENGTH", prodata[0]))     );
                double d2 = (int) Math.round(Double.parseDouble(np.getval(XMLDataModel.LINE_TABLENAME, "LENGTH", prodata[0])) * 100) / 100.0;

                out.print(Double.toString(d2));

            }
        } else {
            String d2 = np.getval(XMLDataModel.LINE_TABLENAME, "LENGTH", prodata[0]);
            String where = "SCENARIO_ID='" + SCENARIOID + "' and  OBJECT_ID='" + prodata[0] + "' and  S_PARAMETER='LENGTH' ";

            String[] scenariodata = db.getRow(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where);
            if (scenariodata[6] != null && !scenariodata[6].equals("")) {
                d2 = scenariodata[6];
            }
            String[] locations = Utils.getLocation1FromLine(prodata[0], SCENARIOID).split(":");
            String location1 = locations[0];
            String location2 = locations[1];


        %>






        <table class="tb_Property">
            <thead><th colspan=2 >Line</th></thead>
            <thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>

            <tr><td>ID</td><td><%=prodata[0]%></td></tr>
            <tr  class=""><td>Location from</td><td><%=location1%></td></tr>
            <tr  class="one"><td>Location  to</td><td><%=location2%></td></tr>




            <tr  class="one"><td> Distance (km) </td><td><%=d2%>
                    <%
                        }
                    %>
                    km </td></tr>





            <tr><td></td><td></td></tr>
        </table>



        <%}
            if (pro[0].equalsIgnoreCase("line")) {%>


        <table class="tb_Property">
            <thead><th colspan=2 >Link</th></thead>
            <thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>

            <tr><td>ID</td><td><%=prodata[0]%></td></tr>



            <tr  class=""><td>Node 1</td><td> <%=np.getval(XMLDataModel.NODE_TABLENAME, "NAME", prodata[4])%></td></tr>
            <tr  class="one"><td>Node 2</td><td><%=np.getval(XMLDataModel.NODE_TABLENAME, "NAME", prodata[5])%></td></tr>
            <tr  class=""><td>Tag</td><td>Line</td></tr>

            <tr  class="one"><td>Overhead</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "line", "Overhead", prodata[6], "line", request)%></td></tr>
            <tr  class=""><td>throughput</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "line", "throughput", prodata[9], "line", request)%></td></tr>


            <tr  class="one"><td>protocol</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "line", "protocol", prodata[8], "line", request)%></td></tr>

            <tr  class=""><td> Error Rate </td><td>   <%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "line", "error rate", prodata[2], "line", request)%></td></tr>

            <tr  class="one"><td> Distance (km)</td><td><%=prodata[3]%></td></tr>





            <tr><td></td><td></td></tr>
        </table>



        <%}
            if (pro[0].equalsIgnoreCase("group_connectors")) {%>



        <table class="tb_Property">
            <thead><th colspan=2 >LINE</th></thead>
            <thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>

            <tr><td>ID</td><td><%=prodata[3]%></td></tr>

            <tr  class="one"><td>Group 1</td><td><%=np.getval("net_group", "NAME", prodata[4])%></td></tr>

            <tr  class=""><td>Node 1</td><td><%=np.getval("node", "NAME", prodata[2])%></td></tr>

            <tr  class="one"><td>Group 2</td><td><%=np.getval("net_group", "NAME", prodata[5])%></td></tr>

            <tr  class=""><td>Node 2</td><td><%=np.getval("node", "NAME", prodata[3])%></td></tr>

            <%
                String[] data = db.getRow("line", "NODE_ID1=" + prodata[2] + "AND NODE_ID2=" + prodata[3]);
                if (data != null) {

            %>
            <tr  class="one"><td>Overhead</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "line", "Overhead", prodata[6], "group_connectors", request)%></td></tr>
            <tr  class=""><td>throughput</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "line", "throughput", prodata[9], "group_connectors", request)%></td></tr>


            <tr  class="one"><td>protocol</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "line", "protocol", prodata[7], "group_connectors", request)%></td></tr>

            <tr  class=""><td> Error Rate </td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "line", "error rate", prodata[2], "group_connectors", request)%></td></tr>

            <tr  class="one"><td> Distance (km)</td><td><%=prodata[3]%></td></tr>
            <%}%>



            <tr><td></td><td></td></tr>
        </table>


        <%}
            if (pro[0].equalsIgnoreCase("service_process_links")) {

        %>




        <table class="tb_Property">
            <thead><th colspan=2 >Link</th></thead>
            <thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>

            <tr><td>ID</td><td><%=prodata[0]%></td></tr>

            <tr  class="one"><td>Tag</td><td><%=prodata[2]%></td></tr>


            <tr  class=""><td>utilization %</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "service_link", "UTILIZATION_FREQUENCY", prodata[10], XMLDataModel.SERVICE_LINK_TABLENAME, request)%></td></tr>




            <tr><td></td><td></td></tr>
        </table>








        <%} else if (pro[0].equalsIgnoreCase("business_entity")) {
            DecimalFormat df = new DecimalFormat();
            df.setMaximumFractionDigits(2);

        %>


        <table class="tb_Property">
            <thead><th colspan=2 >Business Entity</th></thead>
            <thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>
            <tr class="one"><td>Name</td><td><%=prodata[3]%></td></tr>
            <tr><td>ID</td><td><%=prodata[0]%></td></tr>

            <tr  class="one"><td>Tag</td><td><%=prodata[5]%></td></tr>


            <tr><td>Number</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "business_entity", "NUMBER", prodata[4], "business_entity", request)%></td></tr>
            <tr  class="one"><td>Unit</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "business_entity", "UNIT_TYPE", prodata[6], "business_entity", request)%></td></tr>

            <tr  class="one"><td>Numbers Processed</td><td><%=df.format(arc.compCAR(prodata[0], pro[3], "be_be", SCENARIOID))%></td></tr>



            <tr><td></td><td></td></tr>
        </table>
        <%} else if (pro[0].equalsIgnoreCase("business_process")) {
            DecimalFormat df = new DecimalFormat();
            df.setMaximumFractionDigits(2);%>


        <table class="tb_Property">

            <thead><th colspan=2 >Business Process</th></thead>

            <thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>
            <tr class="one"><td>Name</td><td><%=prodata[3]%></td></tr>
            <tr><td>ID</td><td><%=prodata[0]%></td></tr>

            <tr><td>Tag</td><td>business process</td></tr>
            <tr class="one"><td>Batch</td><td><%=prodata[5].equals("1") ? "true" : "false"%></td></tr>
            <tr><td>SLA</td><td><%=prodata[6]%></td></tr>
            <tr class="one"><td>Numbers Processed</td><td><%=df.format(arc.compCAR(prodata[0], pro[3], "be_bp", SCENARIOID))%></td></tr>



        </table>



        <%} else if (pro[0].equalsIgnoreCase("corporate")) {%>


        <table class="tb_Property">

            <thead><th colspan=2 >Corporate</th></thead>

            <thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>
            <tr class="one"><td>Name</td><td><%=prodata[2]%> </td></tr>
            <tr><td>ID</td><td><%=prodata[0]%></td></tr>
            <tr class="one"><td>Tag</td><td>CORPORATE</td></tr>


            <tr><td>Number</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "corporate", "NUMBER", prodata[3], "corporate", request)%></td></tr>
            <tr class="one"><td>Unit Type</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "corporate", "UNIT_TYPE", prodata[4], "corporate", request)%></td></tr>
            <tr><td>windows Duration</td><td><%=np.createEditableCell(MODELID, SCENARIOID, prodata[0], "corporate", "WINDOW_DURATION", prodata[5], "corporate", request)%></td></tr>
            <tr class="one"><td>windows Type</td><td>
                    <%
                        String v = np.createEditableCell(MODELID, SCENARIOID, prodata[0], "corporate", "WINDOW_DURATION_TYPE", prodata[6], "corporate", request);

                        if (v.equalsIgnoreCase("0")) {

                            out.print("Days");
                        } else if (v.equalsIgnoreCase("1")) {
                            out.print("Hours");

                        } else if (v.equalsIgnoreCase("2")) {
                            out.print("Minutes");

                        } else if (v.equalsIgnoreCase("3")) {
                            out.print("Seconds");

                        }

                    %></td></tr>


            <tr ><td>Numbers Processed </td><td><%=prodata[3]%></td></tr>
            <tr><td></td><td></td></tr>
        </table>



        <%} else if (pro[0].equalsIgnoreCase(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME)) {

            String mod_anem = "";

            mod_anem = db.getRow(XMLDataModel.MODEL_TABLENAME, " ID=" + MODELID)[4];

            String[] data = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, " ID=" + pro[1]);
            String[] data2 = null;
            String myTag = data[1];
            String myType = data[7];
            String[] data3 = null;
            db.openDBCon(lib.Options.DbInfo.connectionStringRes);
            if (myType != "preparation") {
                try {
                    data2 = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, " SP_ID=" + pro[1] + " AND MODEL_ID=" + MODELID);
                    data3 = db.getRowNocon(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, " TPR_KEY=" + pro[1] + " AND RESULT_ID=" + MODELID + " AND MOD_NAME='" + mod_anem + "_0'");
                } catch (Exception ex) {
                }
            }

            db.closeCon();
            String[] mes1 = db.getRow(XMLDataModel.MESSAGE_TABLENAME, " ID=" + pro[1] + " AND MODEL_ID=" + MODELID);

            String[] prod_act = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, " ID=" + mes1[3] + " AND MODEL_ID=" + MODELID);

            String[] cons_act = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, " ID=" + mes1[4] + " AND MODEL_ID=" + MODELID);
            String[] prod_comp = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, " ID=" + mes1[5] + " AND MODEL_ID=" + MODELID);
            String[] cons_comp = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, " ID=" + mes1[6] + " AND MODEL_ID=" + MODELID);

            double workload = 0;
            String myarr = "";
            boolean prepare = false;
            if (!myTag.equalsIgnoreCase("end") && !myTag.equalsIgnoreCase("start")) {
                prepare = data[7].equalsIgnoreCase("preparation");
            }

            if (!prepare && !myTag.equalsIgnoreCase("act_xref") && !myTag.equalsIgnoreCase("collector") && !myTag.equalsIgnoreCase("insertion") && !myTag.equalsIgnoreCase("end") && !myTag.equalsIgnoreCase("start") && !myTag.equalsIgnoreCase("service") && !myTag.equalsIgnoreCase("service") && !myTag.equalsIgnoreCase("activity")) {
                double tod = Double.parseDouble(data[9]);
                if (tod == 0) {
                    tod = 1;
                }
                if (data2 != null) {
                    try {
                        workload = (Double.parseDouble(data2[9]) / tod) * 100;
                    } catch (Exception ex) {
                    }
                }

                //BigDecimal arrivalRate=arc.compSAR(pro[1], corp_id,MODELID);
            }

            if (!myTag.equalsIgnoreCase("service")) {

                try {

                    myarr = arc.compSAR(pro[1], MODELID, SCENARIOID).toEngineeringString();
                } catch (Exception e) {

                }

            }

            //   out.print(myTag);
            if (myTag.equalsIgnoreCase("Process")) {

                out.print(np.showProcess(data, workload, data2, data3, myarr, MODELID, SCENARIOID, request));

            } else if (myTag.equalsIgnoreCase("component")) {
                out.print(np.showComponent(data, workload, data2, data3, myarr, MODELID, SCENARIOID, request));

            } else if (myTag.equalsIgnoreCase("link")) {

            } else if (myTag.equalsIgnoreCase("task")) {
                out.print(np.showTask(data, workload, data2, data3, myarr, MODELID, SCENARIOID, request));
            } else if (myTag.equalsIgnoreCase("insertion")) {

                out.print(np.showInsertion(data));

            } else if (myTag.equalsIgnoreCase("collector")) {

                out.print(np.showCollector(data));

            } else if (myTag.equalsIgnoreCase("activity")) {

                out.print(np.showActivity(data, data3, myarr, SCENARIOID));

            } else if (myTag.equalsIgnoreCase("Message")) {

                out.print(np.showMessage(data, mes1, prod_act, cons_act, prod_comp, cons_comp, MODELID, SCENARIOID));

            } else if (myTag.equalsIgnoreCase("end") || myTag.equalsIgnoreCase("start")) {

                out.print(np.showOtherTags(data));

            } else if (myTag.equalsIgnoreCase("service")) {

                out.print(np.showService(data, SCENARIOID, MODELID, request,pro_id));

            }

        } else if (pro[0].equalsIgnoreCase("location")) {
            xact.drawing.Implementation im = new xact.drawing.Implementation();

            //
            //prodata[3]
            String lat = im.parsedeg(prodata[2]);
            String log = im.parsedeg(prodata[3]);

            if (!prodata[10].equalsIgnoreCase("-1")) {

                lat = prodata[11];
                log = prodata[10];
            }
        %>



<thead><th colspan=2 >Location</th></thead>
<table class="tb_Property"><thead><th class="th_Property">Property</th><th class="th_Value">Value</th></thead>

    <tr class="one" ><td  >ID</td><td><%=prodata[0]%></td></tr>
    <tr><td>LATITUDE</td><td><%=lat%></td></tr>
    <tr  class="one"><td>LONGITUDE</td><td><%=log%></td></tr>
    <tr><td>Path</td><td><%=prodata[6]%></td></tr>
    <tr  class="one"><td>Type</td><td>City</td></tr>

</table>
<%

            }
        }

    } catch (Exception e) {
        out.print(e.getMessage() + "::" + e.toString());

    }
%>

<%! String arr(String fff) {

        return fff;

    }
    lib.engine.db.operations db = new lib.engine.db.operations();


%>



<style>
    .SeditBT{
        width: 20px;
        height:19px;
        cursor: pointer;

        display: none;
        float:right;
    }




    .tb_Property td{
        position: relative
    }

</style>
<script >

    $(".tb_Property td").hover(function() {
        $(this).children(".SeditBT").show();

    },
            function() {
                $(this).children(".SeditBT").hide();

            }

    )


</script>




<style>


    .show_d_msg,.show_d_act{ 


        color:#fff;
        cursor: pointer;
        text-align: center;
        border:1px #888 solid


    }







    .formline{
        height:5px;
        width:100%;
        border-bottom:1px #888 solid;
        margin-bottom: 5px
            ;    }
    .formrow{
        width:100%;
        clear: both
    }
    mybottom
    .formrow label {
        display: block;
        width:30%;
        float:left

    }

    .forminput

    {
        float: right;
        width:30%
    }
    .hostdialogue_show_bt,.nodeExtension_show_bt,.importMDL_show_bt{
        background: url("/Xact/templates/fornt/yall/css/images/proper_td_op.png");
        background-size: 100% 100%;
        -moz-border-radius: 15px  15px   15px   15px ;
        border-radius: 15px  15px   15px   15px ;
        color:#fff;
        width: 100%;
        padding: 0 2px 0 2px;
    }
</style>

