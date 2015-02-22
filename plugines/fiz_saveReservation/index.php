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





    $A = 0;

    $I = 0;

    $C = 0;



    foreach ($dataGuests as $g) {


        $saveArray = array_merge($g, $_SESSION);
        $saveArray['user_id'] = saveUser($g);




        if ($_SESSION['faiz-new-reservation']['res_status'] == "edit") {

            $newResId = $_SESSION['faiz-new-reservation']['edit_id'];

            $lib->db->delete_data("fiz_reservation", "reservation_id ='" . $newResId . "'");
            $lib->db->delete_data("fiz_extension", "reservation_id ='" . $newResId . "'");
        } else {


            $newResId = createReservationID();
        }


        $saveArray['reservation_id'] = $newResId;





        if ($g['type'] == "Adult") {
            $A++;
            $newResId.="A" . $A;
        } else if ($g['type'] == "Child") {
            $C++;
            $newResId.="C" . $C;
        } else if ($g['type'] == "Infant") {
            $I++;

            $newResId.="I" . $I;
        }
        $saveArray['individual_id'] = $newResId;




        $lib->db->insert_row("fiz_reservation", $saveArray);


        $lib->db->insert_row("fiz_extension", $saveArray);
    }







    return $rdata;
}

function createReservationID() {
    /* @var $lib  \libs\libs */
    global $lib;
    $mdata = $lib->db->get_maxrow("fiz_reservation");


    $d = $mdata['reservation_id'];
    $d++;



    return sprintf("%04s", $d);
}

function saveUser($data) {

    /* @var $lib  \libs\libs */
    global $lib;

    $u = $lib->db->get_row("com_users", "*", "Mumin_id='" . $data['Mumin_id'] . "'");
    if (is_array($u)) {
        $lib->db->update_row("com_users", $data, $u['id']);

        $id = $u['id'];
    } else {

        $u = $lib->db->insert_row("com_users", $data);

        $rdata = $lib->db->get_row("com_users", "*", "Mumin_id='" . $data['Mumin_id'] . "'");
        $id = $rdata['id'];
    }


    return $id;
}
?>


