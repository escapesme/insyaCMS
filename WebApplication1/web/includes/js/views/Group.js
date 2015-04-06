/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


//<editor-fold defaultstate="collapsed" desc="old">


$(function() {




    $(document).on("click", ".storagedialogue_show_bt", function() {



        var nod_id = $(this).data("nodeid");
        $.get("ajax/views/groupView/storageProberties.jsp?nod_id=" + nod_id, function(prodata) {

            storageProberties(prodata, nod_id);
        });
    });
    //  $(".view_imgroup").click();

    /*
     $(".group_tabs .th_close").click(function() {
     
     $(".th_close").removeClass("act");
     var ins = $(".group_tabs li:last").index();
     var ins2 = $(this).parent("li").index();
     var lsdo = 0;
     if (ins == ins2) {
     
     lsdo = ins - 1;
     } else {
     lsdo = ins;
     }
     
     
     $(".group_tabs li").eq(lsdo).children(".th_close").addClass("act");
     })
     
     /*
     $(".group_tabs li").click(function() {
     $(".th_close").removeClass("act");
     $(this).children(".th_close").addClass("act");
     var myid = $(this).attr("id");
     $(".group_tabtbr").hide();
     $("#group_outline_11" + myid).show();
     });*/
});
function newServer(data2, modelId, complex, maxprocessors) {
    var data = "<script>";
    data += "newServerActions('" + modelId + "','" + complex + "','" + maxprocessors + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("Name", "text", "newSeverName", "", "");
    data += CreateFiled("VM", "text", "newSeverVM", "", "");
    data += CreateFiled("Logical Processors", "text", "newSeverLP", "1", "");
    data += CreateFiled("total Priorities", "text", "newSeverTP", "1", "");
    data += CreateFiled("Time Slice", "text", "newSeverTimeSlice", "1", "");
    data += CreateFiled("CPU Limit", "text", "newSeverCPULimit", "100", "");
    data += CreateFiled("CPU Quantum", "text", "newSeverCPUQ", "1", "");
    data += CreateFiled("Select ACDs", "list", "acds", "", "", data2);
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "newServerOk");
    data += CreateFiled("Create New ACD", "button", "newAcd");
    data += CreateFiled("Cancel", "button", "newServerCancel", "", "_50");
    data += "</div>";
    return data;
}
function newServerActions(modelId, complex, maxProcesors) {
    $(".newServerCancel").click(function() {
        closeWindows("newServer");
    })
    $(".newServerOk").click(function() {


        if (!IsNumeric($(".newSeverVM").val())) {
            alert("VM must be a number!");
        } else if ($(".newSeverName").val() === "") {
            alert("name is required");
            //parseFloat($(".planPointsEnd").val()) > parseFloat($(".planPointsmax").val())
        } else if (parseFloat($(".newSeverLP").val()) > (parseFloat(maxProcesors))) {
            alert("Number of logical processor can't excceed the number of physical processor " + maxProcesors)
        } else {
            $.get("ajax/createServer.jsp?complexId=" + complex + "&modelId=" + modelId + "&acds=" + $(".acds").val() + "&status=create&name=" + $(".newSeverName").val() + "&vm=" + $(".newSeverVM").val() + "&lp=" + $(".newSeverLP").val() + "&tp=" + $(".newSeverTP").val() + "&ts=" + $(".newSeverTimeSlice").val() + "&cpuLimit=" + $(".newSeverCPULimit").val() + "&cpuQuantum=" + $(".newSeverCPUQ").val(), function(mdata) {

                var options = mdata.split(";;")[1];
                closeWindows("newServer");
                updatecomplex(complex, modelId);
            });
        }


    })
    $(".newAcd").click(function() {

        $.get("ajax/getServers.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=-1", function(mdata) {
            $.get("ajax/getServers.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=getbf", function(sdata) {



                makeWinDows("New Application Description", "newACD", newAcd(mdata, modelId, complex, sdata), 350, 120, 500, "200");
            });
        });
    });
}
//</editor-fold>


//<editor-fold defaultstate="collapsed" desc="WindowsData">


//<editor-fold defaultstate="collapsed" desc="SqlApplicationWindows">

//<editor-fold defaultstate="collapsed" desc="ComplexSQL">

function editComplexSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, id, idins, data, datains, ScenarioData) {

    var data = data.split(",");
    var datains = datains.split(",");
    var form = new FormClass("editComplexdWindows");
    //        String[] S_PARAMETER = {"ORDER_FREQ"};


    if (isSenario) {
        var ScenarioData = ScenarioData.split(",");
        form.fields = [
            {
                "title": "-",
                "type": "headerupdate",
                "name": "headerupdate",
            },
            {
                "title": "Name:",
                "type": "text",
                "name": "NAME", readonly: true,
                value: data[3]
            },
            {
                "title": "Complex Type:",
                "type": "select",
                "name": "TYPE",
                options: "0__Nested;1__Join",
                value: data[5], readonly: true,
            }
            , {
                "title": "Number Per Component:",
                "type": "numberupdate",
                "name": "ORDER_FREQ",
                value: datains[4].replace("]", ""), newvalue: ScenarioData[0].replace("]", "").replace("[", "")

            }

        ];
    } else {
        form.fields = [
            {
                "title": "Name:",
                "type": "text",
                "name": "NAME",
                value: data[3]
            },
            {
                "title": "Complex Type:",
                "type": "select",
                "name": "TYPE",
                options: "0__Nested;1__Join",
                value: data[5]
            }
            , {
                "title": "Number Per Component:",
                "type": "number",
                "name": "ORDER_FREQ",
                value: datains[4].replace("]", "")

            }

        ];
    }
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "editstoredWindowsbt",
            action: "send",
            url: "ajax/views/groupView/SQLApplicationActions.jsp",
            options: {status: "editComplex",
                id: id,
                idins: idins,
                SQL_COMPONENT_INST_ID: $(".storedNames option:selected").data("idins"), "SQL_COMPONENT_DESC_ID": $(".storedNames").val(), "SQL_APPLICATION_DESC_ID": SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID: SQL_APPLICATION_INST_ID, "mod_id": mod_id, isScenario: isSenario, ids: node_id},
            done: function(data) {
                // alert(data);
                showMyloading(".main", "end");
                form.closeWindow();
                updateComplexTable($(".storedNames").val());
                updatBaseTable($(".storedNames").val());
            }
        },
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "canceladdstoredWindows"
        }
    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "type": "button",
            "name": "editstoredWindowsbt",
            "value": "Update"
        }, {
            "type": "button",
            "name": "canceladdstoredWindows",
            "value": "Cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "editComplexdWindows",
        "title": (isSenario) ? "Complex SQL Scenario " : "Edit Complex SQL ",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "450", height: "190"
    };
    form._renderWindows();
}







function addComplexSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID) {

    var form = new FormClass("addComplexdWindows");
    form.fields = [
        {
            "title": "Name:",
            "type": "text",
            "name": "NAME"
        },
        {
            "title": "Complex Type:",
            "type": "select",
            "name": "TYPE",
            options: "0__Nested;1__Join  "
        }
        , {
            "title": "Number Per Component:",
            "type": "text",
            "name": "ORDER_FREQ"
        }

    ];
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "addstoredWindowsbt",
            action: "send",
            url: "ajax/views/groupView/SQLApplicationActions.jsp",
            options: {status: "addComplex", SQL_COMPONENT_INST_ID: $(".storedNames option:selected").data("idins"), "SQL_COMPONENT_DESC_ID": $(".storedNames").val(), "SQL_APPLICATION_DESC_ID": SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID: SQL_APPLICATION_INST_ID, "mod_id": mod_id},
            done: function(data) {
                // alert(data);
                showMyloading(".main", "end");
                form.closeWindow();
                updateComplexTable($(".storedNames").val());
                updatBaseTable($(".storedNames").val());
            }
        },
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "canceladdstoredWindows"
        }
    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "Add",
            "type": "button",
            "name": "addstoredWindowsbt",
            "value": "Add"
        }, {
            "title": "Cancel",
            "type": "button",
            "name": "canceladdstoredWindows",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addComplexdWindows",
        "title": "add Complex SQL",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "130"
    };
    form._renderWindows();
}


function updateComplexTable(SQL_COMPONENT_DESC_ID) {

}
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="BaseSQLTable">

function updateidins(comClass, iCass) {

    return  {
        event: "click change",
        eventClass: comClass,
        js: function() {


            $("." + iCass).val($("." + comClass + " option:selected").data("idins"));
        }
    };
}



//



function editBaseSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, id, idins, dbdata, datains, ScenarioData) {



    var dbdata = dbdata.split(",");
    var datains = datains.split(",");
    var form = new FormClass("editBaseWindows");
    if (isSenario) {
        var ScenarioData = ScenarioData.split(",");
//       "ORDER_FREQ", "JOIN_MISSES", "PREFETCH", "DISPERSMENT", "ACCESS_PER_TRAN"

        form.fields = [
            {
                "title": "-",
                "type": "headerupdate",
                "name": "headerupdate",
            },
            {
                "title": "Name:",
                "type": "text", readonly: true,
                "name": "NAME", value: dbdata[5]
            }, {
                "title": "SQL Action:",
                "type": "select",
                "name": "ORDER_TYPE", readonly: true,
                options: "0__Count;1__Direct Read;2__Generic Read;3__Sequential Read;4__Insert;5__Update;6__Delete;7__Sort;8__Cursor;9__Fetch;10__Unload;"
                , value: dbdata[6]
            }, {
                "title": "Monotonies:",
                "type": "text", readonly: true,
                "name": "NUM_MONOTONIES", value: dbdata[7].replace("]", "")
            }, {
                "title": "Fraction Table:",
                "type": "numberupdate", newvalue: ScenarioData[1],
                "name": "JOIN_MISSES", value: datains[6]
            }
            ,
            {
                "title": "Namespaces:",
                "type": "select",
                "name": "NAMESPACE_Names", readonly: true,
                options: "0__0"
            },
            {
                "title": "Table:",
                "type": "select",
                "name": "TABLE_DESC_ID", readonly: true,
                options: "0__0"
            }, {
                "title": "Index:",
                "type": "select",
                "name": "INDEX_DESC_ID", readonly: true,
                options: "0__0"
            }, {
                "title": "TABLE_INST_ID:",
                "type": "hidden",
                "name": "TABLE_INST_ID", value: datains[3]
            }, {
                "title": "INDEX_INST_ID:",
                "type": "hidden",
                "name": "INDEX_INST_ID"
            }, {
                "title": "Order Frequency:",
                "type": "numberupdate",
                "name": "ORDER_FREQ", value: datains[5], newvalue: ScenarioData[0].replace("[", "")
            }, {
                "title": "Cluster Efficiency:",
                "type": "numberupdate",
                "name": "DISPERSMENT", value: datains[8], newvalue: ScenarioData[3]
            }, {
                "title": "Prefetch:",
                "type": "numberupdate",
                "name": "PREFETCH", value: datains[9], newvalue: ScenarioData[2]
            }, {
                "title": "Access Per Tran:",
                "type": "numberupdate",
                "name": "ACCESS_PER_TRAN", value: datains[7], newvalue: ScenarioData[4].replace("]", "")
            }




        ];
    } else {
        form.fields = [
            {
                "title": "Name:",
                "type": "text",
                "name": "NAME", value: dbdata[5]
            }, {
                "title": "SQL Action:",
                "type": "select",
                "name": "ORDER_TYPE",
                options: "0__Count;1__Direct Read;2__Generic Read;3__Sequential Read;4__Insert;5__Update;6__Delete;7__Sort;8__Cursor;9__Fetch;10__Unload;"
                , value: dbdata[6]
            }, {
                "title": "Monotonies:",
                "type": "text",
                "name": "NUM_MONOTONIES", value: dbdata[7].replace("]", "")
            }, {
                "title": "Fraction Table:",
                "type": "number",
                "name": "JOIN_MISSES", value: datains[6]
            }
            ,
            {
                "title": "Namespaces:",
                "type": "select",
                "name": "NAMESPACE_Names",
                options: "0__0"
            },
            {
                "title": "Table:",
                "type": "select",
                "name": "TABLE_DESC_ID",
                options: "0__0"
            }, {
                "title": "Index:",
                "type": "select",
                "name": "INDEX_DESC_ID",
                options: "0__0"
            }, {
                "title": "TABLE_INST_ID:",
                "type": "hidden",
                "name": "TABLE_INST_ID", value: datains[3]
            }, {
                "title": "INDEX_INST_ID:",
                "type": "hidden",
                "name": "INDEX_INST_ID"
            }, {
                "title": "Order Frequency:",
                "type": "number",
                "name": "ORDER_FREQ", value: datains[5]
            }, {
                "title": "Cluster Efficiency:",
                "type": "number",
                "name": "DISPERSMENT", value: datains[8]
            }, {
                "title": "Prefetch:",
                "type": "number",
                "name": "PREFETCH", value: datains[9]
            }

        ];
    }

    var content = form._renderhtml();
//SERVER_INST_ID


    form.events = [
        updateidins("TABLE_DESC_ID", "TABLE_INST_ID"),
        updateidins("INDEX_DESC_ID", "INDEX_INST_ID"),
        {
            event: "click",
            eventClass: "addstoredWindowsbt",
            action: "send",
            url: "ajax/views/groupView/SQLApplicationActions.jsp",
            options: {status: "editBase", id: id,
                idins: idins,
                SQL_COMPONENT_INST_ID: $(".storedNames option:selected").data("idins"),
                SQL_COMPONENT_DESC_ID: $(".storedNames").val(),
                "SQL_APPLICATION_DESC_ID": SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID: SQL_APPLICATION_INST_ID, "mod_id": mod_id, isScenario: isSenario, ids: node_id},
            done: function(data) {
                //    alert(data);
                showMyloading(".main", "end");
                updateComplexTable($(".storedNames").val());
                updatBaseTable($(".storedNames").val());
                form.closeWindow();
            }
        }

        , {
            event: "click change",
            eventClass: "NAMESPACE_Names",
            js: function(data) {
                $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getTableOptions&id=" + $(".NAMESPACE_Names").val(), function(data) {
                    $(".TABLE_DESC_ID").html(data);
                    $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getIndexOptions&id=" + $(".INDEX_DESC_ID").val(), function(data) {
                        $(".INDEX_DESC_ID").html(data);
                    });
                });
            }
        }, {
            event: "click change",
            eventClass: "TABLE_DESC_ID",
            js: function(data) {
                $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getIndexOptions&id=" + $(".TABLE_DESC_ID").val(), function(data) {
                    $(".INDEX_DESC_ID").html(data);
                });
            }
        },
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "canceladdstoredWindows"
        }
    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "type": "button",
            "name": "addstoredWindowsbt",
            "value": "Update"
        }, {
            "type": "button",
            "name": "canceladdstoredWindows",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "editBaseWindows",
        "title": (!isSenario) ? "Edit Base SQL" : "Base SQL Scenario",
        "content": content,
        "footerContent": footer,
        "position": "Center", load: function(id) {
            $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getNAMESPACEOptions&id=" + SERVER_INST_ID, function(data) {
                $(".NAMESPACE_Names").html(data);
                $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getIndexOption&id=" + dbdata[3], function(data) {
                    $(".INDEX_DESC_ID").html(data);
                    $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getTableOption&id=" + dbdata[2], function(data) {
                        $(".TABLE_DESC_ID").html(data);
                    });
                });
            });
        },
        "x": "600",
        "y": "90",
        width: "500", height: "450"
    };
    form._renderWindows();
}




function addBaseSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID) {

    var form = new FormClass("addstoredWindows");
    form.fields = [
        {
            "title": "Name:",
            "type": "text",
            "name": "NAME"
        }, {
            "title": "SQL Action:",
            "type": "select",
            "name": "ORDER_TYPE",
            options: "0__Count;1__Direct Read;2__Generic Read;3__Sequential Read;4__Insert;5__Update;6__Delete;7__Sort;8__Cursor;9__Fetch;10__Unload;"



        }, {
            "title": "Monotonies:",
            "type": "text",
            "name": "NUM_MONOTONIES"
        }, {
            "title": "Fraction Table:",
            "type": "number",
            "name": "JOIN_MISSES"
        }
        ,
        {
            "title": "Namespaces:",
            "type": "select",
            "name": "NAMESPACE_Names",
            options: "0__0"
        },
        {
            "title": "Table:",
            "type": "select",
            "name": "TABLE_DESC_ID",
            options: "0__0"
        }, {
            "title": "Index:",
            "type": "select",
            "name": "INDEX_DESC_ID",
            options: "0__0"
        }, {
            "title": "TABLE_INST_ID:",
            "type": "hidden",
            "name": "TABLE_INST_ID"
        }, {
            "title": "INDEX_INST_ID:",
            "type": "hidden",
            "name": "INDEX_INST_ID"
        }, {
            "title": "Order Frequency:",
            "type": "text",
            "name": "ORDER_FREQ"
        }, {
            "title": "Cluster Efficiency:",
            "type": "text",
            "name": "DISPERSMENT"
        }, {
            "title": "Prefetch:",
            "type": "text",
            "name": "PREFETCH"
        }

    ];
    var content = form._renderhtml();
//SERVER_INST_ID


    form.events = [
        updateidins("TABLE_DESC_ID", "TABLE_INST_ID"),
        updateidins("INDEX_DESC_ID", "INDEX_INST_ID"),
        {
            event: "click",
            eventClass: "addstoredWindowsbt",
            action: "send",
            url: "ajax/views/groupView/SQLApplicationActions.jsp",
            options: {status: "addBase",
                SQL_COMPONENT_INST_ID: $(".storedNames option:selected").data("idins"),
                SQL_COMPONENT_DESC_ID: $(".storedNames").val(),
                "SQL_APPLICATION_DESC_ID": SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID: SQL_APPLICATION_INST_ID, "mod_id": mod_id},
            done: function(data) {
                //  alert(data);
                showMyloading(".main", "end");
                updateComplexTable($(".storedNames").val());
                updatBaseTable($(".storedNames").val());
                form.closeWindow();
            }
        }

        , {
            event: "click change",
            eventClass: "NAMESPACE_Names",
            js: function(data) {
                $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getTableOptions&id=" + $(".NAMESPACE_Names").val(), function(data) {
                    $(".TABLE_DESC_ID").html(data);
                    $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getIndexOptions&id=" + $(".INDEX_DESC_ID").val(), function(data) {
                        $(".INDEX_DESC_ID").html(data);
                    });
                });
            }
        }, {
            event: "click change",
            eventClass: "TABLE_DESC_ID",
            js: function(data) {
                $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getIndexOptions&id=" + $(".TABLE_DESC_ID").val(), function(data) {
                    $(".INDEX_DESC_ID").html(data);
                });
            }
        },
        {
            "action": "close"
            , "event": "click "
            , "eventClass": "canceladdstoredWindows"
        }
    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "Add",
            "type": "button",
            "name": "addstoredWindowsbt",
            "value": "Add"
        }, {
            "title": "Cancel",
            "type": "button",
            "name": "canceladdstoredWindows",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addstoredWindows",
        "title": "Add Base SQL",
        "content": content,
        "footerContent": footer,
        "position": "Center", load: function(id) {
            $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getNAMESPACEOptions&id=" + SERVER_INST_ID, function(data) {
                $(".NAMESPACE_Names").html(data);
            });
        },
        "x": "600",
        "y": "90",
        width: "500", height: "360"
    };
    form._renderWindows();
}


function updatBaseTable(SQL_COMPONENT_DESC_ID) {

    $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getBaseRows&id=" + SQL_COMPONENT_DESC_ID + "&isScenario=" + isSenario + "&ids=" + node_id, function(data) {
        $(".BaseSQLTable tbody").html(data);
        $(".BaseSQLTable tbody tr").click(function() {
            $(".BaseSQLTable tbody tr").removeClass("act");
            $(this).addClass("act");
        });
        $.get("ajax/views/groupView/SQLApplicationActions.jsp?id=" + SQL_COMPONENT_DESC_ID + "&status=storedNamesInfo" + "&isScenario=" + isSenario + "&ids=" + node_id, function(datains) {
            $(".storedNamesInfo").html(datains);
        });
        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getComplexRows&id=" + SQL_COMPONENT_DESC_ID + "&isScenario=" + isSenario + "&ids=" + node_id, function(data) {
            $(".ComplexSQLTable tbody").html(data);
            $(".ComplexSQLTable tbody tr").click(function() {
                $(".ComplexSQLTable tbody tr").removeClass("act");
                $(this).addClass("act");
            });
            $.get("ajax/views/groupView/SQLApplicationActions.jsp?id=" + SQL_COMPONENT_DESC_ID + "&status=storedNamesInfo" + "&isScenario=" + isSenario + "&ids=" + node_id, function(datains) {
                $(".storedNamesInfo").html(datains);
            });
        });
    });
}
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="stored">
function editstoredWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, id, idins, data, datains, ScenarioData) {

//        String[] S_PARAMETER = {"WEIGHT", "ORDER_FREQ"};


    var data = data.split(",");
    var datains = datains.split(",");
    var form = new FormClass("editstoredWindows");
    if (isSenario) {
        var ScenarioData = ScenarioData.split(",");
        form.fields = [
            {
                "title": "-",
                "type": "headerupdate",
                "name": "headerupdate",
            },
            {
                "title": "Name:",
                "type": "text", readonly: true,
                "name": "NAME",
                value: data[3]
            }, {
                "title": "Weight:",
                "type": "numberupdate",
                "name": "WEIGHT", value: data[4].replace("]", ""), newvalue: ScenarioData[0].replace("[", "")
            }, {
                "title": "Order Frequency:",
                "type": "numberupdate",
                "name": "ORDER_FREQ", value: datains[4].replace("]", ""), newvalue: ScenarioData[1].replace("]", "")
            }

        ];
    } else {
        form.fields = [
            {
                "title": "Name:",
                "type": "text",
                "name": "NAME",
                value: data[3]
            }, {
                "title": "Weight:",
                "type": "number",
                "name": "WEIGHT", value: data[4].replace("]", "")
            }, {
                "title": "Order Frequency:",
                "type": "number",
                "name": "ORDER_FREQ", value: datains[4].replace("]", "")
            }

        ];
    }
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "updatestoredWindowsbt",
            action: "send",
            url: "ajax/views/groupView/SQLApplicationActions.jsp",
            options: {status: "editstored", "SQL_APPLICATION_DESC_ID": SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID: SQL_APPLICATION_INST_ID, "mod_id": mod_id, id: id, idins: idins, isScenario: isSenario, ids: node_id},
            done: function(data) {
                showMyloading(".main", "end");
                form.closeWindow();
                updatestoredNames(SQL_APPLICATION_DESC_ID);
            }
        },
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "canceleditstoredWindows"
        },
    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "type": "button",
            "name": "updatestoredWindowsbt",
            "value": "Update"
        }, {
            "type": "button",
            "name": "canceleditstoredWindows",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "editstoredWindows",
        "title": (!isSenario) ? "Edit SQL Component" : "SQL Component Scenario",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "200"
    };
    form._renderWindows();
}

function addstoredWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID) {

    var form = new FormClass("addstoredWindows");
    form.fields = [
        {
            "title": "Name:",
            "type": "text",
            "name": "Name"
        }, {
            "title": "Weight:",
            "type": "text",
            "name": "WEIGHT"
        }, {
            "title": "Order Frequency:",
            "type": "text",
            "name": "ORDER_FREQ"
        }

    ];
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "addstoredWindowsbt",
            action: "send",
            url: "ajax/views/groupView/SQLApplicationActions.jsp",
            options: {status: "addstored", "SQL_APPLICATION_DESC_ID": SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID: SQL_APPLICATION_INST_ID, "mod_id": mod_id},
            done: function(data) {
                //  alert(data);
                showMyloading(".main", "end");
                updatestoredNames(SQL_APPLICATION_DESC_ID);
                form.closeWindow();
            }
        },
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "canceladdstoredWindows"
        }
    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "Add",
            "type": "button",
            "name": "addstoredWindowsbt",
            "value": "Add"
        }, {
            "title": "Cancel",
            "type": "button",
            "name": "canceladdstoredWindows",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addstoredWindows",
        "title": "Add SQL Component",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "130"
    };
    form._renderWindows();
}



$(document).on("afterloadstoredNames", function(event, param1, param2) {

    updatBaseTable($(".storedNames").eq(0).val());
})



function updatestoredNames(SQL_APPLICATION_DESC_ID) {
    $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getstored&id=" + SQL_APPLICATION_DESC_ID, function(data) {
        $(".storedNames").html(data);
        $(document).trigger("afterloadstoredNames", ["Custom", "Event"]);
    });
}
//</editor-fold>


function ImportSQLWidows(type, title, imageLocaiton, sqlInfo, mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, ACIID, LOGICAL_SERVER_INST_ID) {



    var l = $.trim(imageLocaiton);
    var f = "test.csv";
    var form = new FormClass(type + "Import_windows");
    form.fields = [
        {
            "title": type + " Import:",
            "type": "upload",
            "name": type + "upload",
            "uploadFolder": l,
            filename: "test.csv",
            filetype: "uploadFile_filename"

        }
    ];
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "importcsv",
            js: function() {


                var url = "mod_id=" + mod_id + "&SERVER_INST_ID=" + SERVER_INST_ID + "&LOGICAL_SERVER_INST_ID=" + LOGICAL_SERVER_INST_ID + "&status=" + type + "&loction=" + l + "&filename=" + f + "&mod_id=" + mod_id + "&type=log";
                window.location = "ajax/views/groupView/SQLimport.jsp?" + url;
                $(".SqlApplicationWindows").parents(".xactWindows").remove();
                $(".server_windows_data").parents(".xactWindows").remove();
                alert("Import finished successfully. Please re-open the Application Component Dialog.");
                // SqlApplicationWindows(sqlInfo, mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, ACIID, LOGICAL_SERVER_INST_ID);

                /*
                 showMyloading(".main", "end");
                 updateTableBuffer(DBinstances);
                 indexTableTable($(".Tabletable tr.act").data("insid"), $(".Tabletable tr.act").data("decid"));
                 */
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "ADDCacheCancel",
            Callback: function(t) {
                updateTableCache($.trim($(".DBinstancesID").val()), ids);
                updateTableBuffer($.trim($(".DBinstancesID").val()), ids);
                updateComs($.trim($(".DBinstancesID").val()));
                form.closeWindow();
            }



        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        }, {
            "title": "ADD Cache",
            "type": "button",
            "name": "importcsv",
            "value": "Import"
        },
        {
            "type": "button",
            "name": "ADDCacheCancel",
            "value": "Close"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": type + "Import_windows",
        "title": title,
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "300", height: "130"
    };
    form._renderWindows();
}

var isSenario = false;
var node_id = null;
function SqlApplicationWindows(sqlInfo, mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, ACIID, LOGICAL_SERVER_INST_ID, sid, mynod_id) {


    var winstatus = "";
    var nstatus = "";
    node_id = mynod_id;
//alert (nod_id);

    if (sid == null || sid == "null") {
        isSenario = false;
    } else {
        isSenario = true;
    }



    if (SQL_APPLICATION_DESC_ID === null || SQL_APPLICATION_DESC_ID === "null") {

        winstatus = "display:none";
        nstatus = "display:block";
    } else {


        winstatus = "display: block";
        nstatus = "display:none";
    }





    var BaseSQLTable = {
        name: "BaseSQLTable",
        "class": "data_grid",
        type: "table",
        rows: "d",
        columns: [
            {title: "Name", type: "div", name: "Name"},
            {title: "SQL Action", type: "div", name: "SQLAction"},
            {title: "Table Name", type: "div", name: "TableName"},
            {title: "Index Name", type: "div", name: "Namespace"},
            {title: "Order Frequency", type: "div", name: "OrderFrequency"},
            {title: "Cluster Efficiency", type: "div", name: "ClusterEfficiency"},
            {title: "Prefetch", type: "div", name: "Prefetch"}
        ]
    };
    var ComplexSQLTable = {
        name: "ComplexSQLTable",
        "class": "data_grid",
        type: "table",
        rows: "d",
        columns: [
            {title: "Name", type: "div", name: "Name"},
            {title: "Complex Type", type: "div", name: "Namespace"},
            {title: "Complex Number per component", type: "div", name: "OrderFrequency"}
        ]
    };
    //<editor-fold defaultstate="collapsed" desc="fields">

    var form = new FormClass("SqlApplicationWindows");
    if (isSenario) {

        form.fields = [
            {
                "type": "div",
                "class": "winempty _100",
                style: "position: relative;" + nstatus

            }, {
                "type": "label",
                "name": "CreateSQL",
                "title": "There is no SQL Application for this ACI.",
                "value": "There is no SQL Application for this ACI."
            },
            {
                "type": "enddiv"
            }, {
                "type": "div",
                "class": " winData _100",
                style: "position: relative;" + winstatus


            },
            {
                title: "Stored Procedures",
                type: "border",
                name: "Namespaceborder111"
            },
            {
                "title": "Name:",
                "type": "select",
                "name": "storedNames",
                options: "0__0"
            },
            {
                "type": "div",
                "class": "storedNamesInfo _100",
                style: "position: relative;"

            },
            {
                "type": "enddiv"
            }, {
                "type": "div",
                "class": " _100"
            }
        ];
    } else {
        form.fields = [
            {
                "type": "div",
                "class": "winempty _100",
                style: "position: relative;" + nstatus

            }, {
                "type": "label",
                "name": "CreateSQL",
                "title": "There is no SQL Application for this ACI. You can create one or  Bulk Import using a CSV file.",
                "value": "There is no SQL Application for this ACI. You can create one or  Bulk Import using a CSV file."
            }, {
                "type": "button",
                "name": "CreateSQL",
                "value": "Create SQL Application"
            }, {
                "type": "button",
                "name": "ImportSQL ",
                "value": "Import SQL"
            },
            {
                "type": "enddiv"
            },
            {
                "type": "div",
                "class": " winData _100",
                style: "position: relative;" + winstatus


            },
            {
                title: "Stored Procedures",
                type: "border",
                name: "Namespaceborder111"
            },
            {
                "title": "Name:",
                "type": "select",
                "name": "storedNames",
                options: "0__0"
            },
            {
                "type": "div",
                "class": "storedNamesInfo _100",
                style: "position: relative;"

            },
            {
                "type": "enddiv"
            }, {
                "type": "div",
                "class": " _100"
            }
        ];
    }

    //<editor-fold defaultstate="collapsed" desc="Stored">

    if (isSenario) {

        var storedButtons = [{
                "type": "button",
                "name": "editstoredscenario",
                "value": "edit scenario"
            }];
        form._addTofields(storedButtons);
    } else {
        var burttonsStored = [{
                "type": "button",
                "name": "addstored",
                "value": "Add"
            },
            {
                "type": "button",
                "name": "editstored",
                "value": "Edit"
            },
            {
                "type": "button",
                "name": "deletestored",
                "value": "Delete"
            }, {
                "type": "button",
                "name": "ImportSQL ",
                "value": "Import SQL"
            }, {
                "type": "button",
                "name": "exportSQL ",
                "value": "export SQL"
            }];
        form._addTofields(burttonsStored);
    }



    var endStored = [{
            "type": "enddiv"
        },
        {
            "type": "endborder",
            "name": "endborder1111"
        }];
    form._addTofields(endStored);
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="BaseSQL">

    var startBaseSql = [{
            title: "BaseSQL",
            type: "border",
            name: "Namespaceborder"
        }
        , {
            "type": "div",
            "class": " _100",
            style: "position: relative"

        }
        , BaseSQLTable, {
            "type": "div",
            "class": " _100"

        }];
    form._addTofields(startBaseSql);
    if (isSenario) {

        var BaseSQLButtons = [{
                "type": "button",
                "name": "editBaseSQLscenario",
                "value": "edit scenario"
            }];
        form._addTofields(BaseSQLButtons);
    } else {
        var ButtonsBaseSql = [{
                "type": "button",
                "name": "addBaseSQL",
                "value": "Add"
            },
            {
                "type": "button",
                "name": "editBaseSQL",
                "value": "Edit"
            },
            {
                "type": "button",
                "name": "deleteBaseSQL",
                "value": "Delete"
            }];
        form._addTofields(ButtonsBaseSql);
    }

    var endBaseSql = [{
            "type": "enddiv"
        },
        {
            "type": "enddiv"
        }, {
            "type": "endborder",
            "name": "endborder"
        }];
    form._addTofields(endBaseSql);
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Complex">

    var startComplesSql = [{
            title: "Complex",
            type: "border",
            name: "Namespaceborder"
        }, {
            "type": "div",
            "class": " _100",
            style: "position: relative"

        },
        ComplexSQLTable, {
            "type": "div",
            "class": " _100"

        }];
    form._addTofields(startComplesSql);
    if (isSenario) {

        var ComplexSQLButtons = [{
                "type": "button",
                "name": "editComplexSQLscenario",
                "value": "edit scenario"
            }];
        form._addTofields(ComplexSQLButtons);
    } else {
        var ButtonsComplesSql = [
            {
                "type": "button",
                "name": "addComplexSQL",
                "value": "Add"
            },
            {
                "type": "button",
                "name": "editComplexSQL",
                "value": "Edit"
            },
            {
                "type": "button",
                "name": "deleteComplexSQL",
                "value": "Delete"
            }

        ];
        form._addTofields(ButtonsComplesSql);
    }



    var endComplesSql = [{
            "type": "enddiv"
        },
        {
            "type": "enddiv"
        }, {
            "type": "endborder",
            "name": "endborderComplex"
        }, {
            "type": "enddiv"
        }];
    form._addTofields(endComplesSql);
    //</editor-fold>




    var content = form._renderhtml();
    /*
     * 
     * 
     * isSenario
     */






    //</editor-fold>

    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "cancelDB_NAME"
        }
        /** String MODEL_ID = request.getParameter("mod_id");
         String SERVER_INST_ID = request.getParameter("SERVER_INST_ID");
         String LOGICAL_SERVER_INST_ID = request.getParameter("LOGICAL_SERVER_INST_ID");*/
        ,
        {event: "click",
            eventClass: "ImportSQL",
            js: function() {
                getImageLocation("exports", function(imageLocaiton) {


                    //ImportSQLWidows(type, title, imageLocaiton, sqlInfo, mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, ACIID, LOGICAL_SERVER_INST_ID) 
                    ImportSQLWidows("sql", "SQL Import", imageLocaiton, sqlInfo, mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, ACIID, LOGICAL_SERVER_INST_ID)


                });
            }
        }

        //
        , {event: "click",
            eventClass: "CreateSQL",
            js: function() {
                $.get("ajax/views/groupView/SQLApplicationActions.jsp?mod_id=" + mod_id + "&ACI_ID=" + ACIID + "&status=ceatrsql", function(data) {
                    var ds = $.trim(data).split(";");
                    form.closeWindow();
                    SqlApplicationWindows(sqlInfo, mod_id, ds[0], ds[1], SERVER_INST_ID, ACIID, LOGICAL_SERVER_INST_ID, sid, mynod_id);
                });
            }
        }, {event: "click",
            eventClass: "exportSQL",
            js: function() {


                window.open("ajax/views/groupView/SQLexport.jsp?mod_id=" + mod_id + "&LOGICAL_SERVER_INST_ID=" + LOGICAL_SERVER_INST_ID + "&status=exportSQL");
            }
        }
        ,
        //<editor-fold defaultstate="collapsed" desc="storedEvents">
        {event: "click",
            eventClass: "addstored",
            js: function() {


                addstoredWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID);
            }
        }
        ,
        {event: "click",
            eventClass: "editstored",
            js: function() {
                var id = $(".storedNames").val();
                var idins = $(".storedNames option:selected").data("idins");
                if (id == null) {

                    alert("Please select a Complex SQL record to update!");
                } else {



                    $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getstoredrow&id=" + id, function(data) {

                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getstoredinsrow&id=" + idins, function(datains) {

                            editstoredWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, id, idins, data, datains)
                        });
                    });
                }

            }
        }
        ,
        {event: "click",
            eventClass: "deletestored",
            js: function() {
                var id = $(".storedNames").val();
                var idins = $(".storedNames option:selected").data("idins");
                if (id == null) {

                    alert("Please select a Complex SQL record to delete!");
                } else {
                    if (confirm("Are you sure you would like to delete this Stored Procedure?")) {


                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=deletestored&id=" + id + "&idins=" + idins, function(data) {
                            updatestoredNames(SQL_APPLICATION_DESC_ID);
                        });
                    }
                }
            }
        } //</editor-fold>
        ,
        {event: "click",
            eventClass: "addBaseSQL",
            js: function() {


                addBaseSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID);
            }
        }, {event: "click",
            eventClass: "deleteBaseSQL",
            js: function() {

                var id = $(".BaseSQLTable .act").data("decid");
                var idins = $(".BaseSQLTable .act").data("insid");
                if (id == null) {

                    alert("Please select a Base SQL record to delete!");
                } else {

                    if (confirm("Are you sure you would like to delete this Base SQL record?")) {

                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=deleteBase&id=" + id + "&idins=" + idins, function(data) {
                            $(".BaseSQLTable .act").remove();
                        });
                    }
                }

            }
        }

        ,
        {event: "click",
            eventClass: "editBaseSQL",
            js: function() {


                var id = $(".BaseSQLTable .act").data("decid");
                var idins = $(".BaseSQLTable .act").data("insid");
                if (id == null) {

                    alert("Please select a Base SQL record to update!");
                } else {

                    $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getBaserow&id=" + id, function(data) {

                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getBaseInstrow&id=" + idins, function(datains) {

                            editBaseSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, id, idins, data, datains);
                        });
                    });
                }


            }
        },
        {event: "click",
            eventClass: "editComplexSQL",
            js: function() {

                var id = $(".ComplexSQLTable .act").data("decid");
                var idins = $(".ComplexSQLTable .act").data("insid");
                if (id == null) {

                    alert("Please select a Complex SQL record to update!");
                } else {
                    $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getComplexrow&id=" + id, function(data) {

                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getComplexinsrow&id=" + idins, function(datains) {


                            //, isScenario: isSenario

                            editComplexSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, id, idins, data, datains);
                        });
                    });
                }
            }
        },
        {event: "click",
            eventClass: "addComplexSQL",
            js: function() {


                addComplexSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID);
            }
        }
        ,
        {event: "change",
            eventClass: "storedNames",
            js: function() {
                updateComplexTable($(".storedNames").val());
                updatBaseTable($(".storedNames").val());
            }
        }




        ,
        {event: "click",
            eventClass: "deleteComplexSQL",
            js: function() {


                var id = $(".ComplexSQLTable .act").data("decid");
                var idins = $(".ComplexSQLTable .act").data("insid");
                if (id == null) {

                    alert("Please select a Complex SQL record to delete!");
                } else {

                    if (confirm("Are you sure you would like to delete this Complex SQL record?")) {

                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=deleteComplex&id=" + id + "&idins=" + idins, function(data) {

                            $(".ComplexSQLTable .act").remove();
                        });
                    }

                }
            }
        }


    ];
    if (isSenario) {
        var scenarioActions = [
            {event: "click",
                eventClass: "editComplexSQLscenario",
                js: function() {

                    var id = $(".ComplexSQLTable .act").data("decid");
                    var idins = $(".ComplexSQLTable .act").data("insid");
                    if (id == null) {

                        alert("Please select a Complex SQL record to update!");
                    } else {
                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getComplexrow&id=" + id, function(data) {

                            $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getComplexinsrow&id=" + idins, function(datains) {
                                $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getCompleXScenarioData&id=" + id + "&idins=" + idins + "&ids=" + node_id, function(ScenarioData) {

                                    editComplexSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, id, idins, data, datains, ScenarioData);
                                });
                            });
                        });
                    }
                }}
            , {event: "click",
                eventClass: "editstoredscenario",
                js: function() {
                    var id = $(".storedNames").val();
                    var idins = $(".storedNames option:selected").data("idins");
                    if (id == null) {

                        alert("Please select a Complex SQL record to update!");
                    } else {



                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getstoredrow&id=" + id, function(data) {

                            $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getstoredinsrow&id=" + idins, function(datains) {
                                $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getstoredScenarioData&id=" + id + "&idins=" + idins + "&ids=" + node_id, function(ScenarioData) {

                                    editstoredWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, id, idins, data, datains, ScenarioData);
                                });
                            });
                        });
                    }

                }
            }, {event: "click",
                eventClass: "editBaseSQLscenario",
                js: function() {


                    var id = $(".BaseSQLTable .act").data("decid");
                    var idins = $(".BaseSQLTable .act").data("insid");
                    if (id == null) {

                        alert("Please select a Base SQL record to update!");
                    } else {

                        $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getBaserow&id=" + id, function(data) {

                            $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getBaseInstrow&id=" + idins, function(datains) {
                                $.get("ajax/views/groupView/SQLApplicationActions.jsp?status=getBaseScenarioData&id=" + id + "&idins=" + idins + "&ids=" + node_id, function(ScenarioData) {

                                    editBaseSQLTableWindows(mod_id, SQL_APPLICATION_DESC_ID, SQL_APPLICATION_INST_ID, SERVER_INST_ID, id, idins, data, datains, ScenarioData);
                                });
                            });
                        });
                    }


                }
            }
        ]

        form._addToEvents(scenarioActions);
    }
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "type": "button",
            "name": "cancelDB_NAME",
            "value": "Close"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "SqlApplicationWindows",
        "title": "Sql Application Dialog",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600", load: function(id) {

            updatestoredNames(SQL_APPLICATION_DESC_ID);
        },
        "y": "90",
        width: "600", height: "430"
    };
    form._renderWindows();
}
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="dbinst">

function DB_NAMEEWidows(projectid, modid, DBinstances) {

    var form = new FormClass("DB_NAMEEWidowsAdd222");
    form.fields = [
        {
            "title": "Name:",
            "type": "text",
            "name": "name"
        }

    ];
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "ADDDB_NAME",
            action: "send",
            url: "ajax/views/groupView/dbinst.jsp",
            options: {status: "addDB_NAMESPACE", "proid": projectid, "DBins": DBinstances, "mod_id": modid},
            done: function() {
                alert("Namespace added sucessfully");
                showMyloading(".main", "end");
                updateComs($.trim(DBinstances));
                form.closeWindow();
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "cancelDB_NAME"
        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        }, {
            "title": "Add",
            "type": "button",
            "name": "ADDDB_NAME",
            "value": "Add"
        },
        {
            "title": "Cancel",
            "type": "button",
            "name": "cancelDB_NAME",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addDB_NAME222",
        "title": "add Namespace",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "130"
    };
    form._renderWindows();
}

function ImportWidows(type, title, imageLocaiton, ids, pro_id, mod_id, DBinstancesID, instanceNameh, DB_NAMESPACE_INST_ID) {



// $.trim(imageLocaiton)

//"/Users/eScapes/Documents";//
    var l = $.trim(imageLocaiton); //
    var f = "test.csv";
    var form = new FormClass(type + "Import_windows");
    form.fields = [
        {
            "title": type + " Import:",
            "type": "upload",
            "name": type + "upload",
            "uploadFolder": l,
            filename: "test.csv",
            filetype: "uploadFile_filename"
        }
    ];
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "importcsv",
            js: function() {


                var url = "TABLE_INST_ID=" + $(".Tabletable tr.act").data("insid") + "&DB_NAMESPACE_INST_ID=" + DB_NAMESPACE_INST_ID + "&DB_NAMESPACE_DESC_ID=" + $(".DB_NAMESPACE").val() + "&status=" + type + "&ids=" + ids + "&loction=" + l + "&filename=" + f + "&proid=" + pro_id + "&DBinsname=" + instanceNameh + "&DBins=" + DBinstancesID + "&mod_id=" + mod_id + "&type=log";
                window.location = "ajax/views/groupView/dbinst_import.jsp?" + url;
                $(".importcsv").hide();
                /*
                 showMyloading(".main", "end");
                 updateTableBuffer(DBinstances);
                 indexTableTable($(".Tabletable tr.act").data("insid"), $(".Tabletable tr.act").data("decid"));
                 */
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "ADDCacheCancel",
            Callback: function(t) {
                updateTableCache($.trim($(".DBinstancesID").val()));
                updateTableBuffer($.trim($(".DBinstancesID").val()));
                updateComs($.trim($(".DBinstancesID").val()));
                form.closeWindow();
            }



        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        }, {
            "title": "ADD Cache",
            "type": "button",
            "name": "importcsv",
            "value": "Import"
        },
        {
            "type": "button",
            "name": "ADDCacheCancel",
            "value": "Close"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": type + "Import_windows",
        "title": title,
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "300", height: "130"
    };
    ;
    form._renderWindows();
    form.fields = null;
}

//<editor-fold defaultstate="collapsed" desc="Cache Windows">
/**
 * 
 request.getParameter("logicaldrive"), request.getParameter("pageper"), request.getParameter("otheraccess"), request.getParameter("DBins")
 * 
 */

