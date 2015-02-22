<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plgvi_gatData($id, $pro) {


    /* @var $lib  libs\libs */
    global $lib;


    $more = " order by `order` DESC ";

    $datasql = $lib->util->getXrefData('com_video_gallery', $id, $more);

    $mydata = '<div class=\'list_carousel\'><ul>';
    foreach ($datasql as $d) {
        $data = $d;
        $mydata .= plgvi_Bock($pro, 'com_video_gallery', "com_video_gallery_categories", $data);
    }

    $mydata .= '</ul></div><div class="dev7-caroufredsel-pag"></div><script>'
            . '$(function(){'
            . '$(\'.list_carousel ul\').carouFredSel({ responsive: true,items: ' . $pro['vidimagesNumber'] . '}) '
            . '})'
            . '</script>';
    //   $returnData.= $this->u_slidedata($mydata, $id, $pro, "ac_images_gallery");
    return $mydata;
}

function plgvi_Bock($pro, $tableName, $tablecatName, $data, $type) {

    global $lib;

    $dcat = $lib->util->data->getCategoryData($tablecatName, $data['cat_id']);
    $url = $lib->util->createURL($tableName, $dcat['alias']);

    
   
    
    $mydata .= '<li>';


    $mydata .= '<div class=\'slide_inner\'>';
    $mydata .= '<a  class=\'lightbox-video\' rel="prettyPhoto"     title=\'' . $data['title'] . '\' href=\'' .  $lib->util->youtubeToemd($data['url']). '\' >';
    $mydata .= ' <img    style=\'width:' . $pro['vidimageWidth'] . ';height:' . $pro['vidimageHeight'] . ';\' 
                         class=\' itemBlock_imgae\'
                         src=\'/uploads/images/' . $data['th_image'] . '\' 
                         alt=\'' . $data['title'] . '\'>';
    $mydata .= ' <div class=\'caption\' >' . $data['title'] . '</div>';
    $mydata .= '</a>';
    $mydata .= '</div></li>';



    return $mydata;
}

?>
