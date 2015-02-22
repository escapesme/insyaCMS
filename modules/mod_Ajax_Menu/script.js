/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */





$(function() {


    var thseletor = ".item";


    $(".getData .Close").click(function() {

        $(".getData .data").html("");

        $container.isotope({
            filter: thseletor,
            sortAscending: true,
            layoutMode: 'fitRows'
        });

    })

    $(".ajaxMenu_getbody .item").click(function() {
        
        
        
         $(".getData").css("background","url(images/loading.gif) #fff no-repeat center");

        $container.isotope({
            filter: thseletor + ',.getData',
            sortAscending: true,
            layoutMode: 'fitRows'
        });

        var slink = "getajax.php?file=eng/get_main&alias=" + $(this).attr("id") + "";
        $.get(slink, function(retdata) {

            $(".getData .data").html(retdata);
             $(".getData").css("background","#fff");
            genLoad();
            $container.isotope({
                filter: thseletor + ',.getData',
                sortAscending: true,
                layoutMode: 'fitRows'
            });
        });
    });



    $.Isotope.prototype._positionAbs = function(x, y) {
        return {right: x, top: y};
    };


    $(".ajaxMenu_getheader li").eq(0).addClass("act");

    $(".getData .data").html("");


    var $container = $('.ajaxMenu_getbody');
// initialize isotope
    $container.isotope({
        filter: thseletor,
        sortAscending: true,
        transformsEnabled: false,
        masonry: {
            columnWidth: 120
        },
        masonryHorizontal: {
            rowHeight: 120
        },
        layoutMode: 'fitRows'
    });



    $(".ajaxMenu_getheader li").click(function() {

        $(".getData .data").html("");

        $(".ajaxMenu_getheader li").removeClass("act");
        $(this).addClass("act");



    });

    var thsel
    $(".ajaxMenu_getheader li a").click(function() {

 

        var selector = $(this).attr("id");

        selector = selector.replace("h", "b");
        if (selector != "*") {

            selector = "." + selector;

        }
        thseletor = selector;


        $container.isotope({
            // options...
            filter: selector,
            sortAscending: true,
            layoutMode: 'fitRows'
        });
    
     $(".getData .data").html("");
    
    });


    //   alert ("sfdsdfsdf");


    /*
     $('.ajaxMenu_getbody').isotope({filter: '#filter'}, function($items) {
     var id = this.attr('id'),
     len = $items.length;
     console.log('Isotope has filtered for ' + len + ' items in #' + id);
     });*/




})


