<?php

function getsun($lt, $nt, $im) {
    
    $offset = 2;    // difference between GMT and local time in hours

$zenith=90+50/60;
    
    
    $ret.= "<div id=\"sunries\"> <div  class='title'>sunrise</div><div id=\"sun_num1\">" . date_sunrise(time(), SUNFUNCS_RET_STRING,   $nt,$lt,$zenith,$offset) . "</div></div>";
    $ret.= "<div id=\"sunset\"> <div  class='title'>sunset</div><div id=\"sun_num\">" . date_sunset(time(), SUNFUNCS_RET_STRING, $nt,$lt,$zenith,$offset) . "</div></div>";
    
    
    
    
    

    return$ret;
}

?>
