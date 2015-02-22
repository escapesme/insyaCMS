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
    $where = "(" .  $lib->coms->faiz->serach() . ") " . $out . " " . $od . $limit;
    $lib->admin->dbdata = $lib->db->get_data("fiz_reservation", '', $where);
}


echo $lib->adminEng->getComponentMain("fiz_reservation");




$data = $lib->db->get_data("fiz_approved_status");



$out = "<div class='infosbar'>";
$out.=
        "<fieldset>
  <legend>All Results</legend><ul>";

$out.= "<li>  <label>All " . " </label> " . count($lib->admin->getdata("true", "", "", "true")) . "</li>";
$out.= "<li>  <label>Not Approved" . " </label> " . count($lib->admin->getdata("true", "", "and approved=0", "true")) . "</li>";
foreach ($data as $d) {
    $out.= "<li> <label>" . $d['title'] . " </label> " . count($lib->admin->getdata("true", "", "and approved=" . $d['id'], "true")) . "</li>";
}
$out.="</ul></fieldset>";

$out.=
        "<fieldset class='tow'>
  <legend>Search Results</legend><ul>";
$out.= "<li> <label>" . " All" . "  </label>" . count($lib->admin->getdata("true", "", "")) . "</li>";
$out.= "<li> <label>" . " Not Approved" . "  </label>" . count($lib->admin->getdata("true", "", "and approved=0")) . "</li>";
foreach ($data as $d) {

    $out.= "<li> <label>" . $d['title'] . "  </label>" . count($lib->admin->getdata("true", "", "and approved=" . $d['id'])) . "</li>";
}

$out.="</ul></fieldset>";
$out .= "</div>";


echo $out;
?>



<style>

    .infosbar fieldset{
        width:45%;

        margin: 2%;
        position: absolute;
        top:120px;
        display: inline

    }
    .infosbar fieldset.tow{
        left:50%;

    }.listindx{
        top:60px;
        margin-bottom: 100px;
    }


    .tools_bar{

        top: 104px;
    }
</style>


