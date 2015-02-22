<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function plg_projectdata($data, $lang, $o) {

    /* @var $lib  libs\libs */
    global $lib;


    $r = "";

    // <editor-fold defaultstate="collapsed" desc="sum">
    if ($data["type"] == "sum") {
       // $umpric = $lib->db->get_row("plugincart_order_item", "sum(price) as price");
        
        
        $umpric = $lib->coms->project->PayProjectBlunceAll();
        
        $sdata = $lib->db->get_data("com_project", "*");
        
        
        $r .= "<div class='projectdata '>";
        $r .= "<div class='sum'>";
//" . $lang['project'] . "
        $r .= "<div class='projectes'><span> " . count($sdata) . "</span> " . $lang['allProjects'] . " </div>";
        $r .= "<div class='donations'><span> " . $umpric['price'] . " " . $lang['cun'] . "</span>  " . $lang['alldonations'] . " </div>";

        $r .= "</div>";


        $r .= "</div>";
    } else {// </editor-fold>
        $sdata = $lib->db->get_row("com_project", "*", "id=" . $data["id"]);
        // $scatdata = $lib->db->get_row("com_project_catgories", "*", "id=" . $sdata["cat_id"]);



        $catp = $lib->colltions->getPluginData("com_project_catgories", $sdata['main_cat']);







        $umpric = $lib->coms->project-> PayProjectBlunce($data["id"]); // $lib->db->get_row("plugincart_order_item", "sum(price) as price", "item_id=" . $data["id"]);

        
   
        
        $r .="<div class='projectdata'>";


        // <editor-fold defaultstate="collapsed" desc="title">
        if ($data["type"] == "title" || $data["type"] == "all") {
            $r .= "<div class='plg_prodataTitle'>" . $sdata['title'] . "</div>";
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="donations">
        if ($data["type"] == "donations" || $data["type"] == "all") {
            $req_donations = $sdata['req_donations'];
            $donations = $umpric['price'];
            $donations_per = round(($umpric['price'] / $sdata['req_donations']) * 100);
            if ($donations == null) {
                $donations = "0";
            }
            $r .= "<div class='req_donations'>"
                    . "<div class='done'> " . number_format($donations, 0) . " <span>" . $lang['done'] . "</span></div>"
                    . "<div class='req_donationsbar'><div style='width:" . $donations_per . "%'></div></div>"
                    . "<div class='per'><span>(" . $donations_per . "% ) </span>" . $lang['per'] . "</div>"
                    . "<div class='all'> " . number_format($req_donations, 0) . " <span>" . $lang['all'] . "</span></div>"
                    . "</div>";
        }

// </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="date">
        if ($data["type"] == "date" || $data["type"] == "all") {
            $dayNUMBER = $lib->util->howManyDays(date("Y-m-d"), $sdata['end_data']);
            $dayTitle = "<i>" . $dayNUMBER . "</i> &nbsp; " . $lang['days'] . " <span>" . $lang['yet'];

            if ($dayNUMBER == 0) {
                $dayTitle = $lang['endtoday'];
            } else if ($dayNUMBER < 0) {
                $dayTitle = $lang['endsoon'];
            }

            $r .= "<div class='end_data'> "
                    . $dayTitle . "</div>";
        }
// </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="user">
        if ($data["type"] == "users" || $data["type"] == "all") {
//
             $all = $lib->coms->project-> PayProjectitems($data["id"]);
            
            $userTitle = "<span>" . count($all) . " </span>" . $lang['user'];
            if (count($all) == 0) {

                $userTitle = $lang['befrist'];
            }

            //befrist


            $r .= "<div class='users'>" . $userTitle . " </div>";
        }
        // </editor-fold>









        $r .="</div>";
        $r .="<div style='background:#" . $catp['catcolor'] . "' class='slideShiwbg'>" . "</div>";
    }
    return $r;
}
