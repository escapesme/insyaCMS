<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

$get=$_SESSION[url];

global $lib;

echo $get;




$fields=explode(",",  $get['fields']); 
$values=explode(",",  $get['values']);





$num=0;
foreach ($fields as $f ){
    
    $datain[$f]=$values[$num];
    $num++;
    
    
}




echo $lib->db->insert_row($_GET['table'],$datain);
?>
