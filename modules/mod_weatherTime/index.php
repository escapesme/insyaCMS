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
    $eg = "EGXX0004";

    $weather = getweathers("http://weather.msn.com/RSS.aspx?wealocations=wc:" . $eg . "&weadegreetype=C");
    return '
  <div class="weather" >
    <div class="weather-current-image" >' . $weather['current_weather_image'] . '</div>
        
		<div class="weather-current-temp">' . $weather['current_temp'] . '</div>
                    <div class=\'daytype\'>
		<div class="weather-current-dayname">' . date("l") . '</div>
		<div class="weather-current-hi-lo">Lo:' . $weather['lo'][0] . ' Hi:' . $weather['hi'][0] . ' </div></div>

	<div class="tooltip"> 
		<div class="span-6 weather-more" id="">
			<div class="weather-more-image" >' . $weather['weather_image'][1] . '</div><div class="weather-more-dayname">' . date('D', strtotime('+1 day')) . '</div>
			<div class="weather-more-hi-lo">Lo: ' . $weather['lo'][1] . ' Hi: ' . $weather['hi'][1] . '</div>
		</div>
		<div class="span-6 weather-more" id="">
			<div class="weather-more-image" >' . $weather['weather_image'][2] . '</div><div class="weather-more-dayname">' . date('D', strtotime('+2 day')) . '</div>
			<div class="weather-more-hi-lo">Lo: ' . $weather['lo'][2] . ' Hi: ' . $weather['hi'][2] . ' </div>
		</div>
		<div class="span-6 weather-more" id="">
			<div class="weather-more-image" >' . $weather['weather_image'][3] . '</div><div class="weather-more-dayname">' . date('D', strtotime('+3 day')) . '</div>
			<div class="weather-more-hi-lo">Lo: ' . $weather['lo'][3] . ' Hi: ' . $weather['hi'][3] . ' </div>
		</div>
		<div class="span-6 weather-more-no-border" id="">
			<div class="weather-more-image" >' . $weather['weather_image'][4] . '</div><div class="weather-more-dayname">' . date('D', strtotime('+4 day')) . '</div>
			<div class="weather-more-hi-lo">Lo: ' . $weather['lo'][4] . ' Hi: ' . $weather['hi'][4] . ' </div>
		</div>
	</div>	
        </div><script>   $(function() {weatherActions();})</script>

    ';
}
?>

<script>
    function weatherActions() {
        $(".weather").hover(function() {
            $(".weather .tooltip").show();
        }, function() {
            $(".weather .tooltip").hide();

        });

        ;
    }
</script>
<style>

   


    .weather  .tooltip {
    display: none;
        margin-right: 300px;
        background-color: #be9962;
        position: absolute;
        height: 56px;
        padding: 0px;
        margin: 0;
        margin-top: 55px;
        width: 443px;
        font-size: 11px;
        opacity: 0.7;
    }

    .weather-current-image {
        height: 45px;
        width: 55px;
        margin: 5px 0 0 5px;
        float: left;
    }




    .weather-current-temp {
        width: 40px;
        margin: 7px 0 0 -2px;
        float: left;
        font-size: 36px;
        color: #FDEBA1;
    }

    .weather-current-dayname {
        width: 95px;
        height: 15px;
        margin: 11px 0 0 5px;
        float: left;
        font-size: 15px;
        font-weight: bold;
        color: #2A281D;
        text-align: center;
    }
    .weather-current-hi-lo {
        width: 95px;
        float: left;
        font-size: 12px;
        color: #2A281D;
        margin: 5px 0 0 5px;
        text-align: center;
    }


    .weather-more {
        width: 110px;
        height: 56px;
        margin: 0;
        border-right: #967041 1px solid;
        float: left;
    }

    .weather-more-no-border {
        width: 109px;      float: left;
        height: 56px;
        margin: 0;
    }

    .weather-more-image {
        height: 30px;
        width: 30px;
        margin: 15px 0 0 3px;
        float: left;
    }

    .weather-more-dayname {
        width: 70px;
        height: 15px;
        margin: 15px 0 0 5px;
        float: left;
        font-size: 12px;
        font-weight: bold;
        color: #2A281D;
        text-align: center;
    }

    .weather-more-hi-lo {
        width: 70px;
        float: left;
        font-size: 10px;
        color: #2A281D;
        margin: 5px 0 0 5px;
        text-align: center;
    }

</style>
