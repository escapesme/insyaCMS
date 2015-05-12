



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
        $odata = $lib->coms->faiz->getUserDataByID($_SESSION['razaOwnerID']);
        $data .= "<div><h3>" . $l['lgointitle'] . $odata['FullName'] . " (" . $odata['Mumin_id'] . ") " . "</h3>";
        $data .= "<input  type = 'button' value = 'logout' class = 'logout_its'/>";

        $ressettings = $lib->db->get_row("fiz_reservation_settings");


        switch ($_GET['do']) {

            case "create":
                $data .= fiz_reservations_craeteData($pro, $l, $oid);
                break;
            case "view-raza":
                $data .= fiz_reservations_viewData($pro, $l, $oid);
                break;

            case "pkgs-raza":
                $data .= fiz_reservations_pkgs($pro, $l, $oid);
                break;

            case "send-raza":
            case "end-raza":

                $data .= fiz_reservations_endData($pro, $l, $oid);
                break;

            default :
                $data .= fiz_reservations_returnData($pro, $l, $oid, $odata);
                break;
        }
    } else {


        $data = fiz_reservations_login($pro, $l);
    }



    $data.="</div>";

    return $data;
}
?>


