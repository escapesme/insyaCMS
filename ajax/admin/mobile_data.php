<?php

ini_set("display_errors", 0);
/* @var $lib lib/lib */
global $lib;

$type = $_POST['type'];



$valuesData = $lib->util->data->updateStringTorray($_POST['data']);

error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);
// <editor-fold defaultstate="collapsed" desc="comment">


$lib->forms->filds = array(
    "action" => array(
        "type" => "text",
        "class" => "optionData",
        "title" => "action",
        "id" => "action",
        "value" => $valuesData['action']
        ));
$_i_action = $lib->forms->_render_form();
$lib->forms->filds = array(
    "method" => array(
        "type" => "text",
        "class" => "optionData",
        "title" => "method",
        "id" => "method",
        "value" => $valuesData['method']
        ));
$_i_method = $lib->forms->_render_form();



$lib->forms->filds = array(
    "saveTo" => array(
        "type" => "text",
        "class" => "optionData",
        "title" => "saveTo",
        "id" => "saveTo",
        "value" => $valuesData['saveTo']
        ));
$_i_saveTo = $lib->forms->_render_form();



$lib->forms->filds = array(
    "saveType" => array(
        "type" => "select",
        "class" => "optionData",
        "title" => "saveType",
        "id" => "saveType", "select_data" => array("sesstion" => "sesstion"),
        "value" => $valuesData['saveType']
        ));
$_i_saveType = $lib->forms->_render_form();



/*
 * 
 * 
 *         


 */

$lib->forms->filds = array(
    "address" => array(
        "type" => "select",
        "class" => "optionData",
        "title" => "address",
        "id" => "address", "select_data" => array("true" => "true", "false" => "false"),
        "value" => $valuesData['address']
        ));
$_i_address = $lib->forms->_render_form();






$lib->forms->filds = array(
    "clearBtn" => array(
        "type" => "select",
        "class" => "optionData",
        "title" => "clearBtn", "select_data" => array("true" => "true", "false" => "false"),
        "id" => "clearBtn",
        "value" => $valuesData['clearBtn']
        ));
$_i_clearBtn = $lib->forms->_render_form();




$lib->forms->filds = array(
    "disabled" => array(
        "type" => "select",
        "class" => "optionData",
        "title" => "disabled", "select_data" => array("true" => "true", "false" => "false"),
        "id" => "disabled",
        "value" => $valuesData['disabled']
        ));
$_i_disabled = $lib->forms->_render_form();




$lib->forms->filds = array(
    "enhanced" => array(
        "type" => "text",
        "class" => "optionData",
        "title" => "enhanced",
        "id" => "enhanced",
        "value" => $valuesData['enhanced']
        ));
$_i_enhanced = $lib->forms->_render_form();










$lib->forms->filds = array(
    "name" => array(
        "type" => "text",
        "class" => "optionData",
        "title" => "name",
        "id" => "name",
        "value" => $valuesData['name']
        ));

$_i_name = $lib->forms->_render_form();




$lib->forms->filds = array(
    "title" => array(
        "type" => "text",
        "class" => "optionData",
        "title" => "title",
        "id" => "title",
        "value" => $valuesData['title']
        ));

$_i_title = $lib->forms->_render_form();



$lib->forms->filds = array("class" => array(
        "type" => "text",
        "class" => "optionData",
        "id" => "class",
        "title" => "Class",
        "value" => $valuesData['class']
    )
);
$_i_class = $lib->forms->_render_form();


$lib->forms->filds = array(
    "data" => array(
        "type" => "textarea",
        "class" => "optionData",
        "title" => "data",
        "id" => "data",
        "value" => $valuesData['data']
    )
);

$_i_datainput = $lib->forms->_render_form();


$filds = array(
    "dataId" => array(
        "type" => "select",
        "select_type" => "DB",
        "id" => "dataId",
        "select_data" => "sys_databluder",
        "class" => "optionData",
        "select_text" => "title",
        "select_value" => "id",
        "title" => "Data",
        "value" => $valuesData['dataId']
    )
);
$lib->forms->filds = $filds;
$_i_dataID = $lib->forms->_render_form();



$lib->forms->filds = array(
    "value" => array(
        "type" => "text",
        "class" => "optionData",
        "id" => "value",
        "title" => "value",
        "value" => $valuesData['value']
    )
);

