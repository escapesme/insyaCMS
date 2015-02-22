/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function newsTikerRender(Class) {

    /*
     yScroll: "top"                          // the position of the marquee initially scroll (can be 
     // either "top" or "bottom")
     , showSpeed: 850                          // the speed of to animate the initial dropdown of the messages
     , scrollSpeed: 12                         // the speed of the scrolling (keep number low)
     , pauseSpeed: 5000                        // the time to wait before showing the next message or 
     // scrolling current message
     , pauseOnHover: true                      // determine if we should pause on mouse hover
     , loop: -1                                // determine how many times to loop through the marquees 
     // (#'s < 0 = infinite)
     , fxEasingShow: "swing"                   // the animition easing to use when showing a new marquee
     , fxEasingScroll: "linear"                // the animition easing to use when showing a new marquee
     
     // define the class statements
     , cssShowing: "marquee-showing"
     
     // event handlers
     , init: null                              // callback that occurs when a marquee is initialized
     , beforeshow: null                        // callback that occurs before message starts scrolling on screen
     , show: null                              // callback that occurs when a new marquee message is displayed
     , aftershow: null                         // callback that occurs after the message has scrolled
     
     
     */

    /*
     * $("#id").marquee("update")
     
     This updates the marquee's cache—which is required after dynamically updating the <ul /> elements content in order to show the new elements.
     $("#id").marquee("pause")
     
     Pauses the current marquee to prevent it from scrolling.
     $("#id").marquee("resume")
     
     Resumes the marquee so it begins scrolling again.
     $("#id").marquee("object")
     * 
     * 
     * 
     */
    /* $(document).ready(function() {
     $('.newstiker' + Class).marquee({
     yScroll: "top"
     , pauseOnHover: true
     });
     
     $('.stop' + Class).marquee("pause");
     
     $('.start' + Class).marquee("resume");
     });*/


    $(function() {


        // $('.newstiker' + Class).marquee();

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




