<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$render = $_GET['render'];
$typ = $_GET['type'];
$table = $_GET['table'];
$outData = "";
$getData = "";

$value = $_GET['value'];

/* @var $lib  libs\libs */
global $lib;
switch ($typ) {
    case "tabels":
        $getData = $d = $lib->db->get_table_names();
        break;
    case "table_fields":
        $getData = $lib->db->get_table_fields($table);
        break;
}
//echo $render;
switch ($render) {
    case "full_options":


        $outData = updateToOptions($getData, $_GET['table'] . ".", $value);
        break;
    case "options":
        $outData = updateToOptions($getData, "", $value);
        break;
    default :

        $outData = updateToString($getData);
        break;
}






echo ($outData);

function updateToOptions($as, $table = "", $value = "") {
    $data = "";
    foreach ($as as $a) {
        $more = "";

        $myv = $table . $a["Field"];
        echo $value . $myv . "<br/>";


        if ($value == $myv) {

            $more = " selected='selected' ";
        }


        $data.="<option " . $more . " value='" . $myv . "'>" . $myv . "</option>";
    }
    return $data;
}

function updateToString($as) {
    $data = "";
    foreach ($as as $a) {

        $data.= $a["Field"] . ";";
    }
    return $data;
}

?>
