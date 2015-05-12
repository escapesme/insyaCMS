<?php

/* @var $lib lib/lib */
global $lib;

$typ = $_POST['type'];

$valuesData = $lib->util->data->updateStringTorray($_POST['data']);



$filds = array(
    "title" => array(
        "type" => "text",
        "id" => "title",
        "class" => "optionData",
        "title" => "Title",
        "value" => $valuesData['title']
    ),
        "alias" => array(
        "type" => "text",
        "id" => "alias",
        "class" => "optionData",
        "title" => "Alias",
        "value" => $valuesData['alias']
    ),
    "nextText" => array(
        "type" => "text",
        "id" => "nextText",
        "class" => "optionData",
        "title" => "next Text",
        "value" => $valuesData['nextText']
    ), "prevText" => array(
        "type" => "text",
        "id" => "prevText",
        "class" => "optionData",
        "title" => "prev Text",
        "value" => $valuesData['prevText']
    ),
);
$lib->forms->filds = $filds;
$data .= $lib->forms->_render_form();




if ($typ == "Sesstion_data") {
    $filds = array(
        "SesstionName" => array(
            "type" => "text",
            "id" => "SesstionName",
            "class" => "optionData",
            "title" => "Sesstion Name",
            "value" => $valuesData['SesstionName']
        ),
        "not" => array(
            "type" => "text",
            "id" => "not",
            "class" => "not",
            "title" => "not",
            "value" => $valuesData['not']
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
} else if ($typ == "plugin") {
    $filds = array(
        "plugin" => array(
            "type" => "select",
            "select_type" => "DIR",
            "id" => "formid",
            "select_data" => "plugines/",
            "select_text" => "dir",
            "class" => "optionData",
            "title" => "plugin",
            "value" => $valuesData['plugin']
        )
        , "returnType" => array(
            "type" => "select",
            "id" => "returnType",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "return Type",
            "select_data" => array("sesstion" => "sesstion", "input" => "input"),
            "value" => $valuesData['returnType']
        )
        , "returnTo" => array(
            "type" => "text",
            "id" => "returnTo",
            "class" => "optionData",
            "title" => "return To",
            "value" => $valuesData['returnTo']
        )
        ,
        "parameters" => array(
            "type" => "textarea",
            "id" => "parameters",
            "class" => "optionData",
            "title" => "parameters",
            "value" => $valuesData['parameters']
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
} else if ($typ == "data") {
    
    
     $filds = array(
        "data1" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => "data1",
            "select_data" => "sys_dataBluder",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "Data",
            "value" => $valuesData['data1']
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
    
    
} else {
    $filds = array(
        "hmlid" => array(
            "type" => "select", "select_type" => "DB",
            "id" => "hmlid",
            "select_data" => "com_html",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "html Code",
            "value" => $valuesData['hmlid']
        )
            ,
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
}






$filds = array(
    "tmorecss" => array(
        "type" => "textarea",
        "id" => "morecss",
        "class" => "optionData",
        "title" => "More CSS",
        "value" => $valuesData['morecss']
    )
);
$lib->forms->filds = $filds;
$data .= $lib->forms->_render_form();
echo $data;
?>
