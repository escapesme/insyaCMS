<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_ipData($pro) {
    global $lib;
    $re = "";


$lib = new Libs;





    if (isset($_GET['site'])) {
        $re = '';
    } else {


        $IP = $_SERVER['REMOTE_ADDR'];
        //  $tt = file_get_contents('http://geoip.maxmind.com/a?l=hVWzBFybLR8f&i=' . $IP);

        $tt = "EG";
        //  echo $lib->util->cities->urlConvert($tt);

        

        if (!isset($_GET['alias'])) {
            $re = ' <script>window.location = \'/site/' . $lib->util->cities->urlConvert($tt) . '/\'</script>';
        } else {
            $url = curPageURL();
            $u = explode($_GET['alias'], $url);

            $re = ' <script>window.location = \'/site/' . $lib->util->cities->urlConvert($tt) . "/" . $_GET['alias'] . $u[1] . '\'</script>';
        }
    }
    return $re;
}

function curPageURL() {
    $pageURL = 'http';
    if ($_SERVER["HTTPS"] == "on") {
        $pageURL .= "s";
    }
    $pageURL .= "://";
    if ($_SERVER["SERVER_PORT"] != "80") {
        $pageURL .= $_SERVER["SERVER_NAME"] . ":" . $_SERVER["SERVER_PORT"] . $_SERVER["REQUEST_URI"];
    } else {
        $pageURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
    }
    return $pageURL;
}

?>
