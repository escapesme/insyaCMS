<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */



/* @var $lib libs\libs */
global $lib;



$mode = $_GET['mode'];

if ($mode == "edit") {






























    $id = "1";
    $ordr = $lib->db->get_row("com_products_order", "", "id='" . $_GET[$lib->variables->url_id] . "'  ");


    $trstyle = "";
    $tdStyle = "style='border: 1px #solid #666'";
    $thStyle = " style='text-align:left'";
    $r.="
        

<div class=\"block-border\">
 <div class=\"block-content\">
<div class=\"block-header\">
<h1>com_products_order<div class=\"subtitle\">edit<div></div></div></h1><span></span></div><div class='ordrMsg' >Thanks! Your order number is : $id and it will ship in 3 days.
  </div>

<table style='width:100%; border:1px solid #666 ; ' class='otabel ord'><tr>
    <th " . $thStyle . ">Billing address</th>
    <th " . $thStyle . ">Shipping address</th>
    <th " . $thStyle . " >Contact detail</th>    
    <th" . $thStyle . " >Payment detail</th>
</tr>";

    $r.="<tr $trstyle>
       <td>" . $ordr['card_holder_name'] . "</td>
        <td>" . $ordr['ship_name'] . "</td>
        <td>" . $ordr['email'] . "</td>
        <td>" . $ordr['payment_processor_order_id'] . "</td>
    </tr>
    ";


    $r.="<tr $trstyle>
        <td $tdStyle>" . $ordr['street_address'] . "</td>
        <td $tdStyle >" . $ordr['ship_street_address'] . "</td>
        <td $tdStyle>" . $ordr['phone'] . "</td>
        <td $tdStyle></td>
    </tr>
    ";


    $r.="<tr $trstyle>
        <td $tdStyle>" . $ordr['street_address2'] . "</td>
        <td $tdStyle>" . $ordr['ship_street_address2'] . "</td>
        <td $tdStyle></td> <td></td>
    </tr>
    ";

    $r.="<tr $trstyle>
        <td $tdStyle>" . $ordr['city'] . "</td>
        <td $tdStyle>" . $ordr['ship_city'] . "</td>
        <td $tdStyle></td><td></td>
    </tr>
    ";


    $r.="<tr $trstyle>
        <td $tdStyle>" . $ordr['state'] . "</td>
        <td $tdStyle>" . $ordr['ship_state'] . "</td>
        <td $tdStyle></td><td $tdStyle></td>
    </tr>
    ";
    $r.="<tr $trstyle>
     <td $tdStyle>" . $ordr['zip'] . "</td>
    <td $tdStyle>" . $ordr['ship_zip'] . "</td>
    <td $tdStyle></td><td $tdStyle></td>
    </tr>
    ";

    $r.="</table>";





    $r.="
<table style='width:100%; border:1px solid #666 ; 'class='otabel por'><tr>
    <th " . $thStyle . ">Product</th>
    <th " . $thStyle . ">Price</th>
    <th " . $thStyle . ">Quantity</th>    
    <th " . $thStyle . ">Sub total</th>
</tr>";

    $pro = $lib->db->get_data("com_products_order_xref", "", "order_id='" . $ordr ['order_id'] . "'  ");






    foreach ($pro as $c) {

// $price = $lib->util->cities->getproductsPrice($c['']);
        $currency = $lib->util->cities->getCurrency();

        $all = $c['price'] * $c['quantity'];

        $r.="<tr $trstyle><td $tdStyle>" . $c['name'] . "</td> <td>" . $ordr['currency'] . $c['price'] . "</td><td>" . $c['quantity'] . "</td><td>" . $ordr['currency'] . $all . "</td></tr>";
    }
    $r.="</table></div></div>";






    echo $r;

    echo $lib->adminEng->getComponentMain();
} else {

    echo $lib->adminEng->getComponentMain();
}
?>
