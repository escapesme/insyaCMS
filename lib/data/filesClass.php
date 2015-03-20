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

class filesClass {

    var $lib = null;

    public function __construct($lib) {
        $this->lib = $lib;
    }

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


            $returndata = $this->lib->foldersMap->admin_plugins_users_folder . "/" . $_GET[$this->variables->url_view];
        } else if ($type == "") {
            $returndata = $this->lib->foldersMap->admin_components_folder . $this->parent . "/" . $_GET[$this->variables->url_view];
        } else if ($type == "module") {
            
        }


        return $returndata;
    }

    function mylink($type = "", $parent = "") {

        if ($type == "") {
            
        } else if ($type == "module") {

            $returndata = $this->lib->foldersMap->fornt_modules_folder . $parent . "/";
        }
        return $returndata;
    }

    function readFilesNames($dir, $types, $prefx = "") {
        
               

        
        
        $reurn = "";
        $type = explode(",", $types);
        
        
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {

                    $filetype = filetype($dir . $file);

                    foreach ($type as $t) {
                        if ($filetype == $t && (trim($file) != ".." && trim($file) != ".")) {
                            
                            
                            if ($prefx != "") {

                                $filePrefx = explode("_", $file)[0];
                            }


                            if ($filePrefx == "" || ($prefx == $filePrefx)) {

                                $reurn .=$file . ",,,";
                            }
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

    // <editor-fold defaultstate="collapsed" desc="Xml">






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

            $link = $this->lib->foldersMap->languages_folder . $this->siteSetting['lang'] . "/general.xml";
        } else {

            $link = $link . ".xml";
        }



        if (is_file($link)) {

            $lang = $this->xmlToarray($link);
        }



        return $lang;
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

        echo $file;



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


        return $data;
    }

    function readXmlnamesString($file, $tag) {
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




        return $data;
    }

    function readXmlvaluesString($file, $tag) {
        $xml = simplexml_load_string(file_get_contents($file));
        $data = array();
        //  echo $file;
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
}
