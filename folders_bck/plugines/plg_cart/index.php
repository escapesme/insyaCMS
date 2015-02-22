





<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//&?phone=11111
global $caetSettings;
global $myfromName;



function plg_cart($data, $lang, $o) {
    /* @var $lib  libs\libs */
    global $lib;
    global $caetSettings;
       global $myfromName;
    $caetSettings = $lib->db->get_row("plg_cart", "*", "id='" . $o['cart'] . "'");



    $formdata = $lib->db->get_row("com_form", "", "id=" . $caetSettings['form']);

    $myfromName = $formdata['title'];



    if ($o["id"] == "showcart") {
        $lib->util->page->updateTitle($lang['title'], $lang['title'], "title-web");
        echo "<style>.page-title .data{"
        . 'background:url("/templates/style/css/images/header_right.png") no-repeat right center, url("/templates/style/css/images/header_left.png") no-repeat left center !important ;'
        . "}</style>";
if ($_GET['do'] == "save") {
    $lang['saveDataMsg']=$lang['saveDataMsgAndMobileConfirmed'];
            $returnData =  cstep_save($s, $lang, $o, $data);
        }else if ($_GET['do'] == "act3") {
            $returnData = getCanfirmMobile($lang, $o, $s, "3");
        } else if ($_GET['do'] == "act2") {
            $returnData = getCanfirmMobile($lang, $o, $s, "2");
        } else {
            $s = $lib->db->get_row("plg_cart", "*", "id='" . $o['cart'] . "'");
            $returnData = plg_cart_showCart($s, $lang, $o, $data);
        }
    } else {
        $s = $lib->db->get_row("plg_cart", "*", "id='" . $data['cart'] . "'");
        $returnData = plg_cart_addTocart($s, $lang, $o);
    }

    return $returnData;
}
