<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function fiz_lawazim_packages($data) {



    // print_r($data);
    // $data = $data['days'] * $data['gustes'];
    $table = "fiz_lawazim_packages";


    /* @var $lib  \libs\libs */
    global $lib;

    $settings = $lib->db->get_row("fiz_reservation_settings");



    if (isset($data['p_cat_id'])) {
        $settings['package_category'] = $data['p_cat_id'];
    }


    $settingscats = explode(",", $settings['package_category']);





    $sql = $lib->util->arrayTofieldDB($settingscats, "or", "cat_id");



    $pkgdata = $lib->db->get_row($table, "*", "(" . $sql . ") and   days_from <= " . $data['nights'] . " and days_to >= " . $data['nights']);



    $allNights = $data['nights'];
    $PkgNights = $pkgdata['basic_package_days'];
    $exNights = $allNights - $PkgNights;

    $Pkglawazim = 0;
    $Exlawazim = 0;
    $Translawazim = 0;


    if ($data['type'] == "a" || $data['type'] == "Adult") {
        $Pkglawazim = $pkgdata['adut_package_price'];
        $Exlawazim = $pkgdata['adult_extra_night'];

        $Translawazim = $pkgdata['adult_transport_per_night'];
    } else if ($data['type'] == "c" || $data['type'] == "Child") {
        $Pkglawazim = $pkgdata['child_package_price'];
        $Exlawazim = $pkgdata['child_extra_night'];
        $Translawazim = $pkgdata['child_transport_per_night'];
    }

    if ($exNights < 0) {

        $exNights = 0;
    }

    if (!isset($data['new'])) {


        $lawazim[0] = $Pkglawazim + ($Exlawazim * $exNights) + ($allNights * $Translawazim);
        $lawazim[1] = $allNights;
        $lawazim[2] = $PkgNights;
        $lawazim[3] = $exNights;
        $lawazim[4] = $pkgdata['id'];
        $lawazim[5] = $pkgdata['title'];
    }







    $lawazim["ex_lawazim"] = $Pkglawazim + ($Exlawazim * $exNights) + ($allNights * $Translawazim);
    $lawazim["totalNights"] = $allNights;
    $lawazim["pkgNights"] = $PkgNights;
    $lawazim["extraNights"] = $exNights;
    $lawazim["package_id"] = $pkgdata['id'];
    $lawazim["package_name"] = $pkgdata['title'];


    return $lawazim;
}
?>


