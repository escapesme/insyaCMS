<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of languageClass
 *
 * @author empcl_000
 */

namespace libs\data;

class languageClass {

    var $table = "sys_language";

    /* @var $lib  \libs\libs */
    var $lib = null;

    public function __construct($lib) {
        $this->lib = $lib;
    }

    function add($lang, $type, $field, $id, $old, $new) {
        $data = array(
            "obj_type" => trim($type),
            "obj_field" => trim($field),
            "obj_id" => trim($id),
            "obj_old_data" => trim($old),
            "obj_new_data" => trim($new),
            "lang" => trim($lang)
        );




        if (is_array($this->get($lang, $type, $field, $id))) {
            $where = "lang='" . $lang . "' and  obj_type='" . $type . "' and obj_field='" . $field . "' and obj_id='" . $id . "'  ";
            $this->lib->db->update_row($this->table, $data, "", $where);
        } else {
            $this->lib->db->insert_row($this->table, $data);
        }
    }

    function get($lang, $type, $field, $id) {

        $where = "lang='" . $lang . "' and  obj_type='" . $type . "' and obj_field='" . $field . "' and obj_id='" . $id . "'  ";


        $d = $this->lib->db->get_row($this->table, "*", $where);



        return $d;
    }

    function getsymbol($name) {


        $file = $this->lib->util->siteSetting['site_link'] . "/lib/" . $this->lib->foldersMap->lib_folder . "xml/";
        $file1 = $file . "symbols" . "_" . $this->lib->util->siteSetting['lang'] . ".xml";


        return $this->lib->util->readXmlDataString($file1, "symbols")[$name]["value"];
    }

    function updateText($body, $data) {
        preg_match_all('/\\((.*?)\)/', $body, $matches);
        for ($i = 0; $i < count($matches[0]); $i++) {
            $m = $matches[1][$i];
            $w = '\(' . $m . ')';
            if (isset($data[$m])) {
                $body = str_replace($w, $data[$m], $body);
            }
        }
        return $body;
    }

    function getText($type, $field, $id, $old, $lang = "") {


        if ($lang == "") {

            $lang = $this->lib->util->siteSetting['lang'];

            $l = $this->lib->db->get_row("com_language", "*", "title='" . $_GET['lang'] . "'");


            $lang = $l['id'];
        }


        $where = "lang='" . $lang . "' and  obj_type='" . $type . "' and obj_field='" . $field . "' and obj_id='" . $id . "'  ";






        $r = "";
        $d = $this->lib->db->get_row($this->table, "*", $where);



        if (is_array($d)) {


            $r = $d['obj_new_data'];
        } else {

            $r = $old;
        }

        return $r;
    }

    function getDBArray($type, $id, $array, $lang = "") {

        foreach ($array as $k => $v) {

            $array[$k] = $this->getText($type, $k, $id, $v, $lang);
        }


        return $array;
    }

}
