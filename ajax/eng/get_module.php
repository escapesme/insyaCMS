<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();
    global $lib;
    echo  $lib->front->getmodule($_GET['postion']);
?>
