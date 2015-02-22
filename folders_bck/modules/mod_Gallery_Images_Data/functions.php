<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_gallery_images_Data_getdynamic($pro, $thisTable, $thiscatgoriesTable) {
    //$_GET['show'] == 'cate'
    global $lib;
    $where = "";
    if ($pro['dynamic'] == "1") {



        $dataMain = $lib->front->getmainProreties();
        $al = $lib->front->getmenu('mei_main');

        if ($_GET['show'] != 'cat' && $al == $thisTable && isset($dataMain['cat_id']) && $dataMain['cat_id'] != "") {


            $where = 'and ' . $thisTable . '.cat_id=' . $dataMain['cat_id'];
        } else if ($_GET['show'] == 'cat') {

            $where = 'and ' . $thisTable . '.cat_id=' . $_GET['id'];
        }
    }



    return $where;
}

function mod_gallery_images_Data_getAllItems($pro, $type, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $data = "";


    $where = "";

    if (isset($pro['cat_id']) && trim($pro['cat_id']) != "") {
        $where = 'and `cat_id`=' . $pro['cat_id'];
    }

    $where .=mod_gallery_images_Data_getdynamic($pro);


    if ($type == "cat") {

        $data = $lib->db->get_Data($thiscatgoriesTable, "*", "`enabled`=1 and  `delete`=0  " . $where . " ORDER BY `id`");
    } else if ($type == "art") {


        $more = " order by `order`  DESC ";

        $data = $lib->util->getXrefData($thisTable, $pro['cat_id'], $more);
    }
    return $data;
}

function mod_gallery_images_Data_hints($pro, $thisTable, $thiscatgoriesTable) {

    global $lib;
    $mydata2 = $lib->util->getDataByhits($thisTable, mod_gallery_images_Data_getdynamic($pro));
    return mod_gallery_images_Data_viewdatat($pro, $mydata2, $thisTable, $thiscatgoriesTable);
}

////////////////////////////////////////////////////////////////////////////////
function mod_gallery_images_Data_categories_getLast($pro, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $all = mod_gallery_images_Data_getAllItems($pro, "cat", $thisTable, $thiscatgoriesTable);
    return mod_gallery_images_Data_categories_viewdatat($pro, $all, $thisTable, $thiscatgoriesTable);
}

function mod_gallery_images_Data_categories_viewdatat($pro, $all, $thisTable, $thiscatgoriesTable) {
    global $lib;


    $returnData.= "<div class='" . $thisTable . " modig_all'>";
    for ($i = 0; $i < $pro['numberView']; $i++) {







        if (isset($all[$i]['id']) && trim($all[$i]['id']) != "") {




            $url = $lib->util->createURL($thisTable, $all[$i]['alias']);




            $imagePath = "/uploads/images/" . $all[$i]['image'];
            /*   if (!is_file($imagePath)) {

              $imagePath = "/uploads/images/noimages.jpg";
              } */
            $returnData.= "<div id='" . $all[$i]['id'] . "' class='mod_block'>";


            if ($pro['viewTitle'] == "1") {

                $returnData.= "<div class='modig_blocTitle'> <a title='More' href='" . $url . "'>" . $all[$i]['title'] . "</a></div>";
            }



            if ($pro['viewImage'] == "1") {

                $returnData.= "<div  class='mod_image'><a title='More' href='" . $url . "'><img src='" . $imagePath . "'  class='mod_image'/></a> </div>";
            }


            if ($pro['viewDes'] == "1") {

                $returnData.= "<div class='modig_blockdes><a title='More' href='" . $url . "'>" . $all[$i]['des'] . "</a></div>";
            }

            $returnData.= "</div>";
        }
    }

    $returnData.= "</div>";
    return $returnData;
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


function mod_gallery_images_Data_getLast($pro, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $all = mod_gallery_images_Data_getAllItems($pro, "art", $thisTable, $thiscatgoriesTable);
    return mod_gallery_images_Data_viewdatat($pro, $all, $thisTable, $thiscatgoriesTable);
}

function mod_gallery_images_Data_viewdatat($pro, $all, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $alias = $lib->util->getMenuAlias($thisTable);


    $returnData.= "<div class='" . $thisTable . " modig_all'>";
    for ($i = 0; $i < $pro['numberView']; $i++) {
        if (isset($all[$i]['id']) && trim($all[$i]['id']) != "") {

            if ($thiscatgoriesTable != "") {
                $datacat = $lib->db->get_row($thiscatgoriesTable, "*", "id='" . $all[$i]['cat_id'] . "'");

                $url = $lib->util->createURL($thisTable, $datacat['alias'], $all[$i]['alias']);
            }



            $imagePath = "/uploads/images/" . $all[$i]['th_image'];
            /*  if (!is_file($imagePath)) {

              $imagePath = "/uploads/images/noimages.jpg";
              } */
            $returnData.= "<div id='" . $all[$i]['id'] . "' class='mod_block'>";


            if ($pro['viewTitle'] == "1" || ($pro['firstMainStyle'] == "1" && $i == 0)) {

                $returnData.= "<div class='modig_blocTitle'> <a title='More' href='" . $url . "'>" . $all[$i]['title'] . "</a></div>";
            }



            if ($pro['viewMViews'] == "1" || ($pro['firstMainStyle'] == "1" && $i == 0)) {
                $returnData.= $lib->plugins->importPlugin("plg_hits", $thisTable . ";" . $all[$i]['id'] . ";getHits");
            }


            if ($pro['viewImage'] == "1" || ($pro['firstMainStyle'] == "1" && $i == 0)) {

                $returnData.= "<div  class='mod_image'><a title='More' href='" . $url . "'><img src='" . $imagePath . "'  class='mod_image'/></a> </div>";
            }


            if ($pro['viewDes'] == "1" || ($pro['firstMainStyle'] == "1" && $i == 0)) {

                $returnData.= "<div class='modig_blockdes><a title='More' href='" . $url . "' >" . $lib->util->limit_text($all[$i]['dec'], 16) . "</a></div>";
            }

            $returnData.= "</div>";
        }
    }


    $returnData.= "</div>";
    return $returnData;
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////
function mod_gallery_images_Data_tags($pro, $thisTable, $thiscatgoriesTable) {

    global $lib;



    return $lib->util->getTags($thisTable, $pro['tagmaxfont'], $pro['tagminfont']);
}

///////////////////////////////////////////////
?>

<style>

    .modig_blocktitleonly{
        width:50%;
        float:left;
        text-align: left
    }

    .modig_block{

        width:28%;
        height:100px;
        position: relative;
        float:left;
        margin: 1%;
    }

    .modig_title{
        width:100%;
        position: absolute;
        bottom: 0px;
        text-align: center;
        background: url("images/mod_back_bg2.png") 0 0 repeat;;

    }
    .modig_imgae{
        width:100%;
        height:100%;
    }

</style>
