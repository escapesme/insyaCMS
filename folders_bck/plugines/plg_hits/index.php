<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_hits($data, $lang) {
    global $lib;

    $vi = 'views' . $data[0] . $data[1];





    if ($data[2] != "getHits" && $_SESSION[$vi] != "done") {

        plg_hits_addHit($data);

        $_SESSION[$vi] = "done";
    }

    $returnData = "<div class='hits'><div class='label'>" . $lang['Views'] . "</div><div>" . plg_hits_getHits($data) . "</div></div>";

    return $returnData;
}

?>
