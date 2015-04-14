<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function fiz_lawazim_table($data, $lang) {

    /* @var $lib  \libs\libs */
    global $lib;

    $myform = 'faiz-new-reservation';




    $nights = $_SESSION[$myform]['nights'];







    $ejs = explode(",", $_SESSION['faiz-new-reservation']['Mumin_ids']);



    if (checkData($ejs, $_SESSION, $myform)) {










        $rdata = "";


////////////////////////////
        $rdata .= "<div class='datarow TravelDates'><h3 class='title'>" . $lang['TravelDates'] . "</h3>";
        $rdata .= "<table class='mainTabel'>"
                . "<thead>"
                . "<tr><th>" . $lang['checkin'] . "</th><td>" . $_SESSION[$myform]['checkin'] . "</td><th>" . $lang['checkOut'] . "</th><td>" . $_SESSION[$myform]['checkout'] . "</td><th>" . $lang['nights'] . "</th><td>$nights</td></tr>"
                . "</thead>";
        $rdata .= "</table></div>";

////////////////////////////

        $rdata .= "<div class='datarow ArrivalDetails'><h3 class='title'>" . $lang['ArrivalDetails'] . "</h3>";

        $rdata .= "<table class='mainTabel'>"
                . "<thead>"
                . "<tr><th>" . $lang['Airline'] . "</th><th>" . $lang['FlightNo'] . "</th><th>" . $lang['Arrivingfrom'] . "</th><th>" . $lang['arriving_time'] . "</th></tr>"
                . "</thead>"
                . "<tbody><tr><td>" . $_SESSION[$myform]['airline'] . "</td><td>" . $_SESSION[$myform]['airline_code'] . "</td><td>" . $_SESSION[$myform]['arriving_from'] . "</td><td>" . $_SESSION[$myform]['arrival_time'] . "</td></tr></tbody>";
        $rdata .= "</table></div>";


////////////////////////////

        $rdata .= "<div class='datarow ContactDetails'><h3 class='title'>Contact Details</h3>";


        $rdata .= "<table class='mainTabel'>"
                . "<thead>"
                . "<tr><th>" . $lang['Email'] . "</th><th>" . $lang['Mobile'] . "</th></tr>"
                . "</thead>"
                . "<tbody><tr><td>" . $_SESSION[$myform]['email'] . "</td><td>" . $_SESSION[$myform]['mobile'] . "</td></tr></tbody>";
        $rdata .= "</table></div>";


        ////////////////////////////

        $rdata .= "<div class='datarow GuistDetails'><h3 class='title'>Guest Details</h3>";

        $rdata .= "<table class='mainTabel'>"
                . "<thead>"
                . "<tr><th>" . $lang['SNO'] . "</th><th>" . $lang['ITS'] . "</th><th>" . $lang['Name'] . "</th><th>" . $lang['Type'] . "</th><th>" . $lang['PackageName'] . "</th><th>Lawazim</th></tr>"
                . "</thead>"
                . "<tbody>";

        $i = 0;
        $no = 0;
        foreach ($ejs as $ej) {
            $no++;
            //  $ejdata = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $ej . ";getType__data");

         //   echo "<br/>" . $ej . "<br/>";
            $ejdata = $lib->coms->faiz->getUserDataByMumin_id($ej);
            // print_r($ejdata);



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
            $rdata.="<tr><td>" . $no . " </td><td>" . $ej . " </td><td> " . $ejdata['FullName'] . "</td><td> $type</td><td>" . $pkgData['5'] . "</td><td>" . $lang['currency'] . $pkgData['0'] . "</td></tr>";
            $llLawazim +=$pkgData['0'];

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


        $rdata.="<tr><td colspan='5' style='text-align:center ;  font-weight: bold;'>Total</td><td  style=' font-weight: bold;' >" . $lang['currency'] . "$llLawazim</td></tr>";



        $_SESSION[$myform]['guests'] = $gArray;
        $rdata.="</tbody>"
                . "</table></div>";
    } else {

        $lib->util->reload("/rex/step/2/", "0");
        //$rdata"" 
    }
    return $rdata;
}

//echo date_create_from_format('d/m/Y', "23/05/2013"); 


function checkData($ejs, $data, $pr) {
    /* @var $lib  \libs\libs */
    global $lib;
    $r = true;





    $checkin = $lib->util->dateTime->dataFormat($data[$pr]['checkin'], 'Y-m-d');

    $checkout = $lib->util->dateTime->dataFormat($data[$pr]['checkout'], 'Y-m-d');



    $data = $lib->util->dateTime->createDateRangeArray($checkin, $checkout);

    foreach ($ejs as $id) {
        foreach ($data as $d) {

            $pkgdata = $lib->db->get_row("fiz_reservation_users_xref", "*", " arrival_date <= " . $d . " and departure_date >= " . $d . " and its_id='" . $id . "'");

            if (is_array($pkgdata)) {

                $r = FALSE;
            }
        }
    }



    return $r;
}
?>


