<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

  global  $lib;

    $datasql = $lib->db->get_data('mod_favorites', 'distinct(title ) as title ', ' enabled=1 and `delete`=0 ');
echo '<div class=\'block-border\'><div class="block-content">';
    foreach ($datasql as $d2) {
           $d = $lib->db->get_row('mod_favorites', "", " title='".$d2['title']."'");
          if (!is_file( $d['icon']) ){

         $d['icon']='images/page_edit.png';
    }

       echo  '<li class=\'fufli\' id="'.$d['id'].'" title="'.$d['title'].'"><a href=\'' . $d['linke']. '\'><img src=\'' . $d['icon'] . '\' />' . $d['title'] . '</a></li>';
    }
    
    echo '</div></div>';
    
    
    
?>
