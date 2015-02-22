<?php

/* @var $lib  \libs\libs */
global $lib;

$status = $_GET['status'];
$ids =  explode(",", $_GET['ids']) ;

 $lib->admin->table_name = $_GET['table'];


 
 

switch ($status) {
    case "copy":
        $lib->admin->mackCopy($ids);
        break;
    case "delete":
        
        $lib->admin->mackDelete($ids);
        break;
    case "remove":
        $lib->admin->mackRemove($ids);
        break;
    case "hisstory":
        $lib->admin->mackhistory($ids);
        break;
    case "restore":
        $lib->admin->mackRestore($ids);
        break;
      case "restore_all":
        $lib->admin->allRestore($ids);
        break;
       case "remove_all":
        $lib->admin->allRemove($ids);
        break;
    case "disable":
        $lib->admin->mackdiable($ids);
        break;
    case "enable":
        $lib->admin->mackenable($ids);
        break;
    case "updateData":
        $lib->admin->updateData($ids, $value);
        break;
}


  