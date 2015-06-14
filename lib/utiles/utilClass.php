<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

namespace libs\utiles;

require_once('exportClass.php');
require_once('dataBluder.php');
require_once('utillibsClass.php');
require_once('utillibsClass.php');
require_once('utilDBClass.php');
require_once('utilForntClass.php');
require_once('utileCitiesClass.php');
require_once('utilComponentsClass.php');
require_once('utilGenClass.php');
require_once('utilPagClass.php');
require_once('dateTimeClass.php');
require_once('emailsClass.php');
$page_head_tags = "";

class utilClass {

//put your code here

    var $foldersMap = "";
    var $config = "";
    var $variables = "";
    var $parent = "";
    var $siteSetting = "";

    /**
     *
     * @var utilForntClass 
     */
    public $fornt = "";

    /**
     *
     * @var utilGenClass 
     */
    public $gen = "";

    /**
     *
     * @var utilComponentsClass 
     */
    public $com = "";

    /**
     *
     * @var utillibsClass 
     */
    public $lib = "";

    /**
     *
     * @var utileCitiesClass 
     */
    public $cities = "";

    /**
     *
     * @var utilDBClass 
     */
    public $data = "";

    /**
     *
     * @var utilPagClass 
     */
    public $page = "";

    /**
     *
     * @var dataBluder 
     */
    public $dataBluder = "";

    /**
     *
     * @var exportClass 
     */
    public $export = "";

    /**
     *
     * @var dateTimeClass
     */
    public $dateTime = "";

    /**
     *
     * @var emailsClass
     */
    public $emails = "";

    public function __construct($lib) {
        /* ->foldersMap, $this->config, $this->variables, $this->db, $this->plugins */


        $this->lib = $lib;

        $this->foldersMap = $this->lib->foldersMap;
        $this->config = $this->lib->config;
        $this->variables = $this->lib->variables;

        $this->db = $this->lib->db;
        $this->parent = $_GET['parent'];
        $this->lib = new utillibsClass($this->foldersMap, $this->lib->config, $this->lib->variables, $this->db);
        $this->page = new utilPagClass($this->foldersMap, $this->lib->config, $this->lib->variables, $this->db);
        $this->data = new utilDBClass($this->foldersMap, $this->lib->config, $this->lib->variables, $this->db);
        $this->cities = new utileCitiesClass($this->foldersMap, $this->lib->config, $this->lib->variables, $this->db);
        $this->fornt = new utilForntClass($this->foldersMap, $this->lib->config, $this->lib->variables, $this->db);
        $this->gen = new utilGenClass($this->lib);
        $this->com = new utilComponentsClass($this->lib, $this->gen);



        $this->dataBluder = new dataBluder($this->lib, $this->gen);
        $this->export = new exportClass($this->lib, $this->gen);

        $this->dateTime = new dateTimeClass($this->lib, $this->gen);
        $this->emails = new emailsClass($this->lib, $this->gen);
    }

    function uitlStrat() {

        $this->siteSetting();
        if (isset($_GET['lang'])) {
            $this->Setting['lang'] = $_GET['lang'];
        }
    }

    function siteSetting() {


        $this->siteSetting = $this->db->get_row("site_setting", "*");
    }

    function getTitle() {


        return "mytitle";
    }

    function arrayTofieldDB($arrays, $more = "or", $field = "id") {

        $r = "";


        $i = 0;
        foreach ($arrays as $a) {

            if ($a != "") {

                if ($i > 0) {

                    $m = $more;
                }
                $r.=" " . $m . " " . $field . '="' . $a . '"';
                $i++;
            }
        }


        return $r;
    }

    function updateSelectOptions($options, $value = "") {
        $data = "";


        foreach ($options as $k => $v) {

            $select = "";
            if ($k == $value) {

                $select = "selected";
            } else {


                $select = "";
            }

            $data.="<option $select value='" . $k . "'> " . $v . "</option>";
        }



        return $data;
    }

    function out($string, $return) {
        global $lib;

        if ($return == true) {
            return $lib->util->data->varDataUpdate($string);
        } else {
            echo $lib->util->data->varDataUpdate($string);
        }
    }

    function getPageNumber($rowNumbers, $allNumbers, $moreClas = "", $rowFrom = "", $tpy = "") {



        $data = "";


        if ($tpy != "") {
            if ($rowFrom == "") {
                if (isset($_GET['page'])) {
                    $rowFrom = $_GET['page'];
                } else {

                    $rowFrom = "0";
                }
            }

            $next = $rowFrom + $rowNumbers;
            $prv = $rowFrom - $rowNumbers;
            $pagesNum = floor($allNumbers / $rowNumbers);
            $lastpage = $rowNumbers * $pagesNum;





            if ($pagesNum >= 1) {

                $nextlink = "<a href='" . $this->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->getLanguageWord("next", "general") . "'>" . $this->getLanguageWord("next", "general") . "</a>";
                $pervlink = "<a href='" . $this->getModurl("page") . "_" . $prv . "/' class='prev' title='" . $this->getLanguageWord("prev", "general") . "'>" . $this->getLanguageWord("prev", "general") . "</a>";

                $first = "<a href='" . $this->getModurl("page") . "_" . "0/' class='first' title='" . $this->getLanguageWord("first", "general") . "' >" . $this->getLanguageWord("first", "general") . "</a>";
                $last = "<a href='" . $this->getModurl("page") . "_" . $lastpage . "/' class='last' title='" . $this->getLanguageWord("last", "general") . "'>" . $this->getLanguageWord("last", "general") . "</a>";
            }
            $pages = "";



            for ($i = 0; $i < $pagesNum; $i++) {
                $mypage = $i + 1;
                $mynum = $i * $rowNumbers;

                $mClass = "";
                if ($rowFrom == $mynum) {

                    $mClass = "act";
                }
                $pages.="<a href='" . $this->getModurl("page") . "_" . $i * $rowNumbers . "/' class='pagenumber " . $mClass . "'>" . $mypage . "</a>";
            }




            if ($rowFrom < $rowNumbers) {
                $pervlink = "<a href='#' class='prev disable ' title='" . $this->getLanguageWord("prev", "general") . "'>" . $this->getLanguageWord("prev", "general") . "</a>";
            }
            if ($rowFrom + $rowNumbers > $allNumbers) {

                $nextlink = "11<a href='#' class='next disable' title='" . $this->getLanguageWord("next", "general") . "'>" . $this->getLanguageWord("next", "general") . "</a>";
            }

            $data.="<div class='pagesBar " . $moreClas . "'>" . $first . $pervlink . $pages . $nextlink . $last . "</div>";
        } else {

            if ($rowFrom == "") {
                if (isset($_GET['page'])) {
                    $rowFrom = $_GET['page'];
                } else {

                    $rowFrom = "0";
                }
            }

            $next = $rowFrom + $rowNumbers;
            $prv = $rowFrom - $rowNumbers;

            if ($rowFrom < 0) {

                $rowFrom = 0;
            }

            if ($prv < 0) {

                $prv = 0;
            }

            if ($next < 0) {

                $next = 0;
            }


            if ($allNumbers > $rowNumbers) {


                $pageNumbers = $allNumbers / $rowNumbers;
                $thpage = $rowFrom / round($rowNumbers);


                $thpage+=1;

                if ($rowFrom > 0) {
                    $data.= "<div  class='pagesbar'>";
                    if ($allNumbers > $next) {
                        $data.= "<a href='" . $this->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->getLanguageWord("next", "general") . "'>" . $this->getLanguageWord("next", "general") . "</a>";
                    } else {
                        $data.= "<a  class='next disable' title='" . $this->getLanguageWord("next", "general") . "'>" . $this->getLanguageWord("next", "general") . "</a>";
                    }


                    $data.= "<a class='next fpage' title='" . $this->getLanguageWord("next", "general") . "'>"
                            . $this->getLanguageWord("page", "general")
                            . " - " . $thpage . ""
                            . "</a>";
                    $data.= "<a href='" . $this->getModurl("page") . "_" . $prv . "/' class='prev' title='" . $this->getLanguageWord("prev", "general") . "'>" . $this->getLanguageWord("prev", "general") . "</a> </div>";
                } else {


                    $data.= "<div class='pagesbar'><a href='" . $this->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->getLanguageWord("next", "general") . "'>" . $this->getLanguageWord("next", "general") . "</a>
                       ";





                    $data.= "<a  class='next fpage' title='" . $this->getLanguageWord("next", "general") . "'>"
                            . $this->getLanguageWord("page", "general")
                            . " - 1"
                            . "</a></div>";
                }
            }
        }




        return $data;
    }

