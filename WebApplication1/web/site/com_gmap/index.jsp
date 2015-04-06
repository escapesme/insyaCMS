<%--
    Document   : Googlemap
    Created on : May 25, 2011, 1:33:52 PM
    Author     : Sayed Taha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <title>Google Maps Demo</title>
        <script src="http://maps.google.com/maps?file=api&amp;v=3&amp;key=ABQIAAAA-O3c-Om9OcvXMOJXreXHAxQGj0PqsCtxKvarsoS-iqLdqZSKfxS27kJqGZajBjvuzOBLizi931BUow"
        type="text/javascript"></script>
        <%-- <script type="text/javascript" src="GMap.js" ></script>--%>
        <script type="text/javascript">
            var COLORS = [["red", "#ff0000"], ["orange", "#ff8800"], ["green","#008000"],
                ["blue", "#000080"], ["purple", "#800080"]];
            var options = {};
            var lineCounter_ = 0;
            var shapeCounter_ = 0;
            var colorIndex_ = 0;
            var featureTable_;
            var linesArray = new Array();
            var map;
            var lineWeight = 2;
            //this is mainly used in delete
            var selectedLine = null;

            var geocoder = null;
            //added by Sayed
            var isItFirstPonit = false;
            /**
             * this function is used to draw data supposed to come from DB
             */
            function addNewLineToMap(lan1,lat1,la2,lat2){
                newLine = new GPolyline([ new GLatLng(lan1,lat1),new GLatLng(la2,lat2)], getColor(false), lineWeight);
                //increase the number of color indexes
                //newLine.enableDrawing(options);
                newLine.enableEditing({onEvent: "mouseover"});
                newLine.disableEditing({onEvent: "mouseout"});
                GEvent.addListener(newLine, "resize", function() {
                    alert('resizing');
                });
                GEvent.addListener(newLine, "click", function(latlng, index) {
                    var len = newLine.getLength();
                    alert('Line Length = '+len);
                    selectedLine = this;
                    if (typeof index == "number") {
                        newLine.deleteVertex(index);
                    } else {
                        var newColor = getColor(false);
                        //cells.color.style.backgroundColor = newColor
                        newLine.setStrokeStyle({color: newColor, weight: lineWeight});
                    }
                });

                GEvent.bind(newLine, "lineupdated", "null", function(){
                    p1_lat = newLine.getBounds().getSouthWest().lat();
                    p1_lng = newLine.getBounds().getSouthWest().lng();
                    p2_lat = newLine.getBounds().getNorthEast().lat();
                    p2_lng = newLine.getBounds().getNorthEast().lng();
                    for(index = 0;index < linesArray.length;index++){
                        tempPoly = linesArray[index];
                        if( tempPoly != null){
                            temp_p1_lat = tempPoly.getBounds().getSouthWest().lat();
                            temp_p1_lng = tempPoly.getBounds().getSouthWest().lng();
                            temp_p2_lat = tempPoly.getBounds().getNorthEast().lat();
                            temp_p2_lng = tempPoly.getBounds().getNorthEast().lng();

                            if((p1_lat ==temp_p1_lat && p1_lng == temp_p1_lng)||(p1_lat ==temp_p2_lat && p1_lng == temp_p2_lng)||(p2_lat ==temp_p1_lat && p2_lng == temp_p1_lng)||(p2_lat ==temp_p2_lat && p2_lng == temp_p2_lng)){
                                //this means that this line is the one we wanna update in the array
                                linesArray.splice(index, 1);
                                linesArray[linesArray.length] = newLine;
                            }
                        }
                    }



                });
                map.addOverlay(newLine);
                linesArray[linesArray.length] = newLine;
                colorIndex_++;
            }
            /**
             *this function is used mainly to Draw Existance Lines
             */
            function drawExistanceLines(){
                var l2 = addNewLineToMap(64, -83.1419,40.4519, -132.1519);
                var l3 = addNewLineToMap(74, -70.1419,30.4519, -142.1519);
                var l1 = addNewLineToMap(44, -82.1419,50.4519, -100.1519);
            }
            function select(buttonId) {
                document.getElementById("line_b").className="unselected";
            }

            function stopEditing() {
                select("hand_b");
            }

            function getColor(named) {
                return COLORS[(colorIndex_++) % COLORS.length][named ? 0 : 1];
            }

            function getIcon(color) {
                var icon = new GIcon();
                icon.image = "http://google.com/mapfiles/ms/micons/" + color + ".png";
                icon.iconSize = new GSize(32, 32);
                icon.iconAnchor = new GPoint(15, 32);
                return icon;
            }

            function startLine() {
                //alert('Start Line.........');
                select("line_b");
                var color = getColor(false);
                var line = new GPolyline([], color,lineWeight);
                startDrawing(line, null, function() {
                    var cell = this;
                    var len = line.getLength();
                    // cell.innerHTML = (Math.round(len / 10) / 100) + "km";
                    alert('Line Length = '+len);
                }, color);
            }

            function addFeatureEntry(name, color) {
                currentRow_ = document.createElement("tr");
                var colorCell = document.createElement("td");
                currentRow_.appendChild(colorCell);
                colorCell.style.backgroundColor = color;
                colorCell.style.width = "1em";
                var nameCell = document.createElement("td");
                currentRow_.appendChild(nameCell);
                nameCell.innerHTML = name;
                var descriptionCell = document.createElement("td");
                currentRow_.appendChild(descriptionCell);
                //featureTable_.appendChild(currentRow_);
                return {desc: descriptionCell, color: colorCell};
            }

            function onUpdate(){
                alert('line updated');
            }

            function startDrawing(poly, name, onUpdate, color) {
                var cells = addFeatureEntry(name, color);
                //alert('start drawing........');
                map.addOverlay(poly);
                poly.enableDrawing(options);
                poly.enableEditing({onEvent: "mouseover"});
                poly.disableEditing({onEvent: "mouseout"});
                GEvent.addListener(poly, "click", function(latlng, index) {
                    alert('Line Length = '+poly.getLength());
                    selectedLine = this;
                    if (typeof index == "number") {
                        poly.deleteVertex(index);
                    } else {
                        var newColor = getColor(false);
                        cells.color.style.backgroundColor = newColor
                        poly.setStrokeStyle({color: newColor, weight: 1});
                    }
                });
                GEvent.addListener(poly, "endline", function() {
                    //alert('end of line function !!!!!!!');
                    selectedLine = this;
                    // adding the new line to linesArray
                    linesArray[linesArray.length] = poly;

                    select("hand_b");

                    GEvent.bind(poly, "lineupdated", cells.desc, function(){
                        p1_lat = poly.getBounds().getSouthWest().lat();
                        p1_lng = poly.getBounds().getSouthWest().lng();
                        p2_lat = poly.getBounds().getNorthEast().lat();
                        p2_lng = poly.getBounds().getNorthEast().lng();
                        for(index = 0;index<linesArray.length;index++){
                            tempPoly = linesArray[index];
                            if( tempPoly != null){
                                temp_p1_lat = tempPoly.getBounds().getSouthWest().lat();
                                temp_p1_lng = tempPoly.getBounds().getSouthWest().lng();
                                temp_p2_lat = tempPoly.getBounds().getNorthEast().lat();
                                temp_p2_lng = tempPoly.getBounds().getNorthEast().lng();

                                if((p1_lat ==temp_p1_lat && p1_lng == temp_p1_lng)||(p1_lat ==temp_p2_lat && p1_lng == temp_p2_lng)||(p2_lat ==temp_p1_lat && p2_lng == temp_p1_lng)||(p2_lat ==temp_p2_lat && p2_lng == temp_p2_lng)){
                                    //this means that this line is the one we wanna update in the array
                                    linesArray.splice(index, 1);
                                    linesArray[linesArray.length] = poly;
                                }
                            }
                        }



                    });

                });
            }









            function initialize(longtd,lattd,zoom) {
                if (GBrowserIsCompatible()) {
                    map = new GMap2(document.getElementById("map"));
                    map.setCenter(new GLatLng(longtd, lattd), zoom);
                    map.addControl(new GSmallMapControl());
                    //map.addControl(new GMapTypeControl());
                    geocoder = new GClientGeocoder();
                    map.enableInfoWindow();
                    map.disableDoubleClickZoom();
                    map.clearOverlays();
                    map.enableScrollWheelZoom() ;
                    //map.setUIToDefault() ;
                    featureTable_ = document.getElementById("featuretbody");
                    select("hand_b");
                    /**
                     * this is to view current point coordinates
                     */
                    GEvent.addListener(map,"click", function(overlay, latlng) {
                        if (latlng) {
                            var myHtml ="" + latlng + "";
                            map.openInfoWindow(latlng, myHtml);   } });
                    /**
                     * this is to view current point fill information
                     */
                    GEvent.addListener(map, "dblclick", getAddress);
                    geocoder = new GClientGeocoder();
                    //handling delete key event

                }


            }
            function deleteButonAction(e){
                var keynum
                if(window.event) // IE
                {
                    keynum = e.keyCode
                }
                else if(e.which) // Netscape/Firefox/Opera
                {
                    keynum = e.which
                }
                if(keynum == 46){
                    removeLine();
                }
            }
            /**
             * this is occured when user double clicks the map and uses AJAX to get points info and the response
             * function is ShowPointAddress
             */
            function getAddress(overlay, latlng) {

                alert('getting address....');
                if (latlng != null) {
                    address = latlng;
                    geocoder.getLocations(latlng, showPointAddress);
                }
            }
            /**
             * this is occured when user double clicks the map to view whole point info
             */
            function showPointAddress(response) {

                // map.clearOverlays();
                if (!response || response.Status.code != 200) {

                } else {
                    place = response.Placemark[0];
                    point = new GLatLng(place.Point.coordinates[1],place.Point.coordinates[0]);
                    marker = new GMarker(point);
                    map.addOverlay(marker);
                    marker.openInfoWindowHtml(
                    '<b>latlng:</b>' + place.Point.coordinates[1] + "," + place.Point.coordinates[0] + '<br>' +
                        '<b>Address:</b>' + place.address + '<br>' +
                        //'<b>Accuracy:</b>' + place.AddressDetails.Accuracy + '<br>' +
                    '<b>Country code:</b> ' + place.AddressDetails.Country.CountryNameCode);
                }
            }
            function showAddress(address) {
                if (geocoder) {
                    geocoder.getLatLng(
                    address,
                    function(point) {
                        if (!point) {
                            alert(address + " not found");
                        } else {
                            map.setCenter(point, 13);
                            var marker = new GMarker(point);
                            map.addOverlay(marker);

                            // As this is user-generated content, we display it as
                            // text rather than HTML to reduce XSS vulnerabilities.
                            marker.openInfoWindow(document.createTextNode(address));
                        }
                    }
                );
                }
            }
            function removeLine(){
                if(selectedLine == null)
                    alert('select line first to erase !');
                else if(confirm('Are you sure you want to delete selected line?')){
                    map.removeOverlay(selectedLine);
                    //remove it from the Lines Array
                    for(index = 0;index<linesArray.length;index++){
                        tempPoly = linesArray[index];
                        //var allPoints = tempPoly.getPath().getArray();
                        //for (var i = 0; i < allPoints.length - 1; i++) {
                        bounds = tempPoly.getBounds() ;
                        p1 = bounds.getSouthWest();
                        p2 = bounds.getNorthEast();
                        if(tempPoly == selectedLine){
                            // linesArray[index] = null;
                            linesArray.splice(index, 1);
                            break;
                        }


                        //}
                    }
                    selectedLine =  null;
                }
            }
            function saveMap(){
                //this function is used to save all lines stored on linesArray

                for(index = 0;index<linesArray.length;index++){
                    tempPoly = linesArray[index];
                    if( tempPoly != null){
                        //var allPoints = tempPoly.getPath().getArray();
                        //for (var i = 0; i < allPoints.length - 1; i++) {
                        bounds = tempPoly.getBounds() ;
                        p1 = bounds.getSouthWest();
                        p2 = bounds.getNorthEast();
                        alert('line<'+ index + '> Details :- \nP1-->Latitude = ' + p1.lat() +',\nP1-->Langitude ='+p1.lng()+ '\nP2-->Latitude = ' + p2.lat() +',\nP2-->Langitude ='+p2.lng());
                    }
                }
            }
        </script>


        <style type="text/css">

            body {
                font-family: Arial, sans serif;
                font-size: 11px;
            }
            #hand_b {
                width:31px;
                height:31px;
                background-image: url(http://google.com/mapfiles/ms/t/Bsu.png);
            }
            #hand_b.selected {
                background-image: url(http://google.com/mapfiles/ms/t/Bsd.png);
            }

            #placemark_b {
                width:31px;
                height:31px;
                background-image: url(http://google.com/mapfiles/ms/t/Bmu.png);
            }
            #placemark_b.selected {
                background-image: url(http://google.com/mapfiles/ms/t/Bmd.png);
            }

            #line_b {
                height: 38px;
                width: 36px;
                background-image: url("images/pencil_B.png");
            }
            #line_b.selected {
                background-image: url("images/pencil_R.png");
            }
            #eraser_b {
                height: 38px;width: 36px;background-image: url('eraser.jpg')
            }

            #shape_b {
                width:31px;
                height:31px;
                background-image: url(http://google.com/mapfiles/ms/t/Bpu.png);
            }
            #shape_b.selected {
                background-image: url(http://google.com/mapfiles/ms/t/Bpd.png);
            }
        </style>


    </head>
    <body onkeyup="deleteButonAction(event);" onload="initialize(64.01449619484472, -151.34765625, 3);drawExistanceLines();" onunload="GUnload">

        <div id ="container">
            <table><tr style="vertical-align:top">
                    <td style="width:15em">

                        <table><tr>
                                <td>&nbsp;</td>
                                <td><div id="line_b"
                                         onclick="startLine()"/></td>
                                <td><img src="eraser.jpg" style="height: 38px;width: 36px;" alt="DELETE" id="eraser_b"
                                         onclick="removeLine();"/></td>
                                <td>&nbsp;</td>
                            </tr></table>

                        <input type="hidden" id="featuredetails" rows=2>

                        </input>
                        <p>
                            <font face="Arial Black">
                                To draw on the map, click on the Pencil and then click on the
                                map. Double-click to stop
                            </font>
                        </p>
                        <table id ="featuretable">
                            <tbody id="featuretbody"></tbody>
                        </table>
                    </td>
                    <td>
                        <!-- The frame used to measure the screen size -->
                        <div id="frame"></div>

                        <div id="map" style="width: 1000px; height: 700px"></div>
                    </td>
                </tr></table>
            <form action="#" onsubmit="saveMap();" return false">
                  <p>
                    <input type="submit" value="Save Map" />
                </p>
            </form>
            <form action="#" onsubmit="showAddress(this.address.value); return false">
                <p>
                    Enter Address <input type="text" size="40" name="address" value="Egypt" />
                    <input type="submit" value="Go!" />
                </p>
            </form>
            <form action="#"  onsubmit="getAddress(this.latvalue.value,this.lngvalue.value); return false">
                <p>
                    Enter Lat value <input type="text" size="40" name="latvalue" value="" /><br/>
                    Enter Lng value <input type="text" size="40" name="lngvalue" value="" />
                    <input type="submit" value="show address!" />
                </p>
            </form>

        </div>
    </body>
</html>
