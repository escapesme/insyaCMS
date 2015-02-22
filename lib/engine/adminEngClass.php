<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMVx
 * 
 */

//var view id 

namespace libs\engine;

class adminEngClass {

//put your code here
    var $adminUrllVar = "";
    var $adminFolder = "";
    var $config = "";
    var $foldersMap = "";
    var $Messages = "";
    var $db = "";
    var $util = "";
    var $viewurl = "";
    var $idurl = "";
    var $modeurl = "";
    var $idsurl = "";
    var $porpertiesFile = "";
    var $xml_fldestsgeTag = "";
    var $variables = "";
    var $addproreties = "";
    var $proretiesType = "";
    var $parent = "";
    var $proretiesdir = "";
    var $addToForm = "";
    var $table_name = "";
    var $changEditNames = null; // if you wont change edit Value  [Names    n1;n2]
    var $changEditValues = null; // if you wont change edit Value [Values    v1;v2]
    var $users = null;

    function __construct($config, $foldersMap, $Messages, $db, $util, $dmin, $variables, $users) {
        $this->config = $config;
        $this->foldersMap = $foldersMap;
        $this->Messages = $Messages;
        $this->db = $db;
        $this->util = $util;
        $this->admin = $dmin;
        $this->variables = $variables;

        $this->users = $users;
        $this->parent = $_GET[$variables->url_parent];


        $this->url_view = $variables->url_view;
        $this->url_id = $variables->url_id;
        $this->url_mode = $variables->url_mode;
        $this->url_ides = $variables->url_ides;

        if ($this->porpertiesFile == "") {
            $this->porpertiesFile = $variables->porpertiesFile;
        }

        $this->xml_fldestsgeTag = $variables->xml_fldestsgeTag;


        $this->xml_selectfields = $variables->xml_selectfields;
        $this->xml_listfields = $variables->xml_listfields;
    }

    function getMenuVar($data) {
        return $_GET[$data];
    }

    function getTemplate($data = "") {

        if ($data == "") {
            $templateurl = $this->foldersMap->admin_tempalets_folder . "def/index.php";
        } else {
            $templateurl = $this->foldersMap->admin_tempalets_folder . "def/login.php";
        }




        require_once ($templateurl);
    }

    function getComponentData($data) {
        $returndata = "";


        if ($data == "name") {
            $returndata = $this->getMenuVar($this->url_view);
        } else if ($data == "title") {

            $ff = $this->db->get_row("com_install", "", "ins_alias='" . $this->getMenuVar($this->url_view) . "'");

            if (is_array($ff)) {
                $returndata = $ff['ins_title'];
            }
        }

        return $returndata;
    }

    function getTitle($group) {

        $title = $this->getMenuVar($this->url_view);
        $dd = $this->getComponentData("title");



        if ($dd != "") {
            $title = $dd;
        }



        if ($_GET[$this->url_mode] != "") {

            if ($_GET[$this->url_mode]!="listBody"){
            $title .="<div class='subtitle'>" . $_GET[$this->url_mode] . "</div>";}
        }
        if (isset($_GET['parent'])) {
            $title = $group[$this->getMenuVar($this->url_view)]['title'];
        }

        return $title;
    }

