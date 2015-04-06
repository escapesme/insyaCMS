/*
 *
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



var defajax;
var defajax2;
var defajax3;




$(function() {

    $(document).on("click", ".tabs .button", function() {


        $(".mxTooltip").css("visibility", "hidden");

    })
    $(document).on("click", ".mybtclos", function() {
        $(".show_advanced_projection").hide();
    })

})

//<editor-fold defaultstate="collapsed" desc="comment">


function WaitForIFrame() {
    if ($(".advanced_projection").attr('id') != "done") {
        setTimeout("WaitForIFrame();", 200);
    } else {
        done();
    }
}

$(function() {
    $(document).on("click", ".advanced_projection", function() {
        var data = "<iframe style=\"\" class ='advancedFrame' src=\"ajax/results/advanced_projection.jsp?res_data=" + $(this).data("res_data") + "\"/>";
        $(".show_advanced_projection .data").html(data);
        WaitForIFrame();
        $(".show_advanced_projection").show();
    })



    var s = 1;
    $(document).on("click", ".rs_bt_close", function() {
        if (s === 1) {
            $(this).parent().height(0);
            $(".div_rdk_top").show();
            $(".top_data").hide();
            $(".div_bottom").addClass("fullshow");
            $(".div_top").css("overflow", "hidden");
            s = 0;
        } else {

            $(this).parent().height(370);
            $(".div_rdk_top").hide();
            $(".div_top").css("overflow", "auto");
            $(".top_data").show();
            $(".div_bottom").removeClass("fullshow");
            s = 1;

        }


    })
})





















//</editor-fold>




function obcalert(MODEL_ID) {




    var f = new FormClass("OBC_Setup");
    f.fields = [{
            "type": "div",
            "class": ""

        },
        {
            "type": "label",
            "class": "",
            "value": "Alert: Some trajectories have not been tagged with counter identifiers which are needed for building a case. Click \"Build Case\" if you would like to continue anyway or \n\
click on \"Settings\" to tag the counter identifiers."

        },
        {
            "type": "enddiv"
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
            "name": "OBC_Build_Case",
            "value": "Build Case"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "OBC_Setting",
            "value": "Setting"
        },
        {
            "type": "enddiv"
        }
    ];
    f.events = [
        {action: "send",
            options: {MODEL_ID: MODEL_ID, check: "1"},
            url: "ajax/project/OBC_Case.jsp",
            event: "click",
            eventClass: "OBC_Setupok"

        }, {
            "event": "click"
            , "eventClass": "OBC_Build_Case"
            , js: function() {
                f.closeWindow();
                OBC_Setup(MODEL_ID);
            }

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "OBC_Alert",
        "title": " OBC Alert:",
        "content": selectType,
        "footerContent": footer,
        "x": "510",
        "y": "90",
        width: "500", height: "240"
    };
    f._renderWindows();
}

function OBC_Setup(id) {
    var MODEL_ID = id;
    var f = new FormClass("OBC_Setup");
    f.fields = [
        {
            "type": "label",
            "title": " Trajectory List", "class": " _50"

        }, {
            "type": "label",
            "title": "Activities", "class": "ActivititesLabels _50"

        },
        {
            "type": "div",
            "class": " _50 OBC_Setup_left"

        },
        {
            "type": "enddiv"
        }, {
            "type": "div",
            "class": " _50 OBC_Setup_right"

        },
        {
            "type": "enddiv"
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
            "name": "OBC_Setupok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "OBC_SetupCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    f.events = [
        {action: "send",
            options: {MODEL_ID: MODEL_ID, sataus: "createGroup"},
            url: "ajax/views/groupView/create.jsp",
            event: "click",
            eventClass: "OBC_Setupok",
            done: function(data) {


                var actData = "";
                var counterData = "";
                $(".activitites tr").each(function() {
                    if ($(this).find("input").is(':checked')) {
                        actData += $(this).find("input").data("tid") + "," + $(this).find("input").val() + ";";
                    }

                })

                $(".trajectory tr").each(function() {
                    counterData += $(this).data("value") + "," + $(this).find("select").val() + "," + $(this).find("select option:selected").text() + ";";
                })


                $.get("ajax/project/OBC_SetupWindows.jsp?status=saveactivity&MODEL_ID=" + MODEL_ID + "&data=" + actData, function(data) {
                    $.get("ajax/project/OBC_SetupWindows.jsp?status=savecounter&MODEL_ID=" + MODEL_ID + "&data=" + counterData, function(data) {




                    })
                })






            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "OBC_SetupCancel"

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "OBC_SetupWindows",
        "title": "Setup OBC Parameters",
        "content": selectType,
        "footerContent": footer,
        load: function(id) {




            var ishere = false;
            $.get("ajax/project/OBC_SetupWindows.jsp?status=aaa&MODEL_ID=" + MODEL_ID, function(data) {

                $(".OBC_Setup_left").html(data);
                // $(".OBC_Setup_right").html("right");



                $(".trajectory tr").click(function() {
                    var t = $(this);
                    $(".trajectory tr").removeClass("act");
                    t.addClass("act");
                    $(".ActivititesLabels").text("Activitites In " + t.find("td").first().text())

                    if (ishere) {

                        $(".activitites tr").hide();
                        $("._" + t.data("value")).show();
                    } else {

                        showMyloading(".main", "start");
                        $.get("ajax/project/OBC_SetupWindows.jsp?status=getactivitites&MODEL_ID=" + MODEL_ID, function(data) {
                            $(".OBC_Setup_right").html(data);
                            $(".activitites tr").hide();
                            $("._" + t.data("value")).show();
                            ishere = true;
                            showMyloading(".main", "end");
                        })



                    }








                })



            })


        },
        "x": "510",
        "y": "90",
        width: "650", height: "240"
    };
    f._renderWindows();
}

$(".OBC_Setup").click(function() {
    var ids = $(this).attr("id").split("__");
    OBC_Setup(ids[1]);
    return false;
})





function getImageLocation(stat, callback) {


    $.ajax({
        type: 'GET',
        url: "ajax/engine/getImageLocation.jsp?stat=" + stat,
        success: callback
    });
}

function getID(callback) {
    $.ajax({
        type: 'GET',
        url: "ajax/engine/getID.jsp",
        success: callback
    });
}

function getSesstion(name, callback) {
    $.ajax({
        type: 'GET',
        url: "ajax/getSesstion.jsp?type=" + name,
        success: callback
    });
}

function clearSesstion(name) {

    $.get("ajax/createSession.jsp?type=" + name, function() {

    });
}

function setSesstion(name, myvalue) {

    $.post("ajax/createSession.jsp", {
        data: myvalue,
        type: name
    }, function(data) {


    });
}
function setajax(url, options, doneCallback, failCallback) {


    $.ajax({
        type: "POST",
        url: url,
        data: options

    }).done(doneCallback).fail(failCallback);
}
function isSesstion(name, callback) {
    $.ajax({
        type: 'GET',
        url: "ajax/isSession.jsp?type=" + name,
        success: callback
    });
}



//<editor-fold defaultstate="collapsed" desc="ProjectWidows Actions">
$(function() {
//alert ("aaaaaaa");

    $(document).on("click", ".pro_list_form_move", function() {
        var link = $(".act").children("td").children(".prolist_link").attr("id");
        $.get("ajax/project/get_models.jsp?&id=" + link, function(data) {

            $(".move_Project").parent().parent().parent().parent().parent().parent().remove();
            $(".addCID_Project").parent().parent().parent().parent().parent().parent().remove();
            $(".usres_Project").parent().parent().parent().parent().parent().parent().remove();
            makeWinDows("Move Project :Models", "move_Project", models_project(data, link), 420, 220, 400, null);
        });
    });
    $(document).on("click", ".pro_list_form_delete", function() {
        var link = $(".act").children("td").children(".prolist_link").attr("id");
        $.get("ajax/engine/DBDeleteRow.jsp?table=project&id=" + link, function(data) {

            $(".act").hide();
        });
    });
    $(document).on("click", ".pro_list_form_new", function() {
        makeWinDows("Edit Project", "Edit_Project", new_project(), 400, 200, 400, null);
    })


    $(document).on("click", ".data_grid tr", function() {
        $(".data_grid tr").removeClass("act");
        $(this).addClass("act");
    })







    $(document).on("click", ".pro_list_form_close", function() {
        $(".pro_list_form").parent().parent().parent().parent().parent().parent().hide();
    })


    $(document).on("click", ".pro_list_form a", function() {
        return false;
    })


    $(document).on("click", ".pro_list_form_creat", function() {

        create_Project();
    })









    $(document).on("click", ".pro_list_form_open", function() {



        var link = $("tr.act").children("td").children(".prolist_link").attr("href");
        $.get("ajax/engine/getModel.jsp" + link, function(r_data) {


            $(".models_list .cont").html(r_data);
            closeWindows("pro_list_form");
            openCorporate(".get_model:first", "s");
        })






    })


    $(document).on("click", ".delete_project", function() {

        var proId = $("tr.act").children("td").children(".prolist_link").attr("id");
        if (proId != "" && proId != null) {
            $.get("ajax/project/deleteProject.jsp?pro_id=" + proId, function(r_data) {


                alert(r_data);
            })

        } else {
            alert("Please Select a Project to Import to First");
        }



    })

    $(document).on("click", ".import_model", function() {


        var proId = $("tr.act").children("td").children(".prolist_link").attr("id");
        if (proId != "" && proId != null) {
            getImageLocation("exports", function(imageLocaiton) {




                importModel(proId, $.trim(imageLocaiton));
            })

        } else {
            alert("Please Select a Project First");
        }



    })
    $(document).on("click", ".deleteProject", function() {


        var proId = $("tr.act").children("td").children(".prolist_link").attr("id");
        var pName = $("tr.act").children("td").children(".prolist_link").text();
        if (proId != "" && proId != null) {

            var c = confirm("Are you sure you want to delete the project '" + pName + "'?");
            if (c) {
                $.get("ajax/project/deleteProject.jsp?status=project&id=" + proId, function(data) {
                    $("tr.act").remove();
                })

            }



        } else {
            alert("Please Select a Project First");
        }



    })



    $(document).on("dblclick", ".pro_list_form a", function() {





        var link = $(this).attr("href");
        $.get("ajax/engine/getModel.jsp" + link, function(r_data) {
            $(".models_list .cont").html(r_data);
            closeWindows("pro_list_form");
            openCorporate(".get_model:first");
        })



        return false;
    })



    $(document).on("dblclick", ".pro_list_form tr", function() {





        var link = $(this).children("td").children(".prolist_link").attr("href");
        $.get("ajax/engine/getModel.jsp" + link, function(r_data) {
            $(".models_list .cont").html(r_data);
            closeWindows("pro_list_form");
            openCorporate(".get_model:first");
        })



        return false;
    })

})
//</editor-fold>









function openImplementation() {

    $(".showtool").html("");
    $(".showtool").hide();
}



function showMyloading(myclass, Status, size) {


//size = full small 

//   $(".main").append("<div class=\"myloading\"><img src=\"/Xact/images/ajax-loader.gif\" /> </div>"); 
    if (Status === "start") {
        $(".myloading").remove();
        $(myclass).append("<div class=\"myloading " + size + "\"><img src=\"/Xact/images/ajax-loader.gif\" /> </div>");
    } else {
        $(".myloading").remove();
        //  $(myclass).remove(".myloading"); 

    }


}

function showMyloadingCompute(id) {



    var retdata = "0";
    var stat = "0";
    $(".myloadingcom").remove();
    $(".main").everyTime(5000, function(i) {
        $.get("ajax/engine/returnResultValue.jsp?table=compute_control&dbtype=res&filde=STATUS&ofilde=ID&id=" + id, function(edata) {
            if (($.trim(edata) == "1" && stat != "8") || ($.trim(edata) != "1")) {
                stat = $.trim(edata);
            }





            if (stat == "1") {

// $(".myloading").remove();
                $(".main").append("<div style=\"z-index:99999\" class=\"myloadingcom\"><img src=\"images/ajax-loadercom.gif\" /> </div>");
                retdata = "1";
                stat = "8";
            } else if (stat == "8") {


            }

            else {


                $(".myloadingcom").remove();
                $(".main").stopTime();
            }




        })
    })


    return retdata;
}

function UpdateCorporate(id, sid) {
    var link = "?alias=xact&model_id=" + id;
    if (sid != null) {
        link += "&scen_id=" + sid + "&type=scenario";
    }
    var all_ids = ("0__" + id + "__0").split("__");
    cdo(all_ids, link, "c", "");
}

function openScenario(project_id, model_id, scen_id, type) {
    var link = "?alias=xact&model_id=" + model_id + "&scen_id=" + scen_id + "&type=scenario ";
    var ides = project_id + "__" + model_id + "__" + scen_id + "__" + type;
    cdo(ides, link);
}

function openCorporate(my, type, other) {






    $(".get_model").css("font-weight", "normal");
    $(my).css("font-weight", "bolder");
    var link = $(my).attr("href");
    if ($(my).attr("id")) {


        var all_ids = $(my).attr("id").split("__");
        //alert(link);




        var send_id = all_ids[2];
        if (send_id == "0") {
            send_id = all_ids[1];
        }




        var x = new Array(defajax3);
        ajaxAbort(x);
        defajax3 = loadAjax("ajax/engine/returnValue.jsp?table=PROJECT&filde=name&ofilde=pid&id=" + all_ids[0], "title", "hide", "", " On X-Act Web Tool", "", "text");
        if (showMyloadingCompute(send_id) == "0") {
            cdo(all_ids, link, type, other);
        }

    }
}


var number = 0;
function cdo(pro_id, link, type, other) {



    $(".im_divs").attr("style", "border:4px solid #000000");
    $(".formoer").remove();
    $("#div_c").addClass("act");
    $(".tabs_divs .tabbody").css("z-index", "0");
    $(".div_c").css("z-index", "1");
    $(".gpreview,.spreview,#div_serves,#div_result,.div_result").hide();
    $(".cpreview").show();
    showMyloading(".main", "start");
    $(".modem,.serves,#xactContainer,#outlineContainer,#Properties_con,#seoutlineContainer_con,.get_cu").html("");
    var x2 = new Array(defajax2);
    ajaxAbort(x2);
    type = "c";
    $(".view_imglobal").show();
    if (pro_id[3] != null) {

        defajax2 = loadAjax("modules/mod_advance_implementation/index.jsp" + link, ".modem", "start,main");
    } else {

        defajax2 = loadAjax("ajax/engine/get_model_1.jsp" + link + "&module=implementation", ".modem", "start,main");
        $(".view_imglobal").show();
    }


    if (type == "c") {
        //  alert (other);
        number++;
        var x = new Array(defajax);
        ajaxAbort(x);
        defajax = loadAjax("modules/ccreate/index.jsp" + link + "&ajax=" + number + "&cor_name=" + other, ".get_cu", "start,main");
    } else {

        var x = new Array(defajax);
        ajaxAbort(x);
        defajax = loadAjax("ajax/engine/getMain.jsp" + link, ".get_cu", "start,main");
    }



    $(document).ajaxStop(function() {
        showMyloading(".main", "end", "modem");
    });
    $(".showtool").html("");
    $(".showtool").hide();
    $("#Properties_con").html("");
    if (pro_id[3] == "1") {
        $("#div_imp").click();
    } else {

        $("#div_c").click();
    }

}

var xhrpp;
function showloading(url, myclass) {

    showMyloading(".main", "start");
    if (xhrpp) {
        xhrpp.abort();
    }
    xhrpp = $.get(url, function(data) {
        $("." + myclass).html(data);
        showMyloading(".main", "end");
    })

}


//opensen

function openService(link2) {

//alert (link2);
    $("#Properties_con,.showtool").html("");
    $(".showtool,.cpreview").hide();
    $(".spreview,#div_serves").show();
    $(".tabs li").removeClass("act");
    $("#div_serves").addClass("act");
    $(".tabs_divs .tabbody").css("z-index", "0");
    $(".div_serves").css("z-index", "1");
    var x2 = new Array(defajax2);
    ajaxAbort(x2);
    defajax2 = loadAjax("ajax/engine/get_model_1.jsp" + link2, ".serves", "all,main");
}

function afterim(id) {

    var meth = $("#" + id);
    var m = meth.attr("style");
    if (m != undefined) {
        m = m.replace("-bottom", "");
    }
    $(".im_divs").attr("style", m);
    //   $(".im_tabs_li").removeClass("act");



    //  meth.addClass("act");


    //   $(".im_divs .imps_vids").css("z-index", "0");

    $(".im_divs .imps_vids").removeClass("actgroup");
    // $("." + id).css("z-index", "1");
    $("." + id).addClass("actgroup");
}



$(document).on("click", ".im_tabs_li", function() {

    $(".im_tabs_li").removeClass("act");
    $(this).addClass("act");
    $(".im_divs .imps_vids").css("z-index", "0");
    var cloudID = $(this).data("cludeid");
    if (cloudID) {
        $(".im_" + cloudID).css("z-index", "1");
        $(".gpreview").show();
    } else {

        $(".imp_viewData").css("z-index", "1");
        $(".gpreview").hide();
    }





})


$(function() {

//var link2 = "?alias=xact&module=groupview&pro_id=" + sendid + "&heighlight=" + id[1];


    $(document).on("click", ".is_View_Server", function() {


        var id = $(this).attr("id").split("__");
        var sendid = "location/" + id[0] + "/null/" + id[2];
        var cloudID = "view_imglobal";
        var cloudName = "Global";
        addCloude(sendid, cloudName, id[1], cloudID);
        $(".show_d").remove();
        $(".spreview").hide();
        $(".cpreview").hide();
        $(".gpreview").show();
        $("#div_group").click();
    })
})

function addCloude(myid, cloudName, heightlight, cloudID, morelink) {


    var h = new helperClass();
    var newcludeID = h.generateId();
    var gruopID = h.generateId();
    $("#groupoutline_con").html("");
    var link2 = "?alias=xact&module=groupview&addto=im_" + newcludeID + "&pro_id=" + myid + "&group=group" + cloudID;
    if (heightlight) {
        link2 += "&heighlight=" + heightlight;
    }

    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = setAjax("ajax/engine/get_model_1.jsp" + link2, "all,main", "", function(data) {
        $(".im_tabs_li").removeClass("act");
        $("#group" + cloudID).remove();
        $(".group" + cloudID).remove();
        //alert(data);
        $(".im_tabs ul").append(" <li    data-cludeid='" + newcludeID + "'  data-groupid='" + gruopID + "'  id='group" + cloudID + "'    style=\"border-bottom:4px solid #" + heightlight + "\"  class=\"formoer im_tabs_li act \"><span>" + cloudName + " Group View </span></li>");
        $(".im_divs").append("<div data-cludeid='" + newcludeID + "'  data-groupid='" + gruopID + "'  class=' group" + gruopID + "  im_" + newcludeID + " formoer imps_vids do_group  actgroup group" + cloudID + "'  >\n\
      <ul class=\"group_tabs\"></ul><div class='data'>" + data + "</div></div>");
        $(".im_divs .imps_vids").css("z-index", "0");
        $(".im_" + newcludeID).css("z-index", "1");
    })





}



function get_computdo_do(id) {

    $(".mybtclos").click(function() {


        $(this).parent().remove();
    })


}

function get_computdo(id, Status) {

    var x2 = new Array(defajax);
    ajaxAbort(x2);
    $(".showframe").remove();
    var data = "<div class=\"showframe\"><script>get_computdo_do(\"" + id + "\");</script>\n\
                <div class=\"mybtclos\"></div><div class=\"data\">";
    defajax = loadAjax("ajax/compute/comput.jsp?id=" + id + "&status=" + Status, ".computwindows", "all,main", "", "</div></div>", data, "append");
}

function openDaignosis(id, status) {


    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = loadAjax("ajax/results/getMainResult.jsp?res_data=" + id + "&status=" + status, ".div_result", "start,main");
    $(".cpreview,.spreview,.showtool").hide();
    $("#Properties_con,.showtool").html("");
    $(".tabs li").removeClass("act");
    $("#div_result").addClass("act");
    $(".tabs_divs .tabbody").css("z-index", "0");
    $(".div_result").css("z-index", "1");
    $(".getresuiltp,#div_result").show("slow");
}

function open_Diagnosis_Repair(resid, point) {


    call(1, "#show_data");
    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = loadAjax("ajax/results/diagnosisRepair.jsp?poent=" + point + "&res_data=" + resid, ".getresuilt", "all,main");
}

function open_Resource_View(resid, point, id) {
    call(2, "#show_datasmv");
    var x2 = new Array(defajax);
    ajaxAbort(x2);
    if (id == null) {

        id = "0"
    }
    defajax = loadAjax("ajax/results/smv/smv.jsp?id=" + id + "&res_id=" + resid + "&point=" + point, ".datasmv", "start,main");
}

function open_Resource_View2(resid, point, id) {
    call(10, "#show_datasmv2");
    var x2 = new Array(defajax);
    ajaxAbort(x2);
    if (id == null) {

        id = "0"
    }
    defajax = loadAjax("ajax/results/smv/smv2.jsp?id=" + id + "&res_id=" + resid + "&point=" + point + "&state=smv2", ".datasmv2", "start,main");
}




function chrono_View() {
    call(2, "#chrono_View");
    var x2 = new Array(defajax);
    ajaxAbort(x2);
    if (id == null) {

        id = "0"
    }
    defajax = loadAjax("ajax/results/smv/smv.jsp?id=" + id + "&res_id=" + resid + "&point=" + point, ".chrono_View", "start,main");
}

function open_Service_Result(resid, point) {

    call(3, "#show_datafav");
    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = loadAjax("ajax/results/rmv/rmv.jsp?res_id=" + resid + "&point=" + point, ".datafav", "all,main");
}



function open_reports(resid, point) {

    call(3, "#show_reports");
    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = loadAjax("ajax/results/reports/reportsData.jsp?res_id=" + resid + "&point=" + point, ".reports", "all,main");
}
function open_chro_graph(resid, point, type) {

    $(".chro_graph").html('');
    var jspName = 'chronographView';
    var classType = ".chro_graph";
    var idType = "#chro_graph";
    if (type == 2) {
        jspName = 'throughputView';
    }

    call(7, idType);
    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = loadAjax("ajax/results/" + jspName + ".jsp?res_id=" + resid + "&point=" + point, classType, "all,main");
}

function open_financial_graph(resid, point) {

    call(3, "#financial_graph");
    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = loadAjax("ajax/results/financial_graph.jsp?res_id=" + resid + "&point=" + point, ".financial_graph", "all,main");
}


var show = 3;
function call(myshow, dataf) {
    $(".div_result_tabs li").removeClass("act");
    $(dataf).addClass("act");
    $(".divdata").hide();
    var myid = $(dataf).attr("id");
    myid = myid.replace("show_", "");
    $("." + myid).show();
    show = myshow;
}

function show_d_act_data() {


    $(".myclose").click(function() {


        $(this).parent().remove();
    })

}

function show_d_act_data(scenarioId) {

    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = loadAjax("ajax/xact/getActivity.jsp?id=" + $(".mythida:first").val() + "&scenarioId=" + scenarioId, ".getActivityD", "all,main");
    $(".mythida").change(function() {

        var x2 = new Array(defajax);
        ajaxAbort(x2);
        defajax = loadAjax("ajax/xact/getActivity.jsp?id=" + $(this).val() + "&scenarioId=" + scenarioId, ".getActivityD", "all,main");
    })

    $(".myclose").click(function() {


        $(this).parent().remove();
    })


}






function show_d_msg_data() {

    var x2 = new Array(defajax);
    ajaxAbort(x2);
    defajax = loadAjax("ajax/xact/getMessage.jsp?id=" + $(".mythid:first").val(), ".getMessageD", "all,main")

    $(".mythid").change(function() {

        var x2 = new Array(defajax);
        ajaxAbort(x2);
        defajax = loadAjax("ajax/xact/getMessage.jsp?id=" + $(this).val(), ".getMessageD", "all,main")

    })

    $(".myclose").click(function() {


        $(this).parent().remove();
    })

}





function propertyjs(msg, act, scenarioID) {
    /* $(".show_d_msg").click(function() {
     
     var data = '<script>show_d_msg_data();</script><div class=\"show_d\" style=\"position: absolute;background: #eee;width:500px;z-index: 100000;height:300px;top:20%;left:40%;\"><div class=\"myclose\"></div>' + msg + '</div>';
     $(".messageDetail").append(data);
     })*/

    $(".show_d_act").click(function() {
        var data = '<script>show_d_act_data("' + scenarioID + '");</script><div class=\"show_d\" style=\"position: absolute;background: #eee;width:600px;z-index: 100000;height:120px;top:20%;left:40%;\"><div class=\"myclose\"></div>' + act + '</div>';
        $(".activityDetail").append(data);
    })

}

