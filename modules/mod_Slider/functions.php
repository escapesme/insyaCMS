<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mod_slider_banner($pro) {



    $myid = $pro['myid'];
    global $lib;

    $more = " order by `order` DESC ";
    $datasql = $lib->util->getXrefData('com_images_gallery', $pro['seleccat'], $more);


    $mydata .= '<script>

            
 jQuery(window).load(function() {$(".htmlslider' . $myid . '").MySlider(' . $pro['number_slides_visible'] . ',' . $pro['transition_time'] . ',\'' . $pro['effect'] . '\'); });
 

</script><div style="height:' . $pro['carousel_height'] . 'px; "class="htmlslidercont htmlslider' . $myid . '">';
    foreach ($datasql as $d) {
        $mydata.='<div class=\'row\'>
            <div class="s_image"><img style="height:' . $pro['slide_height'] . 'px;width:' . $pro['slide_width'] . 'px; "  src=\'uploads/images/' . $d['th_image'] . '\' alt=\'' . $d['title'] . '\'></div>
            <div class=\'dec\'>' . $d['des'] . ' </div>    
</div>';
    }

    $mydata.='<div class=\'counter\'></div></div>';


    return $mydata;
}

function mod_sliderData_Block($pro, $lang, $tableName, $tablecatName, $data, $caturl) {

    global $lib;

    $dcat = $lib->util->data->getCategoryData($tablecatName, $data['cat_id']);
    if ($caturl != "") {
        $url = $lib->util->createURL($tableName, $dcat['alias']);
    } else {
        $url = $lib->util->createURL($tableName, $dcat['alias'], $data['alias']);
    }
    $mydata .= '<li>';


    $mydata .= '<div class=\'slide_inner\'>';

    if ($pro['linkType'] == "fullLink") {
        $mydata .= '<a class=\'link\' href=\'' . $url . '\'>';
    }

    if ($pro['showImage'] == "1") {
        $mydata .= ' <div class="conimg" ><img  
                style=\'width:' . $pro['imageWidth'] . ';height:' . $pro['imageHeight'] . ';\' 
                class=\'photo\' 
                src=\'/uploads/images/' . $data['th_image'] . '\' 
                alt=\'' . $data['title'] . '\'></div>';
    }
    if ($pro['showTitle'] == "1") {
        $mydata .= ' <div class=\'caption\' >' . $data['title'] . '</div>';
    }
    if ($pro['showDec'] == "1") {
        $mydata .= ' <div class=\'dec\' >' . $lib->util->limit_text($data['des'], $pro['DecNum']) . '</div>';
    }
    if ($pro['linkType'] == "fullLink") {

        $mydata .= '</a>';
    }

    if ($pro['linkType'] == "more") {
        $mydata .= '<a class=\'link more button\' href=\'' . $url . '\'>' . $lang['readMore'] . '</a>';
    }

    $mydata .= '</div></li>';



    return $mydata;
}

function mod_slider_slider($pro, $lng) {
    global $lib;




    $myid = $pro['myid'];

    if ($pro['viwtype'] == "videos") {


        $returnData.= slidedata(mod_slider_getvideos($pro, $lng), $myid, $pro);
    } else if ($pro['viwtype'] == "products") {


        $returnData.= slidedata(mod_slider_getproducts($pro, $lng), $myid, $pro);
    } else if ($pro['viwtype'] == "news") {


        $returnData.= slidedata(mod_slider_getnews($pro, $lng), $myid, $pro);
    } else {

        $returnData.= slidedata(mod_slider_getImages($pro, $lng), $myid, $pro);
    }


    //  select_data="videos>>videos;images>>images;products>>products"






    return $returnData;
}

function slidedata($data, $myid, $pro) {



    $returnData.='<div class="slideshow multiple_slides_visible" id="multiple_slides_visible' . $myid . '">' . $data . '';
    if ($pro['timer'] == "1") {
        $returnData.=' 
<div class="timer1"></div> ';
    }
    $returnData.='<div class=\'sliderbtsbar\'> ';
    if ($pro['buttonsShow'] == "1") {
        $returnData.='    
 
<a  class="slidernext" href="#">&gt;</a><a class="sliderprev" href="#">&lt;</a>';
    }
    if ($pro['pagesShow'] == "1") {
        $returnData.=' <div  class="pager"></div>';
    }

    $returnData.='</div></div>

<script>
     $(function(){
	
         $(\'#multiple_slides_visible' . $myid . ' ul\').carouFredSel({
          direction: \'' . $pro['direction'] . '\',
                                        height: \'' . $pro['height'] . '\',';



    if ($pro['buttonsShow'] == "1") {
        $returnData.=' 
					prev: \'#multiple_slides_visible' . $myid . ' .sliderprev\',
					next: \'#multiple_slides_visible' . $myid . ' .slidernext\',';
    }
    if ($pro['pagesShow'] == "1") {
        $returnData.=' 
                                        pagination: "#multiple_slides_visible' . $myid . ' .sliderpager",';
    }


    $returnData.=' 	width: \'100%\',
                                        
					scroll: ' . $pro['scroll'] . ',
                                        mousewheel: true';




    if ($pro['auto'] == "1") {
        $returnData.=' , auto: {
                                             delay:' . $pro['delay'] . ',
                                               pauseOnHover: \'resume\'';

        if ($pro['timer'] == "1") {
            $returnData.=' ,progress: \'#multiple_slides_visible' . $myid . ' .timer1\'';
        }
        $returnData.='}';
    } else {

        $returnData.=' , auto:false';
    }




    $returnData.=' ,swipe: {
						onMouse: false,
						onTouch: true
					},
					items: {
                                        height: \'30%\',	
						visible: {
							min: ' . $pro['number_slides_visible'] . ',
							max: ' . $pro['number_slides_visible'] . '
						}
					}
				});

  

    });
</script>';



    return $returnData;
}

function mod_slider_getImages($pro, $lang) {

    global $lib;
    $more = " order by `order` DESC ";

    $datasql = $lib->util->getXrefData('com_images_gallery', $pro['seleccat'], $more);

    $mydata = '<div class=\'list_carousel\'><ul>';
    foreach ($datasql as $d) {
        $data = $d;
        $mydata .= mod_sliderData_Block($pro, $lang, 'com_images_gallery', "com_images_gallery_categories", $data, "cat");
    }

    $mydata .= '</ul></div>';



    return $mydata;
}

function mod_slider_getvideos($pro, $lang) {

    global $lib;
    $more = " order by `order` DESC ";

    $datasql = $lib->util->getXrefData('com_video_gallery', $pro['seleccatvideo'], $more);

    $mydata = '<div class=\'list_carousel\'><ul>';
    foreach ($datasql as $d) {

        $data = $d;
        $mydata .= mod_sliderData_Block($pro, $lang, 'com_video_gallery', "com_video_gallery_categories", $data);
    }

    $mydata .= '</ul></div>';



    return $mydata;
}

function mod_slider_getproducts($pro, $lang) {

    global $lib;

    $more = " order by `order` DESC ";

    $datasql = $lib->util->getXrefData('com_products', $pro['seleccatpro'], $more);


    //   $mydata = '[';
    $mydata = '<div class=\'list_carousel\'><ul>';

    $myrow = 0;
    foreach ($datasql as $d) {

        $data = $d;
        $data['des'] = $d['des'];
        $mydata .= mod_sliderData_Block($pro, $lang, 'com_products', "com_products_categories", $data);
    } $mydata .= '</ul></div>';


    return $mydata;
}

function mod_slider_getnews($pro, $lang) {

    global $lib;
    $more = " order by `order` DESC ";

    $datasql = $lib->util->getXrefData('com_content_article', $pro['seleccatnews'], $more);

    $mydata = '<div class=\'list_carousel\'><ul>';

    foreach ($datasql as $d) {
        $data = $d;
        $data['des'] = $d['des'];
        $mydata .= mod_sliderData_Block($pro, $lang, 'com_content_article', "com_content_catgories", $data);
    }

    $mydata .= '</ul></div>';



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


