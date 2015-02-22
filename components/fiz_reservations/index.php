<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */


global $ressettings;

function main($pro, $l) {
    global $lib, $ressettings;


    // $oid = "160";

    if (isset($_SESSION['razaOwnerID']) && $_SESSION['razaOwnerID'] != "") {
        $oid = $_SESSION['razaOwnerID'];

        $odata = $lib->db->get_row("com_users", "*", "id='" . $oid . "'");


        $data .= "<h3>" . $l['lgointitle'] . $odata['FullName'] . " (" . $odata['Mumin_id'] . ") " . "</h3>";

        $filds = array(
            "next_res" => array(
                "type" => "button",
                "pclass" => " _100",
                "class" => "next_res",
                "value" => $l['logoutsubmit'],
                "name" => "its_id"
                , "moreAttra" => "data-to='/FizReservations/' data-do='logout' "
            )
        );
        $lib->forms->filds = $filds;
        $data .= $lib->forms->_render_form();





        $ressettings = $lib->db->get_row("fiz_reservation_settings");




        switch ($_GET['do']) {

            case "create-raza":
                $data .= fiz_reservations_craeteData($pro, $l, $oid);
                break;
            case "view-raza":
                $data .= fiz_reservations_viewData($pro, $l, $oid);
                break;

            case "pkgs-raza":
                $data .= fiz_reservations_pkgs($pro, $l, $oid);
                break;

            case "send-raza":
            default :
                $data .= fiz_reservations_returnData($pro, $l, $oid);
                break;

            case "end-raza":

                $data .= fiz_reservations_endData($pro, $l, $oid);
                break;
        }
    } else {


        $data = fiz_reservations_login($pro, $l);
    }






    return $data;
}
?>


