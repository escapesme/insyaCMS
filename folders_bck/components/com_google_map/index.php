
<?php 
function main($p,$l){
    
    
    
    
    global  $lib ;
    
   $data= $lib->db->get_row("com_google_map" ,"","id=".$p['mapData']);

   $r="";
   
$r.="<div class='map'><div><label>".$l['title']."</label>".$data['title']."</div>";
$r.="<div><label>".$l['des']."</label>".$data['des']."</div>";



$ls=explode(",", $data['location']);




    $r.='

    <style>
        #map_canvas {
            margin: 0;
            padding: 0;
            height: ' . $p['hieghtMap'] . 'px;
            width: ' . $p['widthMap'] . 'px;
        }
    </style>
      <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
    

var contentString = \'<div id="content">test</div>\';

        var map;
           var myLatlng = new google.maps.LatLng(' . $ls[0] . ',' . $ls[1]  . ' );
        function initialize() {
            var mapOptions = {
                    zoom: 14,
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
            title: \'' . $data['locationtitle'] . '\'
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

    <div id="map_canvas"></div></div>';
















    return $r;
}
