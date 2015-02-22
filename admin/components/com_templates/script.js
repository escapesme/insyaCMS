/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function (){
    
    

    $(".meuns_p").click(function(){
    
        $(".meuns_p").removeClass("act");
    
        $(this).addClass("act");
    
        $(".meuns_ch").hide("slow");
        var thid=$(this).attr("id");

        $("."+thid+"__ch").show("slow");
    

    })
    
    $(".meuns_ch").eq(0).show();
    
    
    
    $(".select_allm").click(function(){
        
        var thid=$(this).attr("id").replace("all", "");
        
        
        if ($(this).is(':checked'))  {
        
            $("."+thid +" option").attr("selected","selected");
          
        }else{
          
            $("."+thid +" option").removeAttr("selected");
          
        }
        
    })
    
    
    
})