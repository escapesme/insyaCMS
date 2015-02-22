<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of utilDBClass
 *
 * @author amrmo_sho
 */

namespace libs\utiles;

class utilDBClass {

    //put your code here


    public function __construct($foldersMap, $config, $variables, $db) {



        $this->foldersMap = $foldersMap;
        $this->config = $config;
        $this->variables = $variables;
        $this->parent = $_GET['parent'];

        $this->db = $db;
    }

    function getCategoryData($table, $catid, $type, $where = "id") {



        $catids = explode(",", $catid);

        $id = $catids[0];
        if (trim($id) == "") {
            $id = $catids[1];
        }


        if ($type == "data") {
            $datasql = $this->db->get_data($table, '', " `" . $where . "` ='" . $id . "'");
        } else {
            $datasql = $this->db->get_row($table, '', " `" . $where . "` ='" . $id . "'");
        }
        return $datasql;
    }

    function getXrefData($table, $catid, $more = "", $xreftable = "") {
        if ($xreftable == "") {

            $xreftable = $table . "_xref";
        }

        $catids = explode(",", $catid);

        $sqlString = "SELECT  
            $table.*
            From    $table 
            INNER JOIN $xreftable ON    
            $table.enabled='1' and 
            $table.delete='0'  and   
       
                $table.id=$xreftable.item_id and    $xreftable.cat_id=" . $catids[0] . " " . $more;

        $datasql = $this->db->get_data_query($sqlString);

        return $datasql;
    }

    function updateStringTorray($ds) {
        $d = "";
        //   $d1 = str_replace("=>", "=", $ds);





        $r = explode("__", $ds);

        foreach ($r as $k => $v) {
            if (isset($v) && trim($v) != "") {
                $vs = explode("=>", $v);
                $d[$vs[0]] = $vs[1];
            }
        }
        return $d;
    }

     function arrayFromString($ds) {
        $d = "";
        //   $d1 = str_replace("=>", "=", $ds);





        $r = explode("__", $ds);

        foreach ($r as $k => $v) {
            if (isset($v) && trim($v) != "") {
                $vs = explode("=>", $v);
                $d[$vs[0]] = $vs[1];
            }
        }
        return $d;
    }

    
    
    
    
    
    function UpdateTextvars($sendData, $body) {

        preg_match_all('/\@(.*?)\@/', $body, $matches);

        for ($i = 0; $i < count($matches[0]); $i++) {
            $body = str_replace($matches[0][$i], $sendData[$matches[1][$i]], $body);
        }
        return $body;
    }

    function arrayRemovePrfx($arry, $p) {
        foreach ($arry as $k => $v) {
            $arry[$k] = str_replace($p, "", $v);
        }
        return $arry;
    }

    function arrayVarUpdate($array) {




        foreach ($array as $k => $v) {


            $array[$k] = $this->varUpdate($v);
        }

        return $array;
    }

    function TextVarUpdate($sendData, $body, $file, $escapevar = "") {
        if (is_array($body)) {

            foreach ($body as $k => $v) {
                preg_match_all('/@%(.*?)%@/', $v, $matches);


                for ($i = 0; $i < count($matches[0]); $i++) {
                    $p = explode("::", $matches[1][$i]);


                    if (isset($p[1]) && $escapevar == "") {
                        $T = $this->varUpdate($matches[0][$i], $file);
                        $body[$k] = str_replace($matches[0][$i], $T, $v);
                    } else {
                        $body[$k] = str_replace($matches[0][$i], $sendData[$matches[1][$i]], $v);
                    }
                }
            }
        } else {

            preg_match_all('/@%(.*?)%@/', $body, $matches);



            for ($i = 0; $i < count($matches[0]); $i++) {

                $p = explode("::", $matches[1][$i]);


                if (isset($p[1]) && $escapevar == "") {

                    $T = $this->varUpdate($matches[0][$i], $file);


                    $body = str_replace($matches[0][$i], $T, $body);
                } else {

                    $body = str_replace($matches[0][$i], $sendData[$matches[1][$i]], $body);
                }
            }
        }



        return $body;
    }

