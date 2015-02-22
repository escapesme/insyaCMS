/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



//<editor-fold defaultstate="collapsed" desc="Helaper">
var actbar = null;
var acttab = null;
function updateJS() {

    $(".mainBlock .blockHeader").click(function() {

        var p = $(this).parent(".mainBlock");
        if (p.hasClass('selected')) {
            p.removeClass("selected");
        } else {
            //   p.addClass("selected", 1000, null);

            p.addClass("selected");
        }
        /*  p.effect("shake", options, 200, function() {
         
         
         });*/

    });
    $(".tabsBody  .data").sortable({
        revert: true,
        stop: function(event, ui) {
            updateorder();
        }
    });
    /* $(".home").on("drag", function(event, ui) {
     updateorder();
     });*/


    updateorder();
}
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="getData">




var dataStatus = "";


function getData(other) {
    var data = "";
    $(acttab + " .mainBlock" + other).each(function(e) {
        $(this).find(".edata").each(function() {

            if ($(this).attr("type") == "checkbox") {
                var d = "0";
                if ($(this).is(":checked")) {
                    d = "1";
                } else {

                    d = "0";
                }

                data += $(this).attr("name") + "__" + d + ";";
            } else {

                data += $(this).attr("name") + "__" + $(this).val() + ";";
            }





        });
        data += "||";
    });
    return data;
}



function updateComponent(obj) {

    var id = obj.attr("id");
    createSesstion("app_com", id);
}


function getAddData() {
    var data = "";
    $(".rowfeild").each(function() {
        if ($(this).attr("type") == "checkbox") {
            var d = "0";
            if ($(this).is(":checked")) {
                d = "1";
            } else {

                d = "0";
            }

            data += $(this).attr("name") + "__" + d + ";";
        } else {
            data += $(this).attr("name") + "__" + $(this).val() + ";";
        }

    })
    return data;
}

//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="Action">


function setTabAct(obj) {
    var id = $(obj).attr("id");
    $(".tabsHeahder li").removeClass("act");
    $(obj).addClass("act");
    $(".tabsBody").hide();
    $("." + id).show();
    var Data = $("." + id + " .bodyData").val();
    acttab = "." + id;
    updateBloeks(Data, $("." + id).find(".data"));
    updateBar(Data, $("." + id).find(".bar"));
}

/*
 * 
 * @param {type} mdata
 * @param {type} obj
 * @returns {undefined}/*
 * 
 * 
 
 
 
 */



function edataRestoreAll() {

    $.post("/main/do/setrestoreall/app/").done(function(data2) {
        updateActBloeks();
    });
}

function edataRestore() {
    $.post("/main/do/setrestore/app/", {data: getData(".selected")}).done(function(data2) {
        updateWithEffect("slide");
    });
}

function edataRemove() {

    $.post("/main/do/setremove/app/", {data: getData(".selected")}).done(function(data2) {
        updateWithEffect("scale");
    });
}
function edataRemoveAll() {

    $.post("/main/do/setremoveall/app/").done(function(data2) {
        updateActBloeks();
    });
}


function updateBar(mdata, obj) {
    getMain("app", "do=getbar&dataoptions=" + mdata, "false", function(data) {

        obj.html(data);
        // updateJS();
    });
}
function updateBloeks(mdata, obj) {



    var p = $(acttab + " .page").val();
    getMain("app", "page=" + p + "&do=gethome&dataoptions=" + mdata, "false", function(data) {
        obj.html(data);
        if (dataStatus === "add") {
            craeteEffect($(acttab + " .mainBlock").eq(0), "scale");
        }

        updateJS();
        dataStatus = "";
    });
}
function updateActBloeks() {


    var Data = $(acttab + " .bodyData").val();

    updateBloeks(Data, $(acttab).find(".data"));
}



/*
 function updateBloeks() {
 getMain("app", "do=gethome", "false", function(data) {
 $(".home").html(data);
 updateJS();
 })
 
 }*/

function editBloek() {
    $.post("/main/do/setedit/app/", {data: getAddData()}).done(function(data2) {
        parent.$.fn.colorbox.close();
    });
}


function addBloek() {
    $.post("/main/do/setadd/app/", {data: getAddData()}).done(function(data2) {

        parent.$.fn.colorbox.close();



    });
}

function saveBloeks() {
    $.post("/main/do/setsave/app/", {data: getData("")}).done(function(data2) {
        updateActBloeks();
    });
}





function enableBloeks() {


    $.post("/main/do/setenable/app/", {data: getData(".selected")}).done(function(data2) {
        updateActBloeks();
    });
}
/*
 function getAdd() {
 
 
 $.post("/main/do/getAdd/app/", {data: getData(".selected")}).done(function(data2) {
 
 });
 
 }*/


