<?php

/* @var $lib  libs\libs */
global $lib;
$data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['ej'] . ";getType__data");
if (isset($data['Mumin_id'])) {
    $myid = $lib->coms->faiz->saveUser($data);
    
    $d = print_r($lib->coms->faiz->getUserDataByID($myid), true);
    echo $d;
} else {
    echo "0";
}


