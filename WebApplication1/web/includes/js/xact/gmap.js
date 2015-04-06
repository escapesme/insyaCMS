/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


var statr_link = "/Xact/";
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


var theNewLine = null



function reloadimplementation(type, linkData) {


    var x2 = new Array(defajax2);
    ajaxAbort(x2);


    // ?alias=xact&model_id=1331137294486
    if (type != "model") {

        var link = '?alias=xact&model_id=' + linkData;

        defajax2 = loadAjax("modules/mod_advance_implementation/index.jsp" + link, ".modem", "start,main");
    } else {
        var link = '?alias=xact&model_id=' + linkData;

        defajax2 = loadAjax("ajax/engine/get_model_1.jsp" + link + "&module=implementation", ".modem", "start,main");

    }

}

function mackeAnActaive() {

    closeWindows("Creat_Cloud");


    createStatus = 0;
    $(".newMarker").removeClass("on");




    creatLineSataus = 0;
    $(".newLine").removeClass("on");


    $(".newClouds").removeClass("on");



   $(".newClouds").removeClass("on");







}

function createCloudsData(modid, locations, imageid, folder) {



    var data = "<script>createCloudsAction();</script><div class=\"view_pre mydata\">";
    data += CreateFiled("Name", "text", "createCloudsDataTitle", "");
    data += CreateFiled("Icon", "image", "createCloudsDataIcon", "", "", "", imageid, folder);
    data += CreateFiled("Color", "color", "createCloudsDatacolor", "");
    data += CreateFiled("Description", "textarea", "createCloudsDescription", "");
    data += CreateFiled("Private", "radio", "createCloudsstatus", "1", "_50");
    data += CreateFiled("Public", "radio", "createCloudsstatus", "0", "_50");
    data += CreateFiled("Location", "list", "createCloudsloctionId", "", "", locations);
    data += CreateFiled("", "hidden", "createCloudsmodID", modid);

    data += "</div><div class=\"do_center\">";
    data += CreateFiled("Ok", "button", "createCloudsmodok");
    data += CreateFiled("Cancel", "button", "createCloudsmodCancel");
    data += "</div>";

    return data;


}

function createCloudsAction() {




    $(".createCloudsmodok").click(function() {

        var link = "?title=" + $(".createCloudsDataTitle").val()
                + "&color=" + $(".createCloudsDatacolor").val()
                + "&icon=" + $(".createCloudsDataIcon").val()
                + "&Description=" + $(".createCloudsDescription").val()
                + "&status=" + $(".createCloudsstatus").val()
                + "&loctionId=" + $(".createCloudsloctionId").val()
                + "&modID=" + $(".createCloudsmodID").val();


        var da = requireFields([".createCloudsDataTitle"]);


        if (requireFields([".createCloudsDataTitle", ".createCloudsDataTitle"]) != false) {


            $.get("ajax/implementation/saveCloud.jsp" + link, function(retDate) {

                closeWindows("Creat_Cloud");

                mackeAnActaive();
                reloadimplementation("model", $(".createCloudsmodID").val());

            })
        }








    })
    $(".createCloudsmodCancel").click(function() {
        closeWindows("Creat_Cloud");

        mackeAnActaive();
    })




}

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

    $(".create_Marker_cancel").click(function() {




        thnewmarker.setMap(null);


        thnewmarker = null;
        closeWindows("create_Marker");
    })



}

function create_Marker(latVal, logLav, cid) {


    var data = "<script>create_Marker_do('" + cid + "');</script><div class=\"view_pre mydata\">";
    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\">Location Name:</div><div class=\"frm_input\"><input type=\"text\" class=\"create_Marker_LoctionName\" value='' /></div></div>";

    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\">Latitude:</div><div class=\"frm_input\"><input type=\"text\" class=\"create_Marker_Latitude\" value='" + latVal + "' /></div></div>";
    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\">Longitude:</div><div class=\"frm_input\"><input type=\"text\" class=\"create_Marker_Longitude\" value='" + logLav + "' /></div></div>";

    data += " <input  type='hidden' class=\"create_Marker_modid\" value='" + mod_id + "' /></div></div>";

    data += "</div><\n\
<div class=\"do_center\"><input type=\"button\" class=\"create_Marker_ok\"  value=\"Ok\"> \n\
<input type=\"button\" class=\"create_Marker_cancel\"  value=\"Cancel\"></div> ";

    return data;
}

