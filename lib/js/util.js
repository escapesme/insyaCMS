/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



/*
 jQuery.fn.center = function () {
 this.css("position","absolute");
 this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + 
 $(window).scrollTop()) + "px");
 this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
 $(window).scrollLeft()) + "px");
 return this;
 };
 
 */




/*
  * Google Maps documentation: http://code.google.com/apis/maps/documentation/javascript/basics.html
  * Geolocation documentation: http://dev.w3.org/geo/api/spec-source.html
  */




function checkuser(code) {



    $(document).on("click", ".usercheck .mysubmit", function () {



        var mail = $(".usercheck .login_email").val();
        var password = $(".usercheck input.password").val();
        getadminAjax("admin/usercheck", "status=check&password=" + password + "&email=" + mail, function (d) {
            if ($.trim(d) == "1") {
                var callbacks = $.Callbacks();
                callbacks.add(code);
                callbacks.fire();
                $.colorbox.close();



            } else {

                alert("Error: User credentials do not match.");
            }
        })

        return false;
    })

    getadminAjax("admin/usercheck", "", function (d) {

        $.colorbox({className: "usercheck", html: "<br/>" + d + "<br/>", title: "user check  ", innerWidth: "600px", innerHeight: "300px"});
    });
}


function addloader(p, status) {
    if (status == "end") {
        $(p).find(".loaderbg").remove();

    } else {

        $(p).append("<div class='loaderbg'><div class='loader'></div></div>");

    }




}


$(function () {
    $("img.lazy").lazyload({
        event: "sporty"
    });
});

$(window).bind("load", function () {
    var timeout = setTimeout(function () {
        $("img.lazy").trigger("sporty")
    }, 1000);
});



$(function () {








    var l = "";
    if ($("body").data("lang") != null) {
        l = "/" + $("body").data("lang");

    }



    $(".terms-conditions_p  a").eq(0).prop("href", l + "/terms-of-use/");
    $(".terms-conditions_p  a").eq(0).prop("target", "_blank");


    $(".terms-conditions_p  a").eq(1).prop("href", l + "/privacy-policy/");
    $(".terms-conditions_p  a").eq(1).prop("target", "_blank");






    $(".required").each(function () {

        var myre = $(this).parent(".field-input").parent();


        myre.find(".required_asterisk").remove();


        myre.find(".field-label label").append("<spane class='required_asterisk'>*</spane>");







    })
//$(".tocenter").center();

    $("select").one('focus', function () {
        var ddl = $(this);
        ddl.data('previous', ddl.val());
    }).on('change', function () {


        var ddl = $(this);
        var previous = ddl.data('previous');
        ddl.data('previous', ddl.val());

        var selected = $(this).find('option:selected');
        var extra = selected.data('selectable');
        if (extra == "no") {


            $(this).val(previous);
            $.colorbox({html: "<br/><div class='logo'></div><div class='info error'>" + $(".city-not-selectable").val() + "</div>", width: "900px", height: "300px"});

        }

    });


    $(function () {


        $(document).on("click", ".disabled-for-terms.disable", function () {

            alert($(".alert-agree-terms").val());
            return false;

        });

        $(document).on("click", ".disable", function () {

            return false;

        });

    })








    /*
     
     var previous = "";
     $("select").one('focus', function() {
     // Store the current value on focus and on change
     previous = this.value;
     }).change(function() {
     // Do something with the previous value after the change
     alert(previous);
     
     var selected = $(this).find('option:selected');
     var extra = selected.data('selectable');
     if (extra == "no") {
     alert(previous);
     
     $(this).val(previous);
     $.colorbox({html: "<br/><p>" + $(".city-not-selectable").val() + "</p>", width: "400px", height: "100px"});
     
     }
     
     
     });*/

    $('select').change(function () {



    });


})

//<editor-fold defaultstate="collapsed" desc="Tabs">


function updateFromHash() {


    if (document.URL.indexOf('#') !== -1) {
        var hash = document.URL.substr(document.URL.indexOf('#') + 1);
        $(".tabsbody").hide();

        $(".datatabs li").removeClass("act");

        $(".datatabs li").each(function () {

            var element = $(this);

            if (element.data("show") == hash) {

                element.addClass("act");
            }

        });
        $("." + hash).show();

    } else {
        $(".datatabs").each(function () {
            $(this).find("li").removeClass("act");
            var e = $(this).find("li").eq(0);
            e.addClass("act");
            $("." + e.data("show")).show();
        })

    }

}

