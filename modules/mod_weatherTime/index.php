<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_weatherTime($pro) {
    global $lib;

    $todayDate = date("Y-m-d g:i a"); // current date
    $currentTime = time($todayDate); //Change date into time
    $timeAfterOneHour = ($currentTime - 60);

    $data = '<link rel="stylesheet" href="/' . $lib->util->mylink("module", "mod_weatherTime") . '/style.css"></link>';





    $data .= '<script src="/' . $lib->util->mylink("module", "mod_weatherTime") . '/jquery.zweatherfeed.js"></script>' .
            "<script>weatherActions('" . $pro ['citycode'] . "');</script>";



    $data .= ' <div  id="weather-clock"> 
	<div  id="weather" >
    <div class="weather-current-image" ></div>
    <div class="weather-current-temp"></div>
    <div class="weather-current-dayname">' . date("l") . '</div>
    <div class="weather-current-hi-lo">Lo: <span class="lovalue"></span> Hi:  <span class="hivalue"></span> </div></div>
';
    $data .='<div id="clock">
        <div class="clock-image"></div><div class="current-time" id="current-time">
        <div class="current-hourstime">' . date('h:i', $timeAfterOneHour - 2) . '</div>'
            . '<div class="time-city">CAIRO</div>'
            . '<div class="ampm">' . date('A') . '</div>
                </div> </div> </div>
    
   ';

    return $data;
}
?>

<script>
    function weatherActions(e) {

        $(document).ready(function() {
            //$('#test').weatherfeed(['UKXX0085', 'EGXX0011', 'UKXX0061', 'CAXX0518', 'CHXX0049']);

            $('.weather-current-hi-lo').weatherfeed([e], {
                image: true,
                country: true,
                highlow: true,
                wind: true,
                humidity: true,
                visibility: true,
                sunrise: true,
                sunset: true,
                forecast: true,
                link: true
            }, function() {
                Cufon.replace('.weatherTemp', {
                    hover: true
                });

            });







        });
    }
</script>
