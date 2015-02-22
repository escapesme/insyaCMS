<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function plg_extension($pro, $lng, $f) {
    /* @var $lib  \libs\libs */
    global $lib;


    $r = "<div class='plg_extensionInputs'>";
    $lib->forms->filds = $f;
    $r .= $lib->forms->_render_form();
    $r .= "</div>";


    return $r;
}
?>



