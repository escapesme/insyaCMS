<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\utiles;

class utileCitiesClass {
/*
    public function __construct($foldersMap, $config, $variables, $db) {
        $this->foldersMap = $foldersMap;
        $this->config = $config;
        $this->variables = $variables;
        $this->parent = $_GET['parent'];
        $this->db = $db;
    }
    
    
/*
    function getIsInSite($id, $all, $type) {
        $return = false;
        $arr = $this->getSite();





        if ($all == "1") {
            $return = true;
        }
        $xreafTabel = "";
        if ($type == "menu") {
            $xreafTabel = "menu_itmes_site_xref";
        } else {
            $xreafTabel = "com_modules_site_xref";
        }



     


        if (is_array($arr)) {
            foreach ($arr as $r) {
                $datasql = $this->db->get_data($xreafTabel, "*", "item_id='" . $id . "'");

           



                foreach ($datasql as $d) {
                    
                       
                    if ($r['id'] == $d['cat_id']) {
                          
                        $return = true;
                    }
                }
            }
        }

      
        return $return;
    }*/

      /* function urlConvert($url) {

     $sdata = $this->db->get_row("com_cities_xref", "item_id", "cat_id='" . $url . "'");


        $datasql = $this->db->get_row("com_cities_categories", "*", "id='" . $sdata['item_id'] . "'");
        return $datasql['urlcode'];
    }
    
 

    function getCurrency() {
        $datasql = $this->getSite();




        if (is_array($datasql)) {
            $rdata = $datasql[0]['currency_symbol'];
        } else {
            $rdata = $datasql;
        }

        return $rdata;
    }

    function getproductsPrice($pro_id) {

        $pric = "";
        $datasql = $this->getSite();


        $site_id = $datasql[0]['id'];
        $sdata = $this->db->get_row("com_products_price", "*", "pro_id='" . $pro_id . "'and site='" . $site_id . "'");

        return $sdata['price'];
    }
    
    
    

    function getData($table) {

        $datasql = $this->getSite();
        return $this->db->get_row($table, "*", "site='" . $datasql[0]['id'] . "'");
    }

    function getCurrencyCode() {
        $datasql = $this->getSite();
        return $datasql[0]['currency_code'];
    }

    function getSitId() {
        $datasql = $this->getSite();
        $rdata = "";
        if (is_array($datasql)) {
            $rdata = $datasql[0]['id'];
        } else {
            $rdata = $datasql;
        }
        return $rdata;
    }
/*
    function getSiteGet($id) {
        $site = "";
        if (isset($_GET['site'])) {


            $datasql = $this->db->get_data("com_cities_categories", "*", "urlcode='" . $_GET['site'] . "'");
            $site = $datasql[0][$id];
        }
        return $site;
    }

    */
    
    /*
    
     function getSiteGetV($id, $url) {


        $datasql = $this->getSiteV($url);


        return $datasql[0][$id];
    }*/

    /*function getSite() {
        $site = "";
        if (!isset($_GET['site'])) {

            $_GET['site'] = "global";
        }


        return $this->getSiteV($_GET['site']);
    }

    function getproductsVPrice($pro_id) {

        $pric = "";
        $datasql = $this->getSite();


        $site_id = $datasql[0]['id'];
        $sdata = $this->db->get_row("com_products_price", "*", "pro_id='" . $pro_id . "'and site='" . $site_id . "'");

        return $sdata['valueprice'];
    }
/*
    function getSiteV($s) {
        return $this->db->get_data("com_cities_categories", "*", "urlcode='" . $s . "'");
    }
*/
    /*
      function getSite() {
      $site = "";
      if (isset($_GET['site'])) {
      $datasql = $this->db->get_data("com_cities_categories", "*", "urlcode='" . $_GET['site'] . "'");
      $site = $datasql;
      } else {
      $site = "all";
      }

      return $site;
      } */
}

?>
