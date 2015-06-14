<?php

session_start();
/* @var $lib  libs\libs */
global $lib;


$oid = $_SESSION['razaOwnerID'];


session_start();



if ($_GET['status'] == "get_files") {

    $file = $_GET['file'];
    $data = $lib->db->get_row("fiz_reservation_users_xref", "*", "id='" . $_GET['id'] . "'");
    $files = explode(",", $data['files']);
    $r = "<table class='mainTabel'>";
    foreach ($files as $f) {
        if ($f != "") {
            $r .= "<tr><td><a target=\"_blank\" href='/uploads/userdocs/$f'>$f</a></td><td><input type='button' data-id='" . $_GET['id'] . "'   data-name='$f' value='Delete' class='delete_file' /></td></tr>";
        }
    }
    $r .= "</table>";
    echo $r;
} else if ($_GET['status'] == "delete_files") {

    $file = $_GET['name'];

    $data = $lib->db->get_row("fiz_reservation_users_xref", "*", "id='" . $_GET['id'] . "'");
    $newfile = str_replace($file . ",", "", $data['files']);

    $newfile = str_replace($file, "", $newfile);

    $saveArray = array(
        "files" => $newfile
    );
    $lib->db->update_row("fiz_reservation_users_xref", $saveArray, $_GET['id']);
} else if ($_GET['status'] == "getgdata") {
    $data = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id='" . $_GET['value'] . "'");
    $r .= "<table class='maintabel'>"
            . "<thead><tr><th>ITS ID</th><th>Name</th></tr></thead>"
            . ""
            . ""
            . "<tbody>";
    foreach ($data as $d) {
        $userData = $lib->coms->faiz->getUserDataByID($d['user_id']);
        $approved_status = $lib->db->get_row("fiz_approved_status", "*", "id='" . $d['approved_status'] . "'");
        $r .= "<tr><td>" . $userData['Mumin_id'] . "</td><td>" . $userData['name'] . "</td></tr>";
    }
    //$r .= getreRows($udata['user_id'], $ids);
    $r .= "</tbody>";
    $r .= "</table>";
    echo $r;
} else if ($_GET['status'] == "add_files") {



    $file = $_GET['name'];

    $data = $lib->db->get_row("fiz_reservation_users_xref", "*", "id='" . $_GET['id'] . "'");


    $newfile = str_replace($file . ",", "", $data['files']);

    $newfile = str_replace($file, "", $newfile);




    $saveArray = array(
        "files" => $newfile . $file . ","
    );




    $lib->db->update_row("fiz_reservation_users_xref", $saveArray, $_GET['id']);
} else if ($_GET['status'] == "update_counect") {
    $saveArray = array(
        "email" => $_GET['email']
    );
    if (isset($_GET['mobile'])) {
        $saveArray['mobile'] = $_GET['mobile'];
    }
    $lib->db->update_row("fiz_reservation", $saveArray, $_GET['rid']);
} else if ($_GET['status'] == "raza_change") {
    $saveArray = array(
        "raza_type" => $_GET['rtpy']
    );
    if (isset($_GET['host_its_id'])) {
        $saveArray['host_its_id'] = $_GET['host_its_id'];
    }
    $lib->db->update_row("fiz_reservation", $saveArray, $_GET['rid']);
} else if ($_GET['status'] == "raza_delete") {

    $u = $lib->db->delete_row("fiz_reservation_users_xref", $_GET['value']);
} else if ($_GET['status'] == "raza_new") {


    global $lib;


    if (isset($_GET['value']) && $_GET['value']) {

        $userdata = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['value'] . ";getType__data");

        if ($userdata['FullName']) {

            $id = $lib->coms->faiz->saveUser($userdata);
            $userdata = $lib->coms->faiz->getUserDataByMumin_id($_GET['value']);
        }
    } else {

        $userdata = $lib->coms->faiz->getUserDataByID($_SESSION['razaOwnerID']);
    }




    if (is_array($userdata)) {

        if (isset($_GET['rid'])) {
            $rid = $_GET['rid'];
        } else {

            $reservation_id = $lib->coms->faiz->createReservationID();
            $resData = array(
                "reservation_id" => $reservation_id,
                "email" => $userdata['email'],
                "mobile" => $userdata['mobile'],
                "booking_owner" => $_SESSION['razaOwnerID'],
                "raza_type" => $_GET['rtpy'],
                "country" => $_GET['country']
            );

            $lib->db->insert_row("fiz_reservation", $resData);
            $maxData = $lib->db->get_maxrow("fiz_reservation");
            $rid = $maxData['id'];
        }


        $xrefData = array(
            "reservation_id" => $rid,
            "user_id" => $userdata['id'],
            "its_id" => $userdata['Mumin_id']
        );
//        print_r($xrefData);


        $lib->db->insert_row("fiz_reservation_users_xref", $xrefData);
    }
} else if ($_GET['status'] == "updateTable") {


    $resids = array();
    $myxrefData = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $_GET['res_id'] . "'");

    $r .= "";


    $lib->forms->filds = array(
        "addits" => array(
            "type" => "text",
            "name" => "addits", "class" => "addits",
            "title" => "Add more persons to your group. ITS NO ", "pclass" => '_75'
        ),
        "country" => array(
            "type" => "select",
            "select_type" => "countries",
            "name" => "country",
            "title" => "country", "pclass" => '_75'
        ),
        "button" => array(
            "type" => "button",
            "name" => "add_button",
            "value" => "Add"
            , "pclass" => '_50'
            , "class" => 'add_button'
            , "moreAttra" => "data-res_id='" . $_GET['res_id'] . "'"
        )
    );



    $out_data = $lib->forms->_render_form();
    foreach ($myxrefData as $d) {


        $userData = $lib->coms->faiz->getUserDataByID($d['user_id']);

        $approved_status = $lib->db->get_row("fiz_approved_status", "*", "id='" . $d['approved_status'] . "'");

        $r .= "<tr><td>" . $userData['Mumin_id'] . "</td><td>" . $userData['name'] . "</td><td> " . $approved_status['title'] . "</td><td> " . $d['country'] . "</td><td>"
                . "<input type='button' data-show='updatefiles' data-name='" . $userData['name'] . "''  data-id='" . $d['id'] . "'' value='Upload' class='upload_filesdata' />"
                . "<input type='button' data-name='" . $userData['name'] . "''  data-id='" . $d['id'] . "'' value='delete' class='deleteej_bt' /></td></tr>";
    }
    //$r .= getreRows($udata['user_id'], $ids);
    $r .= "<tr><td colspan = \"4\" >$out_data<div></div></td></tr>"
            . "";

    echo $r;
}


