<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_time($pro) {
    global $lib;
    $todayDate = date("Y-m-d g:i a"); // current date
    $currentTime = time($todayDate); //Change date into time
    $timeAfterOneHour = ($currentTime - 60);
    $city = "CAIRO";
    $data = '
	<div class=\'time_mod\'><div class="span-6" id="clock">
    <div class="clock-image"></div>
    <div class="current-time" id="current-time">
    <div class="current-hourstime">' . date('h:i', $timeAfterOneHour - 2) . '</div>
    <div class=\'timeType\'><div class="time-city">' . $city . '</div>
    <div class="ampm" style="">' . date('A') . '</div> </div>
</div> </div> 
</div> ';
    return $data;
}
?>

<style>

    .current-hourstime {
        width:80px;margin:9px 0 0 5px;float: left;color:#FDE69A;font-size: 36px;
    }

    .time-city {
       color: #2A281D; height:18px;width:70px;float:left;font-size:13px;font-weight:bold;margin:15px 0 0 20px;
    }

    .ampm {
         color: #2A281D;height:10px;width:70px;float:left;font-size:12px;margin:0px 0 0 20px;
    }



</style>
