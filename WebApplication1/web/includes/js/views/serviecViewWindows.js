/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var myg = null;
var mysourceId = "";
var mys_id = "";
var myMod_id = "";
var mypro_id = "";
var mysource = null;
var mytarget = null;
var myline = null;
function updateTypes(stype, parentType) {
    var Types = "";
    stype = $.trim(stype);
    parentType = $.trim(parentType);
    if ((stype == "process" || stype == "start") && (parentType == "process" || parentType == "pb")) {
        Types = "process__Process;message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
    } else if ((stype == "component" || stype == "start") && (parentType == "process" || parentType == "pb")) {
        Types = "process__Process;message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
    } else if ((stype == "task" || stype == "start") && (parentType == "process" || parentType == "pb")) {
        Types = "process__Process;message__Message;task__Task;component__Component;collector__Collector;insertion__Insertion;end__end;";
    } else if ((stype == "insertion" || stype == "start") && (parentType == "process" || parentType == "pb")) {
        Types = "process__Process;message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
//////////////////////////////////////////Paernt:component
    } else if ((stype == "process" || stype == "start") && parentType == "component") {
        Types = "message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
    } else if ((stype == "component" || stype == "start") && parentType == "component") {
        Types = "message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
    } else if ((stype == "task" || stype == "start") && parentType == "component") {
        Types = "message__Message;task__Task;component__Component;collector__Collector;insertion__Insertion;end__end;";
    } else if ((stype == "insertion" || stype == "start") && parentType == "component") {
        Types = "message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
        //////////////////////////////////////////Paernt:Task
    } else if ((stype == "process" || stype == "start") && parentType == "task") {
        Types = "message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
    } else if ((stype == "component" || stype == "start") && parentType == "task") {
        Types = "message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
    } else if ((stype == "task" || stype == "start") && parentType == "task") {
        Types = "message__Message;task__Task;component__Component;collector__Collector;insertion__Insertion;end__end;";
    } else if ((stype == "insertion" || stype == "start") && parentType == "task") {
        Types = "message__Message;task__Task;component__Component;insertion__Insertion;end__end;";
    } else if (stype == "service") {
        Types = "task__Task;component__Component;insertion__Insertion;end__end;";
        if (parentType == "process" || parentType == "pb") {
            Types += "process__Process";
        }
    }
    if ((parentType == "task")) {
        Types = "message__Message;task__Task;activity__Activity;component__Component;insertion__Insertion;end__end;";
    } else if ((parentType == "activity")) {
        Types = "activity"
    }
    return Types;
}
function newProcess(g, source, target, s_id, Mod_id, pro_id, p_data, s_data, type, parent) {
    adding = true;
    myg = g;
    mysourceId = source.getId();
    mysource = source;
    mytarget = target;
    mys_id = s_id;
    myMod_id = Mod_id;
    mypro_id = pro_id;
    var Types = "";
    var parentID = $.trim(mysource.parent.getId());
    var scID = $.trim(mysource.getId());
    var parentType = "";
    if (parentID != "1") {
        parentType = p_data[1];
    } else {
        parentType = "pb";
    }
    var stype = s_data[1];
    Types = updateTypes(stype, parentType);

    var insertionData = "";
    var content = "";
    var processData = "";
    var taskData = "";
    var componentData = "";
    var collectorData = "";
    var messageData = "";
    var activityData = "";
    var mylink = "status=getCollectors&id=" + myMod_id;
    $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(r_data) {


        insertionData = getInsertionrData(null, r_data, null);
        processData = getProcessData(null, parent, type);
        activityData = getActivityData(null, null, Mod_id);

        taskData = getTaskData(null);
        componentData = getComponentData(null);
        collectorData = getCollectorData(null);
        messageData = getmessageData(null);

        var first = Types.split("__")[0];


        if ($.trim(type) === "start" && $.trim(parent) === "1") {
            first = "process";
            Types = "process__Process";
        }






        if (first == "process") {
            content = processData;
        } else if (first == "task") {
            content = taskData;
        } else if (first == "component") {
            content = componentData;
        } else if (first == "collector") {
            content = collectorData;
        } else if (first == "insertion") {
            content = insertionData;
        } else if (first == "message") {
            content = messageData;
        } else if (first == "end") {
            content = "";
        }
        else if (first == "activity") {
            content = activityData;
        }

        var f = new FormClass("service_properties");
        f.fields = [
            {
                "title": "Node type",
                "type": "select",
                "name": "ProcessType",
                options: Types
            }]

        if (content != "") {
            f._addTofields([{type: "div",
                    class: "objectContent",
                    value: content
                }]);


        }

        f._addTofields([{
                "title": "Link U.F in %",
                "type": "number",
                "name": "linkUF",
                min: 0,
                max: 100,
                value: 100
            },
            {
                "type": "enddiv"
            }]);





        var selectType = f._renderhtml();

        f.fields = [
            {
                "type": "div",
                "class": "do_center _100"
            },
            {
                "type": "button",
                "name": "createServiceNodeOK",
                "value": "Ok"
            },
            {
                "title": "cancel",
                "type": "button",
                "name": "createServiceNodeCancel",
                "value": "cancel"
            },
            {
                "type": "enddiv"
            }
        ];
        f.events = [{
                "event": "change",
                "eventClass": "ProcessType",
                js: function() {
                    var mytype = $(".ProcessType").val();
                    if (mytype == "process") {
                        content = processData;
                    } else if (mytype == "task") {
                        content = taskData;
                    } else if (mytype == "component") {
                        content = componentData;
                    } else if (mytype == "collector") {
                        content = collectorData;
                    } else if (mytype == "insertion") {
                        content = insertionData;
                    } else if (mytype == "message") {
                        content = messageData;
                    } else if (mytype == "end") {
                        content = "";
                    }
                    else if (mytype == "activity") {
                        content = activityData;
                    }

                    $(".objectContent").html(content);
                }

            }, {
                "action": "send",
                "url": "ajax/views/serviecView/createNode.jsp",
                "options": {status: "create", sourceId: mysourceId},
                "event": "click",
                "eventClass": "createServiceNodeOK",
                done: function(data) {
                    muUpdat(mysource.parent, myg, mys_id, myMod_id, mypro_id);
                    myg.removeCells([mytarget]);
                    myg.refresh();
                    f.closeWindow();
                }

            }, {
                "action": "close"
                , "event": "click"
                , "eventClass": "createServiceNodeCancel",
                "Callback": function(t) {
                    myg.removeCells([mytarget]);
                    myg.refresh();

                }}

            , {
                "event": "change",
                "eventClass": "type",
                js: function(t) {
                    if ($(".type:checked").val() == "preparation") {

                        $(".taskexdata2").show();
                        $(".taskexdata").hide();


                        $(".numberOccurances2").attr("name", "numberOccurances");

                        $(".numberOccurances").attr("name", "numberOccurances2");
                    } else {
                        $(".taskexdata2").hide();
                        $(".taskexdata").show();

                        $(".numberOccurances").attr("name", "numberOccurances");

                        $(".numberOccurances2").attr("name", "numberOccurances2");
                    }

                }
            }


        ];
        var footer = f._renderhtml();
        f.windows = {
            "class": "service_properties",
            "title": "Create Service Node",
            "content": selectType,
            "footerContent": footer,
            "x": "500",
            "position": "Center",
            "y": "90",
            width: "500", height: "480"
        };
        f._renderWindows();
    });
}


function serviecEdit(id, source, g, s_id, Mod_id, pro_id) {

    myg = g;
    mys_id = s_id;
    myMod_id = Mod_id;
    mypro_id = pro_id;
    mysource = source;
    mysourceId = source.getId();
    var ids = id.split("/");
    if ($.trim(ids[0]) == "SERVICE_PROCESS_LINKS") {

        var mylink = "status=lineuF&id=" + id;
        $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(r_data) {
            makeWinDows("Edit Service  Links ", "Edit_SERVICE_LINKS", Edit_SERVICE_LINKS(id, ids[1], r_data), 300, 3, 750, 100);
        })


    } else if ($.trim(ids[0]) == "SERVICE_PROCESS_NODES") {


        var mylink = "status=nodeData&id=" + id;
        $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(r_data) {

            var Values = ArrayJP2JS(r_data);
            if ($.trim(Values[1]) == "service") {

                var targetID = getCellTargetID(id, g, source.parent);
                var sourcId = getCellSourcetID(id, g, source.parent);
                if (targetID == null || sourcId == null || $.trim(targetID) == "" || $.trim(sourcId) == "") {
                    var mymissing = "";
                    if (sourcId == null || $.trim(sourcId) == "") {
                        mymissing = "Producer";
                    } else {
                        mymissing = "Consumer";
                    }


                    alert("This Service to Service link has a missing " + mymissing);
                } else {

                    var sourcIds = sourcId.split("__");
                    var targetIDs = targetID.split("__");
                    var myslink = "id=" + sourcIds + "&status=getPRODUCER_ACTIVITY";
                    $.get("ajax/views/serviecView/messages.jsp?" + myslink, function(sr_data) {


                        var mytlink = "id=" + targetIDs + "&status=getCONSUMER_ACTIVITY";
                        $.get("ajax/views/serviecView/messages.jsp?" + mytlink, function(tr_data) {

                            mytlink = "id=" + ids[1] + "&status=getmessages";
                            $.get("ajax/views/serviecView/messages.jsp?" + mytlink, function(tableData) {



                                //
                                var mylink = "status=getServesName&id=" + id;
                                $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(name_data) {

                                    sr_data = sr_data.replaceAll("[", "");
                                    sr_data = sr_data.replaceAll("]", "");
                                    tr_data = tr_data.replaceAll("[", "");
                                    tr_data = tr_data.replaceAll("]", "");

                                    getmessageEditwindows(Values, sr_data, tr_data, Mod_id, ids[1], tableData, id, name_data, pro_id);
                                })
                            })
                        })
                    })
                }



            } else {


                var mylink = "status=getCollectors&id=" + myMod_id;
                $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(r_data) {

                    mylink = "status=getServesName&id=" + $.trim(Values[4]);
                    $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(servesName) {
                        $.get("ajax/views/groupView/getAci2ActList.jsp?activityId=" + $.trim(Values[0]), function(aciData) {

                            EditServiceNode(Values, r_data, servesName, aciData);
                        });
                    });
                });

            }


        })



    }





}