function create_Line_setp2_do(mod_id, nformid, ntoid) {


    //alert (nformid+"::"+ntoid);


    $(".create_Line_ok").click(function() {
        var myact = "0";

        if ($('.create_Line_active').is(':checked')) {
            myact = "1";
        }



        var link2 = "?modid=" + $(".create_Line_modid").val();
        link2 += "&status=addline";
        link2 += "&nformid=" + nformid;
        link2 += "&ntoid=" + ntoid;
        link2 += "&node1=" + nodid_1;
        link2 += "&node2=" + nodid_2;
        link2 += "&errorrate=" + $(".create_Line_ErrorRate").val();
        link2 += "&length=" + $(".create_Line_Length").val();
        link2 += "&overhead=" + $(".create_Line_Overhead").val();
        link2 += "&throughput=" + $(".create_Line_Throughput").val();
        link2 += "&protocol=" + $(".create_Line_Protocal").val();
        link2 += "&active=" + myact



        $.get("ajax/implementation/create.jsp" + link2, function(r_data1) {

            var image12 = new google.maps.MarkerImage(MarkerImage,
                    new google.maps.Size(MarkerImage_width, MarkerImage_height),
                    new google.maps.Point(0, 0),
                    new google.maps.Point(10, 29));
                    
            createLine_marker1.setIcon(image12);
            createLine_marker2.setIcon(image12);


            //alert (r_data1)
            closeWindows("Creat_Line_setp2");

            mackeAnActaive();
            theNewLine = null;
            creatLine_1 = 0;







        })


    })

    $(".create_Line_step2_cancel").click(function() {

        var image12 = new google.maps.MarkerImage(MarkerImage,
                new google.maps.Size(MarkerImage_width, MarkerImage_height),
                new google.maps.Point(0, 0),
                new google.maps.Point(10, 29));

        closeWindows("Creat_Line_setp2");
        theNewLine.setMap(null);
        theNewLine = null;
        creatLine_1 = 0;

        createLine_marker1.setIcon(image12);
        createLine_marker2.setIcon(image12);
    })



}

function create_Line_setp2(mod_id, nfrom, nto) {

    var data = "<script>create_Line_setp2_do('" + mod_id + "','" + nfrom + "','" + nto + "');</script><div class=\"view_pre mydata\">";
    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\">Error Rate:</div><div class=\"frm_input\"><input type=\"text\" class=\"create_Line_ErrorRate\" value='0' /></div></div>";
    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\">Overhead:</div><div class=\"frm_input\"><input type=\"text\" class=\"create_Line_Overhead\" value='0' /></div></div>";
    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\"> Length(km):</div><div class=\"frm_input\"><input type=\"text\" class=\"create_Line_Length\" value='" + calcDistance(createLine_node1postion, createLine_node2postion) + "' /></div></div>";
    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\">Throughput (kits/sec):</div><div class=\"frm_input\"><input type=\"text\" class=\"create_Line_Throughput\" value='100' /></div></div>";
    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\">Protocal:</div>\n\
<div class=\"frm_input\"><select  class=\"create_Line_Protocal\"  >\n\
<option>None</option> \n\
<option>RXN</option> \n\
<option>MPLS</option> \n\
<option>Ethernet</option> \n\
<option>Token Ring</option> \n\
<option>X.25</option> \n\
<option>ATM-lan</option> \n\
<option>ATM-wan</option> \n\
</select></div></div>";



    data += " <div class=\"frm_row do_left\" ><div class=\"frm_label\"> Active:</div><div class=\"frm_input\"><input  type='checkbox' class=\"create_Line_active\" value='1' /></div></div>";

    data += " <input  type='hidden' class=\"create_Line_modid\" value='" + mod_id + "' /></div></div>";

    /* {"None", "RXN", "MPLS", "Ethernet",
     "Token Ring", "X.25", "ATM-lan", "ATM-wan"
     };  
     */
    data += "</div><\n\
<div class=\"do_center\"><input type=\"button\" class=\"create_Line_ok\"  value=\"Ok\"> \n\
<input type=\"button\" class=\"create_Line_step2_cancel\"  value=\"Cancel\"></div> ";

    return data;
}

function create_Line_WidowsData_do() {


    updateNodes($(".create_Line_Fromline:first").val(), ".create_Line_FromNodes");
    updateNodes($(".create_Line_Toline:first").val(), ".create_Line_ToNodes");

    $(".create_Line_Fromline").change(function() {

        updateNodes($(this).val(), ".create_Line_FromNodes");


    })




    $(".create_Line_Conect").click(function() {

        var nto = $(".create_Line_ToNodes").val();
        var nfrom = $(".create_Line_FromNodes").val();


        if ($.trim(nfrom) != "" && $.trim(nto) != "") {




            makeWinDows("Line Properties", "Creat_Line_setp2", create_Line_setp2(mod_id, nfrom, nto), 300, 150, 500, null);

            closeWindows("Creat_Line");

        } else {


            alert("Please select nodes that will connect with each other.");

        }




    })


    $(".create_Line_Cancel").click(function() {




        if (theNewLine) {

            theNewLine.setMap(null);
            theNewLine = null;
            creatLine_1 = 0;


            var image12 = new google.maps.MarkerImage(MarkerImage,
                    new google.maps.Size(MarkerImage_width, MarkerImage_height),
                    new google.maps.Point(0, 0),
                    new google.maps.Point(10, 29));
            createLine_marker1.setIcon(image12);
            createLine_marker2.setIcon(image12);


        }

        closeWindows("Creat_Line");

    })





    $(".create_Line_Toline").change(function() {

        updateNodes($(this).val(), ".create_Line_ToNodes");

    })










}

