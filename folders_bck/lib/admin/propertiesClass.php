<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

class properties {

    //put your code here

    var $mode = '';
    var $type = '';
    var $changEditNames = null;
    var $changEditValues = null;

    function get_html() {
        $this->AddToFormName = str_replace("=", "", $this->listOptions['addtolink']);
        switch ($this->mode) {

            case 'edit':
                return $this->_render_edit();
                break;
            case 'add':
                return $this->_render_add();
                break;
        }
    }

    function _render_add() {


        $this->updateNew();
        return $this->toolbar() . $this->mssages . $this->add_form();
    }

    function _render_edit() {


        $this->updateEdit();
        return $this->toolbar() . $this->mssages . $this->eidt_form();
    }

    function updateEdit() {

        $_POST['modified'] = date("Y-m-d H:i:s");
        if (isset($_POST['status']) && $_POST['status'] == "edit") {
            $testdata = $this->mydb->update_row($this->table_name, $_POST, $this->editID);
            if ($testdata == 1) {
                $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
            }
        }
    }

    function updateNew() {




        $_POST['created'] = date("Y-m-d H:i:s");

        if (isset($_POST['status']) && $_POST['status'] == "add") {
            $testdata = $this->mydb->insert_row($this->table_name, $_POST);
            if ($testdata == 1) {
                $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
            }
        }
    }

    function eidt_form() {



        $edata = $this->mydb->get_data($this->table_name, "*", "id=" . $this->editID);


        $eNames = $this->changEditNames;
        $eValues = $this->changEditValues;
        $eNames = explode(";", $eNames);
        $eValues = explode(";", $eValues);
        for ($i = 0; $i < count($eNames); $i++) {
            if ($eNames[$i] != null && trim($eNames[$i]) != "") {

                $edata[$eNames[$i]] = $eValues[$i];
            }
        }



        $retdate = "";
        $form = array(
            "formstart" => array(
                "name" => "formstart",
                "type" => "form",
                "acton" => "",
                "method" => "post",
                "name" => $this->table_name . "editForm"
                ,
                "class" => $this->table_name . "editForm"
            )
        );

        $this->formes->filds = $form;
        $retdate .= $this->formes->_render_form();
        $dataupdate = $this->table_properties;
        foreach ($this->list as $list) {
            if ($dataupdate[$list]['type'] == "order") {
                $dataupdate[$list]['type'] = 'number';
            } else if ($dataupdate[$list]['type'] == "enable") {
                $dataupdate[$list]['type'] = 'chac';
                $dataupdate[$list]['selectData'] = array("1" => "yes", "0" => "No");
            }
            $dataupdate[$list]['value'] = $edata[0][$list];
        }
        $this->formes->filds = $dataupdate;
        $retdate .= $this->formes->_render_form();

        $myendform = array(
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => "update"
            ),
            "myreset" => array(
                "name" => "myreset",
                "type" => "reset",
                "value" => "reset"
            ),
            "status" => array(
                "name" => "status",
                "type" => "hidden",
                "value" => "edit"
            ),
            "myendform" => array(
                "name" => "myendform",
                "type" => "endForm"
            )
        );


        $this->formes->filds = $myendform;


        $retdate .= $this->formes->_render_form();
        return $retdate;
    }

    function add_form() {


        $retdate = "";

        $form = array(
            "formstart" => array(
                "name" => "formstart",
                "type" => "form",
                "acton" => "",
                "method" => "post",
                "name" => $this->table_name . "addForm"
                ,
                "class" => $this->table_name . "addForm"
            )
        );

        $this->formes->filds = $form;
        $retdate .= $this->formes->_render_form();


        $dataupdate = $this->table_properties;
        foreach ($this->list as $list) {
            if ($dataupdate[$list]['type'] == "order") {
                $dataupdate[$list]['type'] = 'number';
            } else if ($dataupdate[$list]['type'] == "enable") {
                $dataupdate[$list]['type'] = 'select';
                $dataupdate[$list]['selectData'] = array("1" => "yes", "0" => "No");
            }
        }




        $this->formes->filds = $dataupdate;
        $retdate .= $this->formes->_render_form();


        
  
        $myendform = array(
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => "add"
            ),
            "myreset" => array(
                "name" => "myreset",
                "type" => "reset",
                "value" => "reset"
            ),
            "status" => array(
                "name" => "status",
                "type" => "hidden",
                "value" => "add"
            ),
            "myendform" => array(
                "name" => "myendform",
                "type" => "endForm"
            )
        );


        $this->formes->filds = $myendform;


        $retdate .= $this->formes->_render_form();
        return $retdate;
    }

    function creatmsg($type, $txt) {
        if (isset($txt) && $txt != "") {
            $this->mssages = "<div class=\"" . $type . "msg\">" . $txt . "</div>";
        }
    }

}

?>
