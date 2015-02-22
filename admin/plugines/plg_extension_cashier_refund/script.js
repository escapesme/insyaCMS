/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {


    $(".updatech").click(function() {


        var url = "authorised_by=" + $(".authorised_by").val();
        url += "&status=refund";
        url += "&authorize_reason=" + $(".authorize_reason").val();
        url += "&received_by=" + $(".received_by").val();
        url += "&remarks=" + $(".remarks").val();
        url += "&ex_ids=" + getids("list_formfiz_cashier_receipt_items");
        url += "&extension_amount=" + getValues("list_formfiz_cashier_receipt_items", "selected .paid_amount_input");





        var status = true;









        $(".selected .paid_amount_input").each(function() {

           
            //if ($(this).val() != $(this).data("value")) {


                status = false;

          //  }
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