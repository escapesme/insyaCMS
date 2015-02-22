<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of com_projects
 *
 * @author empcl_000
 */

namespace libs\coms;

class projectClass {
    /* @var $lib  \libs\libs */

    var $lib;
    var $userId;

    public function __construct($lib) {
        $this->lib = $lib;
    }

    function returnStatusData($id) {
        /* @var $lib  libs\libs */
        global $lib;
        return $lib->db->get_row("com_project_status", "*", "id='" . $id . "'");
    }

    function com_project_bar($id, $lang, $datastatus, $bg) {
        /* @var $lib  libs\libs */
        global $lib;
        $sdata = $lib->db->get_row("com_project", "*", "id=" . $id);
        // $scatdata = $lib->db->get_row("com_project_catgories", "*", "id=" . $sdata["cat_id"]);
        $catp = $lib->colltions->getPluginData("com_project_catgories", $sdata['cat_id']);




        $umpric = $this->PayProjectBlunce($id);



        $r .= "<div class='Blockbar'>";
        if ($datastatus == "user") {

            $usermpric = $lib->db->get_row("plugincart_order_item", "sum(price) as price", "item_id=" . $id . " and user_id=\"" . $this->userId . '"');





            $r .="<div class='userperall'>" . $lang['mydon'] . "<div class='userper' style='background:#" . $bg . "'>"
                    . "<span class='number'>" . round(($usermpric['price'] / $umpric['price']) * 100) . "</span><span>%</span></div></div>";
        } else {





// <editor-fold defaultstate="collapsed" desc="donations">

            $req_donations = $sdata['req_donations'];
            $donations = $umpric['price'];
            $donations_per = round(($umpric['price'] / $sdata['req_donations']) * 100);



            if ($donations_per == "0") {
                $donations_per = $lang['nodonations'];
            } else {

                $donations_per.="%";
            }


            $r .= "<div class='req_donations'>"
                    . "<div class='all'> <span class='currency'>" . $lang['currency'] . "</span> " . number_format($req_donations, 0) . "</div>"
                    . "<div class='per'>" . $donations_per . "</div>"
                    . "<div class='req_donationsbar'><div style='width:" . $donations_per . "%'></div></div>"
                    . "</div>";


// </editor-fold>
            // <editor-fold defaultstate="collapsed" desc="date">

            if ($lib->util->howManyDays(date("Y-m-d"), $sdata['end_data']) == 0) {
                $r .= "<div class='end_data'> " . $lang['nodays'] . "</div>";

                /*  } else if ($lib->util->howManyDays(date("Y-m-d"), $sdata['end_data']) == 1) {
                  $r .= "<div class='end_data'> " . $lang['oneday'] . "</div>";
                  } else if ($lib->util->howManyDays(date("Y-m-d"), $sdata['end_data']) == 2) {
                  $r .= "<div class='end_data'> " . $lang['towday'] . "</div>"; */
            } else if ($lib->util->howManyDays(date("Y-m-d"), $sdata['end_data']) < 0) {
                $r .= "<div class='end_data'> " . $lang['endsoon'] . "</div>";
            } else {

                $r .= "<div class='end_data'>  " . $lang['left'] . "" . $lib->util->howManyDays(date("Y-m-d"), $sdata['end_data']) . "<span> " . $lang['yet'] . "</span></div>";
            }
// </editor-fold>
            // <editor-fold defaultstate="collapsed" desc="user">

            $all = $lib->coms->project->PayProjectitems($id);

            if (count($all) == 0) {
                $r .= "<div class='users'>" . $lang['nouser'] . " </div>";
            } else {


                $r .= "<div class='users'>" . count($all) . " " . $lang['user'] . " </div>";
            }
            // </editor-fold>
        }

        $r.=" </div>";


        return$r;
    }

    function com_pro_retuncolorFrom_cat($id) {
        /* @var $lib  libs\libs */
        global $lib;


        $catdata = $lib->db->get_row("com_project_catgories", "*", "id='" . $id . "'");
        $e = $lib->colltions->getPluginData("com_project_catgories", $catdata['id']);

        return "#" . $e['catcolor'];
    }

