<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function main($pro, $lng) {

    /* @var $lib  \libs\libs */
    global $lib;


    $EJ = 30385155;

    $data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $EJ . ";getType__data");

    $userid = saveUser($data);





    $returnData.="<div class='toleft data toclear'><label>" . $lng['FullName'] . "</label> " . $data['FullName'] . "</div>"
            . "";
    $returnData .= "<div class='toleft  data toclear'><label>" . $lng['Mumin_id'] . "</label> " . $data['Mumin_id'] . "</div>";

    $returnData .= "<div class='toright'><a class='logout' href='/logout'>" . $lng['logout'] . "</a></div>";

    $returnData .= "<div class='toright'><a class='newres' data-seassionvalue='" . $userid . "'  data-seassionname='booking_owner'  >new</a></div>";


    $sqlData = $lib->db->get_data("fiz_reservation", "*", "booking_owner='" . $userid . "'  or user_id='" . $userid . "'");


    $returnData.="<table>";
    $returnData.="<tr><th>reservation_id</th><th>checkin</th><th>checkout</th><th>remarks</th></tr>";
    foreach ($sqlData as $s) {

        $exData = $lib->db->get_row("fiz_extension", "*", "reservation_id='" . $s['id'] . "'");


        $html = "<input class='button resdelete' type='button' value='delete' data-resid='" . $s['reservation_id'] . "' /><input class='button resedit'  data-resid='" . $s['reservation_id'] . "'  type='button' value='Edit'  />";

        $returnData.="<tr><td>" . $s['reservation_id'] . "</td><td>" . $exData['ex_checkin'] . "</td><td>" . $exData['ex_checkout'] . "</td><td>" . $s['remarks'] . "</td><td>" . $html . "</td></tr>";
    }

    $returnData.="</table>";
    // $returnData.= print_r(, true);






    return $returnData;
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



