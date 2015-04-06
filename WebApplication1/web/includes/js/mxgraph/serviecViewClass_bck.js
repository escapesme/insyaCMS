

var statr_link = "";
var recPath = 0;
var recPathIds = "";
var recPathsnode = new Array();


var root = new mxCell();
var layer0 = root.insert(new mxCell());
var model = new mxGraphModel(root);
//locked != "true" && canedit


    var nodeWidth = 130;
    var nodeHight = 130;



function layoutService(gra, mode) {


//  var layout =    new mxHierarchicalLayout(gra,mxConstants.DIRECTION_WEST);

    mxHierarchicalLayout.prototype.traverseAncestors = false;
    var layout = new mxHierarchicalLayout(gra, mxConstants.DIRECTION_WEST);
    layout.isVertexMovable = function(cell)
    {
        return true;
    };
    var layoutMgr = new mxLayoutManager(gra);
    layoutMgr.getLayout = function(cell)
    {

        return layout;
    };
    layout.resizeParent = true;
//  layout.fill = true;*/

}





function mack_ServiceEvents(G, s_id, mod_id) {





    G.getSelectionModel().addListener(mxEvent.CHANGE, function() {


        if (G.getSelectionCell() != null) {
            ServesKeBarEN();

        } else {

            ServesKeBarDis();

        }



    })
    var styletemp = "";

    G.addListener(mxEvent.CELLS_FOLDED, function(sender, evt) {
        ServesKeBarDis();

        var cell = evt.getProperty("cells");
        var type = evt.getProperty("collapse");

        if (styletemp === "") {


            styletemp = cell[0].getStyle();
        }



        if (type == true) {
            var html = cell[0].getValue();
            html = html.replace("opened", "");
            cell[0].setValue(html);
        //    cell[0].setStyle(styletemp + ";width=100;height=100;shape=image;verticalAlign=top;verticalLabelPosition=middle;fontColor=#0000000");
            G.removeCells(G.getChildCells(cell[0]));

          //  G.insertVertex(cell[0], null, "", 0, 0, 100, 100, "st10000;");


            insertFNode(G, cell[0].getId(), cell[0],";shape=image;verticalAlign=top;verticalLabelPosition=bottom;fontColor=#0000000")
            G.refresh();
       //     G.updateCellSize(cell[0]);
















        } else {

            var html = cell[0].getValue();
            html = html.replace("par", "par opened");
            cell[0].setValue(html);

  

            cell[0].setStyle( cell[0].getStyle() + ";shape=swimlane;align=center;childCount=25;perimeter=rectanglePerimeter;verticalalign=top; startSize=50;verticalLabelPosition=middle;verticalAlign=top;fontColor=#ffffff;fontSize=12");

            getch(G, s_id, mod_id, cell[0]);

            styletemp = "";
        }









    });
    G.addListener(mxEvent.CLICK, function(sender, evt)
    {



        var cell_id = 0;
        var cell = evt.getProperty('cell');
        if (cell != null)
        {

            ServesKeBarEN();





            if (cell.isEdge()) {


                $.get("modules/mod_nodeproperties/index.jsp?pro_id=" + cell.getId(), function(r_data) {

                    $("#Properties_con").html(r_data);
                })




            } else {


                if (recPath == 1) {

                    recPathdo(cell, G);
                }


//  alert (cell.getId());
//mxUtils.alert('cell is vertex, id = '+cell.getId());

                if (cell_id == cell.getId()) {
                } else {



                    $.get("modules/mod_nodeproperties/index.jsp?pro_id=" + cell.getId(), function(r_data) {



                        $("#Properties_con").html(r_data);
                    })
                    cell_id = cell.getId();
                }

//    alert (cell.getId());


            }
        }
    });
}