    function getMain() {
        $myview = $this->getMenuVar($this->url_view);

        $parentdata = $this->db->get_row("com_install", "*", "ins_alias='" . $_GET['parent'] . "'");


        $maindata = $this->db->get_row("com_install", "*", "ins_alias='" . $myview . "'");
        $pPermission = $this->users->getAdminPermission();
        $parent = $_GET['parent'];


        if (
                (
                $this->util->chkInPermission($maindata['id'], $pPermission, "getCat") == true ||
                $this->util->chkInPermission($parentdata['id'], $pPermission, "getCat") == true
                ) &&
                $myview != "com_install" &&
                $myview != "com_menus" &&
                $myview != "menu_itmes" &&
                $myview != "com_modules" &&
                $myview != "com_templates" &&
                $myview != "com_users" &&
                $myview != "com_users_groups" &&
                $myview != "com_users_settings" &&
                $myview != "com_update_my_date"
        ) {

            $r = $this->getmyMain($myview);
        } else
        if (
                ($_GET['parent'] == "com_users" ||
                $myview == "com_install" ||
                $myview == "menu_itmes" ||
                $myview == "com_menus" ||
                $myview == "com_modules" ||
                $myview == "com_templates" ||
                $myview == "com_users" ||
                $myview == "com_users_settings") &&
                ($myview != "com_install" || $this->users->getUserPermission("can_management_components") == "1") &&
                ($myview != "com_modules" || $this->users->getUserPermission("can_management_components") == "1") &&
                ($myview != "com_templates" || $this->users->getUserPermission("can_management_components") == "1") &&
                ($myview != "com_users" || $this->users->getUserPermission("can_update_users") == "1") &&
                ($parent != "com_users" || $this->users->getUserPermission("can_update_users") == "1")
        ) {
            $r = $this->getmyMain($myview);
        } else if ($myview == "site_setting" || $_GET['parent'] == "site_setting" || $myview == "" || $myview == "com_update_my_date") {
            $r = $this->getmyMain($myview);
        } else {

            $r = $this->util->getAccessDenied();
        }




        return $r;
    }

    function getmyMain($myview) {

        $mainfile = "";
        $mainfolder = "";





        if ($myview != null && $myview != "") {
            $mainfolder = $this->foldersMap->admin_components_folder . $this->parent . "/" . $myview;
        } else {

            $mainfolder = $this->foldersMap->admin_components_folder . "home";
        };

        $mainfile = $mainfolder . "/index.php";

        if (is_file($mainfile)) {

            if (is_file($this->util->thislink() . "/script.js")) {
                $r.= "<script src= \"" . $this->util->thislink() . "/script.js\" ></script>";
            }



            if (is_file($this->util->thislink() . "/functions.php")) {



                ob_start();
                include ($this->util->thislink() . "/functions.php");
                $r.= ob_get_clean();
            }

            if (is_file($this->util->thislink() . "/style.css")) {
                $r.= "  <link type=\"text/css\" rel=\"stylesheet\" href= \"" . $this->util->thislink() . "/style.css\" /> ";
            }


            ob_start();
            include_once $mainfile;
            $r.= ob_get_clean();
        }

        return $r;
    }

    function getComponentMain($Componentname = "", $porpertiesFile = "", $mode = "list", $moreHtml = "", $xmlmorelink = "") {
        $returnData = "";

        $url = $this->getComponentData("name");

        if ($Componentname == "") {
            $Componentname = $this->getComponentData("name");
        }
        if ($porpertiesFile == "") {
            $porpertiesFile = $this->porpertiesFile;
        }





        $dataname = $Componentname;

        if ($this->table_name == "") {


            $this->table_name = $Componentname;
        }



        if ($this->getMenuVar($this->url_mode) != "") {
            $mode = $this->getMenuVar($this->url_mode);
        }



        $xmlfile = $xmlmorelink . $this->foldersMap->admin_components_folder . $this->parent . "/" . $url . "/" . $porpertiesFile . ".xml";


//readXmlAttributes




        $table_properties = $this->util->readXmlAttributes($xmlfile, $this->xml_fldestsgeTag);



        $shildern = $this->util->readXmlnames($xmlfile, $this->variables->children);

        $group = $this->util->readXmlAttributes($xmlfile, $this->variables->xml_group);

        $Cshow = $this->util->readXmlAttributes($xmlfile, $this->variables->xml_cshow);
        $options = $this->util->readXmlAttributes($xmlfile, $this->variables->xml_options);


///////////get properties array if module or menu
///////////get properties array if module or menu




        $admin = $this->admin;
        $mychiled = "";


        if ($shildern[1] != "") {
            $mychiled = $shildern[1];
        }
        $admin->my_title = $this->getTitle($group);
        $admin->group = $group;

        $admin->addToForm = $this->addToForm;
        $admin->moreHtml = $moreHtml;
        $admin->options = $options;



        $admin->mode = $mode;






        if ($xmlmorelink == "admin/") {
            $m2link="";
        }



        if ($mode == "add") {


            if (is_array($Cshow)) {
                $admin->cshow = $Cshow;
            }



            $opj_properties = $this->returnporteries($porpertiesFile,$m2link);
           
            
            $admin->addproreties = $this->addproreties;
            $admin->proreties = $opj_properties;

        
        } else if ($mode == "edit") {

            $opj_properties = $this->returnporteries($porpertiesFile,$m2link);

            $admin->addproreties = $this->addproreties;
            $admin->proreties = $opj_properties;


            if (is_array($Cshow)) {
                $admin->cshow = $Cshow;
            }


            $admin->changEditNames = $this->changEditNames;
            $admin->changEditValues = $this->changEditValues;

            $admin->editID = $this->getMenuVar($this->url_id);
        } else {

            $admin->children = $mychiled;
        }


        
         
        $listoptions = $this->util->readtagAttributes($xmlfile, $this->xml_listfields);

//print_R($table_properties);
        $admin->table_properties = $table_properties;



        $admin->table_name = $this->table_name;
        $admin->listOptions = $listoptions;


        $admin->selectlist = $this->util->readXmlnames($xmlfile, $this->xml_selectfields);
        $admin->selectlistoptions = $this->util->readXmlAttributes($xmlfile, $this->xml_selectfields);
       // print_R(   $admin->selectlistoptions);
        
        $admin->list = $this->util->readXmlAttributes($xmlfile, $this->xml_listfields);
        $admin->plugins = $this->util->readXmlAttributes($xmlfile, $this->variables->xml_plugins);



        $returnData.=$admin->get_html();

        echo "<div class='mainpage " . $mode . "'>" . $returnData . "</div>";
    }

