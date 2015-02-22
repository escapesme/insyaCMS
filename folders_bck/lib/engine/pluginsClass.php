<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\engine;

class pluginsClass {

    var $foldersMap;
    var $config;
    var $util;

    function __construct($config, $util, $foldersMap) {
        $this->config = $config;
        $this->foldersMap = $foldersMap;
        $this->util = $util;
    }

    function importPlugin($name, $data, $object) {
        $returnData = "";
        if ($name != "") {

            $link = $this->foldersMap->admin_plugins_folder . $name;
            $lng = $this->util->importfiles($link);
            require_once $link . "/index.php";
            
          
        
            
        
            $returnData = $name($this->updateData($data), $lng, $object);
        }

        return $returnData;
    }

    function importPlugindB($name, $data) {
        $returnData = "";
        if ($name != "") {

            
           
            $link = $this->foldersMap->admin_plugins_folder . $name;
            $lng = $this->util->importfiles($link);
            require_once $link . "/index.php";
            $returnData = $name($data, $lng);
        }

        return $returnData;
    }

    function importFullPlugin($name, $data) {


        $returnData = "";
        $link = $this->foldersMap->admin_plugins_folder . $name;
        $lng = $this->util->importfiles($link);



        include_once $link . "/index.php";
        $returnData = $name($data, $lng);
        return $returnData;
    }

    function updateData($data) {
        
    
        $ds = explode(";", $data);

        foreach ($ds as $da) {


            $d = explode("__", $da);

            $dd[$d[0]] = $d[1];
        }

        return $dd;
    }

}

?>
