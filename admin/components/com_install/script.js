/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {

    $(".type").change(function() {

        var v = $(this).val();
        var obj = $(this);

        getAjax("admin/fillList", "status=DIR&" + "&selectData=plugines/" + v + "/&perfix=plg", function(d) {
            $(".ins_alias").html(d);
        });
    })




    $(".tabs li").eq(0).addClass("act");
    $(".tabs li").click(function() {

        $(".tabs li").removeClass("act");
        $(this).addClass("act");
        var id = $(this).attr("id");
        $(".tabdiv").hide();
        $("." + id).show();
    })


})