    function TextVarChange($var, $value, $body) {

        preg_match_all('/@%(.*?)%@/', $body, $matches);




        for ($i = 0; $i < count($matches[0]); $i++) {



            if ($matches[1][$i] == $var) {
                $body = str_replace($matches[0][$i], $value, $body);
            }
        }
        return $body;
    }

    function TextVarReturn($body) {

        preg_match_all('/@%(.*?)%@/', $body, $matches);


        $data = "";


        for ($i = 0; $i < count($matches[0]); $i++) {

            $data[$i] = $matches[1][$i];
        }
        return $data;
    }

    function TextVarRConvert($v) {

        $ids = explode('::', $v);
        $data[$ids['0']] = $ids['1'];

        return $data;
    }

    function TextVarConvert($var, $val = "") {


        $data = "@";
        $data .= $var;
        if ($val != "") {

            $data .= "::" . $val;
        }
        $data.="@";
        return $data;
    }

    /**
     * 
     * @global \libs\utiles\libs\libs $lib
     * @param type $var
     * @param type $file
     * @return type
     * "@%get::com%@" 
     * "@%session::com%@"
     * "@%length::com%@"
     * "@%db::tabel,id,field%@"
     */
    function varDataUpdate($text, $file = "") {
        $text = urldecode($text);


        if (is_array($text)) {

            foreach ($text as $k => $v) {
                preg_match_all('/@%(.*?)%@/', $v, $matches);

                for ($i = 0; $i < count($matches[0]); $i++) {

                    $aw = $this->varUpdate($matches[0][$i], $file);

                    $text = str_replace($matches[0][$i], $aw, $text);
                }
            }
        } else {

            preg_match_all('/@%(.*?)%@/', $text, $matches);


            for ($i = 0; $i < count($matches[0]); $i++) {
                $aw = $this->varUpdate($matches[0][$i], $file);

                $text = str_replace($matches[0][$i], $aw, $text);
            }
        }



        return $text;
    }

    function getLanguageWord($word, $type = "") {
        $link = "";
        /* @var $lib  \libs\libs */
        global $lib;



        if (is_array($type)) {
            $arr = "xxxxxxxxxxxx";
        } else {


            if ($type != "") {
                $link = $this->foldersMap->languages_folder . $lib->util->siteSetting['lang'] . "/" . $type . ".xml";
            } else {
                $link = $this->foldersMap->languages_folder . $lib->util->siteSetting['lang'] . "/general.xml";
            }



            if (is_file($link)) {

                $arr = $lib->util->readXmlvalue($link, $word);
            } else {

                $arr = $word;
            }
            if (is_array($arr)) {
                $arr = $word;
            }
        }

        return $arr;
    }

