<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();
/* @var $lib  libs\libs */
global $lib;



$importfile = true;
if ($_GET['importFile'] == "false") {
    $importfile = false;
}
echo $lib->front->getmain($importfile);
?>
