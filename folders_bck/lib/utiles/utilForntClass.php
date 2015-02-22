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
class utilForntClass {

    //put your code here


    public function __construct($foldersMap, $config, $variables, $db) {



        $this->foldersMap = $foldersMap;
        $this->config = $config;
        $this->variables = $variables;
        $this->parent = $_GET['parent'];

        $this->db = $db;
    }/*

    function getIsInSite($id, $all) {
        $return = false;



        $arr = $this->getSite();

        if ($arr == "all" && $all == "1") {
            $return = true;
        } else
        if (is_array($arr)) {
            foreach ($arr as $r) {

                if ($r['id'] == $id) {
                    $return = true;
                }
            }
        }






        return $return;
    }

    function getSite() {
        $site = "";
        if (isset($_GET['site'])) {


            $id = $this->db->get_row("com_cities", "id", "urlcode='" . $_GET['site'] . "'");

            $table = "com_cities_categories";
            $xreftable = "com_cities_xref";
            $more = "";

            $sqlString = "SELECT  
            $table.*
            From    $table 
            INNER JOIN $xreftable ON    
            $table.enabled='1' and 
            $table.delete='0'  and   
                $table.id=$xreftable.cat_id and    $xreftable.item_id=" . $id['id'] . " " . $more;


            $datasql = $this->db->get_data_query($sqlString);


            $site = $datasql;
        } else {
            $site = "all";
        }

        return $site;
    }
*/
}

?>
