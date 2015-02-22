/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {

$(".tabs li").eq(0).addClass("act");
    $(".tabs li").click(function() {

    $(".tabs li").removeClass("act");
            $(this).addClass("act");

        var id = $(this).attr("id");

        $(".tabdiv").hide();
           $("." + id).show();
    })


})

