<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$d = explode(";", $_GET['data']);
$vs = explode(",", $d[1]);
$ks = explode(",", $d[0]);
for ($i = 0; $i < count($ks); $i++) {
    $data[trim($ks[$i])] = trim($vs[$i]);
}

//print_r($data);



/* @var $lib  libs\libs */
global $lib;







//
if (isset($_GET['id']) && trim($_GET['id']) != "") {

    $mdata = array("delete" => "1");
    $lib->db->update_row(trim($data['xrefTable']), $mdata, "", $data['xrefmyid'] . "='" . $_GET['dataId'] . "'   and    " . $data['xrefotherid'] . "='" . trim($_GET['id']) . "'");
}

echo $lib->admin->getXerfDataInput($_GET['dataId'], $data, "admin/");
