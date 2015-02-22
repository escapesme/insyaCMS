<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function dark($pro) {

    global $lib;



    $returndata.= "<div class=\"dark mod _" . $pro['myid'] . " moduletable\" >
        
                     <div class='data'><h3 class=\"mod-title\"> <span></span>" . $pro['title'] . " </h3>";
    $returndata.= "  <div class=\"moduletable_content clearfix\">
        " . $lib->front->moduleBody($pro);


    $returndata .= "</div></div></div>";

    return $returndata;
}

?>
