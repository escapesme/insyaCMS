/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$.fn.center = function() {
    this.css({
        'position': 'fixed',
        'left': '50%',
        'top': '50%'
    });
    this.css({
        'margin-left': -this.outerWidth() / 2 + 'px',
        'margin-top': -this.outerHeight() / 2 + 'px'
    });
    return this;
}




$(function() {
// $(".divRow").addClass("opened");
    $(".divRow .chos_th li.xrefopen").click(function() {


        $(".divRow").removeClass("opened");


        


        if ($(this).hasClass("fa-minus-square")) {

            $(this).removeClass('fa-minus-square').addClass('fa-plus-square');
        } else {
             $("li.xrefopen").removeClass('fa-minus-square').addClass('fa-plus-square');
            $(this).parent().parent().addClass("opened")
            $(this).removeClass('fa-plus-square').addClass('fa-minus-square');

        }



    })


    $(".cellvalue img").tooltip({
        items: "img, [title]",
        track: true,
        content: function() {
            var element = $(this);

            var text = element.attr("src");
            return "<div><img class='imgtooltip'  alt='" + text + "' src='" + text + "'></div>";

            if (element.is("[title]")) {
                return element.attr("title");
            }
            if (element.is("img")) {
                return element.attr("alt");
            }
        }
    });








//<editor-fold defaultstate="collapsed" desc="Login">

    $(".recover_password").toggle(function() {
        $(".Logindo").hide();
        $(".mylogin").hide();
        $(".mypassword").show();
        $(".recoverdo").show();
        $(".status").val("getpass");
    }, function() {


        $(".mylogin").show();
        $(".Logindo").show();
        $(".mypassword").hide();
        $(".recoverdo").hide();
        $(".status").val("login");
    });
    $("#login-box").center();
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="sideBar">
    var menuSataus = "0";


    $(".slideClose").click(function() {

        if ($(".databody").hasClass("minisidebar")) {
            $(".databody").removeClass("minisidebar");

            createSesstion("barStatus", "", null);

        } else {
            $(".databody").addClass("minisidebar");
            createSesstion("barStatus", "minisidebar", null);

        }


    })


    $(".def_menu_all .menu-parent .title ,.def_menu_all .menu-parent  i").click(function() {


        var t = $(this);
        var p = t.parent(".menu-parent");
        var n = p.children(".submenu");


        if (p.hasClass("selected")) {
            p.removeClass("selected");

            n.slideUp("fast");
            t.parent(".menu-parent").children(".acr").addClass("fa-angle-left");
            t.parent(".menu-parent").children(".acr").removeClass("fa-angle-down");

        } else {
            $(".menu-parent").removeClass("selected");

            $(".submenu").slideUp("fast");

            $(".menu-parent").children(".acr").addClass("fa-angle-left");
            $(".menu-parent").children(".acr").removeClass("fa-angle-down");


            t.parent(".menu-parent").children(".acr").addClass("fa-angle-down");

            p.addClass("selected");
            n.slideDown("fast");
        }


    })
    //</editor-fold>
    /*
     * div_levels 
     */


    $(".div_levels").each(function() {
        if ($(this).data("leve") == "0") {


        }

        //  alert($(this).data("leve"));
    });



    function levelhide(id) {

        if (id !== null && id !== "" && id !== undefined) {
            var ids = id.split("__");

            var chclass = "chtr_" + ids[1];

            $('.' + chclass).each(function() {
                $(this).hide();
                //alert($(this).attr("id"));
                levelhide($(this).attr("id"));
            })

        }

    }

    function levelopen(id) {

        if (id !== null && id !== "" && id !== undefined) {
            var ids = id.split("__");

            var chclass = "chtr_" + ids[1];

            $('.' + chclass).each(function() {
                $(this).show();
                levelopen($(this).attr("id"));
            });

        }

    }




    $(".div_levels").click(function() {

//cellvalue divRow 



        var id = $(this).parents(".divRow").attr("id");// .parent("div").parent("div").parent("div").attr("id");

        if ($(this).hasClass("p")) {
            $(this).removeClass("p");
            $(this).children("i").removeClass("fa-plus-square");
            $(this).children("i").addClass("fa-minus-square");

            levelopen(id);
        } else {
            $(this).addClass("p");

            levelhide(id);

            $(this).children("i").removeClass("fa-minus-square");
            $(this).children("i").addClass("fa-plus-square");

        }






        /*   $(".div_levels").toggle(function() {
         
         
         
         }, function() {
         
         
         
         })*/


    })





    /*
     $(".div_levels").toggle(function() {
     
     
     
     $(this).addClass("p");
     var id = $(this).parent("div").parent("div").parent("div").parent("div").attr("id");
     
     alert(id);
     var ids = id.split("__")
     var chclass = "chtr_" + ids[1];
     $('.' + chclass).hide();
     },
     function() {
     
     $(this).removeClass("p");
     var id = $(this).parent("div").parent("div").parent("div").attr("id");
     var ids = id.split("__")
     var chclass = "chtr_" + ids[1];
     $('.' + chclass).show();
     }
     
     )
     */

    $(document).on("change", ".chos_th input ", function() {

        var t = $(this).parent().parent();
        if ($(this).is(":checked")) {

            t.addClass("selected");
        } else {

            t.removeClass("selected");
        }





    })




$(window).scroll(function(e){ 
  $el = $('.chstepOpions'); 
  
  if ($(this).scrollTop() > 600 && $el.css('position') != 'fixed'){ 
      
    $('.chstepOpions').css({'position': 'fixed', 'top': '66px',"right":"54px","width":"35%"}); 
  }
  
  if ($(this).scrollTop() < 600 && $el.css('position') == 'fixed')
  {
    $('.chstepOpions').css({'position': 'absolute', 'top': '66px',"right":"0px","width":"42%"}); 
  } 
});







})