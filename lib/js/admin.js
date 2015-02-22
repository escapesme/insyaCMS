
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */






$(function() {
    $(document).on("click", ".thbutton.save ,.thbutton.__enable,.thbutton.__order", function() {


        var myids = "";
        var myvals = "";
        var field = $(this).data("field");
        var tabel = $(this).data("table");

        $("input." + field).each(function() {

            if ($(this).val() != null & $(this).val() != "") {
                var v = $(this).val();

                if ($(this).is(':checkbox')) {
                    if ($(this).is(":checked")) {

                        v = "1";
                    } else {

                        v = "0";
                    }

                }


                myids += $(this).data("id") + ",";
                myvals += v + ",";

            }
        })



        $(".updatefield").val(field);
        $(".updateids").val(myids);
        $(".updatevalue").val(myvals);
        $(".updatetable").val("data_change");
         $("." + tabel).submit();
    })
})


var thisList = "";
$(document).on("updateListData", function(event, param1, param2) {


    var elems = Array.prototype.slice.call(document.querySelectorAll('.ios'));
    elems.forEach(function(html) {

        var switchery = new Switchery(html, {color: '#0aa699'});
    });
});
function lis_action(listid, table, ids, status) {

    getAjax("admin/admin_actions", "table=" + table + "&status=" + status + "&ids=" + ids, function(d) {
        updateactTab();
    });
}



var actTab = "";
function updateactTab() {



    updateTab("." + actTab);
    if ($("." + actTab).data("parentlistid") != "undefined" && $("." + actTab).data("parentlistid") != null) {


        updateTab("." + $("." + actTab).data("parentlistid"));
    }





}
function updateTab(selector) {



    var infoData = $(selector).data("info");
    if (infoData != null) {
        var info = infoData.replace("?", "");
        addloader(selector);
        getadminAjax("admin/update_list", info, function(d) {
            $(selector).html(d);
            $(document).trigger("updateListData", ["Custom", "Event"]);
            addloader(selector, "end");
        })
    }

}




function updateList(id) {




    var infoData = $(".listindxAll").data("info");
    if (infoData != null) {
        var info = infoData.replace("?", "");
        addloader(".listindxAll");
        getadminAjax("admin/update_list", info + "&mode=listBody", function(d) {



            $("#" + thisList + " .listindxAll").html(d);
            $(document).trigger("updateListData", ["Custom", "Event"]);
            addloader(".listindxAll", "end");
        })
    }

}






function updatetabbody(s) {

    var obj = $(s);
    var infoData = obj.data("info");
    if (infoData != null) {


        addloader(s);
        getadminAjax("admin/update_list", infoData, function(d) {
            obj.html(d);
            $(document).trigger("updateListData", ["Custom", "Event"]);
            addloader(s, "end");
        })
    }

}




function getRandomNumber(range)
{
    return Math.floor(Math.random() * range);
}

function getRandomChar()
{
    var chars = "0123456789abcdefghijklmnopqurstuvwxyzABCDEFGHIJKLMNOPQURSTUVWXYZ";
    return chars.substr(getRandomNumber(62), 1);
}

function randomID(size)
{
    var str = "";
    for (var i = 0; i < size; i++)
    {
        str += getRandomChar();
    }
    return str;
}

