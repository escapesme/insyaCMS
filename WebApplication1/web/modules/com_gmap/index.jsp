<%--
    Document   : Googlemap
    Created on : May 25, 2011, 1:33:52 PM
    Author     : Sayed Taha
--%>
<%@page import="lib.tools.Utils"%>
<%@page import="com.sun.corba.se.impl.logging.UtilSystemException"%>
<%@page  import="lib.Options.XMLDataModel,lib.Options.MyVariables,java.sql.ResultSet,java.util.Arrays;
         import javax.naming.spi.DirStateFactory.Result" %>

<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>views/ImplementationView.js"  type="text/javascript" language="javascript"></script>


<%
    String contid = Utils.getNewID();
    String mod_id = request.getParameter("model_id");
    String SCENARIOID = request.getParameter("scen_id");
%>

<script>



    function ImportIMWidows(type, title, imageLocaiton, mod_id) {



        var l = $.trim(imageLocaiton);
        var f = "test.csv";

        var form = new FormClass(type + "Import_windows");
        form.fields = [
            {
                "title": "File:",
                "type": "upload",
                "name": type + "upload",
                "uploadFolder": l,
                filename: f,
                filetype: "uploadFile_filename"

            }
        ];



        var content = form._renderhtml();
        form.events = [
            {
                event: "click",
                eventClass: "importcsv",
                js: function() {


                    var url = "mod_id=" + mod_id + "&status=" + type + "&loction=" + l + "&filename=" + f + "&mod_id=" + mod_id + "&type=log";
                    window.location = "ajax/implementation/import.jsp?" + url;


                    alert("Import finished successfully. The view will reload after you exit this window.");

                }
            }, {
                "action": "close"
                , "event": "click"
                , "eventClass": "ADDCacheCancel",
                Callback: function(t) {

                    form.closeWindow();
                    reloadimplementation("model", mod_id);
                }



            }

        ];

        form.fields = [
            {
                "type": "div",
                "class": "do_center _100"

            }, {
                "title": "ADD Cache",
                "type": "button",
                "name": "importcsv",
                "value": "Import"
            },
            {
                "type": "button",
                "name": "ADDCacheCancel",
                "value": "Close"
            },
            {
                "type": "enddiv"
            }
        ];

        var footer = form._renderhtml();
        form.windows = {
            "class": type + "Import_windows",
            "title": title,
            "content": content,
            "footerContent": footer,
            "position": "Center",
            "x": "600",
            "y": "90",
            width: "300", height: "130"
        };


        form._renderWindows();
    }



    var <%="all_polylines" + contid%>;
    function <%="colorLinne" + contid%>(map, mycolor, defmywidth, image, x, y, width, height, myclass) {

        var Class = "." + myclass;

        $(Class + " .newClouds").click(function() {


            $.get("ajax/implementation/getLoctions.jsp?modID=<%=mod_id%>", function(locations) {
                $.get("ajax/engine/getID.jsp", function(imageID) {

                    mackeAnActaive();
                    $(Class + " .newClouds").addClass("on");
                    createCloudsData("<%=mod_id%>", $.trim(locations), imageID, "<%= Utils.getCloudFolder()%>");
                })
            })

        });






        $(Class + " .line_b").click(function() {
            startLine(map, color, image, x, y, width, height, mywidth);
        });

        var color = "#" + mycolor;
        var mywidth = defmywidth;
    <%="all_polylines" + contid%> = <%="domyling" + contid%>(map, color, mywidth);

        $(Class + " .line_nurmal").click(function() {

            removealllins(<%="all_polylines" + contid%>, map);
            mywidth = defmywidth;
    <%="all_polylines" + contid%> = [];
    <%="all_polylines" + contid%> =<%="domyling" + contid%>(map, color, mywidth);
        });



        $(Class + " .line_minus").click(function() {
            removealllins(<%="all_polylines" + contid%>, map);
            mywidth -= 1;
    <%="all_polylines" + contid%> = [];
    <%="all_polylines" + contid%> =<%="domyling" + contid%>(map, color, mywidth);
        });
        $(Class + " .line_plus").click(function() {
            removealllins(<%="all_polylines" + contid%>, map);
            mywidth += 1;
    <%="all_polylines" + contid%> = [];
    <%="all_polylines" + contid%> =<%="domyling" + contid%>(map, color, mywidth);
        });



        $(Class + " .newMarker").click(function() {


            newMarkerStatus(Class + " .newMarker");
        });




        $(Class + " .newLine").click(function() {

            newLineStatus(Class + " .newLine");
        });



        $(Class + " .implementation_import").click(function() {

            getImageLocation("exports", function(imageLocaiton) {
                ImportIMWidows("implementation_import", "implementation View import", imageLocaiton, "<%=mod_id%>")
            })

        })


        $(Class + " .implementation_delete").click(function() {

            var id = $(".implementation_activeobject").val();


            var type = $(".implementation_activeobject").data("type");
            var ids = id.split("/");


            if (type == "locition") {

                var answer = confirm("Are you sure you want to delete this location?");
                if (answer) {
                    $.get("ajax/implementation/create.jsp?ID=" + ids[0] + "&status=delete", function(data) {
                        alert($.trim(data));
                        reloadimplementation("model", ids[2]);

                    })
                }


            } else if (type == "line") {
                var answer = confirm("Are you sure you want to delete this connection?");
                if (answer) {
                    $.get("ajax/implementation/create.jsp?ID=" + ids[1] + "&status=deleteline", function(data) {
                        alert($.trim(data));
                        reloadimplementation("model", ids[3]);
                        $(".tb_Property").remove();

                    });
                }
            }

        });








        $(Class + " .implementation_edit").click(function() {





            var id = $(".implementation_activeobject").val();
            var type = $(".implementation_activeobject").data("type");


            var ids = id.split("/");



            if (type == "locition") {



                $.get("ajax/implementation/getLoctions_byid.jsp?ID=" + ids[0], function(data) {


                    var d = data.split("__");

                    edit_Marker(d[0], d[1], d[2], ids[2], ids[0]);

                })

            } else if (type == "line") {




                $.get("ajax/implementation/getLoctions_byid.jsp?status=line&id=" + ids[1], function(returnData) {

                    var r = returnData.split("__");
                    $.get("ajax/implementation/getImGroups.jsp?id=" + r[12], function(m1Data) {
                        $.get("ajax/implementation/getImGroups.jsp?id=" + r[13], function(m2Data) {

                            edit_Line(r[1], $.trim(m1Data), $.trim(m2Data), r);
                        })
                    })
                })





            }


        });




        $(Class + '  .colorLines').css("background-color", color);
        $(Class + '  .colorLines').val(color);


        $(Class + '  .colorLines').ColorPicker({
            onSubmit: function(hsb, hex, rgb, el) {
                color = "#" + hex;
                $(el).val(hex);
                $(el).ColorPickerHide();
                $(el).css("background-color", color);


                removealllins(<%="all_polylines" + contid%>, map);
    <%="all_polylines" + contid%> = [];
    <%="all_polylines" + contid%> =<%="domyling" + contid%>(map, color, mywidth);
            },
            onBeforeShow: function() {
                $(this).ColorPickerSetColor(this.value);
            }
        })
                .bind('keyup', function() {
                    $(this).ColorPickerSetColor(this.value);
                });
    }










