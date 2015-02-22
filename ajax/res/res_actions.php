<?php

$status = $_GET['status'];
$resid = $_GET['resid'];
/* @var $lib  \libs\libs */
global $lib;
session_start();
$_SESSION['faiz-new-reservation'] = "";
switch ($status) {
    case "delete":




        // $reData = $lib->db->get_row("fiz_reservation", "*", "id='" . $resid);


        $lib->db->delete_data("fiz_reservation", "reservation_id ='" . $resid . "'");
        $lib->db->delete_data("fiz_extension", "reservation_id ='" . $resid . "'");


        break;
    case "edit":

        $reData = $lib->db->get_row("fiz_reservation", "*", "reservation_id ='" . $resid . "'");





        $exData = $lib->db->get_data("fiz_extension", "*", "reservation_id ='" . $resid . "'");



        $result = array_merge($reData, $exData[0]);


        $_SESSION['faiz-new-reservation'] = $result;



        foreach ($exData as $x) {

            $userData = $lib->db->get_row("com_users", "*", "id ='" . $reData['user_id'] . "'");
            $js = $userData['Mumin_id'] . ",";
        }
        $_SESSION['faiz-new-reservation']['Mumin_ids'] = $js;

        $_SESSION['faiz-new-reservation']['res_status'] = "edit";

        $_SESSION['faiz-new-reservation']['edit_id'] = $resid;


    default:
        break;
}