function CacheEditWidows(DBinstances, id, idins, data, datains, DBinstancesname, ids, ScenarioData) {

    data = data.split(",");
    datains = datains.split(",");
    ids = ids.split("/");
    var form = new FormClass("CacheEdit");
    if (ids[2] === "null") {

        form.fields = [
            {
                "title": "Cache Name:",
                "type": "text",
                "name": "Cachename",
                "value": data[3]
            }, {
                "title": "Cache Size(KB):",
                "type": "number",
                "name": "poolsize", "value": data[4]
            }, {
                "title": "Page Size(KB):",
                "type": "number",
                "name": "pagesize", "value": data[5].replace("]", "")
            }, {
                "title": "Page Per IO:",
                "type": "number",
                "name": "pageper", "value": datains[5]
            }, {
                "title": "Other Access:",
                "type": "number",
                "name": "otheraccess", "value": datains[6]
            }, {
                "title": "CPU Per IO:",
                "type": "number",
                "name": "CPU", "value": datains[6]
            }

        ];
    } else {
//  
//  
//  
//                        
//                                              
//                                                                                          String[] S_PARAMETER = {"CACHE_SIZE", "PAGE_SIZE", "OTHER_ACCESS", "PGS_PER_IO"};
        var ScenarioData = ScenarioData.split(",");
        form.fields = [
            {
                "title": "-",
                "type": "headerupdate",
                "name": "headerupdate",
            },
            {
                "title": "Cache Name:",
                "type": "text",
                "name": "Cachename", readonly: true,
                "value": data[3]
            }, {
                "title": "Cache Size(KB):",
                "type": "numberupdate",
                "name": "poolsize", "value": data[4], newvalue: ScenarioData[0].replace("[", "")
            }, {
                "title": "Page Size(KB):",
                "type": "numberupdate",
                "name": "pagesize", "value": data[5].replace("]", ""), newvalue: ScenarioData[1]
            }, {
                "title": "Page Per IO:",
                "type": "numberupdate", readonly: true,
                "name": "pageper", "value": datains[5], newvalue: ScenarioData[3].replace("]", "")
            }, {
                "title": "Other Access:",
                "type": "numberupdate",
                "name": "otheraccess", "value": datains[4], newvalue: ScenarioData[2]
            }, {
                "title": "CPU Per IO:",
                "type": "number", readonly: true,
                "name": "CPU", "value": datains[6]
            }

        ];
    }

    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "editCacheBT",
            action: "send",
            url: "ajax/views/groupView/dbinst.jsp",
            options: {status: "editCache", "DBinsname": DBinstancesname, "DBins": DBinstances, "id": id, "idins": idins, ids: nodeID},
            done: function() {

                showMyloading(".main", "end");
                updateTableCache(DBinstances, ids);
                form.closeWindow();
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "ADDCacheCancel"
        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        }, {
            "title": "ADD Cache",
            "type": "button",
            "name": "editCacheBT",
            "value": "Update"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "ADDCacheCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "editCache",
        "title": (ids[2] === "null") ? "Edit Cache" : "Cache Scenario",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "230"
    };
    form._renderWindows();
}


function CacheWidows(projectid, modid, DBinstances, DBinstancesname) {


    var form = new FormClass("CacheAdd");
    form.fields = [
        {
            "title": "Cache Name:",
            "type": "text",
            "name": "Cachename"
        }, {
            "title": "Cache Size(KB):",
            "type": "number",
            "name": "poolsize"
        }, {
            "title": "Page Size(KB):",
            "type": "number",
            "name": "pagesize"
        }, {
            "title": "Page Per IO:",
            "type": "number",
            "name": "pageper"
        }, {
            "title": "Other Access:",
            "type": "number",
            "name": "otheraccess"
        },
        {
            "title": "CPU Per IO:",
            "type": "number",
            "name": "CPU"
        }
    ];
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "ADDCache",
            action: "send",
            url: "ajax/views/groupView/dbinst.jsp",
            options: {status: "addCache", "proid": projectid, "DBinsname": DBinstancesname, "DBins": DBinstances, "mod_id": modid},
            done: function() {
                alert("Cache added successfully");
                showMyloading(".main", "end");
                updateTableCache(DBinstances, ids);
                form.closeWindow();
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "ADDCacheCancel"
        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        }, {
            "title": "ADD Cache",
            "type": "button",
            "name": "ADDCache",
            "value": "Add"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "ADDCacheCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addCache",
        "title": "add Cache",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "230"
    };
    form._renderWindows();
}



function updateTableCache(DBinstances, ids) {
    $.get("ajax/views/groupView/dbinst.jsp?status=getCacheDatarows&id=" + DBinstances + "&ids=" + nodeID, function(data) {

        updateComs($.trim($(".DBinstancesID").val()));
        $(".Cachetable tbody").html(data);
        $(".Cachetable tbody tr").click(function() {
            $(".Cachetable tbody tr").removeClass("act");
            $(this).addClass("act");
        });
    });
}
$(document).on("afterloadBuffer", function(event, param1, param2) {

    updateTableCache($.trim($(".DBinstancesID").val()), ids);
});
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="Table Windows">


function indexTableTable(id, idins, ids) {

    $.get("ajax/views/groupView/dbinst.jsp?status=indxDatarows&id=" + id + "&idins=" + idins + "&ids=" + nodeID, function(data) {
        $(".Indextable tbody").html(data);
        $(".Indextable tbody tr").click(function() {
            $(".Indextable tbody tr").removeClass("act");
            $(this).addClass("act");
        });
    });
}



function updateTableTable(id, ids) {

    $.get("ajax/views/groupView/dbinst.jsp?status=tableDatarows&id=" + id + "&ids=" + nodeID, function(data) {
        $(".Tabletable tbody").html(data);
        $(".Tabletable tbody tr").eq(0).addClass("act");
        indexTableTable($(".Tabletable tbody tr").eq(0).data("insid"), $(".Tabletable tbody tr").eq(0).data("decid"), ids);
        $(".Tabletable tbody tr").click(function() {

            indexTableTable($(this).data("insid"), $(this).data("decid"), ids);
            $(".Tabletable tbody tr").removeClass("act");
            $(this).addClass("act");
        });
    });
}

function EditTableWidows(pro_id, mod_id, DBinstances, id, idins, data, datainst, ids, xrefData, ScenarioData) {


    data = data.split(",");
    datainst = datainst.split(",");
    var form = new FormClass("editTable");
    ids = ids.split("/");
    if (ids[2] === "null") {

        form.fields = [
            {
                "title": "table Name:",
                "type": "text",
                "name": "tablename",
                value: data[1]
            }, {
                "title": "CACHE:",
                "type": "list",
                "name": "CACHE_DESC_ID",
                options: "0__0",
                value: xrefData, pClass: "_100 normal"
            }, {
                "title": "Useful Size:",
                "type": "number",
                "name": "USEFUL_SIZE",
                value: data[4], pClass: "_100"
            }, {
                "title": "Row Length:",
                "type": "number",
                "name": "ROW_LEN",
                value: data[6], pClass: "_100"
            }, {
                "title": "Logical Drive Name:",
                "type": "select",
                "name": "LOGICAL_DRIVE_NAME",
                options: "0__0", pClass: "_100"
            }, {
                "title": "Other Access:",
                "type": "number",
                "name": "OTHER_ACCESS",
                value: datainst[7], pClass: "_100"
            }, {
                "title": "Min IO Per Tran:",
                "type": "number",
                "name": "MIN_IO_PER_TRAN",
                value: datainst[6], pClass: "_100"
            }, {
                "title": "Occupation Rate:",
                "type": "number",
                "name": "OCCUP_RATE",
                value: datainst[9], pClass: "_100"
            }

        ];
    } else {

//        String[] S_PARAMETER = {"ROW_LEN", "USEFUL_SIZE", "MIN_IO_PER_TRAN", "OTHER_ACCESS", "OCCUP_RATE"};
        /*
         * ScenarioData
         */ var ScenarioData = ScenarioData.split(",");
        form.fields = [
            {
                "title": "-",
                "type": "headerupdate",
                "name": "headerupdate",
            },
            {
                "title": "table Name:",
                "type": "text", readonly: true,
                "name": "tablename",
                value: data[1]
            }, {
                "title": "Useful Size:",
                "type": "numberupdate",
                "name": "USEFUL_SIZE",
                value: data[4], pClass: "_100", newvalue: ScenarioData[1]
            }, {
                "title": "Row Length:",
                "type": "numberupdate",
                "name": "ROW_LEN",
                value: data[6], pClass: "_100", newvalue: ScenarioData[0].replace("[", "")
            }, {
                "title": "Logical Drive Name:",
                "type": "select", readonly: true,
                "name": "LOGICAL_DRIVE_NAME",
                options: "0__0", pClass: "_100", value: datainst[4]
            }, {
                "title": "Other Access:",
                "type": "numberupdate",
                "name": "OTHER_ACCESS",
                value: datainst[7], pClass: "_100", newvalue: ScenarioData[3]
            }, {
                "title": "Min IO Per Tran:",
                "type": "numberupdate",
                "name": "MIN_IO_PER_TRAN",
                value: datainst[6], pClass: "_100", newvalue: ScenarioData[2]
            }, {
                "title": "Occupation Rate:",
                "type": "numberupdate", readonly: true,
                "name": "OCCUP_RATE", newvalue: ScenarioData[4].replace("[", ""),
                value: datainst[9], pClass: "_100"
            }

        ];
    }







    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "ADDTable",
            action: "send",
            url: "ajax/views/groupView/dbinst.jsp",
            options: {status: "editTable", "mod_id": mod_id, DB_NAMESPACE_DESC_ID: $(".DB_NAMESPACE").val(), "DBins": DBinstances, "id": id, "idins": idins, ids: nodeID},
            done: function() {
                showMyloading(".main", "end");
                updateTableBuffer(DBinstances);
                $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + $.trim($(".DB_NAMESPACE").val()), function(DB_NAMESPACE_INST_ID) {

                    updateTableTable($.trim(DB_NAMESPACE_INST_ID), $.trim(ids));
                    form.closeWindow();
                });
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "ADDCacheCancel"
        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        }, {
            "title": "ADD Table",
            "type": "button",
            "name": "ADDTable",
            "value": "update"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "ADDCacheCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "editTable",
        "title": (ids[2] === "null") ? "Edit Table" : "Table Scenario",
        "content": content,
        "footerContent": footer
        , load: function(id) {

            $.get("ajax/views/groupView/dbinst.jsp?status=getLOGICALDRIVEOptions&id=" + DBinstances + "&ids=" + nodeID + "&value=" + $.trim(datainst[4]), function(data) {

                $(".LOGICAL_DRIVE_NAME").html(data);
                $.get("ajax/views/groupView/dbinst.jsp?status=getCacheDataOptions&id=" + DBinstances + "&value=" + $.trim(xrefData), function(data) {

                    $(".CACHE_DESC_ID").html(data);
                });
            });
        },
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "330"
    };
    form._renderWindows();
}


function TableWidows(projectid, modid, DBinstances, ids, DB_NAMESPACE_id, DB_NAMESPACE_INST_ID) {

    if (DB_NAMESPACE_id !== null && DB_NAMESPACE_id !== "" && DB_NAMESPACE_id !== undefined) {
        var form = new FormClass("addTable");
        form.fields = [
            {
                "title": "table Name:",
                "type": "text",
                "name": "tablename"
            }, {
                "title": "CACHE:",
                "type": "list",
                "name": "CACHE_DESC_ID"
                , options: "0__0"
                , pClass: "_100 normal"
            }, {
                "title": "USEFUL_SIZE:",
                "type": "number",
                "name": "USEFUL_SIZE", pClass: "_100"
            }, {
                "title": "ROW_LEN:",
                "type": "number",
                "name": "ROW_LEN", pClass: "_100"
            }, {
                "title": "LOGICAL_DRIVE_NAME:",
                "type": "select",
                "name": "LOGICAL_DRIVE_NAME",
                options: "0__0", pClass: "_100"
            }, {
                "title": "OTHER_ACCESS:",
                "type": "number",
                "name": "OTHER_ACCESS"
            }, {
                "title": "MIN_IO_PER_TRAN:",
                "type": "number",
                "name": "MIN_IO_PER_TRAN"
            }, {
                "title": "OCCUP_RATE:",
                "type": "number",
                "name": "OCCUP_RATE"
            }

        ];
        var content = form._renderhtml();
        form.events = [
            {
                event: "click",
                eventClass: "ADDTable",
                action: "send",
                url: "ajax/views/groupView/dbinst.jsp",
                options: {status: "addTable", "DB_NAMESPACE_DESC_ID": $.trim(DB_NAMESPACE_id), "DB_NAMESPACE_INST_ID": $.trim(DB_NAMESPACE_INST_ID), "proid": projectid, "DBins": DBinstances, "mod_id": modid},
                done: function() {
                    alert("Table added successfully");
                    showMyloading(".main", "end");
                    updateTableBuffer(DBinstances);
                    $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + $.trim($(".DB_NAMESPACE").val()), function(DB_NAMESPACE_INST_ID) {

                        updateTableTable($.trim(DB_NAMESPACE_INST_ID), ids);
                        form.closeWindow();
                    });
                }
            }, {
                "action": "close"
                , "event": "click"
                , "eventClass": "ADDCacheCancel"
            }

        ];
        form.fields = [
            {
                "type": "div",
                "class": "do_center _100"

            }, {
                "title": "ADD Table",
                "type": "button",
                "name": "ADDTable",
                "value": "Add"
            },
            {
                "title": "cancel",
                "type": "button",
                "name": "ADDCacheCancel",
                "value": "cancel"
            },
            {
                "type": "enddiv"
            }
        ];
        var footer = form._renderhtml();
        form.windows = {
            "class": "addTable",
            "title": "add Table",
            "content": content,
            "footerContent": footer,
            "position": "Center"
            , load: function(id) {

                $.get("ajax/views/groupView/dbinst.jsp?status=getLOGICALDRIVEOptions&id=" + DBinstances + "&ids=" + nodeID + "&value=0", function(data) {

                    $(".LOGICAL_DRIVE_NAME").html(data);
                    $.get("ajax/views/groupView/dbinst.jsp?status=getCacheDataOptions&id=" + DBinstances + "&value=0", function(data) {

                        $(".CACHE_DESC_ID").html(data);
                    });
                });
            },
            "x": "600",
            "y": "90",
            width: "500", height: "330"
        };
        form._renderWindows();
    } else {

        alert("Select Namespace first!");
    }
}


//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="Index windows">

//IndexEditWidows($(".DBinstancesID").val(), id, idins, data, datainst);




function IndexEditWidows(pro_id, mod_id, DBinstances, id, idins, data, datainst, xrefData, ids, ScenarioData) {
    data = data.split(",");
    datainst = datainst.split(",");
    var form = new FormClass("EditIndex");
    ids = ids.split("/");
    if (ids[2] === "null") {
        form.fields = [
            {
                "title": "Index Name:",
                "type": "text",
                "name": "indexname",
                value: data[1]
            }, {
                "title": "CACHE:",
                "type": "list",
                "name": "CACHE_DESC_ID",
                options: "__",
                value: xrefData, pClass: "_100 normal",
            }, {
                "title": "Useful Size:",
                "type": "number",
                "name": "USEFUL_SIZE",
                value: data[3], pClass: "_100"
            }
            , {
                "title": "Logical Drive Name:",
                "type": "select",
                "name": "LOGICAL_DRIVE_NAME",
                options: "0__0", pClass: "_100"
            }


            , {
                "title": "Index Type Number:",
                "type": "number",
                "name": "INDEX_TYPE_NUM",
                value: data[4], pClass: "_100"
            }, {
                "title": "Row Length:",
                "type": "number",
                "name": "ROW_LEN",
                value: data[5], pClass: "_100"
            }, {
                "title": "Other Access:",
                "type": "number",
                "name": "OTHER_ACCESS",
                value: datainst[7], pClass: "_100"
            }, {
                "title": "Min IO Per Tran:",
                "type": "number",
                "name": "MIN_IO_PER_TRAN",
                value: datainst[6], pClass: "_100"
            }, {
                "title": "Occupation Rate:",
                "type": "number",
                "name": "OCCUP_RATE",
                value: datainst[9], pClass: "_100"
            }

        ];
    } else {

//        String[] S_PARAMETER = {"ROW_LEN", "USEFUL_SIZE", "MIN_IO_PER_TRAN", "OTHER_ACCESS", "OCCUP_RATE"};

        var ScenarioData = $.trim(ScenarioData).split(",");
        form.fields = [
            {
                "title": "-",
                "type": "headerupdate",
                "name": "headerupdate",
            },
            {
                "title": "Index Name:",
                "type": "text",
                "name": "indexname", readonly: true,
                value: data[1]
            }, {
                "title": "Useful Size:",
                "type": "numberupdate",
                "name": "USEFUL_SIZE",
                value: data[3], pClass: "_100", newvalue: ScenarioData[1]
            }
            , {
                "title": "Logical Drive Name:",
                "type": "select",
                "name": "LOGICAL_DRIVE_NAME",
                options: "0__0", pClass: "_100", value: data[4], readonly: true
            }


            , {
                "title": "Index Type Number:",
                "type": "number",
                "name": "INDEX_TYPE_NUM", readonly: true,
                value: data[4], pClass: "_100"
            }, {
                "title": "Row Length:", newvalue: ScenarioData[0].replace("[", ""),
                "type": "numberupdate",
                "name": "ROW_LEN",
                value: data[5], pClass: "_100"
            }, {
                "title": "Other Access:",
                "type": "numberupdate",
                "name": "OTHER_ACCESS",
                value: datainst[7], pClass: "_100", newvalue: ScenarioData[3]
            }, {
                "title": "Min IO Per Tran:",
                "type": "numberupdate",
                "name": "MIN_IO_PER_TRAN",
                value: datainst[6], pClass: "_100", newvalue: ScenarioData[2]
            }, {
                "title": "Occupation Rate:",
                "type": "numberupdate",
                "name": "OCCUP_RATE",
                value: datainst[9], pClass: "_100", newvalue: ScenarioData[4].replace("[", "")
            }

        ];
    }



    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "ADDIndex",
            action: "send",
            url: "ajax/views/groupView/dbinst.jsp",
            options: {"mod_id": mod_id, status: "editIndex", "DBins": DBinstances, "id": id, "idins": idins, ids: nodeID},
            done: function() {
                showMyloading(".main", "end");
                updateTableBuffer(DBinstances);
                indexTableTable($(".Tabletable tr.act").data("insid"), $(".Tabletable tr.act").data("decid"));
                form.closeWindow();
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "ADDCacheCancel"
        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        }, {
            "title": "update",
            "type": "button",
            "name": "ADDIndex",
            "value": "Update"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "ADDCacheCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "EditIndex",
        "title": (ids[2] === "null") ? "Edit Index" : "Index Scenario",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600"
        , load: function(id) {

            $.get("ajax/views/groupView/dbinst.jsp?status=getLOGICALDRIVEOptions&id=" + DBinstances + "&ids=" + nodeID + "&value=" + $.trim(datainst[4]), function(data) {

                $(".LOGICAL_DRIVE_NAME").html(data);
                $.get("ajax/views/groupView/dbinst.jsp?status=getCacheDataOptions&id=" + DBinstances + "&value=" + $.trim(xrefData), function(data) {

                    $(".CACHE_DESC_ID").html(data);
                });
            });
        },
        "y": "90",
        width: "500", height: "330"
    };
    form._renderWindows();
}

function IndexWidows(projectid, modid, DBinstances, ids) {
    var id = $(".Tabletable tr.act").data("decid");
    if (id !== null && id !== "" && id !== undefined) {


        var form = new FormClass("IndexAdd");
        form.fields = [
            {
                "title": "Index Name:",
                "type": "text",
                "name": "indexname"
            }, {
                "title": "CACHE:",
                "type": "list",
                "name": "CACHE_DESC_ID",
                options: "0__0",
                pClass: "_100 normal"
            }, {
                "title": "Useful Size:",
                "type": "number",
                "name": "USEFUL_SIZE", pClass: "_100"
            }, {
                "title": "LOGICAL_DRIVE_NAME:",
                "type": "select",
                "name": "LOGICAL_DRIVE_NAME",
                options: "0__0", pClass: "_100"
            }, {
                "title": "Index Type Number:",
                "type": "number",
                "name": "INDEX_TYPE_NUM", pClass: "_100"
            }, {
                "title": "Row Length:",
                "type": "number",
                "name": "ROW_LEN", pClass: "_100"
            }, {
                "title": "Other Access:",
                "type": "number",
                "name": "OTHER_ACCESS", pClass: "_100"
            }
            , {
                "title": "Min IO Per Tran:",
                "type": "number",
                "name": "MIN_IO_PER_TRAN", pClass: "_100"
            }, {
                "title": "Occupation Rate:",
                "type": "number",
                "name": "OCCUP_RATE", pClass: "_100"
            }

        ];
        var content = form._renderhtml();
        form.events = [
            {
                event: "click",
                eventClass: "ADDIndex",
                action: "send",
                url: "ajax/views/groupView/dbinst.jsp",
                options: {status: "addIndex", TABLE_DESC_ID: $(".Tabletable tr.act").data("decid"), TABLE_INST_ID: $(".Tabletable tr.act").data("insid"), "proid": projectid, "DBins": DBinstances, "mod_id": modid},
                done: function() {
                    alert("Index added sucessfully");
                    showMyloading(".main", "end");
                    updateTableBuffer(DBinstances);
                    indexTableTable($(".Tabletable tr.act").data("insid"), $(".Tabletable tr.act").data("decid"));
                    form.closeWindow();
                }
            }, {
                "action": "close"
                , "event": "click"
                , "eventClass": "ADDCacheCancel"
            }

        ];
        form.fields = [
            {
                "type": "div",
                "class": "do_center _100"

            }, {
                "title": "ADD Index",
                "type": "button",
                "name": "ADDIndex",
                "value": "Add"
            },
            {
                "title": "cancel",
                "type": "button",
                "name": "ADDCacheCancel",
                "value": "cancel"
            },
            {
                "type": "enddiv"
            }
        ];
        var footer = form._renderhtml();
        form.windows = {
            "class": "addIndex",
            "title": "add Index",
            "content": content,
            "footerContent": footer,
            "position": "Center", load: function(id) {


                $.get("ajax/views/groupView/dbinst.jsp?status=getLOGICALDRIVEOptions&id=" + DBinstances + "&ids=" + nodeID + "&value=0", function(data) {

                    $(".LOGICAL_DRIVE_NAME").html(data);
                    $.get("ajax/views/groupView/dbinst.jsp?status=getCacheDataOptions&id=" + DBinstances + "&value=0", function(data) {

                        $(".CACHE_DESC_ID").html(data);
                    });
                });
            },
            "x": "600",
            "y": "90",
            width: "500", height: "330"
        };
        form._renderWindows();
    } else {

        alert("Select a Table to which you would like to add an Index!");
    }
}

