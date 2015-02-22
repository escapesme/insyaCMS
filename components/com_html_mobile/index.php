<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro) {
    global $lib;
    
    
    
     if ($pro['imagegallery'] != null && trim($pro['imagegallery']) != "") {


        $mpro['style'] = "com_products_Images";

        $retdata .= $lib->util->getImageGallery($pro['imagegallery'], $mpro);
    }
    
    
    $data = $lib->db->get_row('com_html', '', 'ID=' . $pro['selectcode']);


    return "ddddddddddddddddddddddd<div class='com_main  comhtml'>".$data['my_body']."</div>";
}
?>


