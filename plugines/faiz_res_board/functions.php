<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function fiz_reservations_login($p, $l) {

    /* @var $lib  \libs\libs */
    global $lib;

    $r = "";


    $r .= '<h2>' . $l['lgoinmsg'] . '</h2>';

    $filds = array(
        "its_id" => array(
            "type" => "text",
            "pclass" => " _50",
            "title" => "its_id",
            "name" => "its_id"
        ), "" => array(
            "type" => "button",
            "pclass" => " _100",
            "class" => "",
            "title" => $l['lgoinsubmit'], "value" => $l['lgoinsubmit'],
            "name" => "its_id"
            , "moreAttra" => "data-to='/Reservations/' data-do='login' "
        )
    );
    $lib->forms->filds = $filds;
    $r .= $lib->forms->_render_form();
    return $r;
}

function fiz_razaTypes($p, $l, $oid, $odata) {
    $r .= "<div class='datarow'><h3 class='title'>" . $l['ActiveReservations'] . "</h3>";

    $r .= "<table class = 'mainTabel itsTable'><thead>"
            . "<th>" . $l['Reservation_ID'] . "</th>"
            . "<th>" . $l['No_of_Persons'] . "</th>"
            . "<th>" . $l['Arrival_Date'] . "</th>"
            . "<th>" . $l['Departure_Date'] . "</th>"
            . "<th>" . $l['actions'] . "</th>"
            . "</tr></thead>"
            . "";
    $r .= getreRowsAc($odata['user_id'], $ids);
    $r .= "</tbody></table></div><div class='datarow'>";

    $r .= "<h3 class='title'>" . $l['PreviousReservations'] . "</h3>";

    $r .= "<table class = 'mainTabel itsTable'><thead>"
            . "<th>" . $l['Reservation_ID'] . "</th>"
            . "<th>" . $l['No_of_Persons'] . "</th>"
            . "<th>" . $l['Arrival_Date'] . "</th>"
            . "<th>" . $l['Departure_Date'] . "</th>"
            . "</tr></thead>"
            . "<tbody>";
    $r .= getreRows($odata['user_id'], $ids);
    $r .= "</tbody></table>";

    return $r;
}

function getreRowsAc($user_id, $ids) {
    /* @var $lib  \libs\libs */
    global $lib;
    /*
     * 
     * select Date, TotalAllowance from Calculation where EmployeeId = 1
      and Date >= '2011/02/25' and Date <= '2011/02/27'
     */
    $ds = $lib->db->get_data("fiz_reservation", "*", "booking_owner = '" . $user_id . "' ");


    foreach ($ds as $d) {


        if (!in_array($d['id'], (array) $ids)) {

            if ($d['approved'] == "1") {
                $status = "Approved";
            } else {
                $status = "Not Approved";
            }
            $myxref = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $d['id'] . "' ");




            if ($lib->util->dateTime->howManyDaysTime(date("Y-m-d") . " 23:59:59", $myxref[0]['arrival_date']) > 0) {
                $r .= "<tr><td>" . $d['id'] . "</td><td>" . count($myxref) . "</td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref[0]['arrival_date']) . "</td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref[0]['departure_date']) . "</td>"
                        . "<td><input data-rid = '" . $d['id'] . "' type = 'button' value = 'delete' class = 'delete_its'/></td></tr>";
            }
        }
    }




    return $r;
}

function getreRows($user_id, $ids) {
    /* @var $lib  \libs\libs */
    global $lib;
    /*
     * 
     * select Date, TotalAllowance from Calculation where EmployeeId = 1
      and Date >= '2011/02/25' and Date <= '2011/02/27'
     */
    $ds = $lib->db->get_data("fiz_reservation", "*", "booking_owner = '" . $user_id . "' ");


    foreach ($ds as $d) {


        if (!in_array($d['id'], (array) $ids)) {

            if ($d['approved'] == "1") {
                $status = "Approved";
            } else {
                $status = "Not Approved";
            }
            $myxref = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $d['id'] . "' ");


            ////0:00:00 " "




            if ($lib->util->dateTime->howManyDaysTime(date("Y-m-d") . " 23:59:59", $myxref[0]['arrival_date']) <= 0) {
                $r .= "<tr><td>" . $d['id'] . "</td><td>" . count($myxref) . "</td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref[0]['arrival_date']) . "</td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref[0]['departure_date']) . "</td>"
                        . "</tr>";
            }
        }
    }




    return $r;
}
