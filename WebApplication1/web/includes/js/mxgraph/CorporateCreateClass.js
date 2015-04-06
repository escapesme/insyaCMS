/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function creatD(G, id, mytext, x, y, height, width, mstyle) {

    if (height == null || height == "" || height == "0") {
        height = 40
    }
    if (width == null || width == "" || width == "0") {
        width = 90
    }
    var parent = G.getDefaultParent( );
    var st = returnStyle2(G, id, mstyle);


    if (mytext == "" && mytext == null) {
        mytext = "-";
    }
    G.setHtmlLabels(true);


    G.setCellsMovable(false);
    G.setAutoSizeCells(true);
    //







    var nyr = G.insertVertex(parent, id, mytext, x, y, width, height, "st" + id);
    mstyle = null
    return nyr;
}









function makeBarEn()
{


    $(".cbrItmen.delete").removeClass("dis");
    $(".cbrItmen.Edit").removeClass("dis");

    $(".cbrItmen.ccopy").removeClass("dis");

}


function maKeBarDis()
{

    $(".cbrItmen.delete").addClass("dis");
    $(".cbrItmen.Edit").addClass("dis");

    $(".cbrItmen.ccopy").addClass("dis");
}

var myG = "";

function makg(mode, locked, canedit, modId, s_id) {


    if (!mxClient.isBrowserSupported())
    {

        mxUtils.error('Browser is not supported!', 200, false);
    }
    else
    {
        var md = false;


        if (mode == "leftToRight") {
            md = true;
        } else {
            md = false;
        }

        var levelDistance = 40;

        var nodeDistance = 25;




        var outline = document.getElementById('outlineContainer');
        var container = document.getElementById("xactCContainer");

        //    mxRectangleShape.prototype.crisp = true;
        var graph = new mxGraph(container);

        /*
         
         
         
         
         
         
         //   graph.setDropEnabled(true);
         graph.setPanning(true);
         
         graph.setAllowLoops(false);
         graph.allowAutoPanning = false;
         
         */
        this.alternateEdgeStyle = 'vertical';
        graph.setCellsMovable(false);
        graph.setCellsResizable(false)
    //    graph.setTooltips(!mxClient.IS_TOUCH);
        graph.setCellsEditable(false);
        graph.setHtmlLabels(true);
        var layout = new mxCompactTreeLayout(graph, md);
        layout.useBoundingBox = false;
        layout.levelDistance = levelDistance;
        layout.nodeDistance = nodeDistance;

        layout.isVertexMovable = function(cell)
        {
            return true;
        }

        var layoutMgr = new mxLayoutManager(graph);

        layoutMgr.getLayout = function(cell)
        {
            if (cell.getChildCount() > 0)
            {
                return layout;
            }
        }

        if (locked != "true" && canedit == "true" && (s_id == "" || s_id == "0")) {



            graph.setConnectable(true);

            graph.connectionHandler.setCreateTarget(true);

        } else {
            graph.setConnectable(false);

            graph.connectionHandler.setCreateTarget(false);

        }




        var outln = new mxOutline(graph, outline);
        mack_ev(graph);
        myG = graph;
        mycbar(locked, canedit, modId, s_id);

        graph.setPanning(true);


        //  graph.panningHandler.useLeftButtonForPanning = true;


// Enables crisp rendering of rectangles in SVG
        mxRectangleShape.prototype.crisp = true;

        //mxLog.show();
        mxEvent.disableContextMenu(container);

        var graphIsForceMarqueeEvent = graph.isForceMarqueeEvent;
        graph.isForceMarqueeEvent = function(evt)
        {
            return graphIsForceMarqueeEvent.apply(this, arguments) ||
                    mxEvent.isRightMouseButton(evt);
        };

        new mxRubberband(graph);



    }
    return graph;



}





