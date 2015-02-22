<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_News_Data($pro ,$l) {
    global $lib;

    $thisTable = "com_content_article";
    $thiscatgoriesTable = "com_content_catgories";
  $datacat = $lib->db->get_row($thiscatgoriesTable, "*", "`id`='" . $pro['cat_id'] . "'");
    $url = $lib->util->createURL($thisTable, $datacat['alias']);
  
    $data.="<div class='more top'><a href='" . $url . "'>>> " . $l['moretop'] . " " . $datacat['title'] . " </a></div>";
    if ($pro['view'] == "categories") {


        $data = mod_categories_getLast($pro, $thisTable, $thiscatgoriesTable);
    } else {
        if ($pro['Datatype'] == "latest") {

            $data = mod_news_getLast($pro, $thisTable, $thiscatgoriesTable);
        } else if ($pro['Datatype'] == "mostview") {

            $data = mod_news_hints($pro, $thisTable, $thiscatgoriesTable);
        }if ($pro['Datatype'] == "tags") {
            $data = mod_new_tags($pro, $thisTable, $thiscatgoriesTable);
        }
    }

    $data.="<div class='more'><a href='" . $url . "'>>> " . $l['more'] . "  </a></div>";
    return $data;
}

?>
