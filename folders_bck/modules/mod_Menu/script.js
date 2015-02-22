/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {

 $(".menu_itm .submenu").hide();



    $(".menu_itm").hover(function() {
        var o = $(this);


        $(".menu_itm .submenu").hide();
        
         o.find(".submenu").slideDown("fast");
        
        
        
    }, function() {
        $(".menu_itm .submenu").hide();

    });
})