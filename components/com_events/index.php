<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro, $lang) {
    $rowNumbers = "6";

    if ($pro['nums'] != null) {
        $rowNumbers = $pro['nums'];
    };



    $catID = "0";
    $itemID = "0";
    $table = "com_events";
    $catTable = "com_events_categories";



    global $lib;


    $data = "<div class='mycom  event_com'>";

    if (isset($_GET['page'])) {
        $rowFrom = $_GET['page'];
    } else {
        $rowFrom = "0";
    }

    if ((isset($_GET['show']) and $_GET['show'] == 'item')) {

        $itemID = $_GET['id'];
        $data.= _getiteme($pro, $lang, $catTable, $table, $itemID);
    } else if (isset($_GET['show']) and $_GET['show'] == 'cat') {

        $catID = $_GET['id'];
        $data.= $lib->util->com->_getCats($pro, $lang, $catTable, $table, $catID);
        $data.= _getitems($pro, $lang, $catTable, $table, $catID, $rowFrom, $rowNumbers);
    } else if ((isset($pro['viewType']) and $pro['viewType'] == 'item')) {

        $itemID = $pro['id'];
        $data.= _getiteme($pro, $lang, $itemID);
    } else if (isset($pro['viewType']) and $pro['viewType'] == 'cat') {

        $catID = $pro['cat_id'];
        $data.= $lib->util->com->_getCats($pro, $lang, $catTable, $table, $catID);
        $data.= _getitems($pro, $lang, $catTable, $table, $catID, $rowFrom, $rowNumbers);
    }

    $data .= "</div>";
    return $data;
}
?>