$(function () {

    $(window).bind('hashchange', function () {

        updateFromHash();

    })
    updateFromHash();



    $(document).on("click", ".datatabs .tabstitles li", function () {

        var p = $(this).parent("ul").parent(".datatabs");


        $(this).parent("ul").children("li").removeClass("act");
        $(this).addClass("act");

        window.location.hash = $(this).data("show");


        if (p.data("animation") == "slide") {
            p.find(".tabsbody").slideUp("normal", function () {
            });
            p.find("." + $(this).data("show")).slideDown("normal");
        } else if (p.data("animation") == "normal") {

            p.find(".tabsbody").hide("normal");

            p.find("." + $(this).data("show")).show("normal");

        } else if (p.data("animation") == "fade") {

            p.find(".tabsbody").fadeOut("normal");

            p.find("." + $(this).data("show")).fadeIn("normal");

        } else {

            p.find(".tabsbody").hide();

            p.find("." + $(this).data("show")).show();
        }




    })
})
//</editor-fold>

function setFormvalidation(Form, more, name, lang) {
    $(function () {


        if (lang == "ar") {



            var urll = "/includes/js/jqueryvalidation/languages/jquery.validationEngine-ar.js";


        } else {

            var urll = "/includes/js/jqueryvalidation/languages/jquery.validationEngine-en.js";



        }

        $.getScript(urll, function () {

            var url = "/includes/js/jqueryvalidation/jquery.validationEngine.js";
            $.getScript(url, function () {

                $("." + Form).validationEngine('attach', {
                    onValidationComplete: function (form, status) {
                        // alert("The form status is: " + status + ", it will never submit");
                        if (status == true) {


                            if (more == "addtosession") {
                                setFormToSesstion($("." + Form), null, name);


                            } else if (more == "regform") {

                                regfom("." + Form);


                            } else {




                                return true;



                            }


                        }
                    }
                });
                ;
            });
        })
    })
}

function setFormToSesstion(Form, callback, name) {

    $(function () {
        // Form.submit(function() {

        $.post("/getPostajax.php", {name: name, file: "eng/setSesstion", status: "form", form: Form.serialize()})
                .done(function (s) {
//alert ("ssss");
                    Form.unbind('submit').submit();

                });

        return false;
    })



    // });










}


function videoandImage() {



    $(function ()
    {

        $('.myvideo').hide();

        $('.video .close').hide();

        /* $('.video .close').click(function() {
         $('.videodata .ply_bt').show();
         $('.video img').show();
         $('.videodata .dec').show();
         $('.myvideo').hide();
         $('.video .close').hide();
         });
         
         $('.videodata .ply_bt').click(function() {
         $(this).hide();
         $('.video img').hide();
         $('.video .close').show();
         $('.myvideo').show();
         $('.videodata .dec').hide();
         });*/
    });
}

