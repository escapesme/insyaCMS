<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function getcommponent() {
    global $lib;
    $mdata = $lib->db->get_data("com_install", "", " ins_type='component' and `delete`=0");
    $dir = "../" . $lib->foldersMap->fornt_components_folder;

    $foldert = $lib->util->readFilesNames($dir, "dir");
    $file = $lib->util->is_thatimage($fulldir . "/" . $d . ".png");

    $returndata = "<div class='block-border'> <div class='block-content'><ul class='shortcut-list'>";

    $returndata.="<li><a href='" . $lib->util->getmyurl("admin", "steps") . "steps=step2&com=com_link' ><img src='" . $file . "'/>Link</a></li>";


    foreach ($foldert as $d) {
        $fulldir = $dir . "/" . $d;
        $file = $lib->util->is_thatimage($fulldir . "/" . $d . ".png");


        $dtitle = str_replace("com_", "", $d);

        $dtitle = str_replace("_", " ", $dtitle);
        $returndata.="<li><a href='" . $lib->util->getmyurl("admin", "steps") . "steps=step2&com=" . $d . "' ><img src='" . $file . "'/>" . $dtitle . "</a></li>";
    }

    $returndata.="</ul></div></div>";
    return $returndata;
}

?>
