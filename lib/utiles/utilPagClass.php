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

$page_head_tags = "";
$page_des_tags = "";
$page_kay_tags = "";
$page_title_tags = "";
$page_windowstitle_tags = "";

class utilPagClass {

    //put your code here
    var $siteSetting = "";

    public function __construct($foldersMap, $config, $variables, $db) {

        $this->foldersMap = $foldersMap;
        $this->config = $config;
        $this->variables = $variables;
        $this->parent = $_GET['parent'];
        $this->db = $db;
    }

    function headerData($description, $keywords, $header) {

        if ($description != "") {
            $this->add_to_des($description);
        }
        if ($keywords != "") {
            $this->add_to_key($keywords);
        }
        if ($header != "") {
            $this->add_to_head($header);
        }
    }

    function updateTitle($Windowstitle, $title, $type) {
        $this->siteSetting = $this->db->get_row("site_setting", "*");


        if ($type == "title") {
            $this->add_to_Windowstitle($Windowstitle);
        } else if ($type == "title-web") {
            $this->add_to_Windowstitle($Windowstitle . " - " . $this->siteSetting['title']);
        } else {
            $this->add_to_Windowstitle($this->siteSetting['title'] . " - " . $Windowstitle);
        }

        $this->add_to_title($title);
    }

    function chearTages($title = "", $img = "", $video = "", $description = "", $url = "") {
        $this->siteSetting = $this->db->get_row("site_setting", "*");

        $this->add_to_head(' <meta name="twitter:card" content="summary"><meta property="og:type" content="article"/>');
        if ($title != "") {
            $this->add_to_head(' <meta property="og:title" content="' . $title . '"/>');
             $this->add_to_head('<meta name="twitter:title" content="' . $title . '">');
            
            
        }
        if ($description != "") {
            $this->add_to_des($description);

            $this->add_to_head(' <meta property="og:description" content="' . $description . '"/>');
              $this->add_to_head(' <meta name="twitter:description" content="'.$description.'">');
            
            
        }
        if ($url != "") {
            $url = $this->siteSetting['site_link'] . $url;
            $this->add_to_head(' <meta property="og:url" content="' . $url . '"/>');
        }
        if ($img != "") {

            $img = $this->siteSetting['site_link'] . "/uploads/images/" . $img;
            $this->add_to_head('<meta property="og:image" content="' . $img . '" />');
            $this->add_to_head('<meta property="og:image:width" content="300" />');
            $this->add_to_head('<meta property="og:image:height" content="300" />');
              $this->add_to_head('<meta name="twitter:image" content="' . $img . '">');
            
            
            
        }


        if ($video != "") {
            //  $video = str_replace("http://", "", $video);
            /*  $this->add_to_head('<meta property="og:video" content="' . $video . '" />');
              $this->add_to_head('<meta property="og:video:width" content="560" />');
              $this->add_to_head('<meta property="og:video:height" content="340" />');
              $this->add_to_head('<meta property="og:video:type" content="application/x-shockwave-flash" /> '); */
        }
    }

    function add_to_des($tag) {
        global $page_des_tags;

        if (!stristr($page_des_tags, $tag)) {
            $page_des_tags .= $tag . "\n";
        }
    }

    function get_des() {
        global $page_des_tags;
        return $page_des_tags;
    }

    function add_to_key($tag) {
        global $page_kay_tags;

        if (!stristr($page_kay_tags, $tag)) {
            $page_kay_tags .= $tag . "\n";
        }
    }

    function get_key() {
        global $page_kay_tags;
        return $page_kay_tags;
    }

    function add_to_Windowstitle($tag) {
        global $page_windowstitle_tags;

        if (!stristr($page_windowstitle_tags, $tag)) {
            $page_windowstitle_tags .= $tag . "\n";
        }
    }

    function get_Windowstitle() {
        global $page_windowstitle_tags;
        return $page_windowstitle_tags;
    }

    function add_to_title($tag) {
        global $page_title_tags;

        if (!stristr($page_title_tags, $tag)) {
            $page_title_tags .= $tag . "\n";
        }
    }
 function sety_title($tag) {
        global $page_title_tags;
            $page_title_tags = $tag;
        
        
        
 }
    function get_title() {
        global $page_title_tags;
        return $page_title_tags;
    }

    function add_to_head($tag) {
        global $page_head_tags;

        if (!stristr($page_head_tags, $tag)) {
            $page_head_tags .= $tag . "\n";
        }
    }

    function get_head() {
        global $page_head_tags;
        return $page_head_tags;
    }

    function loaction($url) {

        echo ' <script>window.location = \'/' . $url . '/\'</script>';
    }

    function getTo404() {

        $this->loaction("404");
    }

            function getREQUEST_URI() {
$d="";
        $us = explode("&", $_SERVER[REQUEST_URI]);

        foreach ($us as $u) {

            $r = explode("=", $u);
            $d[$r[0]] = $r[1];
        }
    
        return $d;
        
        }

}

?>
