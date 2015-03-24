<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of site
 *
 * @author empcl_000
 */

namespace libs\engine;

class siteClass {

    var $Setting;
    /* @var $lib  \libs\libs */
    var $lib;

    function __construct($lib) {
        $this->lib = $lib;
    }

    function strat() {

        $this->siteSetting();
    }

    function siteSetting() {





        $this->Setting = $this->db->get_row("site_setting", "*");




        if (isset($_GET['lang'])) {

            $this->Setting['lang'] = $_GET['lang'];
        }
    }

    function allLangs() {
        return $this->lib->db->get_data("com_language", "*");
    }

    function getStatus($more = "") {

        $this->lib->db->getEnable = true;
        $data = $this->lib->db->get_data("com_site_status", "*", $more);
       // print_r($data);
    }

    function getFromStatus($type = "") {
        $more = "";


        switch ($type) {
            case "get":
                break;
            case "post":
                break;
            case "normal":
                break;
        }
        return $this->getStatus("type='$type'");
    }

    

    function getStatusData($g) {
        if ($_GET['site']) {
            $us = explode(",", $g);
        }

        $i = 0;
        foreach ($us as $a) {
            $data[$i] = $this->lib->db->get_row("com_site_status", "*", "alias='" . $a . "'");
            $i++;
        }
    }

    function getActStatus($type = "") {
        $normal = $this->getFromStatus($this->lib->variables->statusNormal);
        $get = $this->getStatusData($_GET[$this->lib->variables->statusVariableName]);
        $post = $this->getStatusData($_POST[$this->lib->variables->statusVariableName]);
        $session = $this->getStatusData($_SESSION[$this->lib->variables->statusVariableName]);


        switch ($type) {
            case $this->lib->variables->statusSession:
                $r = $session;
                break;
            case $this->lib->variables->statusGet:
                $r = $get;
                break;
            case $this->lib->variables->statusPost:
                $r = $post;
                break;
            case $this->lib->variables->statusNormal:
                $r = $normal;
                break;
            default :
                $r = array_merge((array) $normal, (array) $post, (array) $get, (array) $session);
                break;
        }
        return $r;
    }

    function cretaStatus($id, $type = "", $for = "menu") {

        if ($tpe == "") {

            $type = $this->lib->variables->statusGet;
        }


        $status = $this->getActStatus($type);
        $xreafTabel = "";
        if ($for == "menu") {
            $xreafTabel = "menu_itmes_status_xref";
        } else {
            $xreafTabel = "com_modules_status_xref";
        }


        if (is_array($sttaus)) {
            foreach ($sttaus as $s) {
                $datasql = $this->db->get_data($xreafTabel, "*", "item_id='" . $id . "'");

                foreach ($datasql as $d) {
                    if ($s['id'] == $d['status_id']) {
                        $return = $status['alisa'] + ",";
                    }
                }
            }
        }


        return $return;
    }

    
    
    function isInStatus($id, $all, $type) {
        $return = $all;
        $sttaus = $this->getActStatus();
        $xreafTabel = "";
        if ($type == "menu") {
            $xreafTabel = "menu_itmes_status_xref";
        } else {
            $xreafTabel = "com_modules_status_xref";
        }
        
        


        if (is_array($sttaus)) {
            foreach ($sttaus as $s) {
                $datasql = $this->db->get_data($xreafTabel, "*", "item_id='" . $id . "'");

                foreach ($datasql as $d) {

                    if ($s['id'] == $d['cat_id']) {

                        $return = true;
                    }
                }
            }
        }


        return true;
    }

}