//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="Buffer Windows">


function BufferEditWidows(DBinstances, id, idins, data, datains, DBinstancesname, ids, ScenarioData) {

    data = data.split(",");
    datains = datains.split(",");
    var form = new FormClass("BufferEdit");
    ids = ids.split("/");
    if (ids[2] === "null") {


        form.fields = [
            {
                "title": "Buffer Name:",
                "type": "text",
                "name": "buffername",
                "value": data[3]
            }, {
                "title": "Pool Size(KB):",
                "type": "number",
                "name": "poolsize", "value": data[4]
            }, {
                "title": "Page Size(KB):",
                "type": "number",
                "name": "pagesize", "value": data[5].replace("]", "")
            }, {
                "title": "Page Per IO:",
                "type": "number",
                "name": "pageper", "value": datains[5]
            }, {
                "title": "Other Access:",
                "type": "number",
                "name": "otheraccess", "value": datains[6].replace("]", "")
            }
            , {
                "title": "Logical Drive Name:",
                "type": "select",
                "name": "logicaldrive",
                options: "0__0"
            }



        ];
    } else {

        var ScenarioData = ScenarioData.split(",");
        // alert(ScenarioData);
//        String[] S_PARAMETER = {"BUFPOOL_SIZE", "PAGE_SIZE", "PGS_PER_IO", "OTHER_APPS"};

        form.fields = [
            {
                "title": "-",
                "type": "headerupdate",
                "name": "headerupdate",
            },
            {
                "title": "Buffer Name:",
                "type": "text",
                readonly: true,
                "name": "buffername",
                "value": data[3]
            }, {
                "title": "Pool Size(KB):",
                "type": "numberupdate",
                "name": "poolsize", "value": data[4], newvalue: ScenarioData[0].replace("[", "")
            }, {
                "title": "Page Size(KB):",
                "type": "numberupdate",
                "name": "pagesize", "value": data[5].replace("]", ""), newvalue: ScenarioData[1]
            }, {
                "title": "Page Per IO:",
                "type": "numberupdate",
                "name": "pageper", "value": datains[5], newvalue: ScenarioData[2]
            }, {
                "title": "Other Access:",
                "type": "numberupdate",
                "name": "otheraccess", "value": datains[6].replace("]", ""), newvalue: ScenarioData[3].replace("]", "")
            }
            , {
                "title": "Logical Drive Name:",
                "type": "text",
                "name": "logicaldrive",
                options: "0__0",
                "value": datains[4], readonly: true
            }



        ];
    }


    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "editBufferBT",
            action: "send",
            url: "ajax/views/groupView/dbinst.jsp",
            options: {status: "editBuffer", "DBinsname": DBinstancesname, "DBins": DBinstances, "id": id, "idins": idins, ids: nodeID},
            done: function() {
                if (DBinstances !== null) {
                    showMyloading(".main", "end");
                    updateTableBuffer(DBinstances);
                    form.closeWindow();
                }
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "windowsCancel", done: function() {
            }
        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "cancel",
            "type": "button",
            "name": "windowsCancel",
            "value": "cancel"
        },
        {
            "title": "ADD Buffer",
            "type": "button",
            "name": "editBufferBT",
            "value": "Update"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "editBuffer",
        "title": (ids[2] === "null") ? "Edit Buffer" : "Buffer Scenario",
        "content": content,
        "footerContent": footer, load: function(id) {

            $.get("ajax/views/groupView/dbinst.jsp?status=getLOGICALDRIVEOptions&id=" + DBinstances + "&ids=" + nodeID + "&value=" + $.trim(datains[4]), function(data) {

                $(".logicaldrive").html(data);
            });
        },
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "230"
    };
    form._renderWindows();
}

function BufferWidows(projectid, modid, DBinstances, DBinstancesname, ids) {


    var form = new FormClass("BufferAdd");
    form.fields = [
        {
            "title": "Buffer Name:",
            "type": "text",
            "name": "buffername"
        }, {
            "title": "Pool Size(KB):",
            "type": "number",
            "name": "poolsize"
        }, {
            "title": "Page Size(KB):",
            "type": "number",
            "name": "pagesize"
        }, {
            "title": "Page Per IO:",
            "type": "number",
            "name": "pageper"
        }, {
            "title": "Other Access:",
            "type": "number",
            "name": "otheraccess"
        }, {
            "title": "LOGICAL_DRIVE_NAME:",
            "type": "select",
            "name": "logicaldrive",
            options: "0__0"
        }

    ];
    var content = form._renderhtml();
    form.events = [
        {
            event: "click",
            eventClass: "ADDBuffer",
            action: "send",
            url: "ajax/views/groupView/dbinst.jsp",
            options: {status: "addBuffer", "proid": projectid, "DBinsname": DBinstancesname, "DBins": DBinstances, "mod_id": modid},
            done: function() {
                alert("Buffer added successfully");
                showMyloading(".main", "end");
                updateTableBuffer(DBinstances);
                updateComs($.trim(DBinstances));
                form.closeWindow();
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "ADDBufferCancel"
        }

    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        }, {
            "title": "ADD Buffer",
            "type": "button",
            "name": "ADDBuffer",
            "value": "Add"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "ADDBufferCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addBuffer",
        "title": "add Buffer",
        "content": content,
        "footerContent": footer,
        load: function(id) {

            $.get("ajax/views/groupView/dbinst.jsp?status=getLOGICALDRIVEOptions&id=" + DBinstances + "&ids=" + nodeID + "&value=0", function(data) {

                $(".logicaldrive").html(data);
            });
        },
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "500", height: "230"
    };
    form._renderWindows();
}




function updateComs(DBinstances) {

    $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE&id=" + DBinstances, function(data) {
        $(".DB_NAMESPACE").html(data);
        $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + $.trim($(".DB_NAMESPACE").val()), function(DB_NAMESPACE_INST_ID) {

            updateTableTable($.trim(DB_NAMESPACE_INST_ID), ids);
        });
    });
}

function updateTableBuffer(DBinstances) {

    $.get("ajax/views/groupView/dbinst.jsp?status=getBufferDatarows&id=" + DBinstances + "&ids=" + nodeID, function(data) {
        $(".logtable tbody").html(data);
        $(document).trigger("afterloadBuffer", ["Custom", "Event"]);
        $(".logtable tbody tr").click(function() {
            $(".logtable tbody tr").removeClass("act");
            $(this).addClass("act");
        });
    });
}







function updateTableIdenx(DBinstances, ids) {

    $.get("ajax/views/groupView/dbinst.jsp?status=getBufferDatarows&id=" + DBinstances + "&ids=" + nodeID, function(data) {
        $(".logtable tbody").html(data);
        $(".logtable tbody tr").click(function() {


            $(".logtable tbody tr").removeClass("act");
            $(this).addClass("act");
        });
    });
}
///name_table, name_index

//</editor-fold>


var ids = null;
var nodeID = "";
function dbinst(pid, myids, Logicalid, Complexinstance, Serverinstance, DBinstances, DBinstancesName, type, dbinststatus) {
    nodeID = myids;
    ids = myids;
    var pro = ids.split("/");
    var pro_id = pid;
    var mod_id = pro[3];
    var s_id = pro[2];
    var Platformes = "0__DB2;1__ORACLE 8.0;2__SYBASE;3__INFORMIX;4__MS SQL Server;5__ADABAS;6__NONSTOP SQL;7__ORACLE 9i;8__ORACLE 10g-2.6;9__ORACLE 10g-2.6-RAC;10__DB2 V9;11__ORACLE 11g;12__ORACLE 11g-RAC;13__DB2 V10;14__SAP HANA";
    /*
     * 
     * DB2 V10 = 13 and SAP HANA = 14?
     
     */
    var addDBinstances = {};
    if ($.trim(DBinstances) === "null") {
        addDBinstances =
                {
                    "title": "add DBinstances",
                    "type": "button",
                    "name": "addDBinstances",
                    "value": "Create DB Inst",
                    "class": "_50", style: "width: 100px;"


                };
    }






    //<editor-fold defaultstate="collapsed" desc="tables">

    var logtable = {
        name: "logtable",
        "class": "data_grid",
        type: "table",
        rows: "d"
        ,
        columns: [
            {title: "Name", type: "div", name: "rowName"},
            {title: "Pool Size(kb)", type: "div", name: "PoolSize"},
            {title: "Page Size(kb)", type: "div", name: "PageSize"},
            {title: "Page per IO", type: "div", name: "PageperIO"},
            {title: "Logical Drive", type: "div", name: "LogicalDrive"}]

                //{title: "Other Access", type: "div", name: "OtherAccess"},


    };
    var Cachetable = {
        name: "Cachetable",
        "class": "data_grid",
        type: "table",
        rows: "d"
        ,
        columns: [
            {title: "Name", type: "div", name: "rowName"},
            {title: "Cache Size(kb)", type: "div", name: "PoolSize"},
            {title: "Page Size(kb)", type: "div", name: "PageSize"},
            {title: "Page per IO", type: "div", name: "PageperIO"},
            {title: "CPU per IO", type: "div", name: "PageperIO"},
            {title: "Other Access", type: "div", name: "OtherAccess"},
            {title: "Level", type: "div", name: "LogicalDrive"}]




    };
    var name_table = {
        name: "Tabletable",
        "class": "data_grid",
        type: "table",
        rows: "d"
        ,
        columns: [
            {title: "Name", type: "div", name: "Name"},
            {title: "Cache", type: "div", name: "CACHE_DESC_ID"},
            {title: "Row Length", type: "div", name: "ROW_LEN"},
            {title: "Useful Size", type: "div", name: "USEFUL_SIZE"},
            {title: "Other Accesses", type: "div", name: "Other_Accesses"},
            {title: "Min IO per Tran ", type: "div", name: "Min_IO_per_Tran"},
            {title: "Occupation Rate", type: "div", name: "OCCUP_RATE"},
            {title: "Logical Drive", type: "div", name: "LogicalDrive"}
        ]
    };
    var name_index = {
        name: "Indextable",
        "class": "data_grid",
        type: "table",
        rows: "d"
        ,
        columns: [
            {title: "Name", type: "div", name: "Name"},
            {title: "Cache", type: "div", name: "CACHE_DESC_ID"},
            {title: "Row Length", type: "div", name: "ROW_LEN"},
            {title: "Useful Size", type: "div", name: "USEFUL_SIZE"},
            {title: "Other Accesses", type: "div", name: "Other_Accesses"},
            {title: "Min IO per Tran ", type: "div", name: "Min_IO_per_Tran"},
            {title: "Occupation Rate", type: "div", name: "OCCUP_RATE"},
            {title: "Index Type(DB2 only) ", type: "div", name: "LOGICAL_DRIVE_NAME"},
            {title: "Logical Drive", type: "div", name: "LogicalDrive"}
        ]
    };
    //</editor-fold>

//


    var form = new FormClass("dbinst");
    //<editor-fold defaultstate="collapsed" desc="header">
    if (s_id === "null") {
        form.fields = [
            {
                "title": "Instance Name:",
                "type": "text",
                "name": "instanceName"
                , "pClass": "_50"
                , value: DBinstancesName
            }, addDBinstances,
            {
                title: "Engine Type",
                type: "select",
                pStyle: "clear:left",
                name: "engineType",
                options: Platformes,
                pClass: "_50",
                value: type
            }, {
                "type": "hidden",
                "name": "instanceNameh",
                value: DBinstancesName
            }, {
                "type": "hidden",
                "name": "DBinstancesID"
                , "value": $.trim(DBinstances)

            }

        ];
    } else {

        form.fields = [
            {
                "title": "Instance Name:",
                "type": "text",
                "name": "instanceName"
                , "pClass": "_50", readonly: true
                , value: DBinstancesName
            }, addDBinstances,
            {
                title: "Engine Type",
                type: "select",
                pStyle: "clear:left", readonly: true,
                name: "engineType",
                options: Platformes,
                pClass: "_50",
                value: type
            }, {
                "type": "hidden",
                "name": "instanceNameh",
                value: DBinstancesName
            }, {
                "type": "hidden",
                "name": "DBinstancesID"
                , "value": $.trim(DBinstances)

            }

        ];
    }





    //</editor-fold>



    form._addTofields([{
            title: "tabs",
            type: "tabs",
            name: "tabsData"
        }]);
    if (dbinststatus !== "2") {

        //<editor-fold defaultstate="collapsed" desc="BufferTabs">
        var logBufferData = [
            {
                title: "log Buffer",
                type: "tab",
                name: "tab1",
                act: true
            }

            , {
                title: "logBuffer",
                type: "border",
                name: "Bufferborder"
            }];
        form._addTofields(logBufferData);
        if (s_id === "null") {
            var logBufferDataButtons = [{
                    "title": "Remove",
                    "type": "button",
                    "name": "BufferRemove",
                    "value": "Remove"
                }, {
                    "title": "Add",
                    "type": "button",
                    "name": "BufferAdd",
                    "value": "Add"
                }, {
                    "title": "Update",
                    "type": "button",
                    "name": "BufferUpdate",
                    "value": "Update"
                }, {
                    "title": "Export",
                    "type": "button",
                    "name": "BufferExport",
                    "value": "Export"
                }, {
                    "title": "Import",
                    "type": "button",
                    "name": "BufferImport",
                    "value": "Import"
                }];
        } else {


            var logBufferDataButtons = [{
                    "type": "button",
                    "name": "editBufferscenario",
                    "value": "edit scenario"
                }]
        }

        form._addTofields(logBufferDataButtons);
        var logBufferDataButtonsEnd = [
            logtable,
            {
                "type": "endborderBuffer",
                "name": "endborderBuffer"
            },
            {
                type: "endtab",
                name: "endtab1"
            }
        ];
        form._addTofields(logBufferDataButtonsEnd);
        //</editor-fold>

        //<editor-fold defaultstate="collapsed" desc="namespecTab">


        var NamespaceDataTable = [
            {
                title: "Namespace",
                type: "tab",
                name: "tab2"
            }
            , {
                title: "Namespaces",
                type: "select",
                name: "DB_NAMESPACE",
                options: "0__0",
                pClass: "_50"
            }


        ];
        form._addTofields(NamespaceDataTable);
        if (s_id === "null") {
            var NamespaceDataTable = [
                {
                    "title": "add DB_NAMESPACE",
                    "type": "button",
                    "name": "addDB_NAMESPACE",
                    "value": "Add  Namespace",
                    pClass: "_50"
                }



            ];
            form._addTofields(NamespaceDataTable);
        }


        var NamespaceDataTable = [
            {
                title: "Table",
                type: "border",
                name: "Namespaceborder"
            }


        ];
        form._addTofields(NamespaceDataTable);
        if (s_id === "null") {
            var NamespaceDataTableButtons = [{
                    "title": "Remove",
                    "type": "button",
                    "name": "TableRemove",
                    "value": "Remove"
                }, {
                    "title": "Add",
                    "type": "button",
                    "name": "TableAdd",
                    "value": "Add"
                }, {
                    "title": "Update",
                    "type": "button",
                    "name": "TableUpdate",
                    "value": "Update"
                }, {
                    "title": "Export",
                    "type": "button",
                    "name": "TableExport",
                    "value": "Export"
                }, {
                    "title": "Import",
                    "type": "button",
                    "name": "TableImport",
                    "value": "Import"
                }


            ];
        } else {


            var NamespaceDataTableButtons = [{
                    "type": "button",
                    "name": "ediTablescenario",
                    "value": "edit scenario"
                }]
        }

        form._addTofields(NamespaceDataTableButtons);
        var NamespaceDataTableEnd = [name_table,
            {
                "type": "endborder",
                "name": "endborder"
            }, {
                title: "Index",
                type: "border",
                name: "Indexborder"
            }
        ];
        form._addTofields(NamespaceDataTableEnd);
        if (s_id === "null") {
            var NamespaceDataIndexButtons = [
                {
                    "title": "Remove",
                    "type": "button",
                    "name": "IndexRemove",
                    "value": "Remove"
                }, {
                    "title": "Add",
                    "type": "button",
                    "name": "IndexAdd",
                    "value": "Add"
                }, {
                    "title": "Update",
                    "type": "button",
                    "name": "IndexUpdate",
                    "value": "Update"
                }, {
                    "title": "Export",
                    "type": "button",
                    "name": "IndexExport",
                    "value": "Export"
                }, {
                    "title": "Import",
                    "type": "button",
                    "name": "IndexImport",
                    "value": "Import"
                }];
        } else {




            var NamespaceDataIndexButtons = [{
                    "type": "button",
                    "name": "editIndexscenario",
                    "value": "edit scenario"
                }]
        }
        form._addTofields(NamespaceDataIndexButtons);
        var NamespaceDataIndexEnd = [
            name_index, {
                "type": "endborder2",
                "name": "endborder2"
            },
            {
                type: "endtab",
                name: "endtab2"
            }

        ]
                ;
        form._addTofields(NamespaceDataIndexEnd);
        //</editor-fold>
    }

    //<editor-fold defaultstate="collapsed" desc="CacheTab">
    var CacheData = [{
            title: "Cache",
            type: "tab",
            name: "tab3"
        }

        , {
            title: "Cache",
            type: "border",
            name: "Namespaceborder"
        }
    ];
    form._addTofields(CacheData);
    if (s_id === "null") {
        var CacheDataButtons = [{
                "title": "Remove",
                "type": "button",
                "name": "CacheRemove",
                "value": "Remove"
            }, {
                "title": "Add",
                "type": "button",
                "name": "CacheAdd",
                "value": "Add"
            }, {
                "title": "Update",
                "type": "button",
                "name": "CacheUpdate",
                "value": "Update"
            }, {
                "title": "Export",
                "type": "button",
                "name": "CacheExport",
                "value": "Export"
            }, {
                "title": "Import",
                "type": "button",
                "name": "CacheImport",
                "value": "Import"
            }];
    } else {


        var CacheDataButtons = [{
                "type": "button",
                "name": "editCachescenario",
                "value": "edit scenario"
            }]
    }
    form._addTofields(CacheDataButtons);
    var CacheDataButtonsEnd = [Cachetable, {
            "type": "endborderCache",
            "name": "endborderCache"
        },
        {
            type: "endtab",
            name: "endtab3"
        }];
    form._addTofields(CacheDataButtonsEnd);
    //</editor-fold>

    form._addTofields([{
            title: "endtabs",
            type: "endtabs",
            name: "endtabs"
        }]);
    var content = form._renderhtml();
    form.events = [
        {
            "event": "click",
            "eventClass": "addDB_NAMESPACE",
            js: function() {
                DB_NAMEEWidows(pro_id, mod_id, $(".DBinstancesID").val());
            }},
        //<editor-fold defaultstate="collapsed" desc="CacheEvntes">


        {"event": "click",
            "eventClass": "CacheExport",
            js: function() {
                window.open("ajax/views/groupView/dbinst_export.jsp?status=getCacheDataexport&id=" + $.trim($(".DBinstancesID").val()));
            }
        }
        ,
        {
            "event": "click",
            "eventClass": "CacheAdd",
            js: function() {
                CacheWidows(pro_id, mod_id, $(".DBinstancesID").val(), $(".instanceNameh").val());
            }
        },
        {"event": "click",
            "eventClass": "CacheImport",
            js: function() {

                // BufferWidows(pro_id, mod_id, $(".DBinstancesID").val(), $(".instanceNameh").val(), ids);


                getImageLocation("exports", function(imageLocaiton) {
                    ImportWidows("Cache", "Cache Import", imageLocaiton, ids, pro_id, mod_id, $(".DBinstancesID").val(), $(".instanceNameh").val());
                });
            }
        }
        ,
        {"event": "click",
            "eventClass": "CacheUpdate",
            js: function() {



                var id = $(".Cachetable tr.act").data("decid");
                if (id !== null && id !== "" && id !== undefined) {
                    var idins = $(".Cachetable .act").data("insid");
                    $.get("ajax/views/groupView/dbinst.jsp?status=getCacheData&id=" + id, function(data) {
                        $.get("ajax/views/groupView/dbinst.jsp?status=getCacheinstData&id=" + idins, function(datainst) {


                            CacheEditWidows($(".DBinstancesID").val(), id, idins, data, datainst, $(".instanceNameh").val(), ids);
                        });
                    });
                } else {


                    alert("Select a cache to update!");
                }
            }
        },
        {"event": "click",
            "eventClass": "CacheRemove",
            js: function() {

                var id = $(".Cachetable tr.act").data("decid");
                if (id !== null && id !== "" && id !== undefined) {
                    if (confirm("Are you sure you would like to remove this Cache?")) {

                        $.get("ajax/views/groupView/dbinst.jsp?status=removeCache&id=" + $(".Cachetable tr.act").data("decid"), function(data) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=removeCacheinst&id=" + $(".Cachetable .act").data("insid"), function(datainst) {
                                $(".Cachetable .act").remove();
                            });
                        });
                    }
                }
                else {
                    alert("Select a cache to delete!");
                }
            }
        }
        //</editor-fold>
        ,
        //<editor-fold defaultstate="collapsed" desc="BufferُEvents">


        {"event": "click",
            "eventClass": "BufferImport",
            js: function() {

                // BufferWidows(pro_id, mod_id, $(".DBinstancesID").val(), $(".instanceNameh").val(), ids);
                getImageLocation("exports", function(imageLocaiton) {


                    ImportWidows("buffer", "Buffer Import", imageLocaiton, ids, pro_id, mod_id, $(".DBinstancesID").val(), $(".instanceNameh").val());
                });
            }
        }
        ,
        {"event": "click",
            "eventClass": "BufferExport",
            js: function() {
                window.open("ajax/views/groupView/dbinst_export.jsp?status=getBufferexpot&id=" + $.trim($(".DBinstancesID").val()));
            }
        },
        {"event": "click",
            "eventClass": "BufferAdd",
            js: function() {
                BufferWidows(pro_id, mod_id, $(".DBinstancesID").val(), $(".instanceNameh").val(), ids);
            }
        },
        {"event": "click",
            "eventClass": "BufferUpdate",
            js: function() {




                var id = $(".logtable tr.act").data("decid");
                if (id !== null && id !== "" && id !== undefined) {

                    var idins = $(".logtable .act").data("insid");
                    $.get("ajax/views/groupView/dbinst.jsp?status=getBufferData&id=" + id, function(data) {
                        $.get("ajax/views/groupView/dbinst.jsp?status=getBufferinstData&id=" + idins, function(datainst) {


                            BufferEditWidows($(".DBinstancesID").val(), id, idins, data, datainst, $(".instanceNameh").val(), ids);
                        });
                    });
                } else {
                    alert("Select a buffer to update!");
                }



            }
        },
        {"event": "click",
            "eventClass": "BufferRemove",
            js: function() {



                var id = $(".logtable tr.act").data("decid");
                if (id !== null && id !== "" && id !== undefined) {
                    if (confirm("Are you sure you would like remove this Buffer?")) {

                        $.get("ajax/views/groupView/dbinst.jsp?status=removeBuffer&id=" + $(".logtable tr.act").data("decid"), function(data) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=removeBufferinst&id=" + $(".logtable .act").data("insid"), function(datainst) {
                                $(".logtable .act").remove();
                            });
                        });
                    }


                } else {
                    alert("Select a buffer to delete!");
                }

            }
        }

        //</editor-fold>
        ,
        //<editor-fold defaultstate="collapsed" desc="TableEvents">

        {"event": "click",
            "eventClass": "TableExport",
            js: function() {


                $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + $.trim($(".DB_NAMESPACE").val()), function(DB_NAMESPACE_INST_ID) {
                    window.open("ajax/views/groupView/dbinst_export.jsp?status=tableDataexport&id=" + $.trim(DB_NAMESPACE_INST_ID));
                });
            }
        },
        {"event": "click",
            "eventClass": "TableImport",
            js: function() {

                $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + $.trim($(".DB_NAMESPACE").val()), function(DB_NAMESPACE_INST_ID) {

                    getImageLocation("exports", function(imageLocaiton) {
                        ImportWidows("table", "Table Import", imageLocaiton, ids, pro_id, mod_id, $(".DBinstancesID").val(), $(".instanceNameh").val(), DB_NAMESPACE_INST_ID);
                    });
                });
            }
        },
        {"event": "change",
            "eventClass": "DB_NAMESPACE",
            js: function() {
                var DB_NAMESPACE_id = $(".DB_NAMESPACE").val();
                $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + DB_NAMESPACE_id, function(DB_NAMESPACE_INST_ID) {

                    updateTableTable($.trim(DB_NAMESPACE_INST_ID), ids);
                });
            }
        },
        {"event": "click",
            "eventClass": "TableAdd",
            js: function() {







                var DB_NAMESPACE_id = $(".DB_NAMESPACE").val();
                $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + DB_NAMESPACE_id, function(DB_NAMESPACE_INST_ID) {
                    TableWidows(pro_id, mod_id, $(".DBinstancesID").val(), ids, DB_NAMESPACE_id, DB_NAMESPACE_INST_ID);
                })
            }
        },
        {"event": "click",
            "eventClass": "TableUpdate",
            js: function() {


                var id = $(".Tabletable tr.act").data("decid");
                if (id !== null && id !== "" && id !== undefined) {
                    var idins = $(".Tabletable .act").data("insid");
                    $.get("ajax/views/groupView/dbinst.jsp?status=getTableData&id=" + id, function(data) {
                        $.get("ajax/views/groupView/dbinst.jsp?status=getTableinstData&id=" + idins, function(datainst) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=getcahexref&id=" + idins, function(xrefData) {

                                EditTableWidows(pro_id, mod_id, $(".DBinstancesID").val(), id, idins, data, datainst, ids, xrefData);
                            });
                        });
                    });
                } else {
                    alert("Select a row to update!");
                }

            }
        },
        {"event": "click",
            "eventClass": "TableRemove",
            js: function() {

                var id = $(".Tabletable tr.act").data("decid");
                if (id !== null && id !== "" && id !== undefined) {
                    if (confirm("Are you sure you would like to remove this Table and all its Indexes?")) {
                        $.get("ajax/views/groupView/dbinst.jsp?status=removeTable&id=" + $(".Tabletable tr.act").data("decid"), function(data) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=removeTableinst&id=" + $(".Tabletable .act").data("insid"), function(datainst) {
                                $(".Tabletable .act").remove();
                            });
                        });
                    }
                } else {
                    alert("Select a row to delete!");
                }
            }
        }

        //</editor-fold>

        //<editor-fold defaultstate="collapsed" desc="IndexEvents">
        , {"event": "click",
            "eventClass": "IndexExport",
            js: function() {


                $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + $.trim($(".DB_NAMESPACE").val()), function(DB_NAMESPACE_INST_ID) {
                    window.open("ajax/views/groupView/dbinst_export.jsp?status=indexDataexport&id=" + $.trim(DB_NAMESPACE_INST_ID));
                });
            }
        },
        {"event": "click",
            "eventClass": "IndexImport",
            js: function() {
                $.get("ajax/views/groupView/dbinst.jsp?status=getDB_NAMESPACE_INST_ID&id=" + $.trim($(".DB_NAMESPACE").val()), function(DB_NAMESPACE_INST_ID) {

                    getImageLocation("exports", function(imageLocaiton) {
                        ImportWidows("index", "Index Import", imageLocaiton, ids, pro_id, mod_id, $(".DBinstancesID").val(), $(".instanceNameh").val(), DB_NAMESPACE_INST_ID);
                    });
                })
            }
        },
        {"event": "click",
            "eventClass": "IndexAdd",
            js: function() {


                IndexWidows(pro_id, mod_id, DBinstances, ids);
            }
        },
        {"event": "click",
            "eventClass": "IndexUpdate",
            js: function() {


                var id = $(".Indextable tr.act").data("decid");
                if (id !== null && id !== "" && id !== undefined) {
                    var idins = $(".Indextable .act").data("insid");
                    $.get("ajax/views/groupView/dbinst.jsp?status=getIndexData&id=" + id, function(data) {
                        $.get("ajax/views/groupView/dbinst.jsp?status=getIndexinstData&id=" + idins, function(datainst) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=getcahexref&id=" + idins, function(xrefData) {
                                IndexEditWidows(pro_id, mod_id, $(".DBinstancesID").val(), id, idins, data, datainst, xrefData, ids);
                            });
                        });
                    });
                } else {
                    alert("Select an Index to update!");
                }
            }
        },
        {"event": "click",
            "eventClass": "IndexRemove",
            js: function() {


                var id = $(".Indextable tr.act").data("decid");
                if (id !== null && id !== "" && id !== undefined) {
                    if (confirm("Are you sure you would like to remove this Index?")) {
                        $.get("ajax/views/groupView/dbinst.jsp?status=removeIndex&id=" + $(".Indextable tr.act").data("decid"), function(data) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=removeIndexinst&id=" + $(".Indextable .act").data("insid"), function(datainst) {
                                $(".Indextable .act").remove();
                            });
                        });
                    }
                } else {
                    alert("Select an Index to delete!");
                }
            }
        }

        //</editor-fold>
        ,
        //<editor-fold defaultstate="collapsed" desc="Gen">

        {
            "action": "close"
            , "event": "click"
            , "eventClass": "DriveCancel"
        }




        ,
        {"event": "click",
            "eventClass": "okdbinst",
            js: function() {



                if ($(".instanceName").val() === null || $.trim($(".instanceName").val()) === "" || $(".instanceName").val() === "null") {

                    alert("Please enter a name for the DB Instance");
                } else {
                    $.get("ajax/views/groupView/dbinst.jsp?status=updateDBinstances&id=" + $(".DBinstancesID").val()
                            + "&name=" + $(".instanceName").val()
                            + "&type=" + $(".engineType").val()
                            + "&mod_id=" + mod_id
                            , function(DBinstances) {


                                form.closeWindow();
                            });
                }
            }
        }
        ,
        {"event": "click",
            "eventClass": "addDBinstances",
            js: function() {



                if ($(".instanceName").val() === null || $.trim($(".instanceName").val()) === "" || $(".instanceName").val() === "null") {

                    alert("Please enter a name for the DB Instance");
                } else {
                    $.get("ajax/views/groupView/dbinst.jsp?status=addDBinstances&id=" + Logicalid
                            + "&name=" + $(".instanceName").val()
                            + "&type=" + $(".engineType").val()
                            + "&mod_id=" + mod_id
                            , function(DBinstances) {



                                $(".DBinstancesID").val($.trim(DBinstances));
                                $.get("ajax/views/groupView/dbinst.jsp?status=DBinstancesName&id=" + $(".log_servers").val(), function(DBinstancesName) {

                                    $(".instanceNameh").val($.trim(DBinstancesName));
                                    $(".instanceName").val($.trim(DBinstancesName));
                                    $(".addDBinstances").hide();
                                    $(".tabsData").show();
                                })
                            });
                }

            }
        }

        //</editor-fold>






    ];
    /**
     * NamespaceDataTableButtons
     ediTablescenario
     editIndexscenario
     editCachescenario
     */
    //<editor-fold defaultstate="collapsed" desc="editscenario">


    if (s_id === "null") {





    } else {
        var editscenario = [
            {
                "event": "click",
                "eventClass": "editBufferscenario",
                js: function() {
                    var id = $(".logtable tr.act").data("decid");
                    if (id !== null && id !== "" && id !== undefined) {

                        var idins = $(".logtable .act").data("insid");
                        $.get("ajax/views/groupView/dbinst.jsp?status=getBufferData&id=" + id, function(data) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=getBufferinstData&id=" + idins, function(datainst) {

                                $.get("ajax/views/groupView/dbinst.jsp?status=getBufferScenarioData&id=" + id + "&idins=" + idins + "&ids=" + nodeID, function(ScenarioData) {
                                    BufferEditWidows($(".DBinstancesID").val(), id, idins, data, datainst, $(".instanceNameh").val(), ids, ScenarioData);
                                });
                            });
                        });
                    } else {
                        alert("Select a buffer to update!");
                    }
                }
            }, {"event": "click",
                "eventClass": "editCachescenario",
                js: function() {



                    var id = $(".Cachetable tr.act").data("decid");
                    if (id !== null && id !== "" && id !== undefined) {
                        var idins = $(".Cachetable .act").data("insid");
                        $.get("ajax/views/groupView/dbinst.jsp?status=getCacheData&id=" + id, function(data) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=getCacheinstData&id=" + idins, function(datainst) {

                                $.get("ajax/views/groupView/dbinst.jsp?status=getCacheScenarioData&id=" + id + "&idins=" + idins + "&ids=" + nodeID, function(ScenarioData) {
                                    CacheEditWidows($(".DBinstancesID").val(), id, idins, data, datainst, $(".instanceNameh").val(), ids, ScenarioData);
                                });
                            });
                        });
                    } else {


                        alert("Select a cache to update!");
                    }
                }
            }, {"event": "click",
                "eventClass": "ediTablescenario",
                js: function() {


                    var id = $(".Tabletable tr.act").data("decid");
                    if (id !== null && id !== "" && id !== undefined) {
                        var idins = $(".Tabletable .act").data("insid");
                        $.get("ajax/views/groupView/dbinst.jsp?status=getTableData&id=" + id, function(data) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=getTableinstData&id=" + idins, function(datainst) {
                                $.get("ajax/views/groupView/dbinst.jsp?status=getcahexref&id=" + idins, function(xrefData) {
                                    $.get("ajax/views/groupView/dbinst.jsp?status=getTableScenarioData&id=" + id + "&idins=" + idins + "&ids=" + nodeID, function(ScenarioData) {

                                        EditTableWidows(pro_id, mod_id, $(".DBinstancesID").val(), id, idins, data, datainst, ids, xrefData, ScenarioData);
                                    });
                                });
                            });
                        });
                    } else {
                        alert("Select a row to update!");
                    }

                }
            }, {"event": "click",
                "eventClass": "editIndexscenario",
                js: function() {


                    var id = $(".Indextable tr.act").data("decid");
                    if (id !== null && id !== "" && id !== undefined) {
                        var idins = $(".Indextable .act").data("insid");
                        $.get("ajax/views/groupView/dbinst.jsp?status=getIndexData&id=" + id, function(data) {
                            $.get("ajax/views/groupView/dbinst.jsp?status=getIndexinstData&id=" + idins, function(datainst) {
                                $.get("ajax/views/groupView/dbinst.jsp?status=getcahexref&id=" + idins, function(xrefData) {
                                    $.get("ajax/views/groupView/dbinst.jsp?status=getIndexScenarioData&id=" + id + "&idins=" + idins + "&ids=" + nodeID, function(ScenarioData) {


                                        IndexEditWidows(pro_id, mod_id, $(".DBinstancesID").val(), id, idins, data, datainst, xrefData, ids, ScenarioData);
                                    });
                                });
                            });
                        });
                    } else {
                        alert("Select an Index to update!");
                    }
                }
            }



        ];
        form._addToEvents(editscenario);
    }



    //</editor-fold>



    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "Ok",
            "type": "button",
            "name": "okdbinst",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "DriveCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "DatabaseInstance",
        "title": "Database Instance",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90", load: function(id) {
            if ($.trim(DBinstances) === "null") {
                $(".instanceName").val("");
                $(".tabsData").hide();
            }

            //
            updateTableBuffer($.trim($(".DBinstancesID").val()), ids);
        },
        width: "800", height: "550"
    };
    form._renderWindows();
}