function getmessageEditwindows(Valuse, producerActivity, consumerActivity, Mod_id, s2sid, tabelData, id, name_data) {
    producerActivity = producerActivity.replaceAll(",", ";");
    consumerActivity = consumerActivity.replaceAll(",", ";");
    var rows = [];
    tabelData = tabelData.split("__");
    for (var i = 0; i < tabelData.length; i++) {

        var myaddRow = tabelData[i].split(";")
        if ($.trim(myaddRow[1]) != "" && $.trim(myaddRow[1]) != "null") {
            var tempRow = [];
            tempRow.push($.trim(myaddRow[0]));
            tempRow.push($.trim(myaddRow[2]));
            tempRow.push(myaddRow[5]);
            tempRow.push(myaddRow[6]);
            tempRow.push(myaddRow[7] * 100);
            rows.push(tempRow);
        }

    }

    var table = {
        name: "messageEdit",
        class: "data_grid",
        type: "table",
        rows: rows
        ,
        columns: [
            {title: "Messageid", type: "hidden", name: "rowId"},
            {title: "Message Name", type: "div", name: "rowName"},
            {title: "Producer ACI", type: "div", name: "messagePA"},
            {title: "Consumer ACI", type: "div", name: "messageCA"},
            {title: "utilization frequency(%)", type: "div", name: "messageUF"}]
    };

    var f = new FormClass("editMessage");
    f.fields = [{
            type: "border",
            title: "Simple Link Message"
        }



        , {
            type: "text",
            title: "Name",
            name: "ServesName",
            value: name_data,
            pClass: "_100"
        },
        {
            type: "select",
            title: "Producer Activity",
            name: "producerActivity",
            options: producerActivity,
            pClass: "_100"
        }, {
            type: "select",
            title: "consumer Activity",
            name: "consumerActivity",
            options: consumerActivity,
            pClass: "_100"
        }, {
            type: "text",
            title: "message name",
            name: "messageName",
            pClass: "_100"
        }, {
            type: "number",
            title: "utilization frequency(%)",
            name: "messageUF",
            pClass: "_100 clear",
            min: 0,
            max: 100,
            value: 100
        }, {
            type: "button",
            title: "add message",
            value: "add message",
            name: "addMessage",
            pClass: "_25"
        }, {
            type: "button",
            title: "Edit Segments",
            value: "Edit Segments",
            name: "editSegments",
            pClass: "_25"
        }, {
            type: "button",
            title: "Delete Message",
            name: "deleteMessage",
            value: "Delete Message",
            pClass: "_25"
        }, {
            type: "border",
            title: "Messages"
        }, table,
        {
            type: "endborder",
            title: ""
        },
        {
            type: "endborder",
            title: ""
        }];
    var content = f._renderhtml();
    f.fields = [{
            "type": "div",
            "class": "do_center _100",
        },
        {
            "type": "button",
            "name": "editMesageOK",
            "value": "OK"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "editMessageCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }];
    f.events = [{
            action: "classTothis",
            event: "click",
            eventClass: "messageEdit tr",
            target: "seleted"
        }, {
            action: "close",
            event: "click",
            eventClass: "editMessageCancel"
        }, {
            event: "click",
            eventClass: "deleteMessage",
            target: "tr.seleted",
            js: function() {

                var myID = $("tr.seleted td .rowId").val();
                if (myID != undefined) {
                    var myslink = "id=" + myID + "&status=deletemessage";
                    $("tr.seleted").remove();
                    $.get("ajax/views/serviecView/messages.jsp?" + myslink, function(sr_data) {


                    });
                } else {
                    alert("Please select message first!");
                }
            }
        }, {
            event: "click",
            eventClass: "editMesageOK",
            action: "send",
            url: "ajax/views/serviecView/messages.jsp",
            options: {S2S_ID: s2sid, MODEL_ID: Mod_id, id: id, status: "addmessage"},
            done: function() {
                alert("Message updated");
                muUpdat(mysource.parent, myg, mys_id, myMod_id, mypro_id);

                f.closeWindow();
            }


        }, {
            event: "click",
            eventClass: "addMessage",
            js: function() {

                var producerActivity = $.trim($(".producerActivity").val());
                var consumerActivity = $.trim($(".consumerActivity").val());

                if (producerActivity != "" && consumerActivity != "") {
                    var myslink = "id=" + producerActivity + "&status=getPRODUCER_AC";
                    $.get("ajax/views/serviecView/messages.jsp?" + myslink, function(sr_data) {

                        var mytlink = "id=" + consumerActivity + "&status=getCONSUMER_AC";
                        $.get("ajax/views/serviecView/messages.jsp?" + mytlink, function(tr_data) {

                            sr_data = $.trim(sr_data).replaceAll("]", "");
                            sr_data = sr_data.replaceAll("[", "");
                            tr_data = $.trim(tr_data).replaceAll("[", "");
                            tr_data = tr_data.replaceAll("]", "");
                            sr_data = sr_data.replaceAll(",", ";");
                            tr_data = tr_data.replaceAll(",", ";");
                            var s = CreateFiled("", "select", "producerAC", "", "", sr_data);
                            var pa = CreateFiled("", "hidden", "producerActivity", producerActivity, "", producerActivity);
                            var t = CreateFiled("", "select", "consumerAC", "", "", tr_data);
                            var ca = CreateFiled("", "hidden", "consumerActivity", consumerActivity, "", consumerActivity);
                            s = s.replaceAll(":", "");
                            t = t.replaceAll(":", "");
                            // <tr><td class="hidden"><input data-title="Messageid" type="hidden" name="rowId" class="undefined week rowId undefined " value="1392422400422"></td><td class="text"><input data-title="Message Name" type="text" name="rowName" class="rowName undefined undefined " value="Recept_Msg"></td><td class="div"><div data-title="Producer Activity" class=" messagePA undefined ">Java-M1</div></td><td class="div"><div data-title="Consumer activity" class=" messageCA undefined ">Ora-M1</div></td><td class="text"><input data-title="utilization frequency" type="text" name="messageUF" class="messageUF undefined undefined " value="1"></td></tr>
                            $(".messageEdit").append("\
              <tr class='mymessageAllRow'>\n\
      <td class='text rowpname'><input type='text' value=" + $(".messageName").val() + " name='newMessageName'></td>\n\
       <td class='hidden pa'>" + pa + "</td>\n\
       <td class='hidden ca'>" + ca + "</td>\n\
 <td class='rowproducerActivity'>" + s + "</td>\n\\n\
          <td class='rowconsumerActivity' >" + t + "</td>\n\\n\
          <td class='rowUF'><input type='text' value=" + $(".messageUF").val() + " name='newMessageUF'></td>\n\
</tr>");
                        });
                    });
                } else {
                    alert('Missing producer and/or consumer activity!');
                }
            }
        }, {
            event: "click",
            eventClass: "editSegments",
            js: function() {

                var myID = $("tr.seleted td .rowId").val();
                if (myID != undefined) {
                    var mytlink = "id=" + myID + "&status=getsegement";
                    $.get("ajax/views/serviecView/messages.jsp?" + mytlink, function(tableData) {

                        var mytlink = "id=" + myID + "&status=getAPPLICATION";
                        $.get("ajax/views/serviecView/messages.jsp?" + mytlink, function(APPLICATIONData) {




                            if ($.trim(myID) != "") {
                                makeWinDows("Edit Segments", "editSegmentsWindows", getSegmentsWindows(tableData, myID, APPLICATIONData), 300, 3, 850, 320);

                            }




                        });
                    });
                } else {
                    alert("Please select message first!");
                }
            }
        }
    ];
    //$.get("ajax/createServer.jsp?serverId=" + serverId + "&status=updateserver&lp=" + "&tp=" + $(".newSeverTP").val() + "&ts=" + $(".newSeverTimeSlice").val() + "&cpuLimit=" + $(".newSeverCPULimit").val() + "&cpuQuantum=" + $(".newSeverCPUQ").val(), function(mdata) {

    var footer = f._renderhtml();
    f.windows = {
        "class": "editMessage",
        "title": "edit message",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "300",
        "y": "190",
        width: "550", height: "380"
    };
    f._renderWindows();
}

function getSegmentsWindows(DataTable, messageID, APPLICATIONData) {
    /*
     
     var rows = [];
     DataTable = DataTable.split("__");
     for (var i = 0; i < DataTable.length; i++) {
     
     var myaddRow = DataTable[i].split(";")
     if ($.trim(myaddRow[1]) != "" && $.trim(myaddRow[1]) != "null") {
     var tempRow = [];
     
     tempRow.push(myaddRow[15]);
     tempRow.push(myaddRow[0]);
     tempRow.push(myaddRow[4]);
     tempRow.push(myaddRow[5]);
     tempRow.push(myaddRow[6]);
     tempRow.push(myaddRow[7]);
     tempRow.push(myaddRow[8]);
     tempRow.push(myaddRow[9]);
     tempRow.push(myaddRow[10]);
     tempRow.push(myaddRow[11]);
     tempRow.push(myaddRow[12]);
     rows.push(tempRow);
     }
     
     }
     
     var protocolOptions = "none__None;token ring__Token Ring;Ethernet__Ethernet;X.25__X.25;ATM-wan__ATM-wan;ATM-lan__ATM-lan;";
     
     var transferOptions = "none__None;TCP/IP__TCP/IP;UDP/IP__UDP/IP;DECnet4__DECnet4;MPLS__MPLS;";
     
     var tunelingOptions = "none__None;L2TP__L2TP;PPTP__PPTP;";
     //"<thead><tr><th>Server</th><th>Complex</th><th>Appliaction</th><th>Utilization</th></tr>";
     
     
     
     
     
     
     var table = {
     name: "segmentTable",
     type: "table",
     rows: rows,
     columns: [
     {title: "Producer Appl Comp", editable: true, type: "text"},
     {title: "Consumer Appl Ccomp", type: "select", options: APPLICATIONData},
     {title: "Requests Per Second", type: "text"},
     {title: "Request Size(KB)", type: "text"},
     {title: "Response Per Second", type: "text"},
     {title: "Response Size(KB)", type: "text"},
     {title: "Utilization Rate", type: "text"},
     {title: "Overhead", type: "text"},
     {title: "Network Protocol", type: "select", options: protocolOptions},
     {title: "Transport Protocol", type: "select", options: transferOptions},
     {title: "Tunneling Protocol", type: "select", options: tunelingOptions}]
     };
     
     var f = new FormClass();
     f.fields = [
     table
     ];
     var content = f._renderhtml();
     f.fields = [
     {
     "type": "div",
     "class": "do_center _100",
     },
     {
     "title": "add segment",
     "type": "button",
     "name": "addSegment",
     "value": "add segment"
     },
     {
     "title": "remove segment",
     "type": "button",
     "name": "removeSegment",
     "value": "remove segment"
     },
     {
     "type": "button",
     "name": "editSegmentOK",
     "value": "Ok"
     },
     {
     "title": "cancel",
     "type": "button",
     "name": "editSegmentCancel",
     "value": "cancel"
     },
     {
     "type": "enddiv"
     }
     ];
     var footer = f._renderhtml();
     f.windows = {
     "class": "editSegmentz",
     "title": "edit segments",
     "content": content,
     "footerContent": footer,
     "x": "200",
     "y": "190",
     width: "700", height: "480"
     };
     f._renderWindows();*/

    var data = "<script>getSegmentsWindowsActions('" + messageID + "'  );</script><div class=\"view_pre mydata\">";
    data += CreateFiled('Messages', 'borderOpen');
    data += "<table class='data_grid'>";
    data += "<thead><th>Producer Appl Comp</th>\n\
<th>Consumer Appl Ccomp</th>\n\
<th>Requests Per Second</th>\n\
<th>Request Size(KB)</th>\n\
<th>Response Per Second</th>\n\
<th>Response Size(KB)</th>\n\
   <th>Utilization Rate</th>\n\
    <th>Overhead</th>\n\
     <th>Network Protocol</th>\n\
     <th>Transport Protocol</th>\n\
     <th>Tunneling Protocol</th>\n\
    </thead>";





    data += "<tbody class='segmentAddrow'>"


    var getData = DataTable.split("__");

    for (var i = 0; i <= getData.length; i++) {
        if (getData[i] != null && getData[i] != "") {

            var thRow = getData[i].split(";")




            if (thRow[1] != null) {
                var defArray = [thRow[3], thRow[4], thRow[5], thRow[6], thRow[7], thRow[8], thRow[9], thRow[10], thRow[11], thRow[12]];
                data += sRow(thRow[2], thRow[15], defArray, APPLICATIONData);

                data += "<input class='lastCon' type='hidden' value='" + thRow[16] + "' />"

            }

        }
    }

    data += "</tbody>";
    data += "</table>";
    data += CreateFiled('Line', 'borderClose');
    data += CreateFiled("Add Segment", "button", "getSegmentsAddSegment");
    data += CreateFiled("Remove Segment", "button", "getSegmentsRemoveSegment", "", "_50");
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "getSegmentsok");
    data += CreateFiled("Cancel", "button", "getSegmentsCancel", "", "_50");
    data += "</div>";
    return data;
}



function sRow(ProID, proName, values, APPLICATIONData) {





    var Options = "none__None;token ring__Token Ring;Ethernet__Ethernet;X.25__X.25;ATM-wan__ATM-wan;ATM-lan__ATM-lan;";
    var Networkprotocol = createInput("select", "Networkprotocol", values[7], "width:90", Options);

    Options = "none__None;TCP/IP__TCP/IP;UDP/IP__UDP/IP;DECnet4__DECnet4;MPLS__MPLS;";
    var Transferprotocol = createInput("select", "Transferprotocol", values[8], "width:90%", Options);
    Options = "none__None;L2TP__L2TP;PPTP__PPTP;";
    var Tunnelingprotocol = createInput("select", "Tunnelingprotocol", values[9], "width:90%", Options);
    var Overhead = createInput("text", "Overhead", values[6], "width:90%", "");
    var UtilizationRate = createInput("text", "UtilizationRate", values[5], "width:90%", "");
    var RequestSize = createInput("text", "RequestSize", values[2], "width:90%", "");
    var RequestsPerSecond = createInput("text", "RequestsPerSecond", values[1], "width:90%", "");

    var RESPONSESize = createInput("text", "RESPONSESize", values[4], "width:90%", "");
    var RESPONSEPerSecond = createInput("text", "RESPONSEPerSecond", values[3], "width:90%", "");


    //    var ProducerApplComp = createInput("select", "ProducerApplComp", "", "width:90%", "");
    var ConsumerApplcomp = createInput("select", "ConsumerApplcomp", values[0], "width:90%", APPLICATIONData);


    var Row = "<tr>\n\
\n\
<td><input type='hidden' value='" + ProID + "' class='ProducerApplComp' />" + proName + "</td>\n\
    <td>" + ConsumerApplcomp + "</td>\n\
    <td>" + RequestsPerSecond + "</td>\n\
    <td>" + RequestSize + "</td>\n\
    <td>" + RESPONSEPerSecond + "</td>\n\
    <td>" + RESPONSESize + "</td>\n\
   <td>" + UtilizationRate + "</td>\n\
    <td>" + Overhead + "</td>\n\
     <td>" + Networkprotocol + "</td>\n\
     <td>" + Transferprotocol + "</td>\n\
     <td>" + Tunnelingprotocol + "</td>\n\
    </tr>";




    return Row;


}





function getSegmentsWindowsActions(ID) {

    $(".getSegmentsAddSegment").click(function() {



        var mydata = $(".segmentAddrow tr").eq($(".segmentAddrow tr").size() - 1).children("td").children(".ConsumerApplcomp").val();

        var mytlink = "id=" + mydata + "&status=getPRODUCERName";
        $.get("ajax/views/serviecView/messages.jsp?" + mytlink, function(proName) {



            var mytlink = "id=" + ID + "&status=getAPPLICATION";
            $.get("ajax/views/serviecView/messages.jsp?" + mytlink, function(APPLICATIONData) {





                var defArray = ["", "1", "1", "1", "1", "1", "0", "", "", ""];



                $(".segmentAddrow").append(sRow(mydata, proName, defArray, APPLICATIONData));




            })

        })

    });
    $(".getSegmentsRemoveSegment").click(function() {

        var myLink = "id=" + ID + "&status=deletesegment";

        if ($(".segmentAddrow tr").size() > 1) {
            $.get("ajax/views/serviecView/messages.jsp?" + myLink, function(tr_data) {



                $(".segmentAddrow tr").eq($(".segmentAddrow tr").size() - 1).remove();

            })

        }


    });
    $(".getSegmentsok").click(function() {

        var myin = 0;



        var myLink = "id=" + ID + "&status=deleteAllsegment";
        $.get("ajax/views/serviecView/messages.jsp?" + myLink, function(tr_data) {



        })









        var lastc = $(".segmentAddrow tr").eq($(".segmentAddrow tr").size() - 1).children("td").children(".ConsumerApplcomp").val();

        if ($(".lastCon").val() != lastc) {


            alert("Consumer AC of last segment must be the consumer of the mesage!");

        } else {


            var mnum = 0;
            $(".segmentAddrow tr").each(function() {



                myin++;

                var myLink = "id=" + ID + "&status=addsegment";

                myLink += "&Networkprotocol=" + $(this).children("td").children(".Networkprotocol").val() +
                        "&Transferprotocol=" + $(this).children("td").children(".Transferprotocol").val() +
                        "&Tunnelingprotocol=" + $(this).children("td").children(".Tunnelingprotocol").val() +
                        "&UtilizationRate=" + $(this).children("td").children(".UtilizationRate").val() +
                        "&ConsumerApplcomp=" + $(this).children("td").children(".ConsumerApplcomp").val() +
                        "&ProducerApplComp=" + $(this).children("td").children(".ProducerApplComp").val() +
                        "&RESPONSESize=" + $(this).children("td").children(".RESPONSESize").val() +
                        "&RESPONSEPerSecond=" + $(this).children("td").children(".RESPONSEPerSecond").val() +
                        "&RequestSize=" + $(this).children("td").children(".RequestSize").val() +
                        "&RequestsPerSecond=" + $(this).children("td").children(".RequestsPerSecond").val() +
                        "&Overhead=" + $(this).children("td").children(".Overhead").val() +
                        "&index=" + myin;
                ;



                $.get("ajax/views/serviecView/messages.jsp?" + myLink, function(tr_data) {
                    mnum++;


                    if ($(".segmentAddrow tr").size() == mnum) {

                        closeWindows("editSegmentsWindows");


                    }

                })
            })
        }

    });
    $(".getSegmentsCancel").click(function() {
//
        closeWindows("editSegmentsWindows");
    });
}
function Edit_SERVICE_LINKS(ids, id, UF) {

    var data = "<script>LineEditWinDowsActions('" + ids + "','" + id + "');</script><div class=\"view_pre mydata\">";
    data += CreateFiled("Utlization Frequency in %", "text", "uF", UF * 100, "");
    data += "<div class='typeData'></div>";
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "SEditLineok");
    data += CreateFiled("Cancel", "button", "SEditLineCancel", "", "_50");
    data += "</div>";
    return data;
}

