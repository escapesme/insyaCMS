<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */


global $lib;
$mode = $_GET['mode'];

if ($mode == "add") {


    echo $lib->adminEng->getComponentMain("", "", "", addData());
} else if ($mode == "edit") {

    echo editdatjs();
    echo $lib->adminEng->getComponentMain("", "", "", addData());
} else {
    echo $lib->adminEng->getComponentMain();
}
?>



<style>   


    .whare_valuedata div{
        display: none
    }
    .whare_valuedata .text{
        display: block
    }

    div.form_row.disnone{
        display: none;
    }
    div.form_row.disblock{
        display: block;
    }
    .Brackets{
        border: 2px solid #646B6F;
        height: auto;
        padding: 2px;
        clear: both;
        float: left;
        width: 100%;
    }.deleteRow{
        float:right;
        width:20px; position: absolute;
        right:20px;top: 5px;
    }
    



    .Brackets,.whereRow,.cdataRow,.cDatarows,.joinRow   
    {
        position: relative;
        clear: both;
        width: 100%;
        float: none
    }
</style>