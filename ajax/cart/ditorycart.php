<?php

session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$setting = $_GET['setting'];
$mtype = $_GET['mtype'];
$type = $_GET['type'];
/* @var $lib  \libs\libs */
global $lib;






$_SESSION[cart_productes][$type] = "";
clearCartFrom($type,$setting);



function clearCartFrom($type,$setting) {
    /* @var $lib  \libs\libs */
    global $lib;

    $caetSettings = $lib->db->get_row("plg_cart", "*", "id='" . $setting . "'");



    $formdata = $lib->db->get_row("com_form", "", "id=" . $caetSettings['form']);


    $_SESSION[$formdata['title']] = "";
}

?>
