/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {




    $(document).on("click", ".its_id.button", function() {


        var o = $(this);



        sendPAjax("ajax/coms/fiz/reservations_actions", "status=lgoin&value=" + $(".its_id").val(), function(data) {




            if ($.trim(data) == "0") {
                alert("Error: User data could not be retrieved. Please check if the ITS IS is correct.");



            } else {


                window.location = o.data("to");
            }


        })
    })
})