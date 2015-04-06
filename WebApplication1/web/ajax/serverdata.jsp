<%@page import="lib.tools.Utils"%>
<%@page import="xact.DatabaseImport"%>
<%@page import="xact.viewsClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String ac_id = request.getParameter("ac_id");
    String node_id = request.getParameter("ids");
   
    String node_name = request.getParameter("node_name");
    String comlex_name = request.getParameter("comlex_name");

    NumberFormat nf = NumberFormat.getInstance();

    nf.setRoundingMode(RoundingMode.DOWN);
    nf.setMaximumFractionDigits(6);
    nf.setMaximumIntegerDigits(6);
    String[] OrdTypeList = {
        "count",
        "direct read",
        "generic read",
        "sequential read",
        "insert",
        "update",
        "delete",
        "sort",
        "cursor",
        "fetch",
        "unload"
    };
    String verbs = "";
    for (int k = 0; k < OrdTypeList.length; k++) {
        verbs += k + "__" + OrdTypeList[k] + ";";
    }
    String sid = request.getParameter("sid");
    lib.engine.db.operations db = new lib.engine.db.operations();
    //SQL_APPLICATION_DESC_ID

    String[] data = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + ac_id);

    String[] acdData = db.getRow(XMLDataModel.application_component_desc_TABLENAME, "ID=" + data[2]);

    String[] data2 = db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + data[4]);

    String serverId = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID=" + data2[2])[1];

    String platform = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + serverId)[5];

    String[] data3 = db.getRow(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + data2[1]);

    String[] sql_app = db.getRow(XMLDataModel.SQL_APPLICATION_INST_TABLENAME, "AC_INST_ID=" + ac_id);

    String[] sql_com = db.getRow(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, "SQL_APPLICATION_INST_ID=" + sql_app[0]);

    String appCpu = data[9];
    if (!sid.equals("null")) {

        appCpu = Utils.getScenarioPram(data[1], sid, data[0], "TOTAL_CPU", appCpu, "com.acrtek.xact_services.data.server.APPLICATION_COMPONENT_INST");

    }
    db.openCon();
    String proId = Utils.getProjectId(data[1]);
    DatabaseImport dbi = new DatabaseImport();
    String tables = dbi.getTables(proId);
    String tableId = "0";
    if (!tables.equals("")) {
        tableId = tables.substring(0, tables.indexOf("__"));
    }

    ResultSet diskeGroup = db.getData(XMLDataModel.APP_DISK_GROUP_INST_TABLENAME, "*", "AC_INST_ID=" + ac_id);
    String LdriveViewdata = "";
    while (diskeGroup.next()) {
        String[] diskData = db.getRowNocon(XMLDataModel.DISK_GROUP_INST_TABLENAME, "ID=" + diskeGroup.getString("DISK_GROUP_INST_ID"));
        LdriveViewdata += "<option>" + diskData[3] + "</option>";
    }
    ResultSet sqlComponents = db.getData(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, "*", "SQL_APPLICATION_INST_ID=" + sql_app[0]);
    String procedures = "";
    while (sqlComponents.next()) {

        String name = db.getRowNocon(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, "ID=" + sqlComponents.getString("SQL_COMPONENT_DESC_ID"))[3];
        procedures += "<option value='" + sqlComponents.getString("ID") + "'>" + name + "</option>";
    }
    ResultSet PrioritiesSet = db.getData(XMLDataModel.APPLICATION_PRIO_INST_TABLENAME, "*", "AC_INST_ID=" + ac_id);
    String Priorities = "";
    while (PrioritiesSet.next()) {

        String prio = PrioritiesSet.getString("INST_NAME") + ":" + PrioritiesSet.getString("LEVEL_NUM");
        Priorities += "<option value='" + ac_id + "'>" + prio + "</option>";

    }
    db.closeCon();
    String serverName = data3[2];
    out.print("<div class=\"frm_row do_left \" >"
            + "<div class=\"frm_label\">Node Name:</div>"
            + "<div class=\"class=\"frm_input\"\">" + node_name + "</div></div>");

    out.print("<div class=\"frm_row do_left \" >"
            + "<div class=\"frm_label\">Server Instance:</div>"
            + "<div class=\"class=\"frm_input\"\">" + serverName + "</div></div>");

    out.print("<div class=\"frm_row do_left \" >"
            + "<div class=\"frm_label\">Machine Name:</div>"
            + "<div class=\"class=\"frm_input\"\">" + comlex_name + "</div></div>");

    out.print("<ul class='tabs'><li class='act dataser' id='app'>Application</li>");
    out.print("<li class='dataser' id='sql'>SQL</li>");

    out.print("</ul>");
    out.print("<div  style='display:none;' class='divtab sql'>");
    String allsqltad = "";
    String sqlCecked = "checked='checked'";
    if (sql_app[8] != null) {
        if (sql_app[8].equals("0")) {
            sqlCecked = "";
        }
    }

    String cpu = "";
    if (sql_app[5] != null) {
        if (!sql_app[5].equals("null")) {
            cpu = nf.format(Double.parseDouble(sql_app[5]));
        }
    }
    String io = "";
    if (sql_app[6] != null) {
        if (!sql_app[6].equals("null")) {
            io = nf.format(Double.parseDouble(sql_app[6]));
        }
    }
    String conumption = "<div class=\"class=\"frm_input\"\">"
            + "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">CPU</div>"
            + "<div class=\"class=\"frm_input\"><input class='sqlCpu' type='text' value=' " + cpu + "'/>"
            + "</div></div>"
            + "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">IO</div>"
            + "<div class=\"class=\"frm_input\"><input type='text' class='sqlIo' value='" + io + "'/> "
            + "</div></div>"
            + "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">Activated</div>"
            + "<div class=\"class=\"frm_input\"\"><input type='checkbox' class='sqlActivated' " + sqlCecked + "/> "
            + "</div></div>";
    allsqltad += lib.tools.Utils.HtmlPalnel("Consumption", conumption);

    String volume = "";
    if (sql_app[7] != null) {
        if (!sql_app[7].equals("null")) {
            volume = nf.format(Double.parseDouble(sql_app[7]));
        }
    }
    allsqltad += "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">Stored Procedure Name</div>"
            + "<div class=\"class=\"frm_input\"\"><select class=\"procedures\">" + procedures + "</select> "
            + "<br/> Volume:" + volume + "</div></div>";
    allsqltad += "<table class='data_grid sqlTable'><thead><th>Name</th><th>Verb</th><th>Volume</th><th>Fraction Visited</th><th>Table Name</th>"
            + "<th> Index/Monotony</th><th>Cluster Efficiency</th><thead>";
    String sqlInst = "";
    String sqlDesc = "";
    String modelId = "";
    if (request.getParameter("sqlInst") != null) {
        sqlInst = request.getParameter("sqlInst");
        out.print(""
                + " <script> "
                + " $(function(){ "
                + " $('.tabs li.dataser').removeClass('act'); "
                + " $('.divtab').hide();"
                + " $('.tabs li.dataser#sql').addClass('act');"
                + " $('.sql').show(); "
                + " $('.procedures').val('" + sqlInst + "');"
                + "}) </script>");
    } else {
        sqlInst = sql_com[0];
    }
    sqlDesc = sql_com[2];
    modelId = sql_com[3];

    db.openCon();
    String verbSelect = "";
    String selected = "";
    allsqltad += "<input type='hidden' class='sqlInstance' id='" + sqlInst + "'/><input type='hidden' class='sqlDesc' id='" + sqlDesc + "'/><input type='hidden' class='modelId' id='" + modelId + "'/>";
    ResultSet baseSql = db.getData(XMLDataModel.BASE_SQL_INST_TABLENAME, "*", "SQL_COMPONENT_INST_ID=" + sqlInst);
    while (baseSql.next()) {
        String[] sqldesc = db.getRow(XMLDataModel.BASE_SQL_DESC_TABLENAME, "ID=" + baseSql.getString("BASE_SQL_DESC_ID"));
        String name = sqldesc[5];
        String order = OrdTypeList[Integer.parseInt(sqldesc[6])];
        String volume2 = baseSql.getString("ACCESS_PER_TRAN");
        String fractionVisited = baseSql.getString("JOIN_MISSES");
        String table = db.getRow(XMLDataModel.TABLE_DESC_TABLENAME, "ID=" + sqldesc[2])[1];
        String index = "!!!";
        String[] indexes = db.getRow(XMLDataModel.INDEX_DESC_TABLENAME, "ID=" + sqldesc[3]);
        if (indexes[2] != null && !indexes[2].equals("null")) {
            index = indexes[1];
        }
        for (int j = 0; j < OrdTypeList.length; j++) {
            selected = "";
            if (j == Integer.parseInt(sqldesc[6])) {
                selected = "selected='selected'";
            }
            verbSelect += "<option value='" + j + "'" + selected + ">" + OrdTypeList[j] + "</option>";
        }
        String cluster = baseSql.getString("DISPERSMENT");
        allsqltad += "<tr class='sqlRow sqlTr' id='" + baseSql.getString("ID") + "__" + sqldesc[0] + "'><input type='hidden' class='basesqlInstance' id='" + sqldesc[0] + "'/><input type='hidden' class='basesqlDesc' id='" + baseSql.getString("ID") + "'/>"
                + "<td>" + name + "</td><td><select  class='tableInput baseSqlVerb' >" + verbSelect + "</select></td><td><input type='text' class='tableInput baseSqlVolume' value='" + nf.format(Double.parseDouble(volume2)) + "'/>"
                + "</td><td><input type='text' class='tableInput baseSqlFraction' value='" + nf.format(Double.parseDouble(fractionVisited)) + "'/></td><td class='tabletd' id='" + sqldesc[2] + "'>" + table + "</td>"
                + "<td class='indextd' id='" + sqldesc[3] + "'>" + index + " </td><td><input type='text' class='tableInput baseSqlCluster' value='" + nf.format(Double.parseDouble(cluster)) + "  '/></td><tr>";

    }
    String batch = "checked='checked'";
    if (acdData[5] != null) {
        if (!acdData[5].equals("2")) {
            batch = "";
        }
    }
    allsqltad += "</table> <div class=\"frm_input\"\"><input class=\"addSqlRow\" type='button' value='Add Row'/><input class=\"deleteSqlRow\" type='button' value='Delete Row'/></div>";
    //
    if (sql_com[0] == null) {
        allsqltad = "No SQL Information for this ACI";

    }
    out.print(lib.tools.Utils.HtmlPalnel("Sql Application", allsqltad));
    out.print("</div>");
    out.print("<div class='divtab app'>");
    out.print("<div class=\"frm_row do_left \" ></div>");
    out.print("<div class=\"frm_row do_left \" >"
            + "<div class=\"frm_label\">Name:</div>"
            + "<div class=\"class=\"frm_input\"\">" + data[6] + "</div></div>");
    String Datad = " <div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">Batch</div>"
            + "<div class=\"class=\"frm_input\"\"><input type='checkbox' class='batchWork' " + batch + "/> "
            + "</div></div>"
            + "<div class=\"class=\"frm_input\"\">"
            + "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">CPU</div>"
            + "<div class=\"class=\"frm_input\"> <input type='text' class='applicationCpu' value='" + nf.format(Double.parseDouble(appCpu)) + "'/>"
            + "</div></div>"
            + "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">IO</div>"
            + "<div class=\"class=\"frm_input\"><input type='text' class='applicationIo' value='" + nf.format(Double.parseDouble(data[10])) + "'/> "
            + "</div></div>"
            + "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">MPL</div>"
            + "<div class=\"class=\"frm_input\"><input type='text' class='mpl' value='" + data[7] + "'/> "
            + "</div></div>"
            + "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\">Delay</div>"
            + "<div class=\"class=\"frm_input\"><input type='text' class='applicationDelay' value='" + nf.format(Double.parseDouble(data[12])) + "'/> "
            + "</div></div>"
            + "<div class=\"frm_row do_left  \" >"
            + "<div class=\"frm_label\"># of Delays</div>"
            + "<div class=\"class=\"frm_input\"><input type='text' class='MEAN_AUX_DELAY' value='" + nf.format(Double.parseDouble(data[11])) + "'/> "
            + "</div></div>"
            + "<input type='hidden' value='" + ac_id + "' class='applicationID'/><input type='hidden' value='" + data[3] + "' class='sqlID'/><input type='hidden' value='" + data[3] + "' class='acID'/>";
    out.print(lib.tools.Utils.HtmlPalnel("Consumption", Datad));
    String Data = "";
    if (acdData[5] != null) {
        String com_typ = acdData[5];
        if (com_typ.equals("2")) {
            Data = "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Width</div>"
                    + "<div class=\"class=\"frm_input\"\">"
                    + data[7]
                    + "</div></div>";
            out.print(lib.tools.Utils.HtmlPalnel("Batch", Data, "_30"));
        }
    }
    Data = "<div class=\"frm_row do_left _30 \" >"
            + "<div class=\"frm_label\"></div>"
            + "<div class=\"class=\"frm_input\"\">"
            + "<select multiple class='aci_Priorities'>" + Priorities + "</select></div></div>";
    out.print(lib.tools.Utils.HtmlPalnel("Priorities", Data, "_30"));
    Data = "<div class=\"frm_row do_left _30 \" >"
            + "<div class=\"frm_label\"></div>"
            + "<div class=\"class=\"frm_input\"\">"
            + "<select multiple>" + LdriveViewdata + "</select></div></div>";
    out.print(lib.tools.Utils.HtmlPalnel("Disks", Data, "_30"));
    out.print("</div>");