function LineEditWinDowsActions(ids, id) {


    $(function() {
        $(".SEditLineok").click(function() {
            var mylink = "status=editLine&id=" + id + "&uF=" + $(".uF").val();
            $.get("ajax/views/serviecView/createNode.jsp?" + mylink, function(r_data) {

                $.get("modules/mod_nodeproperties/index.jsp?pro_id=" + ids, function(r_data) {

                    $("#Properties_con").html(r_data);
                })


                closeWindows("Edit_SERVICE_LINKS");
            })

        })

        $(".SEditLineCancel").click(function() {

            closeWindows("Edit_SERVICE_LINKS");
        })

    })


}

function EditServiceNode(Valuse, r_data, servesName, aciData) {

    var mytype = $.trim(Valuse[1]);
    var id = $.trim(Valuse[0]);
    var id = id.replace("undefined", "");
    var content = "";
    //var data = "<script>EditServiceNodeActions('" + mytype + "','" + id + "');</script><div class=\"view_pre mydata\">";
    if (mytype == "process") {
        content += getProcessData(Valuse);
    } else if (mytype == "task") {
        content += getTaskData(Valuse);
    } else if (mytype == "activity") {
        content += getActivityData(Valuse, aciData, Valuse[6]);
    } else if (mytype == "component") {
        content += getComponentData(Valuse);
    } else if (mytype == "collector") {
        content += getCollectorData(Valuse);
    } else if (mytype == "insertion") {
        content += getInsertionrData(Valuse, r_data, servesName);
    }

    var f = new FormClass("service_properties");
    f.fields = [
        {
            type: "div",
            class: "objectContent",
            value: content
        }, {
            type: "enddiv"
        }
    ];
    var selectType = f._renderhtml();

    f.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "type": "button",
            "name": "editProcessok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "editProcessCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    f.events = [{
            "action": "send",
            "url": "ajax/views/serviecView/createNode.jsp",
            "options": {status: "editNode", sourceId: mysourceId, ProcessType: mytype, id: id},
            "event": "click",
            "eventClass": "editProcessok",
            done: function(data) {
                muUpdat(mysource.parent, myg, mys_id, myMod_id, mypro_id);
                myg.removeCells([mytarget]);
                myg.refresh();
                f.closeWindow();
            }

        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "editProcessCancel"
        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "service_properties",
        "title": "Edit Service Node",
        "content": selectType,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "90",
        width: "500", height: "480"
    };
    f._renderWindows();


}


function selectAci(modid, r_data) {
    var f = new FormClass("activity2aci");
    f.fields = [{
            type: "list",
            name: "groups",
            title: "Groups",
            options: r_data,
            pClass: "_20"
        }, {
            type: "list",
            name: "servers",
            class: "serversList",
            title: "servers",
            options: "",
            pClass: "_20"

        }, {
            type: "list",
            name: "complex",
            title: "complex",
            options: "",
            pClass: "_20"

        }, {
            type: "list",
            name: "logical_servers",
            title: "logical servers",
            options: "",
            pClass: "_20"

        }, {
            type: "list",
            name: "ACIs",
            title: "ACIs",
            options: "",
            pClass: "_20"

        }
    ];


    var content = f._renderhtml();
    f.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        }, {
            "title": "Create New ACI",
            "type": "button",
            value: "Create New ACI",
            name: "addNewACI"
        },
        {
            "type": "button",
            "name": "addACI2Act",
            "value": "Add Selected"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "addACICancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    f.events = [{
            action: "close",
            event: "click",
            eventClass: "addACICancel"

        },
        {
            event: "click",
            eventClass: "groups",
            js: function() {
                var mylink = "ajax/views/groupView/getNodeList.jsp?mid=" + modid + "&groupid=" + $(".groups").val() + "&status=servers";
                $.get(mylink, function(r_data) {


                    $(".servers").html(getmyOptions(r_data));
                    $(".complex").html("");
                    $(".logical_servers").html("");
                    $(".ACIs").html("");
                });
            }
        },
        {
            event: "click",
            eventClass: "servers",
            js: function() {

                var mylink = "ajax/views/groupView/getNodeList.jsp?mid=" + modid + "&serversid=" + $(".servers").val() + "&status=complex";
                $.get(mylink, function(r_data) {


                    $(".complex").html(getmyOptions(r_data));
                    $(".logical_servers").html("");
                    $(".ACIs").html("");
                });
            }
        },
        {
            event: "click",
            eventClass: "complex",
            js: function() {

                var mylink = "ajax/views/groupView/getNodeList.jsp?mid=" + modid + "&complexid=" + $(".complex").val() + "&status=logical_servers";
                $.get(mylink, function(r_data) {


                    $(".logical_servers").html(getmyOptions(r_data));
                    $(".ACIs").html("");
                });
            }
        },
        {
            event: "click",
            eventClass: "logical_servers",
            js: function() {



                var mylink = "ajax/views/groupView/getNodeList.jsp?mid=" + modid + "&logical_serversid=" + $(".logical_servers").val() + "&status=ACIs";
                $.get(mylink, function(r_data) {


                    $(".ACIs").html(getmyOptions(r_data));
                });
            }
        },
        {
            event: "click",
            eventClass: "addNewACI",
            js: function() {

                if ($(".logical_servers  option:selected").val() != undefined) {

                    var selectedlsId = $(".logical_servers  option:selected").val();
                    var nodeId = $(".servers  option:selected").val();
                    $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modid + "&lsiId=" + $(".logical_servers  option:selected").val() + "&status=getACD", function(r_data) {

                        $.get("ajax/views/groupView/getNodeList.jsp?mid=" + modid + "&lsiId=" + $(".logical_servers  option:selected").val() + "&status=allServers", function(allServers) {
                            $.get("ajax/views/groupView/storageProberties.jsp?mid=" + modid + "&server_id=" + $(".servers  option:selected").val(), function(nodeData) {

                                createNewAci(modid, selectedlsId, r_data, allServers, nodeData, nodeId);
                            });
                        });
                    });
                } else {
                    alert("Select a logical server in which you would like to create an ACI!")
                }
            }
        }, {
            event: "click",
            eventClass: "addACI2Act",
            repeat: "one",
            js: function() {
                //<tr><td class="div"><div data-title="Server" class="  undefined ">Paris_DC_Data-Server</div></td><td class="div"><div data-title="Complex" class="  undefined ">Complex0</div></td><td class="div"><div data-title="Appliaction" class="  undefined ">Ora-M1</div></td><td class="hidden"><input data-title="undefined" type="hidden" name="Appliactionid" class="undefined week Appliactionid undefined " value="1392423010769"></td><td class="text"><input data-title="Utilization" type="text" name="" class=" undefined undefined " value="1"></td></tr>
                if ($(".ACIs  option:selected").val() != undefined) {
                    $(".activityAciXref").append("\
              <tr class=''>\n\
      <td ><div >" + $(".servers  option:selected").html() + "</div></td>\n\
       <td ><div >" + $(".complex  option:selected").html() + "</div></td>\n\
       <td ><div >" + $(".ACIs  option:selected").html() + "</div></td>\n\\n\
       <td class='hidden'><input type='hidden' value =" + $(".ACIs  option:selected").val() + "></div></td>\n\
 <td ><input type='text' value='1'></td>/tr>");

                    f.closeWindow();
                } else {
                    alert("Select an application instance to add first!");
                }
            }
        }

    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "activity2aci",
        "title": "add ACI to activity",
        "content": content,
        "footerContent": footer,
        "position": "Center",
        "x": "200",
        "y": "190",
        width: "600", height: "280"
    };
    f._renderWindows();
}



