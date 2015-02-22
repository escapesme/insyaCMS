<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_gallery_video_Data_byid($pro, $thisTable, $thiscatgoriesTable) {
    global $lib;

    $ids = explode(",", $pro['ids']);

 $returnData .="<div class='stylediv'></div>";


    foreach ($ids as $id) {

        $datacat = $lib->db->get_row($thisTable, "*", "`id`='" . $id . "'");

        $returnData .= mod_gallery_video_Data_id_viewblock($pro, $datacat, $thisTable, $thiscatgoriesTable);
    }


    return  $returnData;
}

function mod_gallery_video_Data_id_viewblock($pro, $all, $thisTable, $thiscatgoriesTable) {
    global $lib;



    if (!isset($pro['maxTitle']) || $pro['maxTitle'] == "") {
        $pro['maxTitle'] = 1000;
    }


    if (!isset($pro['maxdes']) || $pro['maxdes'] == "") {
        $pro['maxdes'] = 16;
    }

    $returnData.= "<div class='" . $thisTable . " modig_all'>";

    if (isset($all['id']) && trim($all['id']) != "") {



        $imagePath = "/uploads/images/" . $all['th_image'];


        if ($thiscatgoriesTable != "") {
            $datacat = $lib->db->get_row($thiscatgoriesTable, "*", "`id`='" . $all['cat_id'] . "'");
            $url = $lib->util->createURL($thisTable, $datacat['alias'], $all['alias']);
        }


        $returnData.= "<div id='" . $all['id'] . "' class='mod_block'>";





        $plginData = $lib->util->getPlginData("com_video_gallery", $all['id']);



        $sourcedatasql = $lib->db->get_Row("plg_rescores", "*", " `id`='" . $plginData['source'] . "' ");




        $returnData.= "";

        if (isset($pro['viewResource']) && $pro['viewResource'] == "1") {

            $imagePaths = "/uploads/images/" . $sourcedatasql['image'];
            $returnData.= "<div class='source_title'>
           <a title='" . $sourcedatasql['title'] . "' href='" . $sourcedatasql['url'] . "'>
                <img    
                alt=\"" . $sourcedatasql['title'] . "\"  
                    class='lazy source_image'
                      data-src='" . $imagePaths . "'  
                        src='/images/pixel.gif'
 />
                   
<span>" . $sourcedatasql['title'] . "</span></a>
    </div>";
        }








        if ($pro['viewTitle'] == "1" || ($pro['firstMainStyle'] == "1" && $i == 0)) {

            $returnData.= "<div class='modig_blocTitle'>  
                    
<a title='" . $all['title'] . "' href='" . $url . "'>" . $lib->util->limit_text($all['title'], $pro['maxTitle']) . "</a></div>";
        }



        if ($pro['viewMViews'] == "1" || ($pro['firstMainStyle'] == "1" && $i == 0)) {
            $returnData.= $lib->plugins->importPlugin("plg_hits", $thisTable . ";" . $all['id'] . ";getHits");
        }


        if ($pro['viewImage'] == "1" || ($pro['firstMainStyle'] == "1" && $i == 0)) {

            $returnData.= "<div  class='mod_image'>
                    <a title='" . $all['title'] . "' href='" . $url . "'>
                    <div class='hoverlight'><div class='hlightimg'></div></div>
                    <div class='duration'>" . $all['duration'] . "</div>



<img 
    alt='" . $all['title'] . "' 
    
    src='/images/pixel.gif'
    data-src='" . $imagePath . "'
    class='lazy mod_image'
    />
    </a> </div>";
        }


        if ($pro['viewDes'] == "1" || ($pro['firstMainStyle'] == "1" && $i == 0)) {


            $returnData.= "<div class='modig_blockdes'><a title='" . $all['title'] . "'  href='" . $url . "' >" . $lib->util->limit_text($all['dec'], $pro['maxdes']) . "</a></div>";
        }

        $returnData.= "</div>";
    }



    $returnData.= "</div>";
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