function create_Line_WidowsData(m1Data, m2Data) {

    var m1 = m1Data.split(";");
    var m2 = m2Data.split(";");


    var data = "<script>create_Line_WidowsData_do();</script><div class=\"view_pre mydata\">";

    data += " <div class=\"frm_row do_left\" style='width:45%;float:left' ><div style='width:auto; pading:2px' class=\"frm_label\">From Groups:</div><div style='width:auto;' class=\"frm_input\">\n\
<select class=\"create_Line_Fromline\">";
    for (var i = 0; i < m1.length; i++) {

        var myv = m1[i].split("__")
        data += "<option value='" + myv[0] + "'>" + myv[1] + "</option>";



    }
    data += "</select></div></div>";

    data += " <div class=\"frm_row do_left\" style='width:45%;float:left'><div style='width:auto; pading:2px' class=\"frm_label\">To Groups:</div><div style='width:auto;' class=\"frm_input\">\n\
<select class=\"create_Line_Toline\">";
    for (var i = 0; i < m2.length; i++) {
        var myv = m2[i].split("__");
        data += "<option value='" + myv[0] + "'>" + myv[1] + "</option>";

    }
    data += "</select></div></div>\n\
<div class=\"frm_row do_left\" style='width:45%;float:left;height:100px;'>\n\
<div style='width:100%; clear:both;'class=\"frm_label\">From Nodes:</div><div class=\"frm_input\">\n\
<select multiple=\"multiple\" class=\"create_Line_FromNodes\"></select></div></div>\n\
<div class=\"frm_row do_left\" style='width:45%;float:left;height:100px;'>\n\
<div style='width:100%; clear:both;' class=\"frm_label\">To Nodes:</div><div class=\"frm_input\">\n\
<select multiple=\"multiple\" class=\"create_Line_ToNodes\"></select></div></div>\n\
";
    data += "</div><\n\
<div class=\"do_center\"><input type=\"button\" class=\"create_Line_Conect\"  value=\"Connect\"> \n\
<input type=\"button\" class=\"create_Line_Cancel\"  value=\"Cancel\"></div> ";



    return data;
}

