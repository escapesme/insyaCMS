/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function scenarioParamters(DataTable) {


    var rows = [];
    DataTable = DataTable.split("__");
    for (var i = 0; i < DataTable.length; i++) {

        var myaddRow = DataTable[i].split(";")
        if ($.trim(myaddRow[1]) != "" && $.trim(myaddRow[1]) != "null") {
            var tempRow = [];

            tempRow.push(myaddRow[0]);
            tempRow.push(myaddRow[1]);
            tempRow.push(myaddRow[2]);
            tempRow.push(myaddRow[3]);


            rows.push(tempRow);
        }

    }


    var table = {
        name: "scenarioTable",
        type: "table",
        rows: rows,
        columns: [
            {title: "Name", type: "div"},
            {title: "Object", type: "div"},
            {title: "Default Value", type: "div"},
            {title: "Adjusted Value", type: "div"}
        ]
    };
    var f = new FormClass("scnearioParams");
    f.fields = [table];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        }, {
            type: "button",
            value: "close",
            name: "scenarioparamsClose"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "scenarioparamsClose"
        }];
    var footer = f._renderhtml();
    f.windows = {
        "class": "scenarioParams",
        "title": "scenario parameters",
        "content": content,
        "footerContent": footer,
        "x": "200",
        "y": "190",
        "position": "Center",
        width: "600", height: "290"
    };
    f._renderWindows();

}
function scnearioProperties(id, pro_id, model_Id, row) {

    row = row.split("__");

    var f = new FormClass("scenarioDetails");
    f.fields = [{
            type: "text",
            value: $.trim(row[3]),
            name: "name",
            title: "name",
            required: "required"
        }, {
            type: "textarea",
            value: $.trim(row[4]),
            name: "description",
            title: "description",
            options: ""
        }, {
            type: "checkbox",
            value: $.trim(row[5]),
            name: "locked",
            title: "locked"

        }];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "editScenarioOk",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "editScenarioCancel",
            "value": "cancel"
        },
        {
            "title": "view details",
            "type": "button",
            "name": "editScenarioView",
            "value": "view details"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "editScenarioCancel"
        }, {
            action: "send",
            event: "click",
            eventClass: "editScenarioOk",
            url: "ajax/xact/updateScenario.jsp",
            done: function() {
                alert("Scenario updated successfully");
                UpdateCorporate(model_Id, id);
                f.closeWindow();
                updateModleTreeview(pro_id);

            },
            options: {sid: id}
        }, {
            event: "click",
            eventClass: "editScenarioView",
            repeat: "one",
            js: function() {
                $.get("ajax/scenario/getScenarioParamters.jsp?id=" + id, function(data) {
                    f.closeWindow();
                    scenarioParamters(data);

                });
            }
        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "scenarioDetail",
        "title": "scenario detail",
        "content": content,
        "footerContent": footer,
        "x": "200",
        "position": "Center",
        "y": "190",
        width: "400", height: "220"
    };
    f._renderWindows();
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
                    $(".serComponent").append("<option value='" + out.split('_')[1] + "'>" + $.trim($(".instName").val()) + "</option>");
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
function exportThroughpuResults(ids, fields, points) {

    maxPoints = points;
    var data = "";
    var formats = "xml__Excel;csv__Raw csv";
    var f = new FormClass();
    f.fields = [{
            type: "number",
            min: 0,
            max: points - 1,
            name: "planPointsStart",
            title: "Start Point",
            pClass: "_50"
        }, {
            type: "number",
            min: 1,
            max: points,
            name: "planPointsEnd",
            title: "End Point",
            pClass: "_50"
        },
        {
            type: "select",
            title: "output format",
            options: formats,
            name: "extension"
        }, {
            type: "list",
            options: fields,
            name: "createThColumnsList",
            title: "Fields"
        }, {
            type: "checkbox",
            title: "Select all",
            name: "selectAll"
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
            "name": "exportThOk",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "exportThCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "exportThCancel"
        }, {
            event: "change",
            eventClass: "selectAll",
            js: function() {
                if ($(".selectAll").is(':checked')) {

                    $(".createThColumnsList").each(function() {
                        $(".createThColumnsList option").attr("selected", "selected");
                    });
                } else {

                    $(".createThColumnsList").each(function() {
                        $(".createThColumnsList option").removeAttr("selected");
                    });
                }
            }
        }, {
            event: "click",
            eventClass: "exportThOk",
            js: function() {
                if ($(".planPointsStart").val() > $(".planPointsEnd").val()) {
                    alert("Starting point higher than ending point, please retype start and end points");
                } else {
                    var link = "?ids=" + ids
                            + "&list=" + $(".createThColumnsList").val()
                            + "&startPoint=" + $(".planPointsStart").val()
                            + "&endPoint=" + $(".planPointsEnd").val()
                            + "&extension=" + $(".extension").val()

                    window.open(
                            "ajax/results/exportThroughputResults.jsp" + link,
                            '_blank' // <- This is what makes it open in a new window.
                            );
                    f.closeWindow();
                }

            }
        }];
    var footer = f._renderhtml();
    f.windows = {
        "class": "exportTHResult",
        "title": "Export Throughput results",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        width: "400", height: "190"
    };
    f._renderWindows();
}


