
var statr_link = "";
var options = {};
var lineCounter_ = 0;
var shapeCounter_ = 0;
var colorIndex_ = 0;
var featureTable_;
var linesArray = new Array();
var map;
var lineWeight = 2;
var poly;
var markers = [];
var path = new google.maps.MVCArray;
//this is mainly used in delete
var selectedLine = null;

var geocoder = null;
//added by Sayed
var isItFirstPonit = false;

var createStatus = 0;

var creatLineSataus = 0;

var creatLine_1 = 0;
var Loction_1 = 0;


var nodid_1 = 0;

var createLine_node1postion = 0;
var createLine_node2postion = 0;
var createLine_marker1 = 0;
var createLine_marker2 = 0;


var nodid_2 = 0;

var thnewmarker = null;

var mod_id = null;
var map = null;

var MarkerImage_d = "";




var MarkerImage = 'images/marker.png';
var MarkerImage_a_def = 'images/edit_marker.png';
var MarkerImage_a = 'images/edit_marker.png';
var marker_new = 'images/marker_new.png';
var marker_selected = 'images/marker_selected.png';

var MarkerImage_d_g = "";
var MarkerImage_x = 0;
var MarkerImage_y = 0;
var MarkerImage_height = 0;
var MarkerImage_width = 0;
var Markers = new Array();
var Circles = new Array();
var marnum = 0;
var carnum = 0;

var markerList = {};
var markersArray = [];

//var pathesArray = [];
var theNewLine = null




function  addCircle(sid, mp, mid, myLatlng, status) {
    if (sid !== "" && sid !== "Null" && sid !== "null" && sid !== null) {
        var op = 0.15;


        var strokeColor = "#FF0000";
        var fillColor = "#FF0000";
        if (status == "n") {

            //op=0;


            strokeColor = "#0F2FFB";
            fillColor = "#0F2FFB";


            MarkerImage_a = 'images/edit_marker.png';
            ;

        } else {

            MarkerImage_a = 'images/' + image;



        }



        var populationOptions = {
            strokeColor: strokeColor,
            strokeOpacity: op,
            strokeWeight: 2,
            fillColor: fillColor,
            fillOpacity: op,
            map: mp,
            center: myLatlng,
            radius: 70000,
            id: mid
        };


        carnum++;
        Circles[carnum] = new google.maps.Circle(populationOptions);
    }
}
function showPointAddressbayl(longt, lat, id, image, width, height, mp, name, x, y, mid, sid, status, clouddata) {


    var myLatlng = new google.maps.LatLng(longt, lat);
//console.log(myLatlng);
    MarkerImage_d = 'images/' + image;





    MarkerImage_x = x;
    MarkerImage_y = y;
    MarkerImage_height = height;
    MarkerImage_width = width;


    //create market image with its settings 



    var image1 = new google.maps.MarkerImage(MarkerImage_d,
            new google.maps.Size(parseFloat(MarkerImage_width), parseFloat(MarkerImage_height)),
            new google.maps.Point(0, 0),
            new google.maps.Point(parseFloat(MarkerImage_x), parseFloat(MarkerImage_y)));

    // create marker

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: mp,
        icon: image1,
        title: name,
        id: mid
    });
    markerList[marker.id] = marker;
    markersArray.push(marker);


    addCircle(sid, mp, mid, myLatlng, status);











    // markerList[marker.id] = marker;


    var daa = id.split("/");


    //add click event to show node properties
    google.maps.event.addListener(marker, "click", function(event) {


        var Stringtest = mod_id + " : ";

        Stringtest += "creatLineSataus: " + creatLineSataus;
        if (creatLineSataus == 1) {

            var image12 = new google.maps.MarkerImage(marker_selected,
                    new google.maps.Size(parseFloat(MarkerImage_width), parseFloat(MarkerImage_height)),
                    new google.maps.Point(0, 0),
                    new google.maps.Point(10, 29));

            Stringtest += "creatLine_1: " + creatLine_1;

            if (creatLine_1 == 0) {

                creatLine_1 = event.latLng.lat() + "," + event.latLng.lng();

                nodid_1 = daa[1];

                createLine_node1postion = event.latLng;


                marker.setIcon(image12)



                Loction_1 = marker.id;

                createLine_marker1 = marker;

            } else {


                createLine_marker2 = marker;
                marker.setIcon(image12)

                createLine_node2postion = event.latLng;


                var myline = creatLine_1.split(",");


                theNewLine = addNewLineToMap(myline[0], myline[1], event.latLng.lat(), event.latLng.lng(), 2, mp, "#CC0000", "", "");


                $.get("ajax/implementation/getImGroups.jsp?id=" + Loction_1, function(returnData) {
                    var m1 = $.trim(returnData);

                    $.get("ajax/implementation/getImGroups.jsp?id=" + marker.id, function(returnData) {
                        var m2 = $.trim(returnData);

                        create_Line_setp2(mod_id, m1, m2)

                    });


                });



                nodid_2 = daa[1];
                creatLine_1 = 0;

            }
        }

        var link2 = "?alias=xact&module=NodeProperties&pro_id=" + id;
        $.get("ajax//engine/get_model_1.jsp" + link2, function(r_data) {

            $("#Properties_con").html(r_data);

        })

        // get_group();

    });





    if (status == "n") {

        // mouseover event to how the name of location
        google.maps.event.addListener(marker, "mouseover", function() {

            $.get("ajax/engine/returnValue.jsp?table=location&filde=NAME&ofilde=ID&id=" + daa[1], function(retdata_group) {

                $(".showtool").show();
                $("body").mousemove(function(e) {
                    var XX = e.pageX + 15;
                    var YY = e.pageY + 15;
                    var data = "<div style=\"left:" + XX + "px;top:" + YY + "px;\" class=\"mytoo\">" + retdata_group + "</div>";
                    $(".showtool").html(data);



                });

            })
        })
    } else {





        // mouseover event to how the name of location
        google.maps.event.addListener(Circles[carnum], "mouseover", function() {

            $.get("ajax/engine/returnValue.jsp?table=location&filde=NAME&ofilde=ID&id=" + daa[1], function(retdata_group) {

                $(".showtool").show();
                $("body").mousemove(function(e) {
                    var XX = e.pageX + 15;
                    var YY = e.pageY + 15;
                    var data = "<div style=\"left:" + XX + "px;top:" + YY + "px;\" class=\"mytoo\">" + retdata_group + "</div>";
                    $(".showtool").html(data);



                });

            })
        })


    }


    //hide location name tag on exit
    google.maps.event.addListener(marker, "mouseout", function() {

        $(".showtool").hide();

        $(".showtool").html("");

    })

    //double click event to open group view
    google.maps.event.addListener(marker, "click", function() {



        $(".implementation_activeobject").val(daa[1] + "/" + daa[2] + "/" + daa[3]);
        $(".implementation_activeobject").data("type", "locition");



    });



    //double click event to open group view
    google.maps.event.addListener(marker, "dblclick", function() {


        var cloud = clouddata.split(",");
        var cloudID = cloud[0];
        var cloudName = cloud[2];
        var cloudcolor = cloud[4];

        //  alert (cloudcolor+cloud);

        if (cloudName == undefined || cloudName == null) {

            cloudName = "Global"
            cloudcolor = "000000"
            cloudID = "view_imglobal";
        }



        $.get("ajax/implementation/ImplementationGroups.jsp?sid=" + sid + "&id=" + daa[1] + "/" + daa[2] + "/" + daa[3], function(retdata_group) {



            newGroupWindows($.trim(retdata_group), marker.id, daa, sid, cloudID, cloudcolor, cloudName);



        })




    });




}


