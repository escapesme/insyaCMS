<?php

session_start();
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$c = $_GET['code'];

/* @var $lib  libs\libs */
global $lib;

$r = $lib->users->checkValue("mobile_confirm_code", $c);
if ($r == "1") {
    $lib->users->updateValue("mobile_confirm", "1");
}
echo $r;
