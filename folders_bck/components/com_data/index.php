<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

print_r($_GET);

function main($pro) {
    /* @var $lib  libs\libs */
    global $lib;
    $returnData = $lib->util->dataBluder->renderDataBluder($pro['data']);
    return $returnData;
}
?>

<style>


    .chartCont{
        height: 500px;  position: relative;
    }


</style>
