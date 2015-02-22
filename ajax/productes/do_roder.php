<?php
session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


global  $lib;
$_GET['item']=$_SESSION[cart_productes];
$data=$_GET;
$lib->db->insert_row("com_products_order",$data);
//alert ($_GET);
?>