function addNewLineToMap(lat1, lon1, lat2, lon2, lineWeight, mp, color, id, status) {


    //coordinates 
    var flightPlanCoordinates = [
        new google.maps.LatLng(lat1, lon1),
        new google.maps.LatLng(lat2, lon2)

    ];
    linesStatus = status;

    //set line settings in variable


    var op = 1.0;
    $(".implementation_edit").addClass("dis");
    $(".implementation_delete").addClass("dis");

//console.log(flightPlanCoordinates);

    var flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        strokeColor: color,
        strokeOpacity: op,
        strokeWeight: lineWeight
    });


    //draw line
    flightPath.setMap(mp);

    //mouseover event to get line properties

    //  pathesArray.push(flightPath);




    google.maps.event.addListener(map, 'click', function() {


        $(".implementation_edit").addClass("dis");
        $(".implementation_delete").addClass("dis");


        flightPath.setOptions({strokeColor: color});

    });



    for (var i = 0; i < markersArray.length; i++) {
        google.maps.event.addListener(markersArray[i], 'click', function() {


            flightPath.setOptions({strokeColor: color});

            $(".implementation_edit").removeClass("dis");
            $(".implementation_delete").removeClass("dis");



            //  for (var i = 0; i < pathesArray.length; i++) {
            //  pathesArray[i].setOptions({strokeColor: color});

            //  }

        })

    }


    /*
     for (var i = 0; i < pathesArray.length; i++) {
     google.maps.event.addListener(pathesArray[i], 'click', function() {
     
     
     flightPath.setOptions({strokeColor: color});
     
     })
     
     }
     */




    google.maps.event.addListener(flightPath, 'click', function() {
        /*for (var i = 0; i < pathesArray.length; i++) {
         pathesArray[i].setOptions({strokeColor: color});
         
         }*/
        flightPath.setOptions({strokeColor: "#2173c4"});





        $(".implementation_activeobject").val(id);
        $(".implementation_activeobject").data("type", "line");


        $.get(statr_link + "modules/mod_nodeproperties/index.jsp?pro_id=" + id + "&more=" + getlen(flightPath), function(r_data) {

            $("#Properties_con").html(r_data);

        })

        $(".implementation_edit").removeClass("dis");
        $(".implementation_delete").removeClass("dis");
    });
    //hide on mouseout
    google.maps.event.addListener(flightPath, 'mouseout', function() {



        $(".showtool").html("");
        $(".showtool").hide();
    });


    //click to open pop up with line properties
    google.maps.event.addListener(flightPath, 'click', function() {









        $.get(statr_link + "ajax/implementation/mapDetail.jsp?pro_id=" + id + "&km=" + getlen(flightPath), function(retdata_group) {

            $(".showtool").show();
            $("body").mousemove(function(e) {
                var XX = e.pageX + 15;
                var YY = e.pageY + 15;
                var data = "<div style=\"left:" + XX + "px;top:" + YY + "px;\" class=\"mytoo\">" + retdata_group + "</div>";
                $(".showtool").html(data);


            })
        });

    });




    return flightPath;


}

