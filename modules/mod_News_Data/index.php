<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_News_Data($pro, $l) {
    global $lib;
    print_R($pro);


ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);
    $thisTable = "com_content_article";
    $thiscatgoriesTable = "com_content_catgories";
    $datacat = $lib->db->get_row($thiscatgoriesTable, "*", "`id`='" . $pro['cat_id'] . "'");
    $url = $lib->util->createURL($thisTable, $datacat['alias']);

    
    
    
    $data.="<div class='more top'><a href='" . $url . "'>>> " . $l['moretop'] . " " . $datacat['title'] . " </a></div>";
    if ($pro['view'] == "categories") {

        

        $data = mod_categories_getLast($pro, $thisTable, $thiscatgoriesTable, $l);
    } else {
        if ($pro['Datatype'] == "latest") {

            $data = mod_news_getLast($pro, $thisTable, $thiscatgoriesTable, $l);
        } else if ($pro['Datatype'] == "mostview") {

            $data = mod_news_hints($pro, $thisTable, $thiscatgoriesTable, $l);
        }if ($pro['Datatype'] == "tags") {
            $data = mod_new_tags($pro, $thisTable, $thiscatgoriesTable, $l);
        }
    }

    $data.="<div class='more'><a href='" . $url . "'>>> " . $l['more'] . "  </a></div>";
    return $data;
}

?>
