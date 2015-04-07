<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function getform($pro, $lng) {
    $data = "";
    global $lib;


    $recaptcha = $_POST['g-recaptcha-response'];
    if (isset($recaptcha)) {


        $google_url = "https://www.google.com/recaptcha/api/siteverify";
        $secret = '6Le-9wQTAAAAAOo4Olgxab6qC_V35nGnEbM5Q9vB';
        $ip = $_SERVER['REMOTE_ADDR'];
        $url = $google_url . "?secret=" . $secret . "&response=" . $recaptcha . "&remoteip=" . $ip;
        $res = getCurlData($url);
        $res = json_decode($res, true);


        if (isset($_POST['title']) && $res['success']) {
            $data .="<div class='msg success'>" . $lng['addmsg'] . "</div>";



            $lib->db->insert_row("com_gustbook", $_POST);
        } else if (!$res['success']) {
            $data .="<div class='msg error'>" . $lng['captchaError'] . "</div>";
        }
    }








    $en = "0";
    if ($pro['enabledMsgs'] == "1") {

        $en = "1";
    }


    $filds = array(
        "form" => array(
            "type" => "form",
            "method" => "post",
        ),
        "enabled" => array(
            "type" => "hidden",
            "id" => "enabled",
            "name" => "enabled",
            "value" => $en
        ), "title" => array(
            "type" => "text",
            "title" => $lng['name'],
            "name" => "title"
        ), "Country" => array(
            "type" => "text",
            "id" => "name",
            "title" => $lng['country'],
            "name" => "Country",
        ), "comment" => array(
            "type" => "textarea",
            "title" => $lng['comment'],
            "name" => "comment",
        ), "captcha" => array(
            "type" => "captcha",
            "id" => "captcha",
        ), "submit" => array(
            "type" => "submit",
            "value" => $lng['submit'],
            "name" => "submit",
        ),
        "endForm" => array(
            "type" => "endForm",
        ),
    );
    $lib->forms->filds = $filds;
    $data.="<div class='gustbook'>" . $lib->forms->_render_form() . "<div class='clearfix'></div></div>";













    return $data;
}

function getmessages($pro, $lng) {
    $rowNumbers = "6";

    global $lib;

    /*
      if ($pro['nums'] != null) {
      $rowNumbers = $pro['nums'];
      } */

    if (isset($_GET['page'])) {
        $rowFrom = $_GET['page'];
    } else {
        $rowFrom = "0";
    }

    $llnum = $lib->db->get_data('com_gustbook', '', "1=1");

    $datasql = $lib->db->get_data('com_gustbook', '', "1=1  order by `order` limit " . $rowFrom . "," . $rowNumbers);



    foreach ($datasql as $d) {
        $retData.="<div class='comment-block'>
                   <div class='comment-text'>" . $d['comment'] . "</div>
                  
                   <div class='comment-info'>
                   <div class='comment-name'>" . $d['title'] . "</div>
                   <div class='comment-con'> " . $lng['from']. "</div>
                   <div class='comment-date'>" . $d['data'] . "</div>
                 </div>
            </div>";
    }




    $retData .=$lib->util->getPageNumber($rowNumbers, count($llnum));


    return $retData;
}

function getCurlData($url) {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_TIMEOUT, 10);
    curl_setopt($curl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16");
    $curlData = curl_exec($curl);
    curl_close($curl);
    return $curlData;
}
?>