function viewMap(cl, vals, ozoom, ocenter) {



    var url = "/includes/js/gmap3.min.js";
    $.getScript(url, function () {

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
            $.each(vals, function (i, marker) {

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
                    //,
                    // all: true
                }
            });
            var a = "";
            $.each(markers, function (i, marker) {
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
                        draggable: false
                    }, events: {
                        /*  mouseover: function(marker, event, context) {
                         
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
                         
                         
                         ,}*/
                        mouseout: function () {

                        },
                        dragend: function () {
                            updateMareckers();
                        },
                        click: function (marker, event, context) {

                        },
                        rightclick: function (marker, event, context) {
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


        $(function () {




            updatelgFromDB(vals);
            $(sl).gmap3({
                map: {
                    options: {
                        center: ocenter,
                        zoom: ozoom
                    }
                }



            });
        })

    })

}


jQuery.fn.toggle = function (fn, fn2) {
// Don't mess with animation or css toggles
    if (!jQuery.isFunction(fn) || !jQuery.isFunction(fn2)) {
        return oldToggle.apply(this, arguments);
    }
// migrateWarn("jQuery.fn.toggle(handler, handler...) is deprecated");
// Save reference to arguments for access in closure
    var args = arguments,
            guid = fn.guid || jQuery.guid++,
            i = 0,
            toggler = function (event) {
                // Figure out which function to execute
                var lastToggle = (jQuery._data(this, "lastToggle" + fn.guid) || 0) % i;
                jQuery._data(this, "lastToggle" + fn.guid, lastToggle + 1);
                // Make sure that clicks stop
                event.preventDefault();
                // and execute the function
                return args[ lastToggle ].apply(this, arguments) || false;
            };
    // link all the functions, so any of them can unbind this click handler
    toggler.guid = guid;
    while (i < args.length) {
        args[ i++ ].guid = guid;
    }
    return this.click(toggler);
};
function selectdepend_on(parent, chiled, type, value) {
    var p = "." + parent;
    var c = "." + chiled;


    $(function () {


        $(c).html("<option class='loading' style=' direction: ltr;  text-align: left'>loading....</option>");

        sendPAjax("ajax/eng/updat_select", "lang=" + $(p).eq(0).data('lang') + "&parent=" + parent + "&type=" + type + "&val=" + $(p).eq(0).val() + "&value=" + value, function ($d) {
            $(c).find(".loading").remove();
            $(c).html("<option>" + $d + "</option>");
        });

        $(document).on("change", p, function () {

            var selected = $(this).find('option:selected');
            var extra = selected.data('selectable');

            if (extra != "no") {

                $(c).html("<option class='loading ' style=' direction: ltr ; text-align: left'>loading....</option>");
                sendPAjax("ajax/eng/updat_select", "lang=" + $(this).data('lang') + "&parent=" + parent + "&type=" + type + "&val=" + $(this).val() + "&value=" + value, function ($d) {

                    $(c).find(".loading").remove();

                    $(c).html("<option>" + $d + "</option>");
                });


            }

        });



    });


}
;
function selectAllList(ChackClass, ListClass) {

    var listobj = $('.' + ListClass + ' .field-input .list  option');
    var chackobj = $('.' + ChackClass + ' .field-input .checkbox');
    $(document).ready(function () {


        /*   if (chackobj.is(":checked")) {
         listobj.attr('selected', 'selected');
         } else {
         listobj.removeAttr("selected");
         listobj.removeAttr("selected");
         listobj.removeAttr("selected");
         listobj.removeAttr("selected");
         listobj.removeAttr("selected");
         listobj.removeAttr("selected");
         listobj.removeAttr("selected");
         listobj.removeAttr("selected");
         }
         */
        chackobj.change(function () {


            if (chackobj.is(":checked")) {
                listobj.attr('selected', 'selected');
            } else {
                listobj.removeAttr("selected");
                listobj.removeAttr("selected");
                listobj.removeAttr("selected");
                listobj.removeAttr("selected");
                listobj.removeAttr("selected");
                listobj.removeAttr("selected");
                listobj.removeAttr("selected");
                listobj.removeAttr("selected");
            }



        })

    });
}





function creatmyupoloader(myid) {


    var uploader = new qq.FileUploader({
        element: document.getElementById(myid),
        action: 'ajax/upload.php'
    });
}



function creatFileUploader(myid, title, callbacks) {


    var uploader = new qq.FileUploader({
        element: document.getElementById(myid),
        request: {
            endpoint: 'ajax/upload.php'
        },
        text: {
            uploadButton: title
        },
        callbacks: callbacks

    })

}


function creatPicUploader(myid, title, callbacks) {


    var uploader = new qq.FileUploader({
        element: document.getElementById(myid),
        uploadButtonText: title,
        request: {
            endpoint: 'ajax/upload.php'
        },
        validation: {
            allowedExtensions: ['jpeg', 'jpg', 'png'],
            sizeLimit: 50000
        },
        callbacks: callbacks

    })

}





function sendMassge(type, title, body) {

    $(function () {

        $("body").append("<div class='msg " + type + "'><h1>" + title + "</h1>" + body + "</div>");
    })



}


//F_sendMassge("type", "title", "body");
function F_sendMassge(type, title, msg, buttonTitle, height, width) {
    if (height == null) {

        height = 100;
    }

    if (width == null) {

        width = 500;
    }


    if (buttonTitle == null) {

        buttonTitle = "ok";
    }



    $(function () {



        var mymsg = msg;
        $('body').append("<div id='mymsg' style='display:none;height:" + height + "px;'>" + mymsg + "</div>\n\
<script>$('#mymsg' ).dialog({ position: ['top', 200], \n\
dialogClass: 'fixed-dialog',\n\
 title:' " + title + "', \n\
modal: true,buttons: [ { text: \"" + buttonTitle + "\", \n\
click: function() { $( this ).dialog( \"close\" ); } } ] }); \n\
</script>");
    })



}




function createCookie(name, type) {

    $.get("../ajax/variables/create_cookie.php?name=" + name + "&value=" + type, function (returnData) {

//alert (returnData);

    })
}


/**
 * 
 * @param {type} name
 * @param {type} value
 * @returns {undefined}
 */
function setSession(EVselector, name, value, status) {
    $(function () {
        $(document).on("click", EVselector, function () {
            createSesstion(name, value, function () {

                if (status === "reload") {


                    location.reload();
                }



            });
        });
    });
}



function createSesstion(name, value, callback) {
    $.get("/ajax/variables/create_session.php?name=" + name + "&value=" + value, callback);
}



function formToSeesstion(s) {
    $(function () {
        $(document).on("click", ".wnext", function () {



            setFormToSesstion($("#" + s), function () {


            }, s)
            return false;
        });
    }
    );
}








/*
 
 function setFormToSesstion(Form, callback, name) {
 
 
 $.post("/getPostajax.php", {name: name, file: "eng/setSesstion", status: "form", form: Form.serialize()})
 .done(callback);
 }
 */
function getSesstion(name, callback) {
    $.ajax({
        type: 'GET',
        url: "../ajax/getSesstion.php?type=" + name,
        success: callback
    });
}




function sendPAjax(url, options, callback) {
    $.ajax({
        type: 'GET',
        url: "/sendAjax.php?file=" + url + "&" + options,
        success: callback
    });
}

function setPost(url, options, callback) {


    $.ajax({
        type: "POST",
        url: url,
        data: options
    })
            .done(callback);


}

/*
 * 
 * {name: "John", location: "Boston"}
 */





genLoad();
function genLoad() {

    $(document).ready(function () {

        if ($.fn.fancybox) {
            $('.iframe-btn').fancybox({
                'width': 900,
                'height': 600,
                'type': 'iframe',
                'autoScale': false
            });
        }





        $(document).on("click", ".cboxClose", function () {

            $.colorbox.close();


        })

        $(".cboxClose").click(function () {

        });
        $(".lightbox-img").colorbox({rel: 'imgallery'});
        $(".lightbox-video").colorbox({iframe: true, /*innerWidth: 640, innerHeight: 390, */width: "80%", height: "80%"});
        $(".lightbox-imggallery").colorbox({rel: 'imgallery', slideshow: true});
        $(".lightbox-url").colorbox({iframe: true, width: "80%", height: "80%"});
    });
}


String.prototype.replaceAll = function (token, newToken, ignoreCase) {
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
function sendAjax(file, vars, to) {

    var slink = "/getajax.php?file=" + file + "&" + vars;
    var request = $.ajax({
        url: slink,
        success: function (data) {

            $(to).html(data);
        }});
    return request


}






function getData(type, render, table, to) {
    var more = "";
    if (render != null) {
        more += '&render=' + $.trim(render) + '';
    }

    if (table != null) {

        more += '&table=' + $.trim(table);
    }


    var slink = "/getajax.php?file=eng/get_data&type=" + type + more;
    var request = $.ajax({
        url: slink,
        success: to

    });
    return request

}



function getAjaxPost(file, vars, callback) {

    var slink = "/getajax.php?file=" + file //+ "&" + vars;

    $.ajax({
        type: "POST",
        url: slink,
        data: vars
    })
            .done(callback);


}

function getAjax(file, vars, to) {


    var slink = "/getajax.php?file=" + file + "&" + vars;
    var request = $.ajax({
        url: slink,
        success: to

    });
    return request


}


function getadminAjax(file, vars, to) {


    var slink = "/admin/getajax.php?file=" + file + "&" + vars;
    var request = $.ajax({
        url: slink,
        success: to

    });
    return request


}








function ifExistingInDB(tabel, filde, value, to) {
    getAjax("coms/users/checkusername", "tabel=" + tabel + "&flide=" + filde + "&value=" + value, to);
}




function updateModule(postion, place, alias, site) {
    return   sendAjax("eng/get_module", "site=" + site + "&postion=" + postion + "&alias=" + alias, place);
}

function getModule(id, place, alias) {
    return   sendAjax("eng/updateModel", "modid=" + id + "&alias=" + alias, place);
}


function getMain(alias, attr, importFile, success) {


    return   getAjax("eng/get_main", attr + "&importFile=" + importFile + "&alias=" + alias, success);
}


jQuery.fn.doesExist = function () {
    return jQuery(this).length > 0;
};
//createIframeToolTip();

function gteLangDataAttr(t, clear) {

    var r = "";

    if ($(t).data("lang") !== "" && $(t).data("lang") !== null) {

        if (clear === true) {

            r = "";
        } else {



            r = "/";

        }






        r += $(t).data("lang");
    }


    return r;
}




//<editor-fold defaultstate="collapsed" desc="Addmore">



function removeEmptyValues(colors) {



    var newArray = [];
    for (var i = 0; i < colors.length; i++) {
        if (colors[i] !== undefined && colors[i] !== null && colors[i] !== "") {
            newArray.push(colors[i]);
        }
    }
    return newArray;
}
function getaddMore(me, num) {

    $(function () {
        $(document).on("custommore" + me, function () {

            $(me).find(".data").each(function (i) {
                $(this).find("input,select,textarea").each(function (ii) {




                    var newvalues = $(this).val();
                    if (newvalues != null)
                    {
                        var newvalues = newvalues.split(",");
                        newvalues = removeEmptyValues(newvalues);
                        $(this).val(newvalues[i]);
                    }
                })
            })


        });



        var d = $(me).find("input").eq(0).val().split(",");

        d = removeEmptyValues(d);

        if (d.length > 0) {

            num = d.length;
        }

        var mdata = $(me).html();
        $(me).html("");


        var d = "<div class='data'>" + mdata + "</div>";
        if (num != null) {
            for (var i = 1; i < num; i++) {
                d += "<div class='line'></div><div class='data'>" + mdata + "</div>";
            }
        }

        var $jQueryObject = $($.parseHTML("<div>" + d + "</div>"));
        $jQueryObject.find(".data").each(function () {
            var alldata = "<div class='alldata'><div class='line'></div>\n\
                        " + d + "</div><div class='line'></div>\n\
        <div class='addMore addMoreBT' >add</div>";
            $(me).html(alldata);
        });
        $(document).trigger("custommore" + me);
    });
}
//</editor-fold>


function  createditor(myclass, type) {
    $().ready(function () {



        $(myclass + "_show").toggle(function () {

            $(myclass).tinymce().hide();
        }, function () {

            $(myclass).tinymce().show();
        })

        $(myclass + "_reload").click(function () {



            $(myclass).html($(myclass + "_def").val());
        })








        if (type === "full") {

            $(myclass).tinymce({
                relative_urls: false,
                remove_script_host: false,
                convert_urls: false,
                script_url: "../includes/js/jscripts/tiny_mce/tinymce.min.js",
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen",
                    "insertdatetime media table contextmenu paste importcss responsivefilemanager "
                ],
                toolbar: "responsivefilemanager |insertfile undo redo | styleselect |  bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
                ,
                external_filemanager_path: "/includes/php/filemanager/",
                filemanager_title: "Responsive Filemanager",
                external_plugins: {"filemanager": "/includes/php/filemanager/plugin.min.js"}

            });
        } else if (type === "tiny") {


            $(myclass).tinymce({
                relative_urls: false,
                script_url: "../includes/js/jscripts/tiny_mce/tinymce.min.js",
                menubar: false, remove_script_host: false,
                convert_urls: false,
                plugins: [
                    " table  "
                ],
                toolbar: "insertfile undo redo |  bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | table  |  bullist numlist"



            });
        } else {

            $(myclass).tinymce({
                relative_urls: false, remove_script_host: false,
                convert_urls: false,
                script_url: "../includes/js/jscripts/tiny_mce/tinymce.min.js",
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen",
                    "insertdatetime media table contextmenu paste importcss responsivefilemanager "
                ],
                toolbar: " insertfile undo redo | styleselect |  bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"



            });
        }


    })

}

/*

$(document).on("click", ".addMore", function () {


    var html = $(this).parent().children(".alldata").children(".data").eq(0).html();
    $(this).parent().children(".alldata").append("<div class='line'></div><div class='data'>" + html + "</div>");

}
)*/
function getcolorInput(s) {


    $(s).
            ColorPicker({
                onSubmit: function (hsb, hex, rgb, el) {
                    $(el).val(hex);
                    $(el).ColorPickerHide();
                    $(el).css("background-color", "#" + hex);
                }, onChange: function (hsb, hex, rgb) {


                    $(s).css("background-color", "#" + hex);
                },
                onBeforeShow: function () {
                    $(this).ColorPickerSetColor(this.value);
                    $(this).css("background-color", "#" + this.value);
                }})
            .bind('keyup', function () {
                $(this).ColorPickerSetColor(this.value);
                $(this).css("background-color", "#" + this.value);
            });
}

function getDate(selector, mode, to, myminDate, mymaxDate) {
    $(function () {
        /*
         */
        var option = {
            dateFormat: "dd/mm/yy"
            , onSelect: function (selectedDate) {

                // $(to).val(selectedDate);
            }};

        var o3 = null;
        var o4 = null;
        if ($.trim(myminDate) != "" && myminDate != null) {
            var mydate = decodeURIComponent(myminDate);
            mydate = mydate.split("/");
            o3 = {minDate: new Date(mydate[2] + "/" + mydate[1] + "/" + mydate[0])};
        }
        if ($.trim(mymaxDate) != "" && mymaxDate != null) {




            var mydate = decodeURIComponent(mymaxDate);
            mydate = mydate.split("/");
            o4 = {maxDate: new Date(mydate[2] + "/" + mydate[1] + "/" + mydate[0])};
        }






        var o2 = null;
        if (mode == "buttonbar") {
            o2 = {showButtonPanel: true};
        } else if (mode == "multiplemonths") {

            o2 = {showButtonPanel: true, numberOfMonths: 3};
        } else if (mode == "showweek") {



            o2 = {showWeek: true};
        } else if (mode == "icon") {
            o2 = {showOn: "button", buttonImageOnly: true, buttonImage: "/images/calendar.gif"};
        } else if (mode == "monthyear") {

            o2 = {changeMonth: true, changeYear: true};
        }


        $(selector).datepicker($.extend(option, o2, o3, o4));


    });
}
$(function () {
    //$(".inputdate").datepicker();
});

//<editor-fold defaultstate="collapsed" desc="fbActions">

function fbLogin(gid, sid, to, lang) {


    FB.getLoginStatus(function (response) {





        if (response && response.status !== 'connected') {
            FB.login(function (response) {
                if (response.authResponse) {
                    var access_token = FB.getAuthResponse()['accessToken'];

                    console.log('Access Token = ' + access_token);
                    FB.api('/me', function (response) {
                        console.log('Good to see you, ' + response.name + '.');
                        fbLogin(gid, sid, to, lang);
                    });
                } else {
                    console.log('User cancelled login or did not fully authorize.');
                }
            }, {scope: 'email'});

        } else if (response.status === 'not_authorized') {
            FB.login(function (response) {
                if (response.authResponse) {
                    var access_token = FB.getAuthResponse()['accessToken'];

                    console.log('Access Token = ' + access_token);

                    FB.api('/me', function (response) {
                        console.log('Good to see you, ' + response.name + '.');
                        fbLogin(gid, sid, to, lang);
                    });
                } else {
                    console.log('User cancelled login or did not fully authorize.');
                }
            }, {scope: 'email'});


        } else {

            testAPI(gid, sid, to, lang);

        }
    })


}




function testAPI(gid, sid, to, lang) {



    FB.api('/me', function (response) {

        var i = "id=" + response.id;
        i += "&name=" + response.name;
        i += "&username=" + response.username;
        i += "&email=" + response.email;
        i += "&gender=" + response.gender;

        i += "&settingid=" + sid;
        i += "&g_id=" + gid;
        i += "&status=login";
        i += "&lang=" + lang;

        getAjax("coms/users/fb_usersop", i, function () {

            window.location.href = "/" + lang + "/" + to;

        }, {scope: 'email,username'


        });




    });
}


function fbLogoutUser() {

    FBA.getLoginStatus(function (response) {
        if (response && response.status === 'connected') {
            FBA.logout(function (response) {
                //  document.location.reload();
            });
        }
    });
}
var FBA = null;




function createFBLogout(gid) {




    window.fbAsyncInit = function () {






        FB.init({
            status: true, // check login status
            cookie: true, // enable cookies to allow the server to access the session
            xfbml: true  // parse XFBML
        });

        FB.getLoginStatus(function (response) {
            // console.log('inside login status');
            if (response.status === 'connected') {

                var uid = response.authResponse.userID;
                var accessToken = response.authResponse.accessToken;
                FB.logout(function (response) {

                    FB.Auth.setAuthResponse(null, 'unknown');

                });
            } else if (response.status === 'not_authorized') {


            } else {
                console.log('response status not logged in');
            }
        })

        FB.Event.subscribe('auth.authResponseChange', function (response) {


            if (response.status === 'connected') {



            }
        }
        );
    };
}





function createFBLogin(gid, sid, to) {




    $(function () {


        $(".fblogin").click(function () {


            fbLogin(gid, sid, to, $(this).data("lang"));

        })

    })

}
//</editor-fold>
