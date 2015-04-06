$(function() {


    //forms


    $(".mycontlogin").draggable();
    $(".form").draggable();

    $(".form .form_close").click(function() {

        $(this).parent().parent().fadeOut(200);
    })

    var def_height = 1;
    $(".form .form_min").click(function() {
        var pr = $(this).parent().next(".form_body");
        var min_height = 0;
        if (pr.height() == min_height) {

            pr.animate({
                height: "" + def_height + "px"
            }, 200);

            $(this).css("background-position", "0 -210px")

        } else {

            def_height = pr.height();
            pr.animate({
                height: "" + min_height + "px"
            }, 200);
            $(this).css("background-position", "0 -195px")
        }
    })

    //forms

    //tabs




    $(".tabs li").click(function() {

        $(".tabs li").removeClass("act");
        $(this).addClass("act");
        var do_show = $(this).attr("id");


        $(".tabs_divs .tabbody").css("z-index", "0");



        if ($(this).attr("id") == "div_group") {

            $(".tabs_divs .tabbody.div_imp").css("z-index", "1");

        }
        $("." + do_show).css("z-index", "1");


        $("." + do_show).css("z-index", "1");

        $("#Properties_con").html("");



        $(".showtool").html("");
        $(".showtool").hide();

    })







    var do_show = $(".tabs li.act").attr("id");
    //   $(".tabs_divs .tabbody").css("z-index","0");
    $("." + do_show).css("z-index", "1");



    $("#div_serves").click(function() {
        $(".gpreview").hide();
        $(".cpreview").hide();
        $(".spreview").show();
    })

    $("#div_c").click(function() {

        $(".gpreview").hide();
        $(".spreview").hide();
        $(".cpreview").show();

    })


    $("#div_imp").click(function() {

        $(this).addClass("cat");


        //  $(".view_immap").addClass("cat");


        $(".gpreview").hide();
        $(".spreview").hide();
        $(".cpreview").hide();
        var cloudID = $(".im_tabs_li.act").data("cludeid");
        if (cloudID) {

            $(".gpreview").show();
        }



    })


    $("#div_group").click(function() {


        $(".spreview").hide();
        $(".cpreview").hide();
        $(".gpreview").show();
    })
    //tabs





    // panles
    dominheight(".bttom_close_left", "0", "15");


    dominheight(".top_close_left", "0", "15");
    dominheight(".close_footer", "195", "210");
    // dominleft(".close_left");


    dominwidth(".close_right", "165", "180");
    dominheight(".close_top", "210", "195")

    dominwidth(".close_min_left", "180", "165");

    // panles



    //functions

    function  dominwidth(me_class, bgpostion1, bgpostion2) {


        var bt = $(me_class);
        var min_height = 20;
        var max_height = 0;




        bt.click(function() {
            var pr = $(this).parent().parent();


            if (pr.width() == min_height) {


                pr.stop(true, true).animate({
                    width: "" + max_height + "px"
                }, 200);

                $(this).css("background-position", "0 -" + bgpostion1 + "px");

            } else {


                if (max_height == 0) {
                    max_height = pr.width();
                }

                pr.stop(true, true).animate({
                    width: "" + min_height + "px"
                }, 200);


                $(this).css("background-position", "0 -" + bgpostion2 + "px");

            }
        })
    }

    function  dominleft(me_class) {


        var bt = $(me_class);
        var min_height = 10;
        var max_height = 0;
        var main = $(".main");



        bt.click(function() {
            var pr = $(this).parent().parent();


            if (pr.width() == min_height) {


                pr.stop(true, true).animate({
                    width: "" + max_height + "px"
                    ,
                    opacity: 1
                }, 200);

                $(this).css("background-position", "0 -180px");

                main.stop(true, true).animate({
                    width: "80%"
                }, 200);
            } else {



                if (max_height == 0) {
                    max_height = pr.width();
                }
                pr.stop(true, true).animate({
                    width: "" + min_height + "px"
                    ,
                    opacity: 0.25
                }, 200);

                main.stop(true, true).animate({
                    width: "95.6%"
                }, 200);

                $(this).css("background-position", "0 -165px");

            }




        })


    }






    function  dominheight(me_class, bgpostion1, bgpostion2) {


        var bt = $(me_class);
        var min_height = 2;
        var max_height = 0;
        bt.click(function() {

            var prid = $(this).parent().parent(".panel").attr("id");

            if (prid == "main_panle") {
                var pr = $(this).parent().parent(".panel");
            } else {
                var pr = $(this).parent().parent().parent(".panel");

            }




            if (pr.height() == min_height) {
                pr.stop(true, true).animate({
                    height: "" + max_height + "px"// opacity: 1
                }, 1);
                $(this).css("background-position", "0 -" + bgpostion1 + "px");
            } else {

                if (max_height == 0) {
                    max_height = pr.height();
                }
                pr.animate({
                    height: "" + min_height + "px"
                            // opacity: 0
                }, 1);
                $(this).stop(true, true).css("background-position", "0 -" + bgpostion2 + "px");


            }




        })


    }




    ///left spliter






    var lef_width = $(".left").width();
    var min_W = $(".main").width();






    $(".close_left").toggle(function() {
        //$(".main" ).width($(".main" ).width()+100);
        // $(".left" ).width($(".left" ).width()-100);

        var w_l = $(".left").width() - 200;
        var w_m = $(".main").width() + 200;
        $(".left").animate({
            opacity: 0.20,
            width: w_l + "px"
        }, 200);



        $(".main").animate({
            width: w_m + "px"
        }, 200);

    },
            function() {


                var w_l = $(".left").width() + 200;
                var w_m = $(".main").width() - 200;
                $(".left").animate({
                    opacity: 1,
                    width: w_l + "px"
                }, 200);



                $(".main").animate({
                    width: w_m + "px"
                }, 200);

            }

    )


    // var myleftw= $(".left").width();
    var bwidht = 0;







    $(".left").resizable(
            {
                start: function(event, ui) {
                    lef_width = $(this).width();
                    bwidht = $(".logo").width();
                    min_W = $(".main").width();
                }
                ,
                resize: function(event, ui) {


                    var w = $(this).width() - lef_width;

                    $(".u_data li").text(min_W - w);
                    $(".main").width(min_W - w);
                    $(".hearder").width(min_W - w);

                    $(".comblog").width(min_W - w - 8);

                    //alert ($("body").outerWidth()-$(".main").outerWidth()-2)



                }
                ,
                minWidth: 190



            }


    );



    $(".comblog .bt_min").toggle(function() {

        $(this).parent().animate({
            height: 0
        }, 500, function() {
        })

        $(this).addClass("meclass");

    }, function() {

        $(this).parent().animate({
            height: 100
        }, 500, function() {
        })

        $(this).removeClass("meclass");
    })



    $(".comblog .bt_close").click(function() {


        $(".comblog").slideUp();


    })



    $(".get_Log").click(function() {


        $(".comblog").slideDown();


    })



})


