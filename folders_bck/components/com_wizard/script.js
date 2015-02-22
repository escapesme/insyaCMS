/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(function() {


    $(".wnext").click(function() {
        

        if ($("form").doesExist()) {
            $("form").submit();
            return false;
        }
    })

})