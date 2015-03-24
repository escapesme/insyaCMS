<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function nostyle($pro) {

    global $lib;

    $returndata = "<div class=\"mod _" . $pro['myid'] . " moduletable\" >";
    
    if (trim($pro['title'])!=""){
      $returndata.= "<h3 class=\"mod-title\">" . $pro['title'] . " </span></h3>";   
    }
   
    $returndata.= "  <div class=\"moduletable_content clearfix\">" . $lib->front->moduleBody($pro);

    $returndata .= "</div></div>";

    return $returndata;
}
?>

