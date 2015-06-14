/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function createEdit(rid) {
   
    getAjax("coms/fiz/reservations_actions", "status=editres&rid=" + rid, function (f) {

        window.location = "/site/cairo/Reservations/step/reservation-form/";

    })


}
$(function () {



    $(document).on("click", ".delete_its", function () {
        var rid = $(this).data("rid");
        getAjax("coms/fiz/reservations_actions", "status=deleteres&rid=" + rid, function (f) {
            window.location = "/Reservations/"
        });

    });





    $(document).on("click", ".edit_its", function () {
        createEdit($(this).data("rid"));
    });


    $(document).on("click", ".documents_its", function () {
        var rid = $(this).data("rid");
        getAjax("coms/fiz/reservations_actions", "status=set_reservation_documet&rid=" + rid, function (f) {
            window.location = "/site/cairo/Reservations/step/verify-documents/";
        })

    });
    $(document).on("click", ".new_its", function () {

        var rid = $(this).data("rid");
        getAjax("coms/fiz/reservations_actions", "status=newres&rid=" + rid, function (f) {
            window.location = "/site/cairo/Reservations/step/reservation-form/";
        })

    })
    $(document).on("click", ".logout_its", function () {


        var rid = $(this).data("rid");
        getAjax("coms/fiz/reservations_actions", "status=logoures&rid=" + rid, function (f) {
            window.location = "?";
        })



    })

})