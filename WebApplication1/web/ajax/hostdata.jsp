<%@page import="lib.Options.DbInfo"%>
<%@page import="xact.ServerNodeOperations"%>
<%@page import="lib.tools.Utils"%>
<%@page import="org.directwebremoting.dwrp.ArrayOutboundVariable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.read.Processor"%>
<%@page import="cat.read.Manufacturer"%>
<%@page import="cat.read.Catalog"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.results.resultes"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String Test = "";
    try {

        ServerNodeOperations s = new ServerNodeOperations();
        lib.engine.db.operations db = new lib.engine.db.operations();
        String noid = request.getParameter("nod_id");
        String ids = request.getParameter("ids");
        String SERVER_INST_ID = request.getParameter("SERVER_INST_ID");

        int rowCount = db.getRowCount(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID='" + noid + "'");
        //  System.err.println("hostdata number=" + rowCount);
        int maxProcessors = 0;
        String[] nodedata;
        String[] htis_complex = null;
        String nodeName = "";
        String complexName = "";
        String serverId = "";
        String modelId = "";
        String sid = request.getParameter("sid");

        nodedata = db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + noid);
        modelId = nodedata[1];

        if (rowCount > 0) {
            String[] data = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "NODE_ID=" + noid);
            serverId = data[0];
            nodeName = nodedata[2];
            db.openCon();
            ResultSet datars = db.getData(XMLDataModel.COMPLEX_INST_TABLENAME, "*", "SERVER_INST_ID=" + data[0]);
            String mdata = "";
            mdata += "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Node Name</div>"
                    + "<div class=\"class=\"frm_input\"\">" + nodedata[2] + "</div></div>";
            mdata += "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Complex:</div><input class='SERVER_INST_ID' type='hidden' value='" + data[0] + "' / >"
                    + "<div class=' clear'><select class='complex'>";
            String com_id = "";
           
            
            
            
            if (request.getParameter("complex") != null) {
                com_id = request.getParameter("complex");
            }

            while (datars.next()) {
                String selected = "";
                if (datars.getString("ID").equalsIgnoreCase(com_id)) {
                    selected = "selected='selected'";

                }
                mdata += "<option value='" + datars.getString("id") + "'" + selected + ">" + datars.getString("NAME") + "</option>";
                if (com_id.equalsIgnoreCase("")) {
                    com_id = datars.getString("id");
                }
            }

            
            
            htis_complex = db.getRowNocon(XMLDataModel.COMPLEX_INST_TABLENAME, "id=" + com_id);

            maxProcessors = Integer.parseInt(htis_complex[14]);
            complexName = htis_complex[3];
            ///////////////////////
            
            
            
            Catalog c = new Catalog(DbInfo.Host, "3306", DbInfo.catdb, "mysql", lib.Options.DbInfo.dbUser, lib.Options.DbInfo.dbPassword, 50);

            String catIndex = data[5];
            String constructorIndex = htis_complex[9];
            String processorIndex = htis_complex[10];
            if (!sid.equals("null")) {

                constructorIndex = Utils.getScenarioPram(nodedata[1], sid, com_id, "CAT_CONSTRUCTOR_INDEX", htis_complex[9], "com.acrtek.xact_services.data.server.COMPLEX_INST");
                processorIndex = Utils.getScenarioPram(nodedata[1], sid, com_id, "CAT_CPU_INDEX", htis_complex[10], "com.acrtek.xact_services.data.server.COMPLEX_INST");
                catIndex = Utils.getScenarioPram(nodedata[1], sid, data[0], "CATALOG", data[5], "com.acrtek.xact_services.data.server.SERVER_INST");
                //  out.print(processorIndex);
            }
            c.ListCatalogs();
            c.setCatByOffset(Integer.parseInt(catIndex));
            
            
            Manufacturer manufacturer = new Manufacturer(c);
            manufacturer.ListManufacturers();
            manufacturer.setManufacturer(Integer.parseInt(constructorIndex));
            
            

            Processor uc = new Processor(c);
            ArrayList pList = uc.ListProcessors();
            try {

                uc.setProcessors(Integer.parseInt(processorIndex));
            } catch (IndexOutOfBoundsException ex) {
                //out.print("The selected processor model isn't available from this manufacturer. Please reselect the processor model");
            }
            String model = "";
            ArrayList list = uc.getData();
            ArrayList param = (ArrayList) list.get(1);

            try {

                model = (String) pList.get(Integer.parseInt(processorIndex));
            } catch (IndexOutOfBoundsException ex) {
                model = "The selected processor model isn't available from this manufacturer. Please reselect the processor model";
            }

            //////////////////////////////////////////
            mdata += "</select>";
            if (sid.equals("null")) {
                mdata += "<div><input type ='button' class='createServer' value='Manage Servers'/>"
                        //+ "<input type ='button' class='getXML' value='Import MDL'/>"
                        + "</div></div></div>";

            }

            String loptions = "";
            String ischack = "";
            String serComponent = "";
            String logServer = "";

            int count = 0;
            // while (datars.next()) {

            ResultSet datarL = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "COMPLEX_INST_ID=" + com_id);

            String logicals = "";
            String processor = "";

            loptions += "<option></option>";

            while (datarL.next()) {
                if (count == 0) {
                    logServer = datarL.getString("id");
                }

                String[] datarln = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "id=" + datarL.getString("LOGICAL_SERVER_ID"));

                //SERVER_INST_ID
                String select = "";
                if (datarL.getString("id").equalsIgnoreCase("SERVER_INST_ID")) {

                    select = "selected";
                }

                loptions += "<option " + select + " value='" + datarL.getString("id") + "' >" + datarln[2] + "</option>";
                if (datarln[3] != null) {
                    if (!datarln[3].equals("")) {
                        if (Integer.parseInt(datarln[3]) > 0) {
                            ischack = "chacked";
                        }
                    }
                } else {

                    ischack = "";
                }

                if ("".equals(logicals)) {
                    logicals = datarL.getString("LOGICAL_PROCESSORS");
                }

                count++;
            }

            String DBinststatus = "0";

            DBinststatus = request.getParameter("DBinststatus");

            String mdata2 = "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Server instance :</div>"
                    + "<div class='_50'>"
                    + "<select class='log_servers' >" + loptions + "</select>"
                    + "<div><input type ='button' class='createAcd' value='Manage ACD'/>"
                    + "<input type ='hidden' class='nod_id' value='" + noid + "'/>"
                    + "<input type ='hidden' class='mod_id' value='" + modelId + "'/>"
                    + "<input type ='button' class='createGroupAci' value='Create ACI'/>"
                    + "<input type ='button' class='deleteAci' value='Delete ACI'/>";

            mdata2 += "<input type ='hidden' class='DBinststatus' value='" + DBinststatus + "'/>";

            if (DBinststatus.equals("1") || DBinststatus.equals("2")) {

                mdata2 += "<input type ='button' class='DBinst' value='DB inst'/>";

            } else {

                mdata2 += "<input type ='button' type ='hidden'  class='DBinst hidden' value='DB inst'/>";

            }

            //datarL.getString("id")
            mdata2 += "</div></div></div>";

            if (request.getParameter("logServer") != null) {
                logServer = request.getParameter("logServer");
                out.print(""
                        + " <script> "
                        + " $(function(){ "
                        + " $('.log_servers').val('" + logServer + "');"
                        + "}) </script>");

            }

            // setComponent
            if (!logServer.equals("")) {
                ResultSet datarapp = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + logServer);

                while (datarapp.next()) {

                    serComponent += "<option value='" + datarapp.getString("id") + "'>" + datarapp.getString("INST_NAME") + "</option>";
                }

            }

            if (c.getCatalogOffset() != 70) {
                mdata += "<div class=\"frm_row do_left \" >"
                        + "<div class=\"frm_label\">Number of Processors: </div>"
                        + "<div class=\"class=\"frm_input\"\">" + htis_complex[14] + "</div></div>";
                mdata += "<div class=\"frm_row do_left \" >"
                        + "<div class=\"frm_label\">Power:  </div>"
                        + "<div class=\"class=\"frm_input\"\">" + param.get(1) + "</div></div>";

            }
            mdata += "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Manufacturer: </div>"
                    + "<div class=\"class=\"frm_input\"\">" + manufacturer.getManufacturerName() + "</div></div>";
            mdata += "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Model: </div>"
                    + "<div class=\"class=\"frm_input\"\">" + model + "</div></div>";

            mdata2 += "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Virtualized :</div>"
                    + "<div class=\"class=\"frm_input\"\"><input type=\"checkbox\" " + ischack + " /></div></div>";

            mdata2 += "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Logical Processor: " + logicals + "</div>"
                    + "<div class=\"class=\"frm_input\"\"></div></div>";

            
            
            
            
            mdata2 += "<div class=\"frm_row do_left \" >"
                    + "<div class=\"frm_label\">Server Components:</div>"
                    + "<div class=\"class=\"frm_input\"\"><select style=' width:50%;'   class='serComponent' multiple >" + serComponent + "</select></div></div>";

            mdata += lib.tools.Utils.HtmlPalnel("", mdata2);

            out.print(lib.tools.Utils.HtmlPalnel("Host Properties", mdata));

            db.closeCon();

        } else {

            out.print("No MDL Data Found for This Node");
        }


