/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

jQuery.fn.center = function() {
    this.css("position", "absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) +
            $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) +
            $(window).scrollLeft()) + "px");
    return this;
}


$.fn.centerdiv = function() {



    this.css({
        'position': 'absolute',
        'left': '50%',
        'top': '50%'
      /*  'max-height': '150px',
        'max-width': '180px'*/
    });


    this.css({
        'margin-left': -this.width() / 2 + 'px',
        'margin-top': -this.height() / 2 + 'px'
    });

    return this;
}




$(function() {


    $(".tabs").each(function() {

        $(this).children("ul").children("li").removeClass("act");
        $(this).children("ul").children("li").eq(0).addClass("act");
        var thc = $(this).children("ul").children("li").attr("id");

        $(this).children(".tabsbody").hide();
        $(this).children("." + thc).show();
    })


    $(".tabs li").click(function() {
        var tabs = $(this).parent().parent(".tabs");
        var thc = $(this).attr("id");

        tabs.children("ul").children("li").removeClass("act");
        tabs.children(".tabsbody").hide("slow");


      
        tabs.children("." + thc).show("slow");
        $(this).addClass("act");
    });

/*  $(".itemBlock_imgae").centerdiv();
    $(".catBlock_image img").centerdiv();*/



})