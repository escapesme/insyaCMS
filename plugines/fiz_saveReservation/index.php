<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function fiz_saveReservation($data, $pro, $p) {

    /* @var $lib  \libs\libs */
    global $lib;











    $dataSesstion = $_SESSION['faiz-new-reservation'];

    $dataGuests = $_SESSION['faiz-new-reservation']['guests'];



    //print_r($dataSesstion);

    $scatdata = $lib->db->get_row("com_html", "*", "id=" . $data["msg_template"]);


    $body = $scatdata['my_body'];




    $reservation_id = $lib->coms->faiz->createReservationID();


    $resData = array(
        "reservation_id" => $reservation_id,
        "email" => $dataSesstion['email'],
        "mobile" => $dataSesstion['mobile'],
        "airport_pickup" => $dataSesstion['airport_pickup'],
        "booking_owner" => $dataSesstion['booking_owner'],
        "remarks" => $dataSesstion['remarks']
    );



    $lib->db->insert_row("fiz_reservation", $resData);

    $maxData = $lib->db->get_maxrow("fiz_reservation");

    $r = $lib->language->updateText($body, $maxData);
    foreach ($dataGuests as $g) {


        $userData = $lib->coms->faiz->getUserDataByMumin_id($g['Mumin_id']);


        $xrefData = array(
            "reservation_id" => $maxData['id'],
            "user_id" => $userData['user_id'],
            "airline" => $dataSesstion['airline'],
            "airline_code" => $dataSesstion['airline_code'],
            "its_id" => $g['Mumin_id'],
            "arriving_from" => $g['arriving_from'],
            "arrival_date" => $g['ex_checkin']
            , "departure_date" => $g['ex_checkout']
        );





        $lib->db->insert_row("fiz_reservation_users_xref", $xrefData);
    }




    unset($_SESSION['faiz-new-reservation']);
    unset($_SESSION['faiz-new-reservation']['guests']);

    return $r;
}
?>


