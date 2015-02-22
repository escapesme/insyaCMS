<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function plg_clalawzim($data) {

    global $lib;


    $data = $data['days'] * $data['gustes'];

  
    return $data;
}
?>


