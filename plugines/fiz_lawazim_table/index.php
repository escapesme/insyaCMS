<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function fiz_lawazim_table($data) {

    /* @var $lib  \libs\libs */
    global $lib;

    $myform = 'faiz-new-reservation';


    $nights = $_SESSION[$myform]['nights'];


    $ejs = explode(",", $_SESSION['faiz-new-reservation']['Mumin_ids']);

    $rdata = "<table>"
            . "<thead>"
            . "<tr><th>ITS </th><th> Name</th><th> Type</th><th> Package Name</th><th>nights</th><th>Price</th></tr>"
            . "</thead>"
            . "<tbody>";





    $i = 0;
    foreach ($ejs as $ej) {


        $ejdata = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $ej . ";getType__data");


        $type = "";


        if ($ejdata['Age'] > 12) {
            $type = "Adult";
            $types = "a";
        } else if ($ejdata['Age'] < 2) {
            $types = "f";
            $type = "Infant";
        } else if ($ejdata['Age'] < 12) {
            $types = "c";
            $type = "Child";
        }

        $pkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $nights . ";type__" . $types);


        $rdata.="<tr><td>" . $ej . " </td><td> " . $ejdata['FullName'] . "</td><td> $type</td><td>" . $pkgData['5'] . "</td><td>" . $nights . "</td><td>" . $pkgData['0'] . "</td></tr>";


        $gArray[$i] = $ejdata;

        $gArray[$i]['user_type'] = $type;
       $gArray[$i]['type'] = $type;

        $gArray[$i]['lawazim'] = $pkgData['0'];

        $gArray[$i]['ex_lawazim'] = $pkgData['0'];
        $gArray[$i]['nights'] = $pkgData['1'];
        $gArray[$i]['pkg_nights'] = $pkgData['2'];
        $gArray[$i]['ex_nights'] = $pkgData['3'];
        $gArray[$i]['package_id'] = $pkgData['4'];
        $gArray[$i]['package_title'] = $pkgData['5'];
        $gArray[$i]['type'] = $type;


        $gArray[$i]['ex_checkin'] = $lib->util->dateTodb($_SESSION[$myform]['checkin']);
        $gArray[$i]['ex_checkout'] = $lib->util->dateTodb($_SESSION[$myform]['checkout']);




        $i++;
    }

    $_SESSION[$myform]['guests'] = $gArray;

    $rdata.="</tbody>"
            . "</table>";





    return $rdata;
}
?>


