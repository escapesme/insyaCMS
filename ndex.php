<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

include '../lib/libs.php';
//$config= new configClass();

//$lib->config->fetch_row();
echo $ib->config->db_name;

$doo= new formsClass();
   



echo  $doo->_render_form();;


?>