$(function() {


    actTab = $(".alltabsbody.index .tabsbody").data("id");
    $(document).on("click", ".ajax.lightbox .addbt,.ajax.lightbox .edit_option", function() {
        if ($(this).data("usercheck") == "true") {


        } else {


            $.colorbox({iframe: true, href: $(this).prop("href"), width: "80%", height: "80%"});
            var p = $(this).parents(".ajax");
            thisList = p.data("listid");
        }
        return false;
    })




//Callback handler for form submit event
    $(document).on("submit", ".tabsbody .form", function(e)
    {

        var formObj = $(this);
        var formURL = formObj.data("info");
        var formData = new FormData(this);
        $.ajax({
            url: formURL,
            type: 'POST',
            data: formData,
            mimeType: "multipart/form-data",
            contentType: false,
            cache: false,
            processData: false,
            success: function(data, textStatus, jqXHR)
            {



                updatetabbody("." + formObj.parents(".tabsbody").data("id"));
                updatetabbody("." + formObj.parents(".tabsbody").data("parentlistid"));
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
            }
        });
        //  e.preventDefault(); //Prevent Default action. 
        // e.unbind();

        return false;
    });
//$("#multiform").submit(); //Submit the form









    $(document).on("click", ".tabstitles.index li", function() {






        actTab = $(this).data("show");
    });
    $(document).on("click", ".tabclose", function() {

        var dataclass = $(this).parent().data("show");
        var tabs = $(this).parents(".list_tabs");
        $(this).parent().remove();
        $("." + dataclass).remove();
        window.location.hash = $(".tabstitles.index li").eq(0).data("show");
        $(".tabstitles.index li").eq(0).addClass("act");
        $(".alltabsbody.index .tabsbody").eq(0).show();
        actTab = $(".alltabsbody.index .tabsbody").data("id");
        return false;
    });
    $(document).on("click", ".ajax.tabsstatus .addbt,.ajax.tabsstatus .edit_option,.ajax.tabsstatus .group_bar a", function() {






        var obj = $(this);
        var code = function() {
            alert("xxxx77777");
            var title = obj.data("title");
            var info = obj.data("info");
            info = info.replace("index.php?", "");
            info = info.replace("getmian.php?file=admin/update_list", "");
            info = info.replace("getmian.php?", "");
            getadminAjax("admin/update_list", info, function(retdata) {

                var id = randomID(10);
                $(".tabstitles.index li").removeClass("act");
                $(".tabstitles.index").append("<li  data-show=\"" + id + "\" class=\"act\">" + title + "<span class='tabclose'><i class=\"fa fa-times-circle\"></i> </span></li>");
                $(".alltabsbody.index .tabsbody").hide();
                $(".alltabsbody.index").append("<div style='display: block;' data-info='" + info + "'  data-id='" + id + "'  data-parentlistid='" + actTab + "'  class=\" ajax tabsstatus tabsbody " + id + "\">" + retdata + "</div>");
                actTab = id;
            });
        }












        if ($.trim($(this).data("usercheck")) == "true") {

            checkuser(code);
        } else {


            var callbacks = $.Callbacks();
            callbacks.add(code);
            callbacks.fire();
        }


        return false;
    })



    function checkuser(code) {



        $(document).on("click", ".usercheck .mysubmit", function() {



            var mail = $(".usercheck .login_email").val();
            var password = $(".usercheck input.password").val();
            getadminAjax("admin/usercheck", "status=check&password=" + password + "&email=" + mail, function(d) {
                if ($.trim(d) == "1") {
                    var callbacks = $.Callbacks();
                    callbacks.add(code);
                    callbacks.fire();
                    $.colorbox.close();
                } else {

                    alert("xxxxxxxxxxxxxxxxxx");
                }
            })

            return false;
        })

        getadminAjax("admin/usercheck", "", function(d) {

            $.colorbox({className: "usercheck", html: "<br/>" + d + "<br/>", title: "user check  ", innerWidth: "600px", innerHeight: "300px"});
        });
    }





    $(document).on("click", ".ajax .delete_option", function() {



        var myid = $(this).data("id");
        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), myid, "delete");
        return false;
    })





    $(document).on("click", ".ajax .delete_all", function() {




        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), getids(p.data("name")), "delete");
        return false;
    })
    $(document).on("click", ".ajax .enable_all", function() {

        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), getids(p.data("name")), "enable");
        return false;
    })
    $(document).on("click", ".ajax .disable_all", function() {

        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), getids(p.data("name")), "disable");
        return false;
    })
    $(document).on("click", ".ajax .Copy_all", function() {

        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), getids(p.data("name")), "copy");
        return false;
    })
    $(document).on("click", ".ajax .remove_all", function() {

        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), getids(p.data("name")), "remove");
        return false;
    })
    $(document).on("click", ".ajax .restore_all", function() {


        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), getids(p.data("name")), "restore");
        return false;
    })
    $(document).on("click", ".ajax .remove_alls", function() {

        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), getids(p.data("name")), "remove_all");
        return false;
    })
    $(document).on("click", ".ajax .restore_alls", function() {

        var p = $(this).parents(".ajax");
        thisList = p.data("listid");
        lis_action($(this).parent("tabsstatus").data("listid"), p.data("table"), getids(p.data("name")), "restore_all");
        return false;
    })







    // updateList("");
    $(document).on("click", ".updateLangBT", function() {





        $.post("/getPostajax.php?status=add", {
            field: $(".updatLangData .field").val(),
            id: $(".updatLangData .id").val(),
            type: $(".updatLangData .type").val(),
            old_data: $(".updatLangData .old-data").val(),
            new_data: $(" .new_data").val(),
            lang: $(".updatLangData .lang").val(),
            status: "add",
            file: "eng/sys_language"})
                .done(function(s) {
                    $.colorbox.close();
                });
    });
    $(document).on("click", ".updateLang", function() {

        var t = $(this);
        var field = "&field=" + $(this).data("input") + "&inputtype=" + $(this).data("inputtype") + "&lang=" + $(this).data("langid");
        getAjax("eng/sys_language", "type=" + $(".this_formdata").val() + "&id=" + $(".this_formdata").data("id") + field, function(d) {

            $.colorbox({html: "<br/>" + d + "<br/>", title: "Update Language - " + t.data("lang"), innerWidth: "600px", innerHeight: "300px"});
        });
    });
});
function close_window() {
    parent.$.fancybox.close();
}




