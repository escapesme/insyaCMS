<?php

session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


global $lib;


$setting = $lib->db->get_row("com_products_setting", "", "site='" . $_GET['settingsite'] . "'");
if ($_GET['status'] == "order_done") {
    $s = "2";
    if ($setting['PaymentType'] == "2") {

        $s = "2";
    } else {
        $s = "10";
    }


    $data = array(
        "order_status" => $s,
        "payment_processor_order_id" => $_GET['pay_id']
    );


    $lib->db->update_row("com_products_order", $data, "", "order_id='" . $_SESSION['order_id'] . "'");
} else {



    $_GET['order_id'] = uniqid();
    $data = $_GET;

    unset($data['file']);
    unset($data['file']);
    print_R($data);
    
    
    $lib->db->insert_row("com_products_order", $data);
    $_SESSION['order_id'] = $_GET['order_id'];



    for ($i = 0; $i < count($data); $i++) {
        if (isset($data['li_' . $i . '_name'])) {
            if ($_GET['li_' . $i . '_type'] == "shipping ") {

                $_GET['li_' . $i . '_product_id'] = "0";
            }

            $xrefdata = array(
                "pro_id" => $_GET['li_' . $i . '_product_id'],
                "order_id" => $_GET['order_id'],
                "type" => $_GET['li_' . $i . '_type'],
                "price" => $_GET['li_' . $i . '_price'],
                "name" => $_GET['li_' . $i . '_name'],
                "quantity" => $_GET['li_' . $i . '_quantity']
            );


            $lib->db->insert_row("com_products_order_xref", $xrefdata);
        }
    }



    /* foreach ($carts as $c) {
      $cdata = explode("___", $c);

      $xrefdata = array(
      "pro_id" => $cdata[1],
      "order_id" => $_GET['order_id']
      );

      $lib->db->insert_row("com_products_order", $xrefdata);
      }
     */
}




/*

  $_GET['item'] =



  com_products_order_xref */
?>