function makGService(cont, model, s_id, mod_id, pro_id, locked, canedit) {


    var container = document.getElementById(cont);
    var gra = new mxGraph(container, model);
    // gra.setTooltips(false);
    // gra.setCellsEditable(false);

    gra.setCellsMovable(false);
    gra.setTooltips(false);
    gra.alternateEdgeStyle = 'elbow=vertical';
    gra.setCellsEditable(false);
    gra.setEdgeLabelsMovable(false)






    gra.panningHandler.selectOnPopup = false;
    gra.setAutoSizeCells(true);
    if (mxClient.IS_IE)
    {
        new mxDivResizer(container);
        //  new mxDivResizer(outline);
    }



    // gra.setCellsMovable(false);
    mack_ServiceEvents(gra, s_id, mod_id)
    sbar(gra, s_id, mod_id, pro_id, locked, canedit);
    gra.setAutoSizeCells(true);
    gra.setPanning(true);
    //gra.panningHandler.useLeftButtonForPanning = true;
    ServiceEvents(gra);
    if (locked != "true" && canedit == "true" && (s_id == "" || s_id == "0")) {



        gra.setConnectable(true);
        gra.connectionHandler.setCreateTarget(true);
    } else {
        gra.setConnectable(false);

        gra.connectionHandler.setCreateTarget(false);

    }

    new mxRubberband(gra);
    //   gra.panningHandler.useLeftButtonForPanning = true;
    // mack_evser(gra) ;             
    ServesKeBarDis();



    var graphIsForceMarqueeEvent = gra.isForceMarqueeEvent;
    gra.isForceMarqueeEvent = function(evt)
    {
        return graphIsForceMarqueeEvent.apply(this, arguments) ||
                mxEvent.isRightMouseButton(evt);
    };


    mxEvent.disableContextMenu(gra.container);

    return gra;
}





function creatDService(G, parent, id, mytext, x, y, height, width, style_number, mstyle, layer0, image) {
    if (height == null || height == "" || height == "0") {
        height = 40
    }
    if (width == null || width == "" || width == "0") {
        width = 90
    }
    if (parent == "") {
        parent = layer0;
    }
    if (mytext == "" && mytext == null) {
        mytext = "";
    }

    var moreStyle = "autosize=1;";
    if (image != "") {


        moreStyle += "image=" + image;
    }


//"width="+nodeWidth+"px;height="+nodeHight+"px;

    G.setHtmlLabels(true);
    var st = returnStyle2(G, style_number, mstyle);

    var myr = G.insertVertex(parent, id, "<div class='texth'>" + mytext + "</div><div class='texthcont'></div>", x, y, nodeWidth, nodeHight, "st" + style_number + ";labelPosition=center;lineHight=1.2;overflow=fill;" + moreStyle + ";verticalAlign=top;verticalLabelPosition=bottom;fontColor=#0000000;fontSize=12"); // G.insertVertex(parent, null, mytext , x, y, width,height,"st"+style_number+shapetype );// mxGraph.insertVertex(parent, id, value, x, y, width, height, style)



    return myr;
}




function creatEService(G, parent, v1, v2, value, mode, id) {



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
    //style[mxConstants.STYLE_PERIMETER] = PERIMETER_;

    // RECTANGLE RHOMBUS TRIANGLE ELLIPSE




    style[mxConstants.STYLE_EDGE] = mxEdgeStyle.ElbowConnector; // EntityRelation   mxEdgeStyle.EntityRelationmxEdgeStyle.OrthConnector mxEdgeStyle.Loop  mxEdgeStyle.SegmentConnector   mxEdgeStyle.SideToSide  mxEdgeStyle.TopToBottom  mxGraph.defaultLoopStyle  mxEdgeStyle.ElbowConnector
    G.getStylesheet().putCellStyle('ROUNDED', style);
    if (parent == "") {
        parent = G.getDefaultParent();
    }


    return   G.insertEdge(parent, id, value, v1, v2, 'ROUNDED;'); // mxGraph.insertEdge(parent, id, value, source, target, style)



}












isSesstion("copyServesData", function(bo) {
    if ($.trim(bo) == "true") {
        $(".cbrItmen.serves_past").removeClass("dis");
    }
})



function ServesKeBarDis()
{


    $(".cbrItmen.serves_copy").addClass("dis");


    $(".cbrItmen.sbar.delete").addClass("dis");
    $(".cbrItmen.sbar.Edit").addClass("dis");



}

