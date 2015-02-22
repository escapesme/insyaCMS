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
    global $lib;
    if ($pro['nums'] != null) {
        $rowNumbers = $pro['nums'];
    }


    if (isset($_GET['page'])) {
        $rowFrom = $_GET['page'];
    } else {
        $rowFrom = "0";
    }

    if (isset($_GET['id']) && $_GET['id'] != null) {
        $cat_id = $lib->util->returnID("com_content_catgories", $_GET['id']);
        $id = $lib->util->returnID("com_content_article", $_GET['id']);
    } else if (isset($pro['cat_id']) && $pro['cat_id'] != "") {

        $cat_id = $pro['cat_id'];
    } else {

        $cat_id = "0";
    }

    $catTable = "com_content_catgories";
    $table = "com_content_article";





    $where = "";
    if (isset($_GET['show']) and $_GET['show'] == 'item') {


        if (isset($_GET['catid']) and $_GET['catid'] == 'author') {

            $data .="<div class='fliter'>" . $lang['author'] . "</div>";
            $data .="<div class='fliterData'>" . $_GET['id'] . "</div>";
            $lib->util->updateTitle($_GET['id'], $_GET['id'], "title-web");
            $where = "`author`='" . $_GET['id'] . "'";

            $data .= getartsBywhere($where, $rowFrom, $rowNumbers, $lang, $pro);
        } else if (isset($_GET['catid']) and $_GET['catid'] == 'date') {



            $where = "`date`='" . $_GET['id'] . "'";
            $date = new DateTime($_GET['id']);

            $lib->util->updateTitle($_GET['id'], $_GET['id'], "title-web");
            $data .="<div class='fliter'>" . $lang['date'] . "</div>";
            $data .="<div class='fliterData'>" . $date->format(' l jS F Y') . "</div>";
            $data .= getartsBywhere($where, $rowFrom, $rowNumbers, $lang, $pro);
        } else if (isset($_GET['catid']) and $_GET['catid'] == 'tag') {


            $where = "`tags` like'%" . $_GET['id'] . "%'";
            $data .="<div class='fliter'>" . $lang['tag'] . "</div>";
            $data .="<div class='fliterData'>" . $_GET['id'] . "</div>";

            $lib->util->updateTitle($_GET['id'], $_GET['id'], "title-web");


            $data .= getartsBywhere($where, $rowFrom, $rowNumbers, $lang, $pro);
        } else {



            $lib->util->updateTitleitem($table, $id);
            $data .= "<div class='fullart'>" . viewItem($id, $pro, $lang) . "</div>";
        }
    } else if (isset($_GET['show']) and $_GET['show'] == 'cat') {

        if (isset($_GET['id']) &&
                ( $_GET['id'] == 'user' ||
                $_GET['id'] == 'tag' ||
                $_GET['id'] == 'date'
                )) {
            $data .= getTypeData($_GET['id']);
        } else {


            $data .="<div class='fliter'>" . $lang['cat'] . "</div>";
            $data .="<div class='fliterData'>" . $_GET['id'] . "</div>";

            $lib->util->updateTitleCategory($catTable, $cat_id);
            $data .= getartsByCatID($cat_id, $rowFrom, $rowNumbers, $lang, $pro);
        }
    } else {


        if ($cat_id != "") {


            $data .= $returnData .= $lib->util->com->_getCats($pro, $lang, $catTable, $table, $cat_id);

            $lib->util->updateTitleCategory($catTable, $cat_id);
            $data .= getartsByCatID($cat_id, $rowFrom, $rowNumbers, $lang, $pro);
        }
    }

    return $data;
}

?>