function mycbar(locked, canedit, modId, s_id) {

    var content = "<script> cbrdo('" + modId + "');</script>\n\
<div  title='Zoom In'class=\"cbrItmen zoomIn\" title></div>\n\
<div title='Zoom to Actual Size' class=\"cbrItmen zoomActual\" title></div>\n\
<div title='Zoom Out' class=\"cbrItmen zoomOut\" title></div>\n\
<div title='Fit to Screen' class=\"cbrItmen fit\" title></div>\n\
<div  class=\"cbrItmen spliter\" title></div>\n\
<div title='Print' class=\"cbrItmen Print\" title></div>\n\
<div title='Preview' class=\"cbrItmen preview\" title></div>\n\
<div title='test' class=\"test  cbrItmen \" title></div><div  class=\"cbrItmen spliter\" title></div>";
    if ((s_id == "" || s_id == "0")) {
        content += "<div title='Copy' class=\"copy  dis ccopy cbrItmen \" title></div>";

    }

    if (locked != "true" && canedit == "true" && (s_id == "" || s_id == "0")) {



        isSesstion("copyData", function(bo) {


            if ($.trim(bo) == "true") {
                $(".cbrItmen.cpast").removeClass("dis");
            }
        })


        content += "\
<div title='Paste' class=\"past  dis cpast cbrItmen \" title></div><div  class=\"cbrItmen spliter\" title></div>\n\
<div class=\"cbrItmen Edit dis\" title='Edit'>\n\
</div><div class=\"cbrItmen delete dis\" title='Delete'></div>\n\
";

    }



    $(document).trigger("afterloadingbar", ["Custom", "Event"]);
    $(".div_c .tbar").html(content);

}

$(document).on("afterloadingbar", function(event, param1, param2) {
    isSesstion("copyData", function(bo) {


        if ($.trim(bo) == "true") {
            $(".cbrItmen.cpast").removeClass("dis");
        }
    })
});







var creatEdgeAcrionsCell;

