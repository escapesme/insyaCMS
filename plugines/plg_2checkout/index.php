<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

function plg_2checkout($pro) {

    global $lib;


    $ch = $lib->db->get_row("plg_2checkout");


    switch ($pro['0']) {
        case "header":

            $currency = $lib->util->cities->getCurrencyCode();
            $retdata.='
    <form id="order" action="' . $ch['checkout_url'] . '"
method="post">
<input type="hidden" name="sid" value="' . $ch['sid'] . '" />
<input type="hidden" name="mode" value="2CO" />
<input type="hidden" name="currency_code" value="' . $currency . '" />
';


            break;


        case "footer":


            $retdata.='<input type="hidden" name="x_Receipt_Link_URL" value="' . $pro['1'] . '" /> 
<input type="hidden" name="purchase_step" value="' . $ch['purchase_step'] . '" /> 
</form>';
            break;


        case "product":
            $retdata .= "
                




<div class='pro_data'>
<input type=\"hidden\" name=\"li_" . $pro['1'] . "_product_id\"  class='li_product_id' value=\"" . $pro['5'] . "\" /> 
<input type=\"hidden\" name=\"li_" . $pro['1'] . "_type\" value=\"product\" /> 
<input type=\"hidden\"  name=\"li_" . $pro['1'] . "_name\" value=\"" . $pro['2'] . "\" /> 
<input type=\"hidden\" class='li_quantity'  name=\"li_" . $pro['1'] . "_quantity\" value=\"" . $pro['3'] . "\" /> 
<input type=\"hidden\" class='li_pricedef'  name=\"li_" . $pro['1'] . "_price\" value=\"" . $pro['4'] . "\" />
<input type=\"hidden\" class='li_price'  name=\"li_" . $pro['1'] . "_price\" value=\"" . $pro['4'] . "\" />
<input type=\"hidden\" name=\"li_" . $pro['1'] . "_tangible\" value=\"Y\" /> 
            </div>
            ";
            break;
    }

    return $retdata;
}

?>
