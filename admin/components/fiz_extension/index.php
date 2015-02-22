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
$where = "id='5'";





$ln = $lib->admin->getListStartNumber();
$od = $lib->admin->getListOrder();

$out = $lib->admin->getsqlreturn();


$this->listNumber = $lib->util->siteSetting['admin_list_limit'];

$where_user = "";








$where_user = returns("Jamiaat", "Mumin_id");

$userDatas = $lib->db->get_data("com_users", '', $where_user);

$dm = " ( ";
foreach ($userDatas as $d) {

  
    $mor = "";
    $rdata = $lib->db->get_row("fiz_reservation", '', "user_id=" . $d['id']);



    if (isset($rdata['reservation_id'])) {
        if ($i > 0) {
            $mor = " or ";
        }



        $where .= $mor . " reservation_id=" . $rdata['reservation_id'];
        $i++;
    }
}



$dm .= " ) ";

/*





  $where = $where . $out . "  " . $od . " LIMIT " . $ln . ",10";



  $lib->admin->dbdata = $lib->db->get_data("fiz_extension", '', $where);






 */


echo $lib->adminEng->getComponentMain();

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



