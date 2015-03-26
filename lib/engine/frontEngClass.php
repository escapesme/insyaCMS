<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

namespace libs\engine;

class frontEngClass {

//put your code here
    var $adminUrllVar = "";
    var $adminFolder = "";
    var $config = "";
    var $foldersMap = "";
    var $Messages = "";
    var $db = "";
    var $util = "";
    var $url_alias = "alias";
    var $idurl = "id";
    var $idsurl = "id[]";
    var $porpertiesFile = "porperties";
    var $templateData;
    var $menuData;
    var $templatelink;
    var $componentLink;

    /* @var $lib  \libs\libs */
    var $lib;

    function __construct($lib) {


        if (isset($_GET['lang'])) {


            $this->lib->util->siteSetting['lang'] = $_GET['lang'];

            $this->util->siteSetting['lang'] = $_GET['lang'];
        }

        $this->lib = $lib;

        $this->config = $lib->config;
        $this->foldersMap = $lib->foldersMap;
        $this->Messages = $lib->Messages;
        $this->db = $lib->db;
        $this->util = $lib->util;
        $this->users = $lib->users;
        $this->variables = $lib->variables;

// $this->templateData = $this->gettemplatedata("", "all");
    }

    function varGet($data) {


        return $_GET[$data];
    }

    function updatedata() {


        $this->menuData = $this->lib->language->getDBArray('menu_itmes', $this->menuData['id'], $this->getmenuDB());

        $this->templateData = $this->gettemplatedataDB();
    }

    function getmenuDB() {

        $alias = $this->varGet($this->url_alias);
        if (isset($alias) && $alias != "") {
            $menus = $this->db->get_data('menu_itmes', "", "mei_alias='" . $alias . "'");
            foreach ($menus as $m) {
                if ($this->lib->site->isInStatus($m['id'], $m['all_site'], "menu") == true) {
                    $th = $this->db->get_row('menu_itmes', "", "id='" . $m['id'] . "'");
                }
            }
        } else {

            $th = $this->db->get_row('menu_itmes', "", "mei_home='1'");
        }

        $this->componentLink = $this->foldersMap->fornt_components_folder . $th["mei_main"];




        return $th;
    }

    function getmenu($filed) {



        $return = "";
        if ($filed == "properties") {
            $id = $this->menuData["id"];

            $return = $this->lib->colltions->getCollectionData("sys_properies_data", "menu_itmes", $id);
        } else {

            $return = $this->menuData[$filed];
        }



        return $return;
    }

    function gettemplatedataDB() {

        $menuid = $this->getmenu('id');


        if (isset($menuid) && $menuid != "") {



            $mydata = $this->db->get_row("menu_xref_tem", "", "mxt_menu_id=" . trim($menuid));


            if (is_array($mydata)) {
                $mydata = $this->db->get_row("com_install", "", "ins_type='template' and id=" . $mydata[mxt_tem_id]);
            } else {
                $mydata = $this->db->get_row("com_install", "", "ins_type='template' and `default`='1' ");
            }





            $this->templatelink = $this->foldersMap->fornt_templates_folder . $mydata['ins_alias'];
        } else {

            if ($_GET['alias'] != '404') {
                $this->util->page->getTo404();
            }
        }
        return $mydata;
    }

    function gettemplatedata($data) {
        return $this->templateData[$data];
    }

    function getpage() {

        $this->util->importfiles($this->templatelink);


        include_once( $this->templatelink . "/" . "index.php");
    }

    function getmobilePage() {



        include_once( "templates/moblie/" . "index.php");
    }

    function sendMessage($type, $Showmsg, $icon = "") {

        $icon = "";
        $msg = "<div class=\'message_icon\'>" . $icon . "</div>" . $Showmsg;
        echo "
<script>
function copyText(){
$('.message_bg').slideUp('slow', function() {
    $('.message_bg').remove();
  });


}
$(function(){

$('body').append('<div class=\'message_bg\'><div onclick=\"copyText()\" class=\'message_close\'></div><div class=\'message_body\'>" . $msg . "</div></div>');
})
</script>            
";
    }

    function getmainByid($id) {
        $th = $this->db->get_row('menu_itmes', "", "id='" . $id . "'");
        $lang = $this->util->importfiles($this->foldersMap->fornt_components_folder . $th["mei_main"]);
        //include_once( $this->foldersMap->fornt_components_folder . $th["mei_main"] . "/" . "index.php");
        // return main($this->util->getFromProperits($th("properties")), $lang);
    }

