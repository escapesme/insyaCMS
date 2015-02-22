<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of colltions
 *
 * @author empcl_000
 */

namespace libs\engine;

class colltionsClass {
    /* @var $lib  \libs\libs */

    var $lib;

    function __construct($lib) {
        /* @var $lib  libs\libs */
        $this->lib = $lib;
    }

    function setFormatCollectionDataFromDB($pro) {

        $mpro = explode(";", $pro);
        $returndata = "";



        foreach ($mpro as $m) {
            if ($m != "") {
                $mf = explode("__", $m);
                $returndata[$mf[0]] = $mf[1];
            }
        }
        return $returndata;
    }

    function getPlugin($table, $alias, $title, $id = "", $block = "", $blockstatus = "") {

        $Data = "";
        if (isset($alias) && $alias != '') {

            $r = rand(5, 15);
            $r2 = rand(5, 15);

            $xmlfile = "/" . $this->lib->foldersMap->admin_plugins_folder . "/" . $alias . "/" . "porperties.xml";

            $plgsData = $this->lib->util->readXmlAttributes($xmlfile, $this->lib->variables->xml_fldestsgeTag);


            if ($block != "no") {
                $c['blockplg']['type'] = 'block';
                $c['blockplg']['collapse'] = $blockstatus;


                $c['blockplg']['name'] = 'blockplg' . $r;
                $c['blockplg']['title'] = $title;
                $this->lib->forms->filds = $c;
                $Data .= $this->lib->forms->_render_form();
                $this->lib->forms->filds = null;
            }

            $form2 = array(
                "pluginData__name" => array(
                    "name" => "pluginData__||name" . $r2,
                    "type" => "text",
                    "value" => $alias
                )
            );


            $this->lib->forms->filds = $form2;
            $Data .= $this->lib->forms->_render_form();



            $this->lib->forms->filds = null;



            $pForm = $this->pluginsUpdateData($plgsData, $this->editID);












            if ($alias === "plg_moreData" && $id != "") {


                $pForm['moreData']['value'] = $this->lib->colltions->getCollectionDataRowFromDB("sys_more_data", $table, $id);
            }




            $this->lib->forms->filds = $pForm;


            $Data .= $this->lib->forms->_render_form();
            $this->lib->forms->filds = null;

            if ($block != "no") {
                $c2['endblock']['type'] = 'endblock';
                $c2['endblock']['name'] = 'endblock' . $r;
            }
            $this->lib->forms->filds = $c2;
            $Data .= $this->lib->forms->_render_form();
        }
        return $Data;
    }

    function setFormatCollectionDataToDB($data, $type) {

//$type= property,  pluginData ,moreData
        $pro = "";
        foreach ($data as $k => $v) {
            $krr = explode("__", $k);
            if ($krr[0] == $type) {
                $pro.=$krr[1] . "__" . $v . ";";
            }
        }
        return $pro;
    }

    function saveColltionData($Type, $comtype, $id, $Data, $title = "") {
        $idata = array(
            "title" => $title,
            "com_type" => $comtype,
            "com_id" => $id,
            "data" => $Data
        );
        $this->lib->db->insert_row($Type, $idata);
    }

    function savePropertiesData($data, $id, $table_name) {


        $this->lib->db->delete_data("sys_properies_data", "com_id='" . $id . "' and com_type='" . $table_name . "'");
        $this->saveColltionData("sys_properies_data", $table_name, $id, $this->setFormatCollectionDataToDB($data, "property"));

        return "";
    }

    function savemoreData($data, $id, $table_name) {


        $this->lib->db->delete_data("sys_more_data", "com_id='" . $id . "' and com_type='" . $table_name . "'");
        $this->saveColltionData("sys_more_data", $table_name, $id, $data);

        return "";
    }

    function getCollectionData($Type, $comtype, $id) {


        $data = $this->getCollectionDataRowFromDB($Type, $comtype, $id);
        return $this->setFormatCollectionDataFromDB($data);
    }

    function getPluginData($comtype, $id) {


        $data = $this->getCollectionDataRowFromDB("sys_pugins_data", $comtype, $id);
        return $this->setFormatCollectionDataFromDB($data);
    }

    function getCollectionDataRowFromDB($Type, $comtype, $id) {


        $ds = $this->lib->db->get_data($Type, "*", "com_id='" . $id . "' and com_type='" . $comtype . "'");

        foreach ($ds as $d) {
            $r.= $d['data'] . "||";
        }


        return $r;
    }

// </editor-fold>
}
