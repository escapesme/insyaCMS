<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function plg_PageData($datasql, $lang) {
    $out = "";
  /* @var $lib  libs\libs */
    global $lib;
    
    
    

    
    $lib->util->page->headerData($datasql['description'], $datasql['keywords'], $datasql['header']);
    $lib->util->page->chearTages($datasql['title'], $datasql['th_image'], $datasql['url'], $datasql['description'], $url = "");


    return $out;
}
?>


    