<%--
    Document   : Googlemap
    Created on : May 25, 2011, 1:33:52 PM
    Author     : Sayed Taha
--%>
<%@page import="lib.tools.Utils"%>
<%@page  import="lib.Options.XMLDataModel,lib.Options.MyVariables,java.sql.ResultSet,java.util.Arrays;
         import javax.naming.spi.DirStateFactory.Result" %>

<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>views/scenariIomplementationView.js"  type="text/javascript" language="javascript"></script>



<%   String contid = Utils.getNewID();%>
<script type="text/javascript">
    $(".<%=contid%> .com_viewSataus").change(function() {

        if ($.trim($(this).val()) == "locations") {
            $(".forloctions").show();
            $(".forgoups").hide();


            //   var all_polylinesg= domyling(map,"blue",3);

            removealllins(all_polylinesg, map);
            removealllins(all_polylines, map);

            $(".line_nurmal").click();

        } else if ($.trim($(this).val()) == "groups") {

            $(".forloctions").hide();
            $(".forgoups").show();

            removealllins(all_polylines, map);
            removealllins(all_polylinesg, map);


            $(".line_nurmalg").click();




        } else {


            $(".forloctions").show();
            $(".forgoups").show();
            $(".line_nurmal").click();
            $(".line_nurmalg").click();


        }
    })



    function colorLinneGroups(map, mycolor, defmywidth, image, x, y, width, height, myclass) {
        var Class = "." + myclass;




        $(Class + " .line_b").click(function() {
            startLine(map, color, image, x, y, width, height, mywidth);
        });

        var color = "#" + mycolor;
        var mywidth = defmywidth;
        all_polylinesg = domyling(map, color, mywidth);






        $(Class + " .line_nurmalg").click(function() {

            removealllins(all_polylinesg, map);
            mywidth = defmywidth;
            all_polylinesg = [];
            all_polylinesg = domyling(map, color, mywidth);
        });



        $(Class + " .line_minusg").click(function() {
            removealllins(all_polylinesg, map);


            mywidth -= 1;
            all_polylinesg = [];
            all_polylinesg = domyling(map, color, mywidth);
        });
        $(Class + " .line_plusg").click(function() {

            removealllins(all_polylinesg, map);
            mywidth += 1;

            all_polylinesg = [];
            all_polylinesg = domyling(map, color, mywidth);
        });







        $(Class + ' .colorLinesg').css("background-color", color);
        $(Class + ' .colorLinesg').val(color);


        $(Class + ' .colorLinesg').ColorPicker({
            onSubmit: function(hsb, hex, rgb, el) {
                color = "#" + hex;
                $(el).val(hex);
                $(el).ColorPickerHide();
                $(el).css("background-color", color);


                removealllins(all_polylines, map);
                all_polylines = [];
                all_polylines = domyling(map, color, mywidth);
            },
            onBeforeShow: function() {
                $(this).ColorPickerSetColor(this.value);
            }
        })
                .bind('keyup', function() {
                    $(this).ColorPickerSetColor(this.value);
                });
    }








    <%     lib.engine.db.operations db = new lib.engine.db.operations();

        String mod_id = "";

        mod_id = request.getParameter("model_id");
        String SCENARIOID = request.getParameter("scen_id");

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

    //xact.drawing.Implmentation v = new xact.drawing.Implmentation();
    xact.views.advanceImplementation ai = new xact.views.advanceImplementation();

    xact.viewsClass vv = new xact.viewsClass();
    vv.ImplmentationView();
    String LATITUDE_var = "";
    String LONGITUDE_var = "";
    String LATITUDE_var2 = "";
    String LONGITUDE_var2 = "";

    db.openCon();
    out.print("<script>"
            + "function drawExistancelines(map){");
    ResultSet rsn_id55 = db.getData(XMLDataModel.LOCATION_TABLENAME, "*", " MODEL_ID=" + mod_id + " and TYPE='City'");

    while (rsn_id55.next()) {

        String id = XMLDataModel.LOCATION_TABLENAME + "/" + rsn_id55.getString("id") + "/" + SCENARIOID + "/" + mod_id;

        //im.parsedeg(rsn_id55.getString("LATITUDE")) im.parsedeg(rsn_id55.getString("LONGITUDE"))
        String LATITUDE = im.parsedeg(rsn_id55.getString("LATITUDE"));

        String LONGITUDE = im.parsedeg(rsn_id55.getString("LONGITUDE"));

        if (!rsn_id55.getString("LONGITUDE_DEC").equalsIgnoreCase("-1")) {
            LATITUDE = rsn_id55.getString("LATITUDE_DEC");

            LONGITUDE = rsn_id55.getString("LONGITUDE_DEC");

        }

        out.print(" showPointAddressbayl(" + LATITUDE + "," + LONGITUDE + ",\"" + id + "\" ,\"" + i_setting[5] + "\",\"" + i_setting[6] + "\",\"" + i_setting[7] + "\",map,\"\",\"" + i_setting[9] + "\",\"" + i_setting[8] + "\",\"" + rsn_id55.getString("id") + "\",'" + SCENARIOID + "','c','');");

        out.print(ai.getGroups(id, LATITUDE, LONGITUDE, pro_id, mod_id, SCENARIOID));

        lib.tools.test.addMessage("implementation,locations", "sI001", "Draw Location Nodes", "Drawing Location Node" + rsn_id55.getString("NAME") + "(" + rsn_id55.getString("id") + ") Coordinates: LATTITUDE:" + rsn_id55.getString("LATITUDE") + "(" + im.parsedeg(rsn_id55.getString("LATITUDE")) + ") and LONGITUDE:" + rsn_id55.getString("LONGITUDE") + "(" + im.parsedeg(rsn_id55.getString("LONGITUDE")) + ")", XMLDataModel.successClass);

    }

    out.print(" ; mardfunction(map,'" + SCENARIOID + "'); ");

    out.print(" } ");

    out.print(ai.getlines(mod_id, pro_id, SCENARIOID));

    out.print(" function domylin(map ,color,width){  "
            + " var all_polylines = []; ");
    ResultSet rsn_id4 = db.getData(XMLDataModel.CONNECTORS_TABLENAME, "*", "MODEL_ID=" + mod_id);
    while (rsn_id4.next()) {
        String[] l1 = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + rsn_id4.getString("LOCATION_ID1"));
        String[] l2 = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + rsn_id4.getString("LOCATION_ID2"));

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
        out.print(" var neer=addNewLineToMap(" + LONGITUDE_var2 + "," + LATITUDE_var2 + "," + LONGITUDE_var + "," + LATITUDE_var + ",width,map,color,\"" + XMLDataModel.CONNECTORS_TABLENAME + "/" + rsn_id4.getString("ID") + "/" + SCENARIOID + "/" + mod_id + "\",'n');"
                + " all_polylines.push(neer); ");
        lib.tools.test.addMessage("implementation,locationConnectors", "sI002", "Draw Edges", "Drawing Connector ID (" + rsn_id4.getString("ID") + ") from " + l1[5] + "(" + l1[0] + ") to " + l2[5] + "(" + l2[0] + ")", XMLDataModel.successClass);

    }
    out.print(" "
            + "return  all_polylines; "
            + "}    "
            + " "
            + " $(document).ready(function(){domap();    "
            + " function domap(){ "
            + " var map= initialize(4.746094,49.037868, 2,'" + mod_id + "','map'); "
            + " drawExistancelines(map); "
            + " colorLinneGroups(map,\"0D2389\"," + i_setting[3] + ",\"" + i_setting[5] + "\",\"" + i_setting[9] + "\",\"" + i_setting[8] + "\",\"" + i_setting[6] + "\",\"" + i_setting[7] + "\"  ,'" + contid + "'); "
            + " colorLinne(map,\"" + i_setting[2] + "\"," + i_setting[3] + ",\"" + i_setting[5] + "\",\"" + i_setting[9] + "\",\"" + i_setting[8] + "\",\"" + i_setting[6] + "\",\"" + i_setting[7] + "\" ,'" + contid + "'); "
            + "}}); </script>");

    db.closeCon();

    lib.tools.test.setMessage(request);
