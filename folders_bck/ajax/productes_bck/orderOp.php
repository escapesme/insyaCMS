<?php
session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


global $lib;


if ($_GET['status'] == "order_done") {
    $data = array("order_status" => "1");
    $lib->db->update_row("com_products_order", $data, "order_id=" . $_SESSION['order_id']);
} else {

    $_GET['order_id'] = uniqid();
    $data = $_GET;

    unset($data['file']);
    unset($data['file']);

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

    $setting = $lib->db->get_row("com_products_setting", "", "site='" . $_GET['settingsite'] . "'");



    //  echo $_GET['order_id'];
}
?>
<style>



    sdfgdfg{


    }
</style>
