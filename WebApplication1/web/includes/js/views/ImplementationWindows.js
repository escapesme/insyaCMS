

function newGroupWindwosActions(LOCATION_ID, MODEL_ID) {




}



function newGroupWindwos(Types, LOCATION_ID, ids, backdata, LOCATION_ID, MODEL_ID,sid, cloudID, cloudcolor, cloudName) {

  

    var f = new FormClass("newGroupWindows");
    f.fields = [{
            "title": "Group Name:",
            "type": "text",
            "name": "groupName",
            required:"required"
        },
        {
            "type": "button",
            "name": "addType",
            "value": "add Type"
        }, {
            "title": "Active:",
            "type": "checkbox",
            "name": "active",
            value:1
        }, {
            "title": "Group Type:",
            "type": "select",
            "name": "groupType",
            options: Types
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
            "name": "newGroupWindwosok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newGroupWindwosCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];

    f.events = [
        {action: "send",
            options: {MODEL_ID: MODEL_ID, LOCATION_ID: LOCATION_ID, sataus: "createGroup"},
            url: "ajax/views/groupView/create.jsp",
            event: "click",
            eventClass: "newGroupWindwosok",
            done: function(data) {

                f.closeWindow();
                
                
        $.get("ajax/implementation/ImplementationGroups.jsp?sid=" + sid + "&id=" + ids[1] + "/" + ids[2] + "/" + ids[3], function(retdata_group) {



            newGroupWindows($.trim(retdata_group), LOCATION_ID, ids, sid,cloudID, cloudcolor, cloudName);



        })

                
             

            }
        }, {
            "event": "click",
            "eventClass": "addType",
            js: function(data) {


                getImageLocation("group", function(imageLocaiton) {
                    getID(function(imageid) {
                        makeWinDows("New Group Type", "newGroupType", newGroupType(imageid, escape(imageLocaiton)), 300, 150, 350, null);

                    })
                })

            }
        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "newGroupWindwosCancel"

        }
    ];


    var footer = f._renderhtml();
    f.windows = {
        "class": "newGrouyp",
        "title": "new Group",
        "content": selectType,
        "footerContent": footer,
        "x": "510",
        "y": "90",
        width: "500", height: "240"//,
        /*position:"Center"*/
    };
    f._renderWindows();

}






//<editor-fold defaultstate="collapsed" desc="Widows">



function createCloudsData(modid, locations, imageid, floder) {





    var f = new FormClass("createCloudsData");
    f.fields = [
        {
            "title": "Location Name:",
            "type": "text",
            "name": "title"
        }

        , {
            "title": "line:",
            "type": "line",
            "name": "line", class: "clear"
        },
        {
            "title": "Icon:",
            "type": "image",
            "name": "icon", pClass: "_50"
        }, {
            "title": "Color:",
            "type": "color",
            "name": "color", pClass: "_50"
        }, {
            "title": "line:",
            "type": "line",
            "name": "2line", class: "clear"
        },
        {
            "title": "Private:",
            "type": "radio",
            "name": "status", pClass: "_50", value: "1"
        },
        {
            "title": "Public:",
            "type": "radio",
            "name": "status", value: "0",
            options: locations, pClass: "_50", checked: "checked"

        },
        {
            "title": "Location:",
            "type": "list",
            "name": "loctionId", pClass: "_50",
            options: locations

        }
        , {
            "title": "Description:",
            "type": "textarea",
            "name": "Description", pClass: "_50"
        }, {
            "title": "line:",
            "type": "line",
            "name": "2line", class: "clear"
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
            "name": "createCloudsmodok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "createCloudsmodCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];
    f.events = [
        {
            action: "send",
            options: {modID: modid},
            url: "ajax/implementation/saveCloud.jsp",
            event: "click",
            eventClass: "createCloudsmodok",
            done: function(data) {
                mackeAnActaive();

                reloadimplementation("model", modid);
                f.closeWindow();
            }

        }, {
            "action": "close"
            , "event": "click"
            , "eventClass": "createCloudsmodCancel"

        }
    ];
    var footer = f._renderhtml();
    f.windows = {
        "class": "createCloudsData",
        "title": "create Clouds ",
        "content": selectType,
        "footerContent": footer,
        "x": "500",
        "y": "90",
        width: "500", height: "340"
    };
    f._renderWindows();







}


//</editor-fold>



