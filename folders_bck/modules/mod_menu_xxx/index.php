<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_menu($pro) {
    global $lib;



    $datasql = $lib->db->get_data('menu_itmes', '', 'cat_id=0 and `delete`=0 and   enabled=1 and parent_id=' . $pro['selecmenu'] . " and `show`='1'  Order by `order` ");

    $data = "<div class='menu menu" . $pro['selecmenu'] . "'><ul>";

    foreach ($datasql as $d) {
        $href = "";



        if ($d['openType'] == "1") {

            $moreClass = "lightbox-url";
        } else {

            $moreClass = "";
        }



        //  if ($pro['likstatus'] == 'SEO') {


  

        if (trim($d['mei_main']) == "com_link") {

            $href = $d['com_link'];
        } else {

            $href = $lib->util->createURLAL($d['mei_alias']);
        }


     if (trim($d['mei_alias']) == "Products") {
         
         $href="#";
         
     }




        /* } else {

          $href = "/?alias=" . $d['mei_alias'];
          } */


        $moreact = "";

        if ($_GET['alias'] == $d['mei_alias']) {
            $moreact = "li_active ";
        } else {


            $moreact = "";
        };




        $data .= '<li class=\'  menu_itm ' . $moreact . '\'><div class=\'menu_itminnr\'>
            <a class=\'' . $moreClass . '  __' . $d['id'] . ' my_menu_itm \' href=\'' . $href . '\'>';


        if ($pro['viewImage'] == "1") {

            $data .="<img src='/uploads/images/" . $d['mei_image'] . "'/>";
        }



        $data .= $d['mei_title'] . "</a>" . getsubmenu($d['id'], $pro['selecmenu'], $pro) . '</div></li>';
    }
    $data.='</ul></div>';


    return $data;
}

?>
