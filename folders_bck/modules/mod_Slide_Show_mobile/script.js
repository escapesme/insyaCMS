/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

  
/*
   *    timer.set(options);
        timer.play(reset);  // Boolean. Defaults to false.
        timer.pause();
        timer.stop();  // Pause and resets
        timer.toggle(reset);  // Boolean. Defaults to false.
        timer.once(time);  // Number. Defaults to 0.
        timer.active  // Returns true if timer is running
   * 
   */
  
 
  
  
  
  
  
  
  
  

$.fn.center = function() {
    this.css({
        'position': 'fixed',
        'left': '50%',
        'top': '40%'
    });
    this.css({
        'margin-left': -this.width() / 2 + 'px',
        'margin-top': -this.height() / 2 + 'px'
    });

    return this;
}







function slideshow(title){
    
    
    

    
    
  
    
    var parent =title+".allimgg";
    var timeSpeed=5000;


    showimage(0,parent);
    

    var timer = $.timer(function() {
      
      
     
        imgmove(parent);
    });

    timer.set({
        time : timeSpeed, 
        autostart : true
    });
  


    var Stat="";
    $(".sh_bt_play").toggle(function(){
        timer.pause();
        $(this).addClass("pu");
        Stat="pause";
    },function(){
        
        $(this).removeClass("pu");
        timer.play();
        Stat="play";
      
    })
      
    $( ".sh_bt_next").click(function(){

        var number= parseFloat($(parent+" .allimgd.imgshow").attr("id").replace("imgd_","")) +1; 
       
        if ($(parent+" .allimgd").size()==number){
            number=0;
       
        }
        imageplay(timer,number,timeSpeed,parent);
        
        if (Stat=="pause"){
            timer.pause();
            
        }
    
        
    })
    
    
    
 
    $(".bt_close").click(function(){
        
        
        $(".lightbox_p").fadeOut("slow");
    })
    
    $(".light_box_bt").click(function(){
        
        
        $(".lightbox_p").fadeIn("slow");
        
       
            
        $(".lightbox_body .data").html("<img src='"+ $(".fullimages.imgshow").attr("src")+"'/>"); 
        
        $(".lightbox_body .data").center();
        
       
            
        
    })
    
    
         
    $( ".sh_bt_per").click(function(){

        var number= parseFloat($(parent+" .fullimages.imgshow").attr("id").replace("imgd_",""))-1; 
       
        if (number<0){
            number=$(parent+" .allimgd").size()-1;
       
        }
       
        imageplay(timer,number,timeSpeed,parent);
    
        if (Stat=="pause"){
            timer.pause();
            
        }
    })
      
      
      
      
  
    $( parent+ " .sbtns, " + parent +" .btns").click(function(){
        var number= parseFloat($(this).attr("id").replace("bt_","")) ;  
        imageplay(timer,number,timeSpeed,parent)  ;
   
        
    })
    
    
    
    $( parent+ " .thimages").click(function(){
        var number= parseFloat($(this).attr("id").replace("thimg_","")) ;  
        imageplay(timer,number,timeSpeed,parent);
     
        
    })
    
    
}
    
    
    
    
    
    
function imageplay(timer,number,timeSpeed,parent){
        
    showimage(number,parent);
    timer.pause();
    timer.set({
        time : timeSpeed, 
        autostart : true
    });
        
}
    


function imgmove(parent){   
    
        
    var number= parseFloat($(parent+" .allimgd.imgshow").attr("id").replace("imgd_","")) +1; 
     
    if ($(parent+" .fullimages").size()==number){
        number=0;
       
    }
     
    showimage(number,parent);
}





function showimage(indx,parent){
    
    
    var bts=parent+" .sbtns, "+parent+" .btns,"+parent+" .thimages";
    

    $(bts).removeClass("act");
   
    $(parent+" .allimgd").removeClass("imgshow");
    
    $(parent+" .allimgd").stop(true,true).hide("slide", {
        direction: "left"
    }, 1000);
    $(parent+" .allimgd").eq(indx).stop(true,true).show("slide", {
        direction: "right"
    }, 1000);
    $(parent+" .allimgd").eq(indx).addClass("imgshow");
    
    $(bts).eq(indx).addClass("act");
    
}
