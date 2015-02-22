<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\admin;

class adminvars {

    var $listNumber = 10;
    var $where = "1=1";
    var $table_name;
    var $mode="";
    var $list;
    var $mydb;
    var $util;
    var $selectlist;
    var $formes;
    var $config;
    var $editID;
    var $variables;
    var $listOptions;
    var $AddToFormName;
    var $addproreties;
    var $proretiesType;
    var $children;
    var $proreties;
    var $cshow;
    var $addToForm;
    var $group;
    var $options;
    ////////////////////////////////////fields
////////////////////////////////////

    var $cattype;
    var $edit_id;
    var $list_action_add;
    var $list_action_edit;
    var $list_action_delete;
    var $list_extra_actions;
    var $order;
    var $ost;
    var $list_query;
    var $extra_form_html;
    var $extra_after_form;
    var $select;
    var $sub_menu;
    var $upload_to = '../uploads/images/';
    var $table_class;
    var $admin_msg = "";
    var $select_bar;
    var $list_br;
    var $edata;
    var $my_title;
    var $changEditNames = null;
    var $changEditValues = null;
    var $users;
    var $foldersMap;
    var $moreHtml = "";
    var $lib = null;


    function __construct($lib) {
        $this->lib = $lib;
        $this->mydb = $lib->db;
        $this->util = $lib->util;
        $this->formes = $lib->forms;
        $this->config = $lib->config;
        $this->variables = $lib->variables;
        $this->users = $lib->users;
        $this->listNumber = $this->util->siteSetting['admin_list_limit'];
        $this->foldersMap = $lib->foldersMap;
    }

}
