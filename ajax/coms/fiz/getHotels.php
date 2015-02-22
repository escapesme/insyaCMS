<?php

/* @var $lib  libs\libs */
global $lib;

$hid = $_GET['hotel_id'];








$form = array();
/*
  "new_data" => array(
  "name" => "new_data",
  "type" => $inputType,
  "title" => "data",
  )
 */

$ds = $lib->db->get_data("fiz_hotels", "", "title='" . $hid . "'");


foreach ($ds as $d) {
    $r = $lib->db->get_row("fiz_hotel_rooms", "", "id='" . $d['room_type'] . "'");


    $num = $d['number'];


    if ($num > 0) {

        $form[$r['title']] = array(
            "name" => "room_" . $r['title'],
            "type" => "text",
            "moreAttra" => "data-num='$num'",
            "pclass" => "col-3",
            "title" => $r['title'] . " : " . $num . "  "
        );
    }
}







$lib->forms->filds = $form;
echo "<div class='updatLangData'>" . $lib->forms->_render_form() . "</div>";
