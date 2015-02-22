<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_products($data, $lang) {

    /* @var $lib  libs\libs */
    global $lib;




//return print_r($data,true);

 return plgpro_gatData($data['procat_id'], $data);
}

?>
