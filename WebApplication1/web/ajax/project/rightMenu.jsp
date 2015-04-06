<%@page import="lib.Options.MyVariables"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="xact.results.ResultsExport"%>
<%@page import="xact.DatabaseImport"%>
<%!    lib.engine.db.operations db = new lib.engine.db.operations();
    DatabaseImport dbi = new DatabaseImport();
    xact.users.users user = new xact.users.users();

%> 
<%

    String[] ids = request.getParameter("ids").split("__");

    String fields = new ResultsExport().getNewDetailColumns();
    String throughputFields = new ResultsExport().getThroughputColumns();

    xact.Models m = new xact.Models();

    String mid = ids[1];

    String proId = ids[0];
    String sid = ids[2];

    String computStatus = m.computeStatus(mid);
    String computStatusFinish = "3";
    String computStatusWorking = "1";
    String computStatusFinishWerror = "2";
    String scenario_table = lib.Options.XMLDataModel.SCENARIO_TABLENAME;
    xact.users.users u = new xact.users.users();
    Boolean makeScenario = u.userper(request, "makeScenario");
    Boolean com_sataus = u.userper(request, "Compute");
    Boolean canTimeBox = u.userper(request, "timebox");
    Boolean canFinancialView = u.userper(request, "financial");
    String financialMessage = MyVariables.financialDisabled;
    String timeboxMessage = MyVariables.timeboxDisabled;
    Boolean canCraet = u.userper(request, "create");

    if (ids[2].equalsIgnoreCase("0")) {

        String model_table = lib.Options.XMLDataModel.MODEL_TABLENAME;

        String cl_model_STATUS = db.getRow(model_table, " id=" + mid)[7];

        String pmx_table = lib.Options.XMLDataModel.PMXREF_TABLENAME;

        boolean hasMDL = true;

        db.openCon();
        String[] cl_pmxref = db.getColumn(pmx_table, "mid", " pid=" + proId);

        String modleidmap = proId + "__" + mid + "__0";

        String Computemenu = m.isDisabled("Compute");
        String cancelCompute = m.isDisabled("Reset Compute");
        String resmenu = m.isDisabled("Results");
        String databaseImprt = m.isDisabled("Database Operations");
        String OpsComputesmenu = "";// m.isDisabled("Create Ops Compute");
        String Scenariosmenu = m.isDisabled("Scenarios");
        String exportmenu = m.isEnabled(modleidmap, "export_model", "export.png", "Export Model");
        String deletemenu = m.isEnabled(modleidmap, "delete_model", "service managment.gif", "Delete Model");
        String mdlNodes = m.isEnabled(modleidmap, "mdlNode", "service managment.gif", "Node List");
        String Database_Resources = m.isDisabled("Database Resources");

        // OBC Setup 
        String OBC = m.isDisabled("OBC Setup");

        String Propertiesmenu = m.isDisabled("Properties");

        String Compute_Logmenu = m.isEnabled(modleidmap, "get_log", "gear.gif", "Compute Log");

        Database_Resources = m.isEnabled(modleidmap, "gte_Database_Resources", "gear.gif", "Database Resources");

        if (canCraet == true) {

            deletemenu = m.isEnabled(modleidmap, "delete_model", "service managment.gif", "Delete Model");

        }
        if (com_sataus == true) {

            Computemenu = m.isEnabled(modleidmap, "get_comput", "gear.gif", "Compute");

        }

        //Build OBC Case"
        if (computStatus.equals(computStatusFinish)) {

            resmenu = "<li  class=\"get_resuilt\"><div class=\"Icon\"><img src=\"images/gear.gif\" /></div>Results"
                    + "<ul class=\"submenu\">"
                    + m.isEnabled(modleidmap, "Diagnosis_Repair", "chart_pie.png", "Diagnosis & Repair")
                    + m.isEnabled(modleidmap, "Service_Result", "service managment.gif", "Service Management Results")
                    + m.isEnabled(modleidmap, "Resource_View", "resource managment.png", "Resource Management View")
                    + m.isEnabled(modleidmap, "chronograph_View", "chartcon_ico.png", "Chronograph View")
                    + m.isEnabled(modleidmap, "reportingCenter_View", "report_ico.png", "Reporting Center")
                    + m.isEnabled(modleidmap, "financial_view", "Emblem-Money.png", "Financial View")
                    + m.isEnabled(modleidmap, "export_results", "Emblem-Money.png", "Export Detail Results")
                    + m.isEnabled(modleidmap, "export_throughput_results", "Emblem-Money.png", "Export Throughput Results");

            if (MyVariables.siteUrl.equalsIgnoreCase("/Xact2/")) {
                resmenu += m.isEnabled(modleidmap, "OBC_Case", "obcicone.png", "Build OBC Case");
            }
            resmenu += "</ul></li>";
        } else if (computStatus.equals(computStatusWorking)) {
            cancelCompute = m.isEnabled(modleidmap, "cancelCompute", "resetCompute.png", "Reset Compute");
        }

        if (hasMDL) {

            databaseImprt = "<li  class=\"get_resuilt\"><div class=\"Icon\"><img src=\"images/gear.gif\" /></div>Database Operations"
                    + "<ul class=\"submenu\">"
                    + m.isEnabled(modleidmap, "tableImport", "chart_pie.png", "Import Table")
                    + m.isEnabled(modleidmap, "indexImport", "service managment.gif", "Import Index")
                    + m.isEnabled(modleidmap, "cacheImport", "resource managment.png", "Import Cache")
                    + m.isEnabled(modleidmap, "bufferImport", "chartcon_ico.png", "Import Buffer Pool")
                    + Database_Resources
                    + "</ul></li>";
        }
        int ins_num = db.getRowCount(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "Model_id='" + mid + "' and tag='insertion'");

        if (ins_num > 0 && makeScenario == true) {

            OpsComputesmenu += m.isEnabled(modleidmap, "Create_Ops_Compute", "kexi.png", "Create Ops Compute");
        }
        if (cl_model_STATUS.equals("1") && makeScenario == true) {
            Scenariosmenu = "<li><div class=\"Icon\"><img src=\"images/new.gif\" /></div>Scenarios<ul class=\"submenu\">"
                    + m.isEnabled("i_" + mid, "m_Implemention", "implementation.png", "Modify Implemention")
                    + m.isEnabled("p_" + mid, "m_Process", "business.png", "Modify Process/logic")
                    + m.isEnabled("m_" + mid, "m_Business", "business.png", "Modify Business")
                    + m.isEnabled("p_" + mid, "businessVolume", "businessVolume.png", "Business Volumes")
                    + m.isEnabled(modleidmap, "m_TimeBox", "time_box.png", "Time  Box")
                    + "</ul></li>";
        }

        //siteUrl = "/Xact2/";
        if (cl_model_STATUS.equals("1") && MyVariables.siteUrl.equalsIgnoreCase("/Xact2/")) {

            OBC = m.isEnabled(modleidmap, "OBC_Setup", "obcicone.png", "OBC Setup");
        }

        Propertiesmenu = m.isEnabled("m_" + mid, "view_model_properties", "properties.gif", "Properties");
        String pub_menu = "<ul>" + resmenu + (!computStatus.equals(computStatusWorking) ? Computemenu : "") + (computStatus.equals(computStatusWorking) ? cancelCompute : "") + Compute_Logmenu + OpsComputesmenu + Scenariosmenu + exportmenu + deletemenu + mdlNodes + OBC + Propertiesmenu + "</u>";;
        out.print(pub_menu);
    } else {
        String pub_menu = m.getScenariorightMenu(request, mid, mid, scenario_table, computStatusFinish, computStatusWorking, computStatusFinishWerror, makeScenario, com_sataus, sid, proId);
        out.print(pub_menu + "");
    }
