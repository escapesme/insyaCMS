



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

        $returnData = mod_slider_slider($pro);
    }


    return $returnData;
}
?>
<style>



   

</style>