function ServesKeBarEN()
{

    $(".cbrItmen.serves_copy").removeClass("dis");

    $(".cbrItmen.sbar.delete").removeClass("dis");
    $(".cbrItmen.sbar.Edit").removeClass("dis");



}





function recPathdo(cell, graph) {

    var oldname = graph.getCellStyle(cell)[mxConstants.STYLE_IMAGE]


    oldname = oldname.replace("_highlight", "");
    var newname = oldname.replace(".png", "_highlight.png");
    graph.setCellStyles(mxConstants.STYLE_IMAGE, newname, [cell]);
    recPathIds += "__" + cell.getId();
    recPathsnode.push(cell);
}



function Send_Path_data(recPathIds) {


    var data = "<script>";
    data += " Send_Path_actions('" + recPathIds + "');</script><div class=\"mydata\"><div>\n\
<div class=\"frm_row do_left\" >\n\
<div class=\"frm_label\">Name</div><div class=\"frm_input\">\n\
<input class=\"Send_Path_data_name\" ></div></div> \n\
</div></div> \n\
<div class=\"do_center\"><input type=\"button\" class=\"Send_Path_data_send\"  value=\"Save\">\n\
 <input type=\"button\" class=\"Send_Path_data_Close\"  value=\"Cancel\"></div>";

    return data;
}




function Send_Path_actions(recPathIds) {


    $(function() {
        $(".Send_Path_data_Close").click(function() {


            closeWindows("Send_Path");
        })

        $(".Send_Path_data_send").click(function() {

            $.get("ajax/service/servicePath.jsp?ids=" + recPathIds + "&name=" + $(".Send_Path_data_name").val(), function(data) {
// alert(data);


                closeWindows("Send_Path");
                /* 
                 
                 var cells=graph.getChildCells(graph.getDefaultParent(), true, true);
                 for(var i=0 ; i<cells.length ;i++){
                 
                 if (!cells[i].isEdge()){
                 
                 var oldname=graph.getCellStyle(cells[i])[mxConstants.STYLE_IMAGE];
                 oldname= oldname.replace("_highlight", "");
                 graph.setCellStyles(mxConstants.STYLE_IMAGE, oldname, [cells[i]]);  
                 
                 
                 }
                 }*/

                for (var i = 0; i < recPathsnode.length; i++) {

                    if (!recPathsnode[i].isEdge()) {

                        var oldname = graph.getCellStyle(recPathsnode[i])[mxConstants.STYLE_IMAGE];
                        oldname = oldname.replace("_highlight", "");
                        graph.setCellStyles(mxConstants.STYLE_IMAGE, oldname, [recPathsnode[i]]);
                    }
                }






                recPathsnode = new Array();
                $(".cbrItmen.startRecPath").removeClass("statrec");
                $(".cbrItmen.startRecPath").attr("title", "Record Critical Path");
                recPath = 0;
                recPathIds = "";
                alert("Critical Path Recording Stopped.");
            });


        });


    });







}


var graph = null;
function recPathStatus(G) {
    graph = G;
    if (recPath == 1) {
        if (recPathIds != "") {
            makeWinDows("Save Critical Path", "Send_Path", Send_Path_data(recPathIds, graph), 350, 150, 500, null);
        }




    } else {

        recPath = 1;
        recPathIds = "";
        alert("Critical Path recording has started. Selected the nodes to build your path and then click on stop button.");
        $(".cbrItmen.startRecPath").addClass("statrec");
        $(".cbrItmen.startRecPath").attr("title", "Stop Recording Critical Path");
    }



    /*
     if (status=="start"){
     
     
     recPath=1;
     
     }else{
     if (recPathIds!=""){
     
     makeWinDows("Send Path", "Send_Path" ,Send_Path_data(recPathIds), 350, 150,500,null);
     }
     
     
     
     recPath=0;
     recPathIds="";
     
     }*/





}










function dooutline(gra) {
//   $("#seoutlineContainer_con").html("");



    var outline = document.getElementById('seoutlineContainer_con');
    var outln = new mxOutline(gra, outline);
    outln.createSizer();
}






