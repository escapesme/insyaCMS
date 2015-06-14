<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function fiz_saveReservation($data, $lang, $p) {

    /* @var $lib  \libs\libs */
    global $lib;

    $dataSesstion = $_SESSION['faiz-new-reservation'];

    $dataGuests = $_SESSION['faiz-new-reservation']['guests'];
    $msgid = $data["email_new_template"];
    $reservation_id = $lib->coms->faiz->createReservationID();







    if (isset($_SESSION['w_status']) && $_SESSION['w_status'] == "edit" && isset($_SESSION['w_status_id'])) {
        $resData = array(
            "email" => $dataSesstion['email'],
            "mobile" => $dataSesstion['mobile'],
            "airport_pickup" => $dataSesstion['airport_pickup'],
            "booking_owner" => $_SESSION['razaOwnerID'],
            "remarks" => $dataSesstion['remarks']
        );
        $maxData = $lib->db->get_row("fiz_reservation", "*", "id='" . $_SESSION['w_status_id'] . "'");
        $reservation_id = $maxData['reservation_id'];
        $msgid = $data["edit_new_template"];
        $lib->db->update_data("fiz_reservation", $resData, "id='" . $_SESSION['w_status_id'] . "'");
        $lib->db->delete_data("fiz_reservation_users_xref", "reservation_id='" . $_SESSION['w_status_id'] . "'");
    } else {


        $resData = array(
            "reservation_id" => $reservation_id,
            "email" => $dataSesstion['email'],
            "mobile" => $dataSesstion['mobile'],
            "airport_pickup" => $dataSesstion['airport_pickup'],
            "booking_owner" => $_SESSION['razaOwnerID'],
            "remarks" => $dataSesstion['remarks']
        );


        $lib->db->insert_row("fiz_reservation", $resData);
        $maxData = $lib->db->get_maxrow("fiz_reservation");
    }

    $scatdata = $lib->db->get_row("com_html", "*", "id='" . $msgid . "'");


    $body = $scatdata['my_body'];


    $r = $lib->language->updateText($body, $maxData);
    $is = 0;
    foreach ($dataGuests as $g) {


        $userData = $lib->coms->faiz->getUserDataByMumin_id($g['Mumin_id']);

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
            , "departure_date" => $g['ex_checkout']
            , "country" => $g['country']
            , "passport_file" => $g['passport_file']
            , "visa_file" => $g['visa_file']
            , "document_status" => $g['document_status']
        );




        $lib->db->insert_row("fiz_reservation_users_xref", $xrefData);
    }


    $ressettings = $lib->db->get_row("fiz_reservation_settings");












// <editor-fold defaultstate="collapsed" desc="Email">



    $ejs = explode(",", $_SESSION['faiz-new-reservation']['Mumin_ids']);




    $n = $_SESSION["faiz-new-reservation"];
    $g = $_SESSION["guests"];
    $url = "http://new.faizehaakimi.com/";












    $n['res-id'] = sprintf("%04s", $reservation_id);




    if (trim($n['airport_pickup']) == "1") {

        $n['airport_pickup'] = "Yes";
    } else {
        $n['airport_pickup'] = "No";
    }

    $n['owner-name'] = "";









    $n['table-data'] = '
<table style="width: 100%; border-collapse: collapse;">
<tbody>
<tr style="background: #d9d0c4;">
<td style="border: 2px #d0bfac solid; padding: 20px 5px; border-right: none;"><span style="color: #9f3500;">SNo</span></td>
<td style="border: 2px #d0bfac solid; padding: 20px 5px; border-left: none; border-right: none;"><span style="color: #9f3500;">ITS ID</span></td>
<td style="border: 2px #d0bfac solid; padding: 20px 5px; border-left: none; border-right: none;"><span style="color: #9f3500;">Name</span></td>
<td style="border: 2px #d0bfac solid; padding: 20px 5px; border-left: none; border-right: none;"><span style="color: #9f3500;">Airport Clearance</span></td>
<td style="border: 2px #d0bfac solid; padding: 20px 5px; border-left: none; border-right: none;"><span style="color: #9f3500;">Document Status</span></td>
<td style="border: 2px #d0bfac solid; padding: 20px 5px; border-left: none;"><span style="color: #9f3500;">Lawazim</span></td>
</tr>';









    $approved_status = explode(",", $_SESSION['approved_status']);
    $document_status = explode(",", $_SESSION['faiz-new-reservation']['document_status']);




    $i = 0;

    foreach ($ejs as $ej) {
        $no++;
        //  $ejdata = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $ej . ";getType__data");
        //   echo "<br/>" . $ej . "<br/>";
        $ejdata = $lib->coms->faiz->getUserDataByMumin_id($ej);

        if ($ejdata['Age'] > 12) {
            $type = "Adult";
            $types = "a";
        } else if ($ejdata['Age'] < 2) {
            $types = "f";
            $type = "Infant";
        } else if ($ejdata['Age'] < 12) {
            $types = "c";
            $type = "Child";
        }


        $nights = $n['nights'];


        if ($n['owner-name'] == "") {
            $n['owner-name'] = $ejdata['FullName'];
        }
        if (!isset($approved_status[$i])) {
            $approved_status[$i] = 0;
        }
        $Status = $lib->db->get_row("fiz_approved_status", "*", "id='" . $approved_status[$i] . "'")['title'];




        $document_statusTitle = $lib->db->get_row("fiz_document_status", "*", "id='" . $document_status[$i] . "'")['name'];


        $pkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $nights . ";type__" . $types);

        $n['table-data'] .= ' <tr style="background:#d9d0c4 ;font-size: 13px;">
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-right:none"><span style="color:#9f3500"></span>' . $no . ' </td>
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;border-right:none"><span style="color:#9f3500"></span>' . $ej . '</td>
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;border-right:none"><span style="color:#9f3500"></span>' . $ejdata['FullName'] . ' </td>
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;border-right:none"><span style="color:#9f3500"></span>' . $Status . '</td>    
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;border-right:none"><span style="color:#9f3500"></span> ' . $document_statusTitle . '</td>    
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;"><span style="color:#9f3500"></span>' . $lang['currency'] . $pkgData['0'] . ' </td>    
                        </tr> 

';



        $llLawazim +=$pkgData['0'];
        $i++;
    }




    $n['table-data'] .= '     <tr style="background:#d9d0c4">
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-right:none"><span style="color:#9f3500"></span> </td>    
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;border-right:none"><span style="color:#9f3500"></span> </td> 
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;border-right:none"><span style="color:#9f3500"></span> </td>    
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;border-right:none"><span style="color:#9f3500"></span> </td>    
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;border-right:none"><span style="color:#9f3500">Total</span> </td>  
                            <td style="border:2px #d0bfac solid;padding:20px 5px;border-left:none;"><span style="color:#9f3500"></span> ' . $lang['currency'] . $llLawazim . '</td>    

                        </tr></tbody>
</table> ';










    $email = $ressettings['email_new_template'];

    if (isset($_SESSION['w_status']) && $_SESSION['w_status'] == "edit" && isset($_SESSION['w_status_id'])) {

        $email = $ressettings['email_edit_template'];
    }










    $lib->util->emails->sendmailBytemplate($dataSesstion['email'], $email, $n); // </editor-fold>



    unset($_SESSION['faiz-new-reservation']);
    unset($_SESSION['faiz-new-reservation']['guests']);
    unset($_SESSION['w_status']);


    return $r;
}
?>


