/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
$.getScript( "/templates/style/js/reflection.js", function(  ) {

});*/


//

$(function(){
    
    var opened=false;
  $(".menuphonebt").click(function(){
      
    if (opened){
        opened=false;
         $(".menu").slideUp("fast");
        
    }else{
        opened=true;
       $(".menu").slideDown("fast"); 
        
    }
   
      
  })  
    
    
    
})