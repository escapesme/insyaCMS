<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_imagegallery($data, $lang) {

    /* @var $lib  libs\libs */
    global $lib;




//return print_r($data,true);

 return plgig_gatData($data['imagegallery'], $data);
}

?>
