<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function getsun($lt, $nt, $im) {
 
    
    
    
     $ret.= "<div id=\"sunries\"> <div  class='title'>sunrise</div><div id=\"sun_num1\">" .date_sunrise(time(), SUNFUNCS_RET_STRING,$lt,$nt) . "</div></div>";
    $ret.= "<div id=\"sunset\"> <div  class='title'>sunset</div><div id=\"sun_num\">" .  date_sunset(time(), SUNFUNCS_RET_STRING,$lt,$nt). "</div></div>";
    
    
    
    
    return$ret;
}

?>
