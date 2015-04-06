

//group view
var statr_link = "/Xact/";
var thisModelID = "";
var thisGroupId = "";
var myparentCell = null;
var mycell = null;
var showLine = false;
var mygraph = null;
var thisType = null;
var myp = "";
function do_layout(graph) {

    var layout = new mxCompactTreeLayout(graph, true);
    var parent = graph.getDefaultParent();
    var layout2 = new mxHierarchicalLayout(graph);
    var organic = new mxFastOrganicLayout(graph);
    organic.forceConstant = 120;
    organic.forceConstant = 120;
}



isSesstion("copyGroupData", function(bo) {
    if ($.trim(bo) == "true") {
        $(".cbrItmen.group_past").removeClass("dis");
    }
})
function maGroupKeBarDis()
{

    $(".cbrItmen.delete_item").addClass("dis");
    $(".cbrItmen.edit_node").addClass("dis");

    $(".cbrItmen.cu_server").addClass("dis");
    $(".cbrItmen.group_copy").addClass("dis");

}

function makeGroupBarEn()
{
    $(".cbrItmen.cu_server").removeClass("dis");


    $(".cbrItmen.delete_item").removeClass("dis");
    $(".cbrItmen.edit_node").removeClass("dis");

    $(".cbrItmen.group_copy").removeClass("dis");

}







var myids = "";
var myAddTo = "";



function opentabGroup(groupId) {
    thisGroupId = groupId;

    $(".do_group.actgroup .groupstab").hide();
    $(".do_group.actgroup .groupstab").css("z-index", "0");


    $(".do_group.actgroup ." + thisGroupId).show();
    $(".do_group.actgroup ." + thisGroupId).css("z-index", "2");

    $(".do_group.actgroup .group_tabs .button").removeClass("act");
    $(".do_group.actgroup .group_tabs .button  .th_close").removeClass("act");

    $("#" + groupId).addClass("act");
    $("#" + groupId + " .th_close").addClass("act");

    $(".group_tabtbr").hide();
    $("#group_outline_11" + thisGroupId).show();
}

$(function() {



    $(document).on("click", ".th_close", function() {

        var dd = $(this).parent(".button").attr("id");
        $(this).parent(".button").remove();
        $("." + dd).remove();
        $("#group_outline_11" + dd).remove();

        var lat = $(".do_group.actgroup .group_tabs  .button").last().attr("id");
        opentabGroup(lat);



    })




    $(document).on("click", ".do_group.actgroup .group_tabs  .button", function() {


        opentabGroup($(this).attr("id"));
    });




})


function ClaerGroupTab(groupId) {
    $("." + groupId + "").html("");
    $("#" + groupId + "").remove();
     $("#group_outline_11"+groupId).remove();
    $("#Properties_con").html("");





}

function addNewTab(groupId, mod_id, SCENARIOID, reload) {


    if ($(".group" + groupId).size() > 0 && !reload) {
        opentabGroup(groupId);



    } else {
        ClaerGroupTab(groupId);

        var link2 = "?alias=xact&module=groupview&group=groupview_imglobal&pro_id=group/" + groupId + "/" + SCENARIOID + "/" + mod_id;


        $.get("ajax//engine/get_model_1.jsp" + link2, function(r_data) {




            $(".do_group.actgroup .data").append(r_data);
            $(".do_group.actgroup .groupstab").hide();


            $("." + groupId).show();
            thisGroupId = groupId;
            showMyloading(".main", "end");

        })
    }

}



function updatemuGroup(thisModelID, thisGroupId, SCENARIOID, reload) {


    addNewTab(thisGroupId, thisModelID, SCENARIOID, reload);

    closeAllWindows();





}
function updateVars(ids, AddTo) {
    myids = ids;
    myAddTo = AddTo;

}




