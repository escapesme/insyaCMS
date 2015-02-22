<?php

session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$myid = explode("___", $_GET['item']);
if (isset($_GET['stat']) && $_GET['stat'] == "delete") {

    deletpro($myid[1]);
} else {

    deletpro($myid[1]);
    $_SESSION[cart_productes].=";" . $_GET['item'];
}

function deletpro($id) {
    $ms = explode(";", $_SESSION[cart_productes]);

    foreach ($ms as $c) {
        $cs = explode("___", $c);

        if ($cs[1] != $id) {
            $retData .= ";" . $c;
        }
    }

    $_SESSION[cart_productes] = $retData;
}

?>
