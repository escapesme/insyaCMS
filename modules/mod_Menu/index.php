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

//($lib->site->isInStatus


    if ($lib->site->checkStatusAlias("cairo"))  {

        echo '<script>$(function(){$(".__li_355").addClass("li_active")})</script>';
        
        
        
        
    }   else  if ($lib->site->checkStatusAlias("mutah")) 
    {
        echo '<script>$(function(){$(".__li_356").addClass("li_active")})</script>';
    }






    //__li_352 li_active


    $datasql = $lib->db->get_data('menu_itmes', '', 'cat_id=0  and parent_id=' . $pro['selecmenu'] . " and `show`='1'  Order by `order` ");





    $data = "<div class='menu menu" . $pro['selecmenu'] . "'><ul>";



    foreach ($datasql as $d) {


        $d = $lib->language->getDBArray("menu_itmes", $d['id'], $d);

        $pPermission = $lib->users->getMenuPermission();

        if (($d['permission_all'] == "1" ||
                $lib->util->chkInPermission($d['id'], $pPermission)) &&
                $lib->util->chkInPermissionGuset($d['permission_gust'])) {




            if ($lib->site->isInStatus($d['id'], $d['all_status'], "menu")) {






                $href = mod_menu_updateLink($d);

                $liClass = " menu_itm  __li_" . $d['id'];
                $aClass = " my_menu_itm  __a_" . $d['id'];


                if ($d['openType'] == "1") {

                    $aClass .= " lightbox-url ";
                }


                if ($pro['colorbg'] == "1") {
                    $style = "style='background:#" . $d['color'] . "'";
                }


                if ($_GET['alias'] == $d['mei_alias']) {
                    $liClass .= " li_active ";
                }

                $title = $lib->util->out($d['mei_title'], true);



                $data .= '<li ' . mod_menu_createStatu($d) . '  ' . $style . ' class="' . $liClass . '">
                    <div class=\'menu_itminnr\'>
                    <a title="' . $title . '"  class="' . $aClass . '" href=\'' . $href . '\'>';

                if ($pro['viewImage'] == "1") {
                    $data .="<img src='/uploads/images/" . $d['mei_image'] . "'/>";
                }

                $data .= "<span>" . $title . "</span></a>"
                        . "</div>" . getsubmenu($d['id'], $pro['selecmenu'], $pro) . '</li>';
            }
        }
    }
    $data.='</ul></div>';


    return $data;
}

?>