    function varUpdate($var, $file = "") {

        /* @var $lib  libs\libs */
        global $lib;
        $rv = "";

        $vowels = array("@%", "%@");

        $v = str_replace($vowels, "", urldecode($var));




        $v = explode("::", $v);




        $values = explode(".", $v[1]);
        $labels = explode(".", $v[0]);



        switch ($labels[0]) {
            case "get":
                if (isset($values[1])) {
                    $data = $_GET[$values[1]][$values[1]];
                } else {
                    $data = $_GET[$v[1]];
                }





                if (isset($labels[1])) {



                    if ($labels[1] == "length") {
                        $rv = count($data);
                    } else {
                        $rv = $data;
                    }
                } else {

                    $rv = $data;
                }

                break;
            case "session":




                if (isset($values[1])) {
                    $r = $_SESSION[$values[0]][$values[1]];
                } else {
                    $r = $_SESSION[$v[1]];
                }


                if (is_array($r)) {
                    $data = print_r($r, true);
                } else {

                    $data = $r;
                }



                if (isset($labels[1])) {



                    if ($labels[1] == "length") {


                        $rv = count($data);
                    } else {
                        $rv = $data;
                    }
                } else {

                    $rv = $data;
                }







                break;

            case "db":
                $d = explode(",", $v[1]);
                $data = $this->db->get_row($d[0], "*", "id=" . $d[1]);
                $rv = $data[$d[2]];
                break;


            case "lng":
            case "lang":


                if (is_array($file)) {

                    // print_r($file);$lib->util->data->TextVarUpdate($more, $text);
                    // $lib->util->data->TextVarUpdate($more, $text);


                    if (isset($file[$v[1]])) {
                        $rv = $file[$v[1]];
                    } else {
                        $rv = $v[1];
                    }
                } else {



                    $rv = $this->getLanguageWord($v[1], $file);
                }
                break;
            case "user":
                $rv = $lib->users->getUser($v[1]);

//($v[1], $file);
                break;
            case "module":
                $rv = $lib->front->getmoduleByid($v[1], $type);
                break;

            case "plugin":
                $rv = $lib->plugins->importPlugin($values[0], $values[1]);
                break;


            case "main":
                $rv = $lib->front->getmainByid($v[1]);
                break;
            case "":
                $rv = $file[$var];
                break;
            default :
                $rv = $var;
                break;
        }
        return $rv;
    }

    function getText($text, $more = "", $limit = "") {
        /* @var $lib  libs\libs */
        global $lib;


        $retur = $lib->util->data->TextVarUpdate($more, $text);
        if ($limit > 0) {
            $retur = $lib->util->limit_text($retur, $limit);
        }

        return $retur;
    }

    function getTablesNames() {

        /* @var $lib  libs\libs */
        global $lib;
        $stringmyurl = $lib->util->siteSetting['site_link'] . "/lib/";
        $file = $stringmyurl . $this->foldersMap->lib_folder . "xml/DBTables.xml";


        $tables = $lib->util->gen->readXmlToarray($file);


        $returnData = array();

        $ds = $this->db->get_table_names();

        foreach ($ds as $d) {

            if (isset($tables[$d])) {

                if ($tables[$d]['forview'] != no) {

                    $returnData[$d] = $tables[$d]['tagValue'];
                }
            } else {

                $returnData[$d] = $d;
            }
        }

        return $returnData;
    }

    function getFieldsNames($tabel) {
        /* @var $lib  libs\libs */
        global $lib;
        $DS = $lib->db->get_table_fields($tabel);
        $returnData = array();
        foreach ($DS as $D) {
            array_push($returnData, $D['Field']);
        }

        return $returnData;
    }

    function getFieldType($tabel, $field) {
        /* @var $lib  libs\libs */
        global $lib;
        $DS = $lib->db->get_table_fields($tabel);
        $returnData = "";
        $fs = explode(".", $field);
        if (isset($fs[1])) {
            $field = $fs[1];
        }

        foreach ($DS as $D) {

            if ($D['Field'] == $field) {

                $returnData = $D['Type'];
            }
        }

        return $returnData;
    }

    function updateArray($a) {
        $rarray = array();
        foreach ($a as $k => $v) {

            $ks = explode("_", $k);

            if ($ks[0] != "sys") {
                $rarray[$k] = $v;
            }
        }


        return $rarray;
    }

    function arraytwhere($updatearray, $field = "id", $type = "", $seprter = ",", $typesql = "or") {
        $r = "";
        $i = 0;

        if ($type == "string") {
            $array = split($seprter, $updatearray);
        } else {

            $array = $updatearray;
        }
        foreach ($array as $a) {


            if ($a != "") {

                if ($i == 0) {

                    $r.=$field . "='" . $a . "'";
                } else {


                    $r.=$typesql . " " . $field . "='" . $a . "'";
                }
                $i++;
            }
        }


        return $r;
    }

}

?>
