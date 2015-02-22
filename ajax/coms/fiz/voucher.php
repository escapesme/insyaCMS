<?php

$get = $_GET;
/* @var $lib  libs\libs */
global $lib;

//print_r($get);




foreach ($get as $g => $v) {

    $gs = explode("_", $g);
    if ($gs[0] == "room") {

        $rooms_data.=$g . "=>" . $v . "__";
    }
}


$ids = explode(",", $get['ids']);




PRINT_r($get);

$minCheckout = $lib->coms->faiz->minDateFromIDS($ids);



$maxCheckin = $lib->coms->faiz->maxDateFromIDS($ids, "ex_checkin", "first");







if ($lib->util->dateTime->dateStrtotime($maxCheckin) > $lib->util->dateTime->dateStrtotime($minCheckout)) {

    echo "Error: Checkin date is grater than checkout date;";

    if ($lib->util->dateTime->dateStrtotime($maxCheckin) > $lib->util->dateTime->dateStrtotime($get['v_checkin'], true) ||
            $lib->util->dateTime->dateStrtotime($minCheckout) < $lib->util->dateTime->dateStrtotime($get['v_checkout'], true)
    ) {



        echo "Error: Group dates error";
    }
} else {




    $vid = "";







    foreach ($ids as $id) {
        if ($lib->coms->faiz->hasVoucher($id)) {
            $v = $lib->coms->faiz->getVoucher($id);

            $lib->coms->faiz->addVoutcher($id, "", $v['rooms_data'], $v['remarks'], $v['$hotel_id'], $v['v_checkout'], $get['v_checkin'], "cut");
        }
    }


    foreach ($ids as $id) {
        $status = "add";
        if ($lib->coms->faiz->hasVoucher($id)) {

            $status = "trns";
        }
        $vid = $lib->coms->faiz->addVoutcher($id, $vid, $rooms_data, $get['remarks'], $get['$hotel_id'], $get['v_checkin'], $get['v_checkout'], $status);
    }
}

 