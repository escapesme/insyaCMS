<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mapgetsubmenu($id, $parent, $pro) {



    global $lib;


    $datasql = $lib->db->get_data('menu_itmes', '', 'cat_id=\'' . $id . '\'  and `delete`=0  and enabled=\'1\' and parent_id=\'' . $parent . '\' and `show`=\'1\' Order by `order`  ');



    if (is_array($datasql[0])) {

        //  print_r($datasql);


        $data = "<div class='submenu_map submenu" . $id . "'>
            
<div class='submenutop'></div>
";



        foreach ($datasql as $d) {

            $pPermission = $lib->users->getMenuPermission();
            //  echo $d['permission_all']
            if ($d['permission_all'] == "1" || $lib->util->chkInPermission($d['id'], $pPermission) == true) {

                if ($this->lib->site->isInStatus($d['id'], $d['all_site'],"menu") == true) {


                    $dap = $lib->db->get_row('menu_itmes', '', 'id=' . $d['cat_id']);

                    $prom = $lib->util->getFromProperits($d['properties']);



                    if (trim($d['mei_main']) == "com_link") {

                        $href = $prom['url'];
                    } else {

                         if (trim($dap['mei_main']) == "com_link") {
                        
                        $href = $lib->util->createURLAL( $d['mei_alias']);
                        
                         }else{
                              $href = $lib->util->createURLAL($dap['mei_alias'], $d['mei_alias']);
                             
                             
                         }
                        
                    }



                    $moreact = "";
     if (trim($d['mei_main']) == "com_link") {

                        $href = $d['property__url'];
                    }
                    


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


                    $data .= '<div class=\'item  ' . $moreact . '\'><a  class=\'__' . $d['id'] . ' sub_mune_itme ' . $moreClass . ' \' href="' . $href . '">' .
                            $dataimg
                            . $d['mei_title'] . mapgetsubmenu($d['id'], $p) . '</a></div>';
                }
            }
        }
        $data.='</div>';
    }

    return $data;
}

?>