function EditServiceNodeActions(mytype, id) {







    $(".editProcessok").click(function() {

        var mylink = "ProcessType=" + mytype + "&";
        mylink += "status=editNode&id=" + id + "&";
        mylink += "sourceId=" + mysourceId + "&";
        if (mytype == "process") {

            mylink += geturlProcessData(null);
        } else if (mytype == "task") {

            mylink += geturlTaskData(null);
        } else if (mytype == "component") {

            mylink += geturlComponentData(null);
        } else if (mytype == "collector") {

            mylink += geturlCollectorData(null);
        } else if (mytype == "insertion") {

            mylink += geturlInsertionrData(null);
        } else if (mytype == "message") {

            mylink += getUrlmessageData(null);
        }
        else if (mytype == "activity") {

            mylink += getUrlActivityData(null);
        }
        $.get("ajax/views/serviecView/createNode.jsp?" + mylink, function(r_data) {

            muUpdat(mysource.parent, myg, mys_id, myMod_id, mypro_id);
            myg.refresh();
            closeAllWindows();
        })
    });
    $(".editProcessCancel").click(function() {
        closeAllWindows();
    });
}

////////////////////////////edit

////////////////////////////Delete
function serviecDelete(id, mysource, g, s_id, Mod_id, pro_id) {


    myg = g;
    mys_id = s_id;
    myMod_id = Mod_id;
    mypro_id = pro_id;
    var ids = id.split("/");
    var status = "";
    var cellValue = mysource.getValue();
    if ($.trim(ids[0]) == "SERVICE_PROCESS_LINKS") {
        status = "deleteLine";
        cellValue = " this link "
    } else if ($.trim(ids[0]) == "SERVICE_PROCESS_NODES") {
        status = "deletNode";
    }


    var answer = confirm("Do you really want to delete " + cellValue + "?");
    if (answer) {
        var mylink = "status=" + status + "&id=" + ids[1];
        $.get("ajax/views/serviecView/createNode.jsp?" + mylink, function(r_data) {

            muUpdat(mysource.parent, myg, mys_id, myMod_id, mypro_id);
        })
    } else {

    }




}
////////////////////////////Delete

