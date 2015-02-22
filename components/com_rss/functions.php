<?php

function getcatData($cattable, $table, $catid, $pro) {
    global $lib;
   // $splitData.=">";

    $catData = $lib->db->get_data($cattable, "*", "cat_id='" . $catid . "' order by `order`");

    foreach ($catData as $c) {
        $url = '/rss.php?com=' . $table . '&catid=' . $c['id'] . "&nums=" . $pro['nums'];
        $retusdata .="<div class='itemBlock rss'>";

        if (isset($pro['ViewTitle']) && $pro['ViewTitle'] == "1") {
            $retusdata .= "<a class='itemBlock_title cat_title' href='" . $url . "'>" . $splitData . $c['title'] . "</a><br/>";
        }
        if (isset($pro['catViewImage']) && $pro['catViewImage'] == "1") {

            $imagePath = "/uploads/images/" . $c['image'];
            $retusdata .= "<a class='cat_image' href='" . $url . "'><div class='mod_image'><img  class='lazy mod_image' src='" . $imagePath . "' /></div></a><br/>";
        }
        if (isset($pro['ViewDes']) && $pro['ViewDes'] == "1") {
            $retusdata .= "<a class='cat_des' href='" . $url . "'>" . $c['dec'] . "</a><br/>";
        }


        if (isset($c['id']) && $c['id'] != "") {
            $retusdata .= getcatData($cattable, $table, $c['id']);
        }
        $retusdata .="</div>";
    }
    return $retusdata;
}

function getTabel($type) {

    $return = "";
    switch ($type) {
        case "videos":
            $return = "com_video_gallery";
            break;
        case "images":
            $return = "com_images_gallery";
            break;
        case "news":
            $return = "com_content_article";
            break;
        case "products":
            $return = "com_products";
            break;
    }
    return $return;
}

function getCatTabel($type) {
    $return = "";
    switch ($type) {
        case "videos":
            $return = "com_video_gallery_categories";
            break;
        case "images":
            $return = "com_images_gallery_categories";
            break;
        case "news":
            $return = "com_products_categories";
            break;
        case "products":
            $return = "com_products";
            break;
    }



    return $return;
}
?>



