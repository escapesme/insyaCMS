<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function getmodules() {
    global $lib;


    $dir = "../" . $lib->foldersMap->fornt_modules_folder;





    $foldert = $lib->util->readFilesNames($dir, "dir");




    //  $mdata = $lib->db->get_data("com_install", "", "ins_type='module' and `delete`=0");
    $returndata = "";

    $returndata = "<div class='block-border'> <div class='block-content'><ul class='shortcut-list'>";
    foreach ($foldert as $d) {

        $fulldir = $dir . "/" . $d;
        $file = $lib->util->is_thatimage($fulldir . "/" . $d . ".png");

        $dtitle = str_replace("mod_", "", $d);

        $dtitle = str_replace("_", " ", $dtitle);

        if (trim($dtitle) != "tmp") {



            $returndata.="<li><a  href='" . $lib->util->getmyurl("admin", "steps") . "steps=step2&com=" . $d . "' ><img src='" . $file . "'/>" . $dtitle . "</a></li>";
        }
    }
    $returndata.="</ul></div></div>";
    return $returndata;
}

function getmenues() {


    //Menus


    $returndata = "";
    // $returndata = "<div class='allmenus'>";
    $returndata_p = "<div class='allmenus_p'> ";
    $returndata_ch = "<div class='allmenus_ch'> ";
    /* @var $lib  libs\libs */
    global $lib;

    $mdata = $lib->db->get_data("com_menus", "");
    foreach ($mdata as $m) {
        $mitems = $lib->db->get_data("menu_itmes", "", "parent_id=" . $m['id'] . "   and `delete`=0");
        if (isset($_GET[$lib->variables->url_id])) {


            $meus = $lib->db->get_data("menu_xref_mod", "mxm_menu_id", "mxm_mod_id=" . $_GET[$lib->variables->url_id]);

            $mynum = 0;

            foreach ($meus as $ms) {

                $mymenus[$mynum] = $ms['mxm_menu_id'];
                $mynum++
                ;
            }
        }






        $returndata_p .= "<div class='meuns_p' id='" . $m['men_alias'] . "' > " . $m['men_title'] . "</div>";

        $returndata_ch .= "<div class='meuns_ch " . $m['men_alias'] . "__ch' >
            
<div class='select_all_div'>
<input type='checkbox' class=' select_allm ' id='" . $m['men_alias'] . "__selectall'       />" . $lib->variables->admin_select_all . "
     </div><select name='menus[]'  class='" . $m['men_alias'] . "__select'  multiple=\"multiple\">";
        foreach ($mitems as $mi) {


            $mordata = "";
            if (is_array($mymenus)) {

                $mty = array_search($mi['id'], $mymenus);

                if (is_numeric($mty) && $mty != -1) {

                    $mordata = "selected='selected'";
                }
            }
            $returndata_ch.="<option  " . $mordata . "   value='" . $mi['id'] . "' >" . $mi['mei_title'] . "</option>";
        }
        $returndata_ch.="</select> </div>";
    }
    $returndata_p .= "</div>";
    $returndata_ch .= "</div><div class='clearfix'></div>";



    $returndata = $lib->admin->crateBlockHtml("Menus", $returndata_p . $returndata_ch, $collapse, 'col-6');

    return $returndata;
}

function update_menu($modnum, $mode) {
    global $lib;
    $mnus = $_POST['menus'];

    if (isset($mnus)) {
        $lib->db->delete_data('menu_xref_mod', "mxm_mod_id=" . $modnum);
    }
    if (isset($mnus) && !is_array($mnus)) {
        $mnus = explode(",", $mnus);
    }



    foreach ($mnus as $m) {

        if (trim($m) != "" && trim($m) != "0") {


            $arrdata = array(
                "mxm_menu_id" => $m,
                "mxm_mod_id" => $modnum
            );


            $lib->db->insert_row('menu_xref_mod', $arrdata);
        }
    }
}

?>
