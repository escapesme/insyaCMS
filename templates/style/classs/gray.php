<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function gray($pro) {

    global $lib;



    $returndata.= "<div class=\"dark mod _" . $pro['myid'] . " moduletable\" >
        
                     <h3 class=\"mod-title\"> <span></span>" . $pro['title'] . " </h3>";
    $returndata.= "  <div class=\"moduletable_content clearfix\">
        " . $lib->front->moduleBody($pro);


    $returndata .= "</div></div>";

    return $returndata;
}

?>
