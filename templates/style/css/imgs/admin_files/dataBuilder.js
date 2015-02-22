/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var ops = new Array("data");
function builder_getDataType(val) {
    var typeData = "<select    class='Typestep' ><option></option>";
    for (var o = 0; o < ops.length; o++) {
        var doselect = "";
        if (ops[o] == val) {
            doselect = "selected='selected'";
        } else {
            doselect = "";
        }
        typeData += "<option " + doselect + " >" + ops[o] + "</option>";
    }
    typeData += "</select>";
    return typeData;
}

function updaemyIcone(s, myclass, myclass1) {
    var t = $(s).children("i");

    if (t.hasClass(myclass)) {
        t.switchClass(myclass, myclass1, 100);

    } else {
        t.switchClass(myclass1, myclass, 100);
    }
}



//<editor-fold defaultstate="collapsed" desc="HTML">

function builder_getTypehtmlData(order, id, optionsData, type, name) {

    var typeData = builder_getDataType(type);
    var setpdiv = "<div class='chstep'>\n\
               <div class='stepHeader'>\n\
               <div class='stepOrder'>" + order + "</div>\n\
               <div class='stepNumercont'><label>ID</label><span class='stepNumer' >" + id + "</span></div> \n\
               <div class='headerName'>" + name + "</div>\n\
               <div class='titlediv'><label>Type</label>" + typeData + " </div>\n\
               <div class='stepNumer'>Type</div>\n\
               <li title = 'collapse '  class = 'coll' ><i class=\"fa fa-minus-square-o\"></i></li>\n\
               <li title='Collapse All Children'  class='closeChtypeBt '><i class=\"fa fa-trash-o\"></i> </li>\n\
               </div>\n\
              <div class='chstepOpions'><input type='hidden' class='mydata' value='" + optionsData + "'/></div>\n\
            </div>";
    return setpdiv;
}

function builder_getStephtmlData(order, id, title, TypesData) {

    return  "<div class='step'>\n\
                       <div class='stepHeader'> \n\
                       <div class='stepOrder'>" + order + "</div>\n\
                        <div class='stepNumercont'><label>ID</label><span class='stepNumer' >" + id + "</span></div> \n\
                        <div class='titlediv'><label>Title</label>\n\
                        <input type='text' class=' txtTitlestep' value='" + title + "'/></div>\n\
                        <li title='Delete'  class='closeChStepBt'><i class=\"fa fa-trash-o\"></i></li>\n\
                        <li title='collapse All'  class='collapseAll_s '><i class=\"fa fa-angle-double-down\"></i></li>\n\
                        <li title='collapse '  class='coll '><i class=\"fa fa-minus-square-o\"></i></li>\n\
                        <li title='Add New'  class='addChStepBt'> <i class=\"fa fa-plus\"></i></li>\n\
                        </div>\n\
                       <div class='chstepes'>" + TypesData + "</div></div>";
}
//</editor-fold>


function updateAfterAjax(file) {

    $("body").on("cu", ".stepes", function() {

        var i = 0;
        var len = $(".chstepOpions").length;
        $(".chstepOpions").each(function(index) {


            var pluginsData = $(".plugins_options").val();
            var mychmypro = $(this).children(".mydata").val();
            var mychmypros = mychmypro.split("__");
            var data = arrayValue(mychmypros);
            var obj = $(this);
            var more = "";
            if (pluginsData != null && pluginsData != "") {

                more += "&pluginsData=" + pluginsData;
            }


            getAjax(file, "sumber=" + index + "&type=" + data['type'] + "&id=" + data['typeID'] + "&data=" + mychmypro + more, function(d) {
                $(obj).html(d);
                if (index == len - 1) {
                    $(".pluginTitle").each(function(index2) {



                        var obj = $(this).parent().parent().parent();
                        getAjax("admin/pluginoption", "sumber=" + index2 + "&plugin=" + $(this).val() + more, function(d) {
                            i++;
                            obj.find(".PlguinOptions").html(d);
                        })


                    })
                }


            });
        })


        $(".stepes,.chstepes").sortable({
            stop: function(event, ui) {




                Bluder_update();
            }
        });
    });
    $('.stepes').trigger("cu");
}

function builder_editdata(dw, pro, ids, order, file) {
    var titles = dw.split("%");
    var pros = pro.split("%");
    var orders = order.split("%");
    var mid = ids.split("%");
    var nums = 0;
    for (var i = 0; i < titles.length; i++) {
        if (titles[i] != null && titles[i] != "") {

            var d1 = pros[i].split("|");
            var Types = d1[1].split(";");
            $(".stepes").append(builder_getStephtmlData(orders[i], mid[i], titles[i], updateTypes(Types)));
        }


    }
    updateAfterAjax(file);
}

