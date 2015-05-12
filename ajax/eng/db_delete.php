<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

$get = $_SESSION[url];

global $lib;
$id = $get['id'];


if (isset($_GET['field'])) {

    echo $lib->db->delete_data($_GET['table'], "" . $_GET['field'] . "='" . $id . "'");
}if (isset($_GET['query'])) {

    echo $lib->db->delete_data($_GET['table'], $_GET['query']);
} else {

    echo $lib->db->delete_data($_GET['table'], "id=" . $id);
}
?>
