<?php

session_start();
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */
global $lib;
if (!isset($_SESSION['polling' . $_GET['q_id']])) {
    $_SESSION['polling' . $_GET['q_id']] = "done";
    $mData = $lib->db->get_row("com_poll_answers", "", "id=" . $_GET['ans']);

    $d = array(
        "nums" => $mData['nums'] + 1,
    );

    $lib->db->update_row("com_poll_answers", $d, $_GET['ans']);
    $_SESSION['polling' . $_GET['q_id']] = "done";
} else {

    echo "done";
}
?>

