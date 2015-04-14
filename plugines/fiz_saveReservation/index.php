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
    $msgid = $data["msg_template"];
    $reservation_id = $lib->coms->faiz->createReservationID();

//print_r($dataSesstion);



    if (isset($_SESSION['w_status']) && $_SESSION['w_status'] == "edit" && isset($_SESSION['w_status_id'])) {

      

        $reservation_id = $_SESSION['w_status_id'];

        $lib->db->delete_row("fiz_reservation", $reservation_id);
        $lib->db->delete_data("fiz_reservation_users_xref", "reservation_id='" . $reservation_id . "'");

        $msgid = $data["edit_new_template"];
    }


    $scatdata = $lib->db->get_row("com_html", "*", "id='" . $msgid . "'");


    $body = $scatdata['my_body'];


    $resData = array(
        "reservation_id" => $reservation_id,
        "email" => $dataSesstion['email'],
        "mobile" => $dataSesstion['mobile'],
        "airport_pickup" => $dataSesstion['airport_pickup'],
        "booking_owner" => $_SESSION['razaOwnerID'],
        "remarks" => $dataSesstion['remarks']
    ); //$_SESSION['razaOwnerID'] 
//print_R($resData);

    $lib->db->insert_row("fiz_reservation", $resData);

    $maxData = $lib->db->get_maxrow("fiz_reservation");

    $r = $lib->language->updateText($body, $maxData);
    foreach ($dataGuests as $g) {


        $userData = $lib->coms->faiz->getUserDataByMumin_id($g['Mumin_id']);
        //   echo $dataSesstion['arrival_time'];
        //print_R($dataSesstion);
        $xrefData = array(
            "reservation_id" => $maxData['id'],
            "user_id" => $userData['user_id'],
            "airline" => $dataSesstion['airline'],
            "airline_code" => $dataSesstion['airline_code'],
            "its_id" => $g['Mumin_id'],
            "arriving_from" => $dataSesstion['arriving_from'],
            "arrival_time" => $dataSesstion['arrival_time'],
            "arrival_date" => $g['ex_checkin']
            , "departure_date" => $g['ex_checkout']
        );




        print_r($xrefData);


        $lib->db->insert_row("fiz_reservation_users_xref", $xrefData);
    }


      unset($_SESSION['faiz-new-reservation']);
      unset($_SESSION['faiz-new-reservation']['guests']);
      unset($_SESSION['w_status']);


    return $r;
}
?>


