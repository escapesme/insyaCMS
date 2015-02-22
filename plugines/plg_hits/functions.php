<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_hits_addHit($data) {

    global $lib;

    $sqlData = $lib->db->get_row("plg_hits", "*", " ob_type='" . $data[0] . "' and  ob_id='" . $data[1] . "' ");




    if ($sqlData['id'] == null) {
        $data = array(
            "ob_type" => $data[0],
            "ob_id" => $data[1],
            "nums" => "1"
        );

        $lib->db->insert_row("plg_hits", $data);
    } else {

        $data = array(
            "nums" => $sqlData['nums'] + 1
        );

        $lib->db->update_row("plg_hits", $data, $sqlData['id']);
    }
}

function plg_hits_getHits($data) {
    global $lib;

    $sqlData = $lib->db->get_row("plg_hits", "*", " ob_type='" . $data[0] . "' and  ob_id='" . $data[1] . "' ");

    return $sqlData['nums'];
}

?>
