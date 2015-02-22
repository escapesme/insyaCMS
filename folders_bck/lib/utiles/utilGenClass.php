<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\utiles;

class utilGenClass {

//put your code here

    var $lib;

    public function __construct($lib) {
        $this->lib = $lib;
    }

    function limit_text($text, $limit) {
        $words = explode(" ", $text);

        if (count($words) > $limit) {

            $text = implode(" ", array_splice($words, 0, $limit)) . "...";
        }


        /*
         * 
          $words = explode(" ",$string);
          return implode(" ",array_splice($words,0,$word_limit));
         * 
         */



        return $text;
    }

    function readXmlToarray($file) {
        $xml = simplexml_load_file($file);


        $returnData = array();
        foreach ($xml->children() as $k => $v) {

            $returnData[$k]['tagName'] = $k;

            $returnData[$k]['tagValue'] = (string) $v;

            foreach ($v->attributes() as $attributeskey0 => $attributesvalue1) {
                $returnData[$k][$attributeskey0] = (string) $attributesvalue1;
            }
        }
        return $returnData;
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

    function getLanguageWord($word, $type = "") {
        $link = "";
        if ($type != "") {
            $link = $this->lib->foldersMap->languages_folder . $this->siteSetting['lang'] . "/" . $type . ".xml";
        } else {
            $link = $this->lib->foldersMap->languages_folder . $this->siteSetting['lang'] . "/general.xml";
        }



        if (is_file($link)) {
            $arr = $this->readXmlvalue($link, $word);
        } else {

            $arr = $word;
        }
        if (is_array($arr)) {
            $arr = $word;
        }
        return $arr;
    }

    function updateVar($adata) {
        $arr = explode("->", $adata);
        $data = "";
        if (substr($data, 0, 1) == "@") {
            switch ($arr[0]) {
                case "@GET": $data = $_GET[$arr[1]];
                    break;
                case "@SESSTION":
                    $data = $_SESSION[$arr[1]];
                    break;
                default :
                    $data[$arr[0]] = $arr[1];
                    break;
            }
        } else {

            $data = $adata;
        }
        return $data;
    }

    function exportCVS() {

        include "lib/simple_html_dom.php";
        $table = '<table border="1">
<tr>
<th>Header 1</th>
<th>Header 2</th>
</tr>
<tr>
<td>row 1, cell 1</td>
<td>row 1, cell 2</td>
</tr>
<tr>
<td>row 2, cell 1</td>
<td>row 2, cell 2</td>
</tr>
</table>';




        $html = str_get_html($table);



        header('Content-type: application/ms-excel');
        header('Content-Disposition: attachment; filename=sample.csv');

        $fp = fopen("php://output", "w");

        foreach ($html->find('tr') as $element) {
            $td = array();
            foreach ($element->find('td') as $row) {
                $td [] = $row->plaintext;
            }
            fputcsv($fp, $td);
        }


        fclose($fp);
        exit;
    }

}

?>
