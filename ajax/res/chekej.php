<?php

/* @var $lib  libs\libs */
global $lib;













$data = $lib->plugins->importPlugin("plg_ejamaat", "ejamaatId__" . $_GET['ej'] . ";getType__data");


if ($data['dob']) {
    /*
      $datetime = $data['dob'];
      $format = "j M Y";
     */


    if (todate($_GET['bod'], "j/m/Y") == todate($data['dob'], "j M Y")) {
        echo "true";
    }
}

function todate($datetime, $format) {
    $t = date_parse_from_format($format, $datetime);
    return date('d-m-Y', mktime(0, 0, 0, $t['month'], $t['day'], $t['year']));
}
