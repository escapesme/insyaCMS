<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function modTabsGetModels($pro) {
    global $lib;
    $cods = explode(",", $pro['modelids']);
    
    
    $returnData = "";

    $returnData .= "<div class='tabTiltes'>";
    foreach ($cods as $c) {
        if (trim($c) != "") {
            $returnData .= "<div id='title".$c."' class='title".$c." tabTitle' >" . $lib->front->getmoduleByid($c, "title") . "</div>";
        }
    }
    $returnData .= "</div>";
    $returnData .= "<div class='tabBodys'>";

    foreach ($cods as $c) {
        if (trim($c) != "") {
            $returnData .= "<div  class='Body".$c." tabBody'>" . $lib->front->getmoduleByid($c, "") . "</div>";
        }
    }
    $returnData .= "</div>";
    return $returnData;
}

function modTabsGetHtml($pro) {
    global $lib;

    $cods = explode(",", $pro['htmlids']);



    $returnData = "";
    $returnData .= "<div class='tabTiltes'>";
    foreach ($cods as $c) {
        $htmlData = $lib->db->get_row("com_html", "", "id=" . $c);
        $returnData .= "<div  id='title".$c."' class='tabTitle' >" . $htmlData['title'] . "</div>";
    }

    $returnData .= "</div>";
    $returnData .= "<div class='tabBodys'>";

    foreach ($cods as $c) {
        $htmlData = $lib->db->get_row("com_html", "", "id=" . $c);

        $returnData .= "<div class='Body".$c."  tabBody' >" . $htmlData['my_body'] . "</div>";
    }
    $returnData .= "</div>";
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