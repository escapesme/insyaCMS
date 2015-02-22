<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$copunCode = $_GET['copunCode'];
$pric = $_GET['pric'];
$status = $_GET['status'];
$product_id = $_GET['product_id'];



//$wight = splitpost($_GET['wight']);


$ds = $lib->db->get_row("plg_coupon", "*", "code='" . $copunCode . "'");

$test = $product_id;


if ($status == "one") {
    $dsx = $lib->db->get_row("com_products_coupon_xref", "*", "item_id='" . $ds['id'] . "' and cat_id='" . $product_id . "'");

    $ms = $ds['usetype'];
    ;

    // print_r($ds);
    $savings = "0";
    $returnpri = $pric;
    if (isset($dsx['id'])) {
        $test.=$ds['id'];



        $test.= "---" . $ds['savings'];

        $udata = array("usenums" => $ds['usenums'] + 1);

        $savings = $ds['savings'] / 100 * $pric;

        $returnpri = $pric - $savings;
        $ds = $lib->db->update_row("plg_coupon", $udata, "code='" . $copunCode . "'");
    }
    echo round($savings, 2) . "__" . round($returnpri, 2) . "__" . $ms;
    // echo "<br/>" . $test;
} else {






    $returnpri = $_GET['pric'];
    $savings = 0;

    if ($_GET['pric'] >= $returnpri['min']) {



        if ($ds['savings-type'] == "fixed") {
            $returnpri = $ds['savings'] - $pric;
        } else if ($ds['savings-type'] == "percent") {
            $returnpri = $ds['savings'] % - $pric;
        }
        $savings = $returnpri - $_GET['pric'];



        $udata = array("usenums" => $ds['usenums'] + 1);

        $ds = $lib->db->update_row("plg_coupon", $udata, "code='" . $copunCode . "'");
    }



    echo $savings . "__" . $returnpri . "__" . $ds['usetype'];
    ;
}
?>