function updateforvalue(cl, title) {

    $(function() {

        var p = $("." + cl + " .imageBar");
        p.append("<h3 class='imagetitle'>" + title + "</h3>");
        p.find("input[type='file']").hide();
    })
}
$(function() {

    $(".closemsg").click(function() {
        $(this).parent().remove();
    })



    $("input.imageurl").on("click", function() {

        var d = $(this).val();
        var ds = d.split("/");
        var p = $(this).parent(".imageBar").parent(".imageInput");
        var img = "<img src='" + d + "'>";
        p.find(".pic_preview").html(img);
        var name = p.find(".pic").prop("name");
        p.append("<input type='hidden' name='" + name + "' value='" + ds[ds.length - 1] + "'  />");
        p.find("input[type='file']").hide();
        $(this).parent(".imageBar").append("<h3 class='imagetitle'>" + ds[ds.length - 1] + "</h3>");
    })



    $(document).on("click", ".deleteimg", function() {

        var p = $(this).parent(".imageBar").parent(".imageInput");
        p.find(".pic_preview").html("");
        var name = p.find(".pic").prop("name");
        p.append("<input type='hidden' name='" + name + "'  />");
        p.find("input[type='file']").show();
        p.find(".imagetitle").remove();
    });
    $(".selectAllrows").change(function() {
        if ($(this).prop("checked")) {

            $(".chos_th .checkbox").prop("checked", true);
            $(".divRow").addClass("selected");
        } else {

            $(".chos_th input").prop("checked", false);
            $(".divRow").removeClass("selected");
        }





    })
})


String.prototype.replaceAll = function(token, newToken, ignoreCase) {
    var str, i = -1, _token;
    if ((str = this.toString()) && typeof token === "string") {
        _token = ignoreCase === true ? token.toLowerCase() : undefined;
        while ((i = (
                _token !== undefined ?
                str.toLowerCase().indexOf(
                _token,
                i >= 0 ? i + newToken.length : 0
                ) : str.indexOf(
                token,
                i >= 0 ? i + newToken.length : 0
                )
                )) !== -1) {
            str = str.substring(0, i)
                    .concat(newToken)
                    .concat(str.substring(i + token.length));
        }
    }
    return str;
};
function selectbar(myclass, url, type) {


    function evn() {
        var datav = "";
        var datan = "";
        $("." + myclass).each(function() {
            var name = $(this).prop("name");
            var value = $(this).val();
            if (value != "") {
                datan += name + ",";
                datav += value + ",";
            }
        })
        var more = "";
        if (type) {

            more = "&type=" + type;
        }


        return  url + "&fvalues=" + datav + "&fnames=" + datan + more;
    }

    $("input." + myclass).keypress(function(e) {
        if (e.which == 13) {

            window.location = evn();
            return false;
        }
    });
    $("select." + myclass).change(function() {

        window.location = evn();
    })





}




function selectbaronly(myclass, url, type) {


    function evn() {
        var datav = "";
        var datan = "";
        $("." + myclass).each(function() {
            var name = $(this).prop("name");
            var value = $(this).val();
            if (value != "") {
                datav += name + "=" + value + "&";
            }
        })
        var more = "";
        if (type) {

            more = "&type=" + type;
        }


        return  url + datav + more;
    }

    $("input." + myclass).keypress(function(e) {
        if (e.which == 13) {

            window.location = evn();
            return false;
        }
    });
    $("select." + myclass).change(function() {

        window.location = evn();
    })





}


















function inputMap(cl, vals, ozoom, ocenter) {


    var sl = "." + cl + "_map";
    var myinput = "." + cl;
    if (ozoom == null) {

        ozoom = 3;
    }

    if (ocenter == null) {

        ocenter = [46.578498, 2.457275];
    }



//<editor-fold defaultstate="collapsed" desc="DataBase">

    function updatelgFromDB(vs) {
        var out;
        var vals = vs.split(";");
        $.each(vals, function(i, marker) {

            var markerdata = marker.split(",");
            if (markerdata[0] != null && markerdata[1]) {
                adddMarker(markerdata[0].replace("(", ""), markerdata[1].replace(")", ""));
            }
        });
        return out;
    }





    function updateMareckers() {



        var markers = $(sl).gmap3({
            get: {
                name: "marker",
                all: true
            }
        });
        var a = "";
        $.each(markers, function(i, marker) {
            var pos = marker.getPosition();
            a += pos + ";";
        });
        $(myinput).val(a);
    }
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="googleMap">


    function clearMarker(id) {


        $(sl).gmap3({
            clear: {
                id: id
            }
        });
    }






    function adddMarker(lat, lng) {


        $(sl).gmap3({
            marker: {
                values: [
                    {latLng: [lat, lng]}
                ],
                options: {
                    draggable: true
                }, events: {
                    mouseover: function(marker, event, context) {

                        var cont = marker.getPosition().toString();
                        var map = $(this).gmap3("get"),
                                infowindow = $(this).gmap3({get: {name: "infowindow"}});
                        if (infowindow) {
                            infowindow.open(map, marker);
                            infowindow.setContent(cont);
                        } else {
                            $(this).gmap3({
                                infowindow: {
                                    anchor: marker,
                                    options: {content: cont}
                                }
                            });
                        }


                    },
                    mouseout: function() {

                    },
                    dragend: function() {
                        updateMareckers();
                    },
                    click: function(marker, event, context) {

                    },
                    rightclick: function(marker, event, context) {
                        var v = confirm("I'm the last one, and i have my own click event");
                        if (v) {
                            clearMarker(context.id);
                            updateMareckers();
                        }

                    }
                }


            }
        });
    }
//</editor-fold>


    $(function() {




        updatelgFromDB(vals);
        $(sl).gmap3({
            map: {
                options: {
                    center: ocenter,
                    zoom: ozoom
                },
                events: {
                    rightclick: function(map, event) {

                        adddMarker(event.latLng.lat(), event.latLng.lng());
                        updateMareckers();
                    }
                }
            }



        });
    })



}