%>
<style>
    .tableInput {
        border-radius: 3px;
        width: 70% !important;
    }
    .sqlRow,.indextd,.tabletd{
        text-align: center !important;
    }
    .tabs li.dataser{
        list-style: none;
        float:left;
        border:1px solid #333;
        box-shadow: 1px -1px 5px #333333;
        padding: 2px;
        margin: 2px;
        cursor: pointer;
        width: 130px;
        text-align: center
            ;
        height:30px;
        font-size: 10pt
            ;
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
        margin-top:-4px; 



    }



</style>
<script>






    function  afertajax() {

        $(".divtab").hide();
        $("#sql").addClass("act")
        $(".sql").show();
        $(".procedures").val($(this).val());

    }

    $(function() {


        $(".dataser#sql").click(function() {
            SqlApplicationWindows("<%=sql_com[0]%>", "<%=data[1]%>", "<%=sql_app[1]%>", "<%=sql_app[0]%>", "<%=serverId%>", "<%=ac_id%>", "<%=data[4]%>", "<%=sid%>", "<%=node_id%>");
            
            closeWindows("server_windows_data");
            return  false;

        })




        $(".deleteSqlRow").click(function() {

            var id = $(".sqlTr.act").attr('id');
            if (id != null) {

                $.get("ajax/deletBaseSql.jsp?id=" + id, function(mdata) {
                })
            }

            $(".sqlTr.act").remove();
        })
        $(".sqlRow").click(function() {
            $(".sqlTr").removeClass("act");
            $(this).addClass("act");


        })
        $(".tabs li.dataser").click(function() {
            $(".tabs li.dataser").removeClass("act");
            $(this).addClass("act");
            $(".divtab").hide();


            $("." + $(this).attr("id")).show();

        })
        $(".procedures").change(function() {

            var sqlinst = $(this).val();
            var node_name = "<%=node_name%>";
            var comlex_name = "<%= comlex_name%>";
            var acid = "<%= ac_id%>";

            $.get("ajax/serverdata.jsp?ac_id=" + acid + "&node_name=" + node_name + "&comlex_name=" + comlex_name + "&sqlInst=" + sqlinst, function(mdata) {

                $(".comdatas").html(mdata);

            })

        })
        $(".indextd").dblclick(function() {


            $.get("ajax/indexDetail.jsp?descid=" + $(this).attr("id"), function(mdata) {

                makeWinDows("Database Index Details", "index_windows_data", index_windows_data(mdata), 500, 120, 800, null);

            })
        })
        $(".aci_Priorities").dblclick(function() {

            var id = $(this).val();
            var platform =<%=platform%>;
            var modId =<%=data[1]%>;
            $.get("ajax/getAcds.jsp?modelId=" + modelId + "&status=getAciData&acdId=" + id, function(acddata) {
                makeWinDows("Edit Priorities", "editprio", prioInstEdit(platform, acddata, id, modId), 350, 120, 500, null);


            })
        })

        $(".tabletd").dblclick(function() {

            $.get("ajax/tableDetail.jsp?descid=" + $(this).attr("id"), function(mdata) {

                makeWinDows("Database Table Details", "table_windows_data", table_windows_data(mdata), 500, 120, 800, null);

            })
        })

        $(".addSqlRow").click(function() {
            var row = "";

            var tables = getmyOptions('<%=tables%>');
            var verbs = getmyOptions('<%=verbs%>');
            var indexes = "";
            $.get("ajax/indexList.jsp?table=" + <%=tableId%>, function(mdata) {

                indexes = getmyOptions(mdata);

                row += "<tr class='addedSqlRow sqlTr' onclick='handleRow($(this));'><td><input type='text' class='tableInput baseSqlName'/></td><td><select  class='tableInput baseSqlVerb' >" + verbs + "</select></td><td><input type='text' class='tableInput baseSqlVolume' value=''/>"
                        + "</td><td><input type='text' class='tableInput baseSqlFraction' /></td><td><select class='tableInput baseSqlTable' onchange='handleTable($(this).val(),$(this));'>" + tables + "</select></td></td>"
                        + "<td class='indextd'><select class='tableInput baseSqlIndex'>" + indexes + " </select></td><td><input type='text' class='tableInput baseSqlCluster' /></td><tr>";
                $(".sqlTable").append(row);
            })

        });
        $(".batchWork").change(function() {

            var checked = $(".batchWork").is(':checked');
            if (checked) {
                $(".applicationStreams").removeAttr("disabled");
            } else {
                $(".applicationStreams").attr("disabled", "disabled");

            }

        })

    })


</script>
