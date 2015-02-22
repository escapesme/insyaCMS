

<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */




function mod_slide_show($pro) {

    global $lib;
   
    $data = NovioGallery($pro);

    return $data;
}
?>


<script>


    $(function() {


        $(".th_btup").click(function() {




            var position = $('.thimgs').position();
            if (position.top < 0) {
                $('.thimgs').stop(true, false).animate({
                    top: '+=45'
                }, 1000);
            } else {
                $('.thimgs').stop(true, false).animate({
                    top: '0'
                }, 1000);
            }

        })

        var numh = 0;

        $(".th_btdown").click(function() {


            var w = $('.thimgs').height();
            if (numh == 0) {

                numh = $('.thimgs').height();
            }
            var pw = $('.thBar').height();
            var d = pw - numh;
            //    
            var position = $('.thimgs').position();



            if (position.top >= d) {
                $('.thimgs').stop(true, false).animate({
                    top: '-=45'
                }, 1000, function() {
                });
            } else {
                $('.thimgs').stop(true, false).animate({
                    top: p
                }, 1000);
            }

        })
    })








</script>