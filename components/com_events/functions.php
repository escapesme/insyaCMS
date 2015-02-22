<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function _viewItem($pro, $lang, $d, $catData, $table) {

    global $lib;
    $returnData = "";

    $returnData.="<div class = 'event_title title'>" . $d['title'] . "</div>";



    $imagePath = " /uploads/images/" . $d['th_image'];
    $returnData.= "

    <div class = 'itemBlock_imgae_cont'>
    <img title = \"" . $d['title'] . "\"  alt=\"" . $d['alias'] . "\"  class=' itemBlock_imgae' src='" . $imagePath . "' />
    </div>";


    $returnData.="<div class='event_date'>" . $d['date'] . "  " . $d['time'] . "</div>";

    $returnData.="<div class='event_tabeldate'>" . $lib->forms->getTabelStrign("db", $table, $d['id'], "users") . "</div>";


    $returnData.="<div class='event_des'>" . $d['des'] . "</div>";


    return $returnData;
}

function _viewItemBlock($pro, $lang, $tbale, $d, $catData) {

    global $lib;
    $returnData = "";
    $url = $lib->util->createURL($tbale, $catData['alias'], $d['alias']);

    $returnData.= "<div id='_" . $d['id'] . "' class='itemBlock'>";

    if (isset($pro['ViewTitle']) && $pro['ViewTitle'] == "1") {


        $returnData.="<div class = 'itemBlock_title title'><a title = '" . $d['title'] . "' href = '" . $url . "'>" . $d['title'] . "</a></div>";
    }




    if (isset($pro['ViewImage']) && $pro['ViewImage'] == "1") {

        $imagePath = " /uploads/images/" . $d['th_image'];


        $returnData.= "

    <div class = 'itemBlock_imgae_cont'>
    <img title = \"" . $d['title'] . "\"  alt=\"" . $d['alias'] . "\"  class=' itemBlock_imgae' src='" . $imagePath . "' />
    <div class='light img'></div></div>";
    }


    if (isset($pro['ViewDes']) && $pro['ViewDes'] == "1") {

        $returnData.="<div class='itemBlock_des'>" . $d['des'] . "</div>";
    }
    $returnData .= $lib->plugins->importPlugin("plg_share", "3");

    $returnData.= " </div>";






    return $returnData;
}


function _getitems($pro, $lang, $catTable, $table, $catID, $rowFrom, $rowNumbers) {

    global $lib;
    $returnData = "";

    $more = "order by `order` DESC  limit " . $rowFrom . "," . $rowNumbers;

    $datasql = $lib->util->getXrefData($table, $catID, $more);
    $llnum = $lib->util->getXrefData($table, $catID);

    $data = "<div  class='dataContenerAll'>";
    foreach ($datasql as $d) {
        $catData = $lib->util->data->getCategoryData($catTable, $d['cat_id']);

        $data.=_viewItemBlock($pro, $lang, $table, $d, $catData);
    }
    $data.="</div>";

    $data .=$lib->util->getPageNumber($rowNumbers, count($llnum));

    return $data;


    return $returnData;
}

function _getiteme($pro, $lang, $catTable, $table, $itemID) {


    global $lib;
    $d = $lib->db->get_row($table, '', 'alias=\'' . $itemID . "'");
    $catData = $lib->util->data->getCategoryData($catTable, $d['cat_id']);
    $returnData = "";
    $returnData .= "<div  class='itemdata'>";
    $returnData.=_viewItem($pro, $lang, $d, $catData, $table);
    $returnData.="</div>";

    return $returnData;
}

?>