function getDataUpdate(more) {

    $("  .getdata_body tr").removeClass("selected");
    var data = $(" .getdata_body").find(".thisdata").val();
    getAjax("admin/getDataInput", "data=" + data + "&" + more, function(d) {
        $(" .getdata_body .data").html("");
        $(" .getdata_body .data").html(d);
    });
}
function getDatadel(id) {

    $(".getdata_body tr").removeClass("selected");
    var data = $(" .getdata_body").find(".thisdata").val();
    getAjax("admin/getDataInput_del", "data=" + data + "&id=" + id, function(d) {
        $(" .getdata_body .data").html("");
        $(" .getdata_body .data").html(d);
    });
}


function getXrefDatadel(p, dataid, id) {

    $(p + ".getxrefdata tr").removeClass("selected");
    var data = $(p + ".getxrefdata").find(".thisdata").val();
    getAjax("admin/getXrefDataInput_del", "data=" + data + "&id=" + id + "&dataId=" + dataid, function(d) {

        // $(p + ".getxrefdata").parent().html("");
        $(p + ".getxrefdata").parent().html(d);
    });
}




function getXrefDataUpdate(p, id, more) {

    $(p + ".getxrefdata tr").removeClass("selected");
    var data = $(p + ".getxrefdata").find(".thisdata").val();
    getAjax("admin/getXrefDataInput", "data=" + data + "&dataId=" + id + more, function(d) {

        //     $(p + ".getxrefdata").parent().html("");
        $(p + ".getxrefdata").parent().html(d);
    });
}



function selectbarforInput(myclass, url, type) {




    function evn(mor) {
        var datav = "";
        var datan = "";
        $("." + myclass).each(function() {
            var name = $(this).prop("name");
            var value = $(this).val();
            if (value != "") {
                datan += name + ",";
                datav += value + ",";
            }
        })
        var more = "";
        if (type) {

            more = "&type=" + type;
        }


        return  url + "&" + mor + "fvalues=" + datav + "&" + mor + "fnames=" + datan + more;
    }

    $("input." + myclass).keypress(function(e) {
        if (e.which == 13) {

            getDataUpdate(evn(""));
            return false;
        }
    });
    $("select." + myclass).change(function() {

        getDataUpdate(evn(""));
    })



}



function getxrefDataInput(p, Dataid) {



    $(document).bind('cbox_open', function() {
        $(document).bind('cbox_closed', function() {
            getXrefDataUpdate(p, Dataid);
        });
    });
    $(document).on("click", p + ".getxrefdata .addaction", function() {

        $.colorbox({iframe: true, href: $(this).prop("href"), width: "80%", height: "80%"});
        return false;
    });
    $(document).on("click", p + ".getxrefdata .refreshaction", function() {

        getXrefDataUpdate(p, Dataid);
    });
    $(document).on("click", p + ".getxrefdata .delaction", function() {

        var id = $(p + ".getxrefdata tr.selected").find(".thisrowid").val();
        if (id != null) {

            getXrefDatadel(p, Dataid, id);
        }

        return false;
    });
    $(document).on("click", p + ".getxrefdata .editaction", function() {

//thisid
        var id = $(p + ".getxrefdata tr.selected").find(".thisrowid").val();
        if (id != null) {
            $.colorbox({iframe: true, href: $(this).prop("href") + id, width: "80%", height: "80%"});
        }
        return false;
    });
    $(document).on("click", p + " .getxrefdata_table tr", function() {


        /*  if ($(this).hasClass("selected")) {
         
         $(this).removeClass("selected");
         } else {*/
        $(p + "  .getxrefdata_table tr").removeClass("selected");
        $(this).addClass("selected");
        // }


    });
    $(document).on("dblclick", p + " .getxrefdata_table tr", function() {

        var val = $(this).find(".thistitle").val();
        var id = $(this).find(".thisvalue").val();
        $(this).parents(".getdata_all").find(".getdata_title").val(val);
        $(this).parents(".getdata_all").find("input.getdata").val(id);
        $(this).parents(".getdata_body").hide();
    })
    /*
     
     $(".getdata_title").focus(function() {
     
     $(this).parent().find(".getdata_body").show();
     
     
     });
     
     $(".getdata_title").keydown(function(e) {
     
     
     if (e.which == 27) {
     
     $(p + "  .getdata_body tr").removeClass("selected");
     $(this).parent().find(".getdata_body").hide();
     }
     
     });
     
     
     $(".getdata_title").keypress(function(e) {
     if (e.which == 13) {
     
     
     
     
     var info = $(this).parent().find(".getDataInfo").val();
     info = info.split(",");
     var mor = "";
     getDataUpdate("&" + mor + "fvalues=" + $(this).val() + "&" + mor + "fnames=" + info[1]);
     $(this).parent().find(".getdata_body").show();
     
     
     
     
     
     
     return false;
     
     
     }
     });*/


}



