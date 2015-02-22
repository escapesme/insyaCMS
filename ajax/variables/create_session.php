<?php

session_start();
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */
$name = $_GET['name'];

$names = explode(".", $name);

if (isset($names[1])) {
    $_SESSION[$names[0]][$names[1]] = $_GET['value'];
} else {


    $_SESSION[$name] = $_GET['value'];
}


print_r($_SESSION);
?>
