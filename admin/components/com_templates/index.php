<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */


global $lib;




$lib->adminEng->addproreties = "add";
$lib->adminEng->proretiesType = "template";
$lib->adminEng->table_name = "com_install";
$mode = $_GET[$lib->variables->url_mode];
$setpes = $_GET[$lib->variables->url_steps];




if ($mode == "add" && $setpes != "step2") {
    echo getmodules();
} else if ($mode == "add" && $setpes == "step2") {

    $lib->adminEng->proretiesdir = $_GET['com'];

    $lib->adminEng->addToForm = getmenues();
    echo $lib->adminEng->getComponentMain("", "", "add");

    $mymaxid = $lib->db->get_row('com_modules', "max(id) as mid");
    update_menu($mymaxid['mid'], "");
} else {

    if ($mode == "edit") {
        $d = $lib->db->get_row('com_install', '', 'id=' . $_GET[$lib->variables->url_id]);
        $lib->adminEng->proretiesdir = $d['ins_alias'];
        update_menu($_GET[$lib->variables->url_id], "edit");
    }

    $lib->adminEng->addToForm = getmenues();
    echo $lib->adminEng->getComponentMain("");
}
?>
<style>

</style>