function getdDataInput(p) {




    $(document).bind('cbox_open', function() {
        $(document).bind('cbox_closed', function() {
            getDataUpdate();
        });
    });
    $(document).on("click", p + " .getdata_body .addaction", function() {

        $.colorbox({iframe: true, href: $(this).prop("href"), width: "80%", height: "80%"});
        return false;
    });
    $(document).on("click", p + " .getdata_body .refreshaction", function() {

        getDataUpdate();
    });
    $(document).on("click", p + " .getdata_body .delaction", function() {

        var id = $(p + " .getdata_body tr.selected").find(".thisrowid").val();
        if (id != null) {

            getDatadel(id);
        }

        return false;
    });
    $(document).on("click", p + " .getdata_body .editaction", function() {

//thisid
        var id = $(p + " .getdata_body tr.selected").find(".thisrowid").val();
        if (id != null) {
            $.colorbox({iframe: true, href: $(this).prop("href") + id, width: "80%", height: "80%"});
        }
        return false;
    });
    $(document).on("click", p + " .getdata_body tr", function() {

        /*  if ($(this).hasClass("selected")) {
         
         $(this).removeClass("selected");
         } else {*/
        $(p + "  .getdata_body tr").removeClass("selected");
        $(this).addClass("selected");
        // }


    });
    $(document).on("dblclick", p + " .getdata_body tr", function() {

        var val = $(this).find(".thistitle").val();
        var id = $(this).find(".thisvalue").val();
        $(this).parents(".getdata_all").find(".getdata_title").val(val);
        $(this).parents(".getdata_all").find("input.getdata").val(id);
        $(this).parents(".getdata_body").hide();
    })


    $(".getdata_title").focus(function() {

        $(this).parent().find(".getdata_body").show();
    });
    $(".getdata_title").keydown(function(e) {


        if (e.which == 27) {

            $(p + "  .getdata_body tr").removeClass("selected");
            $(this).parent().find(".getdata_body").hide();
        }

    });
    $(".getdata_title").keypress(function(e) {
        if (e.which == 13) {




            var info = $(this).parent().find(".getDataInfo").val();
            info = info.split(",");
            var mor = "";
            getDataUpdate("&" + mor + "fvalues=" + $(this).val() + "&" + mor + "fnames=" + info[1]);
            $(this).parent().find(".getdata_body").show();
            return false;
        }
    });
}







$(function() {









//        $("input.form_row,select.form_row,textarea.form_row,.rowfeild ").tooltip();

    $("#title,#name").change(function() {
        var my = $.trim($(this).val()).replaceAll(" ", "-");
        my = $.trim(my).replaceAll("'", "-");
        my = $.trim(my).replaceAll("\"", "-");
        var outString = my.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '-');
        $("#alias").val(outString);
    })

})



var Filesme = null;
var Filesmeview = null;
function shoeHidePro(allinputs, myalldaa, val, morClass) {


    var hClasses = allinputs.split("__");
    for (var i = 0; i < hClasses.length; i++) {
        if (hClasses[i] != null && $.trim(hClasses[i]) != "") {
            $("." + morClass + hClasses[i]).parent().parent().hide();
        }
        ;
    }




    for (var i = 0; i < myalldaa.length; i++) {


        var d2 = myalldaa[i].split(">>");
        var values = d2[0].split("__");
        for (var v = 0; v < values.length; v++) {




            if ($.trim(values[v]) == $.trim(val)) {


                var sClass = d2[1].split("__");
                for (var s = 0; s < sClass.length; s++) {
                    if (sClass[s] != null && $.trim(sClass[s]) != "") {

                        $("." + morClass + sClass[s]).parent().parent().show();
                    }

                }



            }
        }
    }







}


function ShowHideData(thClass, data, isvalue) {
    $(function() {
        var myalldaa = data.split(";");
        var allinputs = "";
        for (var i = 0; i < myalldaa.length; i++) {
            var d2 = myalldaa[i].split(">>");
            allinputs += d2[1] + "__";
        }

        var morClass = "";
        if (thClass.indexOf("property__") != -1) {
            morClass = "property__";
        }


        if (isvalue != null && $.trim(isvalue) != "") {

            shoeHidePro(allinputs, myalldaa, isvalue, morClass);
        }

        $("." + thClass).change(function() {

            shoeHidePro(allinputs, myalldaa, $(this).val(), morClass);
        })



    })
}



//<editor-fold defaultstate="collapsed" desc="createTabelCraetor">


function updateTotextarea(Filesme, Filesmeview) {
    var d = "";
    Filesmeview.find(".divtr").each(function() {
        d += $(this).find(".dataTitle").text() + "__" + $(this).find(".dataValur").text() + ";";
    });
    Filesme.val(d);
}