function getstyle(type, act) {



    var myArray = arraystyle(type, act);
    /*STYLE_GRADIENTCOLOR,*STYLE_STROKECOLOR,*STYLE_FILLCOLOR,*STYLE_FONTCOLOR,*STYLE_FONTFAMILY,STYLE_SHADOW,,STYLE_LABEL_POSITION,STYLE_SHAPE,STYLE_IMAGE*/
//alert(myArray);


    return makstyle(myArray[0], myArray[1], myArray[2], myArray[3], myArray[4], myArray[5], myArray[6], myArray[7], myArray[8], myArray[9], myArray[10], myArray[11], myArray[12], myArray[13], myArray[14]);
}

function getstyleSeting(type) {

    var myArray2 = arraystyleseting(type);
    return myArray2;
}

function getch(G, s_id, mod_id, cell)
{
    //this function gets the children of the node clicked    
    G.getModel().beginUpdate();
    G.removeCells(G.getChildCells(cell));
    //get all information about the children of the node selected and save it in an array.
    //
    $.get("ajax/service/serviceView.jsp?id=" + cell.getId() + "&type=nodes", function(data222) {



        var vrdata222 = $.trim(data222);
        var myarr1 = vrdata222.split(";");
        if (myarr1[0] != "" && myarr1[0] != null) {

            var myArray = new Array();
            
            var n = 0;
            for (i = 0; i < myarr1.length; i++) {



                if (myarr1[i] != "") {
                    n++
                    var myretdata1 = myarr1[i].split("__");
                    if (myretdata1[0] != "" && myretdata1[0] != null) {


                        // set the properties of the node

                        if (myArray.lastIndexOf(my_id1) == -1) {
                            myArray[n] = my_id1;
                            var my_name1 = myretdata1[1];
                            var my_id1 = myretdata1[0];
                            var id_p = myretdata1[3];
                            var tag = myretdata1[2];
                            var myid22 = "SERVICE_PROCESS_NODES" + "/" + my_id1 + "/" + s_id + "/" + mod_id;
                            var myAn = new Array();
                            var myAn2 = new Array();
                            myAn2[0] = cell;
                            G.orderCells(false, myAn2);
                            // myAn[0]=window["l_node11"+my_id1];
                            var style1312481383279 = getstyle(tag, myretdata1[4]);
                            var st = returnStyle2(G, tag + my_id1 + 10000, style1312481383279);

                            var myarrays = arraystyleseting(tag + my_id1);


                         my_name1=  "<div class='texth'>" + my_name1 + "</div><div class='texthcont'></div>"
                            //draw the node             
                         
                            window["l_node11" + my_id1] = G.insertVertex(cell, myid22, my_name1, 100, 100, nodeWidth, nodeHight, "st" + tag + my_id1 + "10000;verticalAlign=top;verticalLabelPosition=bottom;");

                            // "in" means the node has children. if so make a dummy node under it and show it as collapsed
                            if (id_p == "in") {


                                window["l_node11" + my_id1 + "ch"] = G.insertVertex(window["l_node11" + my_id1], myid22, my_name1, 0, 0, nodeWidth, nodeHight, "st10000;");
                                myAn[0] = window["l_node11" + my_id1];
                                G.foldCells(true, true, myAn);
                                var geo = G.getModel().getGeometry(window["l_node11" + my_id1]);
                                window["l_node11" + my_id1].setStyle(window["l_node11" + my_id1].getStyle() + "verticalAlign=top;verticalLabelPosition=bottom;");
                                geo.width = nodeWidth;
                                geo.height = nodeHight;
                                window["l_node11" + my_id1].setGeometry(geo);
                                var layouthhh = new mxHierarchicalLayout(G, mxConstants.DIRECTION_WEST);
                                layouthhh.execute(cell);
                                G.updateCellSize(cell);

                                G.refresh(window["l_node11" + my_id1]);
                            }





                        }
                    }
                }
            }

        }







        // get edges by ajax for all the links of the children       

        $.get("ajax/service/serviceView.jsp?id=" + cell.getId() + "&type=edgs", function(data) {

            newCertion = false;
            //myID + "__" + link_ID1 +"__"+myFROM_ID + "__" + myTO_ID + ";";
            var vrdata222 = $.trim(data);
            var myarr = vrdata222.split(";");
            var myArrayedg = new Array();
            var myd = 0;
            for (i = 0; i < myarr.length; i++) {
                myd++;
                var myretdata = myarr[i].split("__");
                if (myretdata[1] != "" && myretdata[1] != null) {

                    if (myArrayedg.lastIndexOf(myretdata[1]) == -1) {
                        myArrayedg[myd] = myretdata[1];
                        // create property for this link          

                        var myid22 = "SERVICE_PROCESS_LINKS" + "/" + myretdata[1] + "/" + s_id + "/" + mod_id;
                        //draw link    
                        G.insertEdge(cell, myid22, "", window["l_node11" + myretdata[2]], window["l_node11" + myretdata[3]]);
                    }
                }




                if (i == myarr.length - 1) {

                    newCertion = true;


                }
            }







            $("#xactsev svg").css("height", "100%");
            //   G.fit(); 
            G.refresh();
        })


        $("#xactsev svg").css("height", "100%");
        if ($("#xactsev svg").height() == 0) {

            $("#xactsev svg").css("height", "100%");
            $("#xactsev svg").removeAttr("height");
            // $("#xactsev svg").attr("height",505);


        }

        // G.fit(); 
        G.refresh();
        G.getModel().endUpdate();
    })





    $("#xactsev svg").css("height", "100%");
// $("#xactsev svg").attr("height",505);
}

