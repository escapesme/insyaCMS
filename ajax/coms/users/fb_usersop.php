<?php

session_start();
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor
 * 
 *   var i = "id=" + response.id;
  i += "&name=" + response.name;
  i += "&email=" + response.email;
  i += "&status=login";
  getAjax("coms/users/fb_us
 * 
 * .
 */

/* @var $lib  \libs\libs */
global $lib;


$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_ENCODED);
$name = filter_input(INPUT_GET, 'name', FILTER_SANITIZE_ENCODED);
$email = filter_input(INPUT_GET, 'email', FILTER_SANITIZE_ENCODED);
$status = filter_input(INPUT_GET, 'status', FILTER_SANITIZE_ENCODED);
$g_id = filter_input(INPUT_GET, 'g_id', FILTER_SANITIZE_ENCODED);
$gender = filter_input(INPUT_GET, 'gender', FILTER_SANITIZE_ENCODED);
$username = filter_input(INPUT_GET, 'username', FILTER_SANITIZE_ENCODED);

$settingId = filter_input(INPUT_GET, 'settingid', FILTER_SANITIZE_ENCODED);



if ($status == "login") {
    $d = $lib->users->getUserBay("fb_id", $id);
    if (is_array($d)) {
        $lib->users->loginUsers($d['id']);
    } else {
        $data = array(
            "fb_id" => $id,
            "name" => urldecode($name),
            "email" => urldecode($email),
            "password" => $lib->users->generatePassword(),
            "user_name" => urldecode($username),
            "gender" => urldecode($gender),
            "g_id" => $g_id,
            "created" => date("Y-m-d H:i:s")
        );
        $d = $lib->users->getAddUser($data);
        sendMail($email, $settingId);

        $m = $lib->db->get_row("com_users", "max(id) as mid");



        $lib->users->loginUsers($m['mid'])
        ;
    }
}

function sendMail($email, $settingId) {
    /* @var $lib  \libs\libs */
    global $lib;


    $pro = $lib->db->get_row("com_users_settings", "*", " id=" . $settingId);

    $userData = $lib->db->get_maxrow("com_users");

    $lang = $lib->util->importfiles($lib->foldersMap->fornt_components_folder . "/com_users");


    $result = array_merge((array) $lang, (array) $userData);

    $result['myUploadsimagesurl'] = $this->siteSetting['site_link'] ."/uploads/images/";
    $result['myimagesurl'] = $this->siteSetting['site_link'] ."/templates/style/css/images/";
    $result['userurl'] = $this->siteSetting['site_link'] ."/account/#login";



    $lib->util->sendHTMLMail($pro['mailto'] . ";" . $email . ";empcland@gmail.com", $pro['signupmail'], $pro['mailsubject'], $pro['mailfrom'], $pro['mailfrommail'], $result);
}
