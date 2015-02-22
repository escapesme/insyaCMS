/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */




$(function() {



    $(".slidebarst").click(function() {

        $("#sidebar").fadeOut();


        createSesstion("sidebar", "close");


        $("#sidebarlit").show('slow');



        $(".main ").animate({
            marginLeft: "42px"
        })
    })




    $(".slidebarstp").click(function() {


        $("#sidebarlit").hide('slow');

        //   $("#sidebar").show();

        $("#sidebar").fadeIn();

        createSesstion("sidebar", "open");


        $(".main ").animate({
            marginLeft: "261px"
        }, function() {



        })

    })


    $(".user-button").toggle(function() {

        $(".dropdown-username-menu").slideDown('slow');
    }, function() {

        $(".dropdown-username-menu").slideUp('slow');
    }


    )



    $(".block-header span").toggle(function() {

        $(this).parent().parent(".block-border").children(".block-content").hide();
    }, function() {
        $(this).parent().parent(".block-border").children(".block-content").show();

    })


    $(".recoverdo").click(function() {

        $(".user_name").val("");
        $(".password").val("");

        $(".status").val("getpass");

    });














    var menuSataus = "0";

    $(".def_menu_all .menu-parent .title").click(function() {

        $(".menu-parent .title").removeClass("selected");



    /*    if (menuSataus == "1") {
            $(this).next(".submenu").hide("fast");
            $(this).removeClass("selected");
            menuSataus = "0";
        } else {
            menuSataus = "1";
            $(this).addClass("selected");
            $(".submenu").hide("fast");

            $(this).next(".submenu").show("fast");

        }*/




    })








})  