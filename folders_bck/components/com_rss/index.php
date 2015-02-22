<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function main($pro, $lang) {
    global $lib;

    $retusdata .="<div class='com_rss com_main'>";
    $table = getTabel($pro['type']);
    $cattable = getCatTabel($pro['type']);
    $retusdata .= getcatData($cattable, $table, "0", $pro);
    $retusdata .="</div>";
    return $retusdata;
}
?>


<script>


</script>

