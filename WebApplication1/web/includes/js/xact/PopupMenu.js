/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function cbar(graph) {
    graph.zoomIn();
    $(".zoomIn").click(function() {
        graph.zoomIn();
    })

    $(".zoomIn").click(function() {
        graph.zoomIn();
    })
    $(".zoomOut").click(function() {
        graph.zoomOut();
    })
    $(".zoomActual").click(function() {
        graph.zoomActual();
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


    var content = "\n\
<div class=\"cbrItmen zoomIn\" title></div>\n\
<div class=\"cbrItmen zoomOut\" title></div>\n\
<div class=\"cbrItmen zoomActual\" title></div>\n\
<div class=\"cbrItmen fit\" title></div>\n\
<div class=\"cbrItmen Print\" title></div>\n\
<div class=\"cbrItmen preview\" title></div>\n\
";
    $(".div_c .tbar").html(content);
}

function sbar(graph, s_id, mod_id, pro_id, locked, canedit) {

    $(function() {

        $(".zoomIn").click(function() {

            graph.zoomIn();
        })
        $(".zoomOut").click(function() {
            graph.zoomOut();
        })
        $(".zoomActual").click(function() {
            graph.zoomActual();
        })

        $(".fit").click(function() {
            graph.fit();
        })
        $(".startRecPath").click(function() {


            recPathStatus(graph);
        })

        $(".Edit").click(function() {

            var ids = graph.getSelectionCell().getId();
            // recPathStatus(graph);

            serviecEdit(ids, graph.getSelectionCell(), graph, s_id, mod_id, pro_id);

        })

        $(".cbrItmen.sbar.delete").click(function() {

            var id = graph.getSelectionCell().getId();

            /*
             var nodeData = graph.getSelectionCells();
             var ids = "";
             for (var a in  nodeData) {
             
             ids += " , " + a.getId().split("/")[1];
             
             
             }
             */

            serviecDelete(id, graph.getSelectionCell(), graph, s_id, mod_id, pro_id);



        })




        /*
         $(".endRecPath").click(function(){
         
         recPathStatus("end");
         })*/




        $(".Print").click(function() {
            var preview = new mxPrintPreview(graph, 1);
            preview.open();
        })



        $(".preview2").toggle(function() {




            /* var Compos = new mxCompositeLayout(graph);*/
            /*var Edge = new mxEdgeLabelLayout(graph);*/





            var layout = new mxHierarchicalLayout(graph);
            layout.execute(graph.getDefaultParent());
        }, function() {
            var Parall = new mxParallelEdgeLayout(graph);
            Parall.execute(graph.getDefaultParent());
        }
        , function() {
            var layouts = new mxStackLayout(graph);
            layouts.execute(graph.getDefaultParent());
        }
        , function() {
            var organic = new mxFastOrganicLayout(graph);
            organic.execute(graph.getDefaultParent());
        }
        , function() {
            var Circ = new mxCircleLayout(graph);
            Circ.execute(graph.getDefaultParent());
        }
        , function() {
            var Compact = new mxCompactTreeLayout(graph, false);
            Compact.execute(graph.getDefaultParent());
        }



        )








        $(".serves_past").click(function() {





            $.get("ajax/views/serviecView/past.jsp?type=serves&modID=" + mod_id + "&sid=" + s_id + "&process_id=" + pro_id, function(r_data) {

                $(".serves_past").addClass("dis");
                //showMessage("info", "&nbsp;&nbsp;&nbsp;ttttt&nbsp;&nbsp;&nbsp;&nbsp;", r_data, "", function() {

                var link2 = "?alias=xact&module=serves&process_id=" + pro_id + "&res_data=" + s_id + "__" + mod_id

                openService(link2);

                // });

            })

        });
        $(".serves_copy").click(function() {



            $(".serves_past").removeClass("dis");
            var copydata = "";
            var cells = graph.getSelectionCells();
            if (cells !== null && cells.length > 0) {
                for (var i = 0; i < cells.length; i++) {

                    copydata += "__" + cells[i].getId();

                }





                setSesstion("copyServesData", copydata);
                showMessage("info", "&nbsp;&nbsp;&nbsp;Objects Copied&nbsp;&nbsp;&nbsp;&nbsp;", "Objects copied to the service view clip board.", "", function() {


                });
            }

        });




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


    // graph.zoomIn();  graph.zoomIn();  graph.zoomIn();  graph.zoomIn();  graph.zoomIn();  graph.zoomIn();  graph.zoomIn();
    var content = "\n\
<div title='Zoom In' class=\"cbrItmen zoomIn\" title></div>\n\
<div title='Zoom to Actual Size' class=\"cbrItmen zoomActual\" title></div>\n\
<div title='Zoom Out' class=\"cbrItmen zoomOut\" title></div>\n\
<div title='Fit to Screen' class=\"cbrItmen fit\" title></div>\n\
<div  class=\"cbrItmen spliter\" title></div>\n\
<div title='Print' class=\"cbrItmen Print\" title></div>\n\
<div title='Preview' class=\"cbrItmen preview\" title></div>\n\
<div title='Record Critical Path' class=\"cbrItmen startRecPath\" title></div>\n\
<div  class=\"cbrItmen spliter\" title></div>";


    if ((s_id == "" || s_id == "0")) {
        content += "<div class=\"cbrItmen copy dis  serves_copy\" title=' copy '></div>";

    }


    if (locked != "true" && canedit == "true" && (s_id == "" || s_id == "0")) {
        content += "<div class=\"cbrItmen dis past serves_past\" title=' Paste '></div><div  class=\"cbrItmen spliter\" title></div>";

        content += "<div title='Edit'  class=\"cbrItmen sbar Edit\" ></div>\n\
<div  title='Delete'class=\"cbrItmen sbar delete\" ></div>\n\
";

    }
    $(".div_serves .tbar").html(content);
}

function get_ViewGroupBar(graph, contertBar, groupID, modid, Canedit, isScenario, pro_id, group, heightlight) {

    $(function() {


        $(".cu_server").click(function() {


            var ids = graph.getSelectionCell().getId();
            ids = ids.split("/");
            // alert(ids);
            var linke = "status=" + ids[0] + "&id=" + ids[1];
            $.get("ajax/views/groupView/getNodeData.jsp?" + linke, function(data) {

                data = data.replace("[", "");
                data = data.replace("]", "");
                data = data.split(",");
                if ($.trim(data[10]) == "SERVER") {
                    $.get("ajax/views/groupView/editServer.jsp?nodeData=" + data + "&ids=" + ids, function(retdata) {

                        makeWinDows("Customize Server ", "customizeServer", retdata, 450, 150, 350, null);
                    })
                }



            })



            // graph.zoomIn();
        })





        $(".delete_item").click(function() {
//ServerNodeOperations
            var Type = "";
            var deletable = true;

            var nodeData = graph.getSelectionCells();
            //     var nodenum = graph.getSelectionCells()[0];

            var ids = "";

            for (var i = 0; i < nodeData.length; i++) {
                ids += "," + nodeData[i].getId().split("/")[1];


            }
            var id = nodeData[0].getId().split("/");



            $.get("ajax/views/groupView/storageOps.jsp?type=diskDeletable&id=" + ids, function(delet) {
                deletable = delet;

                var deletables = deletable.split(",");

                //  alert(deletables.indexOf("false"));
                //console.log(deletables.indexOf("false"))
                if (deletables.indexOf("false") === -1) {
//
                    //    console.log(deletables.indexOf("false"))
                    if (graph.getSelectionCell().isEdge()) {

                        Type = "deleteLine";
                    } else {

                        Type = "deleteNode ";
                    }



                    //   GroupDeleteNode(Type, ids,false);




                    var linke = $.trim(Type) + "=true";
                    linke += "&ID=" + ids;



                    $.get("ajax/views/groupView/createNode.jsp?" + linke, function(data) {
                        showMyloading(".main", "start");

                        updatemuGroup(id[3], thisGroupId, id[2], true);

                    })






                } else {
                    alert("The storage node has servers connected and can't be delted");
                }
            });
        })







        $(".group_past").click(function() {

            $.get("ajax/views/groupView/past.jsp?type=group&modID=" + modid + "&groupID=" + groupID, function(r_data) {


                updatemuGroup(modid, groupID, null, true);

                // afetraGroup(pro_id, group, heightlight);

                $(".group_past").addClass("dis");




            })

        });
        $(".group_copy").click(function() {


            $(".group_past").removeClass("dis");
            var copydata = "";
            var cells = graph.getSelectionCells();
            if (cells !== null && cells.length > 0) {
                for (var i = 0; i < cells.length; i++) {

                    copydata += "__" + cells[i].getId();

                }






                setSesstion("copyGroupData", copydata);
                showMessage("info", "&nbsp;&nbsp;&nbsp;Objects Copied&nbsp;&nbsp;&nbsp;&nbsp;", "Objects copied to the group view clip board.", "", function() {
                });
            }
        });
        $(".edit_node").click(function() {


            updateNode(graph, graph.getSelectionCell().getId(), graph.getSelectionCell());
            // graph.zoomIn();
        })

        $(".zoomIn").click(function() {

            graph.zoomIn();
        })
        $(".zoomOut").click(function() {
            graph.zoomOut();
        })
        $(".zoomActual").click(function() {
            graph.zoomActual();
        })

        $(".fit").click(function() {
            graph.fit();
        })


        $(".create_new").click(function() {
            newNode(groupID, modid);
        })

        $(".Print").click(function() {
            var preview = new mxPrintPreview(graph, 1);
            preview.open();
        })





        var layout = new mxHierarchicalLayout(graph);
        layout.execute(graph.getDefaultParent());


        $(".preview2").toggle(function() {
            alert("1");
            var layout = new mxHierarchicalLayout(graph, true);
            layout.execute(graph.getDefaultParent());
        }, function() {
            alert("2");
            var layout = new mxHierarchicalLayout(graph);
            layout.execute(graph.getDefaultParent());
        }

        , function() {
            alert("3");
            var layout = new mxParallelEdgeLayout(graph);
            layout.execute(graph.getDefaultParent());
        }, function() {
            alert("4");
            var layout = new mxParallelEdgeLayout(graph, false);
            layout.execute(graph.getDefaultParent());
        }
        , function() {
            alert("5");
            var layout = new mxStackLayout(graph, true);
            layout.execute(graph.getDefaultParent());
        }, function() {
            alert("6");
            var layout = new mxStackLayout(graph, false);
            layout.execute(graph.getDefaultParent());
        }
        , function() {
            alert("7");
            var layout = new mxFastOrganicLayout(graph);
            layout.execute(graph.getDefaultParent());
        }, function() {
            alert("8");
            var layout = new mxFastOrganicLayout(graph, false);
            layout.execute(graph.getDefaultParent());
        }
        , function() {
            alert("9");
            var layout = new mxCircleLayout(graph, true);
            layout.execute(graph.getDefaultParent());
        }, function() {

            alert("10");
            var layout = new mxCircleLayout(graph, false);
            layout.execute(graph.getDefaultParent());
        }, function() {

            alert("11");
            var layout = new mxCompactTreeLayout(graph, true);
            layout.execute(graph.getDefaultParent());
        }
        , function() {
            alert("12");
            var layout = new mxCompactTreeLayout(graph, false);
            layout.execute(graph.getDefaultParent());
        }



        )




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

    var content = "\n\
<div class=\"cbrItmen zoomIn\" title></div>\n\
<div class=\"cbrItmen zoomActual\" title></div>\n\
<div class=\"cbrItmen zoomOut\" title></div>\n\
<div class=\"cbrItmen fit\" title></div>\n\
<div  class=\"cbrItmen spliter\" title></div>\n\
<div class=\"cbrItmen Print\" title></div>\n\
<div class=\"cbrItmen preview\" title></div>\n\
<div class=\"cbrItmen preview2\" title></div>\n\
<div  class=\"cbrItmen spliter\" title></div>";
    //  if( (s_id == "" || s_id == "0")){

    // }


    if (isScenario !== true) {
        content += "<div class=\"cbrItmen copy dis  group_copy\" title=' Copy '></div>";
    }

    if (Canedit === true)
    {

        if (isScenario !== true) {

            content += "<div class=\"cbrItmen past dis group_past\" title=' Paste '></div>";

            content += "<div  class=\"cbrItmen spliter\" title></div>";

            content += "<div class=\"cbrItmen  create_new\" title='New Node'></div>";



            content += "  <div class=\"cbrItmen  dis cu_server\" title=' Customize Server'></div>";



            content += " <div class=\"cbrItmen dis edit_node\" title='Edit Node'></div>\n\
<div class=\"cbrItmen dis delete_item\" title='Delete'></div>\n\
";

        } else {
            //∂∂∂  content += "<div class=\"cbrItmen  dis cu_server\" title=' Customize Server'></div>";
        }




    }



    $(contertBar).html(content);
}






