<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function modcb_getparent($catTabel, $alias) {
    global $lib;
    $returnData = "";
    $data = $lib->db->get_row($catTabel, "*", "`alias`='" . $alias . "'");




    if (isset($data['id']) && trim($data['id']) != "") {

        if ($data['cat_id'] != "0") {
            $dataCat = $lib->db->get_row($catTabel, "*", "`id`='" . $data['cat_id'] . "'");
            $returnData .= modcb_getparent($catTabel, $dataCat['alias']);
        }

        $urlTag = $lib->util->createURLW($_GET['alias'], $alias);

        if ($catTabel == "com_products_categories") {

            $title = $data['name'];
        } else {

            $title = $data['title'];
        }


        $returnData.="<div class='item'> > <a href='" . $urlTag . "'>" . $title . "</a></div>";
    }
    return $returnData;
}

function mod_Bread_Crumb_getUrl($palias) {






    global $lib;
    $mythcom = $lib->util->getMenuMain($palias);


    $myCatTabel = "";

    if (trim($mythcom) == "com_video_gallery") {

        $myCatTabel = "com_video_gallery_categories";
    } else if (trim($mythcom) == "com_images_gallery") {

        $myCatTabel = "com_images_gallery_categories";
    } else if (trim($mythcom) == "com_content_article") {


        $myCatTabel = "com_content_catgories";
    } else if (trim($mythcom) == "com_products") {

        $myCatTabel = "com_products_categories";
    }






    $urlTag = $lib->util->createURLW($palias);
    $url = "<div class='item'><a href='" . $urlTag . "'> > " . $lib->util->getMenuTite($palias) . "</a></div>";


    if ($myCatTabel != "") {




        if (isset($_GET['id']) && isset($_GET['catid'])) {

            $url .= modcb_getparent($myCatTabel, $_GET['catid']);


            $itemdata = $lib->db->get_row($mythcom, "*", "`alias`='" . $_GET['id'] . "'");
            $url.="<div class='item'> > " . $itemdata['title'] . "</div>";
        } else if (isset($_GET['id']) && !isset($_GET['catid'])) {

            $url .= modcb_getparent($myCatTabel, $_GET['id']);
        }
    } else {






        if (isset($_GET['catid'])) {


            $urlTag = $lib->util->createURLW($_GET['catid']);
            $url.="<div class='item'> > <a href='" . $urlTag . "'>" . $lib->util->getMenuTite($_GET['catid']) . "</a></div>";
        } else if (isset($_GET['id'])) {


            $urlTag = $lib->util->createURLW($_GET['id']);
            $url.="<div class='item'> > <a href='" . $urlTag . "'>" . $lib->util->getMenuTite($_GET['id']) . "</a></div>";
        }
    }

    return $url;
}

function mod_Bread_Crumb($pro, $lang) {
    global $lib;
    $url = "<div class='item'><a href='/'>" . $lang['home'] . "</a></div>";
//
    $url .= mod_Bread_Crumb_getUrl($_GET['alias']);

    return $url;
}
?>