function addAcdAction(complex, nod_id, modelId, server) {





    updateAcd(modelId, server)







    $(document).on("click", ".editAcd", function() {

        var id = $(".logicalServersCompelxs  option:selected").val();
        $.get("ajax/getServers.jsp?status=-1&complexId=" + complex + "&modelId=" + modelId, function(mdata) {
            $.get("ajax/getServers.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=getbf", function(sdata) {
                $.get("ajax/getAcds.jsp?modelId=" + modelId + "&status=getAcdData&acdId=" + id, function(acddata) {
                    makeWinDows("Edit Application Description", "newACD", newAcd(mdata, modelId, server, sdata, acddata, id), 350, 120, 500, 200);
                })
            })
        })

    });
    $(document).on("click", ".deleteAcd", function() {


        var added = "";
        $(".availableAcds  option:selected").map(function() {

            added += $(this).val() + ",";
        });
        $(".logicalServersCompelxs  option:selected").map(function() {

            added += $(this).val() + ",";
        });
        $.get("ajax/createAcd.jsp?status=delete&" + link + "&serversData=" + added, function(mdata) {


            $(".logicalServersCompelxs  option:selected").map(function() {
                $(this).remove();
            });
            $(".availableAcds  option:selected").map(function() {

                $(this).remove();
            });
            updateAcd(modelId, server);
        });
    });
    $(".addAcdCancel").click(function() {
        closeWindows("addAcd");
    });
    $(".newAcd").click(function() {

        $.get("ajax/getServers.jsp?status=-1&complexId=" + complex + "&modelId=" + modelId, function(mdata) {
            $.get("ajax/getServers.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=getbf", function(sdata) {

                makeWinDows("New Application Description", "newACD", newAcd(mdata, modelId, server, sdata), 350, 120, 500, 200);
            })
        })

    })

    var link = "&complexId=" + complex + "&nodeId=" + nod_id + "&modelId=" + modelId + "&serverId=" + server;
    $(".addLogicalServerss").click(function() {

        var added = "";
        $(".availableAcds  option:selected").map(function() {

            added += $(this).val() + ",";
        });
        $.get("ajax/createAcd.jsp?status=save" + link + "&serversData=" + added, function(mdata) {

            updateAcd(modelId, server)


        });
    });
    $(".removeLogicalServerss").click(function() {
        var deleteServers = confirm("Remove selected ACD's From Logical Server?");
        if (deleteServers) {
            var removed = "";
            $(".logicalServersCompelxs  option:selected").map(function() {

                removed += $(this).val() + ",";
            });
            $.get("ajax/createAcd.jsp?status=delete&" + link + "&serversData=" + removed, function(mdata) {


                $(".logicalServersCompelxs  option:selected").map(function() {
                    $(this).remove();
                });
                updateAcd(modelId, server)

            });
        }
    });
}

function updateAcd(modelId, server) {


    $.get("ajax/createAcd.jsp?status=availableAcds&" + "&modelId=" + modelId + "&serverId=" + server, function(mdata) {

        $(".availableAcds").html(mdata);
    });
    $.get("ajax/getAcds.jsp?modelId=" + modelId, function(mdata2) {
        $(".acds").html(getmyOptions(mdata2));
    })

    $.get("ajax/createAcd.jsp?status=logicalServersCompelx&modelId=" + modelId + "&serverId=" + server, function(mdata) {

        $(".logicalServersCompelxs").html(mdata);
    });
}





function addAcd(complex, nod_id, modelId, server, serverName) {




    var data = "<script>\n\
 addAcdAction('" + complex + "','" + nod_id + "','" + modelId + "','" + server + "');";
    data += "</script>\n\
                <div class='view_pre mydata'>";
    data += "<div class='datacol'>\n\
            <div class='subTitle'>  Available ACDs</div>\n\
            <select class='availableAcds' multiple='multiple'>\n\
            </select>\n\
            </div>";
    data += "<div class='datacol'>\n\
            <input type='button' class='addLogicalServerss' value='>>'/>";
    data += "<input type='button' class='removeLogicalServerss' value='<<'/></div>";
    data += "<div class='datacol'><div class='subTitle'>ACDs in Server " + serverName + "</div>\n\
             <select class='logicalServersCompelxs' multiple='multiple'></select></div>";
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("Create New", "button", "newAcd");
    data += CreateFiled("Close", "button", "addAcdCancel", "", "_50");
    data += CreateFiled("Edit", "button", "editAcd");
    //data += CreateFiled("Delete", "button", "deleteAcd");
    data += "</div>";
    return data;
}
function addAci(data2) {


    var data = "<script>";
    data += "</script><div class='view_pre mydata'>";
    data += data2;
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("Add Selected", "button", "addServerOk");
    data += CreateFiled("Create New", "button", "newAcd");
    data += CreateFiled("Cancel", "button", "addServerCancel", "", "_50");
    data += "</div>";
    return data;
}
function addAciActions(modelId, comlexId, serverId) {

}



