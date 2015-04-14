<?php

session_start();
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$status = $_POST['status'];


///echo $status;
switch ($status) {
    case "form":
        $_POST['form'] = urldecode($_POST['form']);


        $data = explode("&", $_POST['form']);


        foreach ($data as $d) {


            $ds = explode("=", $d);

            if (isset($_POST['name']) && $_POST['name'] != "" && $_POST['name'] != "null") {

                $tmp[$ds[0]] = $ds[1];
            } else {
                $_SESSION[$ds[0]] = $ds[1];
            }
        }

        if (isset($_POST['name']) && $_POST['name'] != "" && $_POST['name'] != "null") {
            $_SESSION[$_POST['name']] = "";
            $_SESSION[$_POST['name']] = $tmp;
        }



     //   print("<pre>" . print_r($_POST, true) . "</pre>");

        break;
}

