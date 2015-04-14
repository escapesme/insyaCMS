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
        ///print_r($this->getActStatus());
    }

    function siteSetting() {





        $this->Setting = $this->lib->db->get_row("site_setting", "*");

        if (isset($_GET['lang'])) {

            $this->Setting['lang'] = $_GET['lang'];
        }
    }

    function allLangs() {
        return $this->lib->db->get_data("com_language", "*");
    }

    var $otherStatus = "";

    function addTostatus($data) {
        $this->otherStatus.="," . $data;
    }

    function getStatus($more = "") {

        $this->lib->db->getEnable = true;
        $data = $this->lib->db->get_data("sys_site_status", "*", $more);
        return $data;
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

    function getStatusData($g, $type = "alias") {
        //$_GET
        // echo $this->lib->variables->statusVariableName;
        $us = explode(",", $g);




        $i = 0;
        foreach ($us as $a) {
            if ($a != "") {

                //  echo  "<".$a.">"; 
                $data[$i] = $this->lib->db->get_row("sys_site_status", "*", $type . "='" . $a . "'");

                $i++;
            }
        }

        //   

        return $data;
    }

    function getActStatus($type = "") {
        $get = $this->getStatusData($_GET[$this->lib->variables->statusVariableName]);

        $normal = $this->getFromStatus($this->lib->variables->statusNormal);
        $post = $this->getStatusData($_POST[$this->lib->variables->statusVariableName]);
        $session = $this->getStatusData($_SESSION[$this->lib->variables->statusVariableName]);
        $other = $this->getStatusData($this->otherStatus, "id");


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
            case "other":
                $r = $other;
                break;
            default :
                $r = array_merge((array) $normal, (array) $post, (array) $get, (array) $session, (array) $other);
                break;
        }




        foreach ($r as $rr) {
            /*
              if (!is_array($rr)){

              unset($r[$rr]);
              } */
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
            $xreafTabel = "sys_menus_status_xref";
        } else {
            $xreafTabel = "sys_modules_status_xref";
        }


        if (is_array($sttaus)) {
            foreach ($sttaus as $s) {
                $datasql = $this->lib->db->get_data($xreafTabel, "*", "item_id='" . $id . "'");

                foreach ($datasql as $d) {
                    if ($s['id'] == $d['status_id']) {
                        $return = $status['alisa'] . ",";
                    }
                }
            }
        }


        return $return;
    }

    function cretaStatusFormIDs($arrayData, $type = "") {

        $sttaus = explode(",", $arrayData);

        if (is_array($sttaus)) {
            foreach ($sttaus as $s) {

                if ($s != "") {

                    //print_r($sttaus);

                    $datasql = $this->lib->db->get_row("sys_site_status", "*", "id='" . $s . "'");
                    //  foreach ($datasql as $d) {
                    if ($datasql['type'] == $type) {

                        $m = "";

                        if ($s > 1) {

                            $m = ",";
                        }
                        $return .= $m . $datasql['alias'];
                    }
                    // }
                }
            }
        }


        return $return;
    }

    function isInStatus($id, $all, $type) {
        $sttaus = $this->getActStatus();




        $xreafTabel = "";
        if ($type == "menu") {
            $xreafTabel = "sys_menu_status_xref";
        } else {
            $xreafTabel = "sys_modules_status_xref";
        }


        $return = $all;
//print_r($sttaus);

        if (is_array($sttaus)) {
            foreach ($sttaus as $s) {

                $datasql = $this->lib->db->get_data($xreafTabel, "*", "item_id='" . $id . "'");





                foreach ($datasql as $d) {


                    if ($s['id'] == $d['cat_id']) {
                        $return = true;
                        break;
                    }
                }
            }
        }


        return $return;
    }

    function getStatusAlias() {
        $sttaus = $this->getActStatus();
        $return = "";
        if (is_array($sttaus)) {
            foreach ($sttaus as $s) {
                $mm = ",";
                if ($return == "") {
                    $mm = "";
                }

                $return .=$mm . $s['alias'];
            }
        }


        return $return;
    }

    function checkStatusAlias($status) {
        $sttaus = $this->getActStatus();
        if (is_array($sttaus)) {
            foreach ($sttaus as $s) {
                if ($s['alias'] == $status) {
                    $return = true;
                    break;
                }
            }
        }


        return $return;
    }

}