    function com_project_getblocks($sqlData, $l, $datastatus = "") {
        $r = "";
        /* @var $lib  libs\libs */
        global $lib;




        $r .= "<div class = 'allBlocks'>";

        if (!count($sqlData)) {

            $r .="<div class='info '>" . $l['noresults'] . "</div>";
        }
        foreach ($sqlData as $data) {
            $catdata = $lib->db->get_row("com_project_catgories ", "* ", "id = '" . $data['main_cat'] . "'");
            $e = $lib->colltions->getPluginData("com_project_catgories", $catdata['id']);
            $url = $lib->util->createURL("com_project", $catdata['alias'], $data['alias']);

            $status = $this->returnStatusData($data['project_status']);



            $r .= "<div class = 'Block  ' style = 'background:#" . $e['catcolor'] . "' > ";


            if ($status['is_link'] == "1") {

                $r .= "<a href = '" . $url . "' >";
            }
            if ($status['view_msg'] == "1") {
                $h = "";
                if ($status['msg_hover'] == "1") {
                    $h = "hover";
                } else {
                    $h = "";
                }
                $r .= "<div class = 'msg $h'>";

                if ($status['show_main_cat'] == "1") {



                    $r .= "<div style = 'background:#" . $e['catcolor'] . "' class = 'caticone'>"
                            . ""
                            . " <img src = '/uploads/images/" . $catdata['image'] . "' / ></div>";
                }



                if ($datastatus == "user") {

                    $r .= "<div class = 'mydata'>" . $status['usermsg'] . "</div>";
                } else {
                    $r .= "<div class = 'mydata'>" . $status['msg'] . "</div>";
                }


                if ($status['view_more'] == "1") {

                    $r .= "<div class = 'mymore'>" . $status['view_more_text'] . "</div>";
                }

                $r .= "</div>";
            }
            $r .= "<div class = 'footerbg'></div>";




            $r .= "<div class = 'blackImage " . $status['bg_effect'] . "'>";



            $r .=$this->getcatbr($data['id']);
            $r .= "<img class = 'blackImg' src = '/uploads/images/" . $data['image'] . "' alt = '" . $data['title'] . "' />";

            if ($status['show_reflection'] == "1") {
                $r .= "<div class = 'reflection hover'>"
                        . " <img class = '' src = '/uploads/images/" . $data['image'] . "' alt = '" . $data['title'] . "' />"
                        . " </div>";
            }



            if ($status['view_overlayer'] == "1") {

                $r .= "<div style = 'background:#" . $status['overlayer_color'] . "' class = 'overlayer'></div>";
            }

            $r .="</div>";







            $file = $lib->util->siteSetting['site_link'] . "/lib/" . $lib->foldersMap->lib_folder . "xml/";



            $file1 = $file . "egstates_" . $lib->util->siteSetting['lang'] . ".xml";

            $file2 = $file . "location/" . $data['location'] . "_" . $lib->util->siteSetting['lang'] . ".xml";
            $r .= "<div class = 'bottomdata'>";

            if ($status['view_title']) {
                $r .= "<div class = 'blackTitle'>" . $data['title'] . "</div>";
            }


            if ($data['location'] != "-1" && $data['location'] != "" && $status['view_loction'] == "1") {
                if ($status['view_loction_hover'] == "1") {
                    $more = "nohover";
                } else {
                    $more = "";
                }


                $r .= "<div class=' blackLocation $more'>" .
                        $lib->util->readXmlDataString($file1, "egstates")[$data['location']]["value"] . " " .
                        $lib->util->readXmlDataString($file2, $data['location'])[$data['location2']]["value"] . "</div>";
            }






            if ($status['view_des'] != "0") {
                $mr2 = "";
                if ($status['view_msg'] == "1") {
                    $mr2 = "hidden";
                }

                if ($status['msg_hover'] == "1") {

                    $mr2 = "nohover";
                }


                $r .= "<div class = 'blackDes $mr2'>" . $data['short_des'] . "</div>";
            }

            if ($status['view_don_bar'] != "0") {


                $r .= $this->com_project_bar($data['id'], $l, $datastatus, $e['catcolor']);
            }

            $r .= "</div>";
            if ($status['is_link'] == "1") {
                $r .= "</a>";
            }

            $r .= "</div>";
        }
        $r .= "</div>";
        return $r;
    }

    function getcatbr($id) {

        /* @var $lib  libs\libs */
        global $lib;
        $cats = $lib->db->get_data("com_project_xref ", " ", "item_id = " . $id);


        $r .= "<div class ='catbr'>"
                . "<ul>";
        foreach ($cats AS $c) {
            $e = $lib->colltions->getPluginData("com_project_catgories", $c['cat_id']);
            $cdata = $lib->db->get_row("com_project_catgories ", "* ", "id = '" . $c['cat_id'] . "'");


            $url = $lib->util->createURL("com_project", $cdata['alias']);


            $r .= "<li style = 'background:#" . $e['catcolor'] . "' > ";
            //  $r .= "  <a href = '" . $url . "' >";
            $r .="<img src = '/uploads/images/" . $cdata['image'] . "' />";
            //  $r .= "</a>";
            $r .= "</li>";
        }
        $r .= "</ul></div>";
        return $r;
    }

    function PayProjectdata($id, $data = "*", $mro="") {
        /* @var $lib  libs\libs */
        global $lib;

        $sqlString = "
            SELECT  
            $data
            From   plugincart_order
             
            INNER JOIN  plugincart_order_item  ON    
            plugincart_order.enabled='1' and 
           plugincart_order.delete='0'  and 
           plugincart_order.id=plugincart_order_item.cart_id  and 
           plugincart_order.status=1 and 
           plugincart_order_item.item_id=" . $id . " ".$mro;

        return $lib->db->get_data_query($sqlString);
    }

    function PayProjectdataAll($data = "*") {
        /* @var $lib  libs\libs */
        global $lib;

        $sqlString = "
            SELECT  
            $data
            From   plugincart_order
             
            INNER JOIN  plugincart_order_item  ON    
            plugincart_order.enabled='1' and 
           plugincart_order.delete='0'  and 
           plugincart_order.id=plugincart_order_item.cart_id  and 
           plugincart_order.status=1";

        return $lib->db->get_data_query($sqlString);
    }

    function PayProjectBlunce($id) {
        return $this->PayProjectdata($id, " sum(plugincart_order_item.price) as price")[0];
    }

    function PayProjectitems($id) {
        return $this->PayProjectdata($id, "plugincart_order_item.*");
    }

    
    
    function PayProjectBlunceAll() {
        return $this->PayProjectdataAll(" sum(plugincart_order_item.price) as price")[0];
    }
    
    
}
