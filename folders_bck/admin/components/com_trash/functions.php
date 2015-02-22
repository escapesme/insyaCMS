<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function do_restore() {
    global $lib;
    $ids = $_POST['ids'];
    foreach ($ids as $id) {
        $myid = explode("__", $id);

        $mydata = array("delete" => "0");

        $lib->db->update_row($myid[0], $mydata, $myid[1]);
    }
}

function do_remove() {
    global $lib;
    $ids = $_POST['ids'];
    foreach ($ids as $id) {
        $myid = explode("__", $id);

        $lib->db->delete_row($myid[0], $myid[1]);
    }
}

?>