    function gteLangDataAttr() {

        $r = "";




        if (isset($_GET['lang'])) {
            $r = "data-lang=\"" . $_GET['lang'] . "\" ";
        }

        return $r;
    }

    function getPageNumber_mobile($rowNumbers, $allNumbers, $moreClas = "", $rowFrom = "", $tpy = "") {



        $data = "";


        if ($tpy != "") {
            if ($rowFrom == "") {
                if (isset($_GET['page'])) {
                    $rowFrom = $_GET['page'];
                } else {

                    $rowFrom = "0";
                }
            }

            $next = $rowFrom + $rowNumbers;
            $prv = $rowFrom - $rowNumbers;
            $pagesNum = floor($allNumbers / $rowNumbers);
            $lastpage = $rowNumbers * $pagesNum;





            if ($pagesNum >= 1) {

                $nextlink = "<a href='" . $this->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->getLanguageWord("next", "general") . "'>" . $this->getLanguageWord("next", "general") . "</a>";
                $pervlink = "<a href='" . $this->getModurl("page") . "_" . $prv . "/' class='prev' title='" . $this->getLanguageWord("prev", "general") . "'>" . $this->getLanguageWord("prev", "general") . "</a>";

                $first = "<a href='" . $this->getModurl("page") . "_" . "0/' class='first' title='" . $this->getLanguageWord("first", "general") . "' >" . $this->getLanguageWord("first", "general") . "</a>";
                $last = "<a href='" . $this->getModurl("page") . "_" . $lastpage . "/' class='last' title='" . $this->getLanguageWord("last", "general") . "'>" . $this->getLanguageWord("last", "general") . "</a>";
            }
            $pages = "";



            for ($i = 0; $i < $pagesNum; $i++) {
                $mypage = $i + 1;
                $mynum = $i * $rowNumbers;

                $mClass = "";
                if ($rowFrom == $mynum) {

                    $mClass = "act";
                }
                $pages.="<a href='" . $this->getModurl("page") . "_" . $i * $rowNumbers . "/' class='pagenumber " . $mClass . "'>" . $mypage . "</a>";
            }




            if ($rowFrom < $rowNumbers) {
                $pervlink = "<a href='#' class='prev disable ' title='" . $this->getLanguageWord("prev", "general") . "'>" . $this->getLanguageWord("prev", "general") . "</a>";
            }
            if ($rowFrom + $rowNumbers > $allNumbers) {

                $nextlink = "<a href='#' class='next disable' title='" . $this->getLanguageWord("next", "general") . "'>" . $this->getLanguageWord("next", "general") . "</a>";
            }

            $data.="<div data-role=\"navbar\" data-iconpos=\"bottom\" class='pagesBar " . $moreClas . "'>" . $first . $pervlink . $pages . $nextlink . $last . "</div>";
        } else {

            if ($rowFrom == "") {
                if (isset($_GET['page'])) {
                    $rowFrom = $_GET['page'];
                } else {

                    $rowFrom = "0";
                }
            }

            $next = $rowFrom + $rowNumbers;
            $prv = $rowFrom - $rowNumbers;

            if ($rowFrom < 0) {

                $rowFrom = 0;
            }

            if ($prv < 0) {

                $prv = 0;
            }

            if ($next < 0) {

                $next = 0;
            }


            if ($allNumbers > $rowNumbers) {


                $pageNumbers = $allNumbers / $rowNumbers;
                $thpage = $rowFrom / round($rowNumbers);


                $thpage+=1;

                if ($rowFrom > 0) {
                    $data.= "<div data-role=\"navbar\"    class='pagesbar'><ul>";


                    $data.= "<li><a data-icon=\"arrow-l\" href='" . $this->getModurl("page") . "_" . $prv . "/' class='prev' title='" . $this->getLanguageWord("prev", "general") . "'>" . $this->getLanguageWord("prev", "general") . "</a> </li>"
                    ;




                    $data.= "<li  data-iconpos=\"left\"><a   class='next fpage' title='" . $this->getLanguageWord("next", "general") . "'>"
                            . $this->getLanguageWord("page", "general")
                            . " - " . $thpage . ""
                            . "</a></li>";

                    if ($allNumbers > $next) {
                        $data.= "<li data-iconpos=\"right\"><a data-icon=\"arrow-r\" href='" . $this->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->getLanguageWord("next", "general") . "'>" . $this->getLanguageWord("next", "general") . "</a></li>";
                    }

                    $data.= "</ul></div>";
                } else {


                    $data.= "<div data-role=\"navbar\" data-iconpos=\"bottom\"  class='pagesbar'><ul>"
                    ;


                    $data.= "<li><a  class='next fpage' title='" . $this->getLanguageWord("next", "general") . "'>"
                            . $this->getLanguageWord("page", "general")
                            . " - 1"
                            . "</a></li>";


                    $data.= "<li><a data-icon=\"arrow-r\"  href='" . $this->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->getLanguageWord("next", "general") . "'>"
                            . "" . $this->getLanguageWord("next", "general") . "</a></li>
                        </ul></div>";
                }
            }
        }




        return $data;
    }