    function getmainMobile() {
        global $lib;
        $this->updatedata();

        $lang = $this->util->importfiles($this->componentLink . "_mobile/");

        $pPermission = $this->users->getMenuPermission();


        $datamod = $this->menuData;

        if (($datamod['permission_all'] == "1" || $this->util->chkInPermission($datamod['id'], $pPermission) == true ) && $lib->util->chkInPermissionGuset($datamod['permission_gust']) == true) {
            include_once($this->componentLink . "_mobile/" . "index.php");



            return main($this->getmenu("properties"), $lang);
        }
    }

    function getmain($importfile = true) {

        global $lib;
        $this->updatedata();

        if ($importfile != false) {

            $lang = $this->util->importfiles($this->componentLink);
        }



        $pPermission = $this->users->getMenuPermission();


        $datamod = $this->menuData;

        if (($datamod['permission_all'] == "1" || $this->util->chkInPermission($datamod['id'], $pPermission) == true ) && $lib->util->chkInPermissionGuset($datamod['permission_gust']) == true) {

            include_once($this->componentLink . "/" . "index.php");

            return main($this->getmenu("properties"), $lang);
        }
    }

    function getmainProreties() {

        return array_merge($this->getmenu("properties"));
    }

    function getmoduleByid($id, $type) {
        $data = "";



        $m = $this->db->get_Row("com_modules", "", " `id`=" . $id);





        if ($type == "title") {


            $data = $m['mod_title'];
        } else {

            include_once( $this->templatelink . "/" . "classs/" . $m['class'] . ".php");

            if (isset($m['class'])) {



                $pro = $this->lib->colltions->getCollectionData("sys_properies_data", "com_modules", $m['id']);


                $pro['viewtitle'] = $m['mod_viewall'];
                if ($m['view_title'] == "1") {
                    $pro['title'] = $lib->language->getText("com_modules", "mod_title", $m['id'], $m['mod_title']);
                }






                $pro['morecss'] = $m['morecss'];
                $pro['type'] = $m['type'];
                $pro['myid'] = $m['id'];

                if ($type == "title") {

                    $data .= $pro['title'];
                } else if ($type == "body") {
                    $pro['title'] = "";
                    $data .= $m['class']($pro);
                } else {
                    $data .= $m['class']($pro);
                }
            }
        }



        return $data;
    }

