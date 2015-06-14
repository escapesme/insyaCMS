<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$dataresIDS = array();

function fiz_reservations_login($p, $l) {
    /* @var $lib  \libs\libs */
    global $lib, $dataresIDS;
    $ressettings = $lib->db->get_row("fiz_reservation_settings");
    //    $r = '<a href="http://www.its52.com/ServiceLogin.aspx?domain=http://new.faizehaakimi.com&amp;continue=http://new.faizehaakimi.com/its_login.php">Click here to ITS Authentication</a>';
    return $ressettings['login_html'];
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
    $gdata = getreRowsAc($odata['user_id']);

    $gdata .= getreRowsBygAc($odata['user_id']);

    if (trim($gdata) == "") {
        $r .= "<tr><td style='text-align: center;' colspan='5'>" . $l['TableEmptyMsg'] . "</td></tr> ";
    } else {
        $r .=$gdata;
    }


    $r .= "</tbody></table></div><div class='datarow'>";

    $r .= "<h3 class='title'>" . $l['PreviousReservations'] . "</h3>";

    $r .= "<table class = 'mainTabel itsTable'><thead>"
            . "<th>" . $l['Reservation_ID'] . "</th>"
            . "<th>" . $l['No_of_Persons'] . "</th>"
            . "<th>" . $l['Arrival_Date'] . "</th>"
            . "<th>" . $l['Departure_Date'] . "</th>"
            . "</tr></thead>"
            . "<tbody>";


    $gdata = getreRows($odata['user_id']);
    $gdata .= getreRowsByg($odata['user_id']);



    if (trim($gdata) == "") {
        $r .= "<tr><td  style='text-align: center;'  colspan='4'>" . $l['TableEmptyMsg'] . "</td></tr> ";
    } else {
        $r .=$gdata;
    }



    $r .= "</tbody></table>";

    return $r;
}

function getreRowsAc($user_id, $ids) {
    /* @var $lib  \libs\libs */
    global $lib, $dataresIDS;



    $ds = $lib->db->get_data("fiz_reservation", "*", "booking_owner = '" . $user_id . "' ");


    foreach ($ds as $d) {

        $dataresIDS[$d['id']] = $d['reservation_id'];



        if (!in_array($d['id'], (array) $ids)) {

            if ($d['approved'] == "1") {
                $status = "Approved";
            } else {
                $status = "Not Approved";
            }
            $myxref = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $d['id'] . "' ");



            if ($lib->util->dateTime->howManyDaysTime(date("Y-m-d") . " 23:59:59", $myxref[0]['arrival_date']) >= 0) {
                $r .= "<tr><td>" . sprintf("%04s", $d['reservation_id']) . "</td>"
                        . "<td><a class='lightbox-url' href='/sendAjax.php?file=ajax/coms/fiz/reservations_actions&status=getgdata&value=" . $myxref['reservation_id'] . "' >" . count($myxref) . " (Details)</a></td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref[0]['arrival_date']) . "</td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref[0]['departure_date']) . "</td>"
                        . "<td>"
                        . "<input data-rid = '" . $d['id'] . "' type = 'button' value = 'Edit' class = 'edit_its'/>"
                        . "<input data-rid = '" . $d['id'] . "' type = 'button' value = 'delete' class = 'delete_its'/>"
                        . "<input data-rid = '" . $d['id'] . "' type = 'button' value = 'Documents' class = 'documents_its'/>"
                        . "</td></tr>";
            }
        }
    }




    return $r;
}

function getreRows($user_id, $ids) {
    /* @var $lib  \libs\libs */
    global $lib, $dataresIDS;
    $ds = $lib->db->get_data("fiz_reservation", "*", "booking_owner = '" . $user_id . "' ");

    foreach ($ds as $d) {
        $dataresIDS[$d['id']] = $d['reservation_id'];

        if (!in_array($d['id'], (array) $ids)) {

            if ($d['approved'] == "1") {
                $status = "Approved";
            } else {
                $status = "Not Approved";
            }
            $myxref = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $d['id'] . "' ");



            if ($lib->util->dateTime->howManyDaysTime(date("Y-m-d") . " 23:59:59", $myxref[0]['arrival_date']) < 0) {
                $r .= "<tr><td>" . sprintf("%04s", $d['reservation_id']) . "</td><td><a class='lightbox-url' href='/sendAjax.php?file=ajax/coms/fiz/reservations_actions&wstyle=1&status=getgdata&value=" . $d['id'] . "' >" . count($myxref) . " (Details)</a></td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref[0]['arrival_date']) . "</td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref[0]['departure_date']) . "</td>"
                        . "</tr>";
            }
        }
    }




    return $r;
}

function getreRowsBygAc($user_id) {
    /* @var $lib  \libs\libs */
    global $lib, $dataresIDS;



    $myxrefs = $lib->db->get_data("fiz_reservation_users_xref", "*", "user_id = '" . $user_id . "' ");


    foreach ($myxrefs as $myxref) {

        $resData = $lib->db->get_row("fiz_reservation", "*", "id = '" . $myxref['reservation_id'] . "' ");



        if (!in_array($resData['reservation_id'], (array) $dataresIDS)) {

            if ($d['approved'] == "1") {
                $status = "Approved";
            } else {
                $status = "Not Approved";
            }

            if ($lib->util->dateTime->howManyDaysTime(date("Y-m-d") . " 23:59:59", $myxref['arrival_date']) >= 0) {



                $r .= "<tr><td>" . sprintf("%04s", $resData['reservation_id']) . "</td><td><a class='lightbox-url' href='/sendAjax.php?file=ajax/coms/fiz/reservations_actions&wstyle=1&status=getgdata&value=" . $resData['id'] . "' >" . count($myxrefs) . " (Details)</a></td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref['arrival_date']) . "</td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref['departure_date']) . "</td>"
                        . "<td>"
                        . "<input data-rid = '" . $resData['id'] . "' type = 'button' value = 'Edit' class = 'edit_its'/>"
                        . "<input data-rid = '" . $resData['id'] . "' type = 'button' value = 'delete' class = 'delete_its'/></td></tr>";
            }
        }
    }

    return $r;
}

function getreRowsByg($user_id) {
    /* @var $lib  \libs\libs */
    global $lib, $dataresIDS;



    $myxrefs = $lib->db->get_data("fiz_reservation_users_xref", "*", "user_id = '" . $user_id . "' ");


    foreach ($myxrefs as $myxref) {
        $resData = $lib->db->get_row("fiz_reservation", "*", "id = '" . $myxref['reservation_id'] . "'  ");

        if (!in_array($resData['reservation_id'], (array) $dataresIDS)) {

            if ($d['approved'] == "1") {
                $status = "Approved";
            } else {
                $status = "Not Approved";
            }


            if ($lib->util->dateTime->howManyDaysTime(date("Y-m-d") . " 23:59:59", $myxref['arrival_date']) < 0) {
                $r .= "<tr><td>" . sprintf("%04s", $resData['reservation_id']) . "</td><td><a class='lightbox-url' href='/sendAjax.php?file=ajax/coms/fiz/reservations_actions&wstyle=1&status=getgdata&value=" . $myxref['reservation_id'] . "' >" . count($myxrefs) . " (Details)</a></td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref['arrival_date']) . "</td>"
                        . "<td>" . $lib->util->dateTime->dateFromdb($myxref['departure_date']) . "</td>"
                        . "</tr>";
            }
        }
    }

    return $r;
}
