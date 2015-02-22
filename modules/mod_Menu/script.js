/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {




    $(".inner .top .my_menu_itm").tooltip({
        content: function() {
            return  $(this).find("span").text();
        },
        position: {
            using: function(position, feedback) {
                $(this).css(position);
                $("<div>")
                        .addClass("arrow")
                        .addClass(feedback.vertical)
                        .addClass(feedback.horizontal)
                        .appendTo(this);
            }
        }
    });
    $(".menu_itm .submenu").hide();
    $(".menu_itm").hover(function() {
        var o = $(this);
        $(".menu_itm .submenu").hide();
        o.find(".submenu").slideDown("fast");
    }, function() {
        $(".menu_itm .submenu").hide();
    });
    var status = false;
    
    
   
    $(".menu_itm").click(function() {
        var o = $(this);
        if (status) {
            $(".menu_itm .submenu").slideUp("fast");
            o.find(".submenu").slideDown("fast");
            status = false;
            
        } else {
            $(".menu_itm .submenu").slideUp("fast");
            
            
            status = true;
        }
        ;
    })
});