%>


<div class='<%=contid%>'> 

    <div class="tbar" >

        <div   class="era line_minus forloctions"   title="Line -" class="mxToolbarItem"></div>
        <div   class="era line_nurmal forloctions"   title="Line 0" class="mxToolbarItem"></div>
        <div   class="era line_plus forloctions"   title="Line +" class="mxToolbarItem"></div>
        <div    class="colorLines_con forloctions" title="Line Color"  >  <input class="colorLines" type="text" readonly></div> 

        <%
            xact.users.users u = new xact.users.users();
            String cl_model_STATUS = db.getValue(XMLDataModel.MODEL_TABLENAME, "STATUS", "id=" + mod_id);

            boolean locked = cl_model_STATUS.equals("1");
            Boolean canEdit = u.userper(request, "edit");

            if (locked != true && canEdit == true) {
        %>

        <div  class="era newMarker forloctions"   title="New Marker" class="mxToolbarItem"></div>
        <div   class="era newLine forloctions"   title="New Line" class="mxToolbarItem"></div>
        <%}%>

        <div   class="era line_minusg forgoups"   title="getAddress" class="mxToolbarItem"></div>
        <div   class="era line_nurmalg forgoups"   title="getAddress" class="mxToolbarItem"></div>
        <div   class="era line_plusg forgoups "   title="getAddress" class="mxToolbarItem"></div>
        <div class="colorLines_cong forgoups"><input class="colorLinesg" type="text" readonly></div> 

        <select class='com_viewSataus'>
            <option value="groups">View Group Connectors</option>
            <option value="locations">View Location Lines</option>
            <option value="all">View All Lines</option>
        </select> 


    </div>

    <div id ="container" style="position:absolute; top:0px;bottom:0px;  width: 100%;">

        <div id="map" style="position:absolute; top:0px;bottom:0px; height:100%; width: 100%;"></div>

    </div>
</div>



<script>
    defAdvStatus();
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
