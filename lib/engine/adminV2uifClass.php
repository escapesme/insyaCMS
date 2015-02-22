<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\engine;

class adminV2uifClass {

    var $xmlfile;
    /* @var $lib  \libs\libs */
    var $lib;
    var $allPages;

    function getHomePageNumbers() {
        $data = "";


        $all = $this->updatequery("all");


        $this->allPages = intval(count($this->thisTabelData) / $this->rowlimt);
        $thisPage = $this->dataOptions['page'];
        $nextPage = $thisPage + 1;
        $prevPage = $thisPage - 1;

        if ($prevPage < 0) {
            $prevPage = 0;
        }

        if ($thisPage > 0) {
            $data .= "<li data-num='0' class='fristPage'>Frist</li>";
            $data .= "<li data-num='" . $prevPage . "' class='pervPage'>perv</li>";
        }


        $data .= "<li class='perv'>PageNumber " . ( $thisPage + 1) . " From  " . ( $this->allPages + 1) . "  </li>";

        if ($this->allPages < $nextPage) {
            $nextPage = $this->allPages;
        } else {

            $data .= "<li data-num='" . $nextPage . "' class='nextPage'>next</li>";
            $data .= "<li data-num='" . $this->allPages . "' class='lastPage'>Last</li>";
        }



        return $data;
    }

