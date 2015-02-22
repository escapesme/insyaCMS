<?php

/* @var $lib  libs\libs */
global $lib;

$data = urldecode($_GET['pluginsData']);


$data = explode(";", $data);





$xmlfile = "" . $lib->foldersMap->admin_plugins_folder . "" . $_GET['plugin'] . "/" . "porperties.xml";
$plgsData = $lib->util->readXmlAttributes($xmlfile, $lib->variables->xml_fldestsgeTag);


if (isset($data[$_GET['sumber']])) {


    $valuesData = $lib->util->data->updateStringTorray($data[$_GET['sumber']]);


    foreach ($valuesData as $k => $v) {


        $plgsData[$k]["value"] = $v;
    }
}


$lib->forms->notLang ="Y";
$lib->forms->filds = $plgsData;




echo $lib->forms->_render_form();
?>
