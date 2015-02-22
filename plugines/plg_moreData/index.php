<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function plg_moreData($data, $lang) {
    $out = "";

    foreach ($data as $k => $v) {
        if ($k != "" && $k != "||") {




            $out.="<div class='mdrow " . $k . " row'><div class='mdlabel label'>" . $k . "</div><div class='mdvalue value'>" . $v . "</div></div>";
        }
    }


    return $out;
}
?>