function disableBloeks() {
    $.post("/main/do/setdisabel/app/", {data: getData(".selected")}).done(function(data2) {
        updateActBloeks();
    });
}



function craeteEffect(obj, selectedEffect) {
    var options = {};
    obj.hide();

    if (selectedEffect === "scale") {
        options = {percent: 100};
    } else if (selectedEffect === "size") {
        options = {to: {width: 280, height: 185}};
    }






    obj.show(selectedEffect, options, 400,
            function() {
                //   updateActBloeks();
            });

}

function updateWithEffect(selectedEffect) {

    var options = {};
    if (selectedEffect === "scale") {
        options = {percent: 0};
    } else if (selectedEffect === "size") {
        options = {to: {width: 200, height: 60}};
    }

    var options = {percent: 0};
    $(acttab + " .mainBlock.selected").hide(selectedEffect, options, 400,
            function() {
                updateActBloeks();
            });

}

function deleteBloeks() {
    $.post("/main/do/setdelete/app/", {data: getData(".selected")}).done(function() {
        updateWithEffect("scale");

    });
}
function copyBloeks() {


    $.post("/main/do/setcopy/app/", {data: getData(".selected")}).done(function(data2) {
        updateActBloeks();
    });
}




function updateorder() {


    $(acttab + "  .data .mainBlock").each(function(e) {
        var num = $(acttab + "  .data .mainBlock").length;
        var p = (parseFloat($(acttab + " .page").val()) - 1) * num;
        var order = e + 1;
        $(this).find(".order").html((order + p + num));
        $(this).find(".order.edata").val((order + p));
    });
}


//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="Eventes">



function updateWithTime() {


    var v = $(".reloadtime").val();


    if (v != null && v != "" && $.trim(v) != "0") {

        /*   setInterval(function() {
         updateActBloeks();
         }, v);*/
    }





}
$(function() {



    updateWithTime();
    $(document).bind('cbox_open', function() {
        $(document).bind('cbox_closed', function() {
            updateActBloeks();

        });
    });
    setTabAct($(".tabsHeahder li").eq(0));
    $(".tabsHeahder li").click(function() {


        setTabAct(this);
    });
    $(".mysubmit.add").click(function() {

        parent.dataStatus = "add";


        addBloek();
        return false;
    })





    $(".mysubmit.edit").click(function() {




        editBloek();
        return false;
    })


    $(document).on("click", ".edataedit", function() {

        $.colorbox({iframe: true, href: "/main/do/getedit/app/" + $.trim($(".selected").find(".id.edata").val() + "/"), width: "80%", height: "80%"});
    });





    $(document).on("click", " .appmenu li", function() {
        updateComponent($(this));
    });
    $(document).on("click", " .edataRestoreAll", function() {



        edataRestoreAll();
    });
    $(document).on("click", " .edataRestore", function() {


        edataRestore();
    });
    $(document).on("click", " .edataRemove", function() {

        edataRemove();
    });
    $(document).on("click", " .edataRemoveAll", function() {


        edataRemoveAll();
    });
    $(document).on("click", " .edatareupdate", function() {


        saveBloeks();
    });
    $(document).on("click", " .edatarefresh", function() {


        updateActBloeks()

    });
    $(document).on("click", " .nextPage", function() {

        $(acttab + " .page").val(parseFloat($(acttab + " .page").val()) + 1);
        updateActBloeks()

    });
    $(document).on("click", " .pervPage", function() {

        $(acttab + " .page").val(parseFloat($(acttab + " .page").val()) - 1);
        updateActBloeks()

    });



    $(document).on("click", " .lastPage", function() {

        $(acttab + " .page").val($(this).attr("data-num"));
        updateActBloeks();

    });
    $(document).on("click", " .fristPage", function() {

        $(acttab + " .page").val(0);
        updateActBloeks();

    });

    $(document).on("click", ".edataadd", function() {

        $.colorbox({iframe: true, href: "/main/do/getadd/app/", width: "80%", height: "80%"});

        return false;
    });



    $(document).on("click", " .edatadelete", function() {



        deleteBloeks();
    });
    $(document).on("click", " .edatadisable", function() {



        disableBloeks();
    });
    $(document).on("click", " .edataenable", function() {


        enableBloeks();
    });
    $(document).on("click", " .edatacopy", function() {


        copyBloeks();
    });
    /*
     * 
     
     
     
     
     
     */
    updateorder();
    updateJS();
});
//</editor-fold>
