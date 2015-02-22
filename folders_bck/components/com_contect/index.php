<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro) {


    global $lib;


   $data ="<div class='main_contect'>";

    if ($pro['showmap'] == "1") {

        $data .="<div class='contectMap'>". gmap($pro)."</div>";
    }





    $datasql = $lib->db->get_row("com_contect", "", "id=" . $pro[contect]);
    $data .= "<div class='contect'>";
    updatedata($datasql, $pro);






    $data.="<div class='intro'>" . $datasql['intro'] . "</div>";



    $data.= $lib->forms->getFiledsFormStrign("db", "com_contect", $pro[contect], "fileds_names");








    $data.="</div>";
    $data.="</div>";

    return $data;
}
?>
<style>


</style>