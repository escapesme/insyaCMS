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





/*


$(function(){
    
    
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
      
      
    })
  
})

*/