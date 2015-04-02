<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function fiz_saveReservation($data) {

    /* @var $lib  \libs\libs */
    global $lib;



    $dataSesstion = $_SESSION['faiz-new-reservation'];

    $dataGuests = $_SESSION['faiz-new-reservation']['guests'];



    $reservation_id = $lib->coms->faiz->createReservationID();


    $resData = array(
        "reservation_id" => $reservation_id,
        "email" => $dataSesstion['email'],
        "mobile" => $dataSesstion['mobile'],
        "airport_pickup" => "",
    );


    // $lib->db->insert_row("fiz_reservation", $resData); 


    foreach ($dataGuests as $g) {


        $userData = $lib->coms->faiz->getUserDataByMumin_id($g['Mumin_id']);


        $xrefData = array(
            "reservation_id" => $reservation_id,
            "user_id" => $userData['user_id'],
            "airline" => $dataSesstion['airline'],
            "airline_code" => $dataSesstion['airline_code'],
            "individual_id" => $reservation_id,
            "its_id" => $g['Mumin_id'],
            "arrival_date" => $g['ex_checkin']
            , "departure_date" => $g['ex_checkout']
        );


        //  $lib->db->insert_row("fiz_reservation_users_xref", $xrefData);
    }
}
?>