function GroupDeleteNode(type, id, s) {



    if (s === false) {

        var linke = $.trim(type) + "=true";
        linke += "&ID=" + id;
    } else {
        var ids = id.split("/");

        var linke = $.trim(type) + "=true";
        linke += "&ID=" + ids[1];
    }



    $.get("ajax/views/groupView/createNode.jsp?" + linke, function(data) {


//updatemuGroup(thisModelID, thisGroupId, SCENARIOID)

        showMyloading(".main", "start");





        updatemuGroup(ids[3], thisGroupId, ids[2],true);

    })


}



function UpdateNodeData(values, id, exists, hasStorage) {
    values = values.split(",");


    values[0] = $.trim(values[0]);
    values[1] = $.trim(values[1]);
    values[2] = $.trim(values[2]);
    values[3] = $.trim(values[3]);
    values[4] = $.trim(values[4]);
    values[5] = $.trim(values[5]);
    values[6] = $.trim(values[6]);
    values[7] = $.trim(values[7]);
    values[8] = $.trim(values[8]);
    values[9] = $.trim(values[9]);
    values[10] = $.trim(values[10]);

    var myna = $.trim(values[10]);










    getnewNodeWindwos(myna, false, false, values, exists, hasStorage);

}




function changeCatalogActions(data, id)
{
    $(".catList").change(function() {

        $(".CatalogUChange").attr("id", $(this).val());
    })

    $(".CatalogUChange").click(function() {

        $.get("ajax/views/groupView/changeCatalog.jsp?serverId=" + data + "&index=" + $(this).attr("id") + "&status=getCatsChange&id=" + id, function(data) {

            //   makeWinDows("changeCatalog", "changeCatalog", changeCatalogData(data), 300, 150, 350, null)
            closeWindows("changeCatalog");
            closeWindows("change_Catalog");
        })
    })

}


function changeCatalogData(data)
{
    return data;

}



function newComlexActions(serId, catId) {
    $(".CAT_CONSTRUCTOR_INDEX").change(function() {
        $(".CAT_CPU_INDEX").html("<option>Loading...</option>");

        $.get("ajax/views/groupView/getProcessorsList.jsp?cindex=" + $(this).val() + "&catid=" + catId, function(retdata) {
            $(".CAT_CPU_INDEX").html(retdata);

        })

    })





    $(".newComOk").click(function() {


        var returnData = "";
        returnData += "&name=" + $(".name").val();
        returnData += "&name1=" + $(".name1").val();
        returnData += "&name2=" + $(".name2").val();
        returnData += "&REAL_STORAGE=" + $(".REAL_STORAGE").val();
        returnData += "&EXT_STORAGE=" + $(".EXT_STORAGE").val();
        returnData += "&comOption=" + $(".comOption").val();
        returnData += "&CAT_CONSTRUCTOR_INDEX=" + $(".CAT_CONSTRUCTOR_INDEX").val();
        returnData += "&CAT_CPU_INDEX=" + $(".CAT_CPU_INDEX").val();



        returnData += "&Virtual_Platform=" + $(".Virtual_Platform").val();




        if ($.trim($(".name").val()) == "") {

            $(".name").addClass("require");
            alert("Some Fields Are Required !");
        } else {
            $.get("ajax/views/groupView/newComplex.jsp?serverId=" + serId + "&" + returnData + "&status=save", function(retdata) {

                $(".comName").append("<option value=" + retdata + ">" + $(".name").val() + "</option>");
                //  alert(retdata);
                closeWindows("newComplexWindows");
            })

        }
    })
    $(".newComCancel").click(function() {
        closeWindows("newComplexWindows");

    })
}
function newComlexData(data) {


    return  data;
}