////////////////////////////Create


//newProcessline(g, cell[0].source, cell[0].target, s_id, Mod_id, pro_id, cell[0])
function newProcessline(g, source, target, s_id, Mod_id, pro_id, line, type, parent) {

    console.log(type + parent);
    myg = g;
    mysourceId = source.getId();
    myline = line;
    mysource = source;
    mytarget = target;
    mys_id = s_id;
    myMod_id = Mod_id;
    mypro_id = pro_id;
    var data = "<script>newProcesslineActions('" + source.getId() + "','" + target.getId() + "');</script><div class=\"view_pre mydata\">";
    data += CreateFiled("Utilization Frequency in %", "text", "uF", "", "");
    data += "<div class='typeData'></div>";
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "newProcesslineok");
    data += CreateFiled("Cancel", "button", "newProcesslineCancel", "", "_50");
    data += "</div>";
    return data;
}




function newProcesslineActions(sid, tid) {


    $(".newProcesslineok").click(function() {

        var mylink = "MODEL_ID=" + myMod_id + "&status=addLine&sourceId=" + sid + "&tid=" + tid + "&uF=" + $(".uF").val();
        $.get("ajax/views/serviecView/createNode.jsp?" + mylink, function(r_data) {
            closeAllWindows();
            muUpdat(mysource.parent, myg, mys_id, myMod_id, mypro_id);
        })



    })


    $(".newProcesslineCancel").click(function() {
        myg.removeCells([myline]);
        myg.refresh();
        closeAllWindows();
    });
}






function updateTypeData(mytype) {
    if (mytype == "process") {
        meWindowsupdat(getProcessData(null), "620", "590");
    } else if (mytype == "activity") {

        meWindowsupdat(getActivityData(null), "490", "460");
    } else if (mytype == "task") {
        meWindowsupdat(getTaskData(null), "650", "620");
    } else if (mytype == "component") {
        meWindowsupdat(getComponentData(null), "490", "460");
    } else if (mytype == "collector") {
        meWindowsupdat(getCollectorData(null), "340", "320");
    } else if (mytype == "insertion") {


        var mylink = "status=getCollectors&id=" + myMod_id;
        $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(r_data) {
            meWindowsupdat(getInsertionrData(null, r_data, null), "370", "400");
        })



    } else if (mytype == "message") {
        meWindowsupdat(getmessageData(null), "336", "306");
    } else if (mytype == "end") {
        meWindowsupdat("", "150", "120");
    }
}




function getUrlActivityData() {
    var aci2act = "";
    $(".aciTableAllRow").each(function() {
        aci2act += $.trim($(this).children(".aciTD").attr('id')) + ","
                + $.trim($(this).children().children(".aci2actUF").val()) + ";";
    })

    var returnData = "&name=" + $(".name").val() + "&comment=" + $(".comment").val() + "&duration=" + $(".duration").val() + "&type=" + $(".activityType").filter(':checked').val() + "&aci2act=" + aci2act
            ;
    return returnData;
}


////////////////////////////Create

////////////////////////////Types

function geturlProcessData() {




    var returnData = "&name=" + $(".name").val() +
            "&comment=" + $(".comment").val() +
            "&selector=" + $(".selector:checked").val() +
            "&days=" + $(".days").val() +
            "&hrs=" + $(".hrs").val() +
            "&min=" + $(".min").val() +
            "&sec=" + $(".sec").val() +
            "&numberOccurances=" + $(".numberOccurances").val() +
            "&startOffset=" + $(".startOffset").val() +
            "&numberStream=" + $(".numberStream").val() +
            "&maxDays=" + $(".maxDays").val() +
            "&maxHrs=" + $(".maxHrs").val() +
            "&maxMin=" + $(".maxMin").val() +
            "&maxSec=" + $(".maxSec").val()
            ;
    return returnData;
}
function getComponentData(values) {

    var name = "";
    var selector = "0";
    var DURATION_1 = "0000";
    var OCCURENCE = "1";
    var visibilty = "hidden";
    var T_O_D = "00:00:00:00";
    var THROUGHPUT = "0";
    var STREAMS = "0";
    var showBatch = "hidden";
    var showTrans = "";
    var COMMENT = "No Comment";
    var Batchstaus = "";
    var Transactionalstaus = "checked";
    if (values != null) {
        name = $.trim(values[2]);
        selector = $.trim(values[8]);
        DURATION_1 = values[9].split("__");
        OCCURENCE = $.trim(values[10]);
        visibilty = "";
        T_O_D = $.trim(values[12]);
        THROUGHPUT = $.trim(values[13]);
        STREAMS = $.trim(values[14]);
        COMMENT = $.trim(values[16]);
        COMMENT = COMMENT.replace("undefined", "");
        if (selector == "1") {
            Batchstaus = "checked";
            Transactionalstaus = "";
            showBatch = "";
            showTrans = "hidden";
        }
        componentValues = values;
    } else {

        componentValues = null;
    }


    var f = new FormClass();
    f.fields = [
        {
            "type": "div",
            "name": "serviceObject  component",
            class: "component"
        }

        ,
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required",
            value: name
        },
        {
            "title": "Comment",
            "type": "textarea",
            "name": "comment",
            pClass: "_100 ",
            "value": COMMENT


        },
        {
            "title": "Batch:",
            "type": "radio",
            "name": "selector",
            pClass: "_100 ",
            "value": 1,
            checked: Batchstaus
        }


        ,
        {
            "title": "transactional:",
            "type": "radio",
            "name": "selector",
            pClass: "_100 ",
            "value": 0,
            checked: Transactionalstaus
        }
        ,
        {
            "title": "days:",
            "type": "number",
            "name": "days",
            pClass: "_25 ",
            "value": DURATION_1[0]}
        ,
        {
            "title": "hrs:",
            "type": "number",
            "name": "hrs",
            pClass: "_25 ",
            "value": DURATION_1[1]
        }
        ,
        {
            "title": "min:",
            "type": "number",
            "name": "min",
            pClass: "_25 ",
            "value": DURATION_1[2]
        }



        ,
        {
            "title": "sec:",
            "type": "number",
            "name": "sec",
            pClass: "_25 ",
            "value": DURATION_1[3]
        }


        , {
            "type": "div",
            "class": "0 " + showTrans + " cont_div",
        },
        {
            "title": "Number of  Occurences:",
            "type": "number",
            "name": "numberOccurances",
            pClass: "_100 ",
            "value": OCCURENCE
        }
        , {
            "type": "enddiv"
        }, {
            "type": "div",
            "class": "1 " + showBatch + " cont_div",
        },
        {
            "title": "Job start offset:",
            "type": "text",
            "name": "startOffset",
            pClass: "_100 ", "value": T_O_D
        },
        {
            "type": "enddiv"
        }
        ,
        {
            "type": "enddiv"
        }


    ];
    f.events = [{
            "action": "toggelShow",
            "show": "checked__selector",
            "hide": ".cont_div", "event": "change",
            "eventClass": "selector"
        }, {
            "event": "change",
            "eventClass": "selector",
            js: function() {
            }
        }
    ];
    return  f._renderhtml();
}
function getProcessData(values) {

    var name = "";
    var selector = "0";
    var DURATION_1 = "0000";
    var OCCURENCE = "1";
    var DURATION_2 = "0000";
    var visibilty = "hidden";
    var T_O_D = "00:00:00:00";
    var STREAMS = "0";
    var showBatch = "hidden";
    var showTrans = "";
    var COMMENT = "No Comment";
    var Batchstaus = "";
    var Transactionalstaus = "checked";
    if (values != null) {
        name = $.trim(values[2]);
        selector = $.trim(values[8]);
        DURATION_1 = values[9].split("__");
        OCCURENCE = $.trim(values[10]);
        DURATION_2 = $.trim(values[11]).split("__");
        visibilty = "";
        T_O_D = $.trim(values[12]);
        THROUGHPUT = $.trim(values[13]);
        STREAMS = $.trim(values[14]);
        COMMENT = $.trim(values[16]);
        COMMENT = COMMENT.replace("undefined", "");
        if (selector == "1") {
            Batchstaus = "checked";
            Transactionalstaus = "";
            showBatch = "";
            showTrans = "hidden";
        }
    }


    var f = new FormClass("processData");
    f.fields = [
        {
            "type": "div",
            "name": "serviceObject  Process",
            class: "process"
        }, {
            type: "border",
            title: "process properties"
        }

        ,
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required",
            value: name
        },
        {
            "title": "Comment",
            "type": "textarea",
            "name": "comment",
            pClass: "_100 ",
            "value": COMMENT


        },
        {
            "title": "Batch:",
            "type": "radio",
            "name": "selector",
            pClass: "_100 ",
            "value": 1,
            checked: Batchstaus
        }


        ,
        {
            "title": "transactional:",
            "type": "radio",
            "name": "selector",
            pClass: "_100 ",
            "value": 0,
            checked: Transactionalstaus
        }
        ,
        {
            "title": "days:",
            "type": "number",
            "name": "days",
            pClass: "_25 ",
            "value": DURATION_1[0]
        }
        ,
        {
            "title": "hrs:",
            "type": "number",
            "name": "hrs",
            pClass: "_25 ",
            "value": DURATION_1[1]
        }
        ,
        {
            "title": "min:",
            "type": "number",
            "name": "min",
            pClass: "_25 ",
            "value": DURATION_1[2]
        }
        ,
        {
            "title": "sec:",
            "type": "number",
            "name": "sec",
            pClass: "_25 ",
            "value": DURATION_1[3]
        }

        , {
            "type": "div",
            "class": "0 " + showTrans + " cont_div",
        },
        {
            "title": "Number of  Occurences:",
            "type": "number",
            "name": "numberOccurances",
            pClass: "_100 ",
            "value": OCCURENCE
        }
        , {
            "type": "enddiv"
        }, {
            "type": "div",
            "class": "1 " + showBatch + " cont_div",
        }
        ,
        {
            "title": "Job start offset:",
            "type": "text",
            "name": "startOffset",
            pClass: "_100 ",
            "value": T_O_D
        },
        {
            "title": "Number of streams:",
            "type": "number",
            "name": "numberStream",
            pClass: "_100 ",
            "value": STREAMS
        },
        {
            "type": "enddiv"
        }, {
            type: "border",
            title: "SLA Limits(optional)"
        }
        , {
            type: "border",
            title: "maximum acceptable window"
        },
        {
            "title": "days:",
            "type": "number",
            "name": "maxDays",
            pClass: "_25 ",
            "value": DURATION_2[0]
        }
        ,
        {
            "title": "hrs:",
            "type": "number",
            "name": "maxHrs",
            pClass: "_25 ",
            "value": DURATION_2[1]
        }
        ,
        {
            "title": "min:",
            "type": "number",
            "name": "maxMin",
            pClass: "_25 ",
            "value": DURATION_2[2]
        }



        ,
        {
            "title": "sec:",
            "type": "number",
            "name": "maxSec",
            pClass: "_25 ",
            "value": DURATION_2[3]
        }, {
            type: "endborder",
            title: ""
        }, {
            type: "endborder",
            title: ""
        }, {
            type: "endborder",
            title: ""
        },
        {
            "type": "enddiv"
        }



    ];
    f.events = [{
            "action": "toggelShow",
            "show": "checked__selector",
            "hide": ".cont_div",
            "event": "change",
            "eventClass": "selector"

        }
    ];
    return  f._renderhtml();
}

