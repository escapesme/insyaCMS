<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_slide_show_videosData($mid, $catid, $pro) {
    global $lib;

    $alias = $lib->util->getMenuAlias('com_video_gallery');

    $url = "/show/item/" . $d['id'] . "--" . $alias . ".html";




    $datasql = $lib->util->getXrefData('com_video_gallery', $catid);

    $r.=' <div class="' . $pro['style'] . '"><div id="nslider' . $mid . '" class="nivoSlider">';
    foreach ($datasql as $s) {
        $img = $s['th_image'];
        if ($img == "") {
            $img = $s['image'];
        }
        $r.="<a href='" . $url . "'><img class = 'thimages' 
            title = \"" . $s['title'] . $s['des'] . "\" src='/uploads/images/" . $img . "'  data-thumb='/uploads/images/" . $img . "'/></a>";
    }
    $r.='</div></div>';
    return $r;
}

function mod_slide_show_productsData($mid, $catid, $pro) {
    global $lib;

    $alias = $lib->util->getMenuAlias('com_products');




    $url = "/show/item/" . $d['id'] . "--" . $alias . ".html";


    $datasql = $lib->util->getXrefData('com_products', $catid);



    $r.=' <div class="' . $pro['style'] . '"><div id="nslider' . $mid . '" class="nivoSlider">';
    foreach ($datasql as $s) {
        $img = $s['th_image'];
        if ($img == "") {
            $img = $s['image'];
        }
        $r.="<a href='" . $url . "'><img class = 'thimages' title = \"" . $s['title'] . $s['des'] . "\" src='/uploads/images/" . $img . "'  data-thumb='/uploads/images/" . $img . "'/></a>";
    }
    $r.='</div></div>';
    return $r;
}

function mod_slide_show_newsData($mid, $catid, $pro) {
    global $lib;


    $datasql = $lib->util->getXrefData('com_content_article', $catid);


    $r.=' <div class="' . $pro['style'] . '"><div id="nslider' . $mid . '" class="nivoSlider">';

    $alias = $lib->util->getMenuAlias('com_content_article');



    $url = "/show/item/" . $d['id'] . "--" . $alias . ".html";
    foreach ($datasql as $s) {
        $img = $s['th_image'];
        if ($img == "") {
            $img = $s['image'];
        }
        $r.="<a href='" . $url . "'><img class = 'thimages' title = \"" . $s['title'] . $s['des'] . "\" src='/uploads/images/" . $img . "'  data-thumb='/uploads/images/" . $img . "'/></a>";
    }
    $r.='</div></div>';
    return $r;
}

function mod_slide_show_imagesData($mid, $catid, $pro) {
    global $lib;



    //   $datasql = $lib->db->get_data('com_images_gallery', '', 'cat_id like "%' . $catid . '%"');
    $datasql = $lib->util->getXrefData('com_images_gallery', $catid);



    $r.=' <div class="' . $pro['style'] . '"><div id="nslider' . $mid . '" class="nivoSlider">';
    foreach ($datasql as $s) {


        $imgth = $s['th_image'];


        $img = $s['image'];

        $r.="<a href='" . $s['link'] . "'>
            <img class = 'thimages' title = \"" . $s['title'] . "<div class='dec'>" . $s['des'] . "</div>\" src='/uploads/images/" . $img . "'  data-thumb='/uploads/images/" . $imgth . "'/></a>";
    }
    $r.='</div></div>';
    return $r;
}

function NovioGallery($pro) {

    $mid = $pro['myid'];


    $r.='    
        <script type="text/javascript">
       $(document).ready(function() {
            $("#nslider' . $mid . '").nivoSlider({
                effect: \'' . $pro['effect'] . '\', // Specify sets like: \'random,fold,fade,sliceDown\'
                slices: 15, // For slice animations
                boxCols: 8, // For box animations
                boxRows: 4, // For box animations
                animSpeed:' . $pro['Speed'] . ', // Slide transition speed
                pauseTime: ' . $pro['pauseTime'] . ', // How long each slide will show
                startSlide: 0, // Set starting Slide (0 index)
                directionNav: ' . $pro['directionNav'] . ', // Next & Prev navigation
                directionNavHide: ' . $pro['directionNavHide'] . ', // Only show on hover
                controlNav: true, // 1,2,3... navigation
                pauseOnHover: ' . $pro['pauseOnHover'] . ',
                controlNavThumbs: ' . $pro['controlNavThumbs'] . ',
                controlNavThumbsFromRel: true,
                controlNavThumbsSearch: \'\',
                controlNavThumbsReplace: \'\',
                captionOpacity:  ' . $pro['captionOpacity'] . '

            });
        });</script>	
    ';






    if ($pro['viwtype'] == "videos") {
        $r.= mod_slide_show_videosData($mid, $pro['seleccatvideo'], $pro);
    } else if ($pro['viwtype'] == "products") {
        $r.= mod_slide_show_productsData($mid, $pro['seleccatpro'], $pro);
    } else if ($pro['viwtype'] == "news") {
        $r.= mod_slide_show_newsData($mid, $pro['seleccatnews'], $pro);
    } else {
        $r.= mod_slide_show_imagesData($mid, $pro['seleccat'], $pro);
    }








    echo $r;
}

?>
