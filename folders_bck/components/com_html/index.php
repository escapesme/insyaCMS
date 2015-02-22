<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro, $l) {
    global $lib;


    $data = $lib->db->get_row('com_html', '', 'ID=' . $pro['selectcode']);


    return "<div class='title'>" .
            $pro['subtitle']
            . "</div>"
            . "<div class='com_main  comhtml'>" .
            $lib->util->data->varDataUpdate($data['my_body'])
            . "</div>"
            . $lib->util->getPlugins($pro['selectcode'], "com_html");
}
?>


