<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */




/* @var $lib  \libs\libs */
global $lib;


$where_user = $lib->coms->faiz->returns("mumin_id", "Mumin_id");
if (trim($where_user) != "") {
    $ln = $lib->admin->getListStartNumber();
    $od = $lib->admin->getListOrder();
    $out = $lib->admin->getsqlreturn();
    $where =  $lib->coms->faiz->serach()  . $out . " " . $od . $limit;
    //        $where = $lib->coms->faiz->serach() ."  and approved<>0 and approved<>1". $out . " " . $od . $limit;

    $lib->admin->dbdata = $lib->db->get_data("fiz_reservation", '', $where);
}
echo $lib->adminEng->getComponentMain("fiz_reservation");



?>



