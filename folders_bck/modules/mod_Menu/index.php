<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_menu($pro) {
    global $lib;



    $datasql = $lib->db->get_data('menu_itmes', '', 'cat_id=0 and `delete`=0 and   enabled=1 and parent_id=' . $pro['selecmenu'] . " and `show`='1'  Order by `order` ");

    $data = "<div class='menu menu" . $pro['selecmenu'] . "'><ul>";

    foreach ($datasql as $d) {


        // print_r($datasql);


        $pPermission = $lib->users->getMenuPermission();
        if (($d['permission_all'] == "1" || $lib->util->chkInPermission($d['id'], $pPermission) == true ) && $lib->util->chkInPermissionGuset($d['permission_gust']) == true) {

            if ($lib->util->cities->getIsInSite($d['id'], $d['all_site'], "menu") == true) {




                $href = "";



                if ($d['openType'] == "1") {

                    $moreClass = "lightbox-url";
                } else {

                    $moreClass = "";
                }







                if (trim($d['mei_main']) == "com_link") {
         
                    $href = $d['property__url'];
                } else {

                    $href = $lib->util->createURLAL($d['mei_alias']);
                }




                $moreact = "";

                if ($_GET['alias'] == $d['mei_alias']) {
                    $moreact = "li_active ";
                } else {


                    $moreact = "";
                };




                if ($pro['colorbg'] == "1") {


                    $style = "style='background:#" . $d['color'] . "'";
                }
                $data .= '<li  ' . $style . ' class=\'   __' . $d['id'] . ' menu_itm ' . $moreact . '\'><div class=\'menu_itminnr\'>
            <a class=\'' . $moreClass . '  __' . $d['id'] . ' my_menu_itm \' href=\'' . $href . '\'>';


                if ($pro['viewImage'] == "1") {

                    $data .="<img src='/uploads/images/" . $d['mei_image'] . "'/>";
                }

                $data .= "<span>" . $lib->util->out($d['mei_title'], true) . "</span></a></div>" . getsubmenu($d['id'], $pro['selecmenu'], $pro) . '</li>';
            }
        }
    }
    $data.='</ul></div>';


    return $data;
}

?>
