<?php

function GetDays($sStartDate, $sEndDate) {
    $startTimeStamp = strtotime($sStartDate);
    $endTimeStamp = strtotime($sEndDate);

    
     $datediff = $endTimeStamp - $startTimeStamp;
     return floor($datediff/(60*60*24));
}

/* @var $lib  libs\libs */
global $lib;


echo GetDays($lib->util->dateTodb($_GET['d1']), $lib->util->dateTodb($_GET['d2']));
