

<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */
print_R($_GET);
//echo $_GET['ITSID'];
ini_set("display_errors", 0);
session_start();
require_once("lib/libs.php");



/* @var $lib  \libs\libs */
global $lib, $dataresIDS;
/* $r = "";
  $r .= '<h2>' . $l['lgoinmsg'] . '</h2>';

 */



if (isset($_GET['ITSID'])) {




    $data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['ITSID'] . ";getType__data");

    if ($data['FullName']) {
        echo $lib->coms->faiz->saveUser($data);
        $_SESSION['razaOwnerID'] = $lib->coms->faiz->saveUser($data);
    } else {
        echo "asdasdadsasd";
    }


    // [id] => 0127 [catid] => its_login )

    if (isset($_GET['id']) && isset($_GET['catid'])) {

        header('Location: http://new.faizehaakimi.com/site/cairo/Reservations/edit/' . $_GET['id'], true, false ? 301 : 302);
    } else {
        header('Location: http://new.faizehaakimi.com/site/cairo/Reservations/', true, false ? 301 : 302);
    }
//   
    exit();
} else {
    
}
?>