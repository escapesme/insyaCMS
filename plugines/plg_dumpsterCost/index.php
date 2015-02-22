<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function getsettings() {
    global $lib;

    return $lib->db->get_row("com_qrecycle_setting");
}

function getposition() {
    global $lib;
    return $lib->db->get_row("com_yards");
}

function getprice() {
    /* @var $lib  \libs\libs */
    global $lib;
    $p = $lib->db->get_row("com_price_plan")['data'];


    $sestting = getsettings();

    print_R($sestting);

    $p = $lib->util->data->arrayFromString($p);

    foreach ($p as $k => $v) {
//   if ($k == "dumpsters") {

        $keys = explode("_", $k);

        if ($keys[1] == null) {
            $keys[1] = "0";
        }
        $r[$keys[1]][$keys[0]] = $v;
    }





//$r
    return $r;
}

/*
 * 
 * 
 * Array ( [dumpsterCost] => [setpform] => Array ( [map_address] => Ahmed El-Zayat, Ad Doqi, Ad Doqi, Giza, Egypt [map_coordinates] => (30.036279999999998, 31.2034314) [dumpsters] => 4 [concrete] => 1 [hazardous] => 1 ) [url] => ) Array ( [id] => 1 [postion] => [enabled] => 0 [delete] => 0 [order] => 0 [created] => 2014-11-23 16:27:13 [modified] => 0000-00-00 00:00:00 [concrete_dumpsters] => 1 [concretemsg] => [hazardousmsg] =>
  Hazardousmsg

  [title] => aaaa [des] => [qoute_save] => saveData )
 */

function plg_dumpsterCost($pro) {
    global $lib;
    $re = "";

    $_SESSION['map_coordinates'];
    $_SESSION['mapaddress'];
//dumpsters




    if ($_SESSION['hazardous'] == "1") {
        echo $sestting['hazardousmsg'];
        $cost=0;
    } else {



        if ($_SESSION['concrete'] == "1") {

            $_SESSION['dumpsters'] = $sestting['concrete_dumpsters'];


            echo $sestting['concretemsg'];
            ;
        }

        $org = getposition()['mapaddress'];

        $des = str_replace("(", "", $_SESSION['setpform']['map_coordinates']);
        $des = str_replace(")", "", $des);
        $des = str_replace(" ", "", $des);
        $des = str_replace(";", "", $des);
        $org = str_replace("(", "", $org);
        $org = str_replace(")", "", $org);
        $org = str_replace(" ", "", $org);
        $org = str_replace(";", "", $org);

        $routes = json_decode(file_get_contents('http://maps.googleapis.com/maps/api/directions/json?origin=' . $org . '&destination=' . $des . '&alternatives=true&sensor=false&units=imperial'))->routes;


        usort($routes, create_function('$a,$b', 'return intval($a->legs[0]->distance->value) - intval($b->legs[0]->distance->value);'));


        $prs = getprice();


        foreach ($prs as $p) {


            if ($p['dumpsters'] == $_SESSION['setpform']['dumpsters']) {

                $cost = $p['distanceprice'];
                $dbym = $routes[0]->legs[0]->distance->value / 1000;
                $exdistance = $dbym - $p['distance'];
                if ($exdistance > 0) {
                    $cost+= ($exdistance * $p['extraprice']);
                }
            }
        }
    }
    
    echo $cost;




    return $cost;
}

?>
