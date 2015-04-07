<?php

session_start();
/* @var $lib  libs\libs */
global $lib;


$oid = $_SESSION['razaOwnerID'];


if ($_GET['status'] == "getits") {


    $data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['value'] . ";getType__data");




    /* @var $lib  \libs\libs */
    global $lib;


    if ($data['FullName']) {
        $id = $lib->coms->faiz->saveUser($data);



        $u = $lib->db->get_row("fiz_reservation", "*", "user_id='" . $id . "'");

        if (!is_array($u)) {

            $ds = $lib->db->get_row("fiz_reservation", "*", "booking_owner='" . $oid . "'");
            if (is_array($ds)) {
                $rid = $ds['reservation_id'];
            } else {

                $rid = $lib->coms->faiz->createReservationID();
            }

            $saveArray = array(
                "reservation_id" => $rid,
                "its_id" => $_GET['value'],
                "user_type" => $lib->coms->faiz->getGoustType($data),
                "raza_type" => $_GET['rtpy'],
                "booking_owner" => $oid,
                "email" => $data['email'],
                "mobile" => $data['MOBILE_NO'],
                "user_id" => $id
            );


            if (isset($_GET['host_its_id'])) {
                $saveArray['host_its_id'] = $_GET['host_its_id'];
            }

            $lib->db->insert_row("fiz_reservation", $saveArray);

            $rid = $lib->db->get_maxrow("fiz_reservation")['id'];

            echo "<tr data-rid='" . $rid . "'  ><td>" . $_GET['value'] . "</td><td>" . $data['FullName'] . "</td><td>Not Approved</td><td><input data-rid='" . $rid . "' type='button' value='delete' class='delete_its'/></td></tr>";
        } else {
            echo "-1";
        }
    } else {
        echo "0";
    }
} else if ($_GET['status'] == "logout") {
    $_SESSION['razaOwnerID'] = "";
    $_SESSION['formraza'] = "";
} else if ($_GET['status'] == "lgoin") {
    global $lib;

    $data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['value'] . ";getType__data");
   /* $data['Mumin_id'] = "30385154";
    $data['FullName'] = "16dasdasd0";
    
    */
    
    if ($data['FullName']) {
        $_SESSION['razaOwnerID'] = $lib->coms->faiz->saveUser($data);
    } else {

        echo "0";
    }
} else if ($_GET['status'] == "updatepkg") {


    $rdatas = $_SESSION['formraza'];



    foreach ($rdatas as $data) {

        $lazim = $lib->plugins->importPlugin("fiz_lawazim_packages", "p_cat_id__" . $_GET['id'] . ";nights__" . $data['ex_nights'] . ";type__Adult;new__1");


        $_SESSION['formraza'][$data['id']] = array_merge($data, $lazim);
    }
} elseif ($_GET['status'] == "deleteits") {
    $u = $lib->db->delete_row("fiz_reservation", "*", "id='" . $_GET['value'] . "'");
} elseif ($_GET['status'] == "changertype") {


    $saveArray = array(
        "raza_type" => $_GET['rtpy']
    );



    if (isset($_GET['host_its_id'])) {
        $saveArray['host_its_id'] = $_GET['host_its_id'];
    }


    $lib->db->update_row("fiz_reservation", $saveArray, "", "booking_owner='" . $oid . "'");
} elseif ($_GET['status'] == "clearsesstion") {



    $_SESSION['formraza'] = "";
} elseif ($_GET['status'] == "addtosesstion") {



    $_SESSION['formraza'][$_GET['id']] = $_GET;
} elseif ($_GET['status'] == "save") {







    $rdatas = $_SESSION['formraza'];
    foreach ($rdatas as $data) {



        if (isset($data['id'])) {
            $saveArray = $data;
            $saveArray['file'] = "";

            $lib->db->update_data("fiz_reservation", $saveArray, "id=" . $saveArray['id']);

            $rdata = $lib->db->get_row("fiz_reservation", "*", "id=" . $saveArray['id']);

            $saveArray['user_id'] = $rdata['user_id'];
            $saveArray['reservation_id'] = $saveArray['id'];

            $saveArray['ex_checkin'] = $lib->util->dateTime->dateTodb($saveArray['ex_checkin']);
            $saveArray['ex_checkout'] = $lib->util->dateTime->dateTodb($saveArray['ex_checkout']);

            $saveArray['id'] = "";


            $lib->db->delete_data("fiz_extension", "user_id='" . $saveArray['user_id'] . "'");
            $lib->db->insert_row("fiz_extension", $saveArray);
        }
    }
}
