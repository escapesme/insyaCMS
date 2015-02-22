<?php

/* @var $lib libs\libs */
global $lib;

$typ = $_GET['type'];
$Valuesdata = $lib->util->data->updateStringTorray($_GET['data']);
$id = $_GET['id'];
$morecss = $_GET['morecss'];
$reqValue = "";

if ($Valuesdata['required'] == "required") {
    $reqValue = "checked";
} else {

    $reqValue = "1";
}
if ($Valuesdata['checked'] == "1") {
    $chekValue = "checked";
} else {

    $chekValue = "1";
}

$addmore = "";

if ($Valuesdata['required'] == "required") {
    $addmore = "checked";
} else {

    $addmore = "1";
}




//Class



$prfx = "";



if ($typ == "label") {

    $filds = array(
        "name" => array(
            "type" => "text",
            "id" => $prfx . "name",
            "class" => "optionData name",
            "title" => "For",
            "comment" => "The name and id attributes will bear the value entered. Cannot have spaces.",
            "pclass" => "_50",
            "w" => "_50",
            "value" => $Valuesdata[$prfx . 'name']
        )
    );
    
    
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
}

if ($typ != "endDiv" && $typ != "endForm" && $typ != "line" && $typ != "label") {
    $filds = array(
        "name" => array(
            "type" => "text",
            "id" => $prfx . "name",
            "class" => "optionData name",
            "title" => "Name",
            "comment" => "The name and id attributes will bear the value entered. Cannot have spaces.",
            "pclass" => "_50",
            "w" => "_50",
            "value" => $Valuesdata[$prfx . 'name']
        )
    );
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
}


if ($typ != "endDiv" && $typ != "endForm" && $typ != "line") {






    $filds = array(
        "class" => array(
            "type" => "text",
            "id" => $prfx . "class",
            "class" => "optionData name",
            "title" => " class",
            "pclass" => "_50",
            "value" => $Valuesdata[$prfx . 'class'],
            "comment" => " The class attribute will bear this value."
        )
    );

    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();






    if ($typ != "div") {

        if ($typ != "hidden" &&$typ != "form") {
            $filds = array(
                "title" => array(
                    "type" => "text",
                    "id" => $prfx . "title",
                    "pclass" => "_50",
                    "class" => "optionData name",
                    "title" => "Title",
                    "value" => $Valuesdata[$prfx . 'title']
                    , "comment" => "This is the title deplayed to the user"
                )
            );
            $lib->forms->filds = $filds;
            $out_data .= $lib->forms->_render_form();
        }
        
        
        

        if (!$Valuesdata['widthmode']) {

            $Valuesdata['widthmode'] = "_100";
        }
        if ($typ != "form") {
            $filds = array(
                /*
                  , */ "widthmode" => array(
                    "type" => "select",
                    "id" => "widthmode",
                    "class" => "optionData widthmode",
                    "title" => "width mode",
                    "pclass" => "_50",
                    "select_data" => array("_100" => "1", "_50" => "1/2", "_30" => "1/3", "_25" => "1/4"),
                    "value" => $Valuesdata['widthmode']
                )
            );
        }
        $lib->forms->filds = $filds;
        $out_data .= $lib->forms->_render_form();

        if ($typ != "label" && $typ != "form" && $typ != "hidden" && $typ != "button" && $typ != "submit" && $typ != "reset" && $typ != "html") {
            $filds = array(
                "required" => array(
                    "type" => "checkbox",
                    "id" => $prfx . "required",
                     "name" => $prfx . "required",
                    "class" => "optionData name",
                    "title" => " required",
                    "pclass" => "_50",
                    "value" => "required",
                    $reqValue => $reqValue
                )
            );
            $lib->forms->filds = $filds;
            $out_data .= $lib->forms->_render_form();
        }
    } else {

        $filds = array(
            "moreactions" => array(
                "type" => "select",
                "id" => "moreactions",
                "class" => "optionData moreactions",
                "title" => " Actions",
                "pclass" => "_50",
                "select_data" => array("addmore" => "addmore"),
                "value" => $Valuesdata['moreactions']
                , "comment" => "Choose Actions if there will be a javascript event that needs to be executed for the div. For example 'Add More' displays a button that creates a copy of all the elements inside the div"
            )
        );

        $lib->forms->filds = $filds;
        $out_data .= $lib->forms->_render_form();
    }
}






