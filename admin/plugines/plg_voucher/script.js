/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {

    /*
     
     
     $(".extype").change(function() {
     var val = $(this).val();
     
     
     $(".plg_extensionInputs .checkin").parents(".form_row ").show();
     
     
     
     $(".plg_extensionInputs .package_id").parents(".form_row ").show();
     
     $(".plg_extensionInputs .checkout").parents(".form_row ").removeClass("col-9");
     $(".plg_extensionInputs .checkout").parents(".form_row ").addClass("col-3");
     
     $(".plg_extensionInputs .package_id").parents(".form_row ").removeClass("col-9");
     $(".plg_extensionInputs .package_id").parents(".form_row ").addClass("col-3");
     
     
     $(".plg_extensionInputs .package_id").parents(".form_row ").removeClass("col-9");
     
     $(".plg_extensionInputs .package_id").parents(".form_row ").addClass("col-3");
     
     
     
     if (val === "extend") {
     
     $(".plg_extensionInputs .checkin").parents(".form_row ").hide();
     
     $(".plg_extensionInputs .package_id").parents(".form_row ").hide();
     
     $(".plg_extensionInputs .checkout").parents(".form_row ").removeClass("col-3");
     $(".plg_extensionInputs .checkout").parents(".form_row ").addClass("col-9");
     
     } else if (val === "booking") {
     
     } else if (val === "transfer") {
     
     }
     
     
     
     
     })
     
     
     
     */


    //getHotels

    $(".hotel_id").change(function() {

        var url = "hotel_id=" + $(this).val();

        var slink = "../getajax.php?file=coms/fiz/getHotels&" + url;

        $.get(slink, function(retdata) {

            $(".roomsData").html(retdata);
        })


    })

    $(".updatev").click(function() {

        var url = "";
        $(".vData input ,.vData select ").each(function() {


            url += "&" + $(this).attr("name") + "=" + $(this).val();



        })


        url += "&ids=" + getids("list_formfiz_reservation");


        var slink = "../getajax.php?file=coms/fiz/voucher&" + url;

        $.get(slink, function(retdata) {

            alert(retdata);
        })



    })


})