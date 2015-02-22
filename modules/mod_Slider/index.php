



<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mod_slider($pro, $lang) {

    global $lib;
//print_r($pro);

    echo'
    


';


    if ($pro['showtype'] == "banner") {
        $returnData = mod_slider_banner($pro);
    } else {

        $returnData = mod_slider_slider($pro ,$lang);
    }


    return $returnData;
}
?>
<style>


   
    .slide_inner{
       width: 220px;
        height: 300px;padding: 2px;
    }

    .list_carousel li{
    /*    width: 235px;
        height: 260px;
;*/
        float: left;
        position: relative;
    }


</style>