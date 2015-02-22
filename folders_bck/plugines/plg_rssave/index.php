<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

function plg_rssave($pro) {
    /* @var $lib  libs\libs */
    global $lib;




    $_SESSION[$pro['saveform']]['checkin'] = $lib->util->dateTodb($_SESSION[$pro['saveform']]['checkin']);
    $_SESSION[$pro['saveform']]['checkout'] = $lib->util->dateTodb($_SESSION[$pro['saveform']]['checkout']);



    $datasql = $lib->db->insert_row('com_reservations', $_SESSION[$pro['saveform']]);





    $m = $lib->db->get_row('com_reservations', 'max(id) as m ');
    $r_id = $m['m'];



    $_SESSION[$pro['saveform']]["res_id"] = $r_id;



    $datasql = $lib->db->insert_row('com_reservations_data', $_SESSION[$pro['saveform']]);





    $m = $lib->db->get_row('com_reservations_data', 'max(id) as m ');
    $d_id = $m['m'];




    $adults_jid = $_SESSION [$pro['saveform']]['adults_jid'];
    $adults_name = $_SESSION[$pro['saveform']]['adults_name'];
    $adults_age = $_SESSION[$pro['saveform']]['adults_age'];
    $adults_gender = $_SESSION[$pro['saveform']]['adults_gender'];





    for ($i = 0; $i < count($adults_name); $i++) {


        $data = array(
            
            
               "data_id" => $d_id,
            "r_id" => $r_id,
            "type" => "adult",
            "ejamaat" => $adults_jid[$i],
            "name" => $adults_name[$i],
            "age" => $adults_age[$i],
            "gender" => $adults_gender[$i],
        );



        $datasql = $lib->db->insert_row('com_reservations_gustes', $data);
    }

    $childs_age = $_SESSION[$pro['saveform']]['childs_age'];
    $childs_jid = $_SESSION[$pro['saveform']]['childs_jid'];
    $childs_name = $_SESSION[$pro['saveform']]['childs_name'];
    $childs_gender = $_SESSION[$pro['saveform']]['childs_gender'];

    for ($i = 0; $i < count($childs_name); $i++) {
        $data = array(
                 "data_id" => $d_id,
            "r_id" => $r_id,
            "type" => "child",
            "ejamaat" => $childs_jid[$i],
            "name" => $childs_name[$i],
            "age" => $childs_age[$i],
            "gender" => $childs_gender[$i],
        );

        $datasql = $lib->db->insert_row('com_reservations_gustes', $data);
    }


    $infant_gender = $_SESSION[$pro['saveform']]['infant_gender'];
    $infant_jid = $_SESSION[$pro['saveform']]['infant_jid'];
    $infant_name = $_SESSION[$pro['saveform']]['infant_name'];
    $infant_age = $_SESSION[$pro['saveform']]['infant_age'];

    for ($i = 0; $i < count($infant_name); $i++) {
        $data = array(
                 "data_id" => $d_id,
            "r_id" => $r_id,
            "type" => "infant",
            "ejamaat" => $infant_jid[$i],
            "name" => $infant_name[$i],
            "age" => $infant_age[$i],
            "gender" => $infant_gender[$i],
        );

        $datasql = $lib->db->insert_row('com_reservations_gustes', $data);
    }

    return $retdata;




    // com_reservations_gustes
}

?>
