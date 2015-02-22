<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
global $lib;
$wigth = $_GET['wigth'];
$type = $_GET[type];




if ($type == "fixedprice") {

    $s = $lib->util->cities->getSiteGetV("id", $_GET['postCode']);




    $chData = $lib->db->get_data("plg_shipping", "*", "site='" . $s . "'");







    foreach ($chData as $d) {





        if (
                isbet($wigth, $d['lowest_weight'], $d['hightest_weight']) == true
        ) {

            $p = $d['fee'] . "__" . $d['id'];
            ;
            // }
        }
    }




    //echo $retpric;
    echo$p;








    // print($retpric);
} else if ($type == "country") {

    $postCode = $_GET['postCode'];
    $s = $lib->util->cities->getSiteGetV("id", $lib->util->cities->urlConvert($postCode));
    $ds = $lib->db->get_data("plg_shipping", "*", "site='" . $s . "'");
    $retpric = "";
    foreach ($ds as $d) {
        if (isbet($wigth, $d['lowest_weight'], $d['hightest_weight']) == true) {
            $retpric = $d['fee'] . "__" . $d['id'];
        }
    }
    print($retpric);
} else if ($type == "ziprange") {


    $postCode = $_GET['postCode'];


    $ds = $lib->db->get_data("plg_shipping");
    $retpric = "";
    $p = "";

    foreach ($ds as $d) {

        $min_postcode = explode(",", $d['min_postcode']);
        $max_postcode = explode(",", $d['max_postcode']);
        //$postcode_type = explode(",", $d['postcode_type']);
        for ($i = 0; $i < count($min_postcode); $i++) {
            // if ($postcode_type[$i] == $postCode[0]) {



            if (
                    isbet($postCode, $min_postcode[$i], $max_postcode[$i]) == true &&
                    isbet($wigth, $d['lowest_weight'], $d['hightest_weight']) == true
            ) {

                $p = $d['fee'] . "__" . $d['id'];
                ;
                // }
            }
        }




        //echo $retpric;
    } echo$p;
} else {


    $postCode = splitpost($_GET['postCode']);
    $ds = $lib->db->get_data("plg_shipping");
    $retpric = "";

    foreach ($ds as $d) {

        $min_postcode = explode(",", $d['min_postcode']);
        $max_postcode = explode(",", $d['max_postcode']);
        $postcode_type = explode(",", $d['postcode_type']);
        for ($i = 0; $i < count($postcode_type); $i++) {
            if ($postcode_type[$i] == $postCode[0]) {

                if (
                        isbet($postCode[1], $min_postcode[$i], $max_postcode[$i]) == true &&
                        isbet($wigth, $d['lowest_weight'], $d['hightest_weight']) == true
                ) {

                    $retpric = $d['fee'] . "__" . $d['id'];
                    ;
                }
            }
        }




        //echo $retpric;
    }


    if ($retpric == "") {


        $dalls = $lib->db->get_data("plg_shipping", "*", "postcode_type='ALL'");
        foreach ($dalls as $d) {

            if (isbet($wigth, $d['lowest_weight'], $d['hightest_weight']) == true) {

                print( $d['fee'] . "__" . $d['id']);
            }
        }
    } else {

        print($retpric);
    }
}

function isbet($num, $minnum, $maxnum) {
    $returnData = FALSE;



    if (( $num >= $minnum ) && ( $num <= $maxnum )) {
        $returnData = true;
    }
    return$returnData;
}

function splitpost($postCodes) {

    $postCodes = str_split($postCodes, 2);
    $postCodes1 = $postCodes[0];
    $postCodes2 = str_replace($postCodes[0], "", $postCodes);

    $returnData[0] = $postCodes1;
    $returnData[1] = $postCodes[1];


    return $returnData;
}

?>