function EditComplexData(data) {


    return  data;
}
function EditComplexActions(data, complexId, catId, id) {

    $(".CAT_CONSTRUCTOR_INDEX").change(function() {
        $(".CAT_CPU_INDEX").html("<option>Loading...</option>");

        $.get("ajax/views/groupView/getProcessorsList.jsp?cindex=" + $(this).val() + "&catid=" + catId, function(retdata) {
            $(".CAT_CPU_INDEX").html(retdata);

        })

    })
    $(".catList").change(function() {
        $(".CAT_CONSTRUCTOR_INDEX").html("<option>Loading...</option>");
        $(".CAT_CPU_INDEX").html("<option>Loading...</option>");
        $.get("ajax/views/groupView/getVendorsList.jsp?catid=" + $(this).val(), function(retdata) {
            $(".CAT_CONSTRUCTOR_INDEX").html(retdata);

            $.get("ajax/views/groupView/getProcessorsList.jsp?cindex=" + $(".CAT_CONSTRUCTOR_INDEX").val() + "&catid=" + $(".catList").val(), function(prodata) {
                $(".CAT_CPU_INDEX").html(prodata);

            });

        });

    })

    $(".editComOk").click(function() {



        if ($(".CAT_CPU_INDEX").val() == null) {
            alert('Processor Model Can not be Empty');

        } else {
            var returnData = "&CAT_CONSTRUCTOR_INDEX=" + $(".CAT_CONSTRUCTOR_INDEX").val();
            returnData += "&CAT_CPU_INDEX=" + $(".CAT_CPU_INDEX").val();



            returnData += "&Virtual_Platform=" + $(".Virtual_Platform").val();
            returnData += "&catIndex=" + $(".catList").val();





            $.get("ajax/views/groupView/editComplex.jsp?com_di=" + complexId + "&serverId=" + data + "&" + returnData + "&status=save&id=" + id, function(retdata) {


            })

            closeWindows("EditComplexWindow");
        }
    })

    $(".editComCancel").click(function() {


        closeWindows("EditComplexWindow");
    })

}


function customizeServerActions(data, serId, id) {


    $(".deleteComplex").click(function() {
        var removeMdl = false;
        var deleteMessage = "Are you sure you want to delete this complex?";
        if ($(".comName").val() !== null) {

            if ($(".comName").children().length === 1) {
                removeMdl = true;
                deleteMessage = "Removing the last complex from the server will remove the server definition for this server, proceed?"
            }
            var deleteComplex = confirm(deleteMessage);
            if (deleteComplex) {
                $.get("ajax/views/groupView/deleteComplex.jsp?com_di=" + $(".comName").val() + "&serverId=" + serId + "&status=delete&id=" + id + "&removeMdl=" + removeMdl + "&nodeData=" + data, function(data) {

                    $(".comName").find('[value="' + $(".comName").val() + '"]').remove();
                })
            }
        }
    })
    $(".editComplex").click(function() {


        if ($(".comName").val() != null) {
            $.get("ajax/views/groupView/editComplex.jsp?com_di=" + $(".comName").val() + "&serverId=" + serId + "&status=create&id=" + id, function(data) {

                makeWinDows("Edit Physical Machine", "EditComplexWindow", EditComplexData(data), 300, 150, 350, null);
            })
        } else {


            alert("Please select complex from the list!");

        }



    })



    $(".changeCatalog").click(function() {

        $.get("ajax/views/groupView/changeCatalog.jsp?serverId=" + serId + "&status=getCats&id=" + id, function(data) {

            makeWinDows("changeCatalog", "change_Catalog", changeCatalogData(data), 300, 150, 350, null)
                    ;
        })
    })


    $(".newComplex").click(function() {

        $.get("ajax/views/groupView/newComplex.jsp?serverId=" + serId + "&status=create", function(myretdata) {

            makeWinDows("new Physical machine", "newComplexWindows", newComlexData(myretdata), 300, 150, 550, 250);

        })
    })



}




