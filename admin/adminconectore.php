<?php
session_start();
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */
//ini_set('display_errors', 1);
//error_reporting(E_ERROR | E_WARNING | E_PARSE);


$myurl = "../";
?>






<script type = "text/javascript" src = "<?= $myurl ?>includes/js/jquery.js"></script>

<script type="text/javascript" src="<?= $myurl ?>includes/js/jscripts/tiny_mce/jquery.tinymce.min.js"></script>
<link type = "text/css" href =" //code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel = "stylesheet" />

<script type="text/javascript" src="/includes/js/jquery.lazyload.js"></script>

<link rel="stylesheet" media="screen" type="text/css" href="<?= $myurl ?>includes/js/colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css" media="screen" href="<?= $myurl ?>includes/js/upload/fileuploader.css"/>
<link type = "text/css" href = "<?= $myurl ?>includes/js/jqueryv/style.css" rel = "stylesheet" />
<script type="text/javascript" src="<?= $myurl ?>includes/js/jqueryUi/jqueryui.js"></script>
<script type="text/javascript" src="<?= $myurl ?>includes/js/colorpicker/js/colorpicker.js"></script>

<script type="text/javascript" src="<?= $myurl ?>includes/js/jqueryv/languages/jquery.validationEngine-en.js"></script>
<script type="text/javascript" src="<?= $myurl ?>includes/js/jqueryv/jquery.validationEngine.js"></script>





<link rel="stylesheet" href="/includes/js/lightbox/s3/colorbox.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<script src="/includes/js/lightbox/jquery.colorbox.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript" src="<?= $myurl ?>includes/js/upload/fileuploader.js"></script>

<script type="text/javascript" src="<?= $myurl ?>lib/js/util.js"></script>
<script type="text/javascript" src="<?= $myurl ?>lib/js/forms_fornt.js"></script>
<script type="text/javascript" src="<?= $myurl ?>lib/js/dataBuilder.js"></script>
<script src="<?= $myurl ?>lib/js/admin.js"   ></script>


<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="<?= $myurl ?>includes/js/gmap3.min.js"></script>


<?php
ini_set("display_errors", 0);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);
require_once($myurl . "lib/libs.php");


$lib->db->connect();

function this_Menu($data) {
    return $lib->adminEng->getMenu($data);
}

function creat_module($postion) {
    global $lib;
    $data = $lib->adminEng->getmodule($postion);


    // $data='hhh';

    return $data;
}

function creat_main() {
    global $lib;
    return $lib->adminEng->getMain();
}

function getTitle() {

    global $lib;
    return $lib->adminEng->getTitle();
}
?>









