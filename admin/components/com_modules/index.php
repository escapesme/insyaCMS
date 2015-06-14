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
$lib->adminEng->proretiesType = "module";

$mode = $_GET[$lib->variables->url_mode];
$setpes = $_GET[$lib->variables->url_steps];


if (isset($_POST['updatetable']) && $_POST['updatetable'] == "do_delete") {
    $mnus = explode(",", $mnus);

    foreach ($_POST['updateids'] as $m) {
        $lib->db->delete_data('menu_xref_mod', "mxm_mod_id=" . $m);
    }
}


if ($mode == "add" && $setpes != "step2") {


    echo getmodules();
} else if ($mode == "add" && $setpes == "step2") {

    $lib->adminEng->proretiesdir = $_GET['com'];

    $lib->adminEng->addToForm = getmenues();
    echo $lib->adminEng->getComponentMain("", "", "add");

    $mymaxid = $lib->db->get_row('com_modules', "max(id) as mid");



    update_menu($mymaxid['mid'], "");
    echo "<script>$(function(){ chDataCom('" . $lib->util->getmyurl("admin", "steps") . "steps=step1" . "') })</script>";
} else {
    if ($mode == "edit" & $setpes == "step1") {
        echo getmodules();
    } else if ($mode == "edit") {
        $mymaxid = $lib->db->get_row($lib->util->thisTable(), "", 'id=' . $_GET[$lib->variables->url_id]);
        $myxData = $mymaxid['type'];
        if (isset($_GET["com"])) {

            $myxData = $_GET["com"];
            $lib->adminEng->changEditNames = 'type';
            $lib->adminEng->changEditValues = $_GET["com"] . ";" . $_GET["com"];

            $comtitle = $_GET["com"];
        }

        $comtitle = $myxData;
        $comtitle = str_replace("com_", "", $comtitle);
        $comtitle = str_replace("mod_", "", $comtitle);
        $comtitle = str_replace("plg_", "", $comtitle);
        $comtitle = str_replace("_", " ", $comtitle);
        echo "<script>$(function(){ chDataComForEdit('" . $comtitle . "','" . $lib->util->getmyurl("admin", "steps") . "steps=step1" . "') })</script>";
        $lib->adminEng->proretiesdir = $myxData;

        update_menu($_GET[$lib->variables->url_id], "edit");
    }

    $lib->adminEng->addToForm = getmenues();
    echo $lib->adminEng->getComponentMain();
}
?>


<script>





    function chCom(e) {

        window.location.assign(e);
    }


    function chDataCom(url) {

        $(".modTitle").append("<input onclick=\"chCom('" + url + "')\" style='width:150px; margin-left:10px;' class='button' type='button' value='Change'>");

    }


    function chDataComForEdit(title, url) {

        $(".modTitle").text(title);

        $(".modTitle").append("<input onclick=\"chCom('" + url + "')\" style='width:150px; margin-left:10px;' class='button' type='button' value='Change'>");

    }

</script>