function customizeServer(customizeServerretdata) {
    return  customizeServerretdata;
}



function updateNode(graph, id, thCell) {


    mycell = thCell;
    mygraph = graph;


    var ids = id.split("/");
    thisModelID = ids[3];
    var linke = "status=" + ids[0] + "&id=" + ids[1];
    $.get("ajax/views/groupView/getNodeData.jsp?" + linke, function(data) {



        var datau = data.replace("[", "");
        datau = datau.replace("]", "");
        if (ids[0] == "line") {
            UpdateLineData(datau.split(","), ids[1]);
        } else {
            $.get("ajax/views/groupView/getNodeData.jsp?id=" + ids[1] + "&status=hasMDL", function(exists) {
                $.get("ajax/views/groupView/storageOps.jsp?id=" + ids[1] + "&type=hasStorage", function(hasStorage) {




                    UpdateNodeData(datau, ids[1], exists, hasStorage);

                }
                );
            }
            );
        }
    })







}


function creatD_group(G, id, mytext, x, y, style_number, shapetype, height, width, myclass, mstyle) {


    var parent = G.getDefaultParent();
    return  G.insertVertex(parent, null, mytext, 1, 1, 100, 100); // mxGraph.insertVertex(parent, id, value, x, y, width, height, style)
}

function dojs() {
    $(function() {

        $(".MEP_tabs_body").hide();
        $(".MEP_General").show();
        $(".MEP_tabs_header").click(function() {
            $(".MEP_tabs_header").removeClass("act");
            $(this).addClass("act");
            var vi = $(this).attr("id");
            $(".MEP_tabs_body").hide();
            $("." + vi).show();
        });
    });
}

function groupPopupMenu(graph, menu, cell, evt, id) {







    if (cell == null)
    {
        menu.addItem('Node Extended Properties', 'images/toback.gif', function()
        {

        });
    }
    else
    {
        menu.addItem('Node Extended Properties', 'images/toback.gif', function()
        {

            var daa = cell.getId().split("/");
            //  alert (daa[1]);
            if (daa[0] == "group_node") {
                $.get("ajax/engine/returnrow.jsp?table=node&id=" + daa[1], function(r_data) {
                    var srcp = "<script>dojs();</script><style></style>";
                    makeWinDows("Node Extended Properties", "Node_Extended_Properties", Node_Extended_Properties(r_data, srcp), 300, 150, 440, null);
                });
            }

        });
        menu.addSeparator();
        menu.addItem('node properties', 'images/toback.gif', function()
        {




            var daa = cell.getId().split("/");
            //  alert (daa[1]);
            if (daa[0] == "group_node") {

                $.get("ajax/engine/returnrow.jsp?table=node&id=" + daa[1], function(r_data) {


                    makeWinDows("Node Properties", "Node_Properties", Node_Properties(r_data), 300, 150, 380, 170);
                });
            }

        });
        menu.addItem('node Model', 'images/toback.gif', function()
        {


        });
        menu.addItem('node Event', 'images/toback.gif', function()
        {




        });
    }



}

