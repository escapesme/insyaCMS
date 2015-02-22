<?php

function mod_play_video($pro, $l) {

    $image = "uploads/images/" . $pro['myimage'];

    $width = "540";
    if (isset($pro['videowidth']) && $pro['videowidth'] != null && $pro['videowidth'] != "0") {


        $width = $pro['videowidth'];
    }
    $height = "315";
    if (isset($pro['videoheight']) && $pro['videoheight'] != null && $pro['videoheight'] != "0") {


        $height = $pro['videoheight'];
    }


    $thisTable = "com_video_gallery";

    global $lib;


    $data = $lib->db->get_row($thisTable, "*", "  id='" . $pro['vid_id'] . "'");

    $url = $data['url'];




    $reData.="<div class='video'>" . $lib->util->youtubePlay($url, $width, $height) . "</div>";
    if (isset($pro['viewdatatitle']) && $pro['viewdatatitle'] == "1") {
        $url = $lib->util->createURL($thisTable, $data['alias']);


        $reData.="<div class='title'><a href='" . $url . "'>" .$lib->util->limit_text($data['title'], $pro['maxTitle']) . "</a></div>";
    }
    if (isset($pro['viewdes']) && $pro['viewdes'] == "1") {
        $reData.="<div class='des'>" . $data['des'] . "</div>";
    }

    return $reData;
}

?>