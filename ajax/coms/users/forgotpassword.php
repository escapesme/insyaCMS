<?php

$email = $_GET['email'];
/* @var $lib  \libs\libs */
global $lib;




$link = "components/com_users/";
$lang = $lib->util->getLanguageFile($link . $lib->util->siteSetting['lang']);



$sid = "";

if (isset($_GET['settings_id'])) {

    $sid = " id=" . $_GET['settings_id'];
} else {
    $sid = "";
}
$e = $lib->db->get_row("com_users_settings", "*", $sid);







$newpassword = $lib->users->forgotpassword($email);




if ($newpassword == false) {
    echo ".forgotpassword_errormsg";
} else {
    echo ".forgotpassword_sendmsg";
    
    $lang["password"]=$newpassword;
    // sendHTMLMail($emails, $HTMLID, $subject, $formlabel, $formmail, $dataVars) 
    
    
    
   
        
        
    
    $lang['myimagesurl'] = $lib->util->siteSetting['site_link'] . "/templates/style/css/images/";
    $lang['myUploadsimagesurl'] = $lib->util->siteSetting['site_link'] . "/uploads/images/";
    $lib->util->sendHTMLMail($email . ";" . $e['mailto'],   $e['forgotpassword_mail'],$e['forgotpassword_mailsubject'], $e['forgotpassword_mailfrom'], $e['forgotpassword_mailfrommail'], $lang);
}   