function updateFromtextarea(me, view) {
    var allf = me.val();
    allf = allf.split(";");
    view.html("");
    for (var i = 0; i < allf.length; i++) {

        if (allf.length > 0) {
            var row = allf[i].split("__");
            if ($.trim(row[1]) !== "" && $.trim(row[0]) !== "") {
                var ViewData = "\
                        <div  class='divtr tr" + $.trim(row[0]) + "'>\n\
                        <div class='divtd dataTitle'>" + row[0] + "</div>\n\
                        <div class='divtd  dataValur' class='divtd'>" + $.trim(row[1]) + "</div><div class='divtd bts' >\n\
                        <input type='button' class='" + row[0] + "_de_bt item_bt delete_bt' value='X' />\n\
                        </div></div>";
                view.append(ViewData);
                $(document).trigger("customdivtr", null);
            }

        }

    }

}


function  createTabelCraetor(myclass) {



    $(document).on("click", ".delete_bt", function() {

        $(this).parent().parent().remove(".divtr ");
        updateTotextarea($("." + myclass), $(".fileds_view_" + myclass));
    });
    $(document).on("customdivtr", function() {

        $(".fileds_view_" + myclass).sortable({
            revert: true, stop: function(event, ui) {
                updateTotextarea($("." + myclass), $(".fileds_view_" + myclass));
            }
        });
    });
    $(function() {

        if ($("." + myclass).val() != "") {


            updateFromtextarea($("." + myclass), $(".fileds_view_" + myclass));
        }




        $(".fileds_add_" + myclass).click(function() {
            var Filesme = $("." + myclass);
            var Filesmeview = $(".fileds_view_" + myclass);
            var name = $(".fileds_names_" + myclass);
            var title = $(".fileds_title_" + myclass);
            var nameValue = $.trim(name.val());
            Filesme.val(Filesme.val() + ";" + nameValue + "__" + title.val());
            updateFromtextarea(Filesme, Filesmeview);
            updateTotextarea(Filesme, Filesmeview);
            name.val("");
            title.val("");
        });
    });
}
//</editor-fold>

//////////////////////////////tablecraete

//////////////////////////////Formcraete
function umyClass(val, myclass) {

    Filesme = $("." + myclass);
    Filesmeview = $(".fileds_view_" + myclass);
    removeFromfiles(Filesme, Filesmeview, val);
}

function upClass(myid, myclass) {

    Filesme = $("." + myclass);
    var allfall = Filesme.val();
    var allf = allfall.split(";");
    var isd = "";
    for (var i = 0; i < allf.length; i++) {
        var row = allf[i].split("__");
        if ($.trim(row[0]) == myid && isd == "") {
            isd = "done";
            var thval1 = allf[i];
            var thval2 = allf[i - 1];
            allf[i] = thval2;
            allf[i - 1] = thval1;
        }

    }
    var data = "";
    for (var i = 0; i < allf.length; i++) {


        data += allf[i] + ";";
    }

    Filesme.val(data);
    Filesmeview = $(".fileds_view_" + myclass);
    removeFromfiles(Filesme, Filesmeview, "xxxxxxxxxxxxxxxxxxxxxx");
}

function downClass(myid, myclass) {
    Filesme = $("." + myclass);
    var allfall = Filesme.val();
    var allf = allfall.split(";");
    var isd = "";
    for (var i = 0; i < allf.length; i++) {
        var row = allf[i].split("__");
        if ($.trim(row[0]) == myid && isd == "") {
            isd = "done";
            var thval1 = allf[i];
            var thval2 = allf[i + 1];
            allf[i] = thval2;
            allf[i + 1] = thval1;
        }

    }
    var data = "";
    for (var i = 0; i < allf.length; i++) {


        data += allf[i] + ";";
    }

    Filesme.val(data);
    Filesmeview = $(".fileds_view_" + myclass);
    removeFromfiles(Filesme, Filesmeview, "xxxxxxxxxxxxxxxxxxxxxx");
}



function removeFromfiles(me, view, val) {
    var allf = me.val();
    allf = allf.split(";");
    var returnData = "";
    view.html("");
    for (var i = 0; i < allf.length; i++) {
        var row = allf[i].split("__");
        if (($.trim(row[0]) != "" && $.trim(row[0]) != val) || $.trim(row[2]) == "radio") {
            returnData += ";" + allf[i];
            var req = "";
            if (row[4] == "") {

                req = "notRequired"
            } else {
                req = row[4];
            }


            var ViewData = "\
<tr class='tr" + row[0] + "'><td>" + row[0] + "</td>\n\
<td>" + $.trim(row[1]) + "</td><td>" + $.trim(row[2]) + "</td>\n\
<td>" + $.trim(row[3]) + "</td><td>" + $.trim(req) + "</td><td>\n\
<input type='button'   onclick=\"umyClass('" + row[0] + "','" + me.attr("id") + "')\"    class='" + row[0] + "_de_bt item_bt delete_bt' value='X' />\n\
<input type='button'   onclick=\"upClass('" + row[0] + "','" + me.attr("id") + "')\"    class='" + row[0] + "_de_bt item_bt up_bt' value='^' />\n\
<input type='button'  onclick=\"downClass('" + row[0] + "','" + me.attr("id") + "')\"    class='" + row[0] + "_de_bt item_bt down_bt' value='V' />\n\
</td></tr>";
            if ($.trim(row[5]) != "") {



                ViewData += "<tr><th>selectOptions</th><td>type:" + $.trim(row[5]) + "</td><td>data:" + $.trim(row[6]) + "</td><td>values:" + $.trim(row[7]) + "</td><td>tests:" + $.trim(row[8]) + "</td></tr>";
            }

            view.append(ViewData);
        } else {


            $(".tr" + val).remove();
        }


    }
    me.val(returnData);
}