//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="Other">

function addDrive(mod_id, nod_id, thisnod_id) {




    var form = new FormClass("addDrive");
    form.fields = [
        {
            "title": "Drive Name:",
            "type": "text",
            "name": "DriveName"
        }
    ];
    var content = form._renderhtml();
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "DriveCancel"
        },
        {
            "event": "click",
            "eventClass": "newDrive",
            js: function() {

                $.get("ajax/views/groupView/storageProbertiesActions.jsp?name=" + $(".DriveName").val() + "&id=" + nod_id + " &mod_id=" + mod_id + "&status=save_drive", function(data) {





                    $.get("ajax/views/groupView/storageProberties.jsp?nod_id=" + thisnod_id, function(prodata) {
                        form.closeWindow();
                        storageProberties(prodata, thisnod_id);
                    });
                });
            }
        }
    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newDrive",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "DriveCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addDrive",
        "title": "addDrive",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "600",
        "y": "90",
        width: "450", height: "150"
    };
    form._renderWindows();
}

function updatelists(id, Datastore) {

    $.get("ajax/views/groupView/storageProbertiesActions.jsp?Datastore=" + Datastore + "&id=" + id + "&status=getAvailableDisk", function(data) {



        $(".AvailableDisk").html(getmyOptions(data));
    });
    $.get("ajax/views/groupView/storageProbertiesActions.jsp?Datastore=" + Datastore + "&id=" + id + "&status=getAssignedDisk", function(data) {

        $(".AssignedDisk").html(getmyOptions(data));
    });
}

function storageProberties(data, thisnod_id) {


    var data = data.split(",");
    var form = new FormClass("storageProberties");
    if (data[1] === null) {

        form.fields = [
            {
                "title": "No MDl information found for this node.",
                "type": "label",
                "name": "newLineok"
            }
        ];
        var content = form._renderhtml();
        form.fields = [
            {
                "type": "div",
                "class": "do_center _100"

            },
            {
                "type": "button",
                "name": "storageCancel",
                "value": "close"
            },
            {
                "type": "enddiv"
            }
        ];
        form.events = [
            {
                "action": "close"
                , "event": "click"
                , "eventClass": "storageCancel"
            }

        ];
        var footer = form._renderhtml();
    } else {
        form.fields = [
            {
                "title": "Storage Node Properties:",
                "type": "dataLabel",
                "name": "newLineok",
                "value": data[2],
                pClass: "_100"
            }, {
                "title": "Manufacturer:",
                "type": "dataLabel",
                "name": "newLineok",
                "value": data[3],
                pClass: "_100"
            }, {
                "title": "Model:",
                "type": "dataLabel",
                "name": "newLineok",
                "value": data[4],
                pClass: "_100"
            }, {
                type: "lineBorder",
                "class": "_100"
            },
            {
                "title": "Datastore",
                "type": "select",
                "name": "Datastore", pClass: "_50",
                "value": ""
                , "options": data[5]

            }, {
                "title": "Remove Drive",
                "type": "button",
                "name": "RemoveDrive",
                "value": "Remove Drive", "class": "_25"
            }
            , {
                "type": "button",
                "name": "addDrive",
                "value": "Add Drive", "class": "_25"
            }


            ,
            {name: "xxxx",
                "type": "line", style: 'clear: both'
            }
            , {
                "title": "Available Disk",
                "type": "list",
                "name": "AvailableDisk", pClass: "_50", "options": ""

            }, {
                "title": "Assigned Disk",
                "type": "list",
                "name": "AssignedDisk",
                pClass: "_50", "value": "", "options": ""
            },
            {name: "xxxx",
                "type": "line", style: 'clear: both'
            },
            {
                "type": "button",
                "name": "DiskAdd",
                "value": ">", "class": "_50"
            }, {
                "title": "<",
                "type": "button",
                "name": "DiskRemove",
                "value": "<", "class": "_50"
            }
        ];
        var content = form._renderhtml();
        form.fields = [
            {
                "type": "div",
                "class": "do_center _100"

            },
            {
                "type": "button",
                "name": "storageCancel",
                "value": "close"
            },
            {
                "type": "enddiv"
            }
        ];
        form.events = [
            {
                "event": "click"
                , "eventClass": "DiskAdd"
                , js: function() {




                    ;
                    $.get("ajax/views/groupView/storageProbertiesActions.jsp?Datastore=" + getListValuse('.Datastore') + "&id=" + getListValuse('.AvailableDisk') + "&status=DiskAdd&modid=" + data[0], function(adddata) {
                        updatelists(data[1], $(".Datastore").val());
                    });
                }
            }, {
                "event": "click"
                , "eventClass": "DiskRemove"
                , js: function() {

                    var foo = [];
                    $.get("ajax/views/groupView/storageProbertiesActions.jsp?Datastore=" + $(".Datastore").val() + "&id=" + getListValuse('.AssignedDisk') + "&status=DiskRemove", function(removedata) {
                        updatelists(data[1], $(".Datastore").val());
                    });
                }
            },
            {
                "action": "close"
                , "event": "click"
                , "eventClass": "storageCancel"
            },
            {
                "event": "change"
                , "eventClass": "Datastore",
                js: function() {


                    updatelists(data[1], $(this).val());
                }
            }
            , {
                "event": "click",
                "eventClass": "RemoveDrive",
                js: function() {




                    var c = confirm("Delete logical drive?");
                    if (c) {

                        showMyloading(".main", "start");
                        $.get("ajax/views/groupView/storageProbertiesActions.jsp?Datastore=" + $(".Datastore").val() + "&id=" + $(".Datastore").val() + "&status=removeDatastore", function(removedata) {
                            updatelists(data[1], $(".Datastore").val());
                            $(".Datastore option:selected").remove();
                            showMyloading(".main", "end");
                        });
                    }


                }

            }, {
                "event": "click",
                "eventClass": "addDrive",
                js: function() {

                    form.closeWindow();
                    addDrive(data[0], data[1], thisnod_id);
                }}
        ];
        var footer = form._renderhtml();
    }






    form.windows = {
        "class": "storageProberties",
        "title": "storage Properties",
        "content": content,
        footerContent: footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "650", height: "450"
        , load: function(id) {

            updatelists(data[1], $(id + " .Datastore").val());
        }
    };
    form._renderWindows();
}
function newLineData(groupId, ModID, line, parentCell, thCell, pro_id, group, heightlight, G) {
    mygraph = G;
    var params = {MODEL_ID: groupId, GROUP_ID: ModID, parent: parentCell, target: thCell, addJLine: true, addLine: true};
    var content = getLineData("LineData");
    var form = new FormClass("LineData");
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newLineok",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newLineCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "newLineCancel"
        },
        {
            "event": "click",
            "eventClass": "newLineok",
            action: "send",
            url: "ajax/views/groupView/createNode.jsp",
            options: params,
            done: function() {
                showMyloading(".main", "end");
                updatemuGroup(ModID, groupId, null, true);
                mygraph.refresh();
            }
        }, {
            "event": "click"
            , "eventClass": "newLineCancel",
            js: function() {
                mygraph.removeCells([mycell]);
            }
        }

    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addLine",
        "title": "new Line Properties",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "400", height: "190",
        load: function(id) {


        }
    };
    form._renderWindows();
}


function newNode(groupId, ModID, line, parentCell, thCell, graph, nodeType) {
    mygraph = graph;
    thisModelID = ModID;
    myparentCell = parentCell;
    mycell = thCell;
    showLine = line;
    var Types = "server__Server;storage__Storage;human__Human;equipment__Equipment;vehicle__Vehicle;switch__Switch;router__Router;terminal__Terminal;POINT_OF_SALE__Point of sale;SMART_PHONE__smart phone";
    var form = new FormClass("newNode");
    form.fields = [{
            type: "select",
            title: "node type",
            name: "NodeType",
            options: Types
        }];
    var content = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newGroupNodOk",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newGroupNodeCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "newGroupNodeCancel",
            "Callback": function(t) {
                mygraph.removeCells([mycell]);
                mygraph.refresh();
            }
        }, {
            "event": "click"
            , "eventClass": "newGroupNodOk",
            js: function() {
                var thisType = $(".NodeType").val();
                form.closeWindow();
                getnewNodeWindwos(thisType, false, showLine, null);
            }
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "newGroupNode",
        "title": "new node",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "400", height: "90"
    };
    form._renderWindows();
    form.events = "";

}


function UpdateLineData(values, id) {



    var params = {updateLine: "true", ID: id};
    var protocols = "None__None;Ethernet__Ethernet;Token Ring__Token Ring;ATM-lan__ATM-lan";
    var form = new FormClass();
    form.fields = [{
            type: "border",
            title: "line properties"
        },
        {
            type: "number",
            name: "errorRate",
            title: "error rate (probability/bit)",
            pClass: "_50",
            value: values[2]

        },
        {
            type: "number",
            name: "length",
            title: "Length(KM)",
            pClass: "_50",
            value: values[3]

        },
        {
            type: "number",
            name: "overhead",
            title: "overhead",
            pClass: "_50",
            value: values[6]

        },
        {
            type: "number",
            name: "throughbut",
            title: "throughput",
            pClass: "_50",
            value: values[9]

        },
        {
            type: "select",
            name: "protocol",
            title: "protocol",
            options: protocols,
            value: values[7]
        }, {
            type: "checkbox",
            title: "active",
            name: "active",
            pClass: "_50",
            value: values[8]
        }, {
            type: "checkbox",
            title: "wireless",
            name: "wireless",
            pClass: "_50",
            value: values[11]
        }, {
            type: "endborder",
            title: ""
        }];
    var content = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "updateLineOK",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "updateLineCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "updateLineCancel"
        },
        {
            "event": "click",
            "eventClass": "updateLineOK",
            action: "send",
            url: "ajax/views/groupView/createNode.jsp",
            options: params,
            done: function() {
                showMyloading(".main", "end");
                form.closeWindow();
            }


        }



    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "updateLine",
        "title": "update line",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "400", height: "250"
    };
    form._renderWindows();
}


