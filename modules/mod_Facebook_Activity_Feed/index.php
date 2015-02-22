<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_Facebook_Activity_Feed($pro) {
    global $lib;

    /*  $pro['class'] = "fb-activity";
      $pro['Domain'] = "https://www.facebook.com/amr.showhady";

      $pro['width']
      $pro['height']
      $pro['target']
      $pro['font']
      $pro['style'] */

    if ($pro['datatype'] == "activity") {




        $data.= '
          <div class="fb-activity"
          data-site="' . $pro['Domain'] . '"
          data-width="' . $pro['width'] . '"
          data-height="' . $pro['height'] . '"
          data-header="' . $pro['Showheader'] . '"
          data-colorscheme="' . $pro['style'] . '"
          data-linktarget="' . $pro['traget'] . '"
          data-font="' . $pro['font'] . '"
          data-recommendations="true"></div>
          ';
    } else {
        $data.= '
    <div class="fb-like-box" 
    data-href="' . $pro['Domain'] . '"
    data-width="' . $pro['width'] . '"  data-height="' . $pro['height'] . '" 
  

    data-border-color="#' . $pro['borderColor'] . '"" 
    data-header="' . $pro['Showheader'] . '" 
    data-show-faces="' . $pro['ShowFaces'] . '" 
    data-stream="' . $pro['Showstream'] . '" 
></div>
     ';
    }

    return $data;
}

?>
