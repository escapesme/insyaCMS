<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
global $lib;

$d = array(
    "email" => $_GET['email'],
    "group" => $_GET['group']
);

$lib->db->insert_row("com_newsLetter", $d);

$emails = array(
    "email" => $_GET['email'],
);

if ($_GET['emailTemplate'] != "") {


    $mData = $lib->db->get_data("com_mailsTemplates", "", "id=" . $_GET['emailTemplate']);







    $lib->util->sendMail($emails, $mData['body'], $mData['title'], $lib->config->siteTitle, $lib->config->siteEmail);
}
?>