function editServer(data2, serverId, maxprocessors) {

    var d = data2.split(",");
    var f = new FormClass();
    f.fields = [{
            type: "number",
            title: "Logical processors",
            name: "lp",
            value: d[4],
            min: 1,
            max: maxprocessors
        }, {
            type: "number",
            title: "total priorities",
            name: "tp",
            value: d[5]
        }, {
            type: "number",
            title: "time slice",
            name: "ts",
            value: d[6]
        }, {
            type: "number",
            title: "CPU limit",
            name: "cpuLimit",
            value: d[7]
        }, {
            type: "number",
            title: "CPU quantum",
            name: "cpuQuantum",
            value: d[8].replace("]", "")
        }
    ];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "editServerOK",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "editServerCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "editServerCancel",
            "Callback": null
        }, {
            event: "click",
            eventClass: "editServerOK",
            action: "send",
            url: "ajax/createServer.jsp",
            options: {status: "updateserver", "serverId": serverId},
            done: function() {
                alert("Server updated sucessfully");
                showMyloading(".main", "end");
                f.closeWindow();
            }
        }];
    //$.get("ajax/createServer.jsp?serverId=" + serverId + "&status=updateserver&lp=" + "&tp=" + $(".newSeverTP").val() + "&ts=" + $(".newSeverTimeSlice").val() + "&cpuLimit=" + $(".newSeverCPULimit").val() + "&cpuQuantum=" + $(".newSeverCPUQ").val(), function(mdata) {

    var footer = f._renderhtml();
    f.windows = {
        "class": "editServer",
        "title": "edit logical server: " + d[0] + "]",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "300",
        "y": "190",
        width: "400", height: "190"
    };
    f._renderWindows();
}


function getLineData(parentClass) {
    var protocols = "None__None;Ethernet__Ethernet;Token Ring__Token Ring;ATM-lan__ATM-lan";
    var f = new FormClass(parentClass);
    f.fields = [{
            type: "border",
            title: "line properties"
        },
        {
            type: "number",
            name: "errorRate",
            title: "error rate (probability/bit)",
            pClass: "_50",
            value: 0.0001
        },
        {
            type: "number",
            name: "length",
            title: "Length (km)",
            pClass: "_50",
            value: 0.1
        },
        {
            type: "number",
            name: "overhead",
            title: "overhead",
            pClass: "_50",
            value: 0.0001
        },
        {
            type: "number",
            name: "throughbut",
            title: "Throughput (kbps)",
            pClass: "_50",
            value: 1000000
        },
        {
            type: "select",
            name: "protocol",
            title: "protocol",
            options: protocols,
            value: "Ethernet"
        }, {
            type: "checkbox",
            title: "active",
            name: "active",
            pClass: "_50",
            value: '1 '
        }, {
            type: "checkbox",
            title: "wireless",
            name: "wireless",
            pClass: "_50"
        }, {
            type: "endborder",
            title: ""
        }];
    return f._renderhtml();
}


function getnewNodehuman(addLine, values) {

    var name = "";
    var Repetition = "1";
    var serviceTime = "0.001";
    var active = "1";
    var Batchstaus = "";
    var Transactionalstaus = "checked";
    var showOverwrite = "hidden";
    var params = {status: "human", MODEL_ID: thisModelID, GROUP_ID: thisGroupId};
    var lineData = "";
    if (addLine) {
        lineData = getLineData("newNodehuman");
        params = {status: "human", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, parent: myparentCell.getId(), addLine: "true"};
    }
    if (values != null) {

        showOverwrite = "";
        params = {status: "human", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, updateNode: "true", id: values[0]};
        name = values[5];
        Repetition = values[7];
        serviceTime = values[9];
        active = values[6];
        if ($.trim(values[3]) == "WITO") {
            Batchstaus = "checked";
            Transactionalstaus = "";
        } else {
            Transactionalstaus = "checked";
        }
    }


    var form = new FormClass("newNodehuman");
    form.fields = [
        {
            type: "border",
            title: "Node Properties"
        }, {
            "title": "Name",
            "name": "name",
            type: "text",
            "pClass": "_50 ",
            value: name,
            "required": "required"
        }, {
            "title": "Active",
            "name": "active",
            type: "checkbox",
            "pClass": "_50 clear",
            value: active
        }, {
            "title": "Repetition",
            "name": "Repetition",
            type: "number",
            "pClass": "_50 ",
            value: Repetition
        }, {
            "title": "Service time (ms)",
            "name": "serviceTime",
            type: "number",
            "pClass": "_50 ",
            value: serviceTime
        }, {
            title: "Transactional",
            name: "modelFile",
            type: "radio",
            value: "NITO_D",
            checked: Transactionalstaus,
            "pClass": "_50 "


        },
        {
            title: "Batch",
            name: "modelFile",
            type: "radio",
            value: "WITO",
            "pClass": "_50 ",
            checked: Batchstaus


        }, {
            type: "div",
            "class": showOverwrite
        },
        {
            title: "Overwrite",
            type: "checkbox",
            "pClass": "_50 ",
            name: "overwrite"

        },
        {
            type: "enddiv"
        }



    ];
    if (values != null) {

        form._addTofields([{
                type: "border",
                title: "Node MDL"
            },
            {
                "type": "div",
                "class": "to_center _100"
            },
            {
                "type": "button",
                "name": "importMDL",
                "value": " import MDL from File"
            },
            {
                "type": "button",
                "name": "ExportMDL",
                "value": "Export MDL"
            }
            ,
            {
                type: "enddiv"
            }

            , {
                type: "endborder",
                title: ""
            }])
    }


    form._addTofields([{
            type: "endborder",
            title: ""
        }])

    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newTypeNodeok",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newNodeTypeCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "newNodeTypeCancel"
        },
        {
            "event": "click",
            "eventClass": "newTypeNodeok",
            action: "send",
            url: "ajax/views/groupView/createNode.jsp",
            options: params,
            done: function() {
                showMyloading(".main", "end");
                updatemuGroup(thisModelID, thisGroupId, null, true);
                mygraph.refresh();
            }


        }
        /*{
         "event": "click"
         , "eventClass": "newNodeTypeCancel",
         js: function() {
         if (values == null) {
         mygraph.removeCells([mycell]);
         }
         }
         
         }*/, {
            "event": "click"
            , "eventClass": "newTypeNodeok",
            js: function() {

                form.closeWindow();
            }

        }

        , {
            "event": "click",
            "eventClass": "ExportMDL",
            js: function() {
                window.location.href = "ajax/severmdl.jsp?status=ExportMDL" + "&MODEL_ID=" + thisModelID + "&GROUP_ID=" + thisGroupId + "&id=" + values[0];
            }

        }
        , {
            "event": "click",
            "eventClass": "importMDL",
            /*action: "send",*/
            //  url: "ajax/severmdl.jsp",
            js: function() {


                getImageLocation("working_directory", function(imageLocaiton) {
                    form.closeWindow();
                    uploadMDL(thisModelID, thisGroupId, values[0], imageLocaiton);
                });
            }


        }


    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "newHuman",
        "title": "Human Properties",
        "content": fields + lineData,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "540", height: "260"
    };
    form._renderWindows();
}



function uploadMDL(MODEL_ID, GROUP_ID, id, folder) {


//status: "importMDL", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, id: values[0]



    var form = new FormClass("uploadMDL");
    form.fields = [
        {
            title: "Model File",
            name: "uploadMDL",
            type: "upload",
            "uploadFolder": $.trim(folder),
            "filename": id + ".mdl"
        },{
            type:"hidden",
            name:"mdlHolder"
        }

    ];
    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "importMDLOK",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "importModelCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "importModelCancel"
        }
//        {
//            "action": "send",
//            url: "ajax/severmdl.jsp",
//            options: {status: "importMDL", MODEL_ID: MODEL_ID, GROUP_ID: GROUP_ID, id: id},
//            "event": "click",
//            "eventClass": "importMDLOK",
//            "done": function(data) {
//                alert(" Model uploaded sucessfully !");
//                showMyloading(".main", "end");
//                form.closeWindow();
//            }
//        }
        , {
            event: "click",
            "eventClass": "importMDLOK",
            js: function() {
                showMyloading(".main", "start");
                var fileName=getLegalFileName($(".mdlHolder").val());
                //alert($(".qq-upload-file").text() );
                $.get("ajax/severmdl.jsp?status=importMDL&MODEL_ID=" + MODEL_ID + "&GROUP_ID=" + GROUP_ID + "&id=" + id + "&fileName=" + fileName, function(result) {

                    alert("MDL imported successfully!");
                    showMyloading(".main", "end");
                    form.closeWindow();
                });
            }
        }



    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "uploadMDL",
        "title": "upload MDL",
        "content": fields,
        "footerContent": footer,
        "x": "500",
        "y": "220",
        width: "300", height: "120"
    };
    form._renderWindows();
}



$(function() {

    $(document).on("click", ".im", function() {
        /* var data = [{
         "node": {
         "id": 
         },
         "job": {
         "id": 
         }
         }];*/

        $.get("ajax/views/groupView/sendUCF.jsp?nodeid=" + $(this).data("nodeid") + "&jopid=" + $(this).data("id"), function(data) {

            alert(data);
            // $(".myUCFTable tbody").html(data)
        })




    })

})


function importUCFWindows(nodeid) {

    var form = new FormClass("importUCFWindows");
    form.fields = [
        {
            type: "border",
            title: "Jobs from Collecter Framework"
        }
        , {
            title: "Filter by Date:",
            "type": "date",
            "class": "date",
            "name": "filterDate"
        },
        {
            name: "myUCFTable",
            "class": "data_grid",
            type: "table",
            rows: ".....",
            columns: [
                {title: "No", type: "div", name: "Name"},
                {title: "Start date and time ", type: "div", name: "SQLAction"},
                {title: "Server Name", type: "div", name: "Namespace"}, {title: "Options", type: "div", name: ""},
            ]

        }


        , {
            type: "endborder",
            title: ""
        },
        {
            type: "enddiv"
        }, {
            type: "endborder",
            title: ""
        }
    ];
    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newTypeNodeok",
            "value": "OK"
        }




        ,
        {
            "title": "cancel",
            "type": "button",
            "name": "ucfCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "ucfCancel"
        },
        {
            "event": "click",
            "eventClass": "ExportMDL",
            js: function() {





            }

        },
        {
            "event": "change",
            "eventClass": "date",
            js: function() {



                $.get("ajax/views/groupView/importUCF.jsp?nodeid=" + nodeid + "&startTime=" + $(this).val(), function(data) {


                    $(".myUCFTable tbody").html(data)
                })

            }

        }





    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "importUCFWindows",
        "title": "Import Server from Collector Framework",
        "content": fields,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "550", height: "350"
        , load: function(id) {
            $.get("ajax/views/groupView/importUCF.jsp?nodeid=" + nodeid + "&", function(data) {


                $(".myUCFTable tbody").html(data)
            })





        }
    };
    form._renderWindows();
}


function getnewNodeservice(addLine, values, exists, hasStorage) {
    var name = "";
    var showNote = "hidden";
    if (hasStorage !== undefined) {
        if ($.trim(hasStorage) == "false") {

            showNote = "";
        }
    }


    var responseTime = "0.001";
    var platform = "";
    var active = "1";
    var showOverwrite = "hidden";
    var overwrite = "Import MDL Definition";
    var params = {status: "server", MODEL_ID: thisModelID, GROUP_ID: thisGroupId};
    var lineData = "";
    var Repetition = 1;
    if (addLine) {
        lineData = getLineData("newNodeservice");
        params = {status: "server", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, parent: myparentCell.getId(), addLine: "true"};
    }
    if (values != null) {
        params = {status: "server", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, updateNode: "true", id: values[0]};
        showOverwrite = "";
        name = values[5];
        responseTime = values[8];
        platform = values[3];
        Repetition = values[7];
        active = values[6];
        if ($.trim(exists) == "true") {
            overwrite = "Overwrite MDL Definition";
        }

    }




    var Platformes = "NT-configb__Windows;Unix-configb__Unix;MVS-configb__Main Frame;HANA-config__SAP Hana";
    var form = new FormClass("newNodeservice");
    form.fields = [
        {
            type: "border",
            title: "Node Properties"
        }, {
            "title": "Name",
            "name": "name",
            type: "text",
            "pClass": "_50 ",
            value: name,
            "required": "required"
        }, {
            "title": "Active",
            "name": "active",
            type: "checkbox",
            "pClass": "_50 clear ",
            value: active
        }

        , {
            "title": "Response time (ms)",
            "name": "responseTime",
            type: "number",
            "pClass": "_50 ",
            value: responseTime
        }, {
            "title": "Repetition",
            "name": "Repetition",
            type: "number",
            "pClass": "_50 ",
            value: Repetition
        }
        , {
            type: "div",
            value: "This server isn't connected to any storage node. Connect it to one first before importing the MDL file.",
            "class": "red " + showNote
        }, {
            type: "enddiv"
        }, {
            type: "div",
            "class": showOverwrite,
        },
        {
            type: "border",
            title: "server MDL"
        },
        {
            title: "Overwrite",
            type: "checkbox",
            "pClass": "_50 ",
            name: "overwrite"

        }, {
            type: "select",
            "pClass": "_50 ",
            name: "platform",
            options: Platformes,
            value: platform,
            title: "platform"
        }
        ,
        {
            "type": "div",
            "class": "to_center _100"
        },
        {
            "type": "button",
            "name": "importMDL",
            "value": " import MDL from File"
        },
        {
            "type": "button",
            "name": "importUCF",
            "value": "Import from UCF Job"
        },
        {
            "type": "button",
            "name": "ExportMDL",
            "value": "Export MDL"
        }
        ,
        {
            type: "enddiv"
        }

        , {
            type: "endborder",
            title: ""
        },
        {
            type: "enddiv"
        }, {
            type: "endborder",
            title: ""
        }
    ];
    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newTypeNodeok",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newNodeTypeCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "newNodeTypeCancel"
        },
        {
            "event": "click",
            "eventClass": "newTypeNodeok",
            action: "send",
            url: "ajax/views/groupView/createNode.jsp",
            options: params,
            done: function() {
                showMyloading(".main", "end");
                updatemuGroup(thisModelID, thisGroupId, null, true);
                mygraph.refresh();
            }


        }
        , {
            "event": "click"
            , "eventClass": "newNodeTypeCancel",
            js: function() {
                if (values == null) {
                    mygraph.removeCells([mycell]);
                }
            }

        }



        , {
            "event": "click"
            , "eventClass": "importUCF",
            js: function() {
                importUCFWindows(values[0]);
            }}

        , {
            "event": "click"
            , "eventClass": "newTypeNodeok",
            js: function() {
                form.closeWindow();
            }
        }, {
            "event": "click",
            "eventClass": "ExportMDL",
            js: function() {
                window.location.href = "ajax/severmdl.jsp?status=ExportMDL" + "&MODEL_ID=" + thisModelID + "&GROUP_ID=" + thisGroupId + "&id=" + values[0];
            }

        }
        , {
            "event": "click",
            "eventClass": "importMDL",
            /*action: "send",*/
            //  url: "ajax/severmdl.jsp",
            js: function() {


                getImageLocation("working_directory", function(imageLocaiton) {
                    form.closeWindow();
                    uploadMDL(thisModelID, thisGroupId, values[0], imageLocaiton);
                });
            }


        }





    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "newServer",
        "title": "Server Properties",
        "content": fields + lineData,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "550", height: "350"
    };
    form._renderWindows();
}


function getnewNodeDisk(addLine, values) {




    var name = "";
    var responseTime = "0.001";
    var platform = "";
    var active = "1";
    var params = {status: "storage", MODEL_ID: thisModelID, GROUP_ID: thisGroupId};
    var lineData = "";
    if (addLine) {
        lineData = getLineData("getnewNodeDisk");
        params = {status: "storage", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, parent: myparentCell.getId(), addLine: "true"};
    }
    var showOverwrite = "hidden";
    if (values != null) {
        params = {status: "storage", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, updateNode: "true", id: values[0]};
        showOverwrite = "";
        name = values[5];
        responseTime = values[8];
        platform = values[3];
        if (values[6] == 1) {
            active = "checked='checked'";
        }

    }

    var Platformes = "NT-configb__Windows;Unix-configb__Unix;MVS-configb__Main Frame;HANA-config__SAP Hana";
    var form = new FormClass("getnewNodeDisk");
    form.fields = [
        {
            type: "border",
            title: "Node Properties"
        }, {
            "title": "Name",
            "name": "name",
            type: "text",
            "pClass": "_50 ",
            value: name,
            "required": "required"
        }, {
            "title": "Active",
            "name": "active",
            type: "checkbox",
            "pClass": "_50 clear",
            value: active
        }, {
            type: "div",
            "class": showOverwrite
        },
        {
            title: "Overwrite",
            type: "checkbox",
            "pClass": "_50 ",
            name: "overwrite"

        },
        {
            type: "enddiv"
        }, {
            type: "select",
            "pClass": "_50 ",
            name: "platform",
            options: Platformes,
            value: platform,
            title: "platform"

        }, {
            "title": "Response time (ms)",
            "name": "responseTime",
            type: "number",
            "pClass": "_50 ",
            value: responseTime
        }, {
            type: "div",
            "class": showOverwrite,
        }



    ];
    if (values != null) {

        form._addTofields([{
                type: "border",
                title: "Node MDL"
            },
            {
                "type": "div",
                "class": "to_center _100"
            },
            {
                "type": "button",
                "name": "importMDL",
                "value": " import MDL from File"
            },
            {
                "type": "button",
                "name": "ExportMDL",
                "value": "Export MDL"
            }
            ,
            {
                type: "enddiv"
            }

            , {
                type: "endborder",
                title: ""
            }])
    }


    form._addTofields([{
            type: "endborder",
            title: ""
        }])


    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newTypeNodeok",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newNodeTypeCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "newNodeTypeCancel"
        },
        {
            "event": "click",
            "eventClass": "newTypeNodeok",
            action: "send",
            url: "ajax/views/groupView/createNode.jsp",
            options: params,
            done: function() {
                showMyloading(".main", "end");
                updatemuGroup(thisModelID, thisGroupId, null, true);
                mygraph.refresh();
            }


        }, {
            "event": "click"
            , "eventClass": "newNodeTypeCancel",
            js: function() {
                if (values == null) {
                    mygraph.removeCells([mycell]);
                }
            }

        }, {
            "event": "click"
            , "eventClass": "newTypeNodeok",
            js: function() {
                form.closeWindow();
            }
        }, {
            "event": "click",
            "eventClass": "ExportMDL",
            js: function() {
                window.location.href = "ajax/severmdl.jsp?status=ExportMDL" + "&MODEL_ID=" + thisModelID + "&GROUP_ID=" + thisGroupId + "&id=" + values[0];
            }

        }
        , {
            "event": "click",
            "eventClass": "importMDL",
            /*action: "send",*/
            //  url: "ajax/severmdl.jsp",
            js: function() {


                getImageLocation("working_directory", function(imageLocaiton) {
                    form.closeWindow();
                    uploadMDL(thisModelID, thisGroupId, values[0], imageLocaiton);
                });
            }



        }

    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "newDisk",
        "title": "disk Properties",
        "content": fields + lineData,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "450", height: "350"
    };
    form._renderWindows();
}


function getnewNodeEquipment(addLine, values, timType, Type, timeTitle) {

    var showRepetition = "";
    if (Type == "switch" || Type == "SWITCH") {
        showRepetition = 'hidden';
    }
    var name = "";
    var Repetition = "1";
    var responseTime = "0.001";
    var serviceTime = "0.001";
    var active = "1";
    var showOverwrite = "hidden";
    var timeType = "";
    var params = {status: Type, MODEL_ID: thisModelID, GROUP_ID: thisGroupId};
    var lineData = "";
    if (addLine) {
        lineData = getLineData("newNodeEquipment");
        params = {status: Type, MODEL_ID: thisModelID, GROUP_ID: thisGroupId, parent: myparentCell.getId(), addLine: "true"};
    }
    if (values != null) {
        showOverwrite = "";
        params = {status: Type, MODEL_ID: thisModelID, GROUP_ID: thisGroupId, updateNode: "true", id: values[0]};
        active = values[6];
        name = values[5];
        Repetition = values[7];
        responseTime = values[8];
        serviceTime = values[9];
    }

    var form = new FormClass("newNodeEquipment");
    form.fields = [
        {
            type: "border",
            title: "Node Properties"
        }, {
            "title": "Name",
            "name": "name",
            type: "text",
            "pClass": "_50 ",
            value: name,
            "required": "required"
        }, {
            "title": "Active",
            "name": "active",
            type: "checkbox",
            "pClass": "_50 clear ",
            value: active
        }, {
            type: "div",
            "class": showRepetition
        }, {
            "title": "Repetition",
            "name": "Repetition",
            type: "number",
            "pClass": "_50 ",
            value: Repetition
        }, {
            type: "enddiv"
        }, {
            "title": timeTitle + " (ms)",
            "name": timType,
            type: "number",
            "pClass": "_50 ",
            value: responseTime
        }, {
            type: "div",
            "class": showOverwrite
        },
        {
            title: "Overwrite",
            type: "checkbox",
            "pClass": "_50 ",
            name: "overwrite"

        }
    ];
    if (values != null) {

        form._addTofields([{
                type: "border",
                title: "Node MDL"
            },
            {
                "type": "div",
                "class": "to_center _100"
            },
            {
                "type": "button",
                "name": "importMDL",
                "value": " import MDL from File"
            },
            {
                "type": "button",
                "name": "ExportMDL",
                "value": "Export MDL"
            }
            ,
            {
                type: "enddiv"
            }

            , {
                type: "endborder",
                title: ""
            }])
    }


    form._addTofields([{
            type: "endborder",
            title: ""
        }])

    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newTypeNodeok",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newNodeTypeCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "newNodeTypeCancel"
        },
        {
            "event": "click",
            "eventClass": "newTypeNodeok",
            action: "send",
            url: "ajax/views/groupView/createNode.jsp",
            options: params,
            done: function() {
                showMyloading(".main", "end");
                updatemuGroup(thisModelID, thisGroupId, null, true);
                mygraph.refresh();
            }


        }, {
            "event": "click"
            , "eventClass": "newNodeTypeCancel",
            js: function() {
                if (values == null) {
                    mygraph.removeCells([mycell]);
                }
            }

        }, {
            "event": "click"
            , "eventClass": "newTypeNodeok",
            js: function() {
                form.closeWindow();
            }
        }, {
            "event": "click",
            "eventClass": "ExportMDL",
            js: function() {
                window.location.href = "ajax/severmdl.jsp?status=ExportMDL" + "&MODEL_ID=" + thisModelID + "&GROUP_ID=" + thisGroupId + "&id=" + values[0];
            }

        }
        , {
            "event": "click",
            "eventClass": "importMDL",
            /*action: "send",*/
            //  url: "ajax/severmdl.jsp",
            js: function() {


                getImageLocation("working_directory", function(imageLocaiton) {
                    form.closeWindow();
                    uploadMDL(thisModelID, thisGroupId, values[0], imageLocaiton);
                });
            }


        }

    ];
    var footer = form._renderhtml();
    if (Type == "SMART_PHONE") {
        Type = "Smart phone";
    } else if (Type == "POINT_OF_SALE") {
        Type = "point of sale";
    }
    form.windows = {
        "class": "newEquipment",
        "title": Type + " Properties",
        "content": fields + lineData,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "400", height: "290"
    };
    form._renderWindows();
}