    function getmoduleIDS($postions) {

        $ids = "( id=-1 ";

        $menuid = $this->getmenu('id');
        
        $more= " 1=1 ";
        if (isset($_GET['city'])) {
            $more = "and ( Citys like'%" . $_GET['site'] . "%' )";
        }

        $mydata = $this->db->get_data("com_modules", "", "mod_viewall = '1' and 
                    position ='" . $postions . "' and 
                        '" . $more . "'");



       

        foreach ($mydata as $m) {
            if (isset($m['class'])) {
                $ids.=" or id=" . $m['id'];
            }
        }

        $mydata2 = $this->db->get_data_query("SELECT  
            com_modules.*
            From    com_modules 
            INNER JOIN menu_xref_mod ON    
            com_modules.enabled='1' and 
            com_modules.delete='0'  and   
            com_modules.mod_viewall <>'1' and 
            com_modules.position ='" . $postions . "'  and
            com_modules.id=mxm_mod_id and   
            menu_xref_mod.mxm_menu_id=" . $menuid . "  
            order by com_modules.order");
        foreach ($mydata2 as $datamod) {
            if (isset($datamod['class'])) {
                $ids.=" or id=" . $datamod['id'];
            }
        }


        $ids.=")";
        
     
        
        return $ids;
    }

    /**
     * 
     * @param type $mydata
     * @param type $pro
     * @return type
     * 
     * 
     */
    function getmoduleMobileBydata($mydata, $pro, $type = "") {
        $data = "";




        include_once( $this->templatelink . "/" . "classs/" . $mydata['class'] . "" . ".php");




        if (isset($mydata['class'])) {


            $pro['viewtitle'] = $mydata['view_title'];


            if ($mydata['view_title'] == "1") {
                $pro['title'] = $mydata['mod_title'];
            } else {
                $pro['title'] = "";
            }





            $pro['myid'] = $m['id'];
            $pro['morecss'] = $mydata['morecss'];
            $pro['type'] = $mydata['type'] . "_mobile";

            if ($type == "title") {
                $data .= $pro['title'];
            } else if ($type == "body") {
                $pro['title'] = "";
                $data .= $mydata['class']($pro);
            } else {
                $data .= $mydata['class']($pro);
            }
        }



        return $data;
    }

    function getmoduleMobile($postions, $type = "") {

        global $lib;
        $data = "";
        $ids = $this->getmoduleIDS($postions);


        /* if (isset($_GET['city'])) {


          $more = "and ( Citys like'%" . $_GET['city'] . "%' )";
          } */
        $mydata = $this->db->get_data("com_modules", "", $ids . "   " . $more . "  order by `order`");

        foreach ($mydata as $m) {


            $pPermission = $this->users->getModulePermission();
            if (($m['permission_all'] == "1" || $this->util->chkInPermission($m['id'], $pPermission) == true) && $lib->util->chkInPermissionGuset($m['permission_gust']) == true) {




                if ($this->util->cities->getIsInSite($m['id'], $m['all_site']) == true) {

                    include_once( $this->templatelink . "/" . "classs/" . $m['class'] . "" . ".php");

                    if (isset($m['class'])) {



                        $pro = $this->lib->colltions->getCollectionData("sys_properies_data", "com_modules", $m['id']);


                        $pro['viewtitle'] = $m['view_title'];


                        if ($m['view_title'] == "1") {
                            $pro['title'] = $lib->language->getText("com_modules", "mod_title", $m['id'], $m['mod_title']);
                            ;
                        } else {
                            $pro['title'] = "";
                        }

                        $pro['myid'] = $m['id'];

                        $pro['morecss'] = $m['morecss'];
                        $pro['type'] = $m['type'] . "_mobile";

                        if ($type == "title") {
                            $data .= $pro['title'];
                        } else if ($type == "body") {
                            $pro['title'] = "";
                            $data .= $m['class']($pro);
                        } else {
                            $data .= $m['class']($pro);
                        }
                    }
                }
            }
        }
        return $data;
    }

    function getmodule($postions, $type = "") {
        global $lib;
        $data = "";
        $ids = $this->getmoduleIDS($postions);


        $mydata = $this->db->get_data("com_modules", "", $ids . "   " . $more . "  order by `order`");

        foreach ($mydata as $m) {


            $pPermission = $this->users->getModulePermission();
            if (($m['permission_all'] == "1" || $this->util->chkInPermission($m['id'], $pPermission) == true ) && $lib->util->chkInPermissionGuset($m['permission_gust']) == true) {




                if ($this->lib->site->isInStatus($m['id']) == true) {

                    include_once( $this->templatelink . "/" . "classs/" . $m['class'] . ".php");

                    if (isset($m['class'])) {




                        $pro = $this->lib->colltions->getCollectionData("sys_properies_data", "com_modules", $m['id']);




                        $pro['viewtitle'] = $m['view_title'];





                        if ($m['view_title'] == "1") {
                            $pro['title'] = $lib->language->getText("com_modules", "mod_title", $m['id'], $m['mod_title']);
                        } else {
                            $pro['title'] = "";
                        }

                        $pro['myid'] = $m['id'];

                        $pro['morecss'] = $m['morecss'];
                        $pro['type'] = $m['type'];

                        if ($type == "title") {
                            $data .= $lib->language->getText("com_modules", "title", $pro['id'], $pro['title']);
                        } else if ($type == "body") {
                            $pro['title'] = "";
                            $data .= $m['class']($pro);
                        } else {
                            $data .= $m['class']($pro);
                        }
                    }
                }
            }
        }
        return $data;
    }

    function moduleBody($pro) {

        $lang = $this->util->importfiles($this->foldersMap->fornt_modules_folder . $pro['type']);
        include_once($this->foldersMap->fornt_modules_folder . $pro['type'] . "/index.php");





        return $pro['type']($pro, $lang);
    }

    function getheader() {

        $returndata = "";


        if (is_file($this->templatelink . "/js/script.js")) {
            $returndata .= "<script src= \"/" . $this->templatelink . "/js/script.js\" ></script>";
        }



        if (is_file($this->templatelink . "/css/style.css")) {
            $returndata .= "  <link type=\"text/css\" rel=\"stylesheet\" href= \"/" . $this->templatelink . "/css/style.css\" /> ";
        }




        return $returndata;
    }

}

?>
