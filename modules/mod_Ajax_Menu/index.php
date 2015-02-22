<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_ajaxMenu($pro) {
    global $lib;



    $data = mod_ajaxMenu_getheader($pro);

    $data .= mod_ajaxMenu_getBody($pro);
    return $data;
}

function mod_ajaxMenu_getheader($pro) {
    global $lib;
    $datasql = $lib->db->get_data('menu_itmes', '', 'cat_id=0 and `delete`=0 and   enabled=1 and parent_id=' . $pro['selecmenu'] . " and `show`='1'  Order by `order` ");


    $returnData = "<div class='ajaxMenu_getheader' ><ul>";

    $returnData .= '<li ><a id="item">الكل</a><li>';
    foreach ($datasql as $d) {

        $returnData .= '<li ><a id="h' . $d['id'] . '">' . $d['mei_title'] . '</a><li>';
    }
    $returnData .= "</ul></div>";

    return $returnData;
}

function mod_ajaxMenu_getBody($pro) {
    global $lib;
    $datasql = $lib->db->get_data('menu_itmes', '', 'cat_id<>0 and `delete`=0 and   enabled=1 and parent_id=' . $pro['selecmenu'] . " and `show`='1'  Order by `order` ");


    $returnData = "<div class='ajaxMenu_getbody' >
        <div class='getData'><div class='Close'></div><div class='data'></div></div>";
    foreach ($datasql as $d) {

        $returnData .= '<div  id="' . $d['mei_alias'] . '" class="item b' . $d['cat_id'] . ' item">
            <div class="recentborder"></div>
            <h3>' . $d['mei_title'] . '</h3>
                <div class="overdefult" style="display: block;"><div class="overLowerDefault"></div></div>
         <div class="image"><img src="/uploads/images/' . $d['mei_image'] . '" class="lightColor modig_imgae"></div>   
<div class="recentborder"></div><h3>' . $d['mei_comment'] . '</h3>
<div class="bottomborder"></div></div>';
    }
    $returnData .= "</div>";

    return $returnData;
}

?>