function makg_Group(mode, cont, c1, catid, modid, canEdit, isScenario) {
    thisGroupId = catid;

    // alert(catid + "::" + modid);
    var md = false;
    if (mode == "leftToRight") {
        var md = true;
    } else {
        md = false;
    }

    var container = document.getElementById(cont);
    var graph = new mxGraph(container);
    graph.setCellsMovable(false);
    graph.setTooltips(false);
    graph.setCellsEditable(false);
    graph.setEdgeLabelsMovable(false);
    graph.panningHandler.selectOnPopup = false;
    var keyHandler = new mxKeyHandler(graph);
    graph.getModel().beginUpdate();
    graph.foldingEnabled = false;
    graph.setPanning(true);

    graph.getSelectionModel().setSingleSelection(false);
    /* 
     graph.panningHandler.useLeftButtonForPanning = true;*/
    mack_event_group(graph, catid, modid);


    if (canEdit == "true" && isScenario != "true") {



        graph.setConnectable(true);
        graph.connectionHandler.setCreateTarget(true);
    } else {
        graph.setConnectable(false);
        graph.connectionHandler.setCreateTarget(false);
    }
    new mxRubberband(graph);
    //  graph.panningHandler.useLeftButtonForPanning = true;

    do_layout(graph);
    maGroupKeBarDis();



    var graphIsForceMarqueeEvent = graph.isForceMarqueeEvent;
    graph.isForceMarqueeEvent = function(evt)
    {
        return graphIsForceMarqueeEvent.apply(this, arguments) ||
                mxEvent.isRightMouseButton(evt);
    };


    mxEvent.disableContextMenu(graph.container);

    return graph;
}

function creatE_Group(G, v1, v2, id, type) {


    /*
     
     if (mode=="leftToRight"){
     md=mxEdgeStyle.SideToSide;
     }else{
     md=mxEdgeStyle.TopToBottom;
     }
     */


    var md = mxEdgeStyle.SideToSide;
    var style = G.getStylesheet().getDefaultEdgeStyle();



    var stringStyle = "";

    if ($.trim(type) == "1") {
        stringStyle = "dashed=1";

    }






    style[mxConstants.STYLE_PERIMETER] = mxPerimeter.RectanglePerimeter;
    style[mxConstants.STYLE_GRADIENTCOLOR] = 'red';
    style[mxConstants.STYLE_PERIMETER_SPACING] = 1;
    style[mxConstants.STYLE_SHADOW] = true;
    style[mxConstants.STYLE_ENDARROW] = "none";
    style[mxConstants.STYLE_ROUNDED] = true;


    style = G.getStylesheet().getDefaultEdgeStyle();
    var parent = G.getDefaultParent();
    return   G.insertEdge(parent, id, "", v1, v2, stringStyle); // mxGraph.insertEdge(parent, id, value, source, target, style)



}

function creatNode(G, id, mytext, x, y, style_number, height, width, mstyle) {
    if (height == null || height == "" || height == "0") {
        height = 40
    }
    if (width == null || width == "" || width == "0") {
        width = 90
    }
    var parent = G.getDefaultParent();
    var st = returnStyle2(G, style_number, mstyle);
    if (mytext == "" && mytext == null) {
        mytext = "-";
    }
    G.setHtmlLabels(true);
    /*var Parall = new mxParallelEdgeLayout(G);
     
     Parall.execute(G.getDefaultParent());*/






    var Compos = new mxCompositeLayout(G);
    var Edge = new mxEdgeLabelLayout(G);
    var layout = new mxHierarchicalLayout(G);
    var organic = new mxFastOrganicLayout(G);
    var Circ = new mxCircleLayout(G);
    var Compact = new mxCompactTreeLayout(G, false);
    var layouts = new mxStackLayout(G);
    var Parall = new mxParallelEdgeLayout(G);
    layout.parallelEdgeSpacing = 400;
    layout.execute(G.getDefaultParent());
    return  G.insertVertex(parent, id, "<div class=\"vol\">" + mytext + "</div>", x, y, width, height, "st" + style_number); // mxGraph.insertVertex(parent, id, value, x, y, width, height, style)
}

function getparent(graph, id) {

    var returnData = null;
    var cells = graph.getChildCells(graph.getDefaultParent(), true, true);
    // alert(cells.length);
    for (var i = 0; i < cells.length; i++) {
        //alert(id);
        if (cells[i].isEdge()) {
            // alert(cells[i].target.getId() + "==" + id);
            if (cells[i].target.getId() == id) {
                returnData = cells[i].source;
            }
        }
    }

    return returnData;
}


