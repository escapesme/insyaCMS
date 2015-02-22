<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



global $projectSetting;

function main($p, $l) {

    $r = "";
    /* @var $lib  libs\libs */
    global $lib, $projectSetting;

    $how = $_GET['show'];
    $id = $_GET['id'];

    $settings = $lib->db->get_row("com_project_setting");

    $projectSetting = $settings;








    switch ($how) {

        case "item":
            
            
            $r .=com_project_item($id, $l,$settings);
            break;
        case "cat":



            if ($id == "showcart") {



                $o['type'] = "com_project";
                $o['id'] = "showcart";
                $o['cart'] = $settings['cart'];
                $r.= $lib->plugins->importPlugin("plg_cart", $settings, $o);
            } else {

                if (isset($_GET['id'])) {
                    $r .= $lib->coms->project->com_project_getblocks(com_project_getData($_GET['id']), $l, $settings);
                } else {


                    $r .= $lib->coms->project->com_project_getblocks(com_project_getData($_GET['cat_id']), $l, $settings);
                }
            }




            break;


        default :

            if ($id == "showcart") {

                
                $o['type'] = "com_project";
                $o['id'] = "showcart";
                $o['cart'] = $settings['cart'];
                $r.= $lib->plugins->importPlugin("plg_cart", $settings, $o);
            } else {



                $r .= com_project_getsearchBar($l, $settings);

                $r .= $lib->coms->project->com_project_getblocks(com_project_getData($_GET['cat_id']), $l, $settings);
                
                
            }

            break;
    }

    return $r;
}
