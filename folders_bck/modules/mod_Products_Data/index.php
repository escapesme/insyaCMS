<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_products_Data($pro) {
    global $lib;

    $thisTable = "com_products";
    $thiscatgoriesTable = "com_products_categories";


  
  
  


    if ($pro['view'] == "categories") {

        $data = mod_products_Data_categories_getLast($pro, $thisTable, $thiscatgoriesTable);
    } else {
        
        
        if ($pro['Datatype'] == "random") {

            $data = mod_products_Data_random($pro, $thisTable, $thiscatgoriesTable);
        }
       else if ($pro['Datatype'] == "latest") {

            $data = mod_products_Data_getLast($pro, $thisTable, $thiscatgoriesTable);
        } else if ($pro['Datatype'] == "mostview") {

            $data = mod_products_Data_hints($pro, $thisTable, $thiscatgoriesTable);
        }if ($pro['Datatype'] == "tags") {
            $data = mod_products_Data_tags($pro, $thisTable, $thiscatgoriesTable);
        }
    }

    return $data;
}

?>
