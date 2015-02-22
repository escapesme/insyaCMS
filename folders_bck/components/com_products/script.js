/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function succFunction(url,more) {



$(function(){
    
   // alert (more);
     $.ajax({
        type: 'GET',
        url: "/sendAjax.php?file=ajax/productes/orderOp&" +  "&status=order_done"+ "&settingsite=" + $(".settingsite").val()+more,
        success: function(){
            
         window.location = url;  
            
        }
    });
    
    
    /* sendPAjax("ajax/productes/orderOp", "&status=order_done",
            function(data) {


             

            });*/
    
    
    
})
   

}
$(function() {
    //  $("input.required, select.required").parent().parent().children(".field-label").append('<span class="space" >*</span>');




    $("input.required,select.required").focus(function() {
        var myval = $(this).val();
        if ($.trim(myval) == msg) {
            $(this).removeClass("required-empty");
            $(this).val("");
        }
    });


    $("input.required,select.required").click(function() {
        var myval = $(this).val();
        if ($.trim(myval) == msg) {
            $(this).removeClass("required-empty");
            $(this).val("");
        }
    });


    $("form").submit(function() {

        var id = $(this).attr("id");
        // alert(chreq("#" + id));

        if (chreq("#" + id) == true) {

            if (id == "order") {
                // alert($("form").serialize());

                var formData = $("form").serialize();




                sendPAjax("ajax/productes/orderOp", formData + "&settingsite=" + $(".settingsite").val(),
                        function(data) {


                            $('form').unbind('submit').submit();

                        });

            } else {

                $('form').unbind('submit').submit();

            }




        } else {
            return false;
        }

        return false;

    });



})


function update3data() {


    $(".card_holder_name").val($(".ship_name").val());


    $(".sh_address_div input,.sh_address_div select").each(function() {

        var myid = $(this).attr("id");
        var id = myid.replace("ship_", "");

        $("#" + id).val($(this).val());
    });



}









$(function() {
    $(".rowfeild.check").attr('checked', 'checked');

    update3data();
    $("#sh_Baddress_div ,[for=sh_Baddress_label]").hide();

    $("#send").click(function() {


        if ($(".li_price_ch").val() == "0") {
            alert("Warning: Shipping price not updated! Kindly enter your postcode and click on \"Update Delivery Price\" ")
            return false;
        }

        if ($(".rowfeild.check").is(':checked')) {
            update3data();

        }






    })





    //   $("#sh_Baddress_div ,[for=sh_Baddress_label]").show("fast");

    $(".rowfeild.check").click(function() {

        if ($(this).is(':checked')) {
            update3data();
            $("#sh_Baddress_div ,[for=sh_Baddress_label]").hide("fast");
        } else {

            $("#sh_Baddress_div ,[for=sh_Baddress_label]").show("fast");
            $(".sh_Baddress_div input").val("");




        }

    });


});