function getnewNodeRouter(addLine, values) {



    var name = "";
    var responseTime = "0.001";
    var serviceTime = "0.001";
    var showOverwrite = "hidden";
    var params = {status: "router", MODEL_ID: thisModelID, GROUP_ID: thisGroupId};
    var active = "0";
    var lineData = "";
    if (addLine) {
        lineData = getLineData("newNodeRouter");
        params = {status: "router", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, parent: myparentCell.getId(), addLine: "true"};
    }
    if (values != null) {
        showOverwrite = "";
        params = {status: "router", MODEL_ID: thisModelID, GROUP_ID: thisGroupId, updateNode: "true", id: values[0]};
        name = values[5];
        responseTime = values[8];
        serviceTime = values[9];
        active = values[6];
    }

    var Platforms = "__None;cisco_D__Cisco";
    var form = new FormClass("newNodeRouter");
    form.fields = [
        {
            type: "border",
            title: "Node Properties"
        }, {
            "title": "Name",
            "name": "name",
            type: "text",
            "pClass": "_50 ",
            value: name,
            "required": "required"
        }, {
            "title": "Active",
            "name": "active",
            type: "checkbox",
            "pClass": "_50 clear",
            value: active
        }, {
            "title": "Response time (ms)",
            "name": "responseTime",
            type: "number",
            "pClass": "_50 ",
            value: responseTime
        }, {
            type: "div",
            "class": showOverwrite
        },
        {
            title: "Overwrite",
            type: "checkbox",
            "pClass": "_50 ",
            name: "overwrite"

        },
        {
            type: "enddiv"
        }, {
            type: "select",
            name: "platform",
            title: "platform",
            options: Platforms, value: "cisco_D"
        }
    ];
    if (values != null) {

        form._addTofields([{
                type: "border",
                title: "Node MDL"
            },
            {
                "type": "div",
                "class": "to_center _100"
            },
            {
                "type": "button",
                "name": "importMDL",
                "value": " import MDL from File"
            },
            {
                "type": "button",
                "name": "ExportMDL",
                "value": "Export MDL"
            }
            ,
            {
                type: "enddiv"
            }

            , {
                type: "endborder",
                title: ""
            }])
    }


    form._addTofields([{
            type: "endborder",
            title: ""
        }])


    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "newTypeNodeok",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newNodeTypeCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "newNodeTypeCancel"
        },
        {
            "event": "click",
            "eventClass": "newTypeNodeok",
            action: "send",
            url: "ajax/views/groupView/createNode.jsp",
            options: params,
            done: function() {
                showMyloading(".main", "end");
                form.closeWindow();
                updatemuGroup(thisModelID, thisGroupId, null, true);
                mygraph.refresh();
            }


        }, {
            "event": "click"
            , "eventClass": "newTypeNodeok",
            js: function() {
                form.closeWindow();
            }
        }, {
            "event": "click"
            , "eventClass": "newNodeTypeCancel",
            js: function() {
                if (values == null) {
                    mygraph.removeCells([mycell]);
                }
            }
        }, {
            "event": "click",
            "eventClass": "ExportMDL",
            js: function() {
                window.location.href = "ajax/severmdl.jsp?status=ExportMDL" + "&MODEL_ID=" + thisModelID + "&GROUP_ID=" + thisGroupId + "&id=" + values[0];
            }

        }
        , {
            "event": "click",
            "eventClass": "importMDL",
            /*action: "send",*/
            //  url: "ajax/severmdl.jsp",
            js: function() {


                getImageLocation("working_directory", function(imageLocaiton) {
                    form.closeWindow();
                    uploadMDL(thisModelID, thisGroupId, values[0], imageLocaiton);
                });
            }


        }



    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "newRouter",
        "title": "Router Properties",
        "content": fields + lineData,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "400", height: "290"
    };
    form._renderWindows();
}



function getnewNodeWindwos(Type, forajax, showLine, values, exists, hasStorage) {
    var returnData = "";
    Type = $.trim(Type);
    if (Type == "server" || Type == "SERVER") {


        returnData += getnewNodeservice(showLine, values, exists, hasStorage);
    } else if (Type == "human" || Type == "HUMAN") {

        returnData += getnewNodehuman(showLine, values);
    } else if (Type == "storage" || Type == "STORAGE") {


        returnData += getnewNodeDisk(showLine, values);
    } else if (Type == "equipment" || Type == "EQUIPMENT" || Type == "vehicle" || Type == "VEHICLE") {

        returnData += getnewNodeEquipment(showLine, values, "serviceTime", Type, "Service time");
    } else if (Type == "router" || Type == "ROUTER") {


        returnData += getnewNodeRouter(showLine, values);
    } else if (Type == "groupLinke" || Type == "GROUPLINKE") {

        returnData += getnewNodeGroupLinke(showLine, values);
    } else if (Type == "switch" || Type == "SWITCH" || Type == "terminal" || Type == "TERMINAL" || Type == "POINT_OF_SALE" || Type == "SMART_PHONE") {

        returnData += getnewNodeEquipment(showLine, values, "responseTime", Type, "Response time");
    }






    return returnData;
}

//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="host">



function  hardwareScenarios(pid, ids, nod_id, sid, modelId) {

//alert(modelId + "," + nod_id);


    var ComplexesLTable = {
        name: "ComplexesLTable",
        "class": "data_grid",
        type: "table",
        rows: ".", pClass: "_50",
        columns: [
            {title: "Complex Name ", type: "div", name: "cName"},
            {title: "Constructor", type: "div", name: "Constructor"},
            {title: "CPU", type: "div", name: "CPU"},
            {title: "# of Processors", type: "div", name: "Processors"}
        ]
    };
    var PartitionsTable = {
        name: "PartitionsTable",
        "class": "data_grid",
        style: "display:none",
        pClass: "_50",
        type: "table",
        rows: "..",
        columns: [
            {title: "Partition Name ", type: "div", name: "pName"},
            {title: "# of Logical Processors", type: "div", name: "LogicalProcessors"}
        ]
    };
    var form = new FormClass("hardwareScenarios");
    form.fields = [
        {
            "title": "List of Complexes",
            "type": "label",
            "name": "loc",
            "value": "List of Complexes", class: "_50"
        }, {
            "title": "",
            "type": "label",
            "name": "poc",
            "value": "", class: "_50"
        },
        ComplexesLTable,
        PartitionsTable

    ];
    var content = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "close",
            "type": "button",
            "name": "closeHW",
            "value": "close"
        },
        {
            "type": "button",
            "name": "updateHW",
            "value": "Update",
            Callback: function(t) {
                form.closeWindow();
            }

        },
        {
            "type": "enddiv"
        }
    ];
    form.events = [
        {
            event: "click",
            eventClass: "updateHW",
            js: function() {




                var comdata = "";
                $(".ComplexesLTable tbody tr").each(function() {

                    comdata += "comid:" + $(this).data("id") + ",";
                    comdata += "cold:" + $(this).children(".constructorTd").data("old") + ",";
                    comdata += "cnew:" + $(this).children().children(".constructorSelect").val() + ",";
                    comdata += "pold:" + $(this).children(".cpuTd").data("old") + ",";
                    comdata += "pnew:" + $(this).children().children(".cpuSelect").val() + ",";
                    comdata += "nold:" + $(this).children(".pnum").data("old") + ",";
                    comdata += "nnew:" + $(this).children(".pnum").text() + ";";
                });
                var idata = "";
                $(".PartitionsTable tbody tr").each(function() {

                    idata += "comid:" + $(this).data("comid") + ",";
                    idata += "id:" + $(this).data("id") + ",";
                    idata += "iold:" + $(this).children().children(".ProcessorsSelect").data("old") + ",";
                    idata += "inew:" + $(this).children().children(".ProcessorsSelect").val() + ";";
                });
                $.get("ajax/views/groupView/hardwareScenariosWidows.jsp?mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" +
                        sid + "&DBinststatus=1&status=update&partitionsData=" + idata + "" + "&complexeslData=" + comdata + "", function(data) {
                            $(".PartitionsTable").html($.trim(data));
                            form.closeWindow();
                        });
            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "closeHW",
            Callback: function(t) {

            }



        }

    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "hardwareScenarios",
        "title": "Hardware Scenarios",
        "content": content,
        "footerContent": footer,
        "x": "600",
        "y": "90",
        width: "800", height: "450", load: function(id) {



            var g = true;
            $(document).on("click", ".ComplexesLTable tr", function() {


                $(".PartitionsTable").show();
                $(".ComplexesLTable tr").removeClass("act");
                $(this).addClass("act");
                var p = $(this);
                $(".poc").text("Partitions in " + p.find(".Complex_Name").text());
                /*$.get("ajax/views/groupView/hardwareScenariosWidows.jsp?mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getPartitions&com_id=" + $(this).data("id") + "&proid=" + $(this).find(".pnum").text(), function(data) {
                 $(".PartitionsTable tbody").html($.trim(data));
                 
                 
                 });*/

                if (g) {
                    $(document).trigger("loadp", [$(this).data("id"), "Event"]);
                    g = false;
                } else {


                    $(".PartitionsTable tbody tr").hide();
                    $(".PartitionsTable tbody ._" + $(this).data("id")).show();
                }




            })













            $(document).on("change", ".constructorSelect", function() {

                var p = $(this).parents("tr");
                $.get("ajax/views/groupView/hardwareScenariosWidows.jsp?mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getCPU&constructorIndex=" + $(this).val() + "&com_id=" + $(this).data("comid"), function(data) {
                    p.find(".cpuSelect").html($.trim(data));
                });
            })


            $(document).on("change", ".cpuSelect", function() {
                var p = $(this).parents("tr");
                $.get("ajax/views/groupView/hardwareScenariosWidows.jsp?mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=pnumbyselect&constructorIndex=" + p.find(".constructorSelect").val() + "&com_id=" + p.find(".constructorSelect").data("comid") + "&cupIndex=" + p.find(".cpuSelect").val(), function(data) {
                    p.find(".pnum").html($.trim(data));
                    var c = p.find(".constructorSelect").data("comid");
                    $("._" + c + " .ProcessorsSelect").each(function() {

                        var s = parseFloat($.trim($(this).data("old")));
                        var h = "";
                        var isup = false;
                        for (var i = 1; i <= parseFloat($.trim(data)); i++) {
                            var m = "";
                            var myv = i;
                            if (s === myv) {
                                m = "selected";
                                isup = true;
                            } else {


                                m = "";
                            }

                            if (!isup && s > parseFloat($.trim(data)) && parseFloat($.trim(data)) === myv) {

                                m = "selected";
                            }

                            h += "<option " + m + " value='" + myv + "'> " + myv + "</option>";
                        }

                        $(this).html(h);
                    });
                });
            })




            $(document).unbind("loadp");
            $(document).bind("loadp");
            $.ajaxSetup({async: false});
            $(document).on("loadp", function(event, id, param2) {

                $(".PartitionsTable tbody").html("");
                $(".ComplexesLTable tr").each(function() {

                    var p = $(this);
                    $.ajax({
                        type: 'POST',
                        url: "ajax/views/groupView/hardwareScenariosWidows.jsp",
                        data: {mod_id: modelId, pid: pid, ids: ids, nod_id: nod_id, sid: sid, status: "getPartitions", com_id: p.data("id"), proid: p.find(".pnum").text()}, // "mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getPartitions&com_id=" + $(this).data("id") + "&proid=" + $(this).find(".pnum").text(),
                        cache: false,
                        success: function(result) {

                            $(".PartitionsTable tbody").append($.trim(result));
                            $(".PartitionsTable tbody tr").hide();
                            $(".PartitionsTable tbody ._" + id).show();
                        },
                    });
                })





            });
            $.get("ajax/views/groupView/hardwareScenariosWidows.jsp?mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getCOMPLEX", function(data) {
                $(".ComplexesLTable tbody").html($.trim(data));
                var i = 1;
                $(".constructorSelect").each(function() {

                    var t = $(this);
                    var p = t.parents("tr");
                    $.get("ajax/views/groupView/hardwareScenariosWidows.jsp?mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getCPU&constructorIndex=" + t.val() + "&com_id=" + t.data("comid"), function(adata) {
                        p.find(".cpuSelect").html($.trim(adata));
                        $.ajax({
                            type: 'POST',
                            url: "ajax/views/groupView/hardwareScenariosWidows.jsp",
                            data: {mod_id: modelId, pid: pid, ids: ids, nod_id: nod_id, sid: sid, status: "pnum", constructorIndex: t.val(), com_id: p.find(".constructorSelect").data("comid"), cupIndex: p.find(".cpuSelect").val()}, // "mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getPartitions&com_id=" + $(this).data("id") + "&proid=" + $(this).find(".pnum").text(),
                            cache: false,
                            success: function(result) {

                                p.find(".pnum").html($.trim(result));
                                p.find(".pnum").data("old", $.trim(result));
                            },
                        });
                        /*
                         $.get("ajax/views/groupView/hardwareScenariosWidows.jsp?mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=pnum&constructorIndex=" + t.val() + "&com_id=" + $(".constructorSelect").data("comid") + "&cupIndex=" + p.find(".cpuSelect").val(), function(bdata) {
                         
                         })*/
                    });
                });
            });
        }
    };
    form._renderWindows();
}


function createNewAci(modid, lsId, r_data, servers, nodeData, nod_id) {


    /*
     * 
     * DGRP Overlap
     Mean Log Required
     Distance
     Mean IO
     Temperature
     Failover Delay
     */


    var nodeData = nodeData.split(",");
    var f = new FormClass("createNewAci");
    f.fields = [{
            type: "select",
            name: "allLogicalServers",
            options: servers,
            value: lsId,
            title: "Select server",
            pClass: "_50"

        }, {
            type: "select",
            name: "acds",
            options: r_data,
            title: "Select ACD",
            pClass: "_50",
            required: "required"

        }, {
            type: "select",
            name: "logicaldrive",
            options: nodeData[5],
            title: "logical drive",
            pClass: "_50"

        }, {
            type: "text",
            title: "instance name",
            name: "instName",
            pClass: "_50",
            required: "required"
        }, {
            type: "number",
            title: "Streams",
            name: "multiPro",
            pClass: "_50",
            value: "1"
        }, {
            type: "hidden",
            title: "Arrival Rate",
            name: "arrivalRate",
            pClass: "_50",
            value: 1
        }, {
            type: "number",
            title: "CPU",
            name: "totlaCPU",
            pClass: "_50",
            value: 1
        }, {
            type: "number",
            title: "IO",
            name: "dasdIo",
            pClass: "_50",
            value: 1

        }, {
            type: "number",
            title: "Mean Aux Delay",
            name: "auxDelayMean",
            pClass: "_50 hidden",
            value: 0
        }, {
            type: "number",
            title: "Delay Time",
            name: "auxDelayAvg",
            pClass: "_50",
            value: 0
        }, {
            type: "hidden",
            title: "DGRP Overlap",
            name: "dgrp",
            pClass: "_50",
            value: 0
        }, {
            type: "hidden",
            title: "Mean IO",
            name: "MEAN_IO",
            pClass: "_50",
            value: 0
        }, {
            type: "hidden",
            title: "Mean Log Required",
            name: "MEAN_LOG_REQ",
            pClass: "_50",
            value: 0
        }, {
            type: "hidden",
            title: "Temperature",
            name: "TEMP",
            pClass: "_50",
            value: 0
        }, {
            type: "hidden",
            title: "Distance",
            name: "Distance",
            pClass: "_50",
            value: 1
        }, {
            type: "hidden",
            title: "Failover Delay",
            name: "failDelay",
            pClass: "_50",
            value: 1
        }];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        },
        {
            "value": "Ok",
            "type": "button",
            "name": "newAciOk",
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newAciCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "newAciCancel"
        }, {
            event: "click",
            eventClass: "newAciOk",
            action: "send",
            url: "ajax/views/groupView/saveAci.jsp",
            options: {mid: modid, nod_id: nod_id},
            done: function(out) {
                alert("ACI created successfully");
                if ($.trim(lsId) === $.trim($(".allLogicalServers").val())) {
                    $(".ACIs").append("<option value='" + out.split('_')[1] + "'>" + $.trim($(".instName").val()) + "</option>");
                    serComponentTable("", "null", nod_id, lsId, modid);
                }
                showMyloading(".main", "end");
                f.closeWindow();
            }

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "newACI",
        "title": "New Application instance",
        "content": content,
        "footerContent": footer,
        "x": "300",
        "position": "Center",
        "y": "190",
        width: "750", height: "230"
    };
    f._renderWindows();
}




function createNewAciEdit(modid, lsId, r_data, servers, nodeData, nod_id, id, data, modelId) {




    var f = new FormClass("createNewAci");
    f.fields = [{
            type: "text",
            title: "instance name",
            name: "INST_NAME",
            pClass: "_50",
            required: "required", value: data[6]
        }, {
            type: "number",
            title: "CPU",
            name: "TOTAL_CPU",
            pClass: "_50",
            value: data[9]
        }, {
            type: "number",
            title: "IO",
            name: "MEAN_DASD_IO",
            pClass: "_50",
            value: data[10]

        }, {
            type: "number",
            title: "Streams",
            name: "INST_MULTIPRO",
            pClass: "_50",
            value: data[7]
        }, {
            type: "number",
            title: "Delay Time",
            name: "AVG_AUX_DELAY",
            pClass: "_50",
            value: data[12]
        }, {
            type: "number",
            title: "# of Delays",
            name: "MEAN_AUX_DELAY",
            pClass: "_50",
            value: data[11]
        }];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        },
        {
            "value": "Ok",
            "type": "button",
            "name": "newAciOk",
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newAciCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "newAciCancel", "Callback": null
        }, {
            event: "click",
            eventClass: "newAciOk",
            action: "send",
            url: "ajax/views/groupView/host.jsp",
            options: {mid: modid, nod_id: nod_id, status: "updateaci", id: id},
            done: function(out) {
                alert("ACI updated successfully");
                serComponentTable("", "null", nod_id, lsId, modelId);
                showMyloading(".main", "end");
                f.closeWindow();
            }

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "EditACI",
        "title": "Edit Application instance",
        "content": content,
        "footerContent": footer,
        "x": "300",
        "position": "Center",
        "y": "190",
        width: "750", height: "230"
    };
    f._renderWindows();
}












function SoftwareLocksTableUpdet(modid, sid, acid) {

    $(".SoftwareLocksTable tbody").html("");
    $.get("ajax/views/groupView/host.jsp?nod_id=&modid=" + modid + "&sid=" + sid + "&acid=" + acid + "&status=getSoftweraLoackTable", function(data) {
        $(".SoftwareLocksTable tbody").html($.trim(data));
    });

}
function SoftwareLocksNewWindows(modid, sid, acid, ServerText, ServerId, complex) {
    var f = new FormClass("SoftwareLocksNew");
    f.fields = [{
            type: "text",
            title: "Lock Name",
            name: "NAME",
            required: "required"
        }, {
            type: "select",
            name: "AC_INST_ID",
            options: "0",
            title: "Application Instance",
            required: "required"

        }, {
            type: "number",
            title: "Proportion",
            name: "PROPORTION",
            value: "1"
        }];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        },
        {
            "value": "Ok",
            "type": "button",
            "name": "SoftwareLocksOk",
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "SoftwareLocksCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "SoftwareLocksCancel"
        }, {
            event: "click",
            eventClass: "SoftwareLocksOk",
            action: "send",
            url: "ajax/views/groupView/host.jsp",
            options: {mid: modid, nod_id: "", sid: sid, LOCK_COMPONENT_INST_ID: acid, status: "getSoftweraLoackInsert"},
            done: function(out) {
                alert("Software lock created successfully");
                SoftwareLocksTableUpdet(modid, sid, acid);
                showMyloading(".main", "end");
                f.closeWindow();
            }

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "SoftwareLocksNew",
        "title": "Create New Software Lock",
        "content": content,
        "footerContent": footer,
        "x": "300",
        "position": "Center", load: function() {


            $.get("ajax/views/groupView/host.jsp?acid=" + acid + "&ServerId=" + ServerId + "&id=" + $(".SoftwareLocksTable tr.act").data("value") + "&status=LOCK_COMPONENT_Data&selected=-1", function(data) {
                $(".AC_INST_ID").html(data);


            });

        },
        "y": "190",
        width: "750", height: "230"
    };
    f._renderWindows();


}






function SoftwareLocksUpdateWindows(modid, sid, acid, ServerText, ServerId, complex, data, id) {

    var data = data.split(",");

    var f = new FormClass("SoftwareLocksUpdate");
    f.fields = [{
            type: "text",
            title: "Lock Name",
            name: "NAME", value: data[0],
            required: "required"
        }, {
            type: "select",
            name: "AC_INST_ID",
            options: "0",
            title: "Application Instance",
            required: "required"

        }, {
            type: "number",
            title: "Proportion",
            name: "PROPORTION",
            value: data[2]
        }];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        },
        {
            "value": "Ok",
            "type": "button",
            "name": "SoftwareLocksOk",
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "SoftwareLocksCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "SoftwareLocksCancel"
        }, {
            event: "click",
            eventClass: "SoftwareLocksOk",
            action: "send",
            url: "ajax/views/groupView/host.jsp",
            options: {mid: modid, nod_id: "", id: id, sid: sid, LOCK_COMPONENT_INST_ID: acid, status: "getSoftweraLoackUpdate"},
            done: function(out) {
                alert("Software lock updated successfully");
                SoftwareLocksTableUpdet(modid, sid, acid);
                showMyloading(".main", "end");
                f.closeWindow();
            }

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "SoftwareLocksUpdate",
        "title": "Edit Software Lock",
        "content": content,
        "footerContent": footer,
        "x": "300",
        "position": "Center", load: function() {
            $.get("ajax/views/groupView/host.jsp?acid=" + acid + "&ServerId=" + ServerId + "&id=" + $(".SoftwareLocksTable tr.act").data("value") + "&status=LOCK_COMPONENT_Data&selected=" + data[1], function(mdata) {
                $(".AC_INST_ID").html(mdata);
            });
        },
        "y": "190",
        width: "750", height: "230"
    };
    f._renderWindows();


}





