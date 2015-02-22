<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\engine;

require 'adminV2uifClass.php';

class adminV2EngClass extends adminV2uifClass {

    var $com = "";
    var $porpertiesFile = "porperties";
    var $rowlimt = "6";
    var $thisTabelData = "";


    /*
     * 
     * xml Vars
     * 
     */
    var $table_properties;
    var $shildern;
    var $group;
    var $Cshow;
    var $options;
    var $xml_listfields;
    var $dataOptions;
    var $status;

    /*
     * 
     * xml Vars
     * 
     */

    function __construct($lib) {
        /* @var $lib  libs\libs */
        $this->lib = $lib;
    }

    function xmlFill() {

        $this->xmlfile = $this->lib->foldersMap->admin_folder . "/" . $this->lib->foldersMap->admin_components_folder . $this->com . "/" . $this->porpertiesFile . ".xml";
        $this->table_properties = $this->lib->util->readXmlAttributes($this->xmlfile, $this->lib->variables->xml_fldestsgeTag);
        $this->shildern = $this->lib->util->readXmlnames($this->xmlfile, $this->lib->variables->children);
        $this->group = $this->lib->util->readXmlAttributes($this->xmlfile, $this->lib->variables->xml_group);
        $this->Cshow = $this->lib->util->readXmlAttributes($this->xmlfile, $this->lib->variables->xml_cshow);
        //  $this->xml_listfields = $this->lib->util->readXmlAttributes($this->xmlfile, $this->lib->variables->xml_listfields);
        $this->xml_listfields = $this->lib->util->readXmlnames($this->xmlfile, $this->lib->variables->xml_listfields);
        $this->tabsOptions = $this->lib->util->readXmlAttributes($this->xmlfile, $this->lib->variables->tabsOptions);
        $this->options = $this->lib->util->readXmlAttributes($this->xmlfile, $this->lib->variables->xml_options);
    }

    function updatequery($type = "") {
        $where = "";
        if ($this->dataOptions['type'] == "data") {
            if (isset($this->dataOptions['enable'])) {
                if ($this->dataOptions['enable'] == "all") {
                    $this->lib->db->getEnable = true;
                } else if ($this->dataOptions['enable'] == "yes") {
                    $this->lib->db->getEnable = FALSE;
                    $this->lib->db->getDisable = FALSE;
                } else if ($this->dataOptions['enable'] == "no") {
                    $this->lib->db->getEnable = TRUE;

                    $this->lib->db->getDisable = true;
                }
            }
        } else if ($this->dataOptions['type'] == "deletedata") {
            $this->lib->db->getEnable = true;
            $this->lib->db->getDleleted = true;
            $where = " `delete`='1'";
        }
        if (isset($this->dataOptions['where'])) {
            $where = $this->dataOptions['where'];
        }
        if ($type != "all") {
            $this->lib->db->opt->num_rows = $this->rowlimt;
            if (isset($this->dataOptions['page'])) {
                $this->lib->db->opt->start_from = $this->dataOptions['page'] * $this->rowlimt;
                if ($this->lib->db->opt->start_from < 0) {
                    $this->lib->db->opt->start_from = 0;
                }
            }
        }


        if ($this->status == "id") {
         //   $where .= " 1=1 ORDER BY `id` DESC ";
            $this->lib->db->order_a = "order";
        } else {
           // $where .= " 1=1 ORDER BY `order`  ";
            $this->lib->db->order_d = "id";
        }

        $this->thisTabelData = $this->lib->db->get_data($this->com, "*", $where . " 1=1 ORDER BY `id` DESC ");
    }

    function getComponentbar() {
        $this->xmlFill();
        $this->updatequery();
        return $this->getBar();
    }

    function getComponenthome() {
        $this->xmlFill();
        $this->updatequery();
        return $this->getHome();
    }

    function getComponentMain() {
        $this->xmlFill();
        $this->updatequery();
        return $this->getHtml();
    }

    function getDataForString($data) {
        $rows = explode("||", $data);
        $num = 0;
        foreach ($rows as $row) {
            if (trim($row) != "") {
                $ds = explode(";", $row);


                foreach ($ds as $d) {
                    $da = explode("__", $d);
                    $useData[$da[0]] = $da[1];
                }
                $r[$num] = $useData;
                $num++;
            }
        }

        return $r;
    }

    function getAdd($data) {
        $this->xmlFill();
        return $this->addHtml();
    }

    function getEdit($id) {
        $this->xmlFill();
        return $this->editHtml($id);
    }

    function setAdd($data) {


        $ds = explode(";", $data);
        foreach ($ds as $d) {
            $da = explode("__", $d);
            $useData[$da[0]] = $da[1];
        }
        $this->lib->db->insert_row($this->com, $useData);
    }

    function setEidt($data) {


        $ds = explode(";", $data);
        foreach ($ds as $d) {
            $da = explode("__", $d);
            $useData[$da[0]] = $da[1];
        }

        $this->lib->db->update_row($this->com, $useData, $useData["id"]);
    }

    function updateData($data) {
        $useDatas = $this->getDataForString($data);




        foreach ($useDatas as $useData) {
            $this->lib->db->update_row($this->com, $useData, $useData["id"]);
        }
    }

    function setDelete($data) {
        $useDatas = $this->getDataForString($data);
        foreach ($useDatas as $useData) {

            $udata = array("delete" => "1");
            $this->lib->db->update_row($this->com, $udata, $useData["id"]);
        }
    }

    function setRestor($data) {
        $useDatas = $this->getDataForString($data);


        //  print_r($useDatas);

        foreach ($useDatas as $useData) {

            $udata = array("delete" => "0");
            $this->lib->db->update_row($this->com, $udata, $useData["id"]);
        }
    }

    function setRemove($data) {
        $useDatas = $this->getDataForString($data);
        foreach ($useDatas as $useData) {
            $this->lib->db->delete_row($this->com, $useData["id"]);
        }
    }

    function setRestorAll() {

        $this->lib->db->getEnable = true;
        $this->lib->db->getDleleted = true;


        $useDatas = $this->lib->db->get_data($this->com, "*", "`delete`='1'");
        foreach ($useDatas as $useData) {
            $udata = array("delete" => "0");
            $this->lib->db->update_row($this->com, $udata, $useData["id"]);
        }
    }

    function setRemoveAll($data) {
        $this->lib->db->getEnable = true;
        $this->lib->db->getDleleted = true;


        $useDatas = $this->lib->db->get_data($this->com, "*", "`delete`='1'");
        foreach ($useDatas as $useData) {
            $this->lib->db->delete_row($this->com, $useData["id"]);
        }
    }

    function setEnabled($data) {
        $useDatas = $this->getDataForString($data);
        foreach ($useDatas as $useData) {

            $udata = array("enabled" => "1");
            $this->lib->db->update_row($this->com, $udata, $useData["id"]);
        }
    }

    function setDisabled($data) {
        $useDatas = $this->getDataForString($data);
        foreach ($useDatas as $useData) {

            $udata = array("enabled" => "0");
            $this->lib->db->update_row($this->com, $udata, $useData["id"]);
        }
    }

    function setCopy($data) {
        $useDatas = $this->getDataForString($data);

        foreach ($useDatas as $useData) {


            $udata = $this->lib->db->get_row($this->com, "*", "id='" . $useData["id"] . "'");



            $udata['id'] = "NULL";
            $udata['enabled'] = "1";



            $this->lib->db->insert_row($this->com, $udata);


            /*
             *   $udata = array("enabled" => "0");
              $this->lib->db->update_row($this->com, $udata, $useData["id"]); */
        }
    }

}
