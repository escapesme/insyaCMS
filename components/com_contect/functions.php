<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function gmap($pro) {





    $data = $pro['intro'] . '

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

function updatedata($datag, $pro) {

    global $lib;


    if (isset($_POST['addcontect'])) {



        $data = "<table width='100%'>";



        foreach ($_POST as $k => $v) {

            $kt = str_replace("_", " ", $k);

            if ($kt != "mysubmit") {

                $data.= "<tr><td style='width:25%'><b>" . $kt . "<b></td><td  style='width:70%'>" . $v . "<td></tr>";
            }
        }
        $data.="</table>";



        $title = "";
        $form = $form;


        $lib->util->sendMail($_POST['email'], $data, $pro['title'], $pro['formlabel'], $pro['formmail']);

        $lib->util->sendMail($datag['emails'], $data, $pro['title'], $pro['formlabel'] . "-" . $_POST['name  '], $_POST['email']);


        $arraydata = array(
            "title" => $datag['title'],
            "data" => addslashes($data)
        );





        $lib->db->insert_row('com_contect_messages', $arraydata);


        // $lib->db->delete_data('com_contect_messages' ,"1=1","");


        echo "<div class='msg'>".$datag['success_message']."</div>";
    }
}

?>
