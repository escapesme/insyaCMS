<?php

/* @var $lib  libs\libs */
global $lib;






if ($_GET['status'] == "add") {

    $out = $lib->language->add($_POST['lang'], $_POST['type'], $_POST['field'], $_POST['id'], $_POST['old_data'], $_POST['new_data']);
} else {





    $inputType = $_GET['inputtype'];

    if ($inputType == "select" || $inputType == "list" || $inputType == "editor" || $inputType == "pic" || $inputType == "image") {

        $inputType = "textarea";
    }





    $form = array(
        "lang" => array(
            "name" => "lang",
            "type" => "hidden",
            "title" => "language",
            "value" => $_GET['lang']
        )
        , "type" => array(
            "name" => "type",
            "type" => "hidden",
            "value" => str_replace("[]", "", $_GET['type']),
        ), "field" => array(
            "name" => "field",
            "type" => "hidden",
            "value" => str_replace("[]", "", $_GET['field'])
        ), "id" => array(
            "name" => "id",
            "type" => "hidden",
            "value" => $_GET['id'],
        )
        , "old_data" => array(
            "name" => "old_data",
            "type" => "hidden",
            "value" => $_GET['olddata']
        )
        , "new_data" => array(
            "name" => "new_data",
            "type" => $inputType,
            "title" => "data",
//            /getText($type, $field, $id, $old, $lang = "") {
            "value" => $lib->language->getText($_GET['type'], $_GET['field'], $_GET['id'], "", $_GET['lang'])
        ), "addLang" => array(
            "type" => "button",
            "name" => "updateLangBT",
            "value" => "Update",
        )
    );
    $lib->forms->filds = $form;
    $out = "<div class='updatLangData'>" . $lib->forms->_render_form() . "</div>";
}


echo $out;
