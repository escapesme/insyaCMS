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
            $r .=com_project_item($id, $l, $settings);
            break;
        case "cat":



            if ($id == "showcart") {


                $o['type'] = "com_project";
                $o['id'] = "showcart";
                $o['cart'] = $settings['cart'];
                $r.= $lib->plugins->importPlugin("plg_cart", $settings, $o);
            } else {

                if (isset($_GET['id'])) {


                    $catdata = $lib->db->get_row("com_project_catgories ", "* ", "alias = '" . $_GET['id'] . "'");


                    
                    $r .="<div class='catTitleAll' style='background:url(/uploads/images/" . $catdata['image'] . ")' ><div class='bgEffeict'></div><div class='pdata'>"
                            . "<div class='catTitle'>" .  $lib->language->getText("com_project_catgories", "title", $catdata['id'], $catdata['title'])  . "</div>"
                            . "<div class='catDes'>" .   $lib->language->getText("com_project_catgories", "des", $catdata['id'], $catdata['des']) . "</div>"
                            . "<div class='catImg'><img src='/uploads/images/" . $catdata['th_image'] . "' /></div>"
                            . "</div></div>"
                            . "<div class='catproTitle'><div class='pdata'><div class='datatitle'>" .  $lib->language->getText("com_project_catgories", "title", $catdata['id'], $catdata['title']) . " <span>" . $l['products'] . " </span></div>"
                            . "</div>"
                            . "";

                    $r .= "<div class='pdata catproData' >" . $lib->coms->project->com_project_getblocks(com_project_getData($catdata['id']), $l, $settings) . "</div>";
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