$_i_value = $lib->forms->_render_form();

$lib->forms->filds = array(
    "inputtype" => array(
        "type" => "select",
        "id" => "inputtype",
        "class" => "optionData",
        "title" => "  Type",
        "select_data" => array("text" => "text", "number" => "number", "month" => "month", "time" => "time", "week" => "week", "datetime" => "datetime", "tel" => "tel", "email" => "email", "password" => "password"),
        "value" => $valuesData['inputtype']
    ),
);


$_i_input .= $lib->forms->_render_form();


$lib->forms->filds = array(
    "theme" => array(
        "type" => "select",
        "id" => "theme",
        "class" => "optionData",
        "title" => "theme",
        "select_data" => array("a" => "a", "b" => "b", "c" => "c", "d" => "d", "e" => "e"),
        "value" => $valuesData['theme']
    ),
);


$_i_theme .= $lib->forms->_render_form();





$lib->forms->filds = array(
    "transition" => array(
        "type" => "select",
        "id" => "transition",
        "class" => "optionData",
        "title" => "  transition",
        "select_data" => array("none" => "none", "pop" => "pop", "flip" => "flip", "fade" => "fade", "turn" => "turn", "flow" => "flow", "slide" => "slide", "slidefade" => "slidefade", "slideup" => "slideup", "slidedown" => "slidedown"),
        "value" => $valuesData['transition']
    ),
);


$_i_transition .= $lib->forms->_render_form();


/*
 * 
 * 
 *  $this->getAttr($item['transition'], "data-transition") //none,pop,fade,flip,turn,flow,slide,slidefade,slideup,slidedown
 */

$lib->forms->filds = array(
    "href" => array(
        "type" => "textarea",
        "id" => "href",
        "class" => "optionData",
        "title" => "href", "pclass" => "_50",
        "value" => $valuesData['href']
    )
);


$_i_href .= $lib->forms->_render_form();



/*
 * 
 * 
 *  . $this->getAttr($item['position'], "data-position")//right,[left]
  . $this->getAttr($item['display'], " data-display")//overlay,push,[reveal]
  . $this->getAttr($item['position-fixed'], "position-fixed")//true
 */

$lib->forms->filds = array(
    "position" => array(
        "type" => "select",
        "id" => "position",
        "class" => "optionData", "pclass" => "_50",
        "title" => "position",
        "select_data" => array("left" => "left", "right" => "right"),
        "value" => $valuesData['position']
    )
);

$_i_position = $lib->forms->_render_form();

$lib->forms->filds = array(
    "display" => array(
        "type" => "select",
        "id" => "display",
        "class" => "optionData", "pclass" => "_50",
        "select_data" => array("overlay" => "overlay", "push" => "push", "reveal" => "reveal"),
        "title" => "display",
        "value" => $valuesData['display']
    )
);

$_i_display = $lib->forms->_render_form();


$lib->forms->filds = array(
    "position-fixed" => array(
        "type" => "select",
        "id" => "position-fixed",
        "class" => "optionData", "pclass" => "_50",
        "title" => "position-fixed",
        "select_data" => array("true" => "true", "false" => "false"),
        "value" => $valuesData['position-fixed']
    )
);
$_i_position_fixed = $lib->forms->_render_form();



$lib->forms->filds = array(
    "icon" => array(
        "type" => "textarea",
        "id" => "icon",
        "class" => "optionData", "pclass" => "_50",
        "title" => "icon",
        "value" => $valuesData['icon']
    )
);

$_i_icon = $lib->forms->_render_form();


$lib->forms->filds = array(
    "iconPosition" => array(
        "type" => "select",
        "id" => "iconPosition",
        "class" => "optionData ",
        "pclass" => "_50",
        "title" => "icon Position",
        "select_data" => array("left" => "left", "right" => "right", "top" => "top", "bottom" => "bottom"),
        "value" => $valuesData['iconPosition']
    )
);


$_i_iconPosition = $lib->forms->_render_form();


$lib->forms->filds = array(
    "corner" => array(
        "type" => "select",
        "id" => "corner",
        "class" => "optionData", "pclass" => "_50",
        "title" => "corner",
        "select_data" => array("all" => "all"),
        "value" => $valuesData['corner']
    )
);


