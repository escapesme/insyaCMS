<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro, $lng) {


    global $lib;
    $data = "<div class='com_main com_gusetbook'>";
    $data .= getmessages($pro, $lng);
    $data .= "<div class='linesp'></div>";
    if ($pro['addform'] == "1") {
        $data .= getform($pro, $lng);
    }

    $data .="</div>";
    return $data;
}
?>

