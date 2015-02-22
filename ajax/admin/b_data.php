<?php
/* @var $lib  libs\libs */
global $lib;






$typ = $_POST['type'];

$valuesData = $lib->util->data->updateStringTorray($_POST['data']);

//$pluginsData = $lib->util->data->updateStringTorray( urldecode($_GET['pluginsData']);
//echo $pluginsData;


function updateArrayAddValue($array) {
    /* @var $lib  libs\libs */

    $returnData = array();
    foreach ($array as $k => $v) {
        $returnData[$v] = $v;
    }

    return $returnData;
}

if ($typ == "Sesstion_data") {
    $filds = array(
        "SesstionName" => array(
            "type" => "text",
            "id" => "SesstionName",
            "class" => "optionData",
            "title" => "Sesstion Name",
            "value" => $valuesData['SesstionName']
        ),
        "SesstionType" => array(
            "type" => "select",
            "id" => "SesstionType",
            "class" => "optionData",
            "title" => " Sesstion Type",
            "select_data" => array("array" => "array", "var" => "var"),
            "value" => $valuesData['SesstionType']
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
} else if ($typ == "query") {


    $qid = "";
    if (isset($_POST['queryid'])) {


        $qid = $_POST['queryid'];
    } else {
        $qid = $valuesData['queryid'];
    }


    if ($qid != "") {

        $qData = $lib->db->get_row("sys_query", "*", "id=" . $qid);

        if ($qData['sql_cdata'] == "*") {
            $tableFields = updateArrayAddValue($lib->util->data->getFieldsNames($qData['sql_table']));
        } else {

            $ds1 = explode(";", $qData['sql_cdata']);

            foreach ($ds1 as $d1) {

                $ds2 = explode("__", $d1);
                $tableFields[$ds2[1]] = $ds2[2];
            }
        };
    }






    $filds = array(
        "queryid" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => "queryid",
            "select_data" => "sys_query",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "Query",
            "value" => $qid
        )
        , "returnType" => array(
            "type" => "select",
            "id" => "returnType",
            "class" => "optionData",
            "title" => " Type",
            "select_data" => array("list" => "list", "tabel" => "tabel", "chart" => "chart"),
            "value" => $valuesData['returnType']
        )
        , "chartType" => array(
            "type" => "select",
            "id" => "chartType",
            "class" => "optionData",
            "title" => "chartType",
            "select_data" => array("BarChart" => "BarChart", "ColumnChart" => "ColumnChart", "PieChart" => "PieChart", "LineChart" => "LineChart", "tabel" => "tabel", "Gauge" => "Gauge"),
            "value" => $valuesData['chartType']
        )
        , "total" => array(
            "type" => "list",
            "id" => "total",
            "class" => "optionData",
            "title" => "Total",
            "select_data" => $tableFields,
            "value" => $valuesData['total']
        ), "editable" => array(
            "type" => "list",
            "id" => "editable",
            "class" => "optionData ",
            "title" => "Editable", "pclass" => " _50",
            "select_data" => $tableFields,
            "value" => $valuesData['editable']
        ), "div" => array(
            "type" => "div",
            "class" => "editdata", "style" => "width:40%;float:right;min-height:80px;margin-top: 25px;"
        ), "divdata" => array(
            "type" => "div",
            "class" => "data"
    ));


    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();



    $des3 = explode(",", $valuesData['editDVlaues']);
    echo $valuesData['editDVlaues'];

    //  print_r($des3);

    foreach ($des3 as $d3) {

        //echo $d;

        $de3 = explode(">", $d3);


        if ($de3[0] != trim("")) {




            $data .= "<div><label>" . $de3[0] . " as Type</label>"
                    . "<select id='" . $de3[0] . "' class='" . $de2[0] . "__asValue editDVlaues'  >"
                    . "" . $lib->util->updateSelectOptions(array("text" => "Text", "comboBox" => "comboBox"), $de3[1]) . "
</select></div>";
        }
    }






    $filds = array("enddiveditdata" => array(
            "type" => "endDiv"
        )
        , "endDiv" => array(
            "type" => "endDiv"
        ), "editDVlaues" => array(
            "type" => "hidden",
            "id" => "editDVlaues",
            "class" => "optionData _50",
            "value" => $valuesData['editDVlaues']
        )
        ,
        "line" => array(
            "type" => "line"
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();





    $filds = array("filter" => array(
            "type" => "list",
            "id" => "filter",
            "class" => "optionData",
            "pclass" => " _50",
            "title" => "Filter",
            "select_data" => $tableFields,
            "value" => $valuesData['filter']
        )
        , "div" => array(
            "type" => "div",
            "class" => "filterdata"
            , "style" => "width:40%;float:right;"
        ), "divdata" => array(
            "type" => "div",
            "class" => "data"
        )
    );


    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();

    $ds = explode(",", $valuesData['filterDVlaues']);

    foreach ($ds as $d) {

        $d2 = explode(">", $d);
        if ($d2[0] != trim("")) {



            $data .= "<div>"
                    . "<label>" . $d2[0] . " as Value</label>"
                    . "<input id='" . $d2[0] . "' class='" . $d2[0] . "__asValue filterDVlaues' value='" . $d2[1] . "'  /></div>";
        }
    }


    $filds = array(
        "enddivdata" => array(
            "type" => "endDiv"
        ), "enddivdata2" => array(
            "type" => "endDiv2"
        ), "enddivdata3" => array(
            "type" => "endDiv2"
        )
        , "endDiv" => array(
            "type" => "endDiv"
        ), "filterDVlaues" => array(
            "type" => "hidden",
            "id" => "filterDVlaues",
            "class" => "optionData _50",
            "value" => $valuesData['filterDVlaues']
        ), "line" => array(
            "type" => "line"
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form() . "</div></div>";






    $filds = array(
        "addlink" => array(
            "type" => "list",
            "id" => "addlink",
            "class" => "optionData",
            "pclass" => " _50",
            "title" => "add link",
            "select_data" => $tableFields,
            "value" => $valuesData['addlink'],
        )
        , "div" => array(
            "type" => "div",
            "class" => "addlinkdata", "style" => "width:40%;float:right;"
        ), "divdata" => array(
            "type" => "div",
            "class" => "data"
        )
    );


    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();

    $ds = explode(",", $valuesData['addlinkDVlaues']);

    foreach ($ds as $d) {

        $d2 = explode(">", $d);
        if ($d2[0] != trim("")) {



            $data .= "<div><div><label>" . $d2[0] . " as Link</label>"
                    . "<textarea  title =' Hidden Id Format [@%hidden_com_products@id%@] , Other  Fields [@%ID%@] ,other  variables [@%get::id%@,@%post::id%@] ' "
                    . " id='" . $d2[0] . "' class='" . $d2[0] . "__asValue addlinkDVlaues'  >" . $d2[1] . "</textarea></div>";



            $data .= "<div><label>" . $de2[0] . " as link Type</label>"
                    . "<select id='" . $d2[0] . "' class='" . $d2[0] . "__asValue addlinkTypeDVlaues'  >"
                    . "" . $lib->util->updateSelectOptions(array("page" => "Page", "lightbox" => "Light Box", "tooltip" => "Tooltip"), $d2[2]) . "
</select></div></div>
";
        }
    }


    $filds = array("enddivdata" => array(
            "type" => "endDiv"
        )
        , "endDiv" => array(
            "type" => "endDiv"
        ), "filterDVlaues" => array(
            "type" => "hidden",
            "id" => "addlinkDVlaues",
            "class" => "optionData _50",
            "value" => $valuesData['addlinkDVlaues']
        ), "line" => array(
            "type" => "line"
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();






















    $filds = array("pages" => array(
            "type" => "text",
            "defaultvalue" => "0",
            "id" => "pages",
            "title" => "Page RowNumbers",
            "class" => "optionData _50",
            "value" => $valuesData['pages']
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
} else if ($typ == "plugin") {


    $filds = array(
        "plugin" => array(
            "type" => "select",
            "select_type" => "DIR",
            "id" => "pluginTitle",
            "select_data" => "plugines/",
            "select_text" => "dir",
            "class" => "optionData pluginTitle",
            "title" => "plugin",
            "value" => $valuesData['pluginTitle']
        )
        , "returnType" => array(
            "type" => "select",
            "id" => "returnType",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "return Type",
            "select_data" => array("sesstion" => "sesstion", "input" => "input", "label" => "label"),
            "value" => $valuesData['returnType']
        )
        , "returnTo" => array(
            "type" => "text",
            "id" => "returnTo",
            "class" => "optionData",
            "title" => "return To",
            "value" => $valuesData['returnTo']
        ), "line" => array(
            "type" => "line",
        )
        , "PlguinOptions" => array(
            "type" => "div",
            "class" => "PlguinOptions"
        ), "divdata" => array(
            "type" => "div",
            "class" => "data"
        ), "endDiv" => array(
            "type" => "endDiv"
        ), "endDiv5" => array(
            "type" => "endDiv"
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
} else if ($typ == "form") {
    $filds = array(
        "formid" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => "formid",
            "select_data" => "com_form",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "Form",
            "value" => $valuesData['formid']
        ), "renderType" => array(
            "type" => "select",
            "id" => "renderType",
            "select_data" => array("form" => "form", "results" => "results"),
            "class" => "optionData",
            "title" => "render Type",
            "value" => $valuesData['renderType']
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
} else if ($typ == "mobile") {

    $filds = array(
        "mobileid" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => "mobileid",
            "select_data" => "sys_mobile_application",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "Mobile ID",
            "value" => $valuesData['mobileid']
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
} else if ($typ == "videos") {



    $filds = array(
        "videosCatId" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => "videosCatId",
            "select_data" => "com_images_gallery_categories",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "videos gallery categories",
            "value" => $valuesData['videosCatId']
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
} else if ($typ == "images") {


    $filds = array(
        "imagesCatId" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => "imagesCatId",
            "select_data" => "com_images_gallery_categories",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "images gallery categories",
            "value" => $valuesData['imagesCatId']
        )
    );
    $lib->forms->filds = $filds;
    $data .= $lib->forms->_render_form();
} else if ($typ == "menu") {


    $filds = array(
        "menuId" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => "menuId",
            "select_data" => "com_menus",
            "class" => "optionData",
            "select_text" => "men_title",
            "select_value" => "id",
            "title" => "Menu Category",
            "value" => $valuesData['menuId']
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
