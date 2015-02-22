
<link href="/templates/moblie/data/photoswipe.css" type="text/css" rel="stylesheet" />


<script type="text/javascript" src="/templates/moblie/data//klass.min.js"></script>

<script src="/templates/moblie/data/code.photoswipe.jquery-3.0.5.min.js"></script>
<script type="text/javascript">

    /*
     * IMPORTANT!!!
     * REMEMBER TO ADD  rel="external"  to your anchor tags. 
     * If you don't this will mess with how jQuery Mobile works
     */

    (function(window, $, PhotoSwipe) {

        $(document).ready(function() {

            $(".gallery a").photoSwipe();



            $('div')
                    .on('pageshow', function(e) {



                        var
                                currentPage = $(e.target),
                                options = {},
                                photoSwipeInstance = $(".gallery a", e.target).photoSwipe(options, currentPage.attr('id'));




                        return true;

                    })

                    .on('pagehide', function(e) {

                        var
                                currentPage = $(e.target),
                                photoSwipeInstance = PhotoSwipe.getInstance(currentPage.attr('id'));

                        if (typeof photoSwipeInstance != "undefined" && photoSwipeInstance != null) {
                            PhotoSwipe.detatch(photoSwipeInstance);
                        }

                        return true;

                    });

        });

    }(window, window.jQuery, window.Code.PhotoSwipe));

</script>

<script>

    jQuery(document).ready(function() {
        jQuery("img.lazy").lazy();
    });





</script>


<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro, $lang) {


    $rowNumbers = $pro['rowNumbers'];
    $data = '<div class=\'com_images_gallery images_gallery\'>';

    if (isset($_GET['page'])) {
        $rowFrom = $_GET['page'];
    } else {
        $rowFrom = "0";
    }

    global $lib;



    if (isset($_GET['show']) && $_GET['show'] == "cat") {

        if (isset($_GET['id']) && $_GET['id'] == "tag") {

            $data .=com_images_getTags($lang);
        } else {



            $id = $lib->util->returnID("com_images_gallery_categories", $_GET['id']);


            $data .= getimages($pro, $lang, $id, $rowFrom, $rowNumbers);
        }
    } else if (isset($_GET['show']) && $_GET['show'] == "item") {

        if (isset($_GET['catid']) && $_GET['catid'] == "tag") {




            $data .="<div class='fliter'>" . $lang['tag'] . "</div>";
            $data .="<div class='fliterData'>" . $_GET['id'] . "</div>";
            $data .= getimagestag($_GET['id'], $rowFrom, $rowNumbers, $pro);
        } else {

            $id = $lib->util->returnID("com_images_gallery", $_GET['id']);

            $data .= getImage($id);
        }
    } else if ($pro['gallery'] != "") {

        $data .= getimages($pro, $lang, $pro['gallery'], $rowFrom, $rowNumbers);
    } else {


        //   $data .= getCategories("0");
    }
    return $data . "</div>";
}
?>


<div class='iglightBox'>

    <div class="lightbox-content"> 

        <div class='iglightBox_closebt'></div>
        <div class='iglightBox_next'></div>
        <div class='iglightBox_prev'></div>
        <image class='iglightBox_img'/>
        <div class='iglightBox_imageDes'></div>
    </div>

</div>



