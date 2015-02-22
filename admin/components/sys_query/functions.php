<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function saveData() {
    global $lib;
}

// <editor-fold defaultstate="collapsed" desc="comment">
function addData() {
    /* @var $lib  libs\libs */
    global $lib;



    $data = '<div class=\'allsteps\'>
        <div class=\' add addstep\'>
         <li title="updiate Qury" class="updiateQury"><i class="fa fa-refresh"></i></li>
        <li title="Check Qury" class="checkQury"><i class="fa fa-check"></i> </li>
        <li title="Add Qury" class="addQury"> <i class="fa fa-plus"></i></li></div><div class=\'quers\'></div></div>';
    return $data;
}

function updatData() {
    
    
    
    
}

// </editor-fold>
//getAllTable();

function getAllTable() {
    /* @var $lib  libs\libs */
    global $lib;
    $d = $lib->db->get_table_names();

    //  print_r(getfildes("com_products_order"));
}

function getfildes($tabel) {
    /* @var $lib  libs\libs */
    global $lib;
    return $lib->db->get_table_fields($tabel);
}

function editdatjs() {

    $data = "<script>editdatjs()</script>";
    return $data;
}

?>