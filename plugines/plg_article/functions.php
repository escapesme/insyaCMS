<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plart_gatData($id, $pro) {


    /* @var $lib  libs\libs */
    global $lib;


    $more = " order by `order` DESC ";

    $datasql = $lib->util->getXrefData('com_content_article', $id, $more);

    $mydata = '<div class=\'list_carousel\'><ul>';
    foreach ($datasql as $d) {
        $data = $d;
        $mydata .= plart_Bock($pro, 'com_content_article', "com_content_catgories", $data);
    }

    $mydata .= '</ul></div><div class="dev7-caroufredsel-pag"></div><script>'
            . '$(function(){'
            . '$(\'.list_carousel ul\').carouFredSel({ responsive: true,items: ' . $pro['artimagesNumber'] . '}) '
            . '})'
            . '</script>';
    //   $returnData.= $this->u_slidedata($mydata, $id, $pro, "ac_images_gallery");
    return $mydata;
}

function plart_Bock($pro, $tableName, $tablecatName, $data, $type) {

    global $lib;

    $dcat = $lib->util->data->getCategoryData($tablecatName, $data['cat_id']);
    $url = $lib->util->createURL($tableName, $dcat['alias']);




    $mydata .= '<li>';


    $mydata .= '<div class=\'slide_inner\'>';
    $mydata .= '<a  class=\'lightbox-video\' rel="prettyPhoto"     title=\'' . $data['title'] . '\' href=\'' . $url . '\' >';
    $mydata .= ' <img    style=\'width:' . $pro['artimageWidth'] . ';height:' . $pro['artimageHeight'] . ';\' 
                         class=\' itemBlock_imgae\'
                         src=\'/uploads/images/' . $data['th_image'] . '\' 
                         alt=\'' . $data['title'] . '\'>';
    $mydata .= ' <div class=\'caption\' >' . $data['title'] . '</div>';
    $mydata .= '</a>';
    $mydata .= '</div></li>';



    return $mydata;
}

?>