function getlog(id, AddDate, setDelete, modName, resultsId) {

    comblog_Status(id, AddDate, setDelete, modName, resultsId);
}
function computeDone(id) {

    $(".info").remove();
    $(".showframe").hide();
    $(".comblog").hide();
    openDaignosis(id, "1");
}
function comblog_Status(id, addDate, setdelete, modName, resultsId) {


    var pro_id = id.split("__")[2];
    if (pro_id == "0") {

        pro_id = id.split("__")[1];
    }


    var d = "";
    if (addDate != "" && addDate != null) {



        var df = new Date();
        var curr_date = df.getDate();
        var curr_month = df.getMonth() + 1;
        var curr_year = df.getFullYear();
        d = curr_date + "/" + curr_month + "/" + curr_year;
    }

    var dt = 0;
    var more = "";
    var dt2 = 0;
    //String comcon = db.setDelete(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "MODEL_ID='" + ids[1] + "'")[0];

    if (setdelete != "") {
        $.get("ajax/engine/DBDelete.jsp?table=project&filed=MODEL_ID&id=" + pro_id, function(data) {
        });
    }
    $(document).everyTime(5000, function(i) {

        dt++;
        more += ".";
        $.get("ajax/engine/returnResultValue.jsp?table=compute_control&dbtype=res&filde=STATUS&ofilde=ID&id=" + pro_id, function(edata) {

            edata = $.trim(edata);
            $(".comblog .data").html("");
            if (edata == "3") {


                $.get("ajax/compute/getCompLog.jsp?id=" + id, function(data) {


                    $(".comblog .data").html(data);
                })
                $(document).stopTime();
                $(".comblog_title").text("Compute Successful");
                if (modName != null) {
                    $(".comp_bt").val("Compute");
                    $(".comp_bt").removeAttr('disabled');
                    showMessage("info", "", "Compute for " + modName + " finished successfully.", "View Results", function() {
                        computeDone(resultsId);
                    });
                }
            } else if (edata == "1" || edata == "0") {
                dt2++;
                if (dt2 == "1") {


                    //showMyloadingCompute(pro_id);
                }



                $.get("ajax/compute/getCompLog.jsp?id=" + id, function(data) {


                    $(".comblog .data").html(data);
                })

                $(".comblog_title").text("Compute In Progress" + more);
            }



            else if (edata == "2") {
                $(document).stopTime();
                $.get("ajax/compute/getCompLog.jsp?id=" + id + "&date=" + d, function(data) {

                    $(".comblog .data").html(data);
                })

                $(".comblog_title").text("Compute Failed.");
                if (modName != null) {
                    $.get("ajax/compute/errorCode.jsp?computeId=" + pro_id, function(data) {
                        showMessage("wor", "", "Compute for " + modName + " Failed. Error Code: " + data, "", function() {

                        });
                    })
                }
            }


        })


        if (dt == 3) {

            more = "";
            dt = 0;
        }
    })

}