function Bluder_update() {


    myin2 = 0;
    myin = 0;
    $(".sdata").html("");
    var order = 0;
    $(".tsData").val("");
    var tsdata = "";
    $(".PlguinOptions").each(function(index) {

        var chs = $(this).find("input,select");
        chs.each(function() {
            tsdata += $(this).prop("id") + "=>" + $(this).val() + "__";
        })


        tsdata += ";";
    })


    getAjax("admin/urlcode", "data=" + tsdata + "&status=en", function(d) {


        $("#plugins_options").val(d);
    })


    $(".step").each(function() {
        order++;
        var tsdata = "";
        var chs = $(this).children(".chstepes").children(".chstep");
        //  var sdata = "";


        var Title = $(this).children(".stepHeader").children("div").children(".txtTitlestep").val();
        myin = $(this).index() + 1;
        $(this).children(".stepHeader").children(".stepOrder").text(myin);
        var thissid = $(this).children(".stepHeader").children(".stepNumercont").children(".stepNumer").text();
        var tsdata = "stepid=>" + thissid + "__" + "steporder=>" + order + "__steptitle=>" + Title + "__|";
        chs.each(function() {

            var myin2 = $(this).index() + 1;
            $(this).children(".stepHeader").children(".stepOrder").text(myin2);
            var thissid = $(this).children(".stepHeader").children(".stepNumercont").children(".stepNumer").text();
            $(this).find(".headerName").text($(this).find(".name").val());
            var chs2 = $(this).find(".optionData:not(.checkbox),.optionData:checked");



            tsdata += "typeID=>" + thissid + "__" + "type=>" + $(this).children(".stepHeader").children(".titlediv").children(".Typestep").val() + "__";

            chs2.each(function() {
                //
                //   .prop('tagName');

                if ($(this).prop('tagName') === "TEXTAREA") {

                    tsdata += $(this).prop("id") + "=>" + encodeURIComponent($(this).val()) + "__";

                } else {

                    tsdata += $(this).prop("id") + "=>" + $(this).val() + "__";
                }


            })

            tsdata += ";";
        })


        tsdata += "||";
        $(".tsData").val($(".tsData").val() + tsdata);
        var muinput = "<div class='sdatafiled'>\n\
                                <input class='stepesorder' value='" + order + "' name='stepesOrder[]' />\n\
                                 <input class='stepid' value='" + thissid + "' name='stepid[]' />\n\
                                 <input class='stepesTitle' value='" + Title + "' name='stepesTitle[]' />\n\
                                <textarea name='stepesData[]'  class='stepInputData'>" + tsdata + "</textarea>\n\
                                </div>";
        $(".sdata").append(muinput);
    });
}

function Bluder_update_items(file, Data) {

    UpdateEditFromBluder("", file, Data);
}