    // <editor-fold defaultstate="collapsed" desc="moved">



    function getModurl($remov) {

        $data = "/";
        $G = $_GET;
        foreach ($G as $key => $val) {
            $removarr = explode(",", $remov);
            foreach ($removarr As $r) {
                unset($G[$r]);
            }
        }


        foreach ($G as $key => $val) {
            if ($key == "alias") {

                $data.=$val;
            }
        }
        foreach ($G as $key => $val) {
            if ($key == "cat_id") {

                $data.="/" . $val;
            }
        }


        foreach ($G as $key => $val) {
            if ($key == "id") {

                $data.= "/" . $val;
            }
        }






        return $data;
    }

    function getAllgets($remov) {
        $data = "";
        $G = $_GET;
        foreach ($G as $key => $val) {
            $removarr = explode(",", $remov);
            foreach ($removarr As $r) {
                unset($G[$r]);
            }
        }
        foreach ($G as $key => $val) {
            $data .= $key . '=' . $val . "&";
        }
        return $data;
    }

    function getmyurl($type, $remov) {
        $data = "?";

        if ($type == "admin") {
            $data.="" . $this->getAllgets($remov);
        } else {
            $data.="" . $this->getAllgets($remov);
        }
        return $data;
    }

    function getmenuItem($data) {


        return $_GET[$data];
    }

    function thislink($type = "") {

        $returndata = "";
//echo $this->variables->url_view ;





        if ($type == "usersplugin") {


            $returndata = $this->foldersMap->admin_plugins_users_folder . "/" . $_GET[$this->variables->url_view];
        } else if ($type == "") {
            $returndata = $this->foldersMap->admin_components_folder . $this->parent . "/" . $_GET[$this->variables->url_view];
        } else if ($type == "module") {
            
        }


        return $returndata;
    }

    function mylink($type = "", $parent = "") {

        if ($type == "") {
            
        } else if ($type == "module") {

            $returndata = $this->foldersMap->fornt_modules_folder . $parent . "/";
        }
        return $returndata;
    }

