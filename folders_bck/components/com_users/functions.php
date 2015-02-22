<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function myproject($l, $id) {
    /* @var $lib  \libs\libs */
    global $lib;
    if ((isset($_SESSION['login']) && !empty($_SESSION['login']))) {
        $id = $lib->users->getUser("id");
        $t = "myproject";
        $r .= "<div class='allBlocks'>";


        $items = $lib->db->get_data("plugincart_order_item", "", "user_id=" . $id);


        $i = 0;
        foreach ($items as $im) {
            if ($i == 0) {
                $q .= " id='" . $im['item_id'] . "'  ";
            } else {
                $q .= " or id='" . $im['item_id'] . "'  ";
            }
            $i++;
        }





        if ($q == "") {

            $sql = "1!=1";

            $r .="<div class='info'>&nbsp;&nbsp;&nbsp;&nbsp;" . $l['emptyProjectMsg'] . "</div>";
        } else {
            $sql .="(" . $q . ")";
        }
        $sqlData = $lib->db->get_data("com_project", "*", $sql);
        $lib->coms->project->userId = $id;
        $r .= $lib->coms->project->com_project_getblocks($sqlData, $l, "user");
        $r .= "</div>";
        array_push($lib->userPanel->panleheader, $t);
        array_push($lib->userPanel->panleData, "<div class='tabsbody $t' > " . $r . "</div>");
    }
}

function messagesPanle() {


    global $lib;


    $title = "messages";


    $data = "<div  class='tabsbody $title' >messages</div>";
    array_push($lib->userPanel->panleData, $data);
    array_push($lib->userPanel->panleheader, $title);
}

function dataPanle() {
    global $lib;

    $title = "data";
    $data = "<div  class='tabsbody $title userinData' ></div>";
    array_push($lib->userPanel->panleData, $data);
    array_push($lib->userPanel->panleheader, $title);
}
?>


<style>
    .userToolsBar ,  .tabs,.Datachange{
        width:100%;
        clear: both;


        background: #ccc;
        margin-top: 5px;
        border:1px #999 solid;
        min-height: 30px;

    }
    .tabs{

        margin-top: 50px;  


    }
    .userToolsBar li ,.tabs li{
        float:right;
        padding:2px;
        background: #eee;
        border:1px #999 solid;
        min-width: 50px;
        min-height: 20px;
        cursor: pointer;
        margin: 2px;
        text-align: center

    }

    .tabs li{
        width: 18.5%;
    }


    .tabData{

        width:100%;
        clear: both;

    }
    .userData .image{
        float: left;
        width: 90px;
        height: 100px;
        background: #999;
        margin-top: -50px;
    }
    .Datachange{

    }
</style>

