/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */





//<editor-fold defaultstate="collapsed" desc="TABS CODE">


var tabCounter = 2;
function removeWhere(i) {

    var tabs = $(".qTabs").tabs();
    $(".ui-tabs-nav li").eq(i + 4).remove();
    $("#cwhererows" + i).remove();
    tabs.tabs("refresh");
    tabCounter--;
}

function addTab(label, id, tabContent) {


    if ($("#" + id + tabCounter).length) {


    } else {
        var tabs = $(".qTabs").tabs();
        var tabTemplate = "<li><a href='#{href}'>#{label}</a> </li>";
        var label = label + tabCounter || "Tab " + tabCounter,
                li = $(tabTemplate.replace(/#\{href\}/g, "#" + id + tabCounter).replace(/#\{label\}/g, label)),
                tabContentHtml = tabContent || "Tab " + " content.";
        tabs.find(".ui-tabs-nav").append(li);
        tabs.append("<div id='" + id + tabCounter + "' class='cwhererows'><p>" + tabContentHtml + "</p></div>");
        tabs.tabs("refresh");
        tabCounter++;
    }
}



function removeAllTabs() {

    var siz = $(".ui-tabs-nav li").size();
    for (var i = 1; i < siz; i++) {

        var tabs = $(".qTabs").tabs();
        $("[href='#cwhererows" + i + "']").parent().remove();
        var i2 = i + 1;
        $("#cwhererows" + i2).remove();
        tabs.tabs("refresh");
    }
    tabCounter = 2;
}
function updateTabs() {

    if ($(".joinData").is(":checked")) {


        removeAllTabs();
        $(".joinRow").each(function(jindex) {

            if (jindex >= 1) {



                getAjax("admin/query_data", "status=wherehtml", function(d) {
                    addTab("where", "cwhererows", d);
                });
            }
        })



    } else {
        removeAllTabs();
    }

}
//</editor-fold>


//<editor-fold defaultstate="collapsed" desc="Utiles select, Add Rows ,HTMLTabs">

function addWhereRow(obj) {

    getAjax("admin/query_data", "status=whereRow&options", function(d) {
        var s = $(obj).parent(".Brackets").children(".whereRow").size();
        var n = d.replaceAll("disnone", "disblock");
        $(obj).parent(".Brackets").append(n);
        updateFilesSelectWidthValue($(".tables").val(), "", $(obj).parent(".Brackets").children(".whereRow").eq(s).find(".wherefileds"), "");
        updateFilesSelectWidthValue($(".tables").val(), "", $(obj).parent(".Brackets").children(".whereRow").eq(s).find(".selectwhererow"), "");
    })

}


function queryData(d) {

    d = d.split("__");
    var Data = "\n\
                    <div class='qTabs'>\n\
                    <ul>\n\
                        <li><a href='#tabel'>Table</a></li>\n\
                        <li><a href='#data'>Data</a></li>\n\
                        <li><a href='#where'>Where </a></li>\n\
                        <li> <a href='#more'>More</a></li>\n\
                     </ul>\n\
                      <div id='tabel' class='qbody tabel'>" + d[0] + "</div>\n\
                        <div id='data' class='qbody data'>" + d[1] + "</div>\n\
                        <div id='where' class='qbody where'>" + d[2] + "</div>\n\
                        <div id='more' class='qbody more'>" + d[3] + "</div>\n\
                    </div>";
    return Data;
}


var mid = 0;
function addCDataRow(obj) {


    getAjax("admin/query_data", "status=cdatarow", function(d) {
        mid++;
        var n = d.replaceAll("name=\"cdataType\"", "name=\"cdataType" + mid + "\"");
        $(".cDatarows").append(n);
    })



}


function updateFilesSelect(sql_table, sql_joinetable, withoutaj) {

    if ($(".joinData").is(":checked")) {


        getData("table_fields", "full_options", sql_table, function(d) {

            $(".addFileds").html(d);
            $(".joinRow").each(function(jindex) {



                getData("table_fields", "full_options", $(this).find(".jointables").val(), function(dj) {


                    $(".addFileds").append(dj);
                    if (withoutaj != "1") {
                        updateQuery();
                    }
                })


            })
        })





        $(".innerc.disData").show();
    } else {

        getData("table_fields", "options", sql_table, function(d) {

            $(".addFileds").html(d);
            if (withoutaj != "1") {
                updateQuery();
            }

        })
        $(".innerc.disData").hide();
    }



}

function updateFilesSelectWidthValue(sql_table, sql_joinetable, obj, value) {

    if ($(".joinData").is(":checked") || sql_joinetable == "1") {
        getData("table_fields", "full_options&value=" + value, sql_table, function(d) {

            $(obj).html(d);
            $(".joinRow").each(function(jindex) {

                getData("table_fields", "full_options&value=" + value, $(this).find(".jointables").val(), function(dj) {


                    $(obj).append(dj);
                })
            })
        })




    } else {

        getData("table_fields", "options&value=" + value, sql_table, function(d) {

            $(obj).html(d);
        })
    }



}

//</editor-fold>


//<editor-fold defaultstate="collapsed" desc="For Edit Only">
$(function() {

    $(document).on('change', " .limitl", function() {


        if ($(".limitl").is(':checked')) {
            $(".limitlData").show();
        } else {

            $(".limitlData").hide();
        }

    })

    $(document).on('change', " .orderl", function() {
        if ($(".orderl").is(':checked')) {
            $(".orderlData").show();
        } else {

            $(".orderlData").hide();
        }

    })


})








function editdatjs() {




    $(function() {
        var sql_where = $(".sql_where").val();
        var sql_joinetable = $(".sql_joinetable").val();
        var sql_joine = $(".sql_joine").val();
        var sql_joinetype = $(".sql_joinetype").val();
        var sql_table = $(".sql_table").val();
        var sql_cdata = $(".sql_cdata").val();
        //  var sql_type = $(".sql_type").val();
        var sql_limit = $(".sql_limit").val();
        var sql_order = $(".sql_order").val();
        var sql_cdatas = sql_cdata.split(";");
        getAjax("admin/query_data", "", function(d) {
            $(".quers").append(queryData(d));
            afertCode();
            var tabs;
            //<editor-fold defaultstate="collapsed" desc="Update HTml and Tabs">
            $("body").on("UpdatehtmlTabs", ".quers", function() {
                tabs = $(".qTabs").tabs();
                $(".tables").val($.trim(sql_table));
                var sql_joinetables = sql_joinetable.split(";")
                // $(".jointables").val($.trim(sql_joinetable));



                if ($.trim(sql_joine) == "1") {

                    getAjax("admin/query_data", "status=joinhtml", function(d) {
                        getAjax("admin/query_data", "status=wherehtml", function(wd) {




                            for (var i = 0; i < sql_joinetables.length - 2; i++) {

                                $(".innerc").append(d);
                                addTab("where", "cwhererows", wd);
                            }



                            var sql_whereaww = sql_where.split("@@");
                            for (var z = 0; z < sql_whereaww.length - 1; z++) {

                                var sql_whereaB = sql_whereaww[z].split("()");
                                var nz = parseFloat(z) + 1;
                                var rowwhereData = $(".whereRow").html();
                                $("#cwhererows" + nz).children(".Brackets").remove();
                                for (var B = 0; B < sql_whereaB.length - 1; B++) {

                                    var sql_wheres = sql_whereaB[B].split(";");
                                    var Da = "";
                                    //   alert(sql_wheres);


                                    for (var i = 0; i < sql_wheres.length - 1; i++) {


                                        Da += "<div class='whereRow' >" + rowwhereData + "</div>";
                                    }
                                    ;
                                    var n = Da.replaceAll("disnone", "disblock");
                                    var morforb = '<li style="width:20px; height:20px; cursor: pointer; clear:both" title="Delete Brackets" class="deleteRow ui-state-default ui-corner-all"><span class="ui-icon ui-icon-trash"></span></li><li style="width:20px; height:20px; cursor: pointer; clear:both" title="Add Cdata" class="addwhere ui-state-default ui-corner-all"><span class="ui-icon ui-icon ui-icon-plusthick"></span></li>';
                                    $("#cwhererows" + nz).append("<div class='Brackets' >" + morforb + n + "</div>");
                                }
                            }

                            $('.quers').trigger("updateWhereRos");
                            var sql_orders = sql_order.split(",");
                            updateFilesSelectWidthValue(sql_table, sql_joinetable, " .orderc .addFileds", $.trim(sql_orders[0]));
                            for (var i = 0; i < sql_cdatas.length - 2; i++) {




                                getAjax("admin/query_data", "status=cdatarow", function(d) {
                                    mid++;
                                    var n = d.replaceAll("name=\"cdataType\"", "name=\"cdataType" + mid + "\"");
                                    $(".cDatarows").append(n);
                                    if (mid == sql_cdatas.length - 2) {
                                        $('.quers').trigger("updateCdataRows");
                                    }

                                })

                            }
                        })
                    })
                }





                updateFilesSelect(sql_table, sql_joinetable, "1");
                var sql_limits = sql_limit.split(",");
                $(".limitFrom").val($.trim(sql_limits[0]));
                $(".limitNumber").val($.trim(sql_limits[1]));
                if ($.trim(sql_limits[0]) != "") {

                    $(".limitl").prop('checked', true);
                }


                var sql_orders = sql_order.split(",");
                updateFilesSelectWidthValue(sql_table, sql_joinetable, " .orderc .addFileds", $.trim(sql_orders[0]));
                $(" .orderc .orderType").val($.trim(sql_orders[1]));
                if ($.trim(sql_orders[0]) != "") {

                    $(".orderl").prop('checked', true);
                }




                if ($.trim(sql_joine) == "1") {

                    $(".joinData").prop('checked', true);
                }




            });
            $('.quers').trigger("UpdatehtmlTabs");
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="Update join And where values">
            $("body").on("updateWhereRos", ".quers", function() {


                var sql_joinetables = sql_joinetable.split(";");
                var inx = 0;
                var inx2 = 0;
                for (var i = 0; i < sql_joinetables.length; i++) {
                    var joinetab = sql_joinetables[i].split("__")


                    getAjax("admin/query_data", "status=getTableOptions&value=" + joinetab[1], function(d) {



                        $(".joinRow:eq(" + inx + ")").html();
                        $(".joinRow").eq(inx).find(".jointables").html(d);
                        inx++;
                    });
                    getAjax("admin/query_data", "status=jointypeOption&value=" + joinetab[0], function(d) {

                        $(".joinRow").eq(inx2).find(".jointypeOption").html(d);
                        inx2++;
                    });
                }


                var sql_whereaww = sql_where.split("@@");
                $(".cwhererows").each(function(windex) {


                    var sql_whereaB = sql_whereaww[windex].split("()");
                    $(this).find(".Brackets").each(function(bindex) {





                        var sql_whereas = sql_whereaB[bindex].split(";");
                        $(this).find('.whereRow').each(function(indexww) {


                            var wheres = sql_whereas[indexww].split("__");
                            //   alert(wheres);



                            if (wheres[0] !== undefined && wheres[0] !== "") {
                                $(this).find(".mor").val(wheres[0]);
                            }
                            if (wheres[1] !== undefined && wheres[1] !== "") {

                                var ob = $(this).find(".wherefileds");
                                updateFilesSelectWidthValue(sql_table, sql_joinetable, ob, wheres[1]);
                            }






                            $(this).find(".addFileds").val(wheres[1]);
                            if (wheres[2] !== undefined && wheres[2] !== "") {
                                $(this).find(".opr").val(wheres[2]);
                            }
                            if (wheres[3] !== undefined && wheres[3] !== "") {
                                $(this).find(".textwhererow").val(wheres[3]);
                                var ob = $(this).find(".selectwhererow");
                                updateFilesSelectWidthValue(sql_table, sql_joinetable, ob, wheres[3]);
                                //  if (wheres[4]!="text"){




                                var p = $(this);
                                p.find(".whare_valueType").val(wheres[4]);
                                p.find(".whare_valuedata div").hide();
                                p.find(".whare_valuedata ." + wheres[4]).show();
                                // }



                            }

                        })
                    });
                });
            });
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="Update  Cdata values">

            $("body").on("updateCdataRows", ".quers", function() {


                if (sql_cdatas[0] == "*") {

                    $("input[value='all'].cdataType").prop('checked', true);
                }

                else {

                    $(".cdataRow").each(function(index) {


                        var cdatas = sql_cdatas[index].split("__");
                        if (cdatas[1] !== undefined && cdatas[1] !== "") {

                            var ob = $(this).find(".addFileds");
                            updateFilesSelectWidthValue(sql_table, "", ob, cdatas[1]);
                        }
                        if (cdatas[2] !== undefined && cdatas[2] !== "") {

                            $(this).find(".Filedas").val(cdatas[2]);
                        }

                        if (cdatas[3] == "1") {
                            $(this).find(".foredit").prop('checked', true);
                        }



                        if (cdatas[0] !== "undefined" && cdatas[0] !== null && cdatas[0] !== "") {



                            //  $(this).find("input[value='data'].cdataType").prop('checked', true);
                            $(this).find("input[value='" + cdatas[0] + "'].cdataType").prop('checked', true);
                        } else {

                            $(this).find("input[value='data'].cdataType").prop('checked', true);
                        }


                    })
                }



            });
            //</editor-fold>




        })
    })




}

//</editor-fold>


//<editor-fold defaultstate="collapsed" desc="SQL RENDER">

var SQLWhere = "";
var SQLCDATA = "";
function UpdateCdata(adata) {
    var cdata = "";
    SQLCDATA = "";
    if (adata == "all") {

        cdata = "*";
        SQLCDATA = "*";
    }

    else {

        $(".cdataRow").each(function(index) {




            var t = $(this).find(".cdataType:checked").val();
            var f = $(this).find(".addFileds").val();
            var a = $(this).find(".Filedas").val();
            var foredit = "0";
            if ($(this).find(".foredit").is(":checked")) {

                foredit = "1";
            }



            var tas = "";
            var m = "";
            if (index > 0) {

                m = " , ";
            }
            if (t != "data") {
                cdata += m + t + "(" + f + ") ";
                SQLCDATA += $.trim(t) + "__" + $.trim(f);
            } else {


                SQLCDATA += "__" + $.trim(f);
                cdata += m + "" + f + "";
            }



            if (a != "") {

                cdata += " as " + '"' + a + '"';
            }

            if (a != "1") {

                var more = "";
                var fs = f.split(".");
                if (fs[1] != null) {
                    more = fs[0] + ".";
                }
                if (foredit == "1") {

                    cdata += " , " + more + "id as " + '"hidden_' + more.replace(".", "@") + 'id"';
                }
            }


            SQLCDATA += "__" + $.trim(a) + "__" + foredit;
            SQLCDATA += ";";
        })




    }

    return  cdata;
}

function UpdateWhere() {
    SQLWhere = "";
    var wdata = " WHERE ";
    var data = "";
    $(".Brackets").each(function(bindex) {

        if (bindex > 0) {
            wdata += " " + $(this).children('.whereRow').find(".mor").val();
        }

        var wd2ata = "";
        $(this).find('.whereRow').each(function(index) {


            var m = "";
            var vType = $(this).find(".whare_valueType").val();
            var v = "\"" + $(this).find(".textwhererow").val() + "\"";
            if (vType == "DBfield") {

                v = $(this).find(".selectwhererow").val();
            } else {

                var v = "\"" + $(this).find(".textwhererow").val() + "\"";
            }


            if ($.trim(v) != "" && $.trim(v) != "\"\"") {
                if (index > 0) {
                    m = " " + $(this).find(".mor").val() + " ";
                }

                SQLWhere += $.trim(m) + "__" + $(this).find(".addFileds").val() + "__" + $(this).find(".opr").val() + "__" + v.replaceAll('"', "") + "__" + vType + ";";
                wd2ata += m + "`" + $(this).find(".addFileds").val() + "`" + $(this).find(".opr").val() + v;
            }

        });
        SQLWhere += "()";
        if ($.trim(wd2ata) == "") {
            wdata = "";
        } else {

            wdata += "( " + wd2ata + " )";
        }



    });
    if ($.trim(wdata) == "") {
        data = "";
    } else {

        data += wdata;
    }



    return data;
}

function UpdatejoneWhere() {
    SQLWhere = "";
    var data = " ";
    var wdata = "";
    $(".joinRow").each(function(jindex) {

        wdata += " " + $(this).find(".joinetype").val() + " " + $(this).find(".jointables").val() + " ON ";
        var tin = parseFloat(jindex) + 1;
        $("#cwhererows" + tin).children(".Brackets").each(function(bindex) {

            if (bindex > 0) {
                wdata += " " + $(this).children('.whereRow').find(".mor").val();
            }


            wdata += "(";
            $(this).find('.whereRow').each(function(index) {


                var m = "";
                var vType = $(this).find(".whare_valueType").val();
                var v = "\"" + $(this).find(".textwhererow").val() + "\"";
                if (vType == "DBfield") {

                    v = $(this).find(".selectwhererow").val();
                }


                if ($.trim(v) != "") {
                    if (index > 0) {
                        m = " " + $(this).find(".mor").val() + " ";
                    }




                    SQLWhere += $.trim(m) + "__" + $(this).find(".addFileds").val() + "__" + $(this).find(".opr").val() + "__" + v.replaceAll('"', "") + "__" + vType + ";";
                    wdata += m + " " + $(this).find(".addFileds").val() + $(this).find(".opr").val() + v;
                }

            });
            wdata += ")";
            SQLWhere += "()";
        });
        SQLWhere += "@@";
    });
    if ($.trim(wdata) == "") {
        data = "";
    } else {

        data += wdata;
    }



    return data;
}

function updateJoinTables() {


    var wdata = "";
    $(".joinRow").each(function() {

        wdata += $(this).find(".joinetype").val() + "__" + $(this).find(".jointables").val() + ";";
    })
    return wdata;
}

function UpdateMore() {

    var mdata = "";
    if ($(".orderl").is(':checked')) {
        mdata = " ORDER BY " + $(" .orderc .addFileds").val() + " " + $(" .orderc .orderType").val() + "";
    }


    if ($(".limitl").is(':checked')) {

        mdata += " LIMIT " + $(".limitFrom").val() + "," + $(" .limitNumber").val();
    }




    return  mdata;
}

function updateQuery() {
    var data = "";
    // data = "select";

    var table = $(".tables").val();
    var cdata = UpdateCdata($(".cdataType:checked").val());
    var where = UpdateWhere();
    var more = UpdateMore();
    var joinTables = updateJoinTables();
    if ($(".joinData").is(":checked")) {
        where = UpdatejoneWhere();
    }
    data += "select " + cdata + " from " + table + " " + where + more;
    $("textarea.data").val(data);
    $(".sql_where").val(SQLWhere);
    $(".sql_joinetable").val(joinTables);
    var isjoine = "0";
    if ($(".joinData").is(":checked")) {
        isjoine = "1";
    }

    $(".sql_joine").val(isjoine);
    $(".sql_table").val(table);
    $(".sql_cdata").val(SQLCDATA);
    $(".sql_type").val("select");
    var order = "";
    if ($(".orderl").is(':checked')) {
        order = $(" .orderc .addFileds").val() + " ," + $(" .orderc .orderType").val();
    }
    var limit = "";
    if ($(".limitl").is(':checked')) {

        limit += +$(".limitFrom").val() + "," + $(" .limitNumber").val();
    }




    $(".sql_order").val(order);
    $(".sql_limit").val(limit);
}



//</editor-fold>


//<editor-fold defaultstate="collapsed" desc="Eventes Afetr Get ajax">

function afertCode() {



    $(document).on('change', " .whare_valueType", function() {
        var thValue = $(this).val();
//.parent(".Brackets").children(".whereRow")

        var p = $(this).parent().parent().parent(".whereRow");
        p.find(".whare_valuedata div").hide();
        p.find(".whare_valuedata ." + thValue).show();
    })




    $(document).on('click', " .checkData,.cdataType,.limitl,.orderl,.mor,.opr,.updiateQury", function() {
        updateQuery();
    })
    $(document).on('click', " .updateSelect", function() {
        updateFilesSelectWidthValue($(".tables").val(), "", $(this).parent().children("select"), "");
    })



    $(document).on('click', " .joinData", function() {

        updateFilesSelect($(".tables").val(), $(".jointables").val());
        updateTabs();
    })




    $(document).on('focusout', ".quers input", function() {

        updateQuery();
    })



    $(document).on('change', " .tables,.addFileds", function() {

        updateQuery();
    })

    $(document).on('click', " .checkData", function() {

        var data = $(this).prop("id");
        $("." + data + " input,." + data + "select").css("background", "transparent");
        $("." + data + " input,." + data + "select").prop('disabled', false);
        updateQuery();
    })


    $(document).on('click', " .addcdata", function() {
        addCDataRow(" .addcdata");
        updateQuery();
    })


    $(document).on('click', " .addbrackets", function() {
        var ob = $(this);
        getAjax("admin/query_data", "status=brackets", function(d) {
            var n = d.replaceAll("disnone", "disblock");
            ob.parent().append(n);
        })




        updateQuery();
    })





    $(document).on('click', " .addwhere", function() {
        addWhereRow(this);
        updateQuery();
    })

    $(document).on('click', " .deleteRow", function() {

        $(this).parent().remove();
        updateQuery();
    })
    $(document).on('change', " .tables", function() {
        updateFilesSelect($(".tables").val(), $(".jointables").val());
        updateQuery();
    })
    $(document).on('change', " .jointables", function() {
        updateFilesSelect($(".tables").val(), $(".jointables").val());
        updateQuery();
    })



    $(document).on('click', ".deletejoin", function() {
        removeWhere($(this).parent(".joinRow").index());
        $(this).parent(".joinRow").remove();
        updateTabs();
        updateQuery();
    })

    $(document).on('click', ".addinner", function() {

        getAjax("admin/query_data", "status=joinhtml", function(d) {
            $(".innerc").append(d);
        })


        getAjax("admin/query_data", "status=wherehtml", function(d) {
            addTab("where", "cwhererows", d);
        })

    })


}
//</editor-fold>


//<editor-fold defaultstate="collapsed" desc="Events">

$(function() {

    $(".checkQury").click(function() {
        getAjax("eng/checksql", "data=" + $("textarea.data").val(), function(d) {

            alert(d)

        })
    })
    $(".addQury").click(function() {


        getAjax("admin/query_data", "", function(d) {
            $(".quers").append(queryData(d));
            afertCode();
            var tabs;
            $("body").on("cu", ".quers", function() {
                tabs = $(".qTabs").tabs();
            });
            $('.quers').trigger("cu");
        })
    });
})
//</editor-fold>


