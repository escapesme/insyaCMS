<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_defaultMenu($pro) {

    $returndate .="
        <div class='def_menu_all nav nav-pills nav-stacked'> <ul>";

    $returndate .= getmenus();
    $returndate .="  </ul>
         </div>";



    return $returndate;
}

function getmenus() {
    $r = "";

    global $lib;
    $data = $lib->db->get_data("sys_admin_pkg", "*", " 1=1 order by `order`");

    foreach ($data as $d) {
        $r .= " <li class='menu-parent'>"
                . "<i class=\"fa " . $d['icone'] . " fa-fw\"></i>"
                . "<a class='title' title='" . $d['tooltip'] . "'>" . $d['title'] . "</a>   <i class=\"fa fa-angle-left acr\"></i>";

        $r .= " <div class='submenu'> <ul>";


        $datamenu = $lib->db->get_data("sys_admin_menu", "*", "cat_id='" . $d['id'] . "' order by `order`");

        foreach ($datamenu as $m) {

            if ($m['title'] == "separator") {

                 $r .= "<li class='separator'></li>";
            } else {
                if (checkPermission($m['url']) == true) {
                    $r .= "<a href='?view=" . $m['url'] . "'  title='" . $m['tooltip'] . "'><li class=\"fa " . $m['icone'] . " fa-fw\"></li>" . $m['title'] . "</a>";
                }
            }
        }
        if ($d['function'] != "") {
            $r .= $d['function']();
        }

        $r .= "  </ul></div></li>";
    }








    return $r;
}

function getcompenentsData($viewurl) {

    return getIn($viewurl, "component");
}

function getPluginsData($viewurl) {

    return getIn($viewurl, "plugin");
}

//ins_type='' or ins_type='plugin' 
function getIn($viewurl, $type) {
    global $lib;
    $data = $lib->db->get_data($lib->DBTables->install_TABLE, "*", "  ins_type='$type' order by `order`");
    $returndata = "";
    foreach ($data as $d) {




        $idata = $lib->db->get_row("sys_admin_menu", "*", "  url='" . $d['ins_alias'] . "' order by `order`");
        if (!is_array($idata) && checkPermission($d['ins_alias']) == true) {



            $returndata.= "  <li><a href='?view=" . $d['ins_alias'] . "'>" . $d['ins_title'] . "</a></li>";
        }
    }


    return $returndata;
}

function checkPermission($alias) {
    global $lib;
    $pPermission = $lib->users->getAdminPermission();
    $data = $lib->db->get_row($lib->DBTables->install_TABLE, "*", "  ins_alias='$alias' order by `order`");
    return true; //$lib->util->chkInPermission($data['id'], $pPermission, "getCat");
}

function getMenusData($viewurl) {

    global $lib;


    $data = $lib->db->get_data("com_menus", "*", "");


    $parent = $lib->variables->url_parent;
    $parent_id = $lib->variables->url_parent_id;

    $returndata = "";
    foreach ($data as $d) {
//?view=menu_itmes&parent=com_menus&parent_id=2
        if ($d['men_title'] == "separator") {

            $returndata.= "<li class='separator'></li>";
        } else {
            $returndata.= "  <li class='menusItems'><a href='?view=menu_itmes&" . $parent . "=com_menus&" . $parent_id . "=" . $d['id'] . "'>
            
<i class=\"fa fa-minus\"></i> 

" . $d['men_title'] . "</a></li>";
        }
    }


    return $returndata;
}

?>
