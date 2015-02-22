<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mod_slider_banner($pro) {



    $myid = $pro['myid'];
    global $lib;


    $datasql = $lib->util->getXrefData('com_images_gallery', $pro['seleccat']);


    $mydata .= '<script>

            
 jQuery(window).load(function() {$(".htmlslider' . $myid . '").MySlider(' . $pro['number_slides_visible'] . ',' . $pro['transition_time'] . ',\'' . $pro['effect'] . '\'); });
 

</script><div style="height:' . $pro['carousel_height'] . 'px; "class="htmlslidercont htmlslider' . $myid . '">';
    foreach ($datasql as $d) {
        $mydata.='<div class=\'row\'>
            <div class="s_image"><img style="height:' . $pro['slide_height'] . 'px;width:' . $pro['slide_width'] . 'px; "  src=\'uploads/images/' . $d['th_image'] . '\' alt=\'' . $d['title'] . '\'></div>
            <div class=\'dec\'>' . $d['dec'] . ' </div>    
</div>';
    }

    $mydata.='<div class=\'counter\'></div></div>';


    return $mydata;
}

function mod_slider_slider($pro) {
    global $lib;




    $myid = $pro['myid'];

    if ($pro['viwtype'] == "videos") {


        $returnData.= slidedata(mod_slider_getvideos($pro['seleccatvideo']), $myid, $pro);
    } else if ($pro['viwtype'] == "products") {


        $returnData.= slidedata(mod_slider_getproducts($pro['seleccatpro']), $myid, $pro);
    } else if ($pro['viwtype'] == "news") {


        $returnData.= slidedata(mod_slider_getnews($pro['seleccatnews']), $myid, $pro);
    } else {

        $returnData.= slidedata(mod_slider_getImages($pro['seleccat']), $myid, $pro);
    }


    //  select_data="videos>>videos;images>>images;products>>products"






    return $returnData;
}

function slidedata($data, $myid, $pro) {

    if (trim($data) == "") {

        $data = "[]";
    }
    $returnData.=' 
 
<div class="slideshow multiple_slides_visible" id="multiple_slides_visible' . $myid . '"></div>

<script>
     $(function(){

         

          $("#multiple_slides_visible' . $myid . '").agile_carousel({
                carousel_data: ' . $data . ',
                carousel_outer_height:' . $pro['carousel_outer_height'] . ',
                carousel_height: ' . $pro['carousel_height'] . ',
                carousel_outer_width:  ' . $pro['carousel_outer_width'] . ', 
                slide_height: ' . $pro['slide_height'] . ',          
                slide_width:  ' . $pro['slide_width'] . ',
                number_slides_visible:   ' . $pro['number_slides_visible'] . ',
                transition_time: ' . $pro['transition_time'] . ',
                control_set_1: "previous_button,next_button",
                control_set_2: "group_numbered_buttons",
                persistent_content: ""       
        });
        


    });
</script>';



    return $returnData;
}

function mod_slider_getImages($pro2) {

    global $lib;


    $datasql = $lib->util->getXrefData('com_images_gallery', $pro2);


    $mydata = '[';

    $myrow = 0;
    foreach ($datasql as $d) {
        $mor = "";
        $myrow++;
        if ($myrow > 1) {

            $mor = ",";
        }

        $mydata.=$mor . '
  {"content": "<div class=\'slide_inner\'><a class=\'photo_link\' href=\'' . $d['link'] . '\'><img class=\'photo\' src=\'/uploads/images/' . $d['th_image'] . '\' alt=\'Bike\'></a><a class=\'caption\' >' . $d['dec'] . '</a></div>",
  "content_button": "<div class=\'thumb\'><img src=\'/uploads/images/' . $d['th_image'] . '\' alt=\'' . $d['title'] . '\'></div><p>' . $d['title'] . '</p>"
  }';
    }
    $mydata.= ']';
    return $mydata;
}

function mod_slider_getvideos($pro2) {

    global $lib;


    $datasql = $lib->util->getXrefData('com_video_gallery', $pro2);
    $mydata = '[';

    $myrow = 0;
    foreach ($datasql as $d) {

        $dcat = $lib->db->get_row("com_video_gallery_categories", "*", "id=" . $d['cat_id']);
        $url = $lib->util->createURL('com_video_gallery', $dcat['alias'], $d['alias']);







        $mor = "";
        $myrow++;
        if ($myrow > 1) {

            $mor = ",";
        }

        $mydata.=$mor . '
  {"content": "<div class=\'slide_inner\'><a class=\'photo_link\' href=\'' . $url . '\'><img class=\'photo\' src=\'/uploads/images/' . $d['th_image'] . '\' alt=\'Bike\'></a><a class=\'caption\' >' . strip_tags($d['dec']) . '</a></div>",
  "content_button": "<div class=\'thumb\'><img src=\'/uploads/images/' . $d['th_image'] . '\' alt=\'' . $d['title'] . '\'></div><p>' . $d['title'] . '</p>"
  }';
    }
    $mydata.= ']';
    return $mydata;
}

/*
  function mod_slider_getvideos($pro2) {

  global $lib;
  $datasql = $lib->db->get_data('com_video_gallery', '', 'cat_id=' . $pro2 . ' and enabled=1 ORDER BY `order`');
  echo $pro2;

  $alias = $lib->util->getMenuAlias('com_video_gallery');

  $url = "/show/item/" . $d['id'] . "--" . $alias . ".html";
  $mydata = '[';

  $myrow = 0;
  foreach ($datasql as $d) {
  $mor = "";
  $myrow++;
  if ($myrow > 1) {

  $mor = ",";
  }

  $mydata.=$mor . '
  {"content": "<div class=\'slide_inner\'><a class=\'photo_link\' href=\'' . $url . '\'><img class=\'photo\' src=\'uploads/images/' . $d['th_image'] . '\' alt=\'Bike\'></a><a class=\'caption\' href=\'#\'>' . $d['dec'] . '</a></div>",
  "content_button": "<div class=\'thumb\'><img src=\'uploads/images/' . $d['th_image'] . '\' alt=\'' . $d['title'] . '\'></div><p>' . $d['title'] . '</p>"
  }';
  }
  $mydata.= ']';
  return $mydata;
  } */

function mod_slider_getproducts($pro2, $lang) {

    global $lib;



    $datasql = $lib->util->getXrefData('com_products', $pro2);
      
        
    $mydata = '[';


    $myrow = 0;
    foreach ($datasql as $d) {
        //  echo $myrow;



        $dcat = $lib->db->get_row("com_products_categories", "*", "id=" . $d['cat_id']);
        $url = $lib->util->createURL('com_products', $dcat['alias'], $d['alias']);


        $mor = "";
        $myrow++;
        if ($myrow > 1) {

            $mor = ",";
        }


        $mydata.=$mor . '
  {"content": "<div class=\'slide_inner\'><a class=\'photo_link\' href=\'' . $url . '\'><img class=\'photo\' src=\'/uploads/images/' . $d['th_image'] . '\' alt=\'Bike\'></a><a class=\'caption\' >' . $d['title'] . '</a></div>",
  "content_button": "<div class=\'thumb\'><img src=\'/uploads/images/' . $d['th_image'] . '\' alt=\'' . $d['title'] . '\'></div><p>' . $d['title'] . '</p>"
  }';
    }
    $mydata.= ']';
    return $mydata;
}

function mod_slider_getnews($pro2, $lang) {

    global $lib;


    $datasql = $lib->util->getXrefData('com_content_article', $pro2);

    $mydata = '[';

    $myrow = 0;
    foreach ($datasql as $d) {




        $dcat = $lib->db->get_row("com_content_catgories", "*", "id=" . $d['cat_id']);
        $url = $lib->util->createURL('com_content_article', $dcat['alias'], $d['alias']);


        $mor = "";
        $myrow++;
        if ($myrow > 1) {

            $mor = ",";
        }




        $mydata.=$mor . '
  {"content": "<div class=\'slide_inner\'><a class=\'photo_link\' href=\'' . $url . '\'><img class=\'photo\' src=\'/uploads/images/' . $d['th_image'] . '\' alt=\'Bike\'></a><a class=\'caption\' >' . addslashes(strip_tags($d['intro'])) . '</a></div>",
  "content_button": "<div class=\'thumb\'><img src=\'/uploads/images/' . $d['th_image'] . '\' alt=\'' . $d['title'] . '\'></div><p>' . $d['title'] . '</p>"
  }';
    }
    $mydata.= ']';
    return $mydata;
}
?>

<script>



    (function($) {
        $.fn.MySlider = function(interval, timet, effect) {
            var slides;
            var cnt;
            var amount;
            var i;
            function run() {

                // hiding previous image and showing next
                //fade slidex slidey defeffect noeffect




                if (effect == "slidey") {
                    $(slides[i]).slideUp(timet);
                }
                if (effect == "defeffect") {
                    $(slides[i]).hide(timet);
                }
                if (effect == "noeffect") {
                    $(slides[i]).hide();
                } else {

                    $(slides[i]).fadeOut(timet);
                }




                i++;
                if (i >= amount) {
                    i = 0;
                }

                if (effect == "slidey") {
                    $(slides[i]).slideDown(timet);
                }
                if (effect == "defeffect") {
                    $(slides[i]).show(timet);
                }
                if (effect == "noeffect") {
                    $(slides[i]).show();
                } else {


                    $(slides[i]).fadeIn(timet);
                }



                // updating counter
                cnt.text(i + 1 + ' / ' + amount);
                // loop
                setTimeout(run, interval);
            }

            slides = $(this).children(".row");


            $(slides[0]).show();

            cnt = $(this).children('.counter');
            amount = slides.length;
            i = 0;
            // updating counter
            cnt.text(i + 1 + ' / ' + amount);
            setTimeout(run, interval);
        };
    })(jQuery);
    // custom initialization





</script>