//<editor-fold defaultstate="collapsed" desc="other">


function newGroupTypeActions() {

    $(".newGroupTypeok").click(function() {


        var tpbname = $(".TypeName").val();


        var vars = "TypeName=" + tpbname
                + "&TypeIcon=" + $(".newGroupTypeIcon").val()
                + "&Description=" + $(".newGroupTypeDescription").val()
                + "&sataus=createType";



        var nylink = "ajax/views/groupView/create.jsp?" + vars
        $.get(nylink, function(Data) {

            var Data = Data.split("__");
            if ($.trim(Data[0]) == "Saved") {


                $(".groupType").append("<option value='" + Data[1] + "'>" + tpbname + "</option>")
                closeWindows("newGroupType");
            }
        })



    })



    $(".newGroupTypeCancel").click(function() {
        closeWindows("newGroupType");
    })


}


function newGroupType(imageid, floder) {



    var data = "<script>newGroupTypeActions();</script><div class=\"view_pre mydata\">";
    data += CreateFiled("Type Name", "text", "TypeName", "");
    data += CreateFiled("Icon", "image", "newGroupTypeIcon", "", "", "", imageid, floder);

    data += CreateFiled("Description", "textarea", "newGroupTypeDescription", "");

    data += "</div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "newGroupTypeok");
    data += CreateFiled("Cancel", "button", "newGroupTypeCancel", "", "_50");
    data += "</div>";
    return data;


}


function newGroupActions(LOCATION_ID, MODEL_ID) {



    $(".new_bt").click(function() {


        $.get("ajax/views/groupView/getTypes.jsp", function(Types) {
            closeWindows("view_paramters_windows");

            makeWinDows("New Group", "newGroup", newGroupWindwos(Types, LOCATION_ID, MODEL_ID), 300, 150, 350, null);





        })





    })


}





function reloadimplementation(type, linkData) {


    var x2 = new Array(defajax2);
    ajaxAbort(x2);


    // ?alias=xact&model_id=1331137294486
    var link = '?alias=xact&model_id=' + linkData;



    if (type != "model") {

        var link = '?alias=xact&model_id=' + linkData;


        defajax2 = loadAjax("modules/mod_advance_implementation/index.jsp" + link, ".modem", "start,main");
    } else {
        var link = '?alias=xact&model_id=' + linkData;

        defajax2 = loadAjax("ajax/engine/get_model_1.jsp" + link + "&module=implementation", ".modem", "start,main");

    }

}

function mackeAnActaive() {

    //closeWindows("Creat_Cloud");


    createStatus = 0;
    $(".newMarker").removeClass("on");




    creatLineSataus = 0;
    $(".newLine").removeClass("on");


    $(".newClouds").removeClass("on");




}



function edit_Line(mod_id, m1Data, m2Data, values) {

    var options = "None__None;MPLS__MPLS;X.25__X.25;ATM-wan__ATM-wan";

    var f = new FormClass("edit_Line");
    f.fields = [
        {
            "title": "From Groups:",
            "type": "select",
            "options": m1Data,
            "name": "create_Line_Fromline",
            "value": values[14], pClass: "_50"

        },
        {
            "title": "To Groups:",
            "type": "select",
            "options": m2Data,
            "name": "create_Line_Toline",
            "value": values[15], pClass: "_50"
        }
        , {
            "title": "From Nodes:",
            "type": "select", "options": "",
            "name": "nformid",
            "value": values[4], pClass: "_50"
        },
        {
            "title": "To Nodes:",
            "type": "select", "options": "",
            "name": "ntoid",
            "value": values[5], pClass: "_50"
        },
        {
            "title": "Error Rate (probability/bit)",
            "type": "number",
            "name": "errorrate",
            "value": values[2], pClass: "_100"
        },
        {
            "title": "Overhead:",
            "type": "number",
            "name": "overhead",
            "value": values[6]
        }, {
            "title": "Length(km):",
            "type": "number",
            "name": "length",
            "value": values[3]
        }, {
            "title": "Throughput (kbps):",
            "type": "number",
            "name": "throughput",
            "value": values[9]
        },
        {
            "title": "Protocal:",
            "type": "select",
            "options": options,
            "name": "protocol",
            "value": values[7]
        },
        {
            "title": "Active:",
            "type": "checkbox",
            "name": "active",
            "value": values[8]
        }

    ];


    var selectType = f._renderhtml();

    f.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "type": "button",
            "name": "create_Line_ok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "create_Line_step2_cancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];

    f.events = [
        {action: "send",
            options: {modid: mod_id, status: "editline", id: values[0], node1: nodid_1, node2: nodid_2},
            url: "ajax/implementation/create.jsp",
            event: "click",
            eventClass: "create_Line_ok",
            done: function(data) {

                f.closeWindow();


                mackeAnActaive();
                theNewLine = null;
                creatLine_1 = 0;


            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "create_Line_step2_cancel"

        }, {
            "event": "change"
            , "eventClass": "create_Line_Toline", js: function(data) {
                updateNodes($(".create_Line_Toline").val(), ".ntoid");

            }
        }, {
            "event": "change"
            , "eventClass": "create_Line_Fromline", js: function(data) {


                updateNodes($(".create_Line_Fromline").val(), ".nformid");


            }

        }
    ];


    var footer = f._renderhtml();
    f.windows = {
        "class": "edit_Line_setp",
        "title": "Edit Line",
        "content": selectType,
        "footerContent": footer,
        load: function() {
            updateNodes($(".create_Line_Fromline:first").val(), ".nformid", values[4]);
            updateNodes($(".create_Line_Toline:first").val(), ".ntoid", values[5]);

        },
        "x": "200",
        "y": "90",
        width: "600", height: "300",
        position: "Center"
    };
    f._renderWindows();
}



