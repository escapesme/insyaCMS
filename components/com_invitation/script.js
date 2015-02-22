/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



$(function() {


    $(".invitationBT").click(function() {
        if ($.trim($(".invitationcode").val()) !== "") {
            createSesstion("invitationcode", $(".invitationcode").val(), function() {
                location.reload();
            })
        }

    })





    $('.invitationcode').keypress(function(e) {
        if (e.which == 13) {

            if ($.trim($(".invitationcode").val()) !== "") {
                createSesstion("invitationcode", $(".invitationcode").val(), function() {
                    location.reload();
                })
            }


           
        }
    });
})




