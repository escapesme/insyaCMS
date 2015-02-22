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
        
        
    }

    function siteSetting() {

       
        
      

        $this->Setting = $this->db->get_row("site_setting", "*");
     
    
        
        
        if (isset($_GET['lang'])){
            
            $this->Setting['lang']=$_GET['lang'];
            
        }
    }

    function allLangs() {


        return $this->lib->db->get_data("com_language", "*");
    }

}
