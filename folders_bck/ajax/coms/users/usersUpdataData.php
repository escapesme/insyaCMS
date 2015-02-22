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

<div><label>" . $lng['name'] . "</label> " . $userData['name'] . "</div>
<div><label>" . $lng['username'] . "</label> " . $userData['user_name'] . "</div>
<div><label>" . $lng['email'] . "</label> " . $userData['email'] . "</div>
<div><label>" . $lng['phone'] . "</label> " . $userData['phone'] . "</div>

";
} else if ($status == "getUpdateData") {


//getUpdatepassword
    $filds = array(
        "name" => array(
            "type" => "text",
            "title" => $lng['name'],
            "value" => $userData['name'],
            "name" => "name"
        ), "user_name" => array(
            "type" => "user_name",
            "title" => $lng['username'],
            "value" => $userData['user_name'],
            "name" => "user_name"
        ), "email" => array(
            "type" => "email",
            "title" => $lng['email'],
            "value" => $userData['email'],
            "name" => "email"
        ), "phone" => array(
            "type" => "phone",
            "title" => $lng['phone'],
            "value" => $userData['phone'],
            "name" => "phone"
        )
        , "submit" => array(
            "type" => "button",
            "value" => $lng['edit'],
            "name" => "submitUpdateData"
        )
    );




    $lib->forms->filds = $filds;
    $data = "<div class='updateData'>" . $lib->forms->_render_form() . "</div>";
} else if ($status == "getUpdatepassword") {


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
} else if ($status == "chkpassword") {


    $oldpass = md5($_GET['password']);



    if ($oldpass == $userData['password']) {

        $filds = array(
            "password" => array(
                "type" => "password",
                "title" => $lng['password'],
                "name" => "password"
            )
            , "rpassword" => array(
                "type" => "password",
                "title" => $lng['rpassword'],
                "name" => "rpassword"
            ),
            "checkOldPassword" => array(
                "type" => "button",
                "value" => "update",
                "name" => "updatePassword"
            )
        );


        $lib->forms->filds = $filds;
        $data = "<div class='updateData'>" . $lib->forms->_render_form() . "</div>";
    } else {

        $data = $e['errorMessage'];
    }
} else if ($status == "saveData") {



    $lib->db->update_row("com_users", $_GET, $_SESSION['login']);
    $data = $e['updatemsg'];
} else if ($status == "savepassword") {


    $_GET['password'] = md5($_GET['password']);
    $lib->db->update_row("com_users", $_GET, $_SESSION['login']);
    $data = $e['updatemsg'];
}

echo $data;
?>
