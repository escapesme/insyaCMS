<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function CategoryMenu($pro) {

    global $lib;

    $returndata = "<div class=\"mod _" . $pro['myid'] . " CategoryMenu moduletable\" >";
    
    if (trim($pro['title'])!=""){
      $returndata.= "<h3 class=\"mod-title\">" . $pro['title'] . " </span></h3>";   
    }
   
    $returndata.= "  <div class=\"moduletable_content myinn clearfix\">" . $lib->front->moduleBody($pro);

    $returndata .= "</div><div class=\"innend\"> </div></div>";

    return $returndata;
}
?>

