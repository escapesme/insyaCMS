/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */





function whenclose() {



}
function updaetData(day, month, year) {

    //alert(day);
    $("#date").datepicker({minDate: new Date(year, month, day)});

}





function updatemyAllPrice(p, price) {


    var s = 0;

    $(".td_pro_title .myprice").each(function() {


        s += parseFloat($(this).val());


    })




    $(".allpcire").val(s);



    return s;
}
$(function() {


    $(document).on("click", ".phoneback", function() {



        document.location.reload(true);

    })


    $(document).on("click", ".sendphonecode", function() {

        var num = $(".phonecode").val();
        var otype = $(".object_type").val();

        sendPAjax("ajax/coms/cart/checkmobliecode", "code=" + num, function(isdata) {

            if (isdata == "1") {





                sendPAjax("ajax/eng/geturl", "type=" + otype + "&alias=showcart", function(urldata) {

               setPost("/print/do/save" + urldata, {status: isdata}, function(mydata) {

                        $(".poneactmain").html(mydata);
                    });



                });

            } else {

                alert($(".phonecodeErorr").text());

            }



        });
    })

    $(".sendphone").click(function() {

        var num = $(".datapone").val();
        var otype = $(".object_type").val();



        if (num.length != 11 || !$.isNumeric(num)) {
            alert("‫عفواً، الرقم المحمول غير صحيح‬");
        } else {
            sendPAjax("ajax/eng/geturl", "type=" + otype + "&alias=showcart", function(urldata) {
                $(this).addClass("disable");
                $(".poneactmain div.form_row.loading").show();

                setPost("/print/do/act2" + urldata, {phone: num}, function(mydata) {

                    $(".poneactmain").html(mydata);
                    $(".poneactmain div.form_row.loading").hide();

                    $(this).removeClass("disable");
                });


            });
        }

    })

    $(".login,.reg").click(function() {


        $.colorbox({className: "gray", html: $("." + $(this).data("get")).html(), width: "890px", height: "520px", onClosed: whenclose});
        return false;
    })


})





function  updatePrce(price) {
    $(".COD").prop("checked", "true");
    $(".Collection-point-option ").hide();
    $(".cod-options").show();




    $(".pay-choice").change(function() {

        var num = $(".allpcire").val();


        if ($(".collection-point").is(":checked")) {
            updatemyAllPrice();
            /* if (num > price) {
             $.colorbox({html: "<br/><p>" + $(".collection-not-possible").val() + "</p>", width: "400px", height: "100px"});
             // $(".COD").prop("checked", "true");
             
             } else {*/
            $(".cod-charge").val("0");
            $(".Collection-point-option").show();
            $(".cod-options").hide();
            $(".collection-msg").show();




            //   }



            $(".request-collection-fill").show();

            $(".request-fill").hide();

        } else if ($(".COD").is(":checked")) {

            $(".request-collection-fill").hide();
            $(".request-fill").show();
            /*  if (num < price) {
             updatemyAllPrice(10);
             
             } else {
             
             updatemyAllPrice(price);
             
             
             }*/
            $(".Collection-point-option ").hide();
            $(".cod-options").show();
        }
    })













}


$(function() {





    $(".pay-choice.collection-point").change(function() {
        if ($(this).is(":checked")) {
            $(".cod-options input").val((""));


        } else {
            $(".cod-options input").val(("-"));
        }

    });








    $(".disabled-for-terms").addClass("disable");
    $(".terms-conditions").change(function() {


        if ($(this).is(":checked")) {

            $(".disabled-for-terms").removeClass("disable");
        } else {

            $(".disabled-for-terms").addClass("disable");
        }

    })



})



function pricActions(price, addprice, eventClass, priceCalss, selector) {


    updatePrce(price);

    var v = $(priceCalss).val();

    if (v < price) {

        $(selector).val(addprice);

    } else {

        $(selector).val("0");

    }

    $(eventClass).click(function() {
        //   $(priceCalss).change(function() {





        var v = $(priceCalss).val();


        if (v < price) {

            $(selector).val(addprice);

        } else {

            $(selector).val("0");

        }

    })


}

function updatpp(o) {


    $(".object_price").val($.trim(o.children("span").text()));


    $('.pricemsg .moreprice').focusout(function() {




        if (parseFloat($(this).val()) < parseFloat($(this).data("min"))) {

            $(this).val($(this).data("min"));

        }
    });
}



function additem(type, otype, id, pric, nolaction, htmlfrolight) {







    var data = otype + ">>" + id + ">>" + pric;


    sendPAjax("ajax/cart/addtocart", "type=" + otype + "&data=" + data + "&mtype=" + type, function() {
        sendPAjax("ajax/eng/geturl", "type=" + otype + "&alias=showcart", function(data) {

            if (type == "0" && nolaction != "1") {
                window.location = data;
            } else if (type == "1" && nolaction != "1") {




                $.colorbox({html: htmlfrolight, width: "30%", height: "30%"});



            }




        });
    });

}


$(function() {

    updatpp($(".price.act"));
    $(".price").click(function() {
        updatpp($(this));




    });






    $("button.addtocart").click(function() {
        var p = $(this).parent();

        var pric = p.find(".object_price").val();

        if ($('.pricemsg .moreprice').length)         // use this if you are using class to check
        {
            pric = $('.pricemsg .moreprice').val();
        }



        sendPAjax("ajax/cart/ditorycart", "setting=" + p.find(".add_setting").val() + "&type=" + p.find(".add_type").val(), function() {
            additem(p.find(".add_type").val(), p.find(".object_type").val(), p.find(".object_id").val(), pric, "", p.find(".addToCartMsg").html());
        })



    });


    $(".updateValue").click(function() {
        var p = $(this).parent();

        p.find(".loading").show("fast");


        var pric = p.find(".myprice").val();

        additem(p.find(".add_type").val(), p.find(".object_type").val(), p.find(".object_id").val(), pric, "1");


        p.parent().parent().find(".viewmypric i").text(pric);


        p.find(".loading").hide("fast");


        var num = updatemyAllPrice();




    });






});