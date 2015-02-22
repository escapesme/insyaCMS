<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);
require_once("lib/libs.php");
/* @var $lib  libs\libs */
global $lib;

$status = $_POST['status'];
$htmlstatus = $_POST['htmlstatus'];
$htmlclear = $_POST['htmlclear'];
$htmlfull = $_POST['htmlfull'];
if ($htmlstatus == "full") {
    $html = $htmlfull;
} else {
    $html = $htmlclear;
}
$fileName = "export";


require_once "lib/includes/dompdf/dompdf_config.inc.php";


switch ($status) {

    case("csv"):

        $lib->util->export->csv($html, $fileName);
        break;
    case("pdf"):


        //$old_limit = ini_set("memory_limit", "20M");

        $dompdf = new DOMPDF();


        $dompdf->load_html($html . $html);
        $dompdf->set_paper("a4", "portrait");
        $dompdf->render();
        $dompdf->stream($fileName . ".pdf");

        break;
}
?>
