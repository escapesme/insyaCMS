<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_project($pro, $l) {
    /* @var $lib  libs\libs */
    global $lib;

    if ($pro['viwtype'] == "categories") {
        
        
        
        $r .= $lib->coms->project->com_project_getCategories($pro['catgories']);
    } else {

        $r .= $lib->coms->project->com_project_getblocks(mod_project_getData($pro), $l, $pro);
    }
    return $r;
}

?>
