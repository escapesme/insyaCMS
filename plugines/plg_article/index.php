<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_article($data, $lang) {

    /* @var $lib  libs\libs */
    global $lib;




//return print_r($data,true);

 return plart_gatData($data['artcat_id'], $data);
}

?>
