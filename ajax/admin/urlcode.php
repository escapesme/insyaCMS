<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$g = $_GET;
if (!isset($g['data']) && isset($_POST['data'])) {

    $g = $_POST;
}


if (isset($g['status']) && $g['status'] == "en") {
    echo urlencode($g['data']);
} else {
    echo urldecode($g['data']);
}
?>
