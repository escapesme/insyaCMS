<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_HTML_Code($pro) {
    /* @var $lib  libs\libs */
    global $lib;

    $data = $lib->db->get_row('com_html', '', 'id=' . $pro['selectcode']);


    return $lib->util->out($data['my_body'], true);
}

?>
