<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function plg_getForm($data, $lang) {
    $out = "";
    /* @var $lib  libs\libs */
    global $lib;

    $data = $lib->forms->getFiledsFormStrign("db", "com_form", $data['formId'], "data");

    
    
    

    return $data;
}
?>