function  createFilesCraetor(myclass) {

    $(function() {
        Filesme = $("." + myclass);
        Filesmeview = $(".fileds_view_" + myclass);
        removeFromfiles(Filesme, Filesmeview, "");
        $(".fileds_type_" + myclass).change(function() {

            if ($(this).val() == "select" || $(this).val() == "list" || $(this).val() == "autocomplete") {
                $(".select_options").show("fast");
            } else {

                $(".select_options").hide("fast");
            }

        })

        $(".fileds_add_" + myclass).click(function() {

            Filesme = $("." + myclass);
            Filesmeview = $(".fileds_view_" + myclass);
            var name = $(".fileds_names_" + myclass);
            var title = $(".fileds_title_" + myclass);
            var value = $(".fileds_value_" + myclass);
            var type = $(".fileds_type_" + myclass);
            var req = "";
            if ($(".fileds_req_" + myclass).is(':checked'))
            {
                req = "required";
            } else {
                req = "notRequired";
            }



            var selectType = $(".fileds_select_type_" + myclass);
            var selectData = $(".fileds_select_data" + myclass);
            var selectValue = $(".fileds_select_values" + myclass);
            var selectText = $(".fileds_select_tesxt" + myclass);
            var nameValue = $.trim(name.val());
            removeFromfiles(Filesme, Filesmeview, nameValue);
            Filesme.val(Filesme.val() + ";" + nameValue + "__" + title.val() + "__" + $.trim(type.val())
                    + "__" + $.trim(value.val()) + "__" + $.trim(req) + "__" + $.trim(selectType.val()) + "__" + $.trim(selectData.val())
                    + "__" + $.trim(selectValue.val()) + "__" + $.trim(selectText.val()));
            removeFromfiles(Filesme, Filesmeview, "");
            name.val("");
            value.val("");
            type.val("");
            title.val("");
        })

    })


}
//////////////////////////////Formcraete

function lightBox(title, data) {
    $.colorbox({html: "<br/>" + data + "<br/>", title: title, innerWidth: "80%", innerHeight: "80%"});
    $(".lightbox_title").html(title);
    $(".lightbox_body").html(data);
    $(".lightbox").fadeIn();
    $(".lightbox_bg").fadeIn();
}

$(function() {





    $(".show_body_html").click(function() {

        var ids = $(this).attr("id").split("__");
        var slink = "../getajax.php?file=admin/viewhtml&table=" + ids[0] + "&field=" + ids[1] + "&id=" + ids[2];
        $.get(slink, function(retdata) {


            lightBox("View Html", retdata);
        })



    })

    $(".tbcont").each(
            function() {





                var s = $(this).html()
                if (s == "") {
                    $(this).parent("td").parent("tr").hide();
                } else {

                    var ti = $(this).attr("title").replace("level_", "");
                    var lti = ti * 1;
                    $(this).width($(this).width() - lti);
                    var mti = ti * 3.5;
                    $(this).css("margin-left", mti + "px");
                    var mtit = ti * 10;
                    var pp = $(this).children().children().children(".optins_th");
                    pp.width(pp.width() - mtit);
                }
            })









    $("th.chos_th").toggle(function() {

        $(".ids").prop("checked", true);
    }, function() {
        $(".ids").prop("checked", false);
    });
})

function saveinner(myform) {




    $(".innert_save").click(function() {
        var myid = $(".innert_save").attr("id").replace("sinner__", "");
        var myvals = "";
        var mynames = "";
        $("#" + myform + " .input__" + myid).each(function() {
            myvals += $(this).val() + ",";
            mynames += $(this).attr("id").split("__")[0] + ",";
        })

        $(".updateids").val(myid);
        $(".updatevalue").val(myvals);
        $(".updatetable").val(mynames);
        $("#" + myform).submit();
    })

}

function  innert_update(myform) {

    $(".inner_option").click(function() {

        var myd = $(this).attr("id");
        myd = myd.replace("inner__", "");
        $(".td__" + myd + " .savediv").html("");
        $(".td__" + myd).append("<div class=\"savediv\"><script>saveinner('" + myform + "')</script><div id=\"sinner__" + myd + "\" class=\"innert_save\" title='Save'></div></div>");
        $(".inner_option").parent("td").parent(".tr__" + myd).children("td").each(function() {


            var dat = $(this).attr("class");
            if (dat == "datainner") {

                var mydata = $(this).children(".input__" + myd + "__info").val().split("__");
                if (mydata[2] == "text") {
                    $(this).html("<input class=\"input__" + myd + " " + mydata[1] + "\"  id=\"" + mydata[1] + "__" + myd + "\"  name=\"" + mydata[1] + "\"/>");
                }
            }
        })





    })
}

function getids(myform) {

    var getids = "";
    $("#" + myform + " .ids").each(function() {

        if ($(this).is(":checked")) {


            getids += $(this).val() + ",";
        }

    })

    return getids;
}








