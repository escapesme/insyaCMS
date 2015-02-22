<?php

$tabel = $_GET['tabel'];
$data = $_GET['data'];
$field = $_GET['field'];

/* @var $lib  \libs\libs */
global $lib;


$ds1 = explode(";", $data);
foreach ($ds1 as $d1) {
    $inputs = explode("__", $d1);

    $p = $field;
    $ps = explode(".", $field);
    if (isset($ps[1])) {
        $p = $ps[1];
    }




    $ftype = $lib->util->data->getFieldType($tabel, $p);


    if ($ftype == "date") {
        $inputs[1] = $lib->util->dateTodb($inputs[1]);
    } else if ($ftype == "datetime") {
          $inputs[1] = $lib->util->dateTodb($inputs[1]) ." 00:00:00";
    }

    $arrayData = array(
        $p => $inputs[1]
    );

    print_r($arrayData);

    echo $lib->db->update_row($tabel, $arrayData, $inputs[0]);
}
?>