function create_Line_setp2(mod_id, m1Data, m2Data) {

    var options = "None__None;MPLS__MPLS;X.25__X.25;ATM-wan__ATM-wan";

    var f = new FormClass("create_Line");
    f.fields = [
        {
            "title": "From Groups:",
            "type": "select",
            "options": m1Data,
            "name": "create_Line_Fromline",
            "value": "0", pClass: "_50"
        },
        {
            "title": "To Groups:",
            "type": "select",
            "options": m2Data,
            "name": "create_Line_Toline",
            "value": "0", pClass: "_50"
        }
        , {
            "title": "From Nodes:",
            "type": "select", "options": "",
            "name": "nformid",
            "value": "0", pClass: "_50"
        },
        {
            "title": "To Nodes:",
            "type": "select", "options": "",
            "name": "ntoid",
            "value": "0", pClass: "_50"
        },
        {
            "title": "Error Rate (probability/bit)",
            "type": "number",
            "name": "errorrate",
            "value": "0.0001", pClass: "_100"
        },
        {
            "title": "Overhead:",
            "type": "number",
            "name": "overhead",
            "value": "0.0001"
        }, {
            "title": "Length(km):",
            "type": "text",
            "name": "length",
            "value": calcDistance(createLine_node1postion, createLine_node2postion)
        }, {
            "title": "Throughput (kbps):",
            "type": "number",
            "name": "throughput",
            "value": "100000"
        },
        {
            "title": "Protocal:",
            "type": "select",
            "options": options,
            "name": "protocol",
            "value": "0"
        },
        {
            "title": "Active:",
            "type": "checkbox",
            "name": "active",
            "value": "1"
        }

    ];


    var selectType = f._renderhtml();

    f.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "type": "button",
            "name": "create_Line_ok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "create_Line_step2_cancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];

    f.events = [
        {action: "send",
            options: {modid: mod_id, status: "addline", node1: nodid_1, node2: nodid_2},
            url: "ajax/implementation/create.jsp",
            event: "click",
            eventClass: "create_Line_ok",
            done: function(data) {

                f.closeWindow();
                reloadimplementation("model", mod_id);
                var image12 = new google.maps.MarkerImage(MarkerImage,
                        new google.maps.Size(parseFloat(MarkerImage_width), parseFloat(MarkerImage_height)),
                        new google.maps.Point(0, 0),
                        new google.maps.Point(10, 29));
                createLine_marker1.setIcon(image12);
                createLine_marker2.setIcon(image12);
                mackeAnActaive();
                theNewLine = null;
                creatLine_1 = 0;


            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "create_Line_step2_cancel"
            , "Callback": function(t) {


                reloadimplementation("model", mod_id);



            }

        }, {
            "event": "change"
            , "eventClass": "create_Line_Toline", js: function(data) {
                updateNodes($(".create_Line_Toline").val(), ".ntoid");

            }
        }, {
            "event": "change"
            , "eventClass": "create_Line_Fromline", js: function(data) {


                updateNodes($(".create_Line_Fromline").val(), ".nformid");


            }

        }
    ];


    var footer = f._renderhtml();
    f.windows = {
        "class": "create_Line_setp2",
        "title": "create Line",
        "content": selectType,
        "footerContent": footer,
        load: function() {
            updateNodes($(".create_Line_Fromline:first").val(), ".nformid");
            updateNodes($(".create_Line_Toline:first").val(), ".ntoid");

        },
        "x": "200",
        "y": "90",
        width: "600", height: "300",
        position: "Center"
    };
    f._renderWindows();
}



function updateNodes(groupid, nodesclass, value) {


    $.get("ajax/implementation/getnodes.jsp?id=" + groupid + "&value=" + value, function(rdata) {

        $(nodesclass).html(rdata);



    })


}

