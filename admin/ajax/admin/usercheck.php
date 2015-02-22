<?php

/* @var $lib  \libs\libs */
global $lib;

session_start();



$link = "components/com_users/";

$lang = $lib->util->getLanguageFile($link . $lib->util->siteSetting['lang']);

        


if (isset($_GET['status']) && $_GET['status'] == "check") {

    $returnData = $lib->users->checklogin($_GET['email'], $_GET['password']);
    if ($returnData == "1") {
        $_SESSION['auto_email'] = $_GET['email'];
    }

    echo $returnData;
} else {
    $returnData = $lib->users->loginForm($lang);
    echo $returnData;
}