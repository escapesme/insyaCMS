<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function _substr($str, $length, $minword = 3) {
    $sub = '';
    $len = 0;

    foreach (explode(' ', $str) as $word) {
        $part = (($sub != '') ? ' ' : '') . $word;
        $sub .= $part;
        $len += strlen($part);

        if (strlen($word) > $minword && strlen($sub) >= $length) {
            break;
        }
    }

    return $sub . (($len < strlen($str)) ? '...' : '');
}

function main($pro, $lng) {


    global $lib;
    $data.="<div class='com_main Comfaq'>";

    if ($pro['userAdd'] == "1") {
        $data.= faqUpdateData($lng);
    }

    if ($pro['userAdd'] == "1") {
        $data.=faqForm($lng);
    }

    if ($pro['faqstyle'] == "linked") {
        $data.=linkedStyle();
    } else if ($pro['faqstyle'] == "accordian") {
        $data.=accordianStyle($lng);
    } else if ($pro['faqstyle'] == "normal") {
        $data.=normalStyle($lng);
    } else {
        $data.=listStyle();
    }

    $data.= "</div>";




    return $data;
}
