<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_videosgallery($data, $lang) {

    /* @var $lib  libs\libs */
    global $lib;




//return print_r($data,true);
    if (isset($data['videogallery']) && $data['videogallery'] != "" && $data['videogallery'] != "0") {

        return plgvi_gatData($data['videogallery'], $data);
    }
}

?>
