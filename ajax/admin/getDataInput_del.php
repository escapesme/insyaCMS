<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$d = explode(";", $_GET['data']);
$vs = explode(",", $d[1]);
$ks = explode(",", $d[0]);
for ($i = 0; $i < count($ks); $i++) {
    $data[trim($ks[$i])] = trim($vs[$i]);
}

//print_r($data);



/* @var $lib  libs\libs */
global $lib;






/*
 * 
 * Array
  (
  [name] =&gt; cat_id
  [type] =&gt; getdata
  [title] =&gt; Category
  [getData] =&gt; menu_itmes
  [getDataTitle] =&gt; mei_title
  [getDataValue] =&gt; id
  [pclass] =&gt; _50
  [value] =&gt; @%get::cat_id%@
  )

 */
//
if (isset($_GET['id']) && trim($_GET['id']) != "") {

    $mdata = array("delete" => "1");

    echo $lib->db->update_row(trim($data['getData']), $mdata, $_GET['id']);
}

echo $lib->admin->getDataInput($data, "admin/");
