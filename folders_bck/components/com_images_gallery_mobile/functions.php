<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function getimagestag($id, $lang, $rowFrom, $rowNumbers, $pro) {

    /* @var $lib  libs\libs */
    global $lib;
    $table = "com_images_gallery";
    $catTable = "com_images_gallery_categories";


    $datasql = $lib->db->get_Data($table, "*", " tag like '%" . $id . "%' limit " . $rowFrom . "," . $rowNumbers);

    $llnum = $lib->db->get_Data($table, "*", "tag like '%" . $id . "%'");


    $lib->util->updateTitle($id, $id);


    $returnData .= "<div class='allItemsBlock gallery'>";
    $returnData .="<div class='images'>";
    foreach ($datasql as $da) {
        $returnData.=$lib->util->com->_viewBlock($pro, $lang, $da, $catTable, $table);
    }
    $returnData.= "</div></div>";

    $returnData .=$lib->util->getPageNumber($rowNumbers, count($llnum));

    return $returnData;
}

function getimages($pro, $lang, $catID, $rowFrom, $rowNumbers) {

    /* @var $lib  libs\libs */
    global $lib;
    $table = "com_images_gallery";
    $catTable = "com_images_gallery_categories";
    $returnData .= $lib->util->com->_getCats($pro, $lang, $catTable, $table, $catID);
    $returnData.= $lib->util->com->mobile->_getItems($pro, $lang, $catID, $catTable, $table, $rowFrom, $rowNumbers, "", "true");

    $lib->util->updateTitleCategory($catTable, $catID);


    return $returnData;
}

function getImage($id) {
    global $lib;

    $daem = $lib->db->get_Row("com_images_gallery", "*", "`id`='" . $id . "'");
    //  $datasql = $lib->db->get_Data("com_images_gallery", "*", "`cat_id`='" . $daem['cat_id'] . "'");
    $more = " order by `order` DESC ";
    $datasql = $lib->util->getXrefData("com_images_gallery", $daem['cat_id'], $more);


    $returnData.= "  <div class='allItemMain'>";

    foreach ($datasql as $da) {
        $style = "display:none;";
        if ($da['id'] == $id) {
            $style = "display:block;";
        } else {
            $style = "display:none;";
        }
        $imagePath = "/uploads/images/" . $da['image'];
        /*  if (!is_file($imagePath)) {

          $imagePath = "/uploads/images/noimages.jpg";
          } */

        $returnData.= "  <div style='" . $style . "' id='" . $da['id'] . "' class='itemMain " . $da['id'] . "'><div class='itemMain_title'>" . $da['title'] . "</div>";
        $returnData.= "<img class='itemMain_imgae' src='" . $imagePath . "' />";
        $returnData.= "<div class='itemMain_des'>" . $da['dec'] . "</div></div>";
    }
    $returnData.="</div>";
    $returnData.= getBar($id, $da['cat_id']);
    return $returnData;
}

/*
  function getBar($id, $catid) {
  global $lib;



  // $datasql = $lib->db->get_Data("com_images_gallery", "*", "`cat_id`='" . $catid . "'");

  $more = " order by `order` DESC ";
  $datasql = $lib->util->getXrefData("com_images_gallery", $catid, $more);



  $returnData.="<div class='th_bar'><div class='th_bar_images'>";
  foreach ($datasql as $da) {
  $class = "";
  if ($da['id'] == $id) {
  $class = "act";
  } else {
  $class = "";
  }
  $imagePath = "/uploads/images/" . $da['image'];
  if (!is_file($imagePath)) {

  //  $imagePath = "/uploads/images/noimages.jpg";
  }

  $returnData.= "<img id='thimage_" . $da['id'] . "' class='" . $class . " bar_imgae' src='" . $imagePath . "' />";
  }
  $returnData.="</div></div><div class='th_bar_next'><<</div><div class='th_bar_prev'>>></div>";
  return $returnData;
  }
 */

function com_images_getTags($lang) {
    global $lib;

    return $lib->util->getTags("com_images_gallery", "10", "50");
}
?>




