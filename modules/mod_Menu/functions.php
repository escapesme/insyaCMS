<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function getsubmenu($id, $parent, $pro) {



    /* @var $lib  libs\libs */
    global $lib;




    $datasql = $lib->db->get_data('menu_itmes', '', 'cat_id=\'' . $id . '\'  and `delete`=0  and enabled=\'1\' and parent_id=\'' . $parent . '\' and `show`=\'1\' Order by `order`  ');








    if (is_array($datasql[0])) {

        //  print_r($datasql);


        $data = "<div class='submenu submenu" . $id . "'>
            
<div class='submenutop'></div>
<ul>";



        foreach ($datasql as $d) {


//$lib->language->getText("com_project", "title", $data['id'], $data['title']);



            $d = $lib->language->getDBArray("menu_itmes", $d['id'], $d);


            $pPermission = $lib->users->getMenuPermission();
            //  echo $d['permission_all']
            if ($d['permission_all'] == "1" || $lib->util->chkInPermission($d['id'], $pPermission) == true) {

                if ($lib->util->cities->getIsInSite($d['id'], $d['all_site'], "menu") == true) {


                    $dap = $lib->db->get_row('menu_itmes', '', 'id=' . $d['cat_id']);

                    $prom = $lib->util->getFromProperits($d['properties']);
                    /*
                     * 
                     * 
                     * 
                     * 
                      if (trim($d['mei_main']) == "com_link") {

                      $href = $d['property__url'];
                      } else {

                      $href = $lib->util->createURLAL($d['mei_alias']);
                      }

                     */






                    if (trim($d['mei_main']) == "com_link") {

                        $href = $prom['url'];
                    } else {

                        if (trim($dap['mei_main']) == "com_link") {

                            $href = $lib->util->createURLAL($d['mei_alias']);
                        } else {
                            $href = $lib->util->createURLAL($dap['mei_alias'], $d['mei_alias']);
                        }
                    }




                    if (trim($d['mei_main']) == "com_link") {

                        $href = $d['property__url'];
                    }




                    $moreact = "";



                    if ($_GET['alias'] == $dap['mei_alias'] && $_GET['id'] == $d['mei_alias']) {




                        $_GET['aliasParent'] = $dap['mei_alias'];
                        $_GET['alias'] = $d['mei_alias'];
                        unset($_GET['show']);
                        unset($_GET['id']);
                    }






                    if ($_GET['alias'] == $d['mei_alias']) {
                        $moreact = "li_active ";
                    } else {


                        $moreact = "";
                    };

                    if ($d['openType'] == "1") {

                        $moreClass = "lightbox-url";
                    } else {

                        $moreClass = "";
                    }


                    if ($pro['viewImage'] == "1") {

                        $dataimg = "<img src='/uploads/images/" . $d['mei_image'] . "'/>";
                    }







                    $data .= '<li class=\'' . $moreact . '\'><a  class=\'__' . $d['id'] . ' sub_mune_itme ' . $moreClass . ' \' href="' . $href . '">' .
                            $dataimg
                            . $d['mei_title'] . getsubmenu($d['id'], $p) . '</a></li>';
                }
            }
        }
        $data.='</ul></div>';
    }

    return $data;
}

?>