function exportResults(ids, fields, points) {
    maxPoints = points;
    var formats = "xml__Excel;csv__Raw csv";
    var f = new FormClass();
    f.fields = [{
            type: "number",
            min: 0,
            max: points - 1,
            name: "planPointsStart",
            title: "Start Point",
            pClass: "_50"
        }, {
            type: "number",
            min: 1,
            max: points,
            name: "planPointsEnd",
            title: "End Point",
            pClass: "_50"
        },
        {
            type: "select",
            title: "output format",
            options: formats,
            name: "extension"
        }, {
            type: "list",
            options: fields,
            name: "createColumnsList",
            title: "Fields"
        }, {
            type: "checkbox",
            title: "Select all",
            name: "selectAll"
        }, {
            type: "checkbox",
            title: "list Cache",
            name: "listCache"
        }, {
            type: "checkbox",
            title: "list Io",
            name: "listIo"
        }
    ];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100",
            
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "exportDTLOk",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "exportDTLCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "exportDTLCancel"
        }, {
            event: "change",
            eventClass: "selectAll",
            js: function() {
                if ($(".selectAll").is(':checked')) {

                    $(".createColumnsList").each(function() {
                        $(".createColumnsList option").attr("selected", "selected");
                    });
                } else {

                    $(".createColumnsList").each(function() {
                        $(".createColumnsList option").removeAttr("selected");
                    });
                }
            }
        }, {
            event: "click",
            eventClass: "exportDTLOk",
            js: function() {
                if ($(".planPointsStart").val() > $(".planPointsEnd").val()) {
                    alert("Starting point higher than ending point, please retype start and end points");
                } else {
                    var link = "?ids=" + ids
                            + "&list=" + $(".createColumnsList").val()
                            + "&startPoint=" + $(".planPointsStart").val()
                            + "&endPoint=" + $(".planPointsEnd").val()
                            + "&extension=" + $(".extension").val()
                            + "&cache=" + $(".listCache").attr('checked')
                            + "&io=" + $(".listIo").attr('checked');
                    window.open(
                            "ajax/results/exportResults.jsp" + link,
                            '_blank' // <- This is what makes it open in a new window.
                            );
                    f.closeWindow();
                }

            }
        }];
    var footer = f._renderhtml();
    f.windows = {
        "class": "exportDTLResult",
        "title": "Export detail results",
        "content": content,
        "footerContent": footer,
        "x": "300",
        "y": "190",
        width: "400", height: "190"
    };
    f._renderWindows();
}
function nodeList(id, list) {



    var form = new FormClass("nodeList");
    form.fields = [
        {
            "title": "Node List",
            "name": "nodeNoMdlList",
            "class": "nodeNoMdlList",
            type: "list",
            "pClass": "_100 ",
            options: list
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
            "name": "goToServer",
            "value": "go To Server"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "nodeListCancel",
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
            , "eventClass": "nodeListCancel"
        },
        {
            "event": "click",
            "eventClass": "goToServer",
            "js": function(data) {


                openNodeInGroup(id);
                form.closeWindow();
            }


        }



    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "nodeList",
        "title": "node List",
        "content": fields,
        "footerContent": footer,
        "x": "500",
        "position": "Center",
        "y": "190",
        width: "400", height: "190"
    };
    form._renderWindows();
}
function model_propreties(id) {

    id = id.split("__");
    modelId = id[0].replace("[", "");
    var form = new FormClass();
    form.fields = [
        {"title": "name",
            "class": "modelName",
            type: "text",
            "name": "modelName",
            "pClass": "_100 ",
            value: $.trim(id[4])
        },
        {
            "title": "Comment",
            "class": "modelComment",
            "name": "comment",
            "pClass": "_100 ",
            value: $.trim(id[1]),
            type: "textarea"
        },
        {
            "title": "Locked",
            "class": "modelLocked",
            "name": "locked",
            "pClass": "_100 ",
            value: id[7],
            type: "checkbox"
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
            "name": "updateModelok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "updateModelCancel",
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
            , "eventClass": "updateModelCancel"
        },
        {
            "action": "send",
            "url": "ajax/xact/updateModel.jsp",
            "event": "click",
            "eventClass": "updateModelok",
            "options": {id: modelId},
            "done": function(data) {
                alert(" Model data updated sucessfully !");
                showMyloading(".main", "end");
                UpdateCorporate(modelId);
                form.closeWindow();
            }

        }




    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "model_properties",
        "title": "Model Properties",
        "content": fields,
        "footerContent": footer,
        "x": "100",
        "y": "100",
        width: "400", height: "220"
    };
    form._renderWindows();
}


