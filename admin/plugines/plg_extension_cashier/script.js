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
     $EX_ids = explode(",", $_GET['ex_ids']);
     $extension_amounts = explode(",", $_GET['extension_amount']);
     
     $remarks = $_GET['remarks'];
     $received_by = $_GET['received_by'];
     
     $authorised_by = $_GET['authorised_by'];
     $authorize_reason = $_GET['authorize_reason'];
     
     
     
     })
     
     */

    $(".authorize_reason_p").hide();



    $(".updatech").click(function() {
        var url = "authorised_by=" + $(".authorised_by").val();
        url += "&authorize_reason=" + $(".authorize_reason").val();
        url += "&received_by=" + $(".received_by").val();
        url += "&remarks=" + $(".remarks").val();
        url += "&ex_ids=" + getids("list_formfiz_extension_cashier");
        url += "&extension_amount=" + getValues("list_formfiz_extension_cashier", "selected .ex_lawazim_input");





        var status = true;



        $(".selected .ex_lawazim_input").each(function() {


            if ($(this).val() != $(this).data("value")) {


                status = false;

            }
        })






        var code = function() {


            var slink = "getajax.php?file=fiz/cashier_actions&" + url;

            $.get(slink, function(retdata) {


                //  lightBox("View Html", retdata);


                alert(retdata);
            })
        }
        if (status == false) {



            if ($(".authorize_reason").val() == "") {
                $(".authorize_reason_p").show();
                alert("Please enter reason for authorization of a change in lawazim!");

            } else {


                checkuser(code);


            }









        } else {
            var callbacks = $.Callbacks();
            callbacks.add(code);
            callbacks.fire();


        }
    })


})