function insertFNode(G, my_id1, parent,style) {


    var wid = 130;
    var hei = 130;

    window["l_node11" + my_id1 + "ch"] = G.insertVertex(parent, null, "",1 , 1, wid, hei, "st10000;");
 
     
    //G.foldCells(true, true, [parent]);
    var geo = G.getModel().getGeometry(parent);
    parent.setStyle(parent.getStyle() + style);
    
    geo.width = wid;
    geo.height = hei;
    parent.setGeometry(geo);
    
    /*
    var layouthhh = new mxHierarchicalLayout(G, mxConstants.DIRECTION_WEST);
   layouthhh.execute(parent);
    G.updateCellSize(parent);

    G.refresh(parent);*/


}




var newCertion = true;



var adding = false;
function eventsAfter(g, s_id, Mod_id, pro_id) {

    g.addListener(mxEvent.CELLS_ADDED, function(sender, evt)
    {

        var cell = evt.getProperty("cells");
        if (cell[0].isEdge())
        {


            var trg = null;

            var tid = 0;
            var trgs = null;
            if (cell[0].target != null) {
                tid = cell[0].target.getId();

                trgs = tid.split("/");
            }
            if (cell[0].target != null && trgs[1] == null) {
                adding = true;
                trg = cell[0].target.getId();





                var sc = cell[0].source;
                var ter = cell[0].target;


                // alert(sc.getId() + "::" + ter.getId());



                if ($.trim(cell[0].source.getValue()) != "End" && $.trim(cell[0].source.getValue()) != "end") {



                    var ajparentID;
                    if (cell[0].source.parent.getId() == "1") {

                        ajparentID = cell[0].source.getId();
                    } else {

                        ajparentID = cell[0].source.parent.getId();
                    }


                    var mylink = "status=nodeData&id=" + ajparentID;
                    $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(p_data) {
                        p_data = ArrayJP2JS(p_data);
                        var mylink = "status=nodeData&id=" + cell[0].source.getId();
                        $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(s_data) {
                            s_data = ArrayJP2JS(s_data);

                            if ($.trim(s_data[1]) !== $.trim("collector")) {

                                newProcess(g, cell[0].source, cell[0].target, s_id, Mod_id, pro_id, p_data, s_data);

                            } else {
                                alert("You can't create nodes downstream a collector");
                                g.removeCells([cell[0].target]);
                                g.refresh();
                            }

                        });
                    });





                } else {

                    g.removeCells([cell[0].target]);
                    g.refresh();

                }






            } else {


                if (newCertion == true) {


                    if (cell[0].source.parent.getId() == cell[0].target.parent.getId()) {
                        var mylink = "status=nodeData&id=" + cell[0].target.getId();
                        $.get("ajax/views/serviecView/getData.jsp?" + mylink, function(s_data) {
                            var nodeData = ArrayJP2JS(s_data);
                            if ($.trim(nodeData[1]) !== $.trim("insertion")) {
                                makeWinDows("Create Service Node", "newProcess", newProcessline(g, cell[0].source, cell[0].target, s_id, Mod_id, pro_id, cell[0]), 300, 3, 550, null);
                            } else {
                                alert("Insertion can't have nodes upstream");

                            }
                        })



                    } else {

                        g.removeCells([cell[0]]);
                        g.refresh();

                    }


                }

            }

        } else {

            var cid = cell[0].getId();
            if (cid.indexOf("/") > -1) {

            } else {
                var mx = new mxgraphClass(g);
                mx.cells = [cell[0]];
                mx.setTitle("new Service Node");

                mx.changeStyle({
                    STYLE_GRADIENTCOLOR: '#00ff00',
                    STYLE_STROKECOLOR: '#00ff00',
                    STYLE_FONTCOLOR: '#000000',
                    STYLE_FILLCOLOR: '#ccffaa',
                    STYLE_IMAGE: 'images/service_new_node_circle.png'


                });
                mx.cells = null;
            }



        }


    });


}
/*
 function tt(graph) {
 
 
 
 var model = graph.getModel();
 model.beginUpdate();
 try {
 var pt = graph.getPointForEvent(evt);
 var vertex = graph.getModel().cloneCell(prototype);
 vertex.geometry.x = pt.x;
 vertex.geometry.y = pt.y;
 graph.addCell(vertex);
 graph.setSelectionCell(vertex);
 for (var c in graph.model.cells) {
 var cell = graph.model.cells[c];
 if (cell.isVertex() == true) {
 if (cell.id != vertex.id) {
 var targetGeo = vertex.geometry;
 var sourceGeo = cell.geometry;
 if ((Math.abs(targetGeo.getCenterX() - sourceGeo.getCenterX()) - targetGeo.width / 2 - sourceGeo.width / 2 < 50) &&
 (Math.abs(targetGeo.getCenterY() - sourceGeo.getCenterY()) - targetGeo.height / 2 - sourceGeo.height / 2 < 50)) {
 
 graph.insertEdge(cell.parent, null, "", cell, vertex);
 break;
 }
 }
 }
 }
 }
 finally {
 model.endUpdate();
 }
 }
 */