function getmessageData(values) {
    var name = "";
    var COMMENT = "No Comment";
    var visibilty = "hidden";
    if (values != null) {
        name = $.trim(values[2]);
        visibilty = "";
        COMMENT = COMMENT.replace("undefined", "");
    }

    var f = new FormClass();
    f.fields = [
        {
            "type": "div",
            "name": " serviceObject  message ",
            class: "message"
        }, {
            type: "border",
            title: "Service Properties"
        },
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required",
            value: name
        },
        {
            "title": "Comment",
            "type": "textarea",
            "name": "comment",
            pClass: "_100 ",
            "value": COMMENT

        }, {
            type: "endborder"
        }, {
            type: "enddiv"
        }
    ];
    return  f._renderhtml();
}

function getActivityData(values, tableData, modId) {
    var name = "";
    var type = "";
    var selector = "0";
    var DURATION_1 = "0";
    var showType = "";
    var showTypeValue = "hidden";
    var activityType = "";
    var rows = [];
    var table = {};
    var COMMENT = "No Comment";
    if (values != null) {
        //1392423082290,Java-M1,Complex0,Paris_DC_Business-Server,1;
        tableData = tableData.split("__");
        for (var i = 0; i < tableData.length; i++) {

            var myaddRow = tableData[i].split(",");
            if ($.trim(myaddRow[1]) != "" && $.trim(myaddRow[1]) != "null") {
                var tempRow = [];
                tempRow.push(myaddRow[3]);
                tempRow.push(myaddRow[2]);
                tempRow.push(myaddRow[1]);
                tempRow.push(myaddRow[0]);
                tempRow.push(myaddRow[4]);
                rows.push(tempRow);
            }
        }
//"<thead><tr><th>Server</th><th>Complex</th><th>Appliaction</th><th>Utilization</th></tr>";

        showType = "hidden";
        showTypeValue = "";
        name = $.trim(values[2]);

        type = $.trim(values[7]);
        activityType = getMyType(type);
        DURATION_1 = values[9].split("__")[3];
        OCCURENCE = $.trim(values[10]);
        DURATION_2 = $.trim(values[11]).split("__");
        T_O_D = $.trim(values[12]);
        THROUGHPUT = $.trim(values[13]);
        STREAMS = $.trim(values[14]);
        COMMENT = $.trim(values[16]);
        COMMENT = COMMENT.replace("undefined", "");

    }
    table = {
        name: "activityAciXref",
        class: "tableClass clear",
        type: "table",
        rows: rows,
        columns: [
            {title: "Server", type: "div"},
            {title: "Complex", type: "div"},
            {title: "Appliaction", type: "div"}, {name: "Appliactionid", type: "hidden"},
            {title: "Utilization", type: "div"}]
    };
    var f = new FormClass("getActivityData");
    f.fields = [{
            "type": "div",
            "name": "serviceObject  activity",
            class: "activity"
        }
        , {
            type: "border",
            title: "Activity Properties"
        }, {
            type: "text",
            name: "name",
            title: "Name",
            pClass: "_50 clear", "required": "required",
            value: name
        }, {
            type: "textarea",
            name: "comment",
            title: "comment",
            pClass: "_100 clear",
            value: COMMENT
        }, {
            "type": "div",
            "name": "activityType " + showType
        }, {
            type: "border",
            title: "Activity type"
        }, {
            type: "radio",
            name: "activityType",
            value: "database",
            title: "database",
            pClass: "_50",
            checked: "checked"
        }, {
            type: "radio",
            name: "activityType",
            value: "application",
            title: "application",
            pClass: "_50"
        }, {
            type: "radio",
            name: "activityType",
            value: "instruction",
            title: "instruction",
            pClass: "_50"
        }, {
            type: "radio",
            name: "activityType",
            value: "peripheral",
            title: "peripheral",
            pClass: "_50"
        }, {
            type: "radio",
            name: "activityType",
            value: "lock",
            title: "lock",
            pClass: "_50"
        }, {
            type: "radio",
            name: "activityType",
            value: "human_transactional",
            title: "human transactional",
            pClass: "_50"
        }, {
            type: "radio",
            name: "activityType",
            value: "human_batch",
            title: "human batch",
            pClass: "_50"
        }, {
            type: "radio",
            name: "activityType",
            value: "delay",
            title: "fixed delay",
            pClass: "_50"
        }, {
            type: "radio",
            name: "activityType",
            value: "vehicle",
            title: "vehicle",
            pClass: "_50"
        }, {
            type: "radio",
            name: "activityType",
            value: "equipment",
            title: "equipment",
            pClass: "_50"
        }

        , {
            type: "radio",
            name: "activityType",
            value: "government",
            title: "Government",
            pClass: "_50"
        }

        , {
            type: "radio",
            name: "activityType",
            value: "bank",
            title: "Bank",
            pClass: "_50"
        }

        ,
        {
            type: "radio", name: "activityType",
            title: "Insurance",
            value: "insurance",
            pClass: "_50",
        }


        , {
            type: "radio",
            name: "activityType",
            value: "industry",
            title: "Industry",
            pClass: "_50"
        }

        , {
            type: "radio",
            name: "activityType",
            value: "housing",
            title: "Housing",
            pClass: "_50"
        }

        , {
            type: "radio",
            name: "activityType",
            value: "stock_exchange",
            title: "Stock Exchange",
            pClass: "_50"
        }








        , {
            type: "endborder"
        },
        {type: "enddiv"

        }, {
            type: "div",
            name: "clear activityTypeValue " + showTypeValue,
            value: "activity Type:",
            pClass: "_50"
        }, {
            type: "label",
            title: activityType,
            value: activityType,
            pClass: "_50"
        },
        {type: "enddiv"

        }, {
            type: "border",
            title: "windows"
        }, {
            type: "number",
            value: DURATION_1,
            title: "duration (secs)",
            name: "duration"
        },
        {
            type: "endborder"
        }, {
            type: "border",
            title: "Application Component Instances"
        }, table, {
            type: "button",
            value: "add ACI",
            name: "add_ac",
            class: "_25"
        }, {
            type: "button",
            value: "remove ACI",
            name: "remove_ac",
            class: "_25"
        },
        {
            type: "endborder"
        },
        {
            type: "endborder"
        },
        {type: "enddiv"

        }
    ];
    f.events = [{
            event: "click",
            eventClass: "remove_ac",
            js: function() {
                if (values != null) {
                    var myID = $("tr.seleted td .Appliactionid").val();
                    if (myID != undefined) {
                        var myslink = "id=" + values[0] + "&status=deletexref&aciId=" + myID;
                        $("tr.seleted").remove();
                        $.get("ajax/views/serviecView/createNode.jsp?" + myslink, function(sr_data) {

                        });
                    } else {
                        //  alert("Please select ACI to remove first!");
                    }
                }
            }
        }, {
            event: "click",
            eventClass: "add_ac",
            js: function() {

                var mylink = "ajax/views/groupView/getNodeList.jsp?mid=" + modId + "&status=groups"

                $.get(mylink, function(r_data) {

                    selectAci(modId, r_data);
                });
            }
        }, {
            action: "classTothis",
            event: "click",
            eventClass: "activityAciXref tr",
            target: "seleted"
        }];

    return  f._renderhtml();

}

function getMyType(type) {
    if (type == 'database') {
        return 'Database';
    } else if (type == 'application') {
        return 'Application';
    } else if (type == 'instruction') {
        return 'Instruction';
    } else if (type == 'peripheral') {
        return 'Peripheral';
    } else if (type == 'lock') {
        return 'Lock';
    } else if (type == 'human_trans') {
        return 'Human Transactional';
    } else if (type == 'human_batch') {
        return 'Human Batch';
    } else if (type == 'delay') {
        return 'Fixed Delay';
    } else if (type == 'vehicle') {
        return 'Transport';
    }
    else if (type == 'equipment') {
        return 'Equipment';
    }
}







var componentValues = null;


function geturlCollectorData() {

    var returnData = "&name=" + $(".name").val() +
            "&comment=" + $(".comment").val()
            ;
    return returnData;
}

