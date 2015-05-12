<?php

/* @var $lib  libs\libs */
global $lib;


ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);

$dataTages = $lib->db->get_data("sys_tags_xref", "*", "obj_id='" . $_GET['obj_id'] . "' and `obj_alias`='" . $_GET['obj_alias'] . "'");


echo $_GET['obj_id'] . $_GET['obj_alias'];


echo ">>>obj_id='" . $_GET['obj_id'] . "' and `obj_alias`='" . $_GET['obj_alias'] . "'";


$data = '<div class=\'tags\'>';
foreach ($dataTages as $tag) {
    $d = $lib->db->get_row('sys_tags', "*", "id=" . $tag['tag_id']);
    $data .= '<li class=\'tag_item\'  style="color:' . $d['color'] . '"  data-id="' . $d['id'] . '" id="' . $d['id'] . '" ><i  style="color:' . $d['color'] . '" class="fa fa-tag"></i>' . $d['title'] . '</a></li>';
}
$data .= '</div>';

echo $data;