function updateNodes(groupid, nodesclass) {


    $.get("ajax/implementation/getnodes.jsp?id=" + groupid, function(rdata) {

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



    google.maps.event.addListener(map, 'mousemove', function(event) {
        $(".showtool").html("");
        $(".showtool").hide();
    });


    google.maps.event.addListener(map, 'click', function(event) {
        if (createStatus == 1) {



            makeWinDows("New Location ", "create_Marker", create_Marker(event.latLng.lat(), event.latLng.lng(), cid), 420, 220, 400, null);


            placeMarker(event.latLng);



        }

    });















    function placeMarker(location) {



        var image1 = new google.maps.MarkerImage(marker_new,
                new google.maps.Size(MarkerImage_width, MarkerImage_height),
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
}/*

function afetraGroup(id, group, color,cludeID , GroupID) {
    afterim(group);
    afterim(group);
    get_group(id, "." + group + " .data");
    afterim(group);
    afterim(group);
}*//*

function get_group(id, addto) {
    var link2 = "?alias=xact&module=groupview&pro_id=" + id;

   // alert(link2);
    openGroup(link2, addto);

}*/


function ImageExist(url)
{
    var img = new Image();
    img.src = url;
    return img.height != 0;
}


function GetCludes(longt, lat, id, image, width, height, mp, name, color, mid, num) {


    // alert (width+"\n"+height);

    num++;



    var myLatlng = new google.maps.LatLng(longt, lat);

    MarkerImage_d_g = 'images/uploads/' + image;


    if (ImageExist(MarkerImage_d_g) == false) {



        MarkerImage_d_g = 'images/uploads/noimage.png';




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

function afterim(id) {


    var meth = $("#" + id);

    var m = meth.attr("style");

    m = m.replace("-bottom", "");

    // alert (m);


    $(".im_tabs_li").removeClass("act");
    $(".im_divs").attr("style", m);

    meth.addClass("act");


    $(".im_divs .imps_vids").css("z-index", "0");

    $(".im_divs .imps_vids").removeClass("actgroup");
    $("." + id).css("z-index", "1");
    $("." + id).addClass("actgroup");







}

function thActions(id) {


    afterim(id)


}

function showPointAddressbayGroup(longt, lat, id, image, width, height, mp, name, x, y, mid, num) {


    var myLatlng = new google.maps.LatLng(longt, lat);

    MarkerImage_d_g = 'images/' + image;



    var image1 = new google.maps.MarkerImage(MarkerImage_d_g,
            new google.maps.Size(MarkerImage_width, MarkerImage_height),
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

function showPointAddressbayl(longt, lat, id, image, width, height, mp, name, x, y, mid, sid, status, clouddata) {
    carnum++

    var myLatlng = new google.maps.LatLng(longt, lat);

    MarkerImage_d = 'images/' + image;


    MarkerImage_x = x;
    MarkerImage_y = y;
    MarkerImage_height = height;
    MarkerImage_width = width;


    //create market image with its settings 

    var image1 = new google.maps.MarkerImage(MarkerImage_d,
            new google.maps.Size(MarkerImage_width, MarkerImage_height),
            new google.maps.Point(0, 0),
            new google.maps.Point(MarkerImage_x, MarkerImage_y));

    // create marker

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: mp,
        icon: image1,
        title: name,
        id: mid
    });

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


    Circles[carnum] = new google.maps.Circle(populationOptions);


    markerList[marker.id] = marker;
    // push marker to its position
    markersArray.push(marker);

    var daa = id.split("/");


    //add click event to show node properties
    google.maps.event.addListener(marker, "click", function(event) {


        var Stringtest = mod_id + " : ";

        Stringtest += "creatLineSataus: " + creatLineSataus;
        if (creatLineSataus == 1) {

            var image12 = new google.maps.MarkerImage(marker_selected,
                    new google.maps.Size(MarkerImage_width, MarkerImage_height),
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
                        makeWinDows("Create Line", "Creat_Line", create_Line_WidowsData(m1, m2), 300, 150, 500, null);


                    })


                })



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



            var data = $.trim(retdata_group) + "<script>windowsCancelDo(\".cancel_bt\" ,\"" + marker.id + "\");\n\
</script><div class=\"mybar\"> \n\
<input type=\"button\" class=\"cancel_bt do_right\" value=\"Cancel\"  /></div>"

            makeWinDows("View Paramters", "view_paramters_windows", data, 300, 150, 180, null);





            $(".getgroup").dblclick(function() {

                var myid = $(this).attr("id");


                $(".im_divs .group" + cloudID + "").remove();
                $(".im_tabs ul #group" + cloudID).remove();



                $(".im_divs").append("<div class='formoer imps_vids do_group  actgroup group" + cloudID + "'  >\n\
<ul class=\"group_tabs\"></ul><div class='data'></div></div>")


                $(".im_tabs ul #" + cloudID).after(" <li onClick=\"thActions('group" + cloudID + "');\" id='group" + cloudID + "'  style=\"border-bottom:4px solid #" + cloudcolor + "\"  class=\"formoer im_tabs_li act \"><span>" + cloudName + " Group View </span></li>\n\
 <script>afetraGroup('" + myid + "','group" + cloudID + "','#" + cloudcolor + "');</script>");






                $(".mxWindow").remove();


                $(".spreview").hide();
                $(".cpreview").hide();

                $(".gpreview").show();
                $(".view_immap").show();

                $(".div_result").hide();


                $("#div_group").click();

                ///////////////////////////////////////////////////




            })

        })




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
        for (i in markersArray) {
            markersArray[i].setMap(null);
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


function addNewLineToMap(lat1, lon1, lat2, lon2, lineWeight, mp, color, id, status) {
    //coordinates 
    var flightPlanCoordinates = [
        new google.maps.LatLng(lat1, lon1),
        new google.maps.LatLng(lat2, lon2)

    ];
    linesStatus = status;

    //set line settings in variable


    var op = 1.0;




    var flightPath = new google.maps.Polyline({
        path: flightPlanCoordinates,
        strokeColor: color,
        strokeOpacity: op,
        strokeWeight: lineWeight
    });


    //draw line
    flightPath.setMap(mp);

    //mouseover event to get line properties
    google.maps.event.addListener(flightPath, 'click', function() {



        $.get(statr_link + "modules/mod_nodeproperties/index.jsp?pro_id=" + id + "&more=" + getlen(flightPath), function(r_data) {

            $("#Properties_con").html(r_data);

        })
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



    /*
     * 
     * $("#div_imp").click(function() {
     
     alert(map.getZoom());
     map.setZoom(map.getZoom() - 1);
     
     })
     */

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