    function getHome() {
        $data = "";

        /*  */

        if ($this->dataOptions['type'] == "map") {


        
            $data.='
                

<script type="text/javascript"> $(function() {$(\'#map-canvas\').gmap();});</script>


<div style="width:50%;height:300px; float:right" id="map-canvas"/></div>
    

';
        } else {
            foreach ($this->thisTabelData as $d) {
                $data.=$this->getBlockHtml($d);
            }


            $data .="<div class='footerBar'>" . $this->getHomePageNumbers() . "</div>";
        }


        return $data;
    }

    function getBlockHtml($rowdata) {


        $data = "<div class='mainBlock'>"
                . "<div class='blockHeader'>"
                . "<input class='id edata' type='hidden'value=' " . $rowdata['id'] . "'  name='id' /> "
                . "<input class='order edata' type='hidden'  value='" . $rowdata['order'] . "' name='order' /> "
                . "<span class='order'>" . $rowdata['order'] . "</span>"
                . "</div><ul>";





        foreach ($this->xml_listfields as $l) {



            $d = $this->table_properties[$l];

            $data.="<li> " . $this->getBlockRow($d['name'], $rowdata[$d['name']], $d['type'], $d['title']) . "</li>";
        }


        $data.="</ul></div>";

        return $data;
    }

    function getBlockRow($name, $value, $type, $title) {
        $r = "";
        switch ($type) {
            case "text":
                $r .= "<div><label>$title</label> $value</div>";

                break;
            case "enable":
                $more = "";
                if ($value == "1") {
                    $more = "checked";
                } else {

                    $more = "";
                }
                $r .= "<div><label>$title</label> <input  $more class='edata' name='$name' type='checkbox' /></div>";

                break;
        }
        return $r;
    }

    function getBar() {

        if ($this->dataOptions['type'] == "deletedata") {
            $r = '<li class="edataRemove ui-state-default ui-corner-all" title="remove">'
                    . '<span class="ui-icon ui-icon-close"></span></li>'
                    . '<li class="edataRemoveAll ui-state-default ui-corner-all" title="remove All">'
                    . '<span class="ui-icon ui-icon-circle-close"></span></li>'
                    . '<li class="edataRestore ui-state-default ui-corner-all" title="restore">'
                    . '<span class="ui-icon ui-icon-arrowreturn-1-w"></span></li>'
                    . '<li class="edataRestoreAll ui-state-default ui-corner-all" title="Restore All">'
                    . '<span class="ui-icon ui-icon-arrowrefresh-1-s"></span></li>'

            ;
        } else {
            $r = '<li class=" edataadd  ui-state-default ui-corner-all" title="add">'
                    . '<a href="/print/do/getAdd/app/" class="lightbox-url"><span class="ui-icon ui-icon-plusthick"></span></a>'
                    . '</li>'
                    . '<li class="edataedit ui-state-default ui-corner-all" title="edit"><span class="ui-icon ui-icon-wrench"></span></li>'
                    . '<li class="edatadelete  ui-state-default ui-corner-all" title="delete"><span class="ui-icon ui-icon-trash"></span></li>'
                    . '<li class="edatadisable ui-state-default ui-corner-all" title="disable"><span class="ui-icon ui-icon-pin-w"></span></li>'
                    . '<li class="edataenable ui-state-default ui-corner-all" title="enable"><span class="ui-icon ui-icon-pin-s"></span></li>'
                    . '<li class="edatacopy ui-state-default ui-corner-all" title="copy"><span class="ui-icon ui-icon-clipboard"></span></li>'
                    . '<li class="edatareupdate ui-state-default ui-corner-all" title="refresh"><span class=" ui-icon ui-icon-circle-check"></span></li>'
                    . '<li class="edatarefresh ui-state-default ui-corner-all" title="refresh"><span class="ui-icon ui-icon ui-icon-refresh"></span></li>';
        }

        return $r;
    }

    function getTabBodtData($data) {

        $mydata = "";
        foreach ($data as $k => $v) {

            $mydata.=$k . "__" . $v . ";";
        }

        $r = "<input class='bodyData' type='hidden' value='" . $mydata . "'>"
                . "<input class='page' type='hidden' value='0'>"
                . "<input class='status' type='hidden' value='id'>"
                . "<div class='bar'></div>"
                . "<div class='data'></div>";

        return $r;
    }

    function getmenu() {
        $r = "<ul class='appmenu'>";

        foreach ($this->group as $k => $t) {
            $r .= "<li id='" . $k . "'>" . $t['title'] . "</li>";
        }
        $r .= "</ul>";
        return $r;
    }

    function getHtml() {
        $mTabsHeader = "<ul class='tabsHeahder'>";
        foreach ($this->tabsOptions as $k => $t) {
            $mTabsHeader .= "<li id='" . $k . "'>" . $t['title'] . "</li>";
        }
        $mTabsHeader .= "</ul>";
        foreach ($this->tabsOptions as $k => $t) {
            $mTabsBody .= "<div class='tabsBody " . $k . "'>" . $this->getTabBodtData($t) . "</div>";
        }
        $r = "<div class='allData'>\n";
        $r .= "<div class='menuData'>" . $this->getmenu() . "</div>\n";
        $r .= "<div class='mainData'>\n";
        $r .= "<div class='mainTabs'>\n"
                . "<div class='mainTabsHeader'>$mTabsHeader</div>\n"
                . "<div class='mainTabsBody'>$mTabsBody<div>"
                . "</div>\n";
        $r .= "</div>\n</div>\n";
        return $r;
    }

    function updateproperties($edata = "") {
        $rs = $this->table_properties;
        foreach ($rs as $r) {




            if ($r['type'] == "enable") {
                $rs[$r['name']]['type'] = "checkbox";
                /*
                 * $fild['checked']
                 */

                if ($edata [$rs[$r['name']]['name']] == "1") {

                    $rs[$r['name']]['checked'] = "checked";
                }
            }

            if ($edata != "") {

                $rs[$r['name']]['value'] = $edata [$rs[$r['name']]['name']];
            }
        }

        return $rs;
    }

    function addHtml() {


        $form = array(
            "formstart" => array(
                "name" => "formstart",
                "type" => "form",
                "acton" => "",
                "method" => "post",
                "name" => $this->com . "addForm",
                "class" => $this->com . "addForm  addForm"
            )
        );




        $this->lib->forms->filds = $form;
        $retdate .= $this->lib->forms->_render_form();


        $form2 = array(
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => "Add",
                'class' => 'add button actions-right'
            ),
            "myreset" => array(
                "name" => "myreset",
                "type" => "reset",
                "value" => "reset",
                'class' => 'button red actions-right'
            ),
        );

        $this->lib->forms->filds = $form2;
        $retdate .= $this->lib->forms->_render_form();




        $this->lib->forms->filds = $this->updateproperties();
        $retdate .= $this->lib->forms->_render_form();






        return $retdate;
    }

    function editHtml($id) {
        $edata = $this->lib->db->get_row($this->com, "*", "id=" . $id);

        $form = array(
            "formstart" => array(
                "name" => "formstart",
                "type" => "form",
                "acton" => "",
                "method" => "post",
                "name" => $this->com . "addForm",
                "class" => $this->com . "addForm  addForm"
            ), "id" => array(
                "name" => "id",
                "type" => "hidden",
                "value" => $id,
            )
        );




        $this->lib->forms->filds = $form;
        $retdate .= $this->lib->forms->_render_form();





        $this->lib->forms->filds = $form;
        $retdate .= $this->lib->forms->_render_form();
        $form2 = array(
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => "Edit",
                'class' => 'button edit actions-right'
            ),
            "myreset" => array(
                "name" => "myreset",
                "type" => "reset",
                "value" => "reset",
                'class' => 'button red actions-right'
            ),
        );

        $this->lib->forms->filds = $form2;
        $retdate .= $this->lib->forms->_render_form();




        $this->lib->forms->filds = $this->updateproperties($edata);
        $retdate .= $this->lib->forms->_render_form();






        return $retdate;
    }

}
