<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
namespace libs\utiles;
class utillibsClass {

//put your code here

    var $foldersMap = "";
    var $config = "";
    var $variables = "";
    var $parent = "";
    var $siteSetting = "";
    var $plugins = "";

    public function __construct($foldersMap, $config, $variables, $db) {
        $this->foldersMap = $foldersMap;
        $this->config = $config;
        $this->db = $db;
        $this->variables = $variables;
        $this->parent = $_GET['parent'];
    }

}
?>
