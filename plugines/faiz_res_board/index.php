<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function faiz_res_board($data, $l) {
    /* @var $lib  \libs\libs */
    global $lib;
    if (isset($_SESSION['razaOwnerID']) && $_SESSION['razaOwnerID'] != "") {




        //  echo  $_SESSION['razaOwnerID'];


        $odata = $lib->coms->faiz->getUserDataByID($_SESSION['razaOwnerID']);



        $data .= "<h3>" . $l['lgointitle'] . $odata['FullName'] . " (" . $odata['Mumin_id'] . ") " . "</h3>";

     
        $data .= "<div class='restools toright'>" ;// $lib->forms->_render_form();

        $data .= "<a href=\"/rex/step/2/\" class=\"button\">".$l['NewReservation']."</a><a href=\"#\" class=\"button  logoutbt\">logout</a></div>";




        $ressettings = $lib->db->get_row("fiz_reservation_settings");


        $data .= fiz_razaTypes($pro, $l, $oid, $odata);
        ;
    } else {


        $data = fiz_reservations_login($pro, $l);
    }

    return $data;
}
?>


