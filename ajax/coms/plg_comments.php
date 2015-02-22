<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();
/* @var $lib  \libs\libs */
global $lib;



$data = $_GET;




/* @var $lib  libs\libs */
global $lib;


$moreData = " limit " . $data["limitfrom"] . "," . $data["limitnumber"];


$sqlData = $lib->db->get_Data("plg_comments", "*", " ob_type='" . $data["ob_type"] . "' and  ob_id='" . $data["ob_id"] . "' " . $moreData);



$retuanData = "";


foreach ($sqlData as $s) {

    $more = "";

    $u = "";


    if ($data['users'] == "1") {


        $u = $lib->users->getUser("", $s['user_id']);

        if ($lib->users->isadmin($u['g_id']) == "1") {
            $more = "admin";
        }
    }






    $retuanData.="<div class='commentrow $more'>";
    if ($data['users'] == "1") {
        $s['com_name'] = $u['name'];
        $retuanData.="      <div class='com_img'><img  class='circle blur' src='" . $lib->foldersMap->fornt_upload_images . $u['image'] . "'  /> </div>";
    }
    $retuanData.="      <div class='com_name'>" . $s['com_name'] . "</div>
              <div class='com_date'><span>" . $data['datalang'] . "</span>" . $lib->util->dateTime->dateFromdb($s['created']) . "</div>
                      <div class='com_title h3'>" . $s['com_title'] . "</div>
                      <div class='com_message'>" . $s['com_message'] . "</div>"
            . "</div>";
}


echo $retuanData;
