<?php

session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$status = $_GET['status'];
global $lib;
$userData = $lib->users->getUser("all");

$link = "components/com_users/";
$lng = $lib->util->getLanguageFile($link . $lib->util->siteSetting['lang']);



$sid = "";

if (isset($_GET['settings_id'])) {

    $sid = " id=" . $_GET['settings_id'];
} else {
    $sid = "";
}
$e = $lib->db->get_row("com_users_settings", "*", $sid);


if ($status == "getData") {




    $data = "

<div><label>" . $lng['name'] . "</label> " . ($userData['name'] != null ? $userData['name'] : $lng['undefined']) . "</div>
<div><label>" . $lng['email'] . "</label> " . ($userData['email'] != null ? $userData['email'] : $lng['undefined']) . "</div>
<div><label>" . $lng['phone'] . "</label> " . ($userData['mobile'] != null ? $userData['mobile'] : $lng['undefined']) . "</div>
<div><label>" . $lng['gender'] . "</label> " . ($userData['gender'] != null ? $lng[$userData['gender']] : $lng['undefined'] ) . "</div>

<div><h3>" . $lng['address-label'] . "</h3> </div>




<div><label>" . $lng['street'] . "</label> " . ($userData['street'] != null ? $userData['street'] : $lng['undefined'] ) . "</div>
<div><label>" . $lng['building'] . "</label> " . ($userData['building'] != null ? $userData['building'] : $lng['undefined'] ) . "</div>

<div><label>" . $lng['floor'] . "</label> " . ($userData['floor'] != null ? $userData['floor'] : $lng['undefined'] ) . "</div>



<div><label>" . $lng['flat'] . "</label> " . ($userData['flat'] != null ? $userData['flat'] : $lng['undefined'] ) . "</div>



<div><label>" . $lng['shipping_note'] . "</label> " . ($userData['shipping_note'] != null ? $userData['shipping_note'] : $lng['undefined'] ) . "</div>




";
} else if ($status == "getUpdateData") {

    $data = updateFrom($lng, $userData);
} else if ($status == "getUpdatepassword") {


    $data = updatePassword($lng, $userData);
} else if ($status == "chkpassword") {


    $oldpass = md5($_GET['password']);



    if ($oldpass == $userData['password']) {

        $filds = array(
            "notmatchMsg" => array(
                "type" => "label",
                "title" => "<div class='info error'>&nbsp;" . $lng['chkpasswordnotmatchMessage'] . "</div>",
                "name" => "notmatchMsg",
                "class" => "hidden",
            ),
            "password" => array(
                "type" => "password",
                "title" => $lng['newpassword'],
                "name" => "password"
            )
            , "rpassword" => array(
                "type" => "password",
                "title" => $lng['rpassword'],
                "name" => "rpassword"
            ),
            "checkOldPassword" => array(
                "type" => "button",
                "value" => $lng['edit'],
                "name" => "updatePassword"
            )
        );


        $lib->forms->filds = $filds;
        $data = "<div class='updateData'>" . $lib->forms->_render_form() . "</div>";
    } else {

        $data = "<div class='info error'>&nbsp;" . $lng['chkpassworderrorMessage'] . "</div>" . updatePassword($lng, $userData);
    }
} else if ($status == "saveData") {


    $userData = $lib->users->getUser("all");

    if ($userData['mobile'] != $_GET['mobile']) {


        $_GET['mobile_confirm'] = "0";
    }
    $lib->db->update_row("com_users", $_GET, $_SESSION['login']);
    $data = "<div class='info success'>&nbsp;" . $lng['updateDataMsg'] . "</div>";

    // $data .= updateFrom($lng,$userData);
} else if ($status == "savepassword") {


    $_GET['password'] = md5($_GET['password']);
    $lib->db->update_row("com_users", $_GET, $_SESSION['login']);
    $data = "<div class='info success'>&nbsp;" . $lng['chkpasswordSuccessMessage'] . "</div>";
}//

echo $data;

function updatePassword($lng, $userData) {
    global $lib;
    $filds = array("oldpassword" => array(
            "type" => "password",
            "title" => $lng['oldpassword'],
            "name" => "oldpassword"
        ),
        "checkOldPassword" => array(
            "type" => "button",
            "value" => $lng['edit'],
            "name" => "checkOldPassword"
        )
    );




    $lib->forms->filds = $filds;
    $data = "<div class='updateData'>" . $lib->forms->_render_form() . "</div>";


    return $data;
}

function updateFrom($lng, $userData) {

    global $lib;


    $filds = array(
        "name" => array(
            "type" => "text",
            "title" => $lng['name'],
            "value" => $userData['name'],
            "name" => "name"
        ), "mobile" => array(
            "type" => "egphone",
            "title" => $lng['mobile'],
            "value" => $userData['mobile'],
            "name" => "mobile"
    ));


    $lib->forms->filds = $filds;
    $hdata = $lib->forms->_render_form();

    if ($userData['mobile_confirm'] == "1") {
        $filds = array(
            "mobile" => array(
                "type" => "label",
                "title" => $lng['mobile_confirm_msg'],
                "name" => "mobile",
                  "class" => "mobile_confirm_msg"
        ));


        $lib->forms->filds = $filds;
        $hdata .=$lib->forms->_render_form();
    } else {
        $filds = array(
            "mobile" => array(
                "type" => "label",
                "title" => $lng['mobile_not_confirm_msg'],
                "name" => "mobile",          "class" => "mobile_not_confirm_msg"
        ));


        $lib->forms->filds = $filds;
        $hdata .=$lib->forms->_render_form();
    }


    $filds = array(
        "gender" => array(
            "type" => "select",
            "title" => $lng['gender'],
            "value" => $userData['gender'],
            "name" => "street",
            "select_data" => array("male" => $lng['male'], "female" => $lng['female']),
        )
        , "street" => array(
            "type" => "text",
            "title" => $lng['street'],
            "value" => $userData['street'],
            "name" => "street"
        ), "building" => array(
            "type" => "text",
            "title" => $lng['building'],
            "value" => $userData['building'],
            "name" => "building"
        )
        , "floor" => array(
            "type" => "text",
            "title" => $lng['floor'],
            "value" => $userData['floor'],
            "name" => "floor"
        )
        , "flat" => array(
            "type" => "text",
            "title" => $lng['flat'],
            "value" => $userData['flat'],
            "name" => "flat"
        )
        , "shipping_note" => array(
            "type" => "text",
            "title" => $lng['shipping_note'],
            "value" => $userData['shipping_note'],
            "name" => "shipping_note"
        )
        , "submit" => array(
            "type" => "button",
            "value" => $lng['edit'],
            "name" => "submitUpdateData"
        )
    );




    $lib->forms->filds = $filds;
    $hdata.=  $lib->forms->_render_form();

    $data = "<div class='updateData'>" . $hdata . "</div>";

    return $data;
}

?>
