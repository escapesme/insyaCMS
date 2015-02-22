<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_google_adsense($pro, $alias) {
    global $lib;
    $returnData = "";

    $data = $lib->db->get_row("com_google_adsense", "*", "`id`='" . $pro['code'] . "'");

    $returnData.="<div class='ads googleads'>" . $data['code'] . "</div>";

    return $returnData;
}
?>