function initialize(longtd, lattd, zoom, mmod_id, divID, cid) {



    if (mmod_id != null && mmod_id != undefined && mmod_id != "undefined") {

        mod_id = mmod_id;

    }

    var myLatlng = new google.maps.LatLng(longtd, lattd);
    var myOptions = {
        zoom: zoom,
        center: new google.maps.LatLng(30.902225, 30.146484),
        mapTypeControl: true,
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
            position: google.maps.ControlPosition.TOP_CENTER
        },
        overviewMapControl: true,
        overviewMapControlOptions: {
            opened: true
        },
        zoomControl: true,
        zoomControlOptions: {
            style: google.maps.ZoomControlStyle.LARGE
        },
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }




    map = new google.maps.Map(document.getElementById(divID), myOptions);

    $(function() {

        $("#div_imp").click(function() {


            map.setZoom(map.getZoom() - 1);
            map.setZoom(map.getZoom() + 1);
        })


    })

    google.maps.event.addListener(map, 'mousemove', function(event) {
        $(".showtool").html("");
        $(".showtool").hide();
    });


    google.maps.event.addListener(map, 'click', function(event) {
        if (createStatus == 1) {



            create_Marker(event.latLng.lat(), event.latLng.lng(), cid, mod_id)


            placeMarker(event.latLng);



        }

    });















    function placeMarker(location) {



        var image1 = new google.maps.MarkerImage(marker_new,
                new google.maps.Size(parseFloat(MarkerImage_width), parseFloat(MarkerImage_height)),
                new google.maps.Point(0, 0),
                new google.maps.Point(8, 5));

        var marker = new google.maps.Marker({
            position: location,
            map: map,
            icon: image1
        });

        // map.setCenter(location);


        thnewmarker = marker;



        google.maps.event.addListener(marker, "click", function(event) {
            if (creatLineSataus == 1) {
                if (creatLine_1 == 0) {



                    creatLine_1 = event.latLng.lat() + "," + event.latLng.lng();
                    nodid_1 = marker.id;



                    createLine_node1postion = event.latLng;


                } else {
                    var myline = creatLine_1.split(",");

                    create_Line(mod_id);

                    createLine_node2postion = event.latLng

                    addNewLineToMap(myline[0], myline[1], event.latLng.lat(), event.latLng.lng(), 2, map, "#CC0000", "", "");
                    nodid_2 = marker.id;

                    creatLine_1 = 0;

                }
            }

        })








    }

    return   map;

}


function addLatLng(event) {

    var path = poly.getPath();

    path.push(event.latLng);


    var marker = new google.maps.Marker({
        position: event.latLng,
        title: '#' + path.getLength(),
        map: map
    });

}

function deleteButonAction(e) {
    var keynum
    if (window.event) // IE
    {
        keynum = e.keyCode
    }
    else if (e.which) // Netscape/Firefox/Opera
    {
        keynum = e.which
    }
    if (keynum == 46) {
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
        point = new GLatLng(place.Point.coordinates[1], place.Point.coordinates[0]);
        marker = new GMarker(point);
        map.addOverlay(marker);
        marker.openInfoWindowHtml(
                '<b>latlng:</b>' + place.Point.coordinates[1] + "," + place.Point.coordinates[0] + '<br>' +
                '<b>Address:</b>' + place.address + '<br>' +
                //'<b>Accuracy:</b>' + place.AddressDetails.Accuracy + '<br>' +
                '<b>Country code:</b> ' + place.AddressDetails.Country.CountryNameCode);
    }
}






function ImageExist(url)
{
    var img = new Image();
    img.src = url;
    return img.height != 0;
}


function GetCludes(longt, lat, id, image, width, height, mp, name, color, mid, num, floderUrl) {


    // alert (width+"\n"+height);

    num++;


    image = image.replace(".jpg", "");
    var myLatlng = new google.maps.LatLng(longt, lat);

    // MarkerImage_d_g = "https://www.acrtek-lab.com/XActimages/cloud_view/" + image;

    MarkerImage_d_g = floderUrl + "cloud_view/" + image;





    if (ImageExist(MarkerImage_d_g) == false) {



        MarkerImage_d_g = 'images/uploads/defaultcloud.png';




    }




    /*
     var image1 = new google.maps.MarkerImage(MarkerImage_d_g,
     new google.maps.Size(width,height),
     new google.maps.scaledSize(width,height),
     
     new google.maps.Point(0,0),
     new google.maps.Point(8,5));*/


    var image1 = new google.maps.MarkerImage(MarkerImage_d_g, new google.maps.Size(width,
            height),
            new google.maps.Point(0, 0), new google.maps.Point(12, 18), new google.maps.Size(width, height));


    var spherical = google.maps.geometry.spherical;

    var distance = 70000;

    var heading = 360 / num;


    var endPoint = spherical.computeOffset(myLatlng, distance, heading);


    marnum++;

    var cloud = new google.maps.Marker({
        draggable: true,
        position: endPoint,
        map: mp,
        icon: image1,
        title: name + "",
        name: mid,
        id: id
    });




    google.maps.event.addListener(cloud, 'dblclick', function(evt) {

        var ids = id.split("/");


        $(".im_tabs ul #" + ids[0]).remove();

        $(".im_divs ." + ids[0]).remove();

        //


        var link = "?model_id=" + ids[2] + "&cloudid=" + ids[0];

        $.get("modules/com_gmap/index.jsp" + link, function(data) {

            $(".im_divs").append("<div class=' formoer imps_vids " + ids[0] + "' >" + data + "</div>")


            $(".im_tabs ul").append(" <li onClick=\"thActions('" + ids[0] + "');\" id='" + ids[0] + "' style=\"border-bottom:4px solid #" + color + "\" class=\"formoer im_tabs_li \"><span>" + name + "</span></li><script>afterim('" + ids[0] + "');</script>");
            $(".im_divs").attr("style", "border:4px solid #" + color);
            $(".view_immap").show();

        })





    });

}



$(function() {




    $(".im_tabs_li").click(function() {

        $(".im_tabs_li").removeClass("act");
        $(this).addClass("act");

    })

    $(".view_imglobal").click(function() {

        $(".im_divs .imps_vids").css("z-index", "0");

        $(".do_group").css("z-index", "0");
        $(".imp_viewData").css("z-index", "1");


        $(".im_divs").attr("style", "border:4px solid #000000;");

    })
})


function thActions(id) {


    afterim(id);


}