function moreEvents(G, catid, modid, pro_id, group, heightlight) {


    G.addListener(mxEvent.CELLS_ADDED, function(sender, evt)
    {
        var cell = evt.getProperty("cells");
        if (cell[0].isEdge())
        {
            var ParentSource = cell[0].source;
            var thisSource = cell[0].target;
            var myid = cell[0].target.getId();
            myid = myid.split("/")
            if (myid[1] == null) {
                var sid = ParentSource.getId();
                sid = sid.split("/");
                if (sid[0] != "group") {
                    $.get("ajax/views/groupView/storageOps.jsp?type=nodeType&id=" + sid[1], function(nodeType) {
                        newNode(catid, modid, true, ParentSource, thisSource, G, nodeType);
                    });
                } else {
                    G.removeCells([thisSource]);
                }

            } else {
                newLineData(catid, modid, true, ParentSource.getId(), thisSource.getId(), pro_id, group, heightlight, G);
            }
        } else {
            var mx = new mxgraphClass(G);
            mx.cells = cell;
            mx.setTitle("new Group Node");

            mx.changeStyle({
                STYLE_GRADIENTCOLOR: '#00ff00',
                STYLE_STROKECOLOR: '#00ff00',
                STYLE_FONTCOLOR: '#000000',
                STYLE_FILLCOLOR: '#ccffaa',
                STYLE_IMAGE: 'images/GroupView_new_node.png'
            });




        }




    });








}

function mack_event_group(G, catid, modid, jmodid) {
    maGroupKeBarDis();

    /**
     G.addListener(mxEvent.CLICK, function(sender, evt)
     {
     var cell = evt.getProperty("cell");
     updateNode(G, cell.getId());
     });*/


    G.addListener(mxEvent.CLICK, function(sender, evt)
    {




        //var layout = new mxHierarchicalLayout(G);




        var cell_id = 0;
        var cell = evt.getProperty('cell');
        if (cell != null)
        {
            makeGroupBarEn();
            if (cell.isEdge()) {


                $.get("/modules/mod_nodeproperties/index.jsp?pro_id=" + cell.getId(), function(r_data) {


                    $("#Properties_con").html(r_data);
                })




            } else {


                //mxUtils.alert('cell is vertex, id = '+cell.getId());

                if (cell_id == cell.getId()) {
                } else {


                    var link2 = "?alias=xact&module=NodeProperties&group=groupview_imglobal&pro_id=" + cell.getId();
                    $.get("ajax//engine/get_model_1.jsp" + link2, function(r_data) {



                        $("#Properties_con").html(r_data);
                    })
                    cell_id = cell.getId();
                }


            }
        } else {

            //  maGroupKeBarDis();
        }
    });




    G.getSelectionModel().addListener(mxEvent.CHANGE, function() {


        if (G.getSelectionCell() != null) {
            makeGroupBarEn();

        } else {
            maGroupKeBarDis();
            // makeGroupBarDis();


        }



    })
    G.addListener(mxEvent.DOUBLE_CLICK, function(sender, evt)
    {





        var cell_id = 0;
        var cell = evt.getProperty('cell');
        if (cell != null)
        {
            //  makeGroupBarEn();
            if (cell.isEdge()) {


            } else {


                if (cell_id == cell.getId()) {
                } else {

                    var daa = cell.getId().split("/");
                    if (daa[0] == "group_node") {


                        $.get("ajax/engine/returnValue.jsp?table=node&filde=TYPE&ofilde=ID&id=" + daa[1], function(edata) {


                            $.get("ajax/getServiceComponents.jsp?id= " + cell.getId(), function(retdara) {




                                var myrdata = "";
                                if ($.trim(retdara) == "") {

                                    myrdata = "No component defined for this node";
                                } else {

                                    myrdata = retdara;
                                }


                                makeWinDows("Service Components", "Service_Components", myrdata, 150, 150, 500, null);
                            })
                            // }
                        })


                    }




                    if (daa[0] == "group") {


                        showMyloading(".main", "start");

                        addNewTab(daa[1], daa[3], daa[2]);

                        showMyloading(".main", "end");



                    }

                }




            }


        } else {

            //     makeGroupBarDis();

        }

        //  mxUtils.alert('cell is null');
    });
}