var graphvar;
function creatEdge(sourceID, targetID, graph, type) {
    var parent = getParentID(graph, targetID);

    var modelId = parent.split("/")[3].split("__")[0];
    creatEdgeAcrionsCell = cell;
    graphvar = graph;
    var status = "";
    if (type == "update") {
        status = "updateconect";
    } else {
        status = "newconect";
    }

    var f = new FormClass("corporateLink");
    f.fields = [{
            type: "number",
            "required": "required",
            name: "UF",
            title: "Utilization Frequency in %",
            value: 100
        }];
    var a = f._renderhtml();
    f.fields = [
        //</editor-fold>

        {
            "type": "div",
            "class": "do_center _100"
        },
        {
            "type": "button",
            "name": "newLinkOK",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "newLinkCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];


    //</editor-fold>






    f.events = [
        {
            "action": "close",
            "Callback": function(t) {

                if (cell != null) {



                    graph.removeCells([cell]);

                }


            }
            , "event": "click"
            , "eventClass": "newLinkCancel"
        }
        ,
        {
            "action": "send",
            "url": "ajax/project/updatecorpe.jsp",
            "event": "click",
            "eventClass": "newLinkOK",
            "options": {status: status, "id": sourceID, tid: targetID},
            done: function(data) {
                alert("Link UF updated successfully");
                UpdateCorporate(modelId);
                showMyloading(".main", "end");
                f.closeWindow();
            }

        }

    ];
    var b = f._renderhtml();

    f.windows = {
        "class": "editCorporateLink",
        "title": "Corporate Link",
        "content": a,
        "footerContent": b,
        "position": "Center",
        "x": "100",
        "y": "100",
        width: "460", height: "75"
    }



    f._renderWindows();

}
function creatEdgeAcrions(sourceID, targetID, type) {

    if (type == "update") {


        $(".creatEdge_ok").click(function() {


            var link2 = "?id=" + sourceID
                    + "&UF=" + $(".creatEdge_UF").val()
                    + "&status=updateconect";
            $.get("ajax/project/updatecorpe.jsp" + link2, function(r_data1) {
                graphvar.refresh();

            });
            closeWindows("creatEdge");

        });

    } else {



        $(".creatEdge_ok").click(function() {


            var link2 = "?sid=" + sourceID
                    + "&tid=" + targetID
                    + "&UF=" + $(".creatEdge_UF").val()
                    + "&status=newconect";
            $.get("ajax/project/updatecorpe.jsp" + link2, function(r_data1) {



                graphvar.refresh();

            });
            closeWindows("creatEdge");

        })

    }





    $(".creatEdge_cancel").click(function() {

        closeWindows("creatEdge");
        graphvar.refresh();

    })


}

//http://servername:8080/imc-collector-web-1.0-SNAPSHOT/api/complexInstance/1364352451999
function cbrdo(modId) {
    var graph = myG;

    $(function() {

        $(".delete").click(function() {




            var cells = graph.getSelectionCells();



            if (cells != null) {





                var myides = "";
                for (var ce = 0; ce < cells.length; ce++) {
                    myides += cells[ce].getId() + "__";


                }
                var link2 = "?id=" + myides + "&status=del";


                var ids = myides.split("/");







                if (ids[0] == "corporate") {

                    alert("Corporate object cannot be deleted!");

                } else {


                    var msg = "Are you sure you want to delete ";





                    if ($.trim(ids[0]) == "be_be" || $.trim(ids[0]) == "CORPORATE_BE" || $.trim(ids[0]) == "BE_BP") {

                        msg += "this link?";
                    } else {

                        var myValue = cells[0].getValue();
                        myValue = myValue.replace("<br/>", " ");
                        myValue = myValue.replace("<br/>", " ");
                        myValue = myValue.replace("<br/>", " ");




                        msg += "\"" + myValue + "\"?";


                    }



                    var answer = confirm(msg)



                    if (answer) {


                        $.get("ajax/project/updatecorpe.jsp" + link2, function(r_data1) {
                            graph.removeCells(cells);
                        })






                    }
                }



            }


        })





        $(".test").toggle(function() {

            var layout = new mxHierarchicalLayout(graph);
            layout.execute(graph.getDefaultParent());
        })


        $(".Edit").click(function() {

            var cells = graph.getSelectionCells();
            if (cells != null) {

                if (graph.getModel().isVertex(cells[0]))
                {


                    var cell = cells[0];
                    var mycell = cell.getId();
                    var link2 = "?id=" + mycell;

                    $.get("ajax/project/nodeValues.jsp" + link2, function(r_data1) {

                        edit_Node(mycell, graph, r_data1, mycell);

                        $(".create_Node_ok").click(function() {

                            my_edit_Node_do(mycell, graph, cell);


                            closeWindows("create_Node");

                        });



                        $(".create_Node_cancel").click(function() {

                            closeWindows("create_Node");


                        });

                    });


                } else if (graph.getModel().isEdge(cells[0])) {

                    creatEdge(cells[0].getId(), cells[0].target.getId(), graph, "update");

                }

            }
        });

        $(".zoomIn").click(function() {

            graph.zoomIn();
        })


        $(".ccopy.cbrItmen").click(function() {

            $(".cpast").removeClass("dis");
            var copydata = "";
            var cells = graph.getSelectionCells();

            if (cells !== null && cells.length > 0) {
                for (var i = 0; i < cells.length; i++) {

                    copydata += "__" + cells[i].getId();

                }




                setSesstion("copyData", copydata);
                showMessage("info", "&nbsp;&nbsp;&nbsp;Objects Copied&nbsp;&nbsp;&nbsp;&nbsp;", "Objects copied to the corporate view clip board.", "", function() {
                });
            }
        });

        $(".cpast.cbrItmen").click(function() {

            showMyloading(".main", "start");
            $.get("ajax/views/past.jsp?type=corporte&modID=" + modId, function(r_data) {
                $(".cpast").addClass("dis");
                /*  showMessage("info", "&nbsp;&nbsp;&nbsp;ttttt&nbsp;&nbsp;&nbsp;&nbsp;", r_data, "", function() {
                 });*/


                UpdateCorporate(modId);
            });

        })
                ;

        $(".zoomOut").click(function() {
            graph.zoomOut();
        })
        $(".zoomActual").click(function() {
            graph.zoomActual();
        })

        $(".fit").click(function() {
            graph.fit();
        })


        $(".Print").click(function() {



            var preview = new mxPrintPreview(graph, 1);

            preview.open();
        })
        $(".preview").click(function() {

            var pageCount = mxUtils.prompt('Enter maximum page count', '1');

            if (pageCount != null)
            {
                var scale = mxUtils.getScaleForPageCount(pageCount, graph);
                var preview = new mxPrintPreview(graph, scale);
                preview.open();
            }

        })

    })


}

function mack_ev(G) {


    // Handle general click events (by mouse selection or Ctrl+A)\n   
    //  graph.getSelectionModel().addListener(mxEvent.CHANGE, new mxIEventListener() {\n        @Override\n        public void invoke(Object sender, mxEventObject evt) {\n            System.out.println("evt.toString() = " + evt.toString());\n            System.out.println("Selection in graph component");\n            if (sender instanceof mxGraphSelectionModel) {\n                for (Object cell : ((mxGraphSelectionModel)sender).getCells()) {\n                    System.out.println("cell=" + graph.getLabel(cell));\n                }\n            }\n        }\n    });\n



    G.addListener(mxEvent.CELLS_ADDED, function(sender, evt)
    {
        var cell = evt.getProperty("cells");







    })




    G.getSelectionModel().addListener(mxEvent.CHANGE, function() {


        if (G.getSelectionCell() != null) {
            makeBarEn();

        } else {

            maKeBarDis();

        }



    })


    G.addListener(mxEvent.SELECT, function(sender, evt)
    {
        makeBarEn();

    })
    G.addListener(mxEvent.DOUBLE_CLICK, function(sender, evt)
    {

        var cell_id = 0;
        var cell = evt.getProperty('cell');

                    $(".mxTooltip").css("visibility", "hidden");

        if (cell != null)
        {

            if (cell.isEdge()) {

                makeBarEn();
            } else {

                makeBarEn();




                if (cell_id == cell.getId()) {

                } else {

                    var daa = cell.getId().split("/");

                    $(".mxTooltip").css("visibility", "hidden");


                    var link2 = "?alias=xact&module=serves&process_id=" + daa[1] + "&res_data=" + daa[2] + "__" + daa[3];

                    if (daa[0] == "business_process" || daa[0] == "BUSINESS_PROCESS") {


                        //open service view
                        openService(link2);
                    }

                }




            }


        }


    });


    //event listener for clicks


    G.addListener(mxEvent.CLICK, function(sender, evt)
    {

        var cell_id = 0;
        var cell = evt.getProperty('cell');


        if (cell != null)
        {
            // if event is an edge show edge properties 
            if (cell.isEdge()) {

                makeBarEn();
                $.get("modules/mod_nodeproperties/index.jsp?pro_id=" + cell.getId(), function(r_data) {
                    $("#Properties_con").html(r_data);

                })




            } else {


                makeBarEn();
                // if cell show node properties

                $.get("modules/mod_nodeproperties/index.jsp?pro_id=" + cell.getId(), function(r_data) {



                    $("#Properties_con").html(r_data);

                })
                cell_id = cell.getId();



            }
        } else {


            //  maKeBarDis();

        }



    });
}


function getParentID(graph, id) {

    var returdata = "";
    var cells = graph.getChildCells(graph.getDefaultParent(), true, true);




    for (var i = 0; i < cells.length; i++) {

        if (cells[i].isEdge()) {
            if (cells[i].target.getId() == id) {
                returdata += cells[i].source.getId() + "__";
            }
        }
    }



    return returdata;
}
function creatE(G, v1, v2, value, mode) {
    var md = null;
    if (mode == "leftToRight") {
        md = mxEdgeStyle.SideToSide;
    } else {
        md = mxEdgeStyle.TopToBottom;
    }
    var style = G.getStylesheet().getDefaultEdgeStyle();
    style[mxConstants.STYLE_ROUNDED] = true;
    style[mxConstants.STYLE_FONTCOLOR] = '#774400';
    style[mxConstants.STYLE_VERTICAL_ALIGN] = 'bottom';
    style[mxConstants.STYLE_VERTICAL_LABEL_POSITION] = 'bottom';
    style[mxConstants.STYLE_LABEL_POSITION] = 'bottom';
    style[mxConstants.STYLE_NOLABEL] = 1;
    style[mxConstants.STYLE_EDGE] = md;//mxEdgeStyle.Loop   mxEdgeStyle.SideToSide  mxEdgeStyle.TopToBottom  mxGraph.defaultLoopStyle  mxEdgeStyle.ElbowConnector
    G.getStylesheet().putCellStyle('ROUNDED', style);
    var parent = G.getDefaultParent( );
    return   G.insertEdge(parent, null, value, v1, v2, 'ROUNDED');// mxGraph.insertEdge(parent, id, value, source, target, style)
}


function creatE(G, v1, v2, value, mode, id) {


    //check mode and set accordingly in mxgraph
    var md = null;
    if (mode == "leftToRight") {
        md = mxEdgeStyle.SideToSide;
    } else {
        md = mxEdgeStyle.TopToBottom;
    }




    var style = G.getStylesheet().getDefaultEdgeStyle();
    style[mxConstants.STYLE_ROUNDED] = true;
    style[mxConstants.STYLE_FONTCOLOR] = '#774400';


    style[mxConstants.STYLE_VERTICAL_ALIGN] = 'bottom';

    style[mxConstants.STYLE_VERTICAL_LABEL_POSITION] = 'bottom';
    style[mxConstants.STYLE_LABEL_POSITION] = 'bottom';
    style[mxConstants.STYLE_NOLABEL] = 1;


    style[mxConstants.STYLE_EDGE] = md;//mxEdgeStyle.Loop   mxEdgeStyle.SideToSide  mxEdgeStyle.TopToBottom  mxGraph.defaultLoopStyle  mxEdgeStyle.ElbowConnector


    G.getStylesheet().putCellStyle('ROUNDED', style);
    var parent = G.getDefaultParent( );
    //create edge between v1 and v2
    return   G.insertEdge(parent, id, value, v1, v2, 'ROUNDED');// mxGraph.insertEdge(parent, id, value, source, target, style)



}



function updatecel(status, graph, mycellid, bpStyle, beStyle, lbeStyle) {


    for (var c in graph.model.cells) {
        var cell = graph.model.cells[c];


        if (cell.id == mycellid) {
            if (status == "delete") {

                closeWindows("create_Node");
                var myArray = new Array();

                myArray[0] = cell;
                graph.removeCells(myArray);


            } else {

                var type = $(".create_Node_Object_Type").val();

                cell.setValue($(".create_Node_Name").val());


                var number = $(".create_Node_Number").val();


                var utype = $(".create_Node_Unit_Type").val();


                if (type == "Business Process") {

                    var geo = graph.getModel().getGeometry(cell);

                    var ofsste = (geo.width - 30) / 2;

                    geo.width = 30;
                    geo.height = 30

                    geo.x = geo.x + ofsste;


                    cell.setGeometry(geo);

                    cell.setStyle(bpStyle);

                } else if (type == "Business Entitly" && utype == "lb") {

                    cell.setStyle(beStyle);

                } else {

                    cell.setStyle(lbeStyle);
                }


            }



        }
    }
    graph.refresh();
    graph.refresh();
}







function mycreate_Node_do(parentid, g, cell, SCENARIOID, mod_id) {







    var myparent = parentid.split("/");



    $(".create_Node_Object_Type").val();
    $(".create_Node_Comment").val();

    var link2 = "";


    var v = $(".create_Node_Object_Type").val();

    if (v === "Business Process") {

        link2 = "?name=" + $.trim($(".create_Node_Name").val())
                // crest($(".create_Node_selector").val());
                + "&duration=" + $.trim($(".bpDuration").val())
                + "&otype=" + $.trim($(".create_Node_Object_Type").val())
                + "&type=" + $.trim($(".create_Node_Unit_Type").val())
                + "&selector=" + selector
                + "&Link=" + $.trim($(".create_Node_Link_b").val())
                + "&des=" + $.trim($(".create_Node_Comment").val())
                + "&Hrs=" + $.trim($(".create_Node_Hrs").val())
                + "&Min=" + $.trim($(".create_Node_Min").val())
                + "&days=" + $.trim($(".create_Node_days").val())
                + "&Sec=" + $.trim($(".create_Node_Sec").val())
                + "&parent=" + $.trim(myparent[1])
                + "&parenttype=pe"
                + "&status=createnode"
                + "&comment=" + $(".create_Node_Comment").val();





    } else {
        link2 = "?name=" + $.trim($(".create_Node_Name").val())
                + "&Number=" + $.trim($(".create_Node_Number").val())
                //   +"&selector="+$.trim($(".create_Node_selector").val())
                + "&otype=" + $.trim($(".create_Node_Object_Type").val())
                + "&type=" + $.trim($(".create_Node_Unit_Type").val())
                + "&parent=" + $.trim(myparent[1])
                + "&Link=" + $.trim($(".create_Node_Link").val())
                + "&des=" + $.trim($(".create_Node_Comment").val())
                + "&parenttype=" + $.trim(myparent[0])
                + "&status=createnode"
                + "&comment=" + $(".create_Node_Comment").val();

    }


    $.get("ajax/project/newProject.jsp" + link2, function(r_data1) {


        var nid = "";
        if (v == "Business Process") {


            nid = "BUSINESS_PROCESS/" + $.trim(r_data1) + "/" + SCENARIOID + "/" + mod_id;

        } else {

            nid = "BUSINESS_ENTITY/" + $.trim(r_data1) + "/" + SCENARIOID + "/" + mod_id;


        }

        cell.setId(nid);



        closeWindows("create_Node");

        UpdateCorporate(mod_id);


    })














}





function edit_Node_do(ids, cell) {


    $(".create_Node_selector").change(function() {

        if ($(".create_Node_selector:checked").val() == "1") {



            $(".batchData").show("slow");

            $(".trnsData").hide("slow");
            selector = 1;


        } else {

            $(".trnsData").show("slow");
            $(".batchData").hide("slow");
            selector = 0;

        }


    })







    var id = cell.split("/");
    var v = id[0];

    if (v == "BUSINESS_PROCESS") {
        $(".pb").show("slow");
        $(".pe").hide("slow");

        if ($(".create_Node_selector:checked").val() == "1") {


            $(".batchData").show("slow");

            $(".trnsData").hide("slow");




        } else {

            $(".trnsData").show("slow");
            $(".batchData").hide("slow");
            selector = 0;
        }


    } else if (v == "BUSINESS_ENTITY") {
        $(".pb").hide("slow");
        $(".pe").show("slow");


    }



}




function mackSelected(v1, v2) {
    var returndata = "";
    if (parseFloat(v1) == parseFloat(v2)) {
        returndata = " selected='selected' "

    }

    return returndata;
}


function mackchecked(v1, v2) {
    var returndata = "";
    if (v1 == v2) {
        returndata = " checked='checked' "

    }

    return returndata;
}

function editCorporate(cell, graph, vdata, ids) {

    var name = $.trim(vdata[2]);
    var number = $.trim(vdata[3]);
    var options = "0__Days;1__Hours;2__Minutes;3__Seconds";
    var f = new FormClass("editCorporate");


    //<editor-fold defaultstate="collapsed" desc="fields">
    f.fields = [
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required",
            value: name
        },
        {
            "title": "Number",
            "type": "number",
            "name": "Number",
            pClass: "_100 ",
            "value": number, "required": "required"
        },
        {
            "title": "Window Duration",
            "type": "number",
            "name": "windowduration",
            pClass: "_100 ",
            "value": $.trim(vdata[5]), "required": "required"
        },
        {
            title: "Duration type",
            name: "durationtype",
            options: options,
            value: $.trim(vdata[6]),
            type: "select"

        },
        {
            "title": "Unit Type:",
            "type": "text",
            "name": "type",
            pClass: "_100 ",
            "value": $.trim(vdata[4])
        }
    ];

    var a = f._renderhtml();



    //<editor-fold defaultstate="collapsed" desc="footer fields">
    f.fields = [
        //</editor-fold>

        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "type": "button",
            "name": "editCorporateOK",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "editCorporateCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];


    //</editor-fold>






    f.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "editCorporateCancel"
        }
        ,
        {
            "action": "send",
            "url": "ajax/project/updatecorpe.jsp",
            "event": "click",
            "eventClass": "editCorporateOK",
            "options": {status: "edit", "ids": ids},
            done: function(data) {
                f.closeWindow();

                showMyloading(".main", "end");
                graph.refresh();
            }

        }



    ];
    var b = f._renderhtml();

    f.windows = {
        "class": "editCorporate",
        "title": "Edit Corporate",
        "content": a,
        "footerContent": b,
        "position": "Center",
        "x": "100",
        "y": "100",
        width: "400", height: "200"
    }



    f._renderWindows();

}
function editBE(cell, graph, vdata, ids) {

    var name = vdata[3];
    var number = vdata[4];

    var f = new FormClass("editBE");
    //<editor-fold defaultstate="collapsed" desc="fields">
    f.fields = [
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required",
            value: name
        },
        {
            "title": "Number",
            "type": "number",
            "name": "Number",
            pClass: "_100 ",
            "value": number, "required": "required"
        },
        {
            "title": "Unit Type:",
            "type": "text",
            "name": "beType",
            pClass: "_100 ",
            "value": vdata[6]
        }, {
            "title": "comment",
            "type": "textarea",
            pClass: "_100 ",
            "name": "comment",
            value: vdata[2]
        }
    ];

    var a = f._renderhtml();



    //<editor-fold defaultstate="collapsed" desc="footer fields">
    f.fields = [
        //</editor-fold>

        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "type": "button",
            "name": "editCorporateOK",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "editCorporateCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];


    //</editor-fold>






    f.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "editCorporateCancel"
        }
        ,
        {
            "action": "send",
            "url": "ajax/project/updatecorpe.jsp",
            "event": "click",
            "eventClass": "editCorporateOK",
            "options": {status: "edit", "ids": ids},
            done: function(data) {
                f.closeWindow();
                showMyloading(".main", "end");

                graph.refresh();
            }

        }



    ];
    var b = f._renderhtml();

    f.windows = {
        "class": "editBE",
        "title": "Edit Business Entity",
        "content": a,
        "footerContent": b,
        "x": "100",
        "position": "Center",
        "y": "100",
        width: "400", height: "250"
    }



    f._renderWindows();

}
function editBP(cell, graph, vdata, ids) {

    var batch = "";
    var trans = "";
    var showBatch = "hidden";
    var showTrans = "";
    if (vdata[5] == 1) {
        showBatch = "";
        showTrans = "hidden";
        batch = "checked";
        trans = "";

    } else {

        trans = "checked";
        batch = "";

    }



    var f = new FormClass("editBP");
    //<editor-fold defaultstate="collapsed" desc="fields">


    f.fields = [
        {
            "title": "Name",
            "type": "text",
            "name": "create_Node_Name",
            pClass: "_100 ",
            "required": "required",
            value: vdata[3]
        },
        {
            "title": "comment",
            "type": "textarea",
            pClass: "_100 ",
            "name": "des",
            value: vdata[2]
        }, {
            title: "Workload type",
            type: "label", class: "_100 "
        },
        {
            title: "Transactional",
            name: "selector",
            type: "radio",
            value: 0,
            checked: trans,
            "pClass": "_100 "


        },
        {
            title: "Batch",
            name: "selector",
            type: "radio",
            value: 1,
            checked: batch,
            "pClass": "_100 "


        },
        {
            "type": "div",
            "class": "0 " + showTrans + " cont_div",
        }, {
            "title": "Duration (secs)",
            "type": "text",
            "name": "duration",
            pClass: "_100 ",
            "required": "required",
            value: vdata[6]
        },
        {
            "type": "enddiv"
        },
        {
            "type": "div",
            "class": "1 " + showBatch + " cont_div",
        }, {
            title: "SLA",
            type: "label", class: "_20 "
        }, {
            "title": "days",
            "type": "number",
            "name": "days",
            value: vdata[7],
            "pClass": "_20 "
        }, {
            "title": "hours",
            "type": "number",
            "name": "hours",
            pClass: "_20 ",
            value: vdata[8],
        }, {
            "title": "minutes",
            "type": "number",
            "name": "minutes",
            value: vdata[9],
            "pClass": "_20 "
        }, {
            "title": "seconds",
            "type": "number",
            "name": "seconds",
            value: vdata[10],
            "pClass": "_20 "
        },
        {
            "type": "enddiv"
        }
    ];

    var a = f._renderhtml();



    f.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "type": "button",
            "name": "editBPOK",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "editBPCancel",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];


    //</editor-fold>







    f.events = [
        {
            "action": "close"
            , "event": "click"
            , "eventClass": "editBPCancel"
        },
        {
            "action": "toggelShow",
            "show": "checked__selector",
            "hide": ".cont_div",
            "event": "change",
            "eventClass": "selector"


        }
        ,
        {
            "action": "send",
            "url": "ajax/project/updatecorpe.jsp",
            "event": "click",
            "eventClass": "editBPOK",
            "options": {status: "edit", "ids": ids},
            done: function() {
                f.closeWindow();
                showMyloading(".main", "end");
                graph.refresh();
            }

        }




    ];

    var b = f._renderhtml();
    f.windows = {
        "class": "editBP",
        "title": "Edit Business Trajectory",
        "content": a,
        "footerContent": b,
        "position": "Center",
        "x": "100",
        "y": "100",
        width: "400", height: "270"
    }



    f._renderWindows();


}

