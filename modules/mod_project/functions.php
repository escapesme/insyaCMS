<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_project_getData($pro) {

    $ps = explode(",", $pro['pros']);

    /* @var $lib  libs\libs */
    global $lib;
    $r = $lib->db->get_data("com_project", "", $lib->util->arrayTofieldDB($ps));
    return $r;
}

?>