function showPointAddressbayGroup(longt, lat, id, image, width, height, mp, name, x, y, mid, num) {


    var myLatlng = new google.maps.LatLng(longt, lat);

    MarkerImage_d_g = 'images/' + image;



    var image1 = new google.maps.MarkerImage(MarkerImage_d_g,
            new google.maps.Size(parseFloat(MarkerImage_width), parseFloat(MarkerImage_height)),
            new google.maps.Point(0, 0),
            new google.maps.Point(8, 5));





    // create marker
    var spherical = google.maps.geometry.spherical;

    var distance = 70000;

    var heading = 360 / num * marnum;


    var endPoint = spherical.computeOffset(myLatlng, distance, heading);




    marnum++;

    Markers[marnum] = new google.maps.Marker({
        draggable: true,
        position: endPoint,
        map: mp,
        icon: image1,
        title: name + " (" + image.replace(".png", "") + ") ",
        name: mid,
        id: id
    });
}

function mardfunction(mp, sid) {


    for (i = 1; i < Markers.length; i++) {
        mackdEvent(i, mp, sid);

    }




}

function mackdEvent(marnum, mp, sid) {




    google.maps.event.addListener(Markers[marnum], "drag", function(evt) {






        for (i = 1; i < Circles.length; i++) {



            if (Circles[i].getBounds().contains(Markers[marnum].getPosition()) && Circles[i].id != Markers[marnum].name) {


                Circles[i].setOptions({
                    fillOpacity: 0.7
                });








            } else {

                Circles[i].setOptions({
                    fillOpacity: 0.1
                });


            }


        }



    });





    google.maps.event.addListener(Markers[marnum], "dragend", function(evt) {



        var th_id = "";


        for (i = 1; i < Circles.length; i++) {



            if (Circles[i].getBounds().contains(Markers[marnum].getPosition()) && Circles[i].id != Markers[marnum].name) {

                th_id = Circles[i].id;




                groupMove(Markers[marnum].id, th_id, sid);


            }


        }


        mp.setCenter(Markers[marnum].position);
    });

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

function removeLine() {
    if (selectedLine == null)
        alert('select line first to erase !');
    else if (confirm('Are you sure you want to delete selected line?')) {
        map.removeOverlay(selectedLine);
        //remove it from the Lines Array
        for (index = 0; index < linesArray.length; index++) {
            tempPoly = linesArray[index];
            //var allPoints = tempPoly.getPath().getArray();
            //for (var i = 0; i < allPoints.length - 1; i++) {
            bounds = tempPoly.getBounds();
            p1 = bounds.getSouthWest();
            p2 = bounds.getNorthEast();
            if (tempPoly == selectedLine) {
                // linesArray[index] = null;
                linesArray.splice(index, 1);
                break;
            }


            //}
        }
        selectedLine = null;
    }
}

function saveMap() {
    //this function is used to save all lines stored on linesArray

    for (index = 0; index < linesArray.length; index++) {
        tempPoly = linesArray[index];
        if (tempPoly != null) {
            //var allPoints = tempPoly.getPath().getArray();
            //for (var i = 0; i < allPoints.length - 1; i++) {
            bounds = tempPoly.getBounds();
            p1 = bounds.getSouthWest();
            p2 = bounds.getNorthEast();
            alert('line<' + index + '> Details :- \nP1-->Latitude = ' + p1.lat() + ',\nP1-->Langitude =' + p1.lng() + '\nP2-->Latitude = ' + p2.lat() + ',\nP2-->Langitude =' + p2.lng());
        }
    }
}

//calculates distance between two points in km's
function calcDistance(p1, p2) {
    return (google.maps.geometry.spherical.computeDistanceBetween(p1, p2) / 1000).toFixed(2);
}

function removealllins(markersArray, map) {

    if (markersArray) {
        for (var i in markersArray) {


            if (markersArray[i]) {
                markersArray[i].setMap(null);
            }
        }
        markersArray.length = 0;
    }


}

google.maps.LatLng.prototype.kmTo = function(a) {
    var e = Math, ra = e.PI / 180;
    var b = this.lat() * ra, c = a.lat() * ra, d = b - c;
    var g = this.lng() * ra - a.lng() * ra;
    var f = 2 * e.asin(e.sqrt(e.pow(e.sin(d / 2), 2) + e.cos(b) * e.cos
            (c) * e.pow(e.sin(g / 2), 2)));
    return f * 6378.137;
}

function getlen(flightPath) {


    var a = flightPath.getPath();
    var len = a.getLength();
    var dist = 0;
    for (var i = 0; i < len - 1; i++) {
        dist += a.getAt(i).kmTo(a.getAt(i + 1));
    }
    return dist;

}

function getmarkerpostion(id, type) {

    var reyr = "";
    for (i = 1; i < Markers.length; i++) {
        if (Markers[i].id == id) {
            //lng();

            // alert (id);


            if (type == "lat") {

                reyr = Markers[i].getPosition().lat();
            } else {

                reyr = Markers[i].getPosition().lng();



            }



        }




    }

    return  reyr;

}

function defStatus() {


    $(".com_viewSataus").val("locations");
    $(".com_viewSataus").hide();


    $(".forloctions").show();
    $(".forgoups").hide();

}

function defAdvStatus() {


    $(".com_viewSataus").val("groups");
    $(".com_viewSataus").show();
    removealllins(all_polylines, map);

    $(".forloctions").hide();
    $(".forgoups").show();
}

var linesStatus = "";







function select(buttonId) {
    // document.getElementById("line_b").className="unselected";
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

function startLine(map, color, image, x, y, width, height, linewidth) {
    // alert (x+","+y);

    var polyOptions = {
        strokeColor: '#' + color,
        strokeOpacity: 1.0,
        strokeWeight: linewidth
    }
    poly = new google.maps.Polyline(polyOptions);
    poly.setMap(map);

    google.maps.event.addListener(map, 'click', addLatLng);
    google.maps.event.addListener(map, 'click', addPoint);



    function addPoint(event) {
        path.insertAt(path.length, event.latLng);


        alert(x + "," + y);
        var image1 = new google.maps.MarkerImage('images/' + image,
                new google.maps.Size(width, height),
                new google.maps.Point(x, y));


        var marker = new google.maps.Marker({
            position: event.latLng,
            map: map,
            icon: image1,
            draggable: true
        });
        markers.push(marker);
        marker.setTitle("#" + path.length);

        google.maps.event.addListener(marker, 'click', function() {
            marker.setMap(null);
            for (var i = 0, I = markers.length; i < I && markers[i] != marker; ++i)
                ;
            markers.splice(i, 1);
            path.removeAt(i);
        }
        );

        google.maps.event.addListener(marker, 'dragend', function() {
            for (var i = 0, I = markers.length; i < I && markers[i] != marker; ++i)
                ;
            path.setAt(i, marker.getPosition());
        }
        );
    }
}

function addLatLng(event) {

    var path = poly.getPath();

    path.push(event.latLng);


    var marker = new google.maps.Marker({
        position: event.latLng,
        title: '#' + path.getLength(),
        map: map
    });
}

function newMarkerStatus(aaa) {

    if (createStatus == 0) {

        mackeAnActaive();
        createStatus = 1;

        $(aaa).addClass("on");
    } else {



        mackeAnActaive();

    }

}

function newLineStatus(aaa) {

    if (creatLineSataus == 0) {

        mackeAnActaive();
        creatLineSataus = 1;
        $(aaa).addClass("on");
    } else {

        mackeAnActaive();

    }

}


var all_polylines;
function colorLinne(map, mycolor, defmywidth, image, x, y, width, height, myclass) {





    var Class = "." + myclass;









    $(Class + " .line_b").click(function() {
        startLine(map, color, image, x, y, width, height, mywidth);
    });

    var color = "#" + mycolor;
    var mywidth = defmywidth;


    all_polylines = domylin(map, color, mywidth);

    $(Class + " .line_nurmal").click(function() {

        removealllins(all_polylines, map);
        mywidth = defmywidth;
        all_polylines = [];
        all_polylines = domylin(map, color, mywidth);
    });



    $(Class + " .line_minus").click(function() {
        removealllins(all_polylines, map);
        mywidth -= 1;
        all_polylines = [];
        all_polylines = domylin(map, color, mywidth);
    });
    $(Class + " .line_plus").click(function() {
        removealllins(all_polylines, map);
        mywidth += 1;
        all_polylines = [];

        all_polylines = domylin(map, color, mywidth);
    });



    $(Class + " .newMarker").click(function() {


        newMarkerStatus(Class + " .newMarker");
    });




    $(Class + " .newLine").click(function() {


        newLineStatus(Class + " .newMarker");
    });


    $(Class + '  .colorLines').css("background-color", color);
    $(Class + '  .colorLines').val(color);


    $(Class + '  .colorLines').ColorPicker({
        onSubmit: function(hsb, hex, rgb, el) {
            color = "#" + hex;
            $(el).val(hex);
            $(el).ColorPickerHide();
            $(el).css("background-color", color);


            removealllins(all_polylines, map);
            all_polylines = [];
            all_polylines = domylin(map, color, mywidth);
        },
        onBeforeShow: function() {
            $(this).ColorPickerSetColor(this.value);
        }
    })
            .bind('keyup', function() {
                $(this).ColorPickerSetColor(this.value);
            });
}

var all_polylinesg;






/*
 
 function create_Marker_do(cid) {
 
 $(".create_Marker_ok").click(function() {
 
 var link2 = "?modid=" + $(".create_Marker_modid").val()
 + "&status=addm&name=" + $(".create_Marker_LoctionName").val()
 + "&lng=" + $(".create_Marker_Longitude").val()
 + "&lot=" + $(".create_Marker_Latitude").val() + "&cid=" + cid;
 $.get("ajax/implementation/create.jsp" + link2, function(r_data1) {
 
 thnewmarker.id = $.trim(r_data1);
 
 mackeAnActaive();
 
 
 
 closeWindows("create_Marker");
 thnewmarker = null;
 
 })
 
 })
 
 
 
 
 
 }*/

//<editor-fold defaultstate="collapsed" desc="Windows">



/*
 $(document).on("click", ".th_close", function() {
 
 var dd = $(this).parent(".button").attr("id");
 $(this).parent(".button").remove();
 $("." + dd).remove();
 $(".group_tabs .button").removeClass("act");
 $(".group_tabs  .button").last().addClass("act");
 var lat = $(".group_tabs  .button").last().attr("id");
 $("." + lat).show();
 });
 */






function newGroupWindows(htmldata, LOCATION_ID, ids, sid, cloudID, cloudcolor, cloudName) {



    $(document).on("click", ".getgroup", function() {

        $(".getgroup").removeClass("selected");

        $(this).addClass("selected");


    })





    $(document).on("dblclick", ".getgroup", function() {

        var myid = $(this).attr("id");


        $(".im_divs .group" + cloudID + "").remove();
        $(".im_tabs ul #group" + cloudID).remove();


        addCloude(myid, cloudName, cloudcolor, cloudID);







        $(".spreview").hide();
        $(".cpreview").hide();

        $(".gpreview").show();
        $(".view_immap").show();

        // $(".div_result").hide();


        $("#div_group").click();

        ///////////////////////////////////////////////////
        var pw = ".newGroupWindowswidows";

        $(pw).parent().remove();



    })

    var f = new FormClass("newGroupWindows");
    f.fields = [{
            "title": "Location Name:",
            "type": "div",
            "name": "name",
            value: htmldata
        }];


    var selectType = f._renderhtml();

    f.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "type": "button",
            "name": "Groups_new",
            "value": "New"
        },
        {
            "title": "delete",
            "type": "button",
            "name": "Groups_delete",
            "value": "Delete"
        },
        {
            "type": "enddiv"
        }
    ];

    f.events = [
        {
            "event": "click",
            "eventClass": "Groups_new",
            js: function(data) {


                $.get("ajax/views/groupView/getTypes.jsp", function(Types) {


                    newGroupWindwos(Types, LOCATION_ID, ids, htmldata, LOCATION_ID, ids[3], sid, cloudID, cloudcolor, cloudName);


                })

            }}, {
            "event": "click"
            , "eventClass": "Groups_delete"
            , js: function() {

                var id = $(".getgroup.selected").attr("id");
                ;
                if (id != "" && id != null)
                {


                    if (confirm("Are you sure you want to delete this group?")) {
                        var ids = id.split("/");

                        $.get("ajax/views/groupView/delete.jsp?id=" + ids[1], function(Types) {


                            if ($.trim(Types) === "") {
                                $(".getgroup.selected").remove();

                            } else {

                                alert("Error: Cannot delete the selected group. Please make sure the group is empty so it can be deleted.");

                            }



                        });

                    }


                } else {
                    alert("Select group to delete first!");


                }






            }

        }
    ];


    var footer = f._renderhtml();
    f.windows = {
        "class": "Groups",
        "title": "Groups",
        "content": selectType,
        "footerContent": footer,
        "x": "300",
        "y": "90",
        width: "200", height: "240"
    };
    f._renderWindows();
}



