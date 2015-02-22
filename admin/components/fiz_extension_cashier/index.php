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
    $where = $lib->coms->faiz->serach() ." and ex_paid=0 ". $out . " " . $od . $limit;
    $lib->admin->dbdata = $lib->db->get_data("fiz_extension", '', $where);
}

echo $lib->adminEng->getComponentMain("fiz_extension");

function returns($name, $field) {


    if (isset($_GET[$name])) {

        $vs = explode(",", $_GET[$name]);
        $i = 0;

        $dm = " ( ";
        foreach ($vs as $v) {
            $mor = "";

            if ($i > 0) {
                $mor = " or ";
            }

            $dm .= $mor . " " . $field . "='" . $v . "'";

            $i++;
        }

        $dm .= " ) ";
    }

    return $dm;
}
?>



