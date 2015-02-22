<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of data
 *
 * @author empcl_000
 */

namespace libs\coms;

class getData {

    var $lib;
    var $id;
    var $type;
    var $options;

    public function __construct($lib) {
        $this->lib = $lib;
    }

    function _render() {
        
    }

    function create() {


        $r = "";

        switch ($this->type) {
            case "query":
                $h = $this->renderQueryHTml($valuesData);
                $returnData .=$h;
                $returnData .= $this->export($this->renderQueryHTml($valuesData, "clear"), $this->renderQueryHTml($valuesData, "full"));
                break;
            case "html":
                $returnData .= $this->html_render();
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
            case "menu":
                $returnData .= $this->menu_render($valuesData);
                break;
        }
        return $r;
    }

    function _renderFromData() {

        $lib = $this->lib;
        $this->databulderData = $lib->db->get_row('sys_dataBluder', "*", "id='" . $this->id . "'");
        $valuesDatas = explode(";", $this->databulderData['data']);
        foreach ($valuesDatas as $d) {
            $valuesData = $lib->util->data->updateStringTorray($d);
            $this->type = $valuesData['type'];
            $this->options = $valuesData;
            $r.=$this->create();
        }
        return $r;
    }

// <editor-fold defaultstate="collapsed" desc="data">



    function plugin_render() {

        $lib = $this->lib;



        $pdata = urldecode($this->databulderData['plugins_options']);

        $parData = $lib->util->data->updateStringTorray($pdata);

        $parData = $lib->util->data->arrayVarUpdate($parData);
        $pdata = $lib->plugins->importFullPlugin($this->options['pluginTitle'], $parData);

        if ($this->options['returnType'] == "input") {
            $data = "<input type='hidden' value='" . $pdata . "' name='" . $this->options['returnTo'] . "' class='" . $this->options['returnTo'] . "' />";
        } else if ($this->options['returnType'] == "sesstion") {
            $_SESSION[$this->options['returnTo']] = $pdata;
        } else {

            $data = "<div><label>" . $this->options['returnTo'] . "</label>$pdata</div>";
        }



        return "<div class='type " . $this->options['pluginTitle'] . " plugintype'>" . $data . "</div>";
    }

    function images_render() {
        $lib = $this->lib;
        $data = $lib->util->getImageGallery($this->options['imagesCatId'], $pro);
        return "<div class='type videostype'>" . $data . "</div>";
    }

    function Sesstion_data_render() {
        if ($this->options ['SesstionType'] == "var") {
            $data.="<div><label>" . $this->options ['SesstionName'] . "</label>" . $_SESSION[$this->options ['SesstionName']] . "</div>";
        } else {

            $data.=$this->arrayToHtml($_SESSION[$this->options ['SesstionName']]);
            return "<div class='type DataType'>" . $data . "</div>";
        }
    }

    function videos_render() {
        $lib = $this->lib;
        $data = $lib->util->getVideoGallery($this->options['videosCatId'], $pro);
        return "<div class='type imagestype'>" . $data . "</div>";
    }

    function form_render() {
        $lib = $this->lib;




        if ($this->options['renderType'] == "results") {
            $datar = $lib->db->get_row('com_form', '', 'ID=' . $this->options['formid']);


            $data.=$this->arrayToHtml($_SESSION[$datar['title']]);
        } else {

            $datar = $lib->db->get_row('com_form', '', 'ID=' . $this->options['formid']);
            $data.=$datar['des'];


            $data.="<script>formToSeesstion('" . $datar['title'] . "');</script>";


            $data.= $lib->forms->getFiledsFormStrign("db", "com_form", $this->options['formid'], "data", "0");
        }

        return "<div class='type formtype'>" . $data . "</div>";
    }

    function html_render() {
        $lib = $this->lib;
        $data = $lib->db->get_row('com_html', '', 'ID=' . $this->options['hmlid']);
        return "<div class='type htmltype'>" . $data['my_body'] . "</div>";
    }

    function menu_render() {

        $datasql = $this->lib->db->get_data('menu_itmes', '', 'cat_id=0  and parent_id=' . $this->options['menuId'] . "  `show`='1'  Order by `order` ");
        $data = "<div class='menu menu" . $pro['selecmenu'] . "'><ul>";
        foreach ($datasql as $d) {


            $pPermission = $this->lib->users->getMenuPermission();
            if (
                    $d['permission_all'] == "1" || $this->lib->util->chkInPermission($d['id'], $pPermission) == true
            ) {

                if ($this->lib->util->cities->getIsInSite($d['id'], $d['all_site'], "menu") == true) {







                    if ($d['openType'] == "1") {

                        $moreClass = "lightbox-url";
                    } else {

                        $moreClass = "";
                    }




                    if (trim($d['mei_main']) == "com_link") {

                        $href = $d['com_link'];
                    } else {

                        $href = $lib->util->createURLAL($d['mei_alias']);
                    }


                    if (trim($d['mei_alias']) == "Products") {

                        $href = "#";
                    }


                    $moreact = "";

                    if ($_GET['alias'] == $d['mei_alias']) {
                        $moreact = "li_active ";
                    } else {


                        $moreact = "";
                    };






                    $data .= '<li >
            <a  data-transition="' . $pro['pages_transition'] . '" class=\'' . $moreClass . '  __' . $d['id'] . ' my_menu_itm \' href=\'' . $href . '\'>';


                    if ($pro['viewImage'] == "1") {

                        $data .="<img src='/uploads/images/" . $d['mei_image'] . "'/>";
                    }

                    $data .= $d['mei_title'] . "</a></li>";
                }
            }
        }
        return $data;
    }

// </editor-fold>
}
