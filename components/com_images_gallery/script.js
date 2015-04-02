/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 * <div class='iglightBox_closebt'></div>
 <div class='iglightBox_next'></div>
 <div class='iglightBox_prev'></div>
 <image class='iglightBox_img'/>
 <div class='iglightBox_imageDes'></div>
 * 
 * 
 */






jQuery.fn.center = function() {
    this.css("position", "fixed");
    /* this.css("top", Math.max(0, (($(window).height() - this.outerHeight()) / 2) + $(window).scrollTop()) + "px");*/
    this.css("left", Math.max(0, (($(window).width() - this.outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    return this;
}


$(function() {




    $(".thimg li").eq(0).addClass("act");

    $(".block").eq(0).show();



    $(".thimg li").click(function() {
        $(".thimg li").removeClass("act");

        $(".block").hide("slow");
        $("." + $(this).data("show")).show("slow");
        $(this).addClass("act");

    })


    var itemswidth = $(".th_bar_images .bar_imgae").size() * 117;


    $(".th_bar_images").width(itemswidth);






    $("#bt_next").click(function() {



        var movepx = $(".thimg").outerWidth();

        var meleft = $(".th_bar_images").css("left");
        meleft = meleft.replace("px", "");
        var mel = movepx - itemswidth;


        if (parseFloat(meleft) <= parseFloat(mel)) {


          $(".th_bar_images").animate({"left": mel + "px"}, "slow");



        } else {
            $(".th_bar_images").animate({"left": "-=125px"}, "slow");

        }






    });

    $("#bt_prv").click(function() {



        var meleft = $(".th_bar_images").css("left");



        if (parseFloat(meleft) >= 0) {
            $(".th_bar_images").animate({"left": "0px"}, "slow");

        } else {

            $(".th_bar_images").animate({"left": "+=125px"}, "slow");

        }

    });

    /*
     var thisImageIndex;
     var ImagesCont=$(".giimage_block").size();
     
     
     
     function updateimage(src){
     
     
     //  alert (ImagesCont+"::"+thisImageIndex)
     $(".iglightBox_img").attr("src",src); 
     
     $(".iglightBox").show();
     
     
     $(".iglightBox_img").center();
     
     }
     
     
     
     function updatesize(){
     
     var position = $(".iglightBox_img").offset();
     
     
     $(".iglightBox_next").offset({
     top: position.top+($(".iglightBox_img").height()/2)- $(".iglightBox_next").height(), 
     left: position.left+20
     });
     
     $(".iglightBox_prev").offset({
     top: position.top+($(".iglightBox_img").height()/2)- $(".iglightBox_next").height(), 
     
     left: position.left+$(".iglightBox_img").width()-$(".iglightBox_prev").width()-20
     });
     
     
     
     $(".iglightBox_imageDes").offset({
     top: position.top+$(".iglightBox_img").height()- $(".iglightBox_imageDes").height(), 
     left: position.left
     });
     
     
     $(".iglightBox_closebt").offset({
     top: position.top-($(".iglightBox_closebt").height()/2), 
     left: position.left+$(".iglightBox_img").width()-($(".iglightBox_closebt").width()/2)
     });
     
     $(".iglightBox_imageDes").width($(".iglightBox_img").width());
     
     
     }
     
     $(".giimage_block").click(function(){
     
     
     
     var simage= $(this).children("img").attr("src");
     
     thisImageIndex=$(this).index();
     
     updateimage(simage);
     
     updatesize();
     })
     
     $(window).resize(function() {
     updatesize();
     updatesize();
     });
     
     
     $(".iglightBox_prev").click(function(){
     $(".lightbox-content").stop(true,true).fadeOut("slow");
     
     thisImageIndex++;
     
     if (thisImageIndex>ImagesCont){
     
     thisImageIndex=0;
     }
     var simage= $(".giimage_block").eq(thisImageIndex).children("img").attr("src");
     
     updateimage(simage);
     
     updatesize();
     
     $(".lightbox-content").stop(true,true).fadeIn("slow");
     
     
     })
     
     
     
     
     $(".iglightBox_next").click(function(){
     
     $(".lightbox-content").stop(true,true).fadeOut("slow");
     
     
     
     
     
     thisImageIndex--;
     
     if (thisImageIndex<0){
     
     thisImageIndex=ImagesCont;
     }
     
     
     var simage= $(".giimage_block").eq(thisImageIndex).children("img").attr("src");
     
     updateimage(simage);
     
     updatesize();
     
     $(".lightbox-content").stop(true,true).fadeIn("slow");
     
     
     })
     
     
     $(".iglightBox_img").mouseenter(function(){
     
     $(".iglightBox_next").stop(true,true).fadeIn();
     $(".iglightBox_prev").stop(true,true).fadeIn();
     })
     
     $(".lightbox-content").mouseleave(function(){
     
     
     $(".iglightBox_next").stop(true,true).fadeOut();
     $(".iglightBox_prev").stop(true,true).fadeOut();
     
     
     })
     
     
     
     $(".iglightBox_closebt").click(function(){
     
     
     $(".iglightBox").hide();
     
     
     })*/

})