function getCollectorData(values) {

    var name = "";
    var visibilty = "hidden";
    var COMMENT = "No Comment";
    if (values != null) {
        name = $.trim(values[2]);
        visibilty = "";
        COMMENT = $.trim(values[16]);
        COMMENT = COMMENT.replace("undefined", "");
    }

    var f = new FormClass();
    f.fields = [
        {
            "type": "div",
            "name": " serviceObject collector",
            class: "collector"
        }

        , {
            type: "border",
            title: "collector Properties"
        },
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required",
            value: name
        },
        {
            "title": "Comment",
            "type": "textarea",
            "name": "comment",
            pClass: "_100 ",
            "value": COMMENT


        }, {
            type: "endborder"
        },
        {
            "type": "enddiv"
        }


    ];
    return  f._renderhtml();
}

function geturlInsertionrData() {

    var returnData = "&name=" + $(".name").val() +
            "&comment=" + $(".comment").val()
            + "&collector=" + $(".collector").val()
            ;
    return returnData;
}

function getInsertionrData(values, collectordata, servesName) {

    var visibilty = "hidden";
    var name = "";
    var COMMENT = "No Comment";
    if (values != null) {
        name = $.trim(values[2]);
        visibilty = "";
        COMMENT = COMMENT.replace("undefined", "");
    }


    var showCollector = "hidden";
    if (servesName != null) {

        showCollector = "";
    }
    var f = new FormClass();
    f.fields = [
        {
            "type": "div",
            "name": " serviceObject  insertion",
            class: "insertion"
        }

        , {
            type: "border",
            title: "insertion Properties"
        },
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required",
            value: name
        },
        {
            "title": "Collector",
            "type": "text",
            "name": "cName",
            pClass: "_100 ",
            class: showCollector,
            value: servesName
        },
        {
            "title": "Comment",
            "type": "textarea",
            "name": "comment",
            pClass: "_100 ",
            "value": COMMENT


        }, {
            type: "select",
            options: collectordata,
            title: "Collectors",
            name: "collector",
            value: servesName
        },
        {
            type: "endborder",
            title: ""}, {
            "type": "enddiv"
        }


    ];
    return  f._renderhtml();
}



function getTaskData(values) {
    var name = "";
    var selector = "0";
    var DURATION_1 = "0000";
    var OCCURENCE = "1";
    var DURATION_2 = "0000";
    var visibilty = "hidden";
    var T_O_D = "00:00:00:00";
    var THROUGHPUT = "0";
    var STREAMS = "1";
    var COMMENT = "No Comment";
    var Type = "logic";
    if (values != null) {
        visibilty = "";
        name = $.trim(values[2]);
        selector = $.trim(values[8]);
        DURATION_1 = values[9].split("__");
        OCCURENCE = $.trim(values[10]);
        DURATION_2 = $.trim(values[11].split("__")[3]);

        T_O_D = $.trim(values[12]);
        THROUGHPUT = $.trim(values[13]);
        STREAMS = $.trim(values[14]);
        COMMENT = $.trim(values[16]);
        COMMENT = COMMENT.replace("undefined", "");
        Type = $.trim(values[7]);
    }
    var SatausLogic = "";
    var RepetitionLogic = "";
    var HumanLogic = "";
    var TransportationLogic = "";
    if (Type == "logic") {
        SatausLogic = "checked='checked'";
    } else if (Type == "preparation") {
        RepetitionLogic = "checked='checked'";
    } else if (Type == "human") {
        HumanLogic = "checked='checked'";
    } else if (Type == "transportation") {
        TransportationLogic = "checked='checked'";
    }
    var Batchstaus = "";
    var Transactionalstaus = "";
    if (selector == "1") {
        Batchstaus = "checked='checked'";
    } else if (selector == "0") {
        Transactionalstaus = "checked='checked'";
    }
    var f = new FormClass();
    f.fields = [
        {
            "type": "div",
            "name": " serviceObject  task",
            class: "task"
        }
        , {
            type: "border",
            title: "Task Properties"
        },
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required",
            value: name
        },
        {
            "title": "Comment",
            "type": "textarea",
            "name": "comment",
            pClass: "_100 ",
            "value": COMMENT


        }
        , {
            type: "border",
            title: "Type"
        }, {
            type: "radio",
            name: "type",
            title: "Logic",
            value: "logic",
            pClass: "_50 ",
            checked: SatausLogic
        }, {
            type: "radio",
            name: "type",
            title: "preparation",
            value: "preparation",
            pClass: "_50",
            checked: RepetitionLogic

        }, {
            type: "radio",
            name: "type",
            title: "human",
            value: "human",
            pClass: "_50",
            checked: HumanLogic
        }, {
            type: "radio", name: "type",
            title: "transportation",
            value: "transportation",
            pClass: "_50",
            checked: TransportationLogic
        }








        , {
            type: "radio", name: "type",
            title: "Government",
            value: "government",
            pClass: "_50",
            checked: TransportationLogic
        }, {
            type: "radio", name: "type",
            title: "Bank",
            value: "bank",
            pClass: "_50",
            checked: TransportationLogic
        }, {
            type: "radio", name: "type",
            title: "Industry",
            value: "industry",
            pClass: "_50",
            checked: TransportationLogic
        }
        , {
            type: "radio", name: "type",
            title: "Housing",
            value: "housing",
            pClass: "_50",
            checked: TransportationLogic
        }, {
            type: "radio", name: "type",
            title: "Insurance",
            value: "insurance",
            pClass: "_50",
            checked: TransportationLogic
        }, {
            type: "radio", name: "type",
            title: "Stock Exchange",
            value: "stock_exchange",
            pClass: "_50",
            checked: TransportationLogic
        }





        , {
            type: "endborder",
            title: ""
        }, {
            title: "Transactional",
            name: "selector",
            type: "radio",
            pClass: "_50",
            value: 0,
            checked: Transactionalstaus


        }, {
            title: "Batch",
            name: "selector",
            type: "radio",
            value: 1,
            pClass: "_50",
            checked: Batchstaus

        }

        , {
            "type": "div",
            "name": "taskexdata",
            class: "task"
        }


        , {
            type: "border",
            title: "windows"
        }, {
            "title": "days:",
            "type": "number",
            "name": "days",
            pClass: "_25 ",
            "value": DURATION_1[0]}
        ,
        {
            "title": "hrs:",
            "type": "number",
            "name": "hrs",
            pClass: "_25 ",
            "value": DURATION_1[1]
        }
        ,
        {
            "title": "min:", "type": "number",
            "name": "min",
            pClass: "_25 ",
            "value": DURATION_1[2]
        }



        ,
        {
            "title": "sec:",
            "type": "number",
            "name": "sec",
            pClass: "_25",
            "value": DURATION_1[3]
        }



        , {
            type: "endborder",
            title: ""
        }, {
            type: "border",
            title: "SLA Limits(optional)"
        },
        {
            "title": "Number of  Occurences (Arrival Rate):",
            "type": "number",
            "name": "numberOccurances",
            pClass: "_100 ",
            "value": OCCURENCE
        }
        ,
        {
            "title": "Expected Throughput (per Second):",
            "type": "number",
            "name": "expectedThroughput",
            pClass: "_100 ",
            "value": THROUGHPUT
        },
        {
            "title": "Expected Resource Consumption:",
            "type": "number",
            "name": "timeDeliver",
            pClass: "_100 ",
            "value": DURATION_2
        }, {
            type: "endborder",
            title: ""
        }, {
            type: "endborder", title: ""
        }, {
            "type": "enddiv"
        },
        {
            "type": "enddiv"
        }

        , {
            "type": "div",
            "name": "taskexdata2",
            class: "task"
        }
        ,
        {
            "title": "Response Time (seconds):",
            "type": "number",
            "name": "numberOccurances2",
            pClass: "_100 ",
            "value": OCCURENCE
        }


        ,
        {
            "type": "enddiv"
        }
    ];




    return  f._renderhtml();

}
////////////////////////////Types


$(function() {


    $(document).on("click", ".show_d_msg", function() {
        var ids = $(this).data("ids").split("/");
        ;
        $.get("ajax/xact/getMessage.jsp?status=getmessageName&id=" + $(this).data("id"), function(data) {

            if (ids[2] !== null && ids[2] !== "null" && ids[2] !== "") {
                msgSCENARIOWindows(data, ids);
            } else {

                msgWindows(data, ids);



            }


        })

    })

})



