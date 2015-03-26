<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_menu_createStatu($d) {
    /* @var $lib  libs\libs */
    global $lib;
    $r = "";

    if ($lib->site->cretaStatus($d['id'], $lib->variables->statusPost)) {

        $r = " data-postsatatus='" + $lib->site->cretaStatus($d['id'], $lib->variables->statusPost) + "'";
    }

    if ($lib->site->cretaStatus($d['id'], $lib->variables->statusSession)) {

        $r .= " data-sessionsatatus='" + $lib->site->cretaStatus($d['id'], $lib->variables->statusSession) + "'";
    }

    return $r;
}

function mod_menu_updateLink($d, $dap) {
    /* @var $lib  libs\libs */
    global $lib;
    $href = "";

    if (trim($d['mei_main']) == "com_link") {

        $href = $d['property__url'];
    } else {

        if (isset($dap)) {
            $href .= $lib->util->createURLAL($dap['mei_alias'], $d['mei_alias']);
        } else {

            $href .= $lib->util->createURLAL($d['mei_alias']);
        }
    }




    return $href;
}

function getsubmenu($id, $parent, $pro) {

    /* @var $lib  libs\libs */
    global $lib;



    $datasql = $lib->db->get_data('menu_itmes', '*', 'cat_id="' . $id . '"  and   parent_id="' . $parent . '" and `show`="1" ');




    if (is_array($datasql[0])) {

//  print_r($datasql);


        $data = "<div class='submenu submenu" . $id . "'><div class='submenutop'></div>
<ul>";



        foreach ($datasql as $d) {


            //$lib->language->getText("com_project", "title", $data['id'], $data['title']);



            $d = $lib->language->getDBArray("menu_itmes", $d['id'], $d);

            $dap = $lib->db->get_row('menu_itmes', '', 'id=' . $d['cat_id']);

            $prom = $lib->util->getFromProperits($d['properties']);

            $pPermission = $lib->users->getMenuPermission();



            if (($d['permission_all'] == "1" ||
                    $lib->util->chkInPermission($d['id'], $pPermission)) &&
                    $lib->util->chkInPermissionGuset($d['permission_gust'])) {
                if ($lib->site->isInStatus($d['id'], $d['all_site'], "menu")) {




                    if ($_GET['alias'] == $dap['mei_alias'] && $_GET['id'] == $d['mei_alias']) {
                        $_GET['aliasParent'] = $dap['mei_alias'];
                        $_GET['alias'] = $d['mei_alias'];
                        unset($_GET['show']);
                        unset($_GET['id']);
                    }

                    $href = mod_menu_updateLink($d,$dap);

                    $liClass = " sub_menu_itm  __li_" . $d['id'];
                    $aClass = " sub_menu_itm  __a_" . $d['id'];


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



                    $data .= '<li  ' . $style . ' class="' . $liClass . '">
  <div class=\'menu_itminnr\'>
  <a ' . mod_menu_createStatu($d) . ' title="' . $title . '"  class="' . $aClass . '" href=\'' . $href . '\'>';

                    if ($pro['viewImage'] == "1") {
                        $data .="<img src='/uploads/images/" . $d['mei_image'] . "'/>";
                    }

                    $data .= "<span>" . $title . "</span></a>"
                            . "</div>" . getsubmenu($d['id'], $pro['selecmenu'], $pro) . '</li>';
                }
            }
        }
        $data.="</ul> </div>";
    }

    return $data;
}
?>



