/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function newsTikerRender(Class) {

    

    $(function() {

        $('._' + Class).totemticker({
            row_height: $('._' + Class + " li").css("height"),
            next: '.ticker-next' + Class,
            previous: '.ticker-previous' + Class,
            stop: '.stop' + Class,
            start: '.start' + Class,
            mousestop: true
        });
    })

}