function edit_Node(cell, graph, vdata, ids) {


    vdata = vdata.replace("[", "");
    vdata = vdata.replace("]", "");
    vdata = vdata.split(",");




    ids = ids.split("/");



    if (ids[0] == "corporate") {
        editCorporate(cell, graph, vdata, ids);
    } else if (ids[0] == "BUSINESS_ENTITY") {
        editBE(cell, graph, vdata, ids);
    } else {
        editBP(cell, graph, vdata, ids);
    }

}


var selector = 0;
function create_Node(meid, graph, parent, cell) {
    selector = 0;
    graphvar = graph;

    var f = new FormClass("create_Node");
    //<editor-fold defaultstate="collapsed" desc="fields">

    var o = "Line of Business__Business Entity;bpo__Business Process";

    if (parent.getId().split("/")[0] == "corporate") {

        o = "Line of Business__Business Entity";

    }
    ;




    f.fields = [
        {"title": "object Type"
            , "type": "select",
            "options": o,
            "name": "otype",
            "class": "corporateObjects",
            pClass: "_100 "


        },
        {
            "title": "U.F of Link in %:",
            "type": "number",
            "name": "create_Node_Link",
            "min": 0,
            "max": 100,
            "value": "100",
            pClass: "_100 ",
            "required": "required"
        },
        {
            "type": "div",
            "class": " Line_of_Business cont_div",
        },
        {
            "title": "Name",
            "type": "text",
            "name": "name",
            pClass: "_100 ",
            "required": "required"
        },
        {
            "title": "Number",
            "type": "number",
            "name": "create_Node_Number",
            pClass: "_100 ",
            "value": "-1"
        },
        {
            "title": "Unit Type:",
            "type": "text",
            "name": "beType",
            pClass: "_100 "
        },
        {
            "title": "comment",
            "type": "textarea",
            pClass: "_100 ",
            "name": "des"
        }, {
            "type": "enddiv"
        }
    ];

    var a = f._renderhtml();
    f.fields = [
        {
            "type": "div",
            "class": "hidden bpo cont_div",
        }, {
            "title": "Name",
            "type": "text",
            "name": "bpName",
            pClass: "_100 ",
            "required": "required"
        },
        {
            "title": "comment",
            "type": "textarea",
            pClass: "_100 ",
            "name": "bpDes",
        }, {
            title: "Workload type",
            type: "label", class: "_100 "
        },
        {
            title: "Transactional",
            name: "selector",
            type: "radio",
            value: "0",
            checked: "checked", pClass: "_50"

        },
        {
            title: "Batch",
            name: "selector",
            type: "radio",
            value: "1", pClass: "_50 "
        },
        {
            "type": "div",
            "class": "0 sel_div"
        }, {
            "title": "Duration (secs)",
            "type": "number",
            "name": "duration",
            pClass: "_100 ",
            value: 0
        },
        {
            "type": "enddiv"
        },
        {
            "type": "div",
            "class": "1 hidden sel_div"
        }, {
            title: "SLA",
            type: "label", class: "clear "
        }, {
            "title": "days",
            "type": "number",
            "name": "days",
            pClass: "_20 ",
            value: 1
        }, {
            "title": "hours",
            "type": "number",
            "name": "hours",
            pClass: "_20 ",
            value: 1
        }, {
            "title": "minutes",
            "type": "number",
            "name": "minutes",
            pClass: "_20 ",
            value: 1
        }, {
            "title": "seconds",
            "type": "number",
            "name": "seconds",
            pClass: "_20 ",
            value: 1
        },
        {
            "type": "enddiv"
        }, {
            "type": "enddiv"
        }
    ];

    var o = f._renderhtml();





    f.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "type": "button",
            "name": "create_Node_ok2",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "create_Node_cancel2",
            "value": "cancel"
        },
        {
            "type": "enddiv"
        }
    ];


    //</editor-fold>

    f.events = [
        {
            "action": "close",
            "Callback": function(t) {

                if (cell != null) {



                    graph.removeCells([cell]);

                }


            }
            , "event": "click"
            , "eventClass": "create_Node_cancel2"
        },
        {
            "action": "toggelShow",
            "show": "val__corporateObjects",
            "hide": ".cont_div",
            "event": "change"
            , "eventClass": "corporateObjects"

        }
        ,
        {
            "event": "click",
            "eventClass": "create_Node_ok2",
            js: function() {
                var parent = getParentID(graph, meid);
                var modelId = parent.split("/")[3].replace("__", "");
                var pf = ".create_Nodefields";
                var options = {status: "createnode", parentData: parent};
                $.each($(pf + " input:not(:button) " + "," + pf + " select " + " , " + pf + " textarea "), function(index, ele) {

                    if ($(this).prop("type") === "checkbox") {

                        var a = "0";



                        if ($(this).prop('checked')) {
                            a = "1";
                        } else {

                            a = "0";

                        }

                        options[$(this).prop("name")] = a;
                    } else if ($(this).prop("type") === "radio") {



                        options[$.trim($(this).prop("name"))] = $("input:radio[name='" + $(this).prop("name") + "']:checked").val();






                    } else {

                        options[$.trim($(this).prop("name"))] = $(this).val();
                    }




                });

                setajax("ajax/project/newProject.jsp", options, function() {
                    UpdateCorporate(modelId);
                    f.closeWindow();
                }, function() {
                    alert("The operation couldn't be completed. Please try again later.");
                });


            }
        }
        ,
        {
            "action": "toggelShow",
            "show": "checked__selector",
            "hide": ".sel_div",
            "event": "change",
            "eventClass": "selector"


        }];


    var b = f._renderhtml();

    f.windows = {
        "class": "ceateNode2",
        "title": "create Node",
        "content": a + o,
        "footerContent": b,
        "position": "Center",
        "x": "100",
        "y": "100",
        width: "400", height: "350"
    }



    f._renderWindows();

}
