<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


if (isset($_GET['status'])&&$_GET['status'] == "en") {
    echo urlencode($_GET['data']);
} else {
    echo urldecode($_GET['data']);
}


?>
