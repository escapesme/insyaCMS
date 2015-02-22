<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$table = $_GET['table'];
$field = $_GET['field'];
$id = $_GET['id'];

 global  $lib;
 
$data= $lib->db->get_row($table,"","id=".$id);
 echo $data[$field];

?>
