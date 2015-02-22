<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function main($pro) {





    $data = $pro['intro'] .'

    <style>
        #map_canvas {
            margin: 0;
            padding: 0;
            height: ' . $pro['height'] . 'px;
            width: ' . $pro['width'] . 'px;
        }
    </style>
      <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
    

var contentString = \'<div id="content">' . $pro['markerData'] . '</div>\';

        var map;
           var myLatlng = new google.maps.LatLng(' . $pro['Lat'] . ',' . $pro['Lng'] . ' );
        function initialize() {
            var mapOptions = {
                    zoom: ' . $pro['zoom'] . ',
              center: myLatlng,
     
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById(\'map_canvas\'),
                    mapOptions);
                    
var infowindow = new google.maps.InfoWindow({
    content: contentString
    


});

   
 

var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: \'' . $pro['markerTitle'] . '\'
        });
        

infowindow.open(map,marker);
       google.maps.event.addListener(marker, \'load\', function() {
          infowindow.open(map,marker);
        });

        }
$(function(){

initialize();

})
   
    </script>

    <div id="map_canvas"></div>';



    return $data;
}
?>
<style>


</style>