<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function news_Ticker_getdynamic($pro, $thisTable, $thiscatgoriesTable) {
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

function news_Ticker_getAllItems($pro, $type, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $data = "";


    $where = "";

    if (isset($pro['cat_id']) && trim($pro['cat_id']) != "") {
        $where = '  `cat_id` like "%' . $pro['cat_id'] . "%\"";
    }

    $where .= news_Ticker_getdynamic($pro);


    if ($type == "cat") {

        $data = $lib->db->get_Data($thiscatgoriesTable, "*", $where . " ORDER BY `id`");
    } else if ($type == "art") {

        // $data = $lib->db->get_Data($thisTable, "*", $where . "  ORDER BY `id`");
        $data = $lib->util->getXrefData($thisTable, $pro['cat_id']);
    }


    return $data;
}

///////////////////////////////////////////////
function news_Ticker_hints($pro, $thisTable, $thiscatgoriesTable) {

    global $lib;
    $mydata2 = $lib->util->getDataByhits($thisTable, news_Ticker_getdynamic($pro));
    return news_Ticker_viewdatat($pro, $mydata2, $thisTable, $thiscatgoriesTable);
}

////////////////////////////////////////////////////////////////////////////////
function news_Ticker_categories_getLast($pro, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $all = getAllItems($pro, "cat", $thisTable, $thiscatgoriesTable);
    return news_Ticker_categories_viewdatat($pro, $all, $thisTable, $thiscatgoriesTable);
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
function news_Ticker_getLast($pro, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $all = news_Ticker_getAllItems($pro, "art", $thisTable, $thiscatgoriesTable);
    return news_Ticker_viewdatat($pro, $all, $thisTable, $thiscatgoriesTable);
}

///////////////////////////////////////////////////
function news_Ticker_tags($pro, $thisTable, $thiscatgoriesTable) {

    global $lib;
    return $lib->util->getTags($thisTable, $pro['tagmaxfont'], $pro['tagminfont']);
}

///////////////////////////////////////////////
function news_Ticker_viewdatat($pro, $all, $thisTable, $thiscatgoriesTable) {
    global $lib;



    // $returnData.= "<div class='" . $thisTable . " modig_all'>";
    for ($i = 0; $i < $pro['numberView']; $i++) {





        if (isset($all[$i]['id']) && trim($all[$i]['id']) != "") {

            if ($thiscatgoriesTable != "") {
                $cts = explode(",", $all[$i]['cat_id']);



                $datacat = $lib->db->get_row($thiscatgoriesTable, "*", "id='" . $cts[1] . "'");
                $url = $lib->util->createURL($thisTable, $datacat['alias'], $all[$i]['alias']);
            }



            if (isset($all[$i]['ex_link']) && $all[$i]['ex_link'] != "") {
                $url = $all[$i]['ex_link'];
            }


            $imagePath = "/uploads/images/" . $all[$i]['th_image'];
            if (!is_file($imagePath)) {

                // $imagePath = "/uploads/images/noimages.jpg";
            }

            $mor = "";
            if ($pro['firstMainStyle'] == "1" && $i >= 1) {
                $mor = "firstMainStyle";
            }


            $returnData.= "<li><div id='" . $all[$i]['id'] . "' class='mod_block " . $mor . "'>";

            if ($pro['viewTitle'] == "1") {

                $returnData.= "<div class='modig_blocTitle'> <a title='More' href='" . $url . "'><span></span>" . $all[$i]['title'] . "</a></div>";
            }

            if ($pro['viewImage'] == "1" && ($pro['firstMainStyle'] == "0" || $i < 1)) {

                $returnData.= "<div  class='mod_image'><a title='More' href='" . $url . "'><img src='" . $imagePath . "'  class='mod_image'/></a> </div>";
            }


            if ($pro['viewDes'] == "1" && ($pro['firstMainStyle'] == "0" || $i < 1)) {

                $returnData.= "<div class='modig_blockdes' >" . $lib->util->limit_text($all[$i]['intro'], $pro['viewDesNum']) . "</div>";
            }
            if ($pro['viewMViews'] == "1" && ($pro['firstMainStyle'] == "0" || $i < 1)) {
                $returnData.= $lib->plugins->importPlugin("plg_hits", $thisTable . ";" . $all[$i]['id'] . ";getHits");
            }

            $returnData.= "</div></li>";
        }
    }


    // $returnData.= "</div>";
    return $returnData;
}

///////////////////////////////////////////////
function news_Ticker_categories_viewdatat($pro, $all, $thisTable, $thiscatgoriesTable) {
    global $lib;
    // $alias = $lib->util->getMenuAlias($thisTable);
    // $returnData.= "<div class='" . $thisTable . " modig_all'>";
    for ($i = 0; $i < $pro['numberView']; $i++) {
        if (isset($all[$i]['id']) && trim($all[$i]['id']) != "") {







            $url = $lib->util->createURL($thisTable, $all[$i]['alias']);





            //   $url = "/show/cat/" . $all[$i]['id'] . "--" . $alias . ".html";




            $imagePath = "/uploads/images/" . $all[$i]['image'];
            if (!is_file($imagePath)) {

                //  $imagePath = "/uploads/images/noimages.jpg";
            }
            $returnData.= "<div id='" . $all[$i]['id'] . "' class='mod_block'>";


            if ($pro['viewTitle'] == "1") {

                $returnData.= "<div class='modig_blocTitle'> <a title='More' href='" . $url . "'>" . $all[$i]['name'] . "</a></div>";
            }



            if ($pro['viewImage'] == "1") {

                $returnData.= "<div  class='mod_image'><a title='More' href='" . $url . "'><img src='" . $imagePath . "'  class='mod_image'/></a> </div>";
            }


            if ($pro['viewDes'] == "1") {

                $returnData.= "<div class='modig_blockdes'>" . $all[$i]['des'] . "</div>";
            }

            $returnData.= "</div>";
        }
    }

    //  $returnData.= "</div>";
    return $returnData;
}
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
