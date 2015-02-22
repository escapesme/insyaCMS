<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function plg_rescores($data, $lang) {

    /* @var $lib  libs\libs */
    global $lib;


    $id = $data['id'];
    if ($data['id'] == "get") {

        $id = $_GET['do'];
    }




    $d = $lib->db->get_row("plg_rescores", "", "id='" . $id . "'");

    
    
    $r.="<div class='res_all'><div class='res_info h3'>" . $lang['info'] . "</div>";
    $r.="<div class='res_img'><img clas='boxshadow'src='/uploads/images/" . $d['image'] . "'/> </div>";

    $r.="<div class='res_data'> <div class='res_title h4'><label>" . $lang['name'] . "</label>" . $d['title'] . "</div>";
    $r.="<div class='res_number h4'><label>" . $lang['number'] . "</label>" . $d['number'] . "</div>";
    $r.="<div class='res_phone h4'>" . $d['phone'] . "</div>";

    $r.="<div class='res_address h4'>" . $d['address'] . "</div></div>";
    
     $r.="<div class='res_url'>" . $d['url'] . "</div>";
    $r.="<div class='res_des'>" . $d['des'] . "</div>";
        
             $r.= ""
            . ""
            . "</div>";

    
    return$r;
}
?>

<style>

    .res_all{
        padding:40px;
    }
    .res_info{
        line-height: 40px;
    }
    .res_img img{
        height:150px;
        width:150px;
        float: right;box-shadow: 1px 1px 5px #CCCCCC;
        padding:4px;
    }
    .res_data{
        margin-right: 180px;


    }
    .res_title,.res_number{

        border-bottom: 1px #eee solid;

        line-height: 40px;

    }

    .res_des{
        clear: both;
    }
    .res_phone{
        float:left;
    }

</style>


