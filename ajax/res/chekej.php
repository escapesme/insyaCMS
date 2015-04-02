<?php

/* @var $lib  libs\libs */
global $lib;
$data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['ej'] . ";getType__data");
$data['Mumin_id'] = "30385154";
$data['FullName'] = "16dasdasd0";
if ($data['FullName']) {
    $myid = $lib->coms->faiz->saveUser($data);
    $d = print_r($lib->coms->faiz->getUserDataByID($myid), true);
    echo $d;
} else {
    echo "0";
}