function getValues(myform, myclass) {

    var getids = "";
    $("#" + myform + " ." + myclass).each(function() {
        getids += $(this).val() + ",";
    });

    return getids;
}





function  mulit_enable(myform) {


    $(".normal .enable_all").click(function() {


        var myformn = $(this).attr("id").split("__")[0];
        $("#" + myformn + " .updateids").val(getids(myformn));
        $("#" + myformn + " .updatetable").val("m_enable");
        $("#" + myformn).submit();
    })

}

function  mulit_disable(myform) {


    $(".normal .disable_all").click(function() {
        var myformn = $(this).attr("id").split("__")[0];
        $("#" + myformn + " .updateids").val(getids(myform));
        $("#" + myformn + " .updatetable").val("m_disable");
        $("#" + myformn).submit();
    })

}

function  mulit_copy(myform) {



    $(".normal .copy_all").click(function() {

        var myformn = $(this).attr("id").split("__")[0];
        $("#" + myformn + " .updateids").val(getids(myform));
        $("#" + myformn + " .updatetable").val("copy");
        $("#" + myformn).submit();
    })

}

function  mulit_remove(myform) {



    $(".normal .remove_all").click(function() {

        var myformn = $(this).attr("id").split("__")[0];
        $("#" + myformn + " .updateids").val(getids(myform));
        $("#" + myformn + " .updatetable").val("remove");
        $("#" + myformn).submit();
    })

}

function  mulit_restore(myform) {



    $(".normal .restore_all").click(function() {

        var myformn = $(this).attr("id").split("__")[0];
        $("#" + myformn + " .updateids").val(getids(myform));
        $("#" + myformn + " .updatetable").val("restore");
        $("#" + myformn).submit();
    })

}

function  all_remove(myform) {



    $(".normal .remove_alls").click(function() {

        var myformn = $(this).attr("id").split("__")[0];
        $("#" + myformn + " .updateids").val(getids(myform));
        $("#" + myformn + " .updatetable").val("removeall");
        $("#" + myformn).submit();
    })

}

function  all_restore(myform) {



    $(".normal .restore_alls").click(function() {

        var myformn = $(this).attr("id").split("__")[0];
        $("#" + myformn + " .updateids").val(getids(myform));
        $("#" + myformn + " .updatetable").val("restoreall");
        $("#" + myformn).submit();
    })


}

function mulit_delete(myform) {


    $(".normal .delete_all").click(function() {



        var answer = confirm("Are you sure you want to delete?")
        if (answer) {

            var myformn = $(this).attr("id").split("__")[0];
            $("#" + myformn + " .updateids").val(getids(myform));
            $("#" + myformn + " .updatetable").val("do_delete");
            $("#" + myformn).submit();
        }
        else {

        }











    })



}

function submit(myform) {
    $(".normal .delete_option").click(function() {

        var answer = confirm("Are you sure you want to delete?")
        if (answer) {

            var myid = $(this).attr("id");
            $(".updateids").val(myid.replace("del__", ""));
            $(".updatetable").val("do_delete");
            $("#" + myform).submit();
        }



    })
    /*
     $(".thbutton.__order").click(function() {
     var myids = "";
     var myvals = "";
     var myid = $(this).attr("id");
     $("." + myid).each(function() {
     
     
     
     
     var mval = $(this).attr("id").split("__")[1];
     if (mval != null && $(this).val() != null & $(this).val() != "") {
     myids += $(this).attr("id").split("__")[1] + ",";
     myvals += $(this).val() + ",";
     }
     
     })
     
     
     
     
     myid = myid.replace("__order", "");
     myid = myid.replace("__enable", "");
     $(".updateids").val(myids);
     $(".updatevalue").val(myvals);
     $(".updatetable").val(myid);
     $("#" + myform).submit();
     })
     */
    /*
     $(".thbutton.__enable").click(function() {
     var myids = "";
     var myvals = "";
     var myid = $(this).attr("id");
     
     $("." + myid).each(function() {
     
     
     
     
     var mval = $(this).attr("id").split("__")[1];
     var v = $(this).val();
     if ($(this).is(":checked")) {
     
     v = "1";
     } else {
     
     v = "0";
     }
     if (mval != null && v != null & v != "") {
     myids += $(this).attr("id").split("__")[1] + ",";
     myvals += v + ",";
     }
     
     })
     
     
     myid = myid.replace("__order", "");
     myid = myid.replace("__enable", "");
     $(".updateids").val(myids);
     $(".updatevalue").val(myvals);
     $(".updatetable").val(myid);
     $("#" + myform).submit();
     })
     
     */


}





$(function() {

    $("div.form_row.block.collapse").each(function() {

        $(this).children(".blockData").slideUp();
        $(this).children("span").addClass("slidebarstp");
    })

    $("div.form_row.block .blackbt").toggle(function() {
        $(this).addClass("fa-minus-square");
        $(this).removeClass("fa-plus-square");
        $(this).parent("h3").next(".blockData").slideDown();
    }, function() {



        $(this).removeClass("fa-minus-square");
        $(this).addClass("fa-plus-square");
        $(this).parent("h3").next(".blockData").slideUp();
    }


    )



})