%>



<script>






    $(".gte_Database_Resources").click(function() {
        var miids = $(this).attr("id");
        makeWinDows("Database Resources", "Database_Resources_windows", Database_Resources_windows_fun(miids), 150, 150, 750, null);
        return false;
    })





    $(".Diagnosis_Repair").click(function() {
        openDaignosis($(this).attr("id"), "1");
        // open_Diagnosis_Repair($(this).attr("id"),0);

    })

    $(".chro_View").click(function() {

        openDaignosis($(this).attr("id"), "7");
        //   open_Resource_View($(this).attr("id"),0);  

    })



    $(".Resource_View").click(function() {

        openDaignosis($(this).attr("id"), "2");
        //   open_Resource_View($(this).attr("id"),0);  

    })
    $(".chronograph_View").click(function() {

        openDaignosis($(this).attr("id"), "4");
        //   open_Resource_View($(this).attr("id"),0);  

    })

    $(".reportingCenter_View").click(function() {

        openDaignosis($(this).attr("id"), "5");
        //   open_Resource_View($(this).attr("id"),0);  

    })

    $(".financial_view").click(function() {
        if (<%=canFinancialView%>) {
            openDaignosis($(this).attr("id"), "6");
        } else {
            showMessage("wor", "Action Disabled", '<%=financialMessage%>', "", function() {

            });
        }

        //   open_Resource_View($(this).attr("id"),0);  

    })

    $(".export_results").click(function() {

        var ids = $(this).attr("id");
        $.get("ajax/results/planPoints.jsp?mid=" + ids, function(data) {

            exportResults(ids, '<%=fields%>', data);
        })



    })
    $(".export_throughput_results").click(function() {

        var ids = $(this).attr("id");
        $.get("ajax/results/planPoints.jsp?mid=" + ids, function(data) {

            exportThroughpuResults(ids, '<%=throughputFields%>', data);
        })



    })

    $(".tableImport").click(function() {

        var ids = $(this).attr("id");
        makeWinDows("Import Table Data", "importTableData", importTableData(ids, '<%= dbi.getCaches(proId)%>', '<%=dbi.getNamespaces(proId)%>'), 450, 150, 400, null);
        return false;
    })






    $(".indexImport").click(function() {

        var ids = $(this).attr("id");
        makeWinDows("Import Index Data", "importIndexData", importIndexData(ids, '<%=dbi.getTables(proId)%>'), 450, 150, 400, null);
        return false;
    })



    $(".cacheImport").click(function() {
        var ids = $(this).attr("id");
        makeWinDows("Import Cache Data", "importCacheData", importCacheData(ids, '<%= dbi.getTables(proId)%>', '<%=dbi.getNamespaces(proId)%>'), 450, 150, 400, null);
        return false;
    })
    $(".bufferImport").click(function() {
        var ids = $(this).attr("id");
        makeWinDows("Import buffer Data", "importBufferData", importBufferData(ids), 450, 150, 400, null);
        return false;
    })
    $(".Service_Result").click(function() {

        openDaignosis($(this).attr("id"), "3");
        // open_Service_Result();

    })



    $(".OBC_Case").click(function() {

        var ids = $(this).attr("id").split("__");


        $.get("ajax/project/OBC_Case.jsp?mid=" + ids[1] + "&sid=" + ids[2] + "&type=noMdl", function(data) {
            if (data == "false") {

                obcalert(ids[1], ids[2]);
            }


        });
    });

    $(".OBC_Setup").click(function() {

        var ids = $(this).attr("id").split("__");


        OBC_Setup(ids[1]);
    });




    $(".mdlNode").click(function() {
        var ids = $(this).attr("id").split("__")[1];
        $.get("ajax/views/groupView/getNodeList.jsp?mid=" + ids + "&type=noMdl", function(data) {
            nodeList(ids, data);
        });
    });
    $(".export_model").click(function() {
        var ids = $(this).attr("id").split("__")[1];
        window.open(
                "ajax/xact/importExportModel.jsp?model=" + ids + "&status=export",
                '_blank' // <- This is what makes it open in a new window.
                );
    });
    $(".delete_model").click(function() {
        var ids = $(this).attr("id").split("__")[1];
        var pro_id = $(this).attr("id").split("__")[0];
        $.get("ajax/project/ModelData.jsp?id=" + ids + "&status=model_name", function(modelName) {
            var answer = confirm("Are you sure you want to delete the model '" + modelName + "' ?");
            if (answer) {
                showMyloading(".main", "start");
                $.get("ajax/project/deleteProject.jsp?id=" + ids + "&status=delModel", function(data) {

                    $.get("ajax/engine/getModel.jsp?alias=xact&pro_is=" + pro_id, function(modelData) {
                        $(".models_list .cont").html(modelData);
                        closeWindows("pro_list_form");
                        showMyloading(".main", "end");
                        openCorporate(".get_model:first", "c", $(".creat_corporate_name").val());
                    });
                });
            }
        });
    });
    $(".ComputeSingle_6").click(function() {

        if (<%=canTimeBox%>) {
            get_computdo($(this).attr("id"));
        } else {
            showMessage("wor", "Action Disabled", '<%=timeboxMessage%>', "", function() {

            });
        }
    })
    $(".ComputeSeries_6").click(function() {

        if (<%=canTimeBox%>) {
            get_computdo($(this).attr("id"), "5");
        } else {
            showMessage("wor", "Action Disabled", '<%=timeboxMessage%>', "", function() {

            });
        }
    })


    $(".EditParameters_6").click(function() {

        if (<%=canTimeBox%>) {

            var myis = $(this).attr("id").split("__");
            var pro_id = myis[0];
            var mid = myis[1];
            var sid = myis[2];
            showMyloading(".main", "start");
            $.get("ajax/compute/opsTable.jsp?pro_id=" + pro_id + "&mod_id=" + mid + "&sid=" + sid, function(pbdata) {


                $.get("ajax/scenario/getTrajectoryTree.jsp?mod_id=" + mid + "&sid=" + sid, function(treedata) {
                    $.get("ajax/scenario/getScenarioData.jsp?modid=" + mid + "&id=" + sid, function(sdata) {
                        //cordata




                        makeWinDows("Edit Scenario", "eidteTimeBoxDataWindows", EditTimeBoxWindows(pro_id, mid, sid, pbdata, sdata, treedata), 450, 150, 450, 400);
                        showMyloading(".main", "end");
                    })
                })
            })
        }
        else {
            showMessage("wor", "Action Disabled", '<%=timeboxMessage%>', "", function() {

            });
        }
    })



    $(".EditParameters6").click(function() {
        /* var myis= $(this).attr("id");
         var  myisr=  myis.split("__");
         
         makeWinDows("Compute", "Create_ops_compute_eidt" ,computemsg("csr"),450, 150,400,null);
         */

        var myis = $(this).attr("id");
        var myisr = myis.split("__");
        makeWinDows("Ops Compute Edit", "Create_ops_compute_eidt", Create_ops_compute_eidt(myisr[0], myisr[1], myisr[2], "csr"), 450, 150, 400, null);
    })




    $(".EditParameters7").click(function() {
        var myis = $(this).attr("id");
        var myisr = myis.split("__");
        makeWinDows("Ops Compute Edit", "Create_ops_compute_eidt", Create_ops_compute_eidt(myisr[0], myisr[1], myisr[2], "ca"), 450, 150, 400, null);
    })



    $(".EditParameters5").click(function() {
        var myis = $(this).attr("id");
        var myisr = myis.split("__");
        makeWinDows("Ops Compute Edit", "Create_ops_compute_eidt", Create_ops_compute_eidt(myisr[0], myisr[1], myisr[2], "cs"), 450, 150, 400, null);
    })


    $(".EditParameters4").click(function() {
        var myis = $(this).attr("id");
        var myisr = myis.split("__");
        makeWinDows("Ops Compute Edit", "Create_ops_compute_eidt", Create_ops_compute_eidt(myisr[0], myisr[1], myisr[2], "a"), 450, 150, 400, null);
    })


    $(".EditParameters3").click(function() {
        var myis = $(this).attr("id");
        var myisr = myis.split("__");
        makeWinDows("Ops Compute Edit", "Create_ops_compute_eidt", Create_ops_compute_eidt(myisr[0], myisr[1], myisr[2], "p"), 450, 150, 400, null);
    })


    $(".EditParameters3").click(function() {
        var myis = $(this).attr("id");
        var myisr = myis.split("__");
        makeWinDows("Ops Compute Edit", "Create_ops_compute_eidt", Create_ops_compute_eidt(myisr[0], myisr[1], myisr[2], "p"), 450, 150, 400, null);
    })
    $(".m_TimeBox").click(function() {

        if (<%=canTimeBox%>) {
            var id = $(this).attr("id");
            var ids = id.split("__");
            makeWinDows("Create Time Box", "Time_Box_windows", CreateTimeBoxWindows(ids[0], ids[1], ids[2]), 450, 150, 400, 100);
        }
        else {
            showMessage("wor", "Action Disabled", '<%=timeboxMessage%>', "", function() {
            });
        }
    })
    $(".Create_Ops_Compute").click(function() {
        var id = $(this).attr("id");
        var ids = id.split("__");
        makeWinDows("Create Ops Compute", "view_Detail_windows", Create_ops_compute(ids[0], ids[1], ids[2]), 450, 150, 400, null);
    })




    $(".get_log").click(function() {
        $(".comblog .data").html("");
        $(".comblog_title").text("");
        getlog($(this).attr("id"), "", "");
        $(".comblog").slideDown();
    })



    $(".view_Detail").click(function() {
        var clas = ".scenariolink." + $(this).attr("id");
        var myis = $(clas).attr("id").split("__");
        var pro_id = myis[0];
        var mod_id = myis[1];
        var sid = myis[2];
        $.get("ajax/engine/returnrow.jsp?table=SCENARIO&id=" + sid, function(edata) {
            //   $(".scenario_view_Detail_name").val(edata);

            scnearioProperties(sid, pro_id, mod_id, edata);
        })
    })





    $(".get_comput").not(".__7").click(function() {


        get_computdo($(this).attr("id"));
    })
    $(".get_comput.__7").click(function() {


        openConmputWindows__7($(this).attr("id"));
    });
    $(".s_Delete").click(function() {





        $.get("ajax/scenario/deleteScenario.jsp?id=" + $(this).attr("id"), function(data) {

            $("#" + $(this).attr("id")).hide();
            var pro_id = "<%=proId%>";
            updateModleTreeview(pro_id);

        })

    });
    $(".timeboxDelete").click(function() {


        var deleteTimebox = confirm("Are you sure you would like to delete this timebox?");
        if (deleteTimebox) {
            var pro_id = "<%=proId%>";
            $.get("ajax/scenario/deleteScenario.jsp?id=" + $(this).attr("id"), function(data) {

                updateModleTreeview(pro_id);
            });
        }
    });
    $(".businessVolume").click(function() {
    })
    $(".cancelCompute").click(function() {
        var spclass = $(this).attr("ID");
        var model_id = spclass.split("__")[1];
        var parent_id = spclass.split("__")[2];
        if (parent_id === "" || parent_id == null || parent_id == "0") {
            parent_id = model_id;
        }

        $.get("ajax/compute/resetCompute.jsp?id=" + parent_id, function(data) {

            UpdateCorporate(model_id);
            showMyloading(".main", "end");
        })
    });
    $(".m_Implemention,.m_Process,.m_Business,.businessVolume").click(function() {
        //myclass,model_id,parent_id 


        var myclass = $(this).attr("class");
        var Type = "";
        if (myclass == "m_Implemention") {
            Type = "1";
        } else if (myclass == "m_Process") {
            Type = "2";
        } else if (myclass == "m_Business") {
            Type = "0";
        } else if (myclass == "businessVolume") {
            Type = "7";
        }

        var spclass = $(this).attr("ID");
        // spclass= spclass.split("__");i_ p_ m_
        spclass = spclass.replace("i_", "");
        spclass = spclass.replace("p_", "");
        spclass = spclass.replace("m_", "");
        var id = "<%=xact.general.getNewID()%>";
        var owner = "<%=user.userReturn(request, "username")%>";
        var Cid = "<%=user.userReturn(request, "cid")%>";
        var Gid = "<%=user.userReturn(request, "gid")%>";
        var model_id = spclass.split("__")[0];
        var parent_id = spclass.split("__")[1];
        if (parent_id === "" || parent_id == null) {
            parent_id = model_id;
        }
        var pro_id = "<%=proId%>";
        scenario_Creat(Cid, Gid, owner, id, Type, model_id, parent_id, pro_id);
    })


    $(".tree li").css("font-size", "7pt");
    $(".m_Implemention_s,.m_Process_s,.m_Business_s").click(function() {
        //myclass,model_id,parent_id 


        var myclass = $(this).attr("class");
        var Type = "";
        if (myclass == "m_Implemention_s") {
            Type = "1";
        } else if (myclass == "m_Process_s") {
            Type = "2";
        } else if (myclass == "m_Business_s") {
            Type = "0";
        }

        var spclass = $(this).attr("ID");
        // spclass= spclass.split("__");i_ p_ m_
        spclass = spclass.replace("i_", "");
        spclass = spclass.replace("p_", "");
        spclass = spclass.replace("m_", "");
        var id = "<%=xact.general.getNewID()%>";
        var owner = "<%=user.userReturn(request, "username")%>";
        var Cid = "<%=user.userReturn(request, "cid")%>";
        var Gid = "<%=user.userReturn(request, "gid")%>";
        var Sp = spclass.split("__");
        var model_id = Sp[0];
        var parent_id = Sp[1];
        var pro_id = "<%=request.getParameter("pro_is")%>";
        scenario_Creat(Cid, Gid, owner, id, Type, model_id, parent_id, pro_id);
    })

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
    $(".pub_menu li,.submenu").hover(function() {

        $(this).children(".submenu").show();
    }, function() {

        $(this).children(".submenu").hide();
    }

    )
</script>