function BluderActions(myclass, file) {

    var type = "type";
    var nums = 0;
    var title = "Title";
    var typeData = builder_getDataType("");
//"admin/wizard_data"





    $(".ToggelText").click(function() {

        if ($(".tsData").css("display") === "none") {
            $(".ToggelText span").removeClass("ui-icon-document");
            $(".ToggelText span").addClass("ui-icon-document-b");
            $(".tsData").show();
        } else {

            $(".ToggelText span").removeClass("ui-icon-document-b");
            $(".ToggelText span").addClass("ui-icon-document");
            $(".tsData").hide();
        }




    });
    $(".uFromText").click(function() {



        Bluder_update_items(file, $(".tsData").val());
    });
    $(".uToText").click(function() {


        Bluder_update();
    });
    function getmyajax(type, obj) {
        getAjax(file, "type=" + type, function(d) {
            obj.html(d);
        });
    }


    $(".mysubmit,.myreset").click(function() {
        Bluder_update();
    });
    $('form').submit(function() {

        Bluder_update();
    });
    $(document).on("focusout", ".PlguinOptions input", function() {

        Bluder_update();
    })

    $(".PlguinOptions input").focusout(function() {
        Bluder_update();
    })



    $(myclass + " .addStepBt").click(function() {

        nums++;
        $(myclass + " .stepes").append(builder_getStephtmlData(nums, "s" + nums, "Setp-s" + nums, ""));
        Bluder_update();
        $(myclass + " .stepes," + myclass + " .chstepes").sortable({
            stop: function(event, ui) {

                Bluder_update();
            }
        });
    });
    var nums = 0;
    $(document).on('click', myclass + " .coll", function() {

        var h = $(this).parent(".stepHeader").parent().css("height");
        if (h == "31px") {

            $(this).parent(".stepHeader").parent().css("height", "auto");

            updaemyIcone(this, "fa-plus-square-o", "fa-minus-square-o");

        } else {

            updaemyIcone(this, "fa-plus-square-o", "fa-minus-square-o");
            $(this).parent(".stepHeader").parent().css("height", "31px");
        }



    });
    var collallSatatus = 0;
    $(document).on('click', myclass + " .collapseAll", function() {
        updaemyIcone($(".collapseAll"), "fa-angle-double-down", "fa-angle-double-left");
        if (collallSatatus == 0) {
            collallSatatus = 1;
            $(".step").children(".stepHeader").children(".coll").children("i").switchClass("fa-minus-square-o", "fa-plus-square-o", 100);
            $(".step").css("height", "31px");
        } else {
            collallSatatus = 0;
            $(".step").children(".stepHeader").children(".coll").children("i").switchClass("fa-plus-square-o", "fa-minus-square-o", 100);
            $(".step").css("height", "auto");
        }
    });
    var collSatatus = 0;
    $(document).on('click', myclass + " .collapseAll_s", function() {

        updaemyIcone(this, "fa-angle-double-down", "fa-angle-double-left");
        if (collSatatus == 0) {
            collSatatus = 1;
            var boj = $(this).parent(".stepHeader").parent(".step").children(".chstepes").children(".chstep");
            boj.children(".stepHeader").children(".coll").children("i").switchClass(" fa-minus-square-o", "fa-plus-square-o", 100);
            boj.css("height", "31px");
        } else {
            collSatatus = 0;
            var boj = $(this).parent(".stepHeader").parent(".step").children(".chstepes").children(".chstep");
            boj.children(".stepHeader").children(".coll").children("i").switchClass("fa-plus-square-o", "fa-minus-square-o", 100);
            boj.css("height", "auto");
        }
    });
    $(document).on('change', "#queryid", function() {
        var obj = $(this).parent().parent().parent(".chstepOpions");
        var type = $(".Typestep").val();
        getAjax(file, "type=" + type + "&" + $(this).attr("id") + "=" + $(this).val(), function(d) {

            obj.html(d);
        });
    })

    $(document).on('change', myclass + " .Typestep", function() {
        var type = $(this).val();
        var obj = $(this).parent(".titlediv").parent(".stepHeader").parent(".chstep").children(".chstepOpions");
        getmyajax(type, obj);
    })

    var Tnum = 0;
    $(document).on('click', myclass + " .addChStepBt", function() {


        var numb = $(this).parent().parent().children(".chstepes").children(".chstep").size();
        Tnum = numb + 1;
        var setpdiv = builder_getTypehtmlData(Tnum, "T" + Tnum, "", "");
        $(this).parent(".stepHeader").parent(".step").children(".chstepes").append(setpdiv);
        $(".stepes,.chstepes").sortable({
            stop: function(event, ui) {

                Bluder_update();
            }
        });
    });
    $(document).on('click', myclass + " .closeChStepBt", function() {
        $(this).parent(".stepHeader").parent(".step").remove();
        Bluder_update();
    });
    $(document).on('click', myclass + " .closeChtypeBt", function() {
        $(this).parent(".stepHeader").parent(".chstep").remove();
        Bluder_update();
    });
    $(document).on('change', myclass + " .txtTitlestep", function() {
        $(this).parent(".stepHeader").parent(".step").remove();
        Bluder_update();
    });
}

function arrayValue(attay) {
    var a = new Array();
    $.each(attay, function(key, value) {

        if (value !== null && $.trim(value) !== "") {

            var v = value.split("=>");
            if (v[0] !== null && v[1] !== null) {

                a[v[0]] = v[1];
            }
        }
    })


    return a;
}

function updateTypes(Types) {


    var setpdivd = "";
    var s = 0;
    $.each(Types, function(key, value) {
        if (value !== null && $.trim(value) !== "") {
            var myValue = value;
            var svalueData = value.split("__");
            var T = arrayValue(svalueData);
            s++;
            setpdivd += builder_getTypehtmlData(s + 1, T['typeID'], myValue, T['type'], T['name']);
        }
    })

    return setpdivd;
}

function UpdateEditFromBluder(Type, file, data) {




    var Steps = data.split("||");
    $(".stepes").html("");
    $.each(Steps, function(key, value) {
        if (value !== null && $.trim(value) !== "") {


            var setp = value.split("|");
            if (setp[1] !== null && $.trim(setp[1]) !== "") {


                var setpData = setp[0].split("__");
                var d = arrayValue(setpData);
                var Types = setp[1].split(";");
                var s = 0;
                var setpdivd = "";
                if (d['stepid'] !== null && $.trim(d['stepid']) !== "") {
                    $(".stepes").append(builder_getStephtmlData(d['steporder'], d['stepid'], d['steptitle'], updateTypes(Types)));
                }
            }
        }
    });
    updateAfterAjax(file);
}

function UpdateBluder(dw, pro, ids, order, file) {
    $(function() {
        builder_editdata(dw, pro, ids, order, file);
    });
}

function UpdateFromBluder(myclass, file, addops, data) {
    $(function() {
        if (addops != null) {
            ops = addops;
        }
        UpdateEditFromBluder(myclass, file, data);
    });
}

function getBluder(myclass, file, addops) {
    $(function() {
        BluderActions(myclass, file);
        if (addops != null) {

            ops = addops;
        }
    });
}


