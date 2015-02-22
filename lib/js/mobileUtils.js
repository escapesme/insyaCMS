/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {


    $(".wnext").click(function() {

        var o = $(this);
        if ($('form').length)         // use this if you are using id to check
        {

            $(document).bind("pagebeforechange", function(e, data) {
                $("form").attr("action", o.attr("href"));
                $("form").submit();
                return false;
            })
        }
    })

});


function loadGoogleMap(id, address) {


    $("#" + id).parents(".thispage").on("pagecreate", function() {



            var defaultLatLng = new google.maps.LatLng(34.0983425, -118.3267434);  // Default to Hollywood, CA when no geolocation support




            if (navigator.geolocation) {
                    function success(pos) {
                            // Location found, show map with these coordinates
                            drawMap(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));


                    }
                    function fail(error) {

                            drawMap(defaultLatLng);  // Failed to find location, show default map
                    }
                    // Find the users current position.  Cache the location for 5 minutes, timeout after 6 seconds
                    navigator.geolocation.getCurrentPosition(success, fail, {maximumAge: 500000, enableHighAccuracy: true, timeout: 6000});
            } else {
                               

             drawMap(defaultLatLng);  // No geolocation support, show default map
            }



        var map;
            var marker


        var geocoder;





         function drawMap(latlng) {


            $("." + id).val(latlng);
                    var myOptions = {
                            zoom: 10,
                            center: latlng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                     map = new google.maps.Map(document.getElementById(id), myOptions);
                    // Add an overlay to the map of current lat/lng
            geocoder = new google.maps.Geocoder();

            marker = new google.maps.Marker({
                            position: latlng,
                            map: map,
                            title: "Greetings!"
                    });


            updateAddress(latlng);

            google.maps.event.addListener(map, 'click', function(event) {

                placeMarker(event.latLng)

                updateAddress(event.latLng);





            });




            if (address) {

                var input = (
                        document.getElementById("add" + id));

                var autocomplete = new google.maps.places.Autocomplete(input);


                google.maps.event.addListener(autocomplete, 'place_changed', function() {


                    var place = autocomplete.getPlace();

                    if (!place.geometry) {
                        return;
                    }

                    placeMarker(place.geometry.location);
                })



            }








            }


        function updateAddress(latLng) {

            geocoder.geocode({
                latLng: latLng
            }, function(responses) {
                if (responses && responses.length > 0) {
                    marker.formatted_address = responses[0].formatted_address;
                } else {
                    marker.formatted_address = 'Cannot determine address at this location.';
                }
                $("#add" + id).val(marker.formatted_address)

            });



        }
        function placeMarker(location) {
            $("." + id).val(location);
            marker.setVisible(false);

            map.setCenter(location);

            marker.setPosition(location);
            marker.setVisible(true);

        }

                       




    });

}
function setFormToSesstion(Form, callback, name, LOCTION) {

    $(function() {


        $.post("/getPostajax.php", {name: name, file: "eng/setSesstion", status: "form", form: Form.serialize()})
                .done(function(s) {

                    alert("sssss");
window.location= Form.attr("action");
                });

        return false;
    })
}
function setFormvalidation(Form, more, name, lang) {
    $(function() {


        if (lang == "en") {

            var urll = "/includes/js/jqueryvalidation/languages/jquery.validationEngine-en.js";




        } else {

            var urll = "/includes/js/jqueryvalidation/languages/jquery.validationEngine-ar.js";



        }

        $.getScript(urll, function() {



            var url = "/includes/js/jqueryvalidation/jquery.validationEngine.js";
            $.getScript(url, function() {

                $("." + Form).validationEngine('attach', {
                    onValidationComplete: function(form, status) {
                        ///    alert("The form status is: " + status + ", it will never submit");
                        if (status == true) {


                            if (more == "addtosession") {
                                setFormToSesstion($("." + Form), null, name);


                            } else if (more == "regform") {

                                regfom("." + Form);


                            } else {




                                return true;



                            }


                        }
                    }
                });
                ;
            });
        })
    })
}