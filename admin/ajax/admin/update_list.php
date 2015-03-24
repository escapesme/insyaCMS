<?php

session_start();

/* @var $lib  libs\libs */
global $lib;
//"listBody"


//print_r($_GET);





ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);
$lib->admin->tabheader = FALSE;


$mode = "list";


if (isset($_GET['mode'])) {

    $mode = $_GET['mode'];
}


echo $lib->adminEng->getComponentMain("", "", $mode, "");
