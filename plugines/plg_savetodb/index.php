<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function plg_savetodb($data) {

    /* @var $lib  \libs\libs */
    global $lib;

   // print_r($data['savedata']);
    $returnData = $lib->db->insert_row($data['table'], $data['savedata']);

    echo $lib->db->returnSQL;

    return $returnData;
}
?>