function ServiceEvents(g) {
// g.fit();





    var foldingHandler = function(sender, evt)
    {
        var cells = evt.getProperty('cells');
        for (var i = 0; i < cells.length; i++)
        {
// g.fit();

            var myc = cells[i];
            var geo = g.getModel().getGeometry(myc);
            if (geo.alternateBounds != null)
            {
// g.fit();



                if (g.isCellCollapsed(cells[i]))
                {
//     g.fit();

// $(".fit").click();
// alert("sdfsd");

                } else {
//   g.fit();

                }

            }

//                                       
        }

// g.fit();
    }
    g.addListener(mxEvent.FOLD_CELLS, foldingHandler);
}















if (!Array.prototype.lastIndexOf)
{
    Array.prototype.lastIndexOf = function(elt /*, from*/)
    {
        var len = this.length;
        var from = Number(arguments[1]);
        if (isNaN(from))
        {
            from = len - 1;
        }
        else
        {
            from = (from < 0)
                    ? Math.ceil(from)
                    : Math.floor(from);
            if (from < 0)
                from += len;
            else if (from >= len)
                from = len - 1;
        }

        for (; from > -1; from--)
        {
            if (from in this &&
                    this[from] === elt)
                return from;
        }
        return -1;
    };
}


function updatesize(g, cell) {


    g.updateCellSize(cell);
//g.updateCellSize(cell) ;


}









function mack_evser(G) {


    G.addListener(mxEvent.CLICK, function(sender, evt)
    {

        var cell_id = 0;
        var cell = evt.getProperty('cell');
        if (G.getModel().isEdge(cell))
        {



            $.get("modules/mod_nodeproperties/index.jsp?pro_id=" + cell.getId(), function(r_data) {


                $("#Properties_con").html(r_data);
            })




        }







    });
}



