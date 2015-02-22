
<script type="text/javascript" src="/includes/js/jquery.ui.map.js"></script>






<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro) {
    /* @var $lib  libs\libs */
    global $lib;



    if (isset($_SESSION['app_com'])) {
        $com = $lib->db->get_row("com_install", "*", "ins_alias='" . $_SESSION['app_com'] . "'");
    } else {
        $com = $lib->db->get_row("com_install", "*", "id=" . $pro['components']);
    }





    $lib->adminv2->com = $com['ins_alias'];


    $ds = explode(";", $_GET['dataoptions']);
    foreach ($ds as $d) {
        $a = explode("__", $d);
        $lib->adminv2->dataOptions[$a[0]] = $a[1];
    }
    if (isset($_GET['page'])) {
        $lib->adminv2->dataOptions['page'] = $_GET['page'];
    }


    $lib->adminv2->rowlimt = $pro['blocksNumber'];





    switch ($_GET['do']) {
        case "getbar":
            $r.= $lib->adminv2->getComponentbar();
            break;
        case "gethome":
            $r.= $lib->adminv2->getComponenthome($_GET['data']);
            break;
        case "setsave":
            $r.= $lib->adminv2->updateData($_POST['data']);
            break;
        case "setdelete":
            $r.= $lib->adminv2->setDelete($_POST['data']);
            break;
        case "setcopy":
            return $lib->adminv2->setCopy($_POST['data']);
            break;
        case "setenabel":
            $r.= $lib->adminv2->setEnabled($_POST['data']);
            break;
        case "setdisabel":
            $r.= $lib->adminv2->setDisabled($_POST['data']);
            break;
        case "setrestore":
            return $lib->adminv2->setRestor($_POST['data']);
            break;
        case "setrestoreall":
            $r.= $lib->adminv2->setRestorAll($_POST['data']);
            break;
        case "setremove":
            $r.= $lib->adminv2->setRemove($_POST['data']);
            break;
        case "setremoveall":
            $r.= $lib->adminv2->setRemoveAll($_POST['data']);
            break;
        case "getadd":
            $r.= $lib->adminv2->getAdd($_POST['data']);
            break;
        case "setadd":
            $r.= $lib->adminv2->setAdd($_POST['data']);
            break;
        case "getedit":
            $r.= $lib->adminv2->getEdit($_GET['id']);
            break;
        case "setedit":
            $r.= $lib->adminv2->setEidt($_POST['data']);
            break;
        default :


            $r = " <input class='reloadtime' type='hidden' value='" . $pro['autoreloadTime'] . "' />"
                    . "<div class='mtitle'>" . $com['ins_title'] . "</div>";
            $r.= $lib->adminv2->getComponentMain();
            break;
    }
    //getComponentMain
    return $r;
}

;
?>