function SoftwareLocksWindow(modid, sid, acid, ServerText, ServerId, complex, name) {



    var SoftwareLocksTable = {
        name: "SoftwareLocksTable",
        "class": "data_grid",
        type: "table",
        rows: ".",
        columns: [
            {title: "Lock Name", type: "div", name: "Application Name"},
            {title: "Application Instance Name", type: "div", name: "CPU"},
            {title: "Proportion", type: "div", name: "Proportion"}
        ]
    };
    // var nodeData = nodeData.split(",");
    var f = new FormClass("SoftwareLocks");
    f.fields = [{
            type: "label",
            title: "Software Locks for " + name,
            name: "INST_NAME",
            pClass: "_100"
        }, SoftwareLocksTable];
    f._addTofields([{
            "type": "button",
            "name": "newSoftwareLocks",
            "value": "New"
        }, {
            "type": "button",
            "name": "editSoftwareLocks",
            "value": "Edit"
        }, {
            "type": "button",
            "name": "deleteSoftwareLocks",
            "value": "Delete"
        }
    ]);
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Close",
            "type": "button",
            "name": "SoftwareLockscancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "SoftwareLockscancel"
        }, {
            "event": "click"
            , "eventClass": "newSoftwareLocks",
            js: function() {


                SoftwareLocksNewWindows(modid, sid, acid, ServerText, ServerId, complex);


            }
        }, {
            "event": "click"
            , "eventClass": "editSoftwareLocks",
            js: function() {
                var id = $(".SoftwareLocksTable tr.act").data("value");
                if (id) {
                    $.get("ajax/views/groupView/host.jsp?id=" + id + "&nod_id=&status=getSoftweraLoackdata", function(data) {
                        SoftwareLocksUpdateWindows(modid, sid, acid, ServerText, ServerId, complex, data, id);

                    });

                } else {
                    alert("Please select a software lock to edit!");
                }






            }
        }, {"event": "click"
            , "eventClass": "SoftwareLocksTable tr",
            js: function(event) {
                var me = $(event.currentTarget);
                $(".SoftwareLocksTable tr").removeClass("act");
                me.addClass("act");
            }
        }, {
            "event": "click"
            , "eventClass": "deleteSoftwareLocks",
            js: function() {

                var id = $(".SoftwareLocksTable tr.act").data("value");
                if (id) {
                    $.get("ajax/views/groupView/host.jsp?id=" + id + "&nod_id=&status=getSoftweraLoackDelete", function() {
                        $(".SoftwareLocksTable tr.act").remove();


                    });
                } else {
                    alert("Please select a software lock to delete!");
                }


            }
        }

    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "EditACI",
        "title": "Software Locks",
        "content": content,
        "footerContent": footer,
        "x": "300",
        "position": "Center",
        "y": "190", load: function(id) {
            SoftwareLocksTableUpdet(modid, sid, acid);
        },
        width: "750", height: "230"
    };
    f._renderWindows();
}






function EditACIScenarios(modid, lsId, sid, servers, nodeData, nod_id, id, data, modelId, newval) {




    var nodeData = nodeData.split(",");
    var f = new FormClass("createNewAci");
    f.fields = [
        {
            type: "text",
            title: "instance name",
            name: "INST_NAME",
            pClass: "_100", readonly: true,
            required: "required", value: data[6]
        }, {
            "title": "-",
            "type": "headerupdate",
            "name": "headerupdate"
        }, {
            type: "numberupdate",
            title: "Streams",
            name: "INST_MULTIPRO",
            pClass: "_100",
            value: data[7], newvalue: data[24]
        }];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        },
        {
            "value": "Ok",
            "type": "button",
            "name": "newAciOk",
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newAciCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "newAciCancel"
        }, {
            event: "click",
            eventClass: "newAciOk",
            action: "send",
            url: "ajax/views/groupView/host.jsp",
            options: {sid: sid, mod_id: modid, nod_id: nod_id, status: "updateaciscenario", id: id},
            done: function(out) {
                alert("ACI updated successfully");
                serComponentTable("", sid, nod_id, lsId, modelId);
                showMyloading(".main", "end");
                f.closeWindow();
            }

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "EditACI",
        "title": "Application Component Instance Scenario",
        "content": content,
        "footerContent": footer,
        "x": "300",
        "position": "Center",
        "y": "190",
        width: "570", height: "170"
    };
    f._renderWindows();
}


function hostdialogueWindows(pid, ids, nod_id, sid, serverCount, gtenodeName) {
    var modelId = ids.split("/")[3];
    var form = new FormClass("DB_NAMEEWidowsAdd");
    var serComponentTable = {
        name: "serComponent",
        "class": "data_grid",
        type: "table",
        rows: ".",
        columns: [
            {title: "Application Name", type: "div", name: "Application Name"},
            {title: "CPU", type: "div", name: "CPU"},
            {title: "IO", type: "div", name: "IO"},
            {title: "Streams", type: "div", name: "MPL"},
            {title: "Delay", type: "div", name: "Delay"},
            {title: "No of Delays", type: "div", name: "NoofDelays"}
            /*,{title: "Logical Drive", type: "div", name: "LogicalDrive"}*/
        ]
    };
    if ($.trim(serverCount) != "0") {
        form.fields = [
            {
                "title": "Node Name:",
                "type": "text",
                "name": "name", readonly: true, value: gtenodeName
            }
            , {
                "title": "Complex:",
                "type": "select",
                "name": "complex",
                options: "0__0"
            },
            {"title": "Number of Processors:",
                "type": "text",
                "name": "NumberofProcessors", readonly: true,
            },
            {"title": "Power:",
                "type": "text",
                "name": "power", readonly: true
            },
            {"title": "Manufacturer:",
                "type": "text",
                "name": "manufacturer", readonly: true,
            },
            {"title": "Model:",
                "type": "text",
                "name": "model", readonly: true,
            },
            {
                title: "",
                type: "border",
                name: "Namespaceborder111"
            }
            , {
                "title": "Server instance :",
                "type": "select",
                "name": "log_servers",
                options: "0__0"
            }]



        if (sid !== "null" && sid !== null) {

            form._addTofields([{
                    "type": "button",
                    "name": "hwScenarios",
                    "value": "Hardware Scenarios"
                }]);
        } else {


            form._addTofields([{
                    "type": "button",
                    "name": "createServer",
                    "value": "Manage Servers"
                }
                , {
                    "type": "button",
                    "name": "createAcd",
                    "value": "Manage ACD"
                }]);





        }





        form._addTofields([{
                "type": "button",
                "name": "DBinst",
                "value": "DB inst"
            }
            , {
                "title": "Virtualized:",
                "type": "checkbox",
                "name": "Virtualized", readonly: true
            }
            , {"title": "Logical Processor:",
                "type": "text",
                "name": "LogicalProcessor", readonly: true
            }, {
                "type": "line",
                "name": "createGroupAciline",
                styel: "margrin-top:10px;",
                "value": "Create ACI", "class": "_100"
            }]);
        if (sid !== "null" && sid !== null) {
            form._addTofields([{
                    "type": "button",
                    "name": "acieditScenarios",
                    "value": "Edit Streams"
                }, {
                    "type": "button",
                    "name": "getsqlScenarios",
                    "value": "SQL Scenarios"
                }





            ]);
        } else {



            form._addTofields([{
                    "type": "button",
                    "name": "createGroupAci",
                    styel: "margrin-top:10px;",
                    "value": "Create ACI", "class": "_25"
                }, {
                    "type": "button",
                    "name": "EditAci",
                    styel: "margrin-top:10px;",
                    "value": "Edit ", "class": "_25"
                }, {
                    "type": "button",
                    "name": "getsql",
                    styel: "margrin-top:10px;",
                    "value": "SQL", "class": "_25"
                }, {
                    "type": "button",
                    "name": "deleteAci",
                    "value": "Delete ACI", "class": "_25"
                }, {
                    "type": "button",
                    "name": "Lock",
                    "value": "Locks", "class": "_25"
                }
            ]);
        }

        form._addTofields([serComponentTable,
            {
                "type": "endborder",
                "name": "endborder1111"
            }
        ]);
    } else {

        form.fields = [
            {
                "title": "No MDL Data Found for This Node",
                "type": "label",
                "name": "name"
            }

        ];
    }




    var content = form._renderhtml();
    form.events = [
        {
            "event": "change"
            , "eventClass": "complex",
            js: function() {

                updatecomplexData(pid, ids, nod_id, sid, $(".complex").val(), modelId);
            }
        }, {
            "event": "change"
            , "eventClass": "log_servers",
            js: function() {

                updatelog_serversdata(pid, ids, nod_id, sid, $(".complex").val(), $(".log_servers").val(), modelId);
            }
        }, {
            "event": "click"
            , "eventClass": "Lock",
            js: function() {
                var ServerId = $(".log_servers").val();
                var complex = $(".complex").val();
                var ServerText = $(".log_servers  option:selected").text();

                var acid = $(".serComponent tr.act").data("value");


                if (!acid) {
                    alert("No application component selected!");
                } else {
                    SoftwareLocksWindow(modelId, sid, acid, ServerText, ServerId, complex, $(".serComponent tr.act").data("name")); //, 350, 120, 600, null);
                }

            }
        }
//

        ,
        {
            "event": "click"
            , "eventClass": "acieditScenarios",
            js: function() {


                var selectedlsId = $(".log_servers  option:selected").val();
                var myID = $(".serComponent tr.act").data("value");

                if (!myID) {
                    alert("No application component selected!");
                } else {
                    $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modelId + "&lsiId=" + $(".log_servers  option:selected").val() + "&status=allServers", function(allServers) {

                        $.get("ajax/views/groupView/host.jsp?pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getConnectedStorageNode", function(cnodiddata) {

                            $.get("ajax/views/groupView/storageProberties.jsp?mid=" + modelId + "&nod_id=" + cnodiddata, function(nodeData) {
                                $.get("ajax/views/groupView/host.jsp?mod_id=" + modelId + "&sid=" + sid + "&id=" + myID + "&status=getSerComponentDatascenarios", function(myData) {
                                    myData = myData.replace("]", "");
                                    myData = myData.replace("[", "");
                                    myData = myData.split(",");
                                    EditACIScenarios(modelId, selectedlsId, sid, allServers, nodeData, nod_id, myID, myData, modelId);
                                });
                            });
                        });
                    });
                }
    }
        }

        ,
        {
            "event": "click"
            , "eventClass": "createAcd",
            js: function() {


                var server = $(".log_servers").val();
                var complex = $(".complex").val();
                var selectedServer = $(".log_servers  option:selected").text();
                //addAcd(complex, nod_id, modelId, server)    $.get("ajax/createAcd.jsp?complexId=" + $(".complex").val() + "&nodeId=" + nod_id + "&modelId=" + modelId + "&serverId=" + server, function(mdata) {

                makeWinDows("Add Application Description", "addAcd", addAcd(complex, nod_id, modelId, server, selectedServer), 350, 120, 600, null);
      }
  },
        {
            "event": "click"
            , "eventClass": "EditAci",
            js: function() {


                var selectedlsId = $(".log_servers  option:selected").val();
                var myID = $(".serComponent tr.act").data("value");


                if (!myID) {
                    alert("No application component selected!");
                } else {
                    $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modelId + "&lsiId=" + $(".log_servers  option:selected").val() + "&status=getACD", function(r_data) {
                        $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modelId + "&lsiId=" + $(".log_servers  option:selected").val() + "&status=allServers", function(allServers) {
                            $.get("ajax/views/groupView/host.jsp?pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getConnectedStorageNode", function(cnodiddata) {
                                $.get("ajax/views/groupView/storageProberties.jsp?mid=" + modelId + "&nod_id=" + cnodiddata, function(nodeData) {
                                    $.get("ajax/views/groupView/host.jsp?id=" + myID + "&status=getSerComponentData", function(myData) {
                                        myData = myData.replace("]", "");
                                        myData = myData.replace("[", "");
                                        myData = myData.split(",");
                                        createNewAciEdit(modelId, selectedlsId, r_data, allServers, nodeData, nod_id, myID, myData, modelId);
                                    });
                                });
                            });
                        });
                    });
                }
            }
        },
        {
            "event": "click"
            , "eventClass": "getsql",
            js: function() {




                var ACIID = $(".serComponent tr.act").data("value");
                var SERVER_INST_ID = $(".serComponent tr.act").data("server");

                if (!ACIID) {
                    alert("No application component selected!");
                } else {
                    $.get("ajax/views/groupView/SQLApplicationActions.jsp?mod_id=" + modelId + "&ACI_ID=" + ACIID + "&status=getsqlid", function(data) {
                        var ds = $.trim(data).split(";");
                        var sqlInfo = "";



                        SqlApplicationWindows(sqlInfo, modelId, ds[0], ds[1], SERVER_INST_ID, ACIID, $(".log_servers").val(), sid, ids);

                    });
                }
            }}


        ,
        {
            "event": "click"
            , "eventClass": "getsqlScenarios",
            js: function() {




                var ACIID = $(".serComponent tr.act").data("value");
                var SERVER_INST_ID = $(".serComponent tr.act").data("server");

                if (!ACIID) {
                    alert("No application component selected!");
                } else {
                    $.get("ajax/views/groupView/SQLApplicationActions.jsp?mod_id=" + modelId + "&ACI_ID=" + ACIID + "&status=getsqlid", function(data) {
                        var ds = $.trim(data).split(";");
                        var sqlInfo = "";



                        SqlApplicationWindows(sqlInfo, modelId, ds[0], ds[1], SERVER_INST_ID, ACIID, $(".log_servers").val(), sid, ids);

                    });
                }
            }}




        , {
            "event": "click"
            , "eventClass": "DBinst",
            js: function() {



                $.get("ajax/views/groupView/dbinst.jsp?status=DBinstances&id=" + $(".log_servers").val(), function(DBinstances) {
                    $.get("ajax/views/groupView/dbinst.jsp?status=DBinstancesName&id=" + $(".log_servers").val(), function(DBinstancesName) {
                        $.get("ajax/views/groupView/dbinst.jsp?status=DBinstancestype&id=" + $(".log_servers").val(), function(type) {
                            dbinst(pid, ids, $(".log_servers").val(), $(".complex").val(), $(".SERVER_INST_ID").val(), DBinstances, DBinstancesName, type, $(".DBinststatus").val());
                        })
                    })
                })


            }
        }
        ,
        {
            "event": "click"
            , "eventClass": "serComponent tr",
            js: function(event) {
                var me = $(event.currentTarget);
                $(".serComponent tr").removeClass("act");
                me.addClass("act");
            }
        }
        ,
        {
            "event": "click"
            , "eventClass": "hwScenarios",
            js: function() {

                hardwareScenarios(pid, ids, nod_id, sid, modelId);
            }

        }
        ,
        {
            "event": "click"
            , "eventClass": "createGroupAci",
            js: function() {


                var selectedlsId = $(".log_servers  option:selected").val();
                $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modelId + "&lsiId=" + $(".log_servers  option:selected").val() + "&status=getACD", function(r_data) {
                    $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modelId + "&lsiId=" + $(".log_servers  option:selected").val() + "&status=allServers", function(allServers) {

                        $.get("ajax/views/groupView/host.jsp?pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getConnectedStorageNode", function(cnodiddata) {

                            $.get("ajax/views/groupView/storageProberties.jsp?mid=" + modelId + "&nod_id=" + cnodiddata, function(nodeData) {

                                createNewAci(modelId, selectedlsId, r_data, allServers, nodeData, nod_id);
                            });
                        });
                    });
                });
            }
        }, {
            "event": "click"
            , "eventClass": "deleteAci",
            js: function() {

                var id = $(".serComponent tr.act").data("value");

                if (!id) {
                    alert("No application component selected!");
                } else {

                    $.get("ajax/createAci.jsp?id=" + id + "&status=delete", function(mdata) {

                        $(".serComponent tr.act").remove();
                    })
                }

            }
        }, {
            "event": "click"
            , "eventClass": "createServer",
            js: function() {
                var complexId = $(".complex").val();


                var maxProcessors = $(".NumberofProcessors").val();
                makeWinDows("Add Server Image", "addServer", addServer(complexId, modelId, $(".complex option:selected").text(), maxProcessors, nod_id), 550, 120, 700, null);
            }
        }, {
            "event": "click"
            , "eventClass": "cancelHost",
            js: function() {
                form.closeWindow();
            }
        }
    ];
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100"

        },
        {
            "title": "close",
            "type": "button",
            "name": "cancelHost",
            "value": "close"
        },
        {
            "type": "enddiv"
        }
    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "addDB_NAME",
        "title": "Host Dialog",
        "content": content,
        "footerContent": footer,
        "x": "600",
        "y": "90",
        width: "500", height: "530", load: function(id) {
            updateComlpex(pid, ids, nod_id, sid, modelId);
        }
    };
    form._renderWindows();
}



function  updateComlpex(pid, ids, nod_id, sid, modelId) {
    $(".complex").html("");
    $(".log_servers").html("");
    //  $(".serComponent").html("");
    $(".NumberofProcessors").val("");
    $(".power").val("");
    $(".manufacturer").val("");
    $(".model").val("");
    $.get("ajax/views/groupView/host.jsp?mod_id=" + modelId + "&pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getCOMPLEX", function(data) {
        $(".complex").html($.trim(data));
        if ($(".complex option").size() > 1) {


            $(".complex option").eq(1).prop('selected', true);
            updatecomplexData(pid, ids, nod_id, sid, $(".complex option").eq(1).val(), modelId);
        }

    });
}


function updatelog_serversdata(pid, ids, nod_id, sid, comid, logServer, modelId) {

    $(".DBinst").hide();
    $(".LogicalProcessor").val("");
    $(".Virtualized").removeAttr("chacked");
    $.get("ajax/views/groupView/host.jsp?pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getlogServerData&logServer=" + logServer, function(data) {
        var se = data.split(",");
        $(".LogicalProcessor").val(se[0]);
        if (se[1] == "chacked") {

            $(".Virtualized").attr("chacked", "chacked");
        } else {
            $(".Virtualized").removeAttr("chacked");
        }

        serComponentTable(pid, sid, nod_id, logServer, modelId);
    });
}


function serComponentTable(pid, sid, nod_id, logServer, modelId) {
    $(".serComponent tbody").html("");
    $.get("ajax/views/groupView/host.jsp?mod_id=" + modelId + "&pid=" + pid + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getSerComponentlist&logServer=" + logServer, function(getSerComponentlist) {
        $(".serComponent tbody").html($.trim(getSerComponentlist));
        updateDBinstShowStatus(nod_id);
    });
}


function updatecomplexData(pid, ids, nod_id, sid, comid, modelId) {

    $(".log_servers").html("");
    // $(".serComponent").html("");


    $(".NumberofProcessors").val("");
    $(".power").val("");
    $(".manufacturer").val("");
    $(".model").val("");
    $.get("ajax/views/groupView/host.jsp?pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getcomlpexdata&com_id=" + comid + "&mod_id=" + modelId, function(Comlpexdata) {


        var coms = Comlpexdata.split(",");
        $(".NumberofProcessors").val(coms[0]);
        $(".power").val(coms[1]);
        $(".manufacturer").val(coms[2]);
        $(".model").val(coms[3]);
        $.get("ajax/views/groupView/host.jsp?pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=getlogServerList&com_id=" + comid + "&mod_id=" + modelId, function(getlogServerList) {

            $(".log_servers").html(getlogServerList);
            $(".log_servers  option").eq(1).prop('selected', true);
            updatelog_serversdata(pid, ids, nod_id, sid, $(".complex").val(), $(".log_servers  option").eq(1).val(), modelId);
            updateDBinstShowStatus(nod_id);
        });
    });
}


function updateDBinstShowStatus(nod_id) {

    $(".DBinst").hide();
    $.get("ajax/views/groupView/dbinst_check.jsp?&complex=" + $(".complex").val() + "&log_servers=" + $(".log_servers").val() + "&complex=" + $(".complex").val() + "&node_id=" + nod_id, function(smdata) {
        if (($.trim(smdata) === "1" || $.trim(smdata) === "2")) {

            $(".DBinst").show();
        } else {

            $(".DBinst").hide();
        }


    })


    if ($(".log_servers").val() == "") {
        $(".DBinst").hide();
    }
}


function hostdialogue_show_fun(pid, ids, nod_id, sid) {



    $(".hostdialogue_show_bt").click(function() {

        $.get("ajax/views/groupView/host.jsp?pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=servercount", function(serverCount) {

            $.get("ajax/views/groupView/host.jsp?pid=" + pid + "&ids=" + ids + "&nod_id=" + nod_id + "&sid=" + sid + "&DBinststatus=1&status=gtenodeName", function(gtenodeName) {

                hostdialogueWindows(pid, ids, nod_id, sid, serverCount, gtenodeName);
            });
        });
    })

    $(".nodeExtension_show_bt").click(function() {
        $.get("ajax/views/groupView/nodeExtension.jsp?nod_id=" + nod_id, function(data) {

            makeWinDows("Node Extension", "nodeExtensionWindow", nodeExtension_windows_data(data), 250, 100, 450, 250);
            $("div.mxWindowPane").css("height", "auto");
        })

    })




}

function hostdialogue_windows_data(pid, data2, ids) {

    /*
     var data = "<script>";
     data += " hostdialogue_windows_do('" + pid + "','" + ids + "');</script>\n\
     <div style ='' class=\"mydata\"><div class='windowstitle'></div>\n\
     <div class='comdata'>" + data2 + "</div>\n\
     </div>   <div class=\"do_center\"><input type=\"button\" class=\"host_Resources_Close_bt\"  value=\"Close\"></div>";
     return data;*/
}



function nodeExtension_windows_data(data2) {


    var data = "<script>";
    data += " nodeExtension_windows_do();</script><div class='view_pre mydata'>";
    data += data2;
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("Update", "button", "nodeExtension_Ok_bt");
    data += CreateFiled("Cancel", "button", "nodeExtension_Close_bt", "", "_50");
    data += "</div>";
    return data;
}


//</editor-fold>


//</editor-fold>
