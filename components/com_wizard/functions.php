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

function getStepByAlias($septes, $alias) {
    global $lib, $stapesTypes;


    foreach ($septes as $s) {
        $stepData = $lib->util->data->updateStringTorray($s);

        
        
        

        if ($stepData['alias'] == $alias) {
            $r = $stepData;
        }
    }


    return $r;
}

function createStepesBar($septes) {
    $data = "";
    global $lib, $stapesTypes;
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


    $data.="<div class='types'>";





    $stepData = getStepByAlias($septes, $thsetp);




    $thisSetpNum = $stepData['steporder']-1 ;

    
    
    
    $PrevstepData = explode(";", $septes[$thisSetpNum - 1]);
    $NextstepData = explode(";", $septes[$thisSetpNum + 1]);
    
    
    $NextstepData = $lib->util->data->updateStringTorray($NextstepData[0]);
    $PrevstepData = $lib->util->data->updateStringTorray($PrevstepData[0]);

    
    print_r($NextstepData);

    $lib->util->page->updateTitle($stepData['title'], $stepData['title'], "title-web");
    $data .= $lib->util->dataBluder->renderDataBluder($stepData['data1']);
    $data .=" " . $lib->util->dataBluder->StypeType;


    $data.= "</div>";

    $nexturl = $lib->util->createURL("com_wizard", $NextstepData['alias'], "", "step");
    $perurl = $lib->util->createURL("com_wizard", $PrevstepData['alias'], "", "step");


    $data.="<div class='setpesBar'>";

    if (isset($stepData['prevText']) && $stepData['prevText'] != "") {
        $data.="<a href='" . $perurl . "'  data-step='" . $thsetp . "  class='$stapesTypes wprev'>" . $stepData['prevText'] . "</a> ";
    }
    if (isset($stepData['nextText']) && $stepData['nextText'] != "") {

        $data.="<a  href='" . $nexturl . "' data-step='" . $thsetp . "' class='$stapesTypes wnext'>" . $stepData['nextText'] . "</a>";
    }

    $data.= "</div>";
    $data.= "</div>";

    return $data;
}

$stapesTypes = "";
?>
