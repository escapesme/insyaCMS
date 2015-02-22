<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plgpro_gatData($id, $pro) {


    /* @var $lib  libs\libs */
    global $lib;


    $more = " order by `order` DESC ";

    $datasql = $lib->util->getXrefData('com_products', $id, $more);

    $mydata = '<div class=\'list_carousel\'><ul>';
    foreach ($datasql as $d) {
        $data = $d;
        $mydata .= plgpro_Bock($pro, 'com_products', "com_products_categories", $data);
    }

    $mydata .= '</ul></div><div class="dev7-caroufredsel-pag"></div><script>'
            . '$(function(){'
            . '$(\'.list_carousel ul\').carouFredSel({ responsive: true,items: ' . $pro['proimagesNumber'] . '}) '
            . '})'
            . '</script>';
    //   $returnData.= $this->u_slidedata($mydata, $id, $pro, "ac_images_gallery");
    return $mydata;
}

function plgpro_Bock($pro, $tableName, $tablecatName, $data, $type) {

    global $lib;

    $dcat = $lib->util->data->getCategoryData($tablecatName, $data['cat_id']);
    $url = $lib->util->createURL($tableName, $dcat['alias']);

    
   
    
    $mydata .= '<li>';


    $mydata .= '<div class=\'slide_inner\'>';
    $mydata .= '<a  class=\'lightbox-video\' rel="prettyPhoto"     title=\'' . $data['title'] . '\' href=\'' .  $url. '\' >';
    $mydata .= ' <img    style=\'width:' . $pro['proimageWidth'] . ';height:' . $pro['proimageHeight'] . ';\' 
                         class=\' itemBlock_imgae\'
                         src=\'/uploads/images/' . $data['th_image'] . '\' 
                         alt=\'' . $data['title'] . '\'>';
    $mydata .= ' <div class=\'caption\' >' . $data['title'] . '</div>';
    $mydata .= '</a>';
    $mydata .= '</div></li>';



    return $mydata;
}

?>
