


(function($) {
    $.fn.charts = function(options) {


        var settings = $.extend({point: "",
            rowids: "",
            proid: "",
            moid: "",
            sid: "",
            ids: null,
            cols: null,
            colsBottom: null,
            rows: null,
            width: 1000,
            height: 300,
            font: "8pt Verdana, sans-serif"
        }, options);


        var rightDataWidth = 0;
        var bottomDataheight = 30;
        var leftDataWidth = 180;
        var topDataheight = 30;

        var chartWidth = (settings.width - (leftDataWidth + rightDataWidth));
        var charHeight = (settings.height - (topDataheight + bottomDataheight));

        return this.each(function() {
            var rowcont = settings.rows.length;
            var colscount = settings.cols.length;

            var $this = $(this);

            $this.css("background-color", "rgba(255,255,255,0.5)");
            /* $this.css("border", "2px solid #111");*/
            var colscountwidth = chartWidth / colscount;
            var rowscountheight = charHeight / rowcont;
            $($this).drawRect({
                layer: true,
                fillStyle: "#E8EEF7",
                strokeStyle: "#333",
                width: chartWidth, height: charHeight,
                strokeWidth: 2,
                x: leftDataWidth, y: topDataheight, fromCenter: false
            });
            var thx = 0;
            var thy = 0;
            var inum = 0;
            for (var i = 0; i <= colscount; i++) {
                inum++;
                thy = 0;

                /* Top Data*/

                $($this).drawText({
                    id: settings.ids[i],
                    layer: true,
                    fillStyle: "#111",
                    color: "#111",
                    strokeWidth: 0,
                    x: leftDataWidth + thx, y: topDataheight - 20,
                    font: settings.font,
                    text: settings.cols[i],
                    cursor: "pointer",
                    scale: 1, fromCenter: false,
                    maxWidth: colscountwidth,
                    click: function(layer) {


                        call(1, "#show_data");
                        var x2 = new Array(defajax);
                        ajaxAbort(x2);

                        var resid = settings.proid + "__" + settings.moid + "__" + layer.id;


                        defajax = loadAjax("ajax/results/diagnosisRepair.jsp?poent=" + settings.point + "&res_data=" + resid, ".getresuilt", "all,main");


                    }, mouseover: function(layer) {

                        $(".toolTip").stop(true, true).fadeIn();
                        $(".toolTip").html("Click to View Diagnosis & Repair");
                        $(".toolTip").css("top", (layer.eventY + 20) + "px");
                        $(".toolTip").css("left", (layer.eventX + 20) + "px");

                    },
                    mousemove: function(layer) {

                        $(".toolTip").css("top", (layer.eventY + 20) + "px");
                        $(".toolTip").css("left", (layer.eventX + 20) + "px");

                    },
                    mouseout: function(layer) {
                        $(".toolTip").stop(true, true).fadeOut();
                    }


                });
                /* Top Data*/


                /* Bottom Data*/
                $($this).drawText({
                    layer: true,
                    fillStyle: "#111",
                    strokeWidth: 0,
                    x: leftDataWidth + thx, y: charHeight + 40,
                    font: settings.font,
                    text: settings.colsBottomView[i],
                    scale: 1, fromCenter: false,
                    maxWidth: colscountwidth



                });

                /* Bottom Data*/
                thx += colscountwidth;


                $($this).escanvas({type: "line",
                    strokeStyle: "#000",
                    strokeWidth: 0.3,
                    x: leftDataWidth, y: topDataheight,
                    x1: thx, y1: thy,
                    x2: thx, y2: charHeight

                });

            }







            var thx = 0;
            var thy = 0;

            for (var i = 0; i < rowcont; i++) {





                /* Rows Label  Data*/

                $($this).drawText({
                    layer: true,
                    fillStyle: "#111",
                    strokeWidth: 0,
                    x: 5, y: topDataheight + thx,
                    font: settings.font,
                    text: settings.rows[i][0][0], /*draggable: true,*/
                    scale: 1, fromCenter: false, maxWidth: leftDataWidth

                });

                /* Rows Label  Data*/

                thx += rowscountheight;
                thy = 0;
                $($this).escanvas({type: "line",
                    strokeStyle: "#000",
                    strokeWidth: 0.3,
                    x: leftDataWidth, y: topDataheight,
                    x1: 0, y1: thx,
                    x2: chartWidth, y2: thx

                });



                for (var s = 0; s < settings.rows[i].length; s++) {
                    var myi = i;


                    /* Value  Data*/


                    var bkcolor = settings.rows[myi][s][1];
                    var value = settings.rows[myi][s][2];
                    var display = settings.rows[myi][s][4];
                    var colnumber = settings.rows[myi][s][3] - 1;
                    var rownumber = myi;

                    var myx = (colnumber * colscountwidth) + leftDataWidth;
                    var myy = (rownumber * rowscountheight) + topDataheight;

                    var mywidthper = (value / settings.colsBottom[colnumber]);

                    var mywidth = (mywidthper * colscountwidth);

                    if (mywidth > colscountwidth && i != settings.rows.length - 1) {
                        mywidth = colscountwidth;
                        bkcolor = "red";

                    }

                    if (mywidth > chartWidth) {
                        mywidth = chartWidth;

                    }

                    function doclick(layer) {
                        if (layer.myrows - 1 != layer.myi) {
                            var resid = settings.proid + "__" + settings.moid + "__" + layer.colid;
                            var id = layer.rowid;

                            call(2, "#show_datasmv");
                            var x2 = new Array(defajax);
                            ajaxAbort(x2);

                            if (id == null) {

                                id = "0"
                            }
                            //ajax/results/smv/smv_s2.jsp?template=0& id=1364407908201&res_id=1261__1364407905029__1367281466367&point=0
                            defajax = loadAjax("ajax/results/smv/smv_s2.jsp?template=0&id=" + id + "&res_id=" + resid + "&point=" + settings.point, ".datasmv", "start,main");

                        }
                    }

                    if (i < (rowcont - 1)) {

                        $($this).drawRect({
                            myrows: rowcont,
                            myi: i,
                            colid: settings.ids[colnumber],
                            rowid: settings.rowids[s + 1],
                            value: value,
                            display: display,
                            layer: true,
                            fillStyle: bkcolor,
                            x: myx, y: myy + 2,
                            width: mywidth,
                            height: rowscountheight - 4,
                            opacity: 0.75,
                            cursor: "pointer",
                            fromCenter: false,
                            /*  draggable: true,*/
                            bringToFront: true,
                            mouseover: function(layer) {
                                $(".toolTip").stop(true, true).fadeIn();
                                $(".toolTip").html("Work Duration: " + layer.display + ".<br> Click to View SMV");
                                $(".toolTip").css("top", (layer.eventY + 20) + "px");
                                $(".toolTip").css("left", (layer.eventX + 20) + "px");
                            },
                            mousemove: function(layer) {
                                $(".toolTip").css("top", (layer.eventY + 20) + "px");
                                $(".toolTip").css("left", (layer.eventX + 20) + "px");
                            },
                            mouseout: function(layer) {
                                $(".toolTip").stop(true, true).fadeOut();
                            },
                            click: doclick


                        });
                        /* Value  Data for end to end*/

                    } else {
                        $($this).drawRect({
                            myrows: rowcont,
                            myi: i,
                            colid: settings.ids[colnumber],
                            rowid: settings.rowids[s + 1],
                            value: value,
                            display: display,
                            layer: true,
                            fillStyle: "#EA6C01",
                            x: myx, y: (myy + 2) + (rowscountheight - 4) / 4,
                            width: mywidth,
                            height: (rowscountheight - 4) / 2,
                            opacity: 0.75,
                            cursor: "pointer",
                            fromCenter: false,
                            bringToFront: true,
                            mouseover: function(layer) {

                                $(".toolTip").stop(true, true).fadeIn();
                                $(".toolTip").html("End to End: " + layer.display);
                                $(".toolTip").css("top", (layer.eventY + 20) + "px");
                                $(".toolTip").css("left", (layer.eventX + 20) + "px");

                            },
                            mousemove: function(layer) {

                                $(".toolTip").css("top", (layer.eventY + 20) + "px");
                                $(".toolTip").css("left", (layer.eventX + 20) + "px");

                            },
                            mouseout: function(layer) {
                                $(".toolTip").stop(true, true).fadeOut();
                            }





                        });




                    }




                }

            }

        })


    };
    $.fn.throughputCharts = function(options) {

var widthModifier=5/100;
        var settings = $.extend({point: "",
            rowids: "",
            proid: "",
            moid: "",
            sid: "",
            ids: null,
            cols: null,
            rows: null,
            width: 950,
            height: 300,
            font: "8pt Verdana, sans-serif"
        }, options);




        var rightDataWidth = 0;
        var bottomDataheight = 30;

        var leftDataWidth = 180;
        var topDataheight = 30;




        var chartWidth = (settings.width - (leftDataWidth + rightDataWidth));
        var charHeight = (settings.height - (topDataheight + bottomDataheight));




        return this.each(function() {
            var rowcont = settings.rows.length;
            var colscount = settings.cols.length;




            var $this = $(this);



            $this.css("background-color", "rgba(255,255,255,0.5)");
            /* $this.css("border", "2px solid #111");*/


            var colscountwidth = chartWidth / colscount;
            var rowscountheight = charHeight / rowcont;


            $($this).drawRect({
                layer: true,
                fillStyle: "#E8EEF7",
                strokeStyle: "#333",
                width: chartWidth, height: charHeight,
                strokeWidth: 2,
                x: leftDataWidth, y: topDataheight, fromCenter: false
            });





            var thx = 0;
            var thy = 0;

            var inum = 0;


            for (var i = 0; i <= colscount; i++) {

                inum++;





                thy = 0;

                /* Top Data*/



                $($this).drawText({
                    id: settings.ids[i],
                    layer: true,
                    fillStyle: "#111",
                    color: "#111",
                    strokeWidth: 0,
                    x: leftDataWidth + thx, y: topDataheight - 20,
                    font: settings.font,
                    text: settings.cols[i],
                    scale: 1, fromCenter: false,
                    cursor: "pointer",
                    maxWidth: colscountwidth,
                    click: function(layer) {


                        call(1, "#show_data");
                        var x2 = new Array(defajax);
                        ajaxAbort(x2);

                        var resid = settings.proid + "__" + settings.moid + "__" + layer.id;


                        defajax = loadAjax("ajax/results/diagnosisRepair.jsp?poent=" + settings.point + "&res_data=" + resid, ".getresuilt", "all,main");


                    }, mouseover: function(layer) {

                        $(".toolTip").stop(true, true).fadeIn();
                        $(".toolTip").html("Click to View Diagnosis & Repair");
                        $(".toolTip").css("top", (layer.eventY + 20) + "px");
                        $(".toolTip").css("left", (layer.eventX + 20) + "px");

                    },
                    mousemove: function(layer) {

                        $(".toolTip").css("top", (layer.eventY + 20) + "px");
                        $(".toolTip").css("left", (layer.eventX + 20) + "px");

                    },
                    mouseout: function(layer) {
                        $(".toolTip").stop(true, true).fadeOut();
                    }


                });
                /* Top Data*/


                /* Bottom Data*/


                /* Bottom Data*/
                thx += colscountwidth;


                $($this).escanvas({type: "line",
                    strokeStyle: "#000",
                    strokeWidth: 0.3,
                    x: leftDataWidth, y: topDataheight,
                    x1: thx, y1: thy,
                    x2: thx, y2: charHeight

                });

            }







            var thx = 0;
            var thy = 0;

            for (var i = 0; i < rowcont; i++) {





                /* Rows Label  Data*/

                $($this).drawText({
                    layer: true,
                    fillStyle: "#111",
                    strokeWidth: 0,
                    x: 5, y: topDataheight + thx,
                    font: settings.font,
                    text: settings.rows[i][0][0], /* draggable: true,*/
                    scale: 1, fromCenter: false, maxWidth: leftDataWidth

                });

                /* Rows Label  Data*/

                thx += rowscountheight;
                thy = 0;
                $($this).escanvas({type: "line",
                    strokeStyle: "#000",
                    strokeWidth: 0.3,
                    x: leftDataWidth, y: topDataheight,
                    x1: 0, y1: thx,
                    x2: chartWidth, y2: thx

                });



                for (var s = 0; s < settings.rows[i].length; s++) {
                    var myi = i;


                    /* Value  Data*/


                    var bkcolor = settings.rows[myi][s][1];
                    var value = settings.rows[myi][s][2];
                    var display = settings.rows[myi][s][4];
                    var display2 = settings.rows[myi][s][5];
                    var colnumber = settings.rows[myi][s][3] - 1;
                    var rownumber = myi;

                    var myx = (colnumber * colscountwidth) + leftDataWidth;
                    var myy = (rownumber * rowscountheight) + topDataheight;

                    var mywidthper = (value);
                    
                    var mywidth = (mywidthper * colscountwidth);
                    if(mywidth>0 &&mywidth<(colscountwidth*widthModifier)){
                        mywidth=colscountwidth*widthModifier;
                    }
                    if (mywidth > colscountwidth) {
                        mywidth = colscountwidth;
                        bkcolor = "red";

                    }

                    if (mywidth > chartWidth) {
                        mywidth = chartWidth;

                    }

                    function doclick(layer) {
                        if (layer.myrows - 1 != layer.myi) {
                            var resid = settings.proid + "__" + settings.moid + "__" + layer.colid;
                            var id = layer.rowid;

                            call(2, "#show_datasmv");
                            var x2 = new Array(defajax);
                            ajaxAbort(x2);

                            if (id == null) {

                                id = "0"
                            }
                            defajax = loadAjax("ajax/results/smv/smv_s2.jsp?template=0&id=" + id + "&res_id=" + resid + "&point=" + settings.point, ".datasmv", "start,main");

                        }
                    }
                    $($this).drawRect({
                        myrows: rowcont,
                        myi: i,
                        colid: settings.ids[colnumber],
                        rowid: settings.rowids[s + 1],
                        value: value,
                        display: display,
                        work:display2,
                        layer: true,
                        fillStyle: bkcolor,
                        x: myx, y: myy + 2,
                        width: mywidth,
                        height: rowscountheight - 4,
                        opacity: 0.75,
                        cursor: "pointer",
                        fromCenter: false,
                        /*  draggable: true,*/
                        bringToFront: true,
                        mouseover: function(layer) {

                            $(".toolTip").stop(true, true).fadeIn();
                            $(".toolTip").html("% of Max Throughput: " + layer.display + ".<br> Work Processed: " + layer.work + ".<br>Click to View SMV");
                            $(".toolTip").css("top", (layer.eventY + 20) + "px");
                            $(".toolTip").css("left", (layer.eventX + 20) + "px");

                        },
                        mousemove: function(layer) {

                            $(".toolTip").css("top", (layer.eventY + 20) + "px");
                            $(".toolTip").css("left", (layer.eventX + 20) + "px");

                        },
                        mouseout: function(layer) {
                            $(".toolTip").stop(true, true).fadeOut();
                        },
                        click: doclick


                    });
                    /* Value  Data*/

                }




            }



        })


    };
})(jQuery);