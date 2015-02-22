<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_gallery_video_Data($pro, $l) {
    global $lib;

    $thisTable = "com_video_gallery";
    $thiscatgoriesTable = "com_video_gallery_categories";
    $datacat = $lib->db->get_row($thiscatgoriesTable, "*", "`id`='" . $pro['cat_id'] . "'");
    $url = $lib->util->createURL($thisTable, $datacat['alias']);


    $data.="<div class='more top'><a href='" . $url . "'>>> " . $l['moretop'] . " " . $datacat['title'] . " </a></div>";


    if ($pro['view'] == "categories") {





        $data = mod_gallery_video_Data_categories_getLast($pro, $thisTable, $thiscatgoriesTable);
    } else {
        if ($pro['Datatype'] == "latest") {

            $data.= mod_gallery_video_Data_getLast($pro, $thisTable, $thiscatgoriesTable);
        } else if ($pro['Datatype'] == "mostview") {

            $data.= "<div class='mostview'>".mod_gallery_video_Data_hints($pro, $thisTable, $thiscatgoriesTable)."</div>";;
        }if ($pro['Datatype'] == "tags") {
            $data.= mod_gallery_video_Data_tags($pro, $thisTable, $thiscatgoriesTable);
        }
    }


    $data.="<div class='more'><a href='" . $url . "'>>> " . $l['more'] . "  </a></div>";
    
    
    return $data;
}

?>
