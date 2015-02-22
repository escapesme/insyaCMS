<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\admin;

require_once('adminvars.php');

class adminactions extends adminvars {

    public function __construct($lib) {
        parent::__construct($lib);
    }

    function mackupdate() {
        $this->mssages = "";




        $value = explode(",", $_POST['updatevalue']);
        $ids = explode(",", $_POST['updateids']);



        if (isset($_POST['updatetable']) && isset($_POST['updatevalue']) && $_POST['updatevalue'] != "" && $_POST['updatetable'] != "do_delete" && $_POST['updatetable'] != "m_disable" && $_POST['updatetable'] != "m_enable" && $_POST['updatetable'] != "copy"
        ) {

            $dat = 0;
            for ($i = 0; $i < count($ids); $i++) {


                if (isset($ids[$i]) && $ids[$i] != "") {

                    $fields = explode(",", $_POST['updatetable']);

                    foreach ($fields as $f) {

                        if (isset($f) && $f != "") {
                            $d = array($f => $value[$dat]);


                            $this->mydb->update_row($this->table_name, $d, $ids[$i]);
                            $dat++;
                        }
                    }
                }
            }
            $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
        } else if (isset($_POST['updatetable']) && $_POST['updatetable'] == "m_disable") {

            for ($i = 0; $i < count($ids); $i++) {
                if (isset($ids[$i]) && $ids[$i] != "") {

                    $d = array("enabled" => "0");
                    $this->mydb->update_row($this->table_name, $d, $ids[$i]);
                }
            }

            $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
        } else if (isset($_POST['updatetable']) && $_POST['updatetable'] == "m_enable") {



            for ($i = 0; $i < count($ids); $i++) {
                if (isset($ids[$i]) && $ids[$i] != "") {
                    $d = array("enabled" => "1");


                    $this->mydb->update_row($this->table_name, $d, $ids[$i]);
                }
            }


            $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
        } else if (isset($_POST['updatetable']) && $_POST['updatetable'] == "do_delete") {




            $this->mackDelete($ids);
        } else if (isset($_POST['updatetable']) && $_POST['updatetable'] == "copy") {


            $this->mackCopy($ids);
        } else if (isset($_POST['updatetable']) && $_POST['updatetable'] == "remove") {


            $this->mackRemove($ids);
        } else if (isset($_POST['updatetable']) && $_POST['updatetable'] == "restore") {


            $this->Restore($ids);
        } else if (isset($_POST['updatetable']) && $_POST['updatetable'] == "removeall") {


            $this->allRemove($ids);
        } else if (isset($_POST['updatetable']) && $_POST['updatetable'] == "restoreall") {


            $this->allRestore($ids);
        }
    }

    function mackhistory($id) {

        $t = $this->mydb->get_row($this->table_name, "*", "id='" . $id . "'");
        $t['created'] = date("Y-m-d H:i:s");

        $t['history'] = $id;
        $t['id'] = "NULL";
        $t['delete'] = "2";

        $this->mydb->insert_row($this->table_name, $t);
    }

    function mackDelete($ids) {

        for ($i = 0; $i < count($ids); $i++) {
            if (isset($ids[$i]) && $ids[$i] != "") {
                //   $this->mydb->delete_row($this->table_name, $ids[$i]);

                $deldata = array("delete" => "1");

                $this->mydb->update_row($this->table_name, $deldata, $ids[$i]);



                if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] = "yes")
                    $this->mydb->update_row($this->table_name, $deldata, "", "cat_id=" . $ids[$i]);
            }
        }

        $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
    }

    function mackRestore($ids) {

        for ($i = 0; $i < count($ids); $i++) {
            if (isset($ids[$i]) && $ids[$i] != "") {
                //   $this->mydb->delete_row($this->table_name, $ids[$i]);

                $deldata = array("delete" => "0");

                $this->mydb->update_row($this->table_name, $deldata, $ids[$i]);

                if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] = "yes")
                    $this->mydb->update_row($this->table_name, $deldata, "", "cat_id=" . $ids[$i]);
            }
        }


        $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
    }

    function Restore($ids) {



        for ($i = 0; $i < count($ids); $i++) {
            if (isset($ids[$i]) && $ids[$i] != "") {


                $deldata = array("delete" => "0");

                $this->mydb->update_row($this->table_name, $deldata, $ids[$i]);



                if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] = "yes")
                    $this->mydb->update_row($this->table_name, $deldata, "", "cat_id=" . $ids[$i]);
            }
        }



        $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
    }

    function allRestore($ids) {

        $deldata = array("delete" => "0");
        $this->mydb->update_data($this->table_name, $deldata, "1=1");

        $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
    }

    function allRemove($ids) {
        $this->mydb->delete_data($this->table_name, "`delete`='1'");
        $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
    }

    function mackRemove($ids) {

        for ($i = 0; $i < count($ids); $i++) {
            if (isset($ids[$i]) && $ids[$i] != "") {
                $this->mydb->delete_row($this->table_name, $ids[$i]);
            }
        }

        $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
    }

    function mackCopy($ids) {

        foreach ($ids as $id) {


            if ($id != "") {



                $mcopydata = $this->mydb->get_row($this->table_name, "", "id=" . $id);



                unset($mcopydata['id']);


                $this->mydb->insert_row($this->table_name, $mcopydata);
            }
        }
    }

}