%>

<script>
    $(function() {




        $.get("ajax/views/groupView/dbinst_check.jsp?&complex=" + $(".complex").val() + "&log_servers=" + $(".log_servers").val() + "&complex=" + $(".complex").val() + "&SERVER_INST_ID=" +<%=serverId%>, function(smdata) {
//DBinst
            if ($.trim(smdata) === "1" || $.trim(smdata) === "2") {

                $(".DBinst").show()
            } else {

                $(".DBinst").hide()

            }
        })


        $(".complex").change(function() {
            $.get("ajax/views/groupView/dbinst_check.jsp?&complex=" + $(".complex").val() + "&log_servers=" + $(".log_servers").val() + "&complex=" + $(".complex").val() + "&SERVER_INST_ID=" +<%=serverId%>, function(smdata) {
                $.get("ajax/hostdata.jsp?nod_id=" + "<%=noid%>" + "&complex=" + $(".complex").val() + "&sid=" +<%=sid%> + "&SERVER_INST_ID=" +<%=serverId%> + "&DBinststatus=" + $.trim(smdata)+ "&ids=<%=ids%>" + "&ids=<%=ids%>" , function(mdata) {
                    $(".comdata").html(mdata);
                });
            });
        });
        $(".log_servers").change(function() {

            var serverId = $(this).val();
            var nod_id = "<%=noid%>";
            $.get("ajax/views/groupView/dbinst_check.jsp?" + "&log_servers=" + $(".log_servers").val() + "&complex=" + $(".complex").val() + "&SERVER_INST_ID=" +<%=serverId%>, function(mdata) {

                $.get("ajax/hostdata.jsp?complex=" + $(".complex").val() + "&nod_id=" + nod_id + "&logServer=" + serverId + "&sid=" +<%=sid%> + "&DBinststatus=" + $.trim(mdata)+ "&ids=<%=ids%>" , function(mdata) {

                    $(".comdata").html(mdata);
                });
            });
        });
        
        
        
        $(".getXML").click(function() {
            var nod_id = "<%=noid%>";
            var modelId = "<%=modelId%>";
            var serverId = "<%=serverId%>";
            $.get("ajax/hostdata/getxml.jsp?complexId=" + $(".complex").val() + "&nodeId=" + nod_id + "&modelId=" + modelId + "&serverId=" + serverId+ "&ids=<%=ids%>" , function(mdata) {

                makeWinDows("Import mdl", "hostXml", hostXml(mdata, serverId, modelId), 550, 120, 700, null);
            });
        });
      
        
        
          $(".moveAci").click(function() {
            var nod_id = "<%=noid%>";
            var modelId = "<%=modelId%>";
            var server = $(".log_servers").val();
            $.get("ajax/createAci.jsp?complexId=" + $(".complex").val() + "&nodeId=" + nod_id + "&modelId=" + modelId + "&serverId=" + server, function(mdata) {

                makeWinDows("Add Application Instance", "addAci", addAci(mdata), 350, 120, 500, null);
            })

        })
          $(".createServer").click(function() {
            var nod_id = $(".complex").val();
            var modelId = "<%=modelId%>";
            var maxProcessors = "<%=maxProcessors%>";
            //  $.get("ajax/createServer.jsp?complexId=" + $(".complex").val() + "&nodeId=" + nod_id + "&modelId=" + modelId, function(mdata) {

            makeWinDows("Add Server Image", "addServer", addServer(nod_id, modelId, $(".complex option:selected").text(), maxProcessors), 550, 120, 700, null);
            /// })

        })
        
        
        $(".createAcd").click(function() {
            var nod_id = "<%=noid%>";
            var modelId = "<%=modelId%>";
            var server = $(".log_servers").val();
            var complex = $(".complex").val();
            var selectedServer = $(".log_servers  option:selected").text();
            //addAcd(complex, nod_id, modelId, server)    $.get("ajax/createAcd.jsp?complexId=" + $(".complex").val() + "&nodeId=" + nod_id + "&modelId=" + modelId + "&serverId=" + server, function(mdata) {

            makeWinDows("Add Application Description", "addAcd", addAcd(complex, nod_id, modelId, server, selectedServer), 350, 120, 600, null);
            ///  })

        })
      
        
        
        
        
        
        $(".deleteAci").click(function() {

            var id = $(".serComponent").val();
            $.get("ajax/createAci.jsp?id=" + id + "&status=delete", function(mdata) {

                $(".serComponent option:selected").remove();
            })

        })


        $(".createGroupAci").click(function() {
            var nod_id = "<%=noid%>";
            var modelId = "<%=modelId%>";
            var selectedlsId = $(".log_servers  option:selected").val();
            $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modelId + "&lsiId=" + $(".log_servers  option:selected").val() + "&status=getACD", function(r_data) {

                $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modelId + "&lsiId=" + $(".log_servers  option:selected").val() + "&status=allServers", function(allServers) {
                    $.get("ajax/views/groupView/storageProberties.jsp?mid=" + modelId + "&nod_id=" + "<%=  s.getConnectedStorageNode(noid)%>", function(nodeData) {

                        createNewAci(modelId, selectedlsId, r_data, allServers, nodeData, nod_id);
                    });
                });
            });
        })
        $(".serComponent").dblclick(function() {


            var node_name = "<%=nodeName%>";
            var comlex_name = "<%=complexName%>";
            $.get("ajax/serverdata.jsp?ac_id=" + $(this).val() + "&node_name=" + node_name + "&comlex_name=" + comlex_name + "&sid=" +<%=sid%> + "&ids=<%=ids%>" , function(mdata) {

                makeWinDows("Server Dialog", "server_windows_data", server_windows_data(mdata), 500, 120, 800, "500");
            })
        })

    })
</script>
<style> td.mxWindowPane .frm_label {
        font-weight: bold;
        border-bottom:1px solid #999;

        width:35%
    }


    td.mxWindowPane select {
        font-size: 7.5pt;
        margin-top: -5px;
    }

</style>
<%

    } catch (Exception e) {

        out.print(e.getMessage() + " <br />  No MDL Data found. Please check if this server is connected to a storage node.");
    }

    out.print(Test);


%>
