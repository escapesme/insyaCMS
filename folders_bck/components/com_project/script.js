/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */




$(function() {


    $(".lightbox-videome").colorbox({closeButton: false, overlayClose: false, className: "videodataShaerboxData", iframe: true, /*innerWidth: 640, innerHeight: 390, */width: "80%", height: "80%",
        onComplete: function() {
            $("#colorbox.videodataShaerboxData").append('<div class=\'meclose showshaer\'></div>');
        }
    });


    $(document).on("click", " .doclose", function() {

        $.colorbox.close();



    })

    $(document).on("click", ".showshaer", function() {

        $(this).hide();



        $("#cboxLoadedContent").html($(".videodataShaer").html() )






    })


    /*
     $(document).bind('cbox_closed', function(){
     $.colorbox({className:"videodataShaerbox",html:$(".videodataShaer").html(),title:"xxxx",innerWidth:"80%",innerHeight:"80%"});
     });  */
})
function updateprice(o) {

    $(".pricing .price").removeClass("act");
    o.addClass("act");

    $(".pricemsg .data").html("");
    $(".pricemsg .loading").show("fast");










    sendPAjax("ajax/coms/projects/get_message", "alias=" + $(".pricemsg").data("item") + "&type=", function(data) {


        $(".pricemsg .data").html(o.find(".dec").val() + " " + data);
        $(".pricemsg .loading").hide("fast");

    });


}



function updateLocation(oldData, newtype, newvlaue) {


    var l = "";


    l = "/search/";

    if (oldData != "") {

        l += "" + oldData + "";
    }

    if (newtype != "" && newvlaue != "") {

        if (oldData != "") {

            l += "-" + newtype + "=" + newvlaue;

        } else {

            l += "" + newtype + "=" + newvlaue;

        }


    }

    location = l + "/";


}
function updateQselect(alias, select) {

    $(function() {


        $(".labelclose").click(function() {


            var news = "";

            var ss = select.split("-");
            for (var i = 0; i < ss.length; i++) {
                var s2 = ss[i].split("=");

                if (s2[0] != $(this).data("type") && ss[i] != "") {
                    if (i > 0) {
                        news += "-" + ss[i];
                    } else {

                        news += "" + ss[i];
                    }





                }

            }

            updateLocation(news, "", "");


            // location = "/do/" + news + "/" + alias + "/";
        });


        $('.prosearch').keyup(function(e) {
            if (e.keyCode == 13)
            {
                // location = "/do/search:" + $(".prosearch").val() + "/" + alias + "/"

                updateLocation("", "search", $(".prosearch").val());



            }
        });

        $(".dosearch").click(function() {
            //  location = "/do/search:" + $(".prosearch").val() + "/" + alias + "/";


            updateLocation("", "search", $(".prosearch").val());


        });

        $(".selectq").change(function() {

            var news = "";

            var ss = select.split("-");
            for (var i = 0; i < ss.length; i++) {
                var s2 = ss[i].split("=");

                if (s2[0] != $(this).data("type") && ss[i] != "") {

                    if (i > 0) {
                        news += "-" + ss[i];
                    } else {

                        news += "" + ss[i];
                    }




                }

            }




            updateLocation(news, $(this).data("type"), $(this).val());




        });
    });
}

$(function() {


    $(".pricing .price.more").click(function() {

        $(".pricing .price").removeClass("act");
        $(this).addClass("act");


    });


    $(".gatdon").click(function() {


        $('html, body').animate({
            scrollTop: $(".priceTitle").offset().top - 70
        }, 750);

    });


    updateprice($(".pricing .price.act"));

    $(".pricing .price.more").click(function() {


        $(".pricemsg .data").html($(this).children(".addData").html());
    })

    $(".pricing .price.update").click(function() {

        updateprice($(this));


    });


    $(".delitem").click(function() {
        var o = $(this).parent();
        var d = o.find(".itemData").val();
        var ds = d.split(">>");

        sendPAjax("ajax/cart/addtocart", "status=delete&type=" + ds[0] + "&data=" + d, function() {
            o.parent().parent("tr").remove();


        });

    });


});
