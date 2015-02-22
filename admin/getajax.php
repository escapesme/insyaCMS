<?php

$myurl = "../";
ini_set("display_errors", $lib->config->options['viewErorreadmin']);
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_COMPILE_ERROR);
require_once($myurl . "lib/libs.php");
error_reporting(E_ALL);
$_SESSION[url] = $_GET;
require_once ("ajax/" . $_GET['file'] . ".php");
$_SESSION[url] = "";



