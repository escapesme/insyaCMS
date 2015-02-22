<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro, $lang) {

    global $lib;

    $rowNumbers = $pro['rowNumbers'];
    if (isset($_GET['page'])) {
        $rowFrom = $_GET['page'];
    } else {
        $rowFrom = "0";
    }


    //$data = '<div class=\'com_video_gallery\'><script type="text/javascript" src="/' . $lib->foldersMap->fornt_includes_folder . '/jwplayer/jwplayer.js"></script>';




    if (isset($_GET['show']) && $_GET['show'] == "item") {

          if (isset($_GET['catid']) && $_GET['catid'] == "source") {
              
              
          
                 
                     $data .=    getsourceData($_GET['id'], $rowFrom, $rowNumbers, $pro);
              
              
          }else   if (isset($_GET['catid']) && $_GET['catid'] == "tag") {

            $data .="<div class='fliter'>" . $lang['tag'] . "</div>";
            $data .="<div class='fliterData'>" . $_GET['id'] . "</div>";
            $data .= getimagestag($_GET['id'], $rowFrom, $rowNumbers, $pro);
        } else {



            $id = $lib->util->returnID("com_video_gallery", $_GET['id']);

            $data .= "<div class='videoData'>" . vediogGetfile($id, $pro) . "</div>";



            $rowNumbers = 8;
            $datasql = $lib->db->get_Row("com_video_gallery", "*", " `id`='" . $id . "' ");



            $catdata = $lib->util->data->getCategoryData('com_video_gallery_categories', $datasql['cat_id']);


            $data .="<div class='seemore'><div class='seemoreTitle'>" . $lang['seemore'] . "</div>" . getItems($datasql['cat_id'], $rowFrom, $rowNumbers, $pro, $id) . "</div>";

            $data .= "<div class='commentData'>" . $lib->plugins->importPlugin("plg_comments", "com_video_gallery;" . $id . "") . "</div>";


            $lib->util->page->updateTitle($datasql['title'], $catdata['title'], "title-web");
        }
    } else if (isset($_GET['show']) && $_GET['show'] == "cat") {



        if (isset($_GET['id']) && $_GET['id'] == "source") {
            
          //  print_R($_GET);
            
        }else if (isset($_GET['id']) && $_GET['id'] == "tag") {
            $data .= com_vedios_getTags($lang);
        } else {



            $id = $lib->util->returnID("com_video_gallery_categories", $_GET['id']);
            $datasql = $lib->db->get_row("com_video_gallery", "max(id) as maxid", "`cat_id`='" . $id . "' and `delete`=0");


            $catdata = $lib->util->data->getCategoryData('com_video_gallery_categories', $datasql['cat_id']);



            $lib->util->page->updateTitle($catdata['title'], $catdata['title'],"title-web");

            //$data .= vediogGetfile($datasql['maxid'], $pro);
            $data .= getItems($id, $rowFrom, $rowNumbers, $pro);
        }
    } else {
        if (isset($pro['cat_id']) && $pro['cat_id'] != "") {
            $datasql = $lib->db->get_row("com_video_gallery", "max(id) as maxid", "`cat_id`='" . $pro['cat_id'] . "' and `delete`=0");

            $catdata = $lib->util->data->getCategoryData('com_video_gallery_categories', $pro['cat_id']);



            $lib->util->page->updateTitle($catdata['title'], $catdata['title'],"title-web");

            $data .= getItems($pro['cat_id'], $rowFrom, $rowNumbers, $pro);
        } else {


            $data .= getCategories("0");
        }
    }
    return $data;
}
?>

