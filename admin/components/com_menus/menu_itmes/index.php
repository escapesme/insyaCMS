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
$lib->adminEng->proretiesType = "menu";

$mode = $_GET['mode'];
$setpes = $_GET['steps'];


if ($mode == "add" && $setpes != "step2") {
    echo getcommponent();
} else if ($mode == "add" && $setpes == "step2") {

    $lib->adminEng->proretiesdir = $_GET['com'];
    
    echo $lib->adminEng->getComponentMain("", "", "add");

    echo "<script>$(function(){ chDataCom('" . $lib->util->getmyurl("admin", "steps") . "steps=step1" . "') })</script>";
    
    
} else {


    if ($mode == "edit" && $setpes == "step1") {


        echo getcommponent();
    } else if ($mode == "edit") {



        $d = $lib->db->get_row('menu_itmes', "", "id=" . $_GET[$lib->variables->url_id]);

        
        
        //   print_r($d['mei_main']); //mei_main
        $comtitle = $d['mei_main'];

        if (isset($_GET["com"])) {

            $d['mei_main'] = $_GET["com"];
            $lib->adminEng->changEditNames = 'mei_main;mei_main';
            $lib->adminEng->changEditValues = $_GET["com"] . ";" . $_GET["com"];

            $comtitle = $_GET["com"];
        }



        $comtitle = str_replace("com_", "", $comtitle);
        $comtitle = str_replace("mod_", "", $comtitle);
        $comtitle = str_replace("plg_", "", $comtitle);
        $comtitle = str_replace("_", " ", $comtitle);


        echo "<script>$(function(){ chDataComForEdit('" . $comtitle . "','" . $lib->util->getmyurl("admin", "steps") . "steps=step1" . "') })</script>";


        $lib->adminEng->proretiesdir = $d['mei_main'];
    }




    echo $lib->adminEng->getComponentMain();
}
?>
<script>
    $("#mei_title").change(function() {
        $("#mei_alias").val($.trim($(this).val()).replaceAll(" ", "-"));


    })




    function chCom(e) {

        window.location.assign(e);
    }


    function chDataCom(url) {



        $(".meiTitle").append("<input onclick=\"chCom('" + url + "')\" style='width:150px; margin-left:10px;' class='button' type='button' value='Change'>");

    }


    function chDataComForEdit(title, url) {


        $(".meiTitle").text(title);



        $(".meiTitle").append("<input onclick=\"chCom('" + url + "')\" style='width:150px; margin-left:10px;' class='button' type='button' value='Change'>");

    }

</script>