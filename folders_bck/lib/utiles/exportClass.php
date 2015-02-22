<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of export
 *
 * @author empcl_000
 */

namespace libs\utiles;

class exportClass {

    //put your code here


    var $lib = "";
    var $gen = "";

    public function __construct($lib, $gen) {

        $this->lib = $lib;
        $this->gen = $gen;
    }

    function csv($table, $fileName) {


        require_once "lib/simple_html_dom.php";
        $html = str_get_html($table);

        header('Content-type: application/ms-excel');
        header('Content-Disposition: attachment; filename=' . $fileName . '.csv');

        $fp = fopen("php://output", "w");



        foreach ($html->find('tr') as $element) {
            $td = array();

            foreach ($element->find('th') as $row) {
                $td [] = $row->plaintext;
            }

            foreach ($element->find('td') as $row) {
                $td [] = $row->plaintext;
            }


            fputcsv($fp, array_values($td), ';', ' ');
        }


        fclose($fp);
        exit;
    }

    function pdf($html, $fileName) {




        if (get_magic_quotes_gpc())
            $html = stripslashes($html);



        //$old_limit = ini_set("memory_limit", "20M");

        $dompdf = new DOMPDF();
        $dompdf->load_html($html);
        //  $dompdf->set_paper($_POST["paper"], $_POST["orientation"]);
        $dompdf->render();

        $dompdf->stream($fileName . ".pdf");

        exit(0);
    }

}

?>