    function readFilesNames($dir, $types) {
        $reurn = "";
        $type = explode(",", $types);
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {

                    $filetype = filetype($dir . $file);

                    foreach ($type as $t) {
                        if ($filetype == $t && (trim($file) != ".." && trim($file) != ".")) {

                            $reurn .=$file . ",,,";
                        }
                    }
                }
                closedir($dh);
            }
        }
        $returndta = explode(",,,", $reurn);
        $returndta = array_filter($returndta, 'strlen');
        return $returndta;
    }

    function readXmlnames($file, $tag) {
        $xml = simplexml_load_file($file);
        $data = array();
        $dnum = 0;
        foreach ($xml->children() as $child) {
            if ($child->getName() == $tag) {


                foreach ($child as $key0 => $value) {
                    $dnum++;
                    $data[$dnum] = $key0;
                }
            }
        }


        return $data;
    }

    function readXmlAttributes($file, $tag, $morlink) {

        $xml = simplexml_load_file($file);




        foreach ($xml->children() as $child) {


            if ($child->getName() == $tag) {
                foreach ($child as $key0 => $value) {



                    $data[$key0] = array("data_value" => (string) $value);


                    foreach ($value->attributes() as $attributeskey0 => $attributesvalue1) {



                        if (is_array($data[$key0])) {




                            $data[$key0] = array_merge($data[$key0], array($attributeskey0 => (string) $attributesvalue1));
                        } else {

                            $data[$key0] = array($attributeskey0 => (string) $attributesvalue1);
                        }
                    }
                }
            }
        }
        return $data;
    }

    function readXmlDataString($file, $tag) {
        if (is_file($file)) {
            try {


                $xml = simplexml_load_string(file_get_contents($file));
                $data = array();
                $dnum = 0;

                foreach ($xml->children() as $child) {
                    if ($child->getName() == $tag) {


                        foreach ($child as $key0 => $value) {

                            //  $data[$key0] = (string) $value;

                            foreach ($value->attributes() as $attributeskey0 => $attributesvalue1) {


                                $data[$key0][$attributeskey0] = (string) $attributesvalue1;
                            }


                            $data[$key0]["value"] = (string) $value;
                        }
                    }
                }
            } catch (Exception $e) {
                echo ">>>" . $e->getMessage();
            }
        }


        return $data;
    }

    function readXmlnamesString($file, $tag) {

        try {
            $xml = simplexml_load_string(file_get_contents($file));
            $data = array();
            $dnum = 0;



            //  print_r | ($xml);
            foreach ($xml->children() as $child) {
                if ($child->getName() == $tag) {


                    foreach ($child as $key0 => $value) {
                        $dnum++;
                        $data[$dnum] = $key0;
                    }
                }
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString() . " " . $file;
        }


        return $data;
    }

    function readXmlvaluesString($file, $tag) {

        try {
     

                $xml = simplexml_load_string(file_get_contents($file));
                $data = array();

                $dnum = 0;
                foreach ($xml->children() as $child) {
                    if ($child->getName() == $tag) {
                        foreach ($child->children() as $child2) {
                            $dnum++;
                            $data[$dnum] = (string) $child2;
                        }
                    }
                
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString() . " " . $file;
        }
        return $data;
    }

    function readXmlvalues($file, $tag) {
        $xml = simplexml_load_file($file);
        $data = array();
        $dnum = 0;



        foreach ($xml->children() as $child) {




            if ($child->getName() == $tag) {




                foreach ($child->children() as $child2) {
                    $dnum++;
                    $data[$dnum] = (string) $child2;
                }
            }
        }
        return $data;
    }

    function readXmlvalue($file, $tag) {
        
    
        $xml = simplexml_load_file($file);
        $data = array();
        $dnum = 0;
        foreach ($xml->children() as $child) {




            if ($child->getName() == $tag) {




//  foreach ($child->children() as $child2) {
                $dnum++;
                $data = (string) $child;
// }
            }
        }



        return $data;
    }

    function readtagAttributes($file, $tag) {
        $xml = simplexml_load_file($file);



        foreach ($xml->children() as $child) {


            if ($child->getName() == $tag) {


                foreach ($child->attributes() as $attributeskey0 => $attributesvalue1) {



                    if (is_array($data)) {


                        $data = array_merge($data, array($attributeskey0 => (string) $attributesvalue1));
                    } else {

                        $data = array($attributeskey0 => (string) $attributesvalue1);
                    }
                }
            }
        }
        return $data;
    }

    function getFromProperits($pro) {

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

    function importfiles($link, $file = "") {


        if (is_file($link . "/" . $file . "script.js")) {


            $this->page->add_to_head("<script src= \"/" . $link . "/" . $file . "script.js\" ></script>");
        }
        if (is_file($link . "/" . $file . "functions.php")) {

            include_once ($link . "/" . $file . "functions.php");
        }
        if (is_file($link . "/" . $file . "style.css")) {

            //   echo "  <link type=\"text/css\" rel=\"stylesheet\" href= \"/" . $link . "/" . $file . "style.css\" /> ";

            $this->page->add_to_head("  <link type=\"text/css\" rel=\"stylesheet\" href= \"/" . $link . "/" . $file . "style.css\" /> ");
        }

        /*  if (is_file($link . "/" . $file . $this->siteSetting['lang'] . ".xml")) {

          $lang = $this->xmlToarray($link . "/" . $file . $this->siteSetting['lang'] . ".xml");
          } */

        if (isset($_GET['lang'])) {


            $this->siteSetting['lang'] = $_GET['lang'];
        }

        $lang = $this->getLanguageFile($link . "/" . $file . $this->siteSetting['lang']);


        return $lang;
    }

    function importfilesFroAdmin($link, $file = "") {


        if (is_file($link . "/" . $file . "script.js")) {
            echo "<script src= \"/admin/" . $link . "/" . $file . "script.js\" ></script>";
        }
        if (is_file($link . "/" . $file . "functions.php")) {

            include_once ($link . "/" . $file . "functions.php");
        }
        if (is_file($link . "/" . $file . "style.css")) {
            echo "  <link type=\"text/css\" rel=\"stylesheet\" href= \"/admin/" . $link . "/" . $file . "style.css\" /> ";
        }

        /*  if (is_file($link . "/" . $file . $this->siteSetting['lang'] . ".xml")) {

          $lang = $this->xmlToarray($link . "/" . $file . $this->siteSetting['lang'] . ".xml");
          } */
        $lang = $this->getLanguageFile($link . "/" . $file . $this->siteSetting['lang']);
        return $lang;
    }

    function getLanguageFile($link) {
        $lang = "";


        if ($link == "") {

            $link = $this->foldersMap->languages_folder . $this->siteSetting['lang'] . "/general.xml";
        } else {

            $link = $link . ".xml";
        }



        if (is_file($link)) {

            $lang = $this->xmlToarray($link);
        }



        return $lang;
    }

    function xmlToarray($file) {
        try {

            $xml = simplexml_load_file($file);
            foreach ($xml->children() as $child) {
                $data[$child->getName()] = "" . $child;
            }
        } catch (Exception $e) {
            echo 'Error: xml Load :' . $file . ' <br />', $e->getMessage(), "\n";
        }
        return $data;
    }

    // </editor-fold>




    function thisTable() {
        return $_GET[$this->variables->url_view];
    }

    function getProperty($name, $type = "") {
        $returnData = "";
        if ($type == "") {
            $returnData = $_SESSION[$name];
        } else {
            $returnData = $_COOKIE[$name];
        }
        return $returnData;
    }

    function creatProperty($name, $value, $type = "") {
        if ($type == "") {
            $_SESSION[$name] = $value;
        } else {
            $inTwoMonths = 60 * 60 * 24 * 60 + time();
            setcookie($_GET['name'], $_GET['value'], $inTwoMonths);
        }
        return "done";
    }

    function removProperty($name, $type = "") {
        if ($type == "") {
            unset($_SESSION[$name]);
        } else {
            unset($_COOKIE[$name]);
        }
        return "done";
    }

    function howManyDays($startDate, $endDate) {

        $date1 = strtotime($startDate . " 0:00:00");
        $date2 = strtotime($endDate . " 23:59:59");
        $res = (int) (($date2 - $date1) / 86400);

        return $res;
    }

    function dateTodb($data) {
        $newdate = explode('/', $data);

        if (isset($newdate) && $newdate[0] != "") {

            $dd = $newdate[2] . "-" . $newdate[1] . "-" . $newdate[0];
            $dd = str_replace('--', '', $dd);
        } else {

            $dd = $data;
        }
        return $dd;
    }

    function dateFromdb($data) {
        $newdate = explode('-', $data);
        if (isset($newdate) && $newdate[0] != "") {

            $l = explode(" ", $newdate[2]);

            $dt = $l[0] . "/" . $newdate[1] . "/" . $newdate[0];

            $dt = str_replace('//', '', $dt);
        } else {
            $dt = $data;
        }

        return $dt;
    }

    function getMenuAlias($data) {
        $d = $this->db->get_row("menu_itmes", "*", "mei_main='" . $data . "' and `main_link`='1'");
        $returnData = $d['mei_alias'];
        if ($returnData == "") {
            $d = $this->db->get_row("menu_itmes", "*", "mei_main='" . $data . "'");
            $returnData = $d['mei_alias'];
        }
        return $returnData;
    }

    function getMenuMain($data) {
        $d = $this->db->get_row("menu_itmes", "*", "mei_alias='" . $data . "'");
        return $d['mei_main'];
    }

    function getMenuTite($data) {
        $d = $this->db->get_row("menu_itmes", "*", "mei_alias='" . $data . "'");
        return $d['mei_title'];
    }

    function odd_or_even($number = FALSE) {
        if (is_numeric($number)) {
            return $number % 2 === 1 ? 'odd' : 'even';
        }
    }

    /* function sendMailData($meils, $meilTemplat_id, $dataBefor = "", $dataAfter = "", $vraarys = "") {

      global $lib;



      $Msetting = $this->db->get_row("com_mailsTemplates", "", "id='" . $meilTemplat_id . "'");
      $subject = $Msetting['subject'];
      $formlabel = $Msetting['formlabel'];
      $formmail = $Msetting['formmail'];

      $body = $dataBefor . $lib->util->data->UpdateTextvars($vraarys, $Msetting['body']) . $dataAfter;
      return $this->sendMail($meils, $body, $subject, $formlabel, $formmail);
      }
     */

    function sendMailData($meils, $meilTemplat_id, $dataBefor = "", $dataAfter = "", $vraarys = "") {

        global $lib;
        $Msetting = $this->db->get_row("com_mailstemplates", "", "id='" . $meilTemplat_id . "'");
        $subject = $Msetting['subject'];
        $formlabel = $Msetting['sender_name'];
        $formmail = $Msetting['sender_mail'];
        $meils .=";" . $Msetting['recipients'];
        $body = $dataBefor . $lib->util->data->UpdateTextvars($vraarys, $Msetting['body']) . $dataAfter;
        return $this->sendMail($meils, $body, $subject, $formlabel, $formmail);
    }

    function sendMail($emails, $message, $subject, $formlabel, $formmail) {
        global $lib;
        return $lib->util->emails->sendMail($emails, $message, $subject, $formlabel, $formmail);
    }

    function sendHTMLMail($emails, $HTMLID, $subject, $formlabel, $formmail, $dataVars, $morePath = "", $lang = "") {
        /* @var $lib  \libs\libs */
        global $lib;

        $message = $this->db->get_row("com_html", "*", "id=" . $HTMLID);




        $menuTitle = $lib->language->getText("com_html", "my_body", $HTMLID, $message['my_body'], $lang);






        $r = $lib->util->data->TextVarUpdate($dataVars, $menuTitle);

        $lib->util->emails->morePath = $morePath;

        return $lib->util->emails->sendMail($emails, $r, $subject, $formlabel, $formmail);
    }

//type [admin ,componente,message]








    function getLangVar($var, $file) {


        $title = $this->getLanguageWord($var, $file);

        return $title;
    }

    function getLangWord($type, $word) {

        $file = "";
        switch ($type) {
            case "admin":
                $file = $this->foldersMap->admin_languages_folder . $this->siteSetting['admin_lang'] . "/admin.xml";
                break;
            case "component":
                $file = $this->foldersMap->admin_languages_folder . $this->siteSetting['admin_lang'] . "/componentes.xml";
                break;
            case "message":
                $file = $this->foldersMap->admin_languages_folder . $this->siteSetting['admin_lang'] . "/messages.xml";

                break;
        }


        $arr = $this->readXmlvalue($file, $word);
        return $arr;
    }

    function getLanguageWord($word, $type = "") {
        $link = "";


        if (is_array($type)) {
            
        } else {


            if ($type != "") {
                $link = $this->foldersMap->languages_folder . $this->siteSetting['lang'] . "/" . $type . ".xml";
            } else {
                $link = $this->foldersMap->languages_folder . $this->siteSetting['lang'] . "/general.xml";
            }



            if (is_file($link)) {
                $arr = $this->readXmlvalue($link, $word);
            } else {

                $arr = $word;
            }
            if (is_array($arr)) {
                $arr = $word;
            }
        }
        return $arr;
    }

    function updatCodes($data) {

        $myvaltuitle = explode("__", $data);



        switch ($myvaltuitle[0]) {
            case "GET":
            case "get":
                $retdate = $_GET[$myvaltuitle[1]];
                break;
            case "lng":
            case "LNG":
                $retdate = $this->getLangWord("component", $myvaltuitle[1]);
                break;


            default :
                $retdate = $data;
                break;
        }



        return $retdate;
    }

    function is_thatimage($data) {
        $file = $data;
        if (!is_file($file)) {

            $file = 'images/photo_not_available.jpg';
        }

        return $file;
    }

    function sendMassage($type, $title, $data) {

        echo "
<script>sendMassge('" . $type . "', '" . $title . "', '" . $data . "')</script>
";
    }

    function getVideoGallery($id, $pro) {
        global $lib;


        global $lib;
        $more = " order by `order` DESC ";

        $datasql = $this->getXrefData('com_video_gallery', $id, $more);

        $mydata = '<div class=\'list_carousel\'><ul>';
        foreach ($datasql as $d) {
            $data = $d;
            $mydata .= $this->u_sliderData_Block($pro, 'com_video_gallery', "com_video_gallery_categories", $data, 'video');
        }

        $mydata .= '</ul></div>';
        $returnData.= $this->u_slidedata($mydata, $id, $pro, "ac_vide_gallery");
        return $returnData;
    }

    function u_sliderData_Block($pro, $tableName, $tablecatName, $data, $type) {

        global $lib;

        $dcat = $lib->util->data->getCategoryData($tablecatName, $data['cat_id']);
        $url = $lib->util->createURL($tableName, $dcat['alias']);

        $mydata .= '<li>';


        $mydata .= '<div class=\'slide_inner\'>';
        if ($type == "video") {

            $mydata .= '<a  class=\'lightbox-img\' rel="prettyPhoto" class="lightbox-slideshow"    title=\'' . $data['title'] . '\' href=\'' . $data['url'] . '\' >';
        } else {
            $mydata .= '<a  class=\'lightbox-img\' rel="prettyPhoto[gallery]" class="lightbox-slideshow"    title=\'' . $data['title'] . '\' href=\'/uploads/images/' . $data['image'] . '\' >';
        }



        $mydata .= ' <img  
                style=\'width:' . $pro['imageWidth'] . ';height:' . $pro['imageHeight'] . ';\' 
                  class=\'photo itemBlock_imgae\'
                src=\'/uploads/images/' . $data['th_image'] . '\' 
                alt=\'' . $data['title'] . '\'>';

        $mydata .= ' <div class=\'caption\' >' . $data['title'] . '</div>';



        $mydata .= '</a>';



        $mydata .= '</div></li>';



        return $mydata;
    }

    function u_slidedata($data, $myid, $pro, $myDivId) {


        $pro['timer'] = 1;
        $pro['buttonsShow'] = 1;
        $pro['pagesShow'] = 1;
        $pro['auto'] = 0;
        $pro['timer'] = 1;
        $pro['number_slides_visible'] = 4;
        $pro['number_slides_visible'] = 4;
        $pro['delay'] = 10000;
        $pro['height'] = '100px';
        $pro['direction'] = "left";
        $pro['scroll'] = 1;
        $returnData.='<div class="slideshow ' . $myDivId . '" id="' . $myDivId . '' . $myid . '">' . $data . '';
        if ($pro['timer'] == "1") {
            $returnData.=' 
<div class="timer1"></div> ';
        }
        $returnData.='<div class=\'btsbar\'> ';
        if ($pro['buttonsShow'] == "1") {
            $returnData.='    
 
<a  class="next" href="#">&gt;</a><a class="prev" href="#">&lt;</a>';
        }
        if ($pro['pagesShow'] == "1") {
            $returnData.=' 
<div  class="pager"></div>';
        }

        $returnData.='</div></div>

<script>
     $(function(){
	
         $(\'#' . $myDivId . '' . $myid . ' ul\').carouFredSel({
                                        direction: \'' . $pro['direction'] . '\',
                                        height: \'' . $pro['height'] . '\',';



        if ($pro['buttonsShow'] == "1") {
            $returnData.=' 
					prev: \'#' . $myDivId . '' . $myid . ' .prev\',
					next: \'#' . $myDivId . '' . $myid . ' .next\',';
        }
        if ($pro['pagesShow'] == "1") {
            $returnData.=' 
                                        pagination: "#' . $myDivId . '' . $myid . ' .pager",';
        }


        $returnData.=' 	width: \'100%\',
                                        
					scroll: ' . $pro['scroll'] . ',
                                        mousewheel: true';




        if ($pro['auto'] == "1") {
            $returnData.=' , auto: {
                                        delay:' . $pro['delay'] . ',
                                        pauseOnHover: \'resume\'';

            if ($pro['timer'] == "1") {
                $returnData.=' ,progress: \'#' . $myDivId . '' . $myid . ' .timer1\'';
            }
            $returnData.='}';
        } else {

            $returnData.=' , auto:false';
        }




        $returnData.=' ,swipe: {
						onMouse: false,
						onTouch: true
					},
					items: {
                                        height: \'30%\',	
						visible: {
							min: ' . $pro['number_slides_visible'] . ',
							max: ' . $pro['number_slides_visible'] . '
						}
					}
				});

  

    });
</script>';



        return $returnData;
    }

    function getPlugins($id, $table) {
        global $lib;



        $er = $lib->colltions->getCollectionDataRowFromDB("sys_pugins_data", $table, $id);
        $rs = explode("||", $er);



        foreach ($rs as $r) {
            $rs2 = explode(";", $r);
            if (count($rs2[0]) > 0) {
                $rs3 = explode("__", $rs2[0]);
                $o['id'] = $id;
                $o['type'] = $table;
                $out.= $lib->plugins->importPlugin($rs3[1], $r, $o);
            }
        }


        $out .= $this->getmoreData($id, $table);
        return $out;
    }

    function getmoreData($id, $table) {
        global $lib;
        $er = $lib->colltions->getCollectionData("sys_more_data", $table, $id);



        $out.= $lib->plugins->importPlugindB("plg_moreData", $er);

        return $out;
    }

    function getImageGallery($id, $pro) {
// $pro['effect']   $pro['Speed']  $pro['pauseTime'] $pro['directionNav'] $pro['pauseOnHover'] $pro['controlNavThumbs'] $pro['style']

        global $lib;


        global $lib;
        $more = " order by `order` DESC ";

        $datasql = $this->getXrefData('com_images_gallery', $id, $more);

        $mydata = '<div class=\'list_carousel\'><ul>';
        foreach ($datasql as $d) {
            $data = $d;
            $mydata .= $this->u_sliderData_Block($pro, 'com_images_gallery', "com_images_gallery_categories", $data);
        }

        $mydata .= '</ul></div>';
        $returnData.= $this->u_slidedata($mydata, $id, $pro, "ac_images_gallery");
        return $returnData;
    }

    function limit_text($text, $limit) {
        $words = explode(" ", $text);

        if (count($words) > $limit) {

            $text = implode(" ", array_splice($words, 0, $limit)) . "...";
        }

        return $text;
    }

    function arrayremoveBoubl($mydata2) {

        $array = array();
        $datarray = array();

        for ($i = 0; $i < count($mydata2); $i++) {
            $id = $mydata2[$i];
            if (!in_array($id, $array)) {
                array_push($array, $id);
                array_push($datarray, $mydata2[$i]);
            }
        }
        return $datarray;
    }

    function getDataByhits($meTab, $where) {
        global $lib;
        $mydata2 = $lib->db->get_data_query("SELECT  
              " . $meTab . ".* ,plg_hits.nums
            From      " . $meTab . "    INNER JOIN plg_hits
            ON      " . $meTab . ".enabled='1' and   
                " . $meTab . ".delete='0' and  
                      plg_hits.ob_type='" . $meTab . "' and 
                          " . $meTab . ".id=plg_hits.ob_id and
                             plg_hits.ob_id<>'0'
                        '" . $where . "'  order by plg_hits.nums DESC");
        /*
          $array = array();
          $datarray = array();

          for ($i = 0; $i < count($mydata2); $i++) {
          $id = $mydata2[$i]['id'];
          if (!in_array($id, $array)) {
          array_push($array, $id);
          array_push($datarray, $mydata2[$i]);
          }
          } */
        return $mydata2;
    }

    function updateDate($data) {
        $date = new DateTime($data);


        return $date->format(' l jS F Y');
    }

    function getTags($com, $maxFontStyle, $minFontStyle) {


        global $lib;



        $returnData = "";


        $data = $lib->db->get_Data($com, "*", "`enabled`=1 and  `delete`=0");


        $arrayTags = array();
        foreach ($data as $d) {
            $arrayTags = array_merge($arrayTags, explode(";", $d['tags']));
        }

        $arrayTags = array_unique($arrayTags);



        $allnumbers = 0;

        foreach ($arrayTags as $tag) {

            $tagdata = $lib->db->get_Data($com, "*", "`enabled`=1 and  `delete`=0 and tags like'%" . $tag . "%' ");
            $allnumbers+=count($tagdata);
        }



        foreach ($arrayTags as $tag) {



            $tagdata = $lib->db->get_Data($com, "*", "`enabled`=1 and  `delete`=0 and tags like'%" . $tag . "%' ");
            $pros = round(( count($tagdata) / $allnumbers) * 100);

            $updateStyle = ($maxFontStyle * $pros) / 100;

            if ($updateStyle < $minFontStyle) {
                $updateStyle = $minFontStyle;
            }


            $tag = trim($tag);




            $urlTag = $this->createURL($com, "tag", $tag);




            $returnData .= "<div  style='float:right; padding:1px;font-size:" . $updateStyle . "pt'>
                <a title='More' style='float:right; padding:1px;font-size:" . $updateStyle . "pt' href='" . $urlTag . "'>" . $tag . "</a> </div>";
        }


        return $returnData;
    }

    function getAuthor($com) {



        global $lib;
        $data = $this->db->get_Data($com, "DISTINCT  author", "`enabled`=1 and  `delete`=0");
        $returnData = "";


        foreach ($data as $A) {

            $urlTag = $this->createURL($com, "user", $A['author']);


            $returnData .= "<div class=' blockitem item author' ><a href='" . $urlTag . "'>" . $A['author'] . "</a></div>";
        }
        return $returnData;
    }

    function getDate($com) {



        $data = $this->db->get_Data($com, "DISTINCT  date", "`enabled`=1 and  `delete`=0");
        $returnData = "";


        foreach ($data as $A) {

            $date = $A['date'];
            $urlTag = $this->createURL($com, "date", $date);
            $returnData .= "<div class='blockitem item date'><a href='" . $urlTag . "'>" . $this->updateDate($date) . "</a></div>";
        }
        return $returnData;
    }

    function youtubereturneurl($url) {

        parse_str(parse_url($url, PHP_URL_QUERY), $qstring);

        return "http://www.youtube.com/v/{$qstring['v']}&hl=en&fs=1";
    }

    function youtubePlay($url, $width, $height, $img = "") {

        parse_str(parse_url($url, PHP_URL_QUERY), $qstring);

        $retData .= "<div class='video' style='width:" . $width . ";height:" . $height . "'>"
                . "<div class='close'></div>";

        if ($img != "") {
            $retData .=" <img  style='width:100% ;height:$height' src='$img' />"
                    . "\n"
                    . "<script>videoandImage();</script>\n";
        }


        $retData .= <<<EOF
               
                 <div class='myvideo'>
              <iframe 
                  id="ytplayer"
                      class="youtubeVideo"
                          src="http://www.youtube.com/v/{$qstring['v']}&hl=en&fs=1" style="width:$width; height:$height; z-index:2000" &
                              . &frameborder="0" &
                                  . &allowfullscreen="true">
                 </iframe>  
                
 
       
         </div>
                
EOF;
        $retData .="</div>";







        return $retData;
    }

    function youtubeToemd($url) {
        /*
         * type1: http://www.youtube.com/watch?v=H1ImndT0fC8
         * type2: http://www.youtube.com/watch?v=4nrxbHyJp9k&feature=related
         * type3: http://youtu.be/H1ImndT0fC8
         */
        $vid_id = "";
        $flag = false;
        if (isset($url) && !empty($url)) {
            /* case1 and 2 */
            $parts = explode("?", $url);
            if (isset($parts) && !empty($parts) && is_array($parts) && count($parts) > 1) {
                $params = explode("&", $parts[1]);
                if (isset($params) && !empty($params) && is_array($params)) {
                    foreach ($params as $param) {
                        $kv = explode(" = ", $param);
                        if (isset($kv) && !empty($kv) && is_array($kv) && count($kv) > 1) {
                            if ($kv[0] == 'v') {
                                $vid_id = $kv[1];
                                $flag = true;
                                break;
                            }
                        }
                    }
                }
            }

            /* case 3 */
            if (!$flag) {
                $needle = "youtu.be/";
                $pos = null;
                $pos = strpos($url, $needle);
                if ($pos !== false) {
                    $start = $pos + strlen($needle);
                    $vid_id = substr($url, $start, 11);
                    $flag = true;
                }
            }
        }
        return "http://www.youtube.com/embed/" . $vid_id;
    }

    function createURL($alias, $cat, $item, $type) {

         //   print_R($_GET);

        $returnData = "";
        if (trim($_GET['site'])) {

            $returnData = "/site/" . $_GET['site'];
        }
    /*    if (trim($_GET['lang'])) {

            $returnData = "/" . $_GET['lang'];
        }*/

        /*  if (isset($_GET["site"]) && $_GET["site"] != "global") {

          $returnData .= "/site/" . $_GET['site'] . "";
          } */

        $alias = $this->getMenuAlias($alias);




        $returnData .= "/" . $alias . "/";



        if (isset($type) && trim($type) != "") {
            $returnData .= $type . "/";
        }


        if (isset($cat) && trim($cat) != "") {
            $returnData .= $cat . "/";
        }

        if (isset($item) && trim($item) != "") {
            $returnData .= $item . "/";
        }


        return $returnData;
    }

    function createURLW($alias, $cat, $item, $type) {


        $returnData = "/" . $alias . "/";

        if (isset($type) && trim($type) != "") {
            $returnData .= $type . "/" . $cat . "/";
        }


        if (isset($cat) && trim($cat) != "") {
            $returnData .= $cat . "/";
        }

        if (isset($item) && trim($item) != "") {
            $returnData .= $item . "/";
        }


        return $returnData;
    }

    function createURLAL($alias, $items) {

        $items = $this->data->TextVarUpdate("", $items);
        $alias = $this->data->TextVarUpdate("", $alias);

        $returnData = "";





        /*
          if (trim($_GET['lang'])) {

          $returnData = "/" . $_GET['lang'];
          } */

        /* if (isset($_GET["site"]) && $_GET["site"] != "global") {
          $returnData .= "/site/" . $_GET["site"];
          } */


        if ($alias) {

            $returnData .= $alias . "/";
        }
        if (isset($items) && trim($items) != "") {
            $returnData .= $items . "/";
        }


        return $returnData;
    }

    function returnAlias($table, $id) {

        $er = $this->db->get_row($table, "", "id=" . $id);
        return $er['alias'];
    }

    function returnID($table, $alias) {

        $er = $this->db->get_row($table, "", "`alias`='" . $alias . "'");

        return $er['id'];
    }

    function ifExisting($table, $flide, $value) {
        $return = false;
        $er = $this->db->get_row($table, "", "`" . $flide . "`='" . $value . "'");

        if (is_array($er) && isset($er['id'])) {

            $return = true;
        }

        return $return;
    }

    function updateTitleitem($table, $id) {

        $datasql = $this->db->get_Row($table, "*", " `id`='" . $id . "' ");

        $this->updateTitle($datasql['title'], $datasql['title']);
    }

    function updateTitleCategory($table, $id) {
        $catdata = $this->data->getCategoryData($table, $id);
        $this->updateTitle($catdata['title'], $catdata['title']);
    }

    function updateTitle($Windowstitle, $title, $type) {
        $this->add_to_head('<title>' . $Windowstitle . " - " . $this->siteSetting['title'] . '</title>');
        if (type == "title") {
            $this->add_to_head('<title>' . $Windowstitle . '</title>');
        } else if (type == "title-web") {
            $this->add_to_head('<title>' . $Windowstitle . " - " . $this->siteSetting['title'] . '</title>');
        } else {
            $this->add_to_head('<title>' . $this->siteSetting['title'] . " - " . $Windowstitle . '</title>');
        }
        ?>


        <script>
            $(function () {
                $(".pageTitle h3").text("<?= $title ?>");
            });
        </script>
        <?php
    }

    function getXrefData($table, $catid, $more = "", $xreftable = "") {
        if ($xreftable == "") {

            $xreftable = $table . "_xref";
        }



        $catids = explode(",", $catid);
        $wherefcat_id = "";

        if (isset($catids[0]) && trim($catids[0]) != "") {
            $wherefcat_id = " and    $xreftable.cat_id=" . $catids[0];
        }

        $sqlString = "SELECT  
            $table.*
            From    $table 
            INNER JOIN $xreftable ON    
            $table.enabled='1' and 
            $table.delete='0'  and   
       
                $table.id=$xreftable.item_id " . $wherefcat_id . " " . $more;

        $datasql = $this->db->get_data_query($sqlString);

        return $datasql;
    }

    function chkInPermissionGuset($pr) {

        global $lib;
        $returnData = false;
        if ($pr == "0") {

            $returnData = true;
        } else {


            if ($lib->users->getUserPermission("id") == "-1") {

                $returnData = true;
            }
        }

        return $returnData;
    }

    function chkInPermission($id, $pr, $type = "") {


        $returnData = false;
        foreach ($pr as $p) {

            if (trim($type) == "getCat") {
                if ($p['cat_id'] == $id) {
                    $returnData = true;
                }
            } else {


                if ($p['item_id'] == $id) {
                    $returnData = true;
                }
            }
        }


        return $returnData;
    }

    function getAccessDenied() {

        return "<div class='errormsg'>" . $this->getLangWord("admin", "access_denied_msg") . "</div>";
    }

    function headerData($description, $keywords, $header) {
        ?>

        <script>
            $(".keywords").attr("content", $("keywords").attr("content") + "<?= $keywords ?>");
            $(".description").attr("content", $("description").attr("content") + "<?= $description ?>");
            $("head").append("<?= $header ?>");

        </script>
        <?php
    }

    function chearTages($title, $img = "", $video = "", $description = "", $url = "") {

        $url = $this->siteSetting['site_link'] . $url;



        $this->add_to_head('<meta property="og:title" content="' . $title . '" />');
        $this->add_to_head(' <meta property="og:url" content="' . $url . '"/>');




        if ($description != "") {


            $this->add_to_head('  <meta property="og:description" content="' . $description . '" />');
        }
        if ($img != "") {

            $img = $this->siteSetting['site_link'] . $img;

            $this->add_to_head('  <meta property="og:image" content="' . $img . '" />');
        }

        if ($video != "") {

            $this->add_to_head('<meta property="og:video" content="' . $video . '" />');
            $this->add_to_head(' <meta property="og:video:width" content="560" />');
            $this->add_to_head('<meta property="og:video:height" content="340" />');
            $this->add_to_head('<meta property="og:video:type" content="application/x-shockwave-flash" /> ');
        }
    }

    function add_to_head($tag) {
        global $page_head_tags;

        if (!stristr($page_head_tags, $tag)) {
            $page_head_tags .= $tag . "\n";
        }
    }

    function get_to_head() {
        global $page_head_tags;
        return $page_head_tags;
    }

    function getUniqueId() {

        return uniqid();
    }

    function getPlginData($table, $id) {
        $er = $this->db->get_row($table, "", "id=" . $id);

        $mpro = explode(";", $er['plugins_data']);
        $returndata = "";
        foreach ($mpro as $m) {
            if ($m != "") {
                $mf = explode("__", $m);
                $returndata[$mf[0]] = $mf[1];
            }
        }



        return $returndata;
    }

    function arabicDate() {
        $daysarabic = array('الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت');
        $monarabic = array('', 'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو', 'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر');

        $time = strtotime("+8 hours");

        $date = getdate($time);
        $h = $date['hours'];
        if ($date['hours'] < 10) {

            $h = "0" . $date['hours'];
        }


        $m = $date['minutes'];
        if ($date['minutes'] < 10) {

            $m = "0" . $date['minutes'];
        }

        return $daysarabic[$date['wday']] . '، ' . $date['mday'] . '   ' . $monarabic[$date['mon']] . '  ' . $date['year'] . 'م -  ' . $h . ':' . $m . " القاهرة";
    }

    function getsource($table, $id) {

        $plginData = $this->getPlginData($table, $id);


        $sourcedatasql = $this->db->get_Row("plg_rescores", "*", " `id`='" . $plginData['source'] . "' ");

        $urls = $this->createURL($table, "source", $sourcedatasql['alias']);

        $imagePaths = "/uploads/images/" . $sourcedatasql['image'];



        $returnData.= "<div class='source_title'>
           <a title='" . $sourcedatasql['title'] . "' href='" . $urls . "'>
                <img  alt=\"" . $sourcedatasql['title'] . "\"   class='lazy source_image' data-src='" . $imagePaths . "'   src='/images/pixel.gif' />
                    <span>" . $sourcedatasql['title'] . "</span></a></div>";




        return $returnData;
    }

    function reload($url = "", $s = "1") {
        if ($url == "") {

            $url = "?show=" . $_GET['show'];
        }
        echo("<meta http-equiv=\"refresh\" content=\"$s; url=$url\">");
    }

}
?>