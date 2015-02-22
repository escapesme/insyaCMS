<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_pypal($data, $lang) {
    global $lib;

    // <input type="hidden" name="hosted_button_id" value="9M2SUEVCYVS5J" /> 
    // <input type="hidden" name="business" value="65FBRQV7SRE7S" />

    $hosted_button_id = $data[0];
    $business = $data[1];
    $data = '
    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="paypal">
        <input type="hidden" name="cmd" value="_s-xclick" /> 
        <input type="hidden" name="hosted_button_id" value="' . $hosted_button_id . '" /> 
        <input type="submit" class="paybal_order" name="submit"  value="Add To Cart" alt="PayPal - The safer, easier way to pay online!" />
        <img src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" alt="" width="1" height="1" border="0" />
    </form>


    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="paypal">
        <input type="hidden" name="cmd" value="_cart" /> 
        <input type="hidden" name="business" value="' . $business . ' "  />
        <input type="hidden" name="display" value="1" /> 
        <input  class="paybal_showcart"  value="Show Cart" type="submit" name="submit"  alt="PayPal - The safer, easier way to pay online!" /> 
        <img src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" alt="" width="1" height="1" border="0" /></form>
   

'
    ;
    $returnData = $data;

    return $returnData;
}
?>
<!--
<form action="do_stuff.aspx" method="post" target="my_iframe">
  <input type="submit" value="Do Stuff!" />
</form>


<iframe name="my_iframe" id="my_iframe" src="http://www.w3schools.com"></iframe>


-->