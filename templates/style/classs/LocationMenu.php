<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function LocationMenu($pro) {

    global $lib;

    $returndata = "<div class=\"mod _" . $pro['myid'] . " moduletable LocationMenu\" >";
    
    if (trim($pro['title'])!=""){
      $returndata.= "<h3 class=\"mod-title\">" . $pro['title'] . " </h3>";   
    }
   
    $returndata.= "  <div class=\"moduletable_content clearfix\">" . $lib->front->moduleBody($pro);

    $returndata .= "</div></div>";

    return $returndata;
}
?>