// <editor-fold defaultstate="collapsed" desc="temp">
else if ($_GET['status'] == "getits") {


    /* @var $lib  \libs\libs */
    global $lib;
    $data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['value'] . ";getType__data");






    if ($data['FullName']) {
        $id = $lib->coms->faiz->saveUser($data);



        $u = $lib->db->get_row("fiz_reservation_users_xref", "*", "user_id='" . $id . "'");

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
}// </editor-fold>
else if ($_GET['status'] == "lgoin") {
    global $lib;
    $data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['value'] . ";getType__data");

    $_SESSION['razaOwnerID'] = "276";

    /*


      if ($data['FullName']) {
      $_SESSION['razaOwnerID'] = $lib->coms->faiz->saveUser($data);
      } else {

      echo "0";
      } */
}

// <editor-fold defaultstate="collapsed" desc="gen">
else if ($_GET['status'] == "updatepkg") {


    $rdatas = $_SESSION['formraza'];



    foreach ($rdatas as $data) {

        $lazim = $lib->plugins->importPlugin("fiz_lawazim_packages", "p_cat_id__" . $_GET['id'] . ";nights__" . $data['ex_nights'] . ";type__Adult;new__1");


        $_SESSION['formraza'][$data['id']] = array_merge($data, $lazim);
    }
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
} elseif ($_GET['status'] == "editres") {

    unset($_SESSION['reservation_document']);
    $rdata = $lib->db->get_row("fiz_reservation", "*", "id='" . $_GET['rid'] . "'");
    $xrdata = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id='" . $_GET['rid'] . "'");

    $ids = "";
    $country = "";
    foreach ($xrdata as $d) {
        if ($d['its_id'] != "") {

            $mm = ",";
            if ($ids == "") {

                $mm = "";
            }
            $country .=$mm . $d['country'];
            $ids .=$mm . $d['its_id'];
            $xid .=$mm . $d["id"];

            $approved_status = $mm . $d['approved_status'];
        }
    }

    $array = array_merge($rdata, $xrdata[0]);

    $_SESSION['w_status'] = "edit";
    $_SESSION['w_status_id'] = $_GET['rid'];
    $_SESSION['faiz-new-reservation'] = $array;
    $_SESSION['faiz-new-reservation']['country'] = $country;

    $_SESSION['approved_status'] = $approved_status;


    $_SESSION['faiz-new-reservation']['xrefids'] = $xid;
    $_SESSION['faiz-new-reservation']['Mumin_ids'] = $ids;
    $_SESSION['faiz-new-reservation']['checkin'] = $lib->util->dateTime->dateFromdb($array['arrival_date']);
    $_SESSION['faiz-new-reservation']['checkout'] = $lib->util->dateTime->dateFromdb($array['departure_date']);


    print_r($_SESSION);
} elseif ($_GET['status'] == "deleteres") {

    $lib->db->delete_row("fiz_reservation", $_GET['rid']);
    $lib->db->delete_data("fiz_reservation_users_xref", "reservation_id='" . $_GET['rid'] . "'");
} elseif ($_GET['status'] == "newres") {



    unset($_SESSION['reservation_document']);

    unset($_SESSION['visa_file']);

    unset($_SESSION['passport_file']);




    unset($_SESSION['faiz-new-reservation']);
    unset($_SESSION['w_status']);
    unset($_SESSION['w_status_id']);
    unset($_SESSION['faiz-new-reservation']['document_status']);

    $odata = $lib->coms->faiz->getUserDataByID($_SESSION['razaOwnerID']);
    $_SESSION['faiz-new-reservation']['Mumin_ids'] = $odata['Mumin_id'];
    $_SESSION["faiz-new-reservation"]['email'] = $odata['email'];
    $_SESSION["faiz-new-reservation"]['mobile'] = $odata['MOBILE_NO'];
    $_SESSION["faiz-new-reservation"]['checkin'] = date('d/m/Y'); // date_format($date, );// "31/05/2015";
    $_SESSION["faiz-new-reservation"]['checkout'] = date('d/m/Y');
} elseif ($_GET['status'] == "logoures") {

    $_SESSION['razaOwnerID'] = "";
    $_SESSION['formraza'] = "";
} elseif ($_GET['status'] == "visa_file") {
    if ($_GET['save_status'] == "session") {



        $_SESSION['visa_file'][$_GET['id']] .= $_GET['name'] . ",";
    } else {
        $d = $lib->db->get_row("fiz_reservation_users_xref", "*", "id=" . $_GET['id']);
        $saveArray = array(
            "visa_file" => $_GET['name'] . "," . $d['visa_file']
        );
        $lib->db->update_row("fiz_reservation_users_xref", $saveArray, $_GET['id']);
    }
} elseif ($_GET['status'] == "passport_file") {


    if ($_GET['save_status'] == "session") {

        $_SESSION['passport_file'][$_GET['id']] .= $_GET['name'] . ",";
    } else {


        $d = $lib->db->get_row("fiz_reservation_users_xref", "*", "id=" . $_GET['id']);
        $saveArray = array(
            "passport_file" => $_GET['name'] . "," . $d['passport_file']
        );
        $lib->db->update_row("fiz_reservation_users_xref", $saveArray, $_GET['id']);
    }


    print_R($_SESSION);
}
// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Doucments">
elseif ($_GET['status'] == "getvisa_file") {

    if ($_GET['save_status'] == "session") {
        echo $_SESSION['visa_file'][$_GET['id']];
    } else {
        $d = $lib->db->get_row("fiz_reservation_users_xref", "*", "id=" . $_GET['id']);
        echo $d['visa_file'];
    }
} elseif ($_GET['status'] == "getpassport_file") {

    if ($_GET['save_status'] == "session") {
        echo $_SESSION['passport_file'][$_GET['id']];
    } else {
        $d = $lib->db->get_row("fiz_reservation_users_xref", "*", "id=" . $_GET['id']);
        echo $d['passport_file'];
    }
} elseif ($_GET['status'] == "delpassport_file") {
    if ($_GET['save_status'] == "session") {

        $_SESSION['passport_file'][$_GET['id']] = str_replace($_GET['name'], "", $_SESSION['passport_file'][$_GET['id']]);
        echo updateDocStatus($_GET['datastatus'], $_GET['type'], $_GET['id'], $_GET['size']);
    } else {

        $d = $lib->db->get_row("fiz_reservation_users_xref", "*", "id=" . $_GET['id']);
        $saveArray = array(
            "passport_file" => str_replace($_GET['name'], "", $d['passport_file'])
        );
        $lib->db->update_row("fiz_reservation_users_xref", $saveArray, $_GET['id']);
    }
} elseif ($_GET['status'] == "delvisa_file") {
    if ($_GET['save_status'] == "session") {

        // echo $_SESSION['visa_file'][$_GET['id']];


        $_SESSION['visa_file'][$_GET['id']] = str_replace($_GET['name'], "", $_SESSION['visa_file'][$_GET['id']]);

        echo updateDocStatus($_GET['datastatus'], $_GET['type'], $_GET['id'], $_GET['size']);
    } else {


        $d = $lib->db->get_row("fiz_reservation_users_xref", "*", "id=" . $_GET['id']);
        $saveArray = array(
            "visa_file" => str_replace($_GET['name'], "", $d['visa_file'])
        );
        $lib->db->update_row("fiz_reservation_users_xref", $saveArray, $_GET['id']);
    }
} elseif ($_GET['status'] == "clear_reservation_documet") {

    unset($_SESSION['reservation_document']);
} elseif ($_GET['status'] == "gtexrefids") {
    echo $_SESSION['faiz-new-reservation']['xrefids'];
} elseif ($_GET['status'] == "setdocument_status") {
    echo updateDocStatus($_GET['datastatus'], $_GET['type'], $_GET['id'], $_GET['size']);
}
// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="country">
elseif ($_GET['status'] == "getcuntry") {
    echo $_SESSION['faiz-new-reservation']['country'];
} elseif ($_GET['status'] == "set_reservation_documet") {
    echo $_SESSION['reservation_document'] = $_GET['rid'];
}// </editor-fold>

function updateDocStatus($datastatus, $type, $id) {



    /* @var $lib  libs\libs */
    global $lib;
    $visa_files = explode(",", $_SESSION['visa_file'][$id]);

    $passport_files = explode(",", $_SESSION['passport_file'][$id]);



    $visa_files = array_filter($visa_files);

    $passport_files = array_filter($passport_files);






    $dstatus = "1";


    if ($datastatus == "ppOnly") {



        if (count($passport_files) > 0) {
            $dstatus = "2";
        }
    } else {

        if (count($visa_files) > 0 && count($passport_files) > 0) {
            $dstatus = "2";
        }
    }
    $_SESSION['faiz-new-reservation']['document_status'][$id] = $dstatus;
    return $lib->db->get_row("fiz_document_status", "*", "id='" . $dstatus . "'")['name'];
}