function msgSCENARIOWindows(data, ids) {
    var f = new FormClass("Massge");
    f.fields = [
        {
            "title": "Message Name",
            "type": "select",
            "name": "msgname",
            options: data
        }
        ,
        {
            "title": "-",
            "type": "info",
            "name": "mylabel"
        }
        ,
        {
            "title": "Datacenter",
            "type": "info",
            "name": "Datacenter"
        },
        {
            "title": "Location",
            "type": "info",
            "name": "Location"
        },
        {
            "title": "Server",
            "type": "info",
            "name": "Server"
        },
        {
            "title": "Component",
            "type": "info",
            "name": "Component"
        },
        {
            type: "border",
            title: ""
        }, {
            "title": "-",
            "type": "headerupdate",
            "name": "headerupdate",
        },
        {
            "title": "Network Protocol:",
            "type": "selectupdate",
            "name": "NetworkProtocol",
            options: "None;TCP/IP;UDP/IP;DECnet4;MPLS"
        },
        {
            "title": "Transport Protocol:",
            "type": "selectupdate",
            "name": "TransportProtocol", options: "None;TCP/IP;UDP/IP;DECnet4;MPLS"

        },
        {
            "title": "Tunneling Protocol:",
            "type": "selectupdate",
            "name": "TunnelingProtocol", options: "None;L2TP;PPTP"

        },
        {
            "title": "Utilization rate (Sending):",
            "type": "numberupdate",
            "name": "Utilizationrate"
        },
        {
            "title": "size Message (Sending):",
            "type": "numberupdate",
            "name": "sizeMessage"
        },
        {
            "title": "Utilization rate (Receiving):",
            "type": "numberupdate",
            "name": "UtilizationrateReceiving"
        },
        {
            "title": "size Message (Receiving):",
            "type": "numberupdate",
            "name": "sizeMessageReceiving"
        },
        {
            "type": "hidden",
            "name": "oid"
        }
        , {
            type: "endborder"
        }

    ];

    var selectType = f._renderhtml();

    f.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "type": "button",
            "name": "msgCancel",
            "value": "Cancel"
        },
        {
            "type": "button",
            "name": "msgok",
            "value": "Ok"
        },
        {
            "type": "enddiv"
        }
    ];
    /**
     * 
     * 
     String SCENARIO_ID = request.getParameter("sid");
     String id = request.getParameter("oid");
     String MODEL_ID = request.getParameter("mid");
     */
    f.events = [
        {
            "event": "change"
            , "eventClass": "msgname"
            , js: function() {


                var v = $(".msgname").val();
                $.get("ajax/xact/getMessage.jsp?mid=" + ids[1] + "&sid=" + ids[2] + "&status=&id=" + v, function(data) {
                    data = data.split(",");
                    $(".oid").val($.trim(data[0]));


                    $(".mylabel").html(toLabels("Destination;Origin"));

                    $(".Location").html(toLabels(data[1]));
                    $(".Datacenter").html(toLabels(data[2]));
                    $(".Server").html(toLabels(data[3]));
                    $(".Component").html(toLabels(data[4]));
                    $(".NetworkProtocol").val(data[5]);
                    $(".TransportProtocol").val(data[6]);
                    $(".TunnelingProtocol").val(data[7]);
                    $(".Utilizationrate").val(data[8]);
                    $(".sizeMessage").val(data[9]);
                    $(".UtilizationrateReceiving").val(data[10]);
                    $(".sizeMessageReceiving").val(data[11]);

                    $.get("ajax/xact/getMessage.jsp?mid=" + ids[1] + "&sid=" + ids[2] + "&status=getmessagescenario&id=" + v, function(datas) {
                        datas = datas.split(",");
                        $(".NetworkProtocol_new").val(datas[5]);
                        $(".TransportProtocol_new").val(datas[6]);
                        $(".TunnelingProtocol_new").val(datas[7]);
                        $(".Utilizationrate_new").val(datas[8]);
                        $(".sizeMessage_new").val(datas[9]);
                        $(".UtilizationrateReceiving_new").val(datas[10]);
                        $(".sizeMessageReceiving_new").val(datas[11]);
                    });

                });


            }
        }, {
            "event": "click"
            , "eventClass": "msgCancel"
            , js: function() {
                f.closeWindow();
            }
        }
        , {
            "event": "click",
            "action": "send"
            , "eventClass": "msgok"
            , "url": "ajax/xact/getMessage.jsp", js: function() {
                f.closeWindow();
            },
            "options": {mid: ids[1], sid: ids[2], status: "setmessagescenario"}
            , done: function() {


                f.closeWindow();
            }






        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "Message",
        "title": "Message Detail",
        "content": selectType,
        "footerContent": footer,
        "x": "510", load: function() {

            var v = $(".msgname").val();
            $.get("ajax/xact/getMessage.jsp?mid=" + ids[1] + "&sid=" + ids[2] + "&status=&id=" + v, function(data) {
                data = data.split(",");
                $(".oid").val($.trim(data[0]));
                $(".mylabel").html(toLabels("Destination;Origin"));

                $(".Location").html(toLabels(data[1]));
                $(".Datacenter").html(toLabels(data[2]));
                $(".Server").html(toLabels(data[3]));
                $(".Component").html(toLabels(data[4]));
                $(".NetworkProtocol").val(data[5]);
                $(".TransportProtocol").val(data[6]);
                $(".TunnelingProtocol").val(data[7]);
                $(".Utilizationrate").val(data[8]);
                $(".sizeMessage").val(data[9]);
                $(".UtilizationrateReceiving").val(data[10]);
                $(".sizeMessageReceiving").val(data[11]);




                $.get("ajax/xact/getMessage.jsp?mid=" + ids[1] + "&sid=" + ids[2] + "&status=getmessagescenario&id=" + v, function(datas) {
                    datas = datas.split(",");
                    $(".NetworkProtocol_new").val(datas[5]);
                    $(".TransportProtocol_new").val(datas[6]);
                    $(".TunnelingProtocol_new").val(datas[7]);
                    $(".Utilizationrate_new").val(datas[8]);
                    $(".sizeMessage_new").val(datas[9]);
                    $(".UtilizationrateReceiving_new").val(datas[10]);
                    $(".sizeMessageReceiving_new").val(datas[11]);
                });


            });

        },
        "y": "90",
        width: "500", height: "370"
    };
    f._renderWindows();


}


function msgWindows(data) {
    var f = new FormClass("Massge");
    f.fields = [
        {
            "title": "Message Name",
            "type": "select",
            "name": "msgname",
            options: data
        }

        ,
        {
            "title": "-",
            "type": "info",
            "name": "mylabel"
        },
        {
            "title": "Datacenter",
            "type": "info",
            "name": "Datacenter"
        },
        {
            "title": "Location",
            "type": "info",
            "name": "Location"
        },
        {
            "title": "Server",
            "type": "info",
            "name": "Server"
        },
        {
            "title": "Component",
            "type": "info",
            "name": "Component"
        },
        {
            type: "border",
            title: ""
        },
        {
            "title": "Network Protocol:",
            "type": "info",
            "name": "NetworkProtocol"
        },
        {
            "title": "Transport Protocol:",
            "type": "info",
            "name": "TransportProtocol"
        }

        ,
        {
            "title": "Tunneling Protocol:",
            "type": "info",
            "name": "TunnelingProtocol"

        },
        {
            "title": "Utilization rate (Sending):",
            "type": "info",
            "name": "Utilizationrate"
        },
        {
            "title": "size Message (Sending):",
            "type": "info",
            "name": "sizeMessage"
        },
        {
            "title": "Utilization rate (Receiving):",
            "type": "info",
            "name": "Utilizationrate"
        },
        {
            "title": "size Message (Receiving):",
            "type": "info",
            "name": "sizeMessageReceiving"
        }
        , {
            type: "endborder"
        }

    ];

    var selectType = f._renderhtml();

    f.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "title": "ok",
            "type": "button",
            "name": "messageok",
            "value": "Ok"
        },
        {
            "type": "enddiv"
        }
    ];

    f.events = [
        {
            "event": "change"
            , "eventClass": "msgname"
            , js: function() {


                var v = $(".msgname").val();
                $.get("ajax/xact/getMessage.jsp?status=&id=" + v, function(data) {
                    data = data.split(",");
                    $(".mylabel").html(toLabels("Destination;Origin"));


                    $(".Location").html(toLabels(data[1]));
                    $(".Datacenter").html(toLabels(data[2]));
                    $(".Server").html(toLabels(data[3]));
                    $(".Component").html(toLabels(data[4]));
                    $(".NetworkProtocol").html(data[5]);
                    $(".TransportProtocol").html(data[6]);
                    $(".TunnelingProtocol").html(data[7]);



                    $(".Utilizationrate").html(data[8]);
                    $(".sizeMessage").html(data[9]);
                    $(".Utilizationrate").html(data[10]);
                    $(".sizeMessageReceiving").html(data[11]);







                });


            }
        }, {
            "event": "click"
            , "eventClass": "messageok"
            , js: function() {
                f.closeWindow();
            }

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "Message",
        "title": "Message Detail",
        "content": selectType,
        "footerContent": footer,
        "x": "510", load: function() {

            var v = $(".msgname").val();
            $.get("ajax/xact/getMessage.jsp?status=&id=" + v, function(data) {
                data = data.split(",");
                $(".mylabel").html(toLabels("Destination;Origin"));


                $(".Location").html(toLabels(data[1]));
                $(".Datacenter").html(toLabels(data[2]));
                $(".Server").html(toLabels(data[3]));
                $(".Component").html(toLabels(data[4]));
                $(".NetworkProtocol").html(data[5]);
                $(".TransportProtocol").html(data[6]);
                $(".TunnelingProtocol").html(data[7]);



                $(".Utilizationrate").html(data[8]);
                $(".sizeMessage").html(data[9]);
                $(".Utilizationrate").html(data[10]);
                $(".sizeMessageReceiving").html(data[11]);






            });

        },
        "y": "90",
        width: "500", height: "370"
    };
    f._renderWindows();


}


function toLabels(v) {
    var r = "";
    var vs = v.split(";");

    for (var i = 0; i < vs.length; i++) {
        var t = vs[i].replaceAll("_", " ");
        r += "<span style=\"margin:1px; display:block; float:left;padding: 1px; width:100px; border:1px solid #333\">" + t + "</span>";
    }


    return r;
}



////////////////////////////Other
function meWindowsupdat(data, height1, height2) {
    $(".mxWindow").css("height", height1 + "px");
    $(".mxWindowPane").css("height", height2 + "px");
    $(".typeData").html(data);
}

function meWindowsupdatr(data, height1, height2) {

    $(".mxWindow").css("height", height1 + "px");
    $(".mxWindowPane").css("height", height2 + "px");
    return  data;
}

function muUpdat(parent, myg, S_ID, M_ID, P_ID) {

    var pid = parent.getId();
    pid.split("/");
    if (pid[1] != null) {

        getch(myg, S_ID, M_ID, parent);
    } else {


        var link2 = "?alias=xact&module=serves&process_id=" + P_ID + "&res_data=" + S_ID + "__" + M_ID


        openService(link2);
    }

}

////////////////////////////Other