function create_Marker(latVal, logLav, cid, mod_id) {

    var f = new FormClass("create_Marker");
    f.fields = [
        {
            "title": "Location Name:",
            "type": "text",
            "name": "name",
            required: "required"
        }, {
            "title": "Latitude:",
            "type": "text",
            "name": "lot",
            value: latVal,
            required: "required"
        }, {
            "title": "Longitude:",
            "type": "text",
            "name": "lng",
            value: logLav,
            required: "required"
        }, {
            "title": "modid",
            "type": "hidden",
            "name": "modid",
            value: mod_id
        }
        , {
            "title": "cid",
            "type": "hidden",
            "name": "cloudid",
            value: cid
        }

    ];
    var selectType = f._renderhtml();

    f.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "type": "button",
            "name": "create_Marker_ok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "create_Marker_cancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    f.events = [
        {
            "action": "send",
            "options": {status: "create"},
            "url": "ajax/implementation/create.jsp",
            "event": "click",
            "eventClass": "create_Marker_ok",
            done: function(data) {
                thnewmarker.id = $.trim(data);
                mackeAnActaive();
                thnewmarker = null;

                f.closeWindow();
                reloadimplementation("model", mod_id);
            }

        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "create_Marker_cancel",
            Callback: function(t) {
                reloadimplementation("model", mod_id);
            }

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "create_Marker",
        "title": "Create Marker",
        "content": selectType,
        "footerContent": footer,
        "x": "500",
        "y": "90",
        width: "500", height: "140",
        position: "Center"
    };
    f._renderWindows();





    // return data;
}






function edit_Marker(namen, latVal, logLav, mod_id, id) {







    var f = new FormClass("edit_Marker");
    f.fields = [
        {
            "title": "Location Name:",
            "type": "text",
            "name": "name"
            , value: namen,
            required: "required"
        }, {
            "title": "Latitude:",
            "type": "text",
            "name": "lot",
            value: latVal,
            required: "required"
        }, {
            "title": "Longitude:",
            "type": "text",
            "name": "lng",
            value: logLav,
            required: "required"
        }, {
            "title": "modid",
            "type": "hidden",
            "name": "modid",
            value: mod_id
        }
    ];
    var selectType = f._renderhtml();

    f.fields = [
        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "type": "button",
            "name": "edit_Marker_ok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "edit_Marker_cancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    f.events = [
        {
            "action": "send",
            "options": {status: "editloction", ID: id},
            "url": "ajax/implementation/create.jsp",
            "event": "click",
            "eventClass": "edit_Marker_ok",
            done: function(data) {


                f.closeWindow();
                reloadimplementation("model", mod_id);
            }

        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "edit_Marker_cancel",
        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "edit_Marker",
        "title": "Edit Marker",
        "content": selectType,
        "footerContent": footer,
        "x": "500",
        "y": "90",
        width: "500", height: "140",
        position: "Center"
    };
    f._renderWindows();





    // return data;
}





//</editor-fold>
//</editor-fold>
