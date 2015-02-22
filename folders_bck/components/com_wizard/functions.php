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
    $d = $lib->db->get_data('com_wizard_xref', "*", "w_id='" . $pro['wizard'] . "' order by `order`");


    //  print_r($d['data__data1']);
    return $d;
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

 $data.="<div class='wstep _".$thsetp."'>";
    if (isset($_GET['id']) && trim($_GET['id']) != "step") {
        $thsetp = $_GET['id'];
    }
    $data.="<div class='number setpesBar'>";
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
    $data.=typesData($septes[$thsetp - 1]['properties']);
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
    $data.="
        <a href='" . $perurl . "'  class='wprev'>prev</a> 
        <a  href='" . $nexturl . "' class='wnext'>next</a>";
    $data.= "</div>";$data.= "</div>";
    return $data;
}

function typesData($mytype) {

    $types = explode("||", $mytype);

    /* @var $lib  libs\libs */
    global $lib;


    $data = "";


    foreach ($types as $type) {


        if (isset($type) && trim($type) != "") {

            $t = explode("|", $type);

            $ts1 = $lib->util->data->updateStringTorray($t[1]);

            $data = $lib->util->dataBluder->renderDataBluder($ts1['data1']);
        }
    }



    return $data;
}


?>
