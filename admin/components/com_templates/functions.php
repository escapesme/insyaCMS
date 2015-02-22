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

    $dir = "../" . $lib->foldersMap->fornt_templates_folder;

    $foldert = $lib->util->readFilesNames($dir, "dir");




    $returndata = "<div class='block-border'> <div class='block-content'><ul class='shortcut-list'>";
    foreach ($foldert as $d) {
        $fulldir = $dir . "/" . $d;
        
       
        $file=  $lib->util->is_thatimage($fulldir . "/" . $d . ".png") ;
        
        
        $returndata.="<li><a href='" . $lib->util->getmyurl("admin", "steps") . "steps=step2&com=" . $d . "' ><img src='".$file."'/>" . $d . "</a></li>";
    }
    
       $returndata.="</ul></div></div>";
    
    
    return $returndata;
}

function getmenues() {

    
     $returndata ="<div class='menus_p block-border'>
                <div class=\"block-header\"><h1>Menus</h1><span></span></div>
<div class='allmenus block-content'>";
    

    $returndata_p = "<div class='allmenus_p'> ";
    $returndata_ch = "<div class='allmenus_ch'> ";
    


    global $lib;
    $mdata = $lib->db->get_data("com_menus", "", "enabled=1");


    foreach ($mdata as $m) {





        $mitems = $lib->db->get_data("menu_itmes", "", "  parent_id=" . $m['id']);


        if (isset($_GET[$lib->variables->url_id])) {


            $meus = $lib->db->get_data("menu_xref_tem", "mxt_menu_id", "mxt_tem_id=" . $_GET[$lib->variables->url_id]);

            $mynum = 0;

            foreach ($meus as $ms) {

                $mymenus[$mynum] = $ms['mxt_menu_id'];
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
    $returndata_ch .= "</div>";



    $returndata.=$returndata_p . $returndata_ch . "</div></div>";

    return $returndata;
}

function update_menu($modnum, $mode) {
    global $lib;
    $mnus = $_POST['menus'];
    if (isset($mnus) && is_array($mnus)) {
        if ($mode == "edit") {
            $lib->db->delete_data('menu_xref_tem', "mxt_tem_id=" . $modnum);
        }
        foreach ($mnus as $m) {
            $arrdata = array(
                "mxt_menu_id" => $m,
                "mxt_tem_id" => $modnum
            );

            $lib->db->insert_row('menu_xref_tem', $arrdata);
        }
    }
}

?>
