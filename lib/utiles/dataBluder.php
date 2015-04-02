<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of dataBluder
 *
 * @author ismail
 */

namespace libs\utiles;

require_once('queryBluderClass.php');

class dataBluder extends queryBluderClass {

    function plugin_render($vdata) {

        /* @var $lib  \libs\libs */
        global $lib;


        $pdata = urldecode($this->databulderData['plugins_options']);

        $parData = $lib->util->data->updateStringTorray($pdata);

        $parData = $lib->util->data->arrayVarUpdate($parData);
        $pdata = $lib->plugins->importFullPlugin($vdata['pluginTitle'], $parData);

        if ($vdata['returnType'] == "input") {
            $data = "<input type='hidden' value='" . $pdata . "' name='" . $vdata['returnTo'] . "' class='" . $vdata['returnTo'] . "' />";
        } else if ($vdata['returnType'] == "sesstion") {
            $_SESSION[$vdata['returnTo']] = $pdata;
        } else {

            $data = "<div><label>" . $vdata['returnTo'] . "</label>$pdata</div>";
        }



        return "<div class='type ".$vdata['pluginTitle']." plugintype'>" . $data . "</div>";
    }

    function images_render($vdata) {
        global $lib;
        $data = $lib->util->getImageGallery($vdata['imagesCatId'], $pro);
        return "<div class='type videostype'>" . $data . "</div>";
    }

    function Sesstion_data_render($vdata) {
        global $lib;




        if ($vdata['SesstionType'] == "var") {


            $data.="<div><label>" . $vdata['SesstionName'] . "</label>" . $_SESSION[$vdata['SesstionName']] . "</div>";
        } else {

            $data.=$this->arrayToHtml($_SESSION[$vdata['SesstionName']]);
        }








        return "<div class='type DataType'>" . $data . "</div>";
    }

    function videos_render($vdata) {
        global $lib;





        $data = $lib->util->getVideoGallery($vdata['videosCatId'], $pro);


        return "<div class='type imagestype'>" . $data . "</div>";
    }

    function form_render($vdata) {
        global $lib;




        if ($vdata['renderType'] == "results") {
            $datar = $lib->db->get_row('com_form', '', 'ID=' . $vdata['formid']);


            $data.=$this->arrayToHtml($_SESSION[$datar['title']]);
        } else {

            $datar = $lib->db->get_row('com_form', '', 'ID=' . $vdata['formid']);
            $data.=$datar['des'];

            
             $data.="<script>formToSeesstion('".$datar['title']."');</script>";
            
            
            $data.= $lib->forms->getFiledsFormStrign("db", "com_form", $vdata['formid'], "data", "0");
        }

        return "<div class='type formtype'>" . $data . "</div>";
    }

    function html_render($vdata) {
        global $lib;


        $data = $lib->db->get_row('com_html', '', 'ID=' . $vdata['hmlid']);
        return "<div class='type htmltype'>" . $data['my_body'] . "</div>";
    }

    function export($htmlClear, $htmlFull) {



        $returnData = "<div>"
                . "<form method='post' action='/export.php'>"
                . '<div id="exportType" title="" class="exportType" >'
                . '<div class="field-label">'
                . '<label for="main_link">Export Type</label></div>'
                . '<div class="field-input">'
                . '<select style="" action="" name="status" '
                . 'id="exportTypeSelect" class="exportTypeSelect">'
                . '<option value=""></option>'
                . '<option selected="" value="pdf">pdf</option>'
                . '<option value="csv">csv</option></select></div></div>'
                . '<div id="exportType" title="" class="exportType" >'
                . '<div class="field-label">'
                . '<label for="main_link">Text Type</label></div>'
                . '<div class="field-input">'
                . '<select style="" action="" name="htmlstatus" '
                . 'id="exportTypeSelect" class="exportTypeSelect">'
                . '<option value=""></option>'
                . '<option selected="" value="clear">Clear</option>'
                . '<option value="full">Full</option></select></div></div>'
                . '<textarea style="display:none" name="htmlclear">' . $htmlClear . '</textarea>'
                . '<textarea style="display:none" name="htmlfull">' . $htmlFull . '</textarea>'
                . '<input type="submit" value="Export" />'
                . "</form></div>";



        return $returnData;
    }

    function renderQueryHTml($valuesData, $clear = '') {


        //  print_r($valuesData);
        $this->QuerygetData($valuesData, $clear);

        echo "<input value='" . $this->queryData['sql_table'] . "' type='hidden' class='query_tabel' />";
        return "<div class='chartCont'>" . $this->renderQuery($valuesData['queryid'], $valuesData['returnType']) . "</div>";
    }

    function renderDataBluder($dataBluder_id) {
        //   print_r($_SESSION);
        /* @var $lib  libs\libs */
        global $lib;



      
        if (isset($_POST)) {


            $_SESSION = array_merge($_SESSION, $_POST);
        }

        $this->dataID = $dataBluder_id;
        $this->databulderData = $lib->db->get_row('sys_dataBluder', "*", "id='" . $this->dataID . "'");





        $valuesDatas = explode(";", $this->databulderData['data']);
        $returnData = "";


        foreach ($valuesDatas as $d) {


            $valuesData = $lib->util->data->updateStringTorray($d);

            switch ($valuesData['type']) {
                case "query":
                    $h = $this->renderQueryHTml($valuesData);
                    $returnData .=$h;
                    $returnData .= $this->export($this->renderQueryHTml($valuesData, "clear"), $this->renderQueryHTml($valuesData, "full"));
                    break;
                case "html":
                    $returnData .= $this->html_render($valuesData);
                    break;
                case "form":

                    $returnData .= $this->form_render($valuesData);
                    break;
                case "Sesstion_data":
                    $returnData .= $this->Sesstion_data_render($valuesData);
                    break;
                case "images":
                    $returnData .= $this->images_render($valuesData);
                    break;
                case "videos":
                    $returnData .= $this->videos_render($valuesData);
                    break;
                case "plugin":
                    $returnData .= $this->plugin_render($valuesData);
                    break;
            }
        }



        return $returnData;
    }

}

?>