    function getmodule($postion) {


        $returndata = "";

        if ($postion == "mod_defaultMenu") {


            include_once $this->foldersMap->admin_modules_folder . 'mod_defaultMenu/index.php';

            $pro = "";
            $returndata = mod_defaultMenu($pro);
        } else if ($postion == "mod_favorites") {

            include_once $this->foldersMap->admin_modules_folder . 'mod_favorites/index.php';

            $pro = "";
            $returndata = mod_favorites($pro);
        }



        return $returndata;
    }

    function returnporteries($porpertiesFile, $link = "../") {


        if ($porpertiesFile == "") {
            $porpertiesFile = $this->porpertiesFile;
        }

/* @var $lib  \libs\libs */
global $lib;

        if ($this->proretiesType == "menu") {

            
            $xmlfilepro = $link . $this->foldersMap->fornt_components_folder . $this->proretiesdir . "/" . $porpertiesFile . ".xml";
            $xmlfilepro=$lib->util->siteSetting[site_link]."/" .$xmlfilepro;
            $opj_properties = $this->util->readXmlAttributes($xmlfilepro, $this->xml_fldestsgeTag,"../");
            
            
        } else if ($this->proretiesType == "module") {
            $xmlfilepro = $lib->util->siteSetting[site_link] ."/" . $this->foldersMap->fornt_modules_folder . $this->proretiesdir . "/" . $porpertiesFile . ".xml";
             
            
            $opj_properties = $this->util->readXmlAttributes($xmlfilepro, $this->xml_fldestsgeTag);
        }

        if ($this->proretiesType == "template") {

            $xmlfilepro = $lib->util->siteSetting[site_link]."/" . $this->foldersMap->fornt_templates_folder . $this->proretiesdir . "/" . $porpertiesFile . ".xml";
            
           
            $opj_properties = $this->util->readXmlAttributes($xmlfilepro, $this->xml_fldestsgeTag);
        }



        return $opj_properties;
    }

    function getHome() {

        return $returndata;
    }

    function get_page($flie = 'index') {
        $returndata = "";
        $url = explode('/', $ths->adminUrllVar);

        if (!empty($url[1])) {
            $flie = $url[1];
        } else {

            $flie = "index";
        }


        $linkfile = $this->parent . $this->adminFolder . '/' . $url[0] . '/' . $flie . '.php';





        if (isset($this->adminUrllVar) && file_exists($linkfile)) {
            include($linkfile);
        } else {


            $returndata = $this->getHome();
        }

        return $returndata;
    }

}

?>
