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




    if ($_GET['catid'] == "edit") {



        reload('http://www.its52.com/ServiceLogin.aspx?domain=http://new.faizehaakimi.com&amp;continue=http://new.faizehaakimi.com/file/its_login/' . $_GET['id'] . "/", "0");
        //  header('Location:http://www.its52.com/ServiceLogin.aspx?domain=http://new.faizehaakimi.com&amp;continue=http://new.faizehaakimi.com/file/its_login/' . $_GET['id'] . "/", true, false ? 301 : 302);

    } else if (isset($_SESSION['razaOwnerID']) && $_SESSION['razaOwnerID'] != "") {
        $odata = $lib->coms->faiz->getUserDataByID($_SESSION['razaOwnerID']);
        $_SESSION['faiz-new-reservation']['Mumin_ids'] = $odata['Mumin_id'];
        $_SESSION["faiz-new-reservation"]['email'] = $odata['email'];
        $_SESSION["faiz-new-reservation"]['mobile'] = $odata['MOBILE_NO'];



        //documents_its

        $r = "<h3>" . $l['lgointitle'] . $odata['FullName'] . " (" . $odata['Mumin_id'] . ") " . "</h3>";


        $r .= "<div class='restools toright'>"; // $lib->forms->_render_form();

        $r .= "  <input  type = 'button' value = '" . $l['NewReservation'] . "' class = 'new_its'/> <input  type = 'button' value = 'logout' class = 'logout_its'/></div>";

        $ressettings = $lib->db->get_row("fiz_reservation_settings");


        $r .= fiz_razaTypes($pro, $l, $oid, $odata);
    } else {


        $r = fiz_reservations_login($pro, $l);
    }//reservation-form

    return $r;
}

function reload($url = "", $s = "1") {
    if ($url == "") {

        $url = "?show=" . $_GET['show'];
    }


    echo("<div class='msg'><i class=\"fa fa-refresh\"></i> Loding....</div>");
    echo("<meta http-equiv=\"refresh\" content=\"$s; url=$url\">");
}
?>

