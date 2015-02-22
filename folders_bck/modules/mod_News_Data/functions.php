<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_news_hints($pro, $thisTable, $thiscatgoriesTable) {

    global $lib;
    $mydata2 = $lib->util->getDataByhits($thisTable, getdynamic($pro));
    return $lib->util->com->get_modData_items($pro, $mydata2, $thisTable, $thiscatgoriesTable);
}

////////////////////////////////////////////////////////////////////////////////
function mod_categories_getLast($pro, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $all = $lib->util->com->get_modData_getAllItems($pro, "cat", $thisTable, $thiscatgoriesTable);
    return $lib->util->com->get_modData_items($pro, $all, $thisTable, $thiscatgoriesTable);
}

function mod_news_getLast($pro, $thisTable, $thiscatgoriesTable) {
    global $lib;
    $all = $lib->util->com->get_modData_getAllItems($pro, "art", $thisTable, $thiscatgoriesTable);
    return $lib->util->com->get_modData_items($pro, $all, $thisTable, $thiscatgoriesTable);
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////
function mod_new_tags($pro, $thisTable, $thiscatgoriesTable) {
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
