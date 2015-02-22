<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_Gallery_Video_Ticker($pro, $l) {
    global $lib;

    $thisTable = "com_video_gallery";
    $thiscatgoriesTable = "com_video_gallery_categories";
    $datacat = $lib->db->get_row($thiscatgoriesTable, "*", "`id`='" . $pro['cat_id'] . "'");
    $url = $lib->util->createURL($thisTable, $datacat['alias']);


    //$data = '<marquee behavior="scroll"  height="20"  width="550" direction="left" scrollamount="6">';
    $data .="<script>$(function(){ $('.webticker').webTicker({
    speed: 50, //pixels per second
    direction: \"left\", //if to move left or right
    moving: true, //weather to start the ticker in a moving or static position
    startEmpty: true, //weather to start with an empty or pre-filled ticker
    duplicate: false, //if there is less items then visible on the ticker you can duplicate the items to make it continuous
    rssurl: false, //only set if you want to get data from rss
    rssfrequency: 0, //the frequency of updates in minutes. 0 means do not refresh
    updatetype: \"reset\" //how the update would occur options are \"reset\" or \"swap\"
});  })</script>
         <ul class='webticker'> ";
    if ($pro['view'] == "categories") {

        $data = mod_gallery_video_Ticker_categories_getLast($pro, $thisTable, $thiscatgoriesTable);
    } else {
        if ($pro['Datatype'] == "latest") {

            $data.= mod_gallery_video_Ticker_getLast($pro, $thisTable, $thiscatgoriesTable);
        } else if ($pro['Datatype'] == "mostview") {

            $data.= "<div class='mostview'>" . mod_gallery_video_Data_hints($pro, $thisTable, $thiscatgoriesTable) . "</div>";
            ;
        }if ($pro['Datatype'] == "tags") {
            $data.= mod_gallery_video_Ticker_tags($pro, $thisTable, $thiscatgoriesTable);
        }
    }
    $data .="</ul> ";
    // $data .="</marquee> ";
    return $data;
}

?>
