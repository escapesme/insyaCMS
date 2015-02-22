<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMVfffffffD
 * 
 */
session_start();
?>

<link type = "text/css" href = "/includes/js/jqueryUi/css/smoothness/jquery-ui-1.8.17.custom.css" rel = "stylesheet" />
<link rel="stylesheet" media="screen" type="text/css" href="/includes/js/colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/includes/js/upload/fileuploader.css"/>
<link type = "text/css" href = "/includes/js/jqueryv/style.css" rel = "stylesheet" />
<script type = "text/javascript" src = "/includes/js/jquery.js"></script>
<script type = "text/javascript" src = "/includes/js/jquery.timer.js"></script>
<script language="javascript" src="http://baijs.nl/tinyscrollbar/js/jquery.tinyscrollbar.min.js"></script>
<script type="text/javascript" src="/includes/js/jscripts/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript" src="/includes/js/jqueryUi/jqueryui.js"></script>
<script type="text/javascript" src="/includes/js/colorpicker/js/colorpicker.js"></script>
<script type="text/javascript" src="/includes/js/jqueryv/languages/jquery.validationEngine-en.js"></script>
<script type="text/javascript" src="/includes/js/jqueryv/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/includes/js/upload/fileuploader.js"></script>

<script type="text/javascript" src="/lib/js/forms_fornt.js"></script>
<script type="text/javascript" src="/lib/js/util.js"></script>
<script>
    function sendAjax(file,vars,to){
        
        var slink= "getajax.php?file="+file+"&"+vars;
          
          
        
        var request = $.ajax({
            url: slink,
            success: function(data) {
     
                $(to).html(data);
   
            }});
        return request
        

    }
        
    function updateModule(postion,place,alias){
        return   sendAjax("eng/get_module","postion="+postion+"&alias="+alias,place);
    }

</script>



<?
$myurl = "";
ini_set("display_errors", 0);
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_COMPILE_ERROR);
require_once("lib/libs.php");
$lib->front->updatedata();

function getmain() {
    global $lib;
    return $lib->front->getmain();
}

function page_title() {
    global $lib;
    return $lib->front->menuData['mei_title'];
}

function templatelink() {
    global $lib;
    return $lib->front->templatelink;
}

$template_url = templatelink();
?>

<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <title> <?= page_title() ?></title>

        <?php if (!isset($_GET["css"]) && $_GET["css"] != "clear") {
            ?>         

            <meta http-equiv="content-type" content="text/html; charset=utf-8" />
            <link rel="SHORTCUT ICON" href="/<?= $template_url . "/favicon.ico" ?>"/>

            <link rel="stylesheet" href="/<?= $template_url ?>/css/nivo/themes/default/default.css" type="text/css" media="screen" />
            <link rel="stylesheet" href="/<?= $template_url ?>/css/nivo/themes/light/light.css" type="text/css" media="screen" />
            <link rel="stylesheet" href="/<?= $template_url ?>/css/nivo/themes/dark/dark.css" type="text/css" media="screen" />
            <link rel="stylesheet" href="/<?= $template_url ?>/css/nivo/themes/bar/bar.css" type="text/css" media="screen" />
            <link rel="stylesheet" href="/<?= $template_url ?>/css/nivo/nivo-slider.css" type="text/css" media="screen" />

            <link rel="stylesheet" href="/<?= $template_url ?>/css/gen.css" type="text/css" />
            <link rel="stylesheet" href="/<?= $template_url ?>/css/style.css" type="text/css" />
            <link rel="stylesheet" href="/<?= $template_url ?>/css/styleNew.css" type="text/css" />







        <!--[if IE]><link rel="stylesheet" type="text/css" href="/<?= $template_url . "css/ie.css" ?>" /><![endif]-->
        <!--[if IE 8]><link rel="stylesheet" type="text/css" href="/<?= $template_url . "css/ie8.css" ?>" /><![endif]-->
        <!--[if IE 9]><link rel="stylesheet" type="text/css" href="/<?= $template_url . "css/ie9.css" ?>" /><![endif]-->

            <script language="javascript" type="text/javascript" src="/<?= $template_url ?>/js/jquery.isotope.min.js"></script>
            <script language="javascript" type="text/javascript" src="/<?= $template_url ?>/js/jquery.nivo.slider.js"></script>


            <script language="javascript" type="text/javascript" src="/<?= $template_url ?>/js/my.js"></script>

        <?php } ?>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <?= getmain() ?>
    </body>
</html>
