<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */



//$mode = $_GET['mode'];
/*
if ($mode == "add") {
 //   saveData();

    
        echo $lib->adminEng->getComponentMain();
    /* } else if ($mode == "edit") {
      updatData();

      $dw = $lib->db->get_row('com_wizard', "", "id=" . $_GET[$lib->variables->url_id] ." order by `order`");
      $dwxref = $lib->db->get_data('com_wizard_xref', "", "w_id=" . $_GET[$lib->variables->url_id]." order by `order`");
      echo $dw['title'] . addData($dw['title'], $dwxref); */
//} else {*/

    /* @var $lib  \libs\libs */
    global $lib;
    
    
    
    echo $lib->adminEng->getComponentMain();
//}
?>