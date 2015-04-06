/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function is_login(data) {

    $.get("ajax/sesstion/islogin.jsp", data);


}

$(function() {



    $(document).on("click", "input,a", function() {





        is_login(function(data) {

            if ($.trim(data) === "0") {
                window.location = "?alias=home";
            }
        })











    });
});