<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* @var $lib  libs\libs */
global $lib;
$type = $_GET['type'];

//$out = "<option></option>";
switch ($type) {
    case "xml":
        $stringmyurl = $lib->util->siteSetting['site_link'];
        $file = "lib/" . $lib->foldersMap->lib_folder . "xml/" . $_GET['parent'] . "/" . $_GET['val'] . "_" . $lib->util->siteSetting['lang'] . ".xml";

        
        if (is_file($file)) {
            $out.=$lib->forms->xmlToOptionsVal($stringmyurl . $file, $_GET['val'],$_GET['value'], "");
        }
        break;

    default:
        break;
}
echo $out;
