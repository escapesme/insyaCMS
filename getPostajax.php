<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

require_once("lib/libs.php");




ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);
/* @var $lib  libs\libs */
global $lib;
$lib->front->updatedata();

$_SESSION[url] = $_POST;
//print_r($_POST);
include ("ajax/" . $_POST['file'] . ".php");

$_SESSION[url] = "";
?>
