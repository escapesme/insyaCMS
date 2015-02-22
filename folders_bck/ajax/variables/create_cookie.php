<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

$inTwoMonths = 60 * 60 * 24 * 60 + time();  
setcookie($_GET['name'], $_GET['value'], $inTwoMonths);  

print_r($_COOKIE);

?>