</script>


<script type="text/javascript">
    /*var COLORS = [["red", "#000"], ["orange", "#ff8800"], ["green","#008000"],
     ["blue", "#000080"], ["purple", "#800080"]];*/
    <%     lib.engine.db.operations db = new lib.engine.db.operations();

        lib.tools.test.addMessage("implementation", "I-Init", "Initializing Implementation View", "Initializing view with Model ID: " + mod_id + "and Scenario ID: " + SCENARIOID + ".", XMLDataModel.successClass);

        String pro_id = db.getValue(XMLDataModel.PMXREF_TABLENAME, "pid", "mid=" + mod_id);
        String[] i_setting;

        db.openDBCon(lib.Options.DbInfo.connectionStringDef);

        i_setting = db.getRowNocon(XMLDataModel.IMPELEMENTATION_SETTING_TABLENAME, "project=" + pro_id);

        if (i_setting[0] == null || i_setting[0].equals("")) {

            i_setting = db.getRowNocon(XMLDataModel.IMPELEMENTATION_SETTING_TABLENAME, "allProjects=1");
        }

        db.closeCon();


    %>

    var COLORS = [["red", "#<%= i_setting[2]%>"]];

</script>

<%
    xact.drawing.Implementation im = new xact.drawing.Implementation();

    
    /*
    
    loc:49.833333333333336;;10.683333333333334
    loc:42.8;;12.433333333333334
    loc:70.259452;;-50.4876709
    loc:50.77588932762932;;0.05835916846990585
    loc:25.216666666666665;;119.71666666666667
    
    
 lineloc50.77588932762932;;+0.05835916846990585  >> lineloc10.683333333333334;;49.833333333333336  
     lineloc70.259452;;+-50.4876709  >> lineloc50.77588932762932;;0.05835916846990585  
     lineloc70.259452;;+-50.4876709  >> lineloc50.77588932762932;;0.05835916846990585  
    
    lineloc-50.4876709;;+70.259452
    lineloc-50.4876709;;+70.259452
    */
    
    
    
    //xact.drawing.Implmentation v = new xact.drawing.Implmentation();
    xact.views.advanceImplementation ai = new xact.views.advanceImplementation();
    xact.viewsClass vv = new xact.viewsClass();
    vv.ImplmentationView();
    String LATITUDE_var = "";
    String LONGITUDE_var = "";
    String LATITUDE_var2 = "";
    String LONGITUDE_var2 = "";

    db.openCon();
    out.print("<script>function drawExistancelines(map){");
    String cloudid = "-1";

    String Cloud = "";
    if (request.getParameter("cloudid") != null) {

        cloudid = request.getParameter("cloudid");

        String[] cloudData = db.getRowNocon(XMLDataModel.CLOUD_TABLENAME, "ID=" + cloudid);

        Cloud = cloudData[0] + "," + cloudData[1] + "," + cloudData[2] + "," + cloudData[3] + "," + cloudData[4] + "," + cloudData[5] + "," + cloudData[6] + "," + cloudData[7];

    }

    ResultSet rsn_id55 = db.getData(XMLDataModel.LOCATION_TABLENAME, "*", " MODEL_ID=" + mod_id + " and TYPE='City' and (CLOUD_ID=" + cloudid + " OR CLOUD_ID IS NULL)");
    while (rsn_id55.next()) {
        String id = XMLDataModel.LOCATION_TABLENAME + "/" + rsn_id55.getString("id") + "/" + SCENARIOID + "/" + mod_id;

        //im.parsedeg(rsn_id55.getString("LATITUDE")) im.parsedeg(rsn_id55.getString("LONGITUDE"))
        String LATITUDE = im.parsedeg(rsn_id55.getString("LATITUDE"));

        String LONGITUDE = im.parsedeg(rsn_id55.getString("LONGITUDE"));

        if (!rsn_id55.getString("LONGITUDE_DEC").equalsIgnoreCase("-1")) {
            LATITUDE = rsn_id55.getString("LATITUDE_DEC");

            LONGITUDE = rsn_id55.getString("LONGITUDE_DEC");

        }

        out.print("showPointAddressbayl(\"" + LATITUDE + "\",\"" + LONGITUDE + "\",\"" + XMLDataModel.LOCATION_TABLENAME + "/" + rsn_id55.getString("id") + "/" + SCENARIOID + "/" + mod_id + "\" ,\"" + i_setting[5] + "\",\"" + i_setting[6] + "\",\"" + i_setting[7] + "\",map,\"\",\"" + i_setting[9] + "\",\"" + i_setting[8] + "\",\"" + rsn_id55.getString("id") + "\",\"" + SCENARIOID + "\",'n','" + Cloud + "'); \n");
        out.print(ai.getCludes(id, LATITUDE, LONGITUDE, pro_id, mod_id, SCENARIOID));

        lib.tools.test.addMessage("implementation,locations", "sI001", "Draw Location Nodes", "Drawing Location Node" + rsn_id55.getString("NAME") + "(" + rsn_id55.getString("id") + ") Coordinates: LATTITUDE:" + rsn_id55.getString("LATITUDE") + "(" + im.parsedeg(rsn_id55.getString("LATITUDE")) + ") and LONGITUDE:" + rsn_id55.getString("LONGITUDE") + "(" + im.parsedeg(rsn_id55.getString("LONGITUDE")) + ")", XMLDataModel.successClass);

    }
    out.print("}"
            + "var all_polylines" + contid + " = []; function domyling" + contid + "(map ,color,width ){");
    ResultSet rsn_id4 = db.getData(XMLDataModel.CONNECTORS_TABLENAME, "*", "MODEL_ID=" + mod_id);

    while (rsn_id4.next()) {
        String[] l1 = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + rsn_id4.getString("LOCATION_ID1") + " and (CLOUD_ID='" + cloudid + "' OR CLOUD_ID IS NULL)");
        String[] l2 = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + rsn_id4.getString("LOCATION_ID2") + " and (CLOUD_ID='" + cloudid + "' OR CLOUD_ID IS NULL)");

        if (l1[3] != null && l2[3] != null) {

            LATITUDE_var = im.parsedeg(l1[3]);
            LONGITUDE_var = im.parsedeg(l1[2]);
            
            
            
            
            LATITUDE_var2 = im.parsedeg(l2[3]);
            LONGITUDE_var2 = im.parsedeg(l2[2]);

           if (!l1[10].equalsIgnoreCase("-1")) {
                LATITUDE_var = l1[11];
                LONGITUDE_var = l1[10];
            }

            if (!l2[10].equalsIgnoreCase("-1")) {
                LATITUDE_var2 = l2[11];
                LONGITUDE_var2 = l2[10];
            }

            out.print(" var neer=addNewLineToMap(" + LONGITUDE_var + "," + LATITUDE_var + "," + LONGITUDE_var2 + "," + LATITUDE_var2 + ",width,map,color,\"" + XMLDataModel.CONNECTORS_TABLENAME + "/" + rsn_id4.getString("ID") + "/" + SCENARIOID + "/" + mod_id + "\"); \n"
                    + "                all_polylines" + contid + ".push(neer);");
            lib.tools.test.addMessage("implementation,locationConnectors", "sI002", "Draw Edges", "Drawing Connector ID (" + rsn_id4.getString("ID") + ") from " + l1[5] + "(" + l1[0] + ") to " + l2[5] + "(" + l2[0] + ")", XMLDataModel.successClass);
        }
    }

    out.print(" return  all_polylines" + contid + "; "
            + " }    "
            + " $(document).ready(function(){ \n"
            + " domap(); \n "
            + " })  \n"
            + " function domap(){ \n "
            + " var map= initialize(4.746094,49.037868, 2 ,'" + mod_id + "','map" + cloudid + "','" + cloudid + "'); \n"
            + "      drawExistancelines(map); \n "
            + "     colorLinne" + contid + "(map,\"" + i_setting[2] + "\"," + i_setting[3] + ",\"" + i_setting[5] + "\",\"" + i_setting[9] + "\",\"" + i_setting[8] + "\",\"" + i_setting[6] + "\",\"" + i_setting[7] + "\",\"" + contid + "\"); \n"
            + " }; \n ");

    out.print("</script>");

    db.closeCon();

    lib.tools.test.setMessage(request);
