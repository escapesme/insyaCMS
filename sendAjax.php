
<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */ ini_set("display_errors", 0);

require_once("lib/libs.php");

error_reporting(E_ALL);
if ($_GET['wstyle']) {
    echo '<link rel="stylesheet" href="/templates/style/css/style.css" type="text/css"/>
';
}

$_SESSION[url] = $_GET;

require_once ($_GET['file'] . ".php");

$_SESSION[url] = "";
?>
