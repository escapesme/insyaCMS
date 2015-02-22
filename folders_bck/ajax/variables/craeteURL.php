<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$alias = "";
$CAT = "";
$id = "";

if (isset($_GET['alias']) && trim($_GET['alias']) != "") {

    $alias = $_GET['alias'];
}

if (isset($_GET['cat']) && trim($_GET['cat']) != "") {

    $CAT = $_GET['cat'];
}


if (isset($_GET['id']) && trim($_GET['id']) != "") {

    $id = $_GET['id'];
}
global $lib;
echo $lib->util->createURL($alias, $CAT, $id);
?>