%>






<div class='<%=contid%>'> 

    <div class="tbar" >  
        <div   class="era line_b"   title="Line Width (+)" class="mxToolbarItem"></div>
        <div   class="era line_minus forloctions"   title="Line Width (-)" class="mxToolbarItem"></div>
        <div   class="era line_nurmal forloctions"   title="Original Line Width " class="mxToolbarItem"></div>
        <div   class="era line_plus forloctions"   title="Line Width (+)" class="mxToolbarItem"></div>
        <div    class="colorLines_con forloctions" title="Line Color"  > 

            <input class="colorLines" type="text" readonly></div> 


        <%
            xact.users.users u = new xact.users.users();
            String cl_model_STATUS = db.getValue(XMLDataModel.MODEL_TABLENAME, "STATUS", "id=" + mod_id);

            boolean locked = cl_model_STATUS.equals("1");
            Boolean canEdit = u.userper(request, "edit");

            if (locked != true && canEdit == true) {
        %>
        <div  class="cbrItmen spliter" title></div>
        <div  class="era newMarker forloctions"   title="New Location" class="mxToolbarItem"></div>
        <div  class="era newClouds forloctions"   title="Create New Cloud" class="mxToolbarItem"></div>
        <div   class="era newLine forloctions"   title="New Line" class="mxToolbarItem"></div>

        <div   class="era implementation_edit forloctions"   title="Edit" class="mxToolbarItem"></div>
        <div   class="era implementation_delete forloctions"   title="Delete" class="mxToolbarItem"></div>
        <div   class="era implementation_import forloctions"   title="Import CSV file" class="mxToolbarItem"></div>



        <input  type='hidden' class="implementation_activeobject" data-type=""  value=""/>


        <%}%>



    </div>



    <div id ="container" style="position:absolute; top:0px;bottom:0px;  width: 100%;">

        <div id="map<%=cloudid%>" style="position:absolute; top:0px;bottom:0px; margin-top:24px; ; height:100%; width: 100%;"></div>

    </div>

</div>



<script>
    defStatus();
</script>



<style>

    .mytoo{
        position: absolute;
        z-index: 10;

        background: #8DB2E3;
        border: 1px #0077FF solid;
        opacity:0.8;
        padding :5px; 

    }

</style>