$_i_corner = $lib->forms->_render_form();


$lib->forms->filds = array(
    "iconOnly" => array(
        "type" => "select",
        "id" => "iconOnly",
        "class" => "optionData", "pclass" => "_50",
        "title" => "icon Only",
        "select_data" => array("true" => "true", "false" => "false"),
        "value" => $valuesData['iconOnly']
    )
);
$_i_iconOnly = $lib->forms->_render_form();


$lib->forms->filds = array(
    "rel" => array(
        "type" => "select",
        "id" => "rel",
        "class" => "optionData", "pclass" => "_50",
        "title" => "rel",
        "select_data" => array("close" => "close", "popup" => "popup", "back" => "back"),
        "value" => $valuesData['rel']
    )
);
$_i_rel = $lib->forms->_render_form();


$lib->forms->filds = array(
    "listType" => array(
        "type" => "select",
        "id" => "listType",
        "class" => "optionData", "pclass" => "_50",
        "title" => "listType",
        "select_data" => array("radio" => "radio", "checkbox" => "checkbox", "buttons" => "buttons"),
        "value" => $valuesData['listType']
    )
);
$_i_listType = $lib->forms->_render_form();



$lib->forms->filds = array(
    "dataType" => array(
        "type" => "select",
        "id" => "dataType",
        "class" => "optionData", "pclass" => "_50",
        "title" => "data Type",
        "select_data" => array("array" => "array", "db" => "db"),
        "value" => $valuesData['dataType']
    )
);
$_i_dataType = $lib->forms->_render_form();


$lib->forms->filds = array(
    "table" => array(
        "type" => "text",
        "id" => "table",
        "class" => "optionData", "pclass" => "_50",
        "title" => "DBtable ",
        "value" => $valuesData['table']
    )
);
$_i_table = $lib->forms->_render_form();



$lib->forms->filds = array(
    "query" => array(
        "type" => "textarea",
        "id" => "query",
        "class" => "optionData", "pclass" => "_50",
        "title" => "SQL query ",
        "value" => $valuesData['query']
    )
);
$_i_query = $lib->forms->_render_form();






$lib->forms->filds = array(
    "fieldValue" => array(
        "type" => "textarea",
        "id" => "fieldValue",
        "class" => "optionData",
        "pclass" => "_50",
        "title" => "field Value",
        "value" => $valuesData['fieldValue']
    )
);
$_i_fieldValue = $lib->forms->_render_form();


$lib->forms->filds = array(
    "fieldText" => array(
        "type" => "textarea",
        "id" => "fieldText",
        "class" => "optionData",
        "pclass" => "_50",
        "title" => "field Text",
        "value" => $valuesData['fieldText']
    )
);
$_i_fieldText = $lib->forms->_render_form();






// </editor-fold>



$data .= $_i_name;

if ($type != "end" && $type != "endform" && $type != "data") {

    $data .= $_i_class . $_i_datainput . $_i_theme;
}
if ($type == "input") {

    $data.=$_i_title . $_i_input . $_i_disabled . $_i_enhanced . $_i_clearBtn;
} else
if (strtolower($type) == "button") {
    $data .= $_i_href . $_i_icon . $_i_iconOnly . $_i_iconPosition . $_i_value . $_i_rel . $_i_corner . $_i_transition;
} else
if ($type == "link") {
    $data .= $_i_href . $_i_rel . $_i_corner . $_i_transition;
} else
if ($type == "data" || $type == "Data") {
    $data .= $dataID;
} else
if ($type == "panel") {
    $data .= $_i_position . $_i_display . $_i_position_fixed;
} else
if ($type == "form") {
    $data .=$_i_action . $_i_method . $_i_saveType . $_i_saveTo
    ;
} else
if ($type == "googlemap") {
    $data .= $_i_address;
} else
if ($type == "listview") {
    $data .= $_i_title . $_i_listType . $_i_dataType . $_i_table . $_i_query . $_i_fieldValue . $_i_fieldText;
} else
if ($type == "toggleBtn") {
    $data .= $_i_title;
} else
if ($type == "line") {
} else
if ($type == "javascript") {
}











echo $data;
?>