if ($typ == "date") {
    $filds = array(
        "styleMode" => array(
            "type" => "select",
            "id" => "styleMode",
            "class" => "optionData styleMode",
            "title" => "style mode",
            "pclass" => "_50",
            "select_data" => array("default" => "default", "inline" => "inline", "icon" => "icon", "buttonbar" => " button bar", "multiplemonths" => "multiple months", "showweek" => "show week", "monthyear" => "month/year"),
            "value" => $Valuesdata['styleMode']
            , "comment" => "Choose from different types of display options of the date picker"
        ), "dateToinput" => array(
            "type" => "text",
            "id" => "dateToinput",
            "class" => "optionData dateToinput",
            "pclass" => "_50",
            "title" => "date To input",
            "value" => $Valuesdata['dateToinput']
        ), "minDate" => array(
            "type" => "date",
            "id" => "minDate",
            "class" => "optionData minDate",
            "pclass" => "_50",
            "title" => "minDate",
            "comment" => "-1m -1w",
            "value" => $Valuesdata['minDate']
        ), "maxDate" => array(
            "type" => "date",
            "id" => "maxDate",
            "comment" => "+1m +1w",
            "class" => "optionData maxDate",
            "pclass" => "_50",
            "title" => "maxDate",
            "value" => $Valuesdata['maxDate']
        ),
    );




    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
} else if ($typ == "select" || $typ == "list") {

    $filds = array(
        "line" => array(
            "type" => "line",
            "id" => $prfx . "line",
            "class" => "line ",
            "title" => "save Type",
            "comment" => ""),
        "select_type" => array(
            "type" => "select",
            "id" => $prfx . "select_type",
            "class" => "optionData ",
            "pclass" => "_50",
            "title" => "select Type",
            "select_data" => array("DB" => "DB", "DIR" => "DIR", "XML" => "XML", "data" => "data", "months" => "months", "days" => "days", "countries" => "countries", "countries2CO" => "countries2CO", "usstates" => "usstates", $Valuesdata['select_type'] => $Valuesdata['select_type']),
            "value" => $Valuesdata[$prfx . 'select_type'],
            "comment" => "DB,DIR,XML,null is array"
        ),
        "select_data" => array(
            "type" => "text",
            "id" => $prfx . "select_data",
            "class" => "optionData",
            "pclass" => "_50",
            "title" => "Select Data",
            "value" => $Valuesdata[$prfx . 'select_data']
            , "comment" => "tabelName,dirName,xmlfileName"
        ), "select_text" => array(
            "type" => "textarea",
            "id" => $prfx . "select_text", "pclass" => "_50",
            "class" => "optionData",
            "title" => "text",
            "value" => $Valuesdata[$prfx . 'select_text'],
            "comment" => "fieldname,filestypes,xmltag, texts (,)"
        ),
        "select_value" => array(
            "type" => "textarea",
            "id" => $prfx . "select_value", "pclass" => "_50",
            "class" => "optionData",
            "title" => "values",
            "value" => $Valuesdata[$prfx . 'select_value'],
            "comment" => "fieldname,filestypes,xmltag ,values (,)"
        ), "value" => array(
            "type" => "text",
            "id" => $prfx . "value",
            "class" => "optionData name",
            "pclass" => "_50",
            "title" => "selected",
            "value" => $Valuesdata[$prfx . 'value']
        )
        , "depend_on" => array(
            "type" => "text",
            "id" => $prfx . "depend_on",
            "class" => "optionData depend_on",
            "pclass" => "_50",
            "title" => "depend From",
            "value" => $Valuesdata[$prfx . 'depend_on']
        ), "depend_source" => array(
            "type" => "text",
            "id" => $prfx . "depend_source",
            "class" => "optionData depend_type",
            "pclass" => "_50",
            "title" => "depend_type",
            "value" => $Valuesdata[$prfx . 'depend_source']
        )
        
       
        
        
        
        
        
    );
    
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
} else if ($typ == "form") {



    $filds = array(
        "line" => array(
            "type" => "line",
            "id" => "line",
            "class" => "line ",
            "title" => "save Type",
            "comment" => ""),
        "saveType" => array(
            "type" => "select",
            "id" => $prfx . "saveType",
            "class" => "optionData ",
            "pclass" => "_50",
            "title" => "save Type",
            "select_data" => array("none" => "none", "DBTabel" => "DBTabel", "sesstion" => "sesstion"),
            "value" => $Valuesdata['saveType'],
            "comment" => "Choose 'DBTable' in if the form is going to be saved into a table in the DB. Choose 'Session' if the form is going to be saved as session variables."),
        "saveTo" => array(
            "type" => "text",
            "id" => $prfx . "saveTo",
            "class" => "saveTo optionData",
            "pclass" => "_50",
            "title" => "save TO",
            "value" => $Valuesdata[$prfx . 'saveTo'],
            "comment" => "Enter the desitnation where the data will be stored. In case of DB write the name of the table and in case of session write the name of the session array."),
        "SMsg" => array(
            "type" => "text",
            "id" => $prfx . "SMsg",
            "class" => "SMsg optionData ",
            "pclass" => "_50",
            "title" => "succ Msg",
            "value" => $Valuesdata[$prfx . 'SMsg'],
            "comment" => "Success Message to be shown to the user on submitting form successfully"),
        "FMsg" => array(
            "type" => "text",
            "id" => $prfx . "FMsg",
            "class" => "FMsg optionData ",
            "pclass" => "_50",
            "title" => "FMsg",
            "value" => $Valuesdata[$prfx . 'FMsg'],
            "comment" => "Faliure message to be shown to the user in case the form does not submit"),
        "javascript" => array(
            "type" => "textarea",
            "id" => $prfx . "javascript",
            "class" => "FMsg optionData ",
            "pclass" => "_50",
            "title" => "javascript",
            "value" => $Valuesdata[$prfx . 'javascript'],
            "comment" => "Faliure message to be shown to the user in case the form does not submit"),
        "css" => array(
            "type" => "textarea",
            "id" => $prfx . "css",
            "class" => "FMsg optionData ",
            "pclass" => "_50",
            "title" => "css",
            "value" => $Valuesdata[$prfx . 'css'],
            "comment" => "Faliure message to be shown to the user in case the form does not submit"),
        "php" => array(
            "type" => "textarea",
            "id" => $prfx . "php",
            "class" => "FMsg optionData ",
            "pclass" => "_50",
            "title" => "php",
            "value" => $Valuesdata[$prfx . 'php'],
            "comment" => "Faliure message to be shown to the user in case the form does not submit"),
        "phpAfterSave" => array(
            "type" => "textarea",
            "id" => $prfx . "phpAfterSave",
            "class" => "FMsg optionData ",
            "pclass" => "_50",
            "title" => "php After Save",
            "value" => $Valuesdata[$prfx . 'phpAfterSave'],
            "comment" => "Faliure message to be shown to the user in case the form does not submit")
    );
    
 
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
} else if ($typ == "videos") {



    $filds = array(
        "hml" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => $prfx . "datahtml",
            "select_data" => "com_images_gallery_categories",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "videos gallery categories",
            "value" => $id
        ),
        "t" => array(
            "type" => "textarea",
            "id" => $prfx . "morecss",
            "class" => "morecss",
            "title" => "More CSS",
            "value" => $morecss
        )
    );
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
} else if ($typ == "images") {


    $filds = array(
        "hml" => array(
            "type" => "select",
            "select_type" => "DB",
            "id" => $prfx . "datahtml",
            "select_data" => "com_images_gallery_categories",
            "class" => "optionData",
            "select_text" => "title",
            "select_value" => "id",
            "title" => "images gallery categories",
            "value" => $id
        )
        ,
        "t" => array(
            "type" => "textarea",
            "id" => $prfx . "morecss",
            "class" => "morecss",
            "title" => "More CSS",
            "value" => $morecss
        )
    );
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
}


