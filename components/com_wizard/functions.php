<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

session_start();

function redirect($url, $permanent = false) {


    echo '<META HTTP-EQUIV="Refresh" Content="0; URL=' . $url . '">';
}

function getSteps($pro) {
    global $lib;
    $d = $lib->db->get_row('com_wizard', "*", "id='" . $pro['wizard'] . "' order by `order`");
    $data = explode("||", $d['data']);


    return array_filter($data);
}

function postDataSteps() {
    global $lib;
    $thsetp = 1;
    if (isset($_GET['id'])) {
        $thsetp = $_GET['id'];
    }

    if (isset($_POST["formName"])) {
        $_SESSION['setp-' . $thsetp] = $_POST;
        $newxurlnum = $thsetp + 1;
        $nexturl = $lib->util->createURL("com_wizard", $newxurlnum, "", "step");

        redirect($nexturl);
    }
}

function createStepesBar($septes) {
    $data = "";
    global $lib;
    $thsetp = 1;

    $data.="<div class='wstep _" . $thsetp . "'>";
    if (isset($_GET['id']) && trim($_GET['id']) != "step") {
        $thsetp = $_GET['id'];
    }
    $data.="<div class='number setpesBar'>";

    //$data str_split($data)


    foreach ($septes as $s) {
        $num++;

        $more = "";
        if ($num == $thsetp) {
            $more = "act";
        }
        $data.="<div class='setp " . $more . "'>" . $num . "</div>";
    }

    $data.= "</div>";


    // foreach ($septes as $s) {
    $data.="<div class='types'>";



    $stepData = explode(";", $septes[$thsetp - 1]);

    $data.=typesData($stepData);


    $stepData = $lib->util->data->updateStringTorray($stepData[0]);

    $data.= "</div>";


    // }






    $newxurlnum = $thsetp + 1;
    $perurlnum = $thsetp - 1;
    if ($perurlnum < 1) {
        $perurlnum = 1;
    }

    if ($newxurlnum >= count($septes)) {
        $newxurlnum = count($septes);
    }


    $nexturl = $lib->util->createURL("com_wizard", $newxurlnum, "", "step");
    $perurl = $lib->util->createURL("com_wizard", $perurlnum, "", "step");





    $data.="<div class='setpesBar'>";

    if (isset($stepData['prevText']) && $stepData['prevText']!="") {
        $data.="<a href='" . $perurl . "'  class='wprev'>" . $stepData['prevText'] . "</a> ";
    }
    if (isset($stepData['nextText']) && $stepData['nextText']!="") {

        $data.="<a  href='" . $nexturl . "' class='wnext'>" . $stepData['nextText'] . "</a>";
    }

    $data.= "</div>";
    $data.= "</div>";


    return $data;
}

function typesData($types) {

    //$types = explode("||", $mytype);

    /* @var $lib  libs\libs */
    global $lib;


    $data = "";






    foreach ($types as $type) {


        if (isset($type) && trim($type) != "") {
            $ts1 = $lib->util->data->updateStringTorray($type);

            $lib->util->page->updateTitle($ts1['title'], $ts1['title'], "title-web");



            $data .= $lib->util->dataBluder->renderDataBluder($ts1['data1']);
        }
    }



    return $data;
}

?>
