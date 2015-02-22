<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plgig_gatData($id, $pro) {


    /* @var $lib  libs\libs */
    global $lib;


    $more = " order by `order` DESC ";

    $datasql = $lib->util->getXrefData('com_images_gallery', $id, $more);

    $mydata = '<div class=\'list_carousel\'><ul>';
    foreach ($datasql as $d) {
        $data = $d;
        $mydata .= plgig_Block($pro, 'com_images_gallery', "com_images_gallery_categories", $data);
    }

    $mydata .= '</ul></div><div class="dev7-caroufredsel-pag"></div><script>'
            . '$(function(){'
            . '$(\'.list_carousel ul\').carouFredSel({ responsive: true,items: ' . $pro['imagesNumber'] . '}) '
            . '})'
            . '</script>';
    //   $returnData.= $this->u_slidedata($mydata, $id, $pro, "ac_images_gallery");
    return $mydata;
}

function plgig_Block($pro, $tableName, $tablecatName, $data, $type) {

    global $lib;

    $dcat = $lib->util->data->getCategoryData($tablecatName, $data['cat_id']);
    $url = $lib->util->createURL($tableName, $dcat['alias']);

    $mydata .= '<li>';


    $mydata .= '<div class=\'slide_inner\'>';
    $mydata .= '<a  class=\'lightbox-img\'      title=\'' . $data['title'] . '\' href=\'/uploads/images/' . $data['image'] . '\' >';
    $mydata .= ' <img    style=\'width:' . $pro['imageWidth'] . ';height:' . $pro['imageHeight'] . ';\' 
                         class=\' itemBlock_imgae\'
                         src=\'/uploads/images/' . $data['th_image'] . '\' 
                         alt=\'' . $data['title'] . '\'>';
    $mydata .= ' <div class=\'caption\' >' . $data['title'] . '</div>';
    $mydata .= '</a>';
    $mydata .= '</div></li>';



    return $mydata;
}

?>