if ($typ == "radio" || $typ == "checkbox") {
    $filds = array(
        "checked" => array(
            "type" => "checkbox",
            "id" => $prfx . "checked",
            "class" => "optionData checked",
            "pclass" => "_50",
            "title" => "Selected",
            "value" => "1",
            $chekValue => $chekValue
    ));
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
}
if ($typ == "hidden" || $typ == "radio" || $typ == "checkbox"|| $typ == "textarea"|| $typ == "egphone"|| $typ == "time") {

    $filds = array(
        "value" => array(
            "type" => "text",
            "id" => $prfx . "value",
            "class" => "optionData name",
            "pclass" => "_50",
            "title" => "value",
            "value" => $Valuesdata[$prfx . 'value']
    ));
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
}






if ($typ != "endDiv" && $typ != "endForm" && $typ != "line") {
    $filds = array(
        "moreAttra" => array(
            "type" => "textarea",
            "id" => $prfx . "moreAttra",
            "class" => "optionData moreAttra",
            "title" => "more Attra",
            "comment" => "The name and id attributes will bear the value entered. Cannot have spaces.",
            "pclass" => "_100",
            "w" => "_100",
            "value" => $Valuesdata[$prfx . 'moreAttra']
        )
    );
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
}

if ($typ == "editor") {

    if ($typ != "form") {
        $filds = array(
            "editor_type" => array(
                "type" => "select",
                "id" => "editor_type",
                "class" => "optionData editor_type",
                "title" => "width mode",
                "pclass" => "_50",
                "select_data" => array("full" => "full", "tiny" => "tiny", "editor" => "editor"),
                "value" => $Valuesdata['editor_type']
            )
        );
    }
    $lib->forms->filds = $filds;
    $out_data .= $lib->forms->_render_form();
}





echo $out_data;
?>
