<?php

session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$data = $_GET['data'];
$mtype = $_GET['mtype'];
$type = $_GET['type'];

if ($mtype == "0") {
    clearpro($type);
}



if (isset($_GET['status']) && $_GET['status'] == "delete") {

    deletpro($data, $type);
} else {
    deletpro($data, $type);



    $_SESSION[cart_productes][$type].=";" . $data;
}

function clearpro($type) {

    $_SESSION[cart_productes][$type] = "";
}

function deletpro($id, $type) {
    $ms = explode(";",  $_SESSION[cart_productes][$type] );

    foreach ($ms as $c) {


        if ($c != $id) {
            $retData .= ";" . $c;
        }
    }

    $_SESSION[cart_productes][$type] = $retData;
}



?>
