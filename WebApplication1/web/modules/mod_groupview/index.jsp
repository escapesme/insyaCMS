<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.Options.MyVariables"%>
<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>views/Group.js"  type="text/javascript" language="javascript" ></script>
<script src="<%=MyVariables.siteUrl + MyVariables.jsFolder%>mxgraph/GroupViewClass.js"  type="text/javascript" language="javascript"></script>

<%
    lib.engine.db.operations db = new lib.engine.db.operations();

    String pro_id = request.getParameter("pro_id");
    String addto = request.getParameter("addto");
      String urlgroup = request.getParameter("group");
    
    
    String[] ids = pro_id.split("/");
    xact.views.Group group = new xact.views.Group();


    String mod_id = ids[3];
    String SCENARIOID = ids[2];

    String GroupID = ids[1];


    String cl_model_STATUS = db.getValue(XMLDataModel.MODEL_TABLENAME, "STATUS", "id=" + mod_id);

    boolean locked = cl_model_STATUS.equals("1");
    xact.users.users u = new xact.users.users();
    Boolean canEdit = u.userper(request, "edit");
    boolean isScenario = Utils.isScenario(SCENARIOID);
    Boolean doEdit = false;
    if (locked != true && canEdit == true) {
        doEdit = true;


    }




    xact.viewsClass v = new xact.viewsClass();

    v.group();

    db.openCon();
    String[] res;

    res = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, "`ID`=" + GroupID);


// the user has entered from group view do following events that affect the markers colors in the implementation view
    if (ids[0].equals("group")) {




        out.print("<script type=\"text/javascript\">   updateMarkerImage(\"" + res[2] + "\"); </script>");

    } else {
        // if entered from implementation view reset the other markers and set the market for the group view location opened

        out.print("<script type=\"text/javascript\">  resetMarkerImage();  updateMarkerImage(\"" + res[2] + "\"); </script>");
// clear old group tabs
        out.print("<script type=\"text/javascript\"></script>");

    }
    String myid = ids[1];


    lib.tools.test.addMessage("group view", "GV-Init", "Initializing Group View", "Initializing view for Net Group: " + res[3] + "(" + res[0] + ") with Model ID: " + mod_id + "and Scenario ID: " + SCENARIOID + ".", XMLDataModel.successClass);
    out.print("<script type=\"text/javascript\">"
            // function called for number of group view tabs opened
            + "updateVars('" + pro_id + "','" + addto + "'); function include(arr,obj) {return (arr.indexOf(obj) != -1);} "
            + "$(function(){  $(\".group_tabtbr\").hide(); "
            // create preview for group view opened and give it the div class according to the id of the group view          
            + "$(\"#groupoutline_con\").append('<div id=\"group_outline_11" + myid + "\" class=\"group_tabtbr\" ></div>');"
            + "if (!mxClient.isBrowserSupported()){ mxUtils.error('Browser is not supported!', 200, false);}"
            + "else{ \n var outline= document.getElementById(\"group_outline_11" + myid + "\");"
            // call function that creates the group view doEdit
            + " var graph_group_" + myid + "=makg_Group(\"nbmbnm\",\"xactGroup" + myid + "\",\"group_outline" + myid + "\" ,'" + GroupID + "','" + mod_id + "','" + doEdit + "','" + isScenario + "');\n"
            + " var outln = new mxOutline(graph_group_" + myid + ", outline); "
            + "do_layout(graph_group_" + myid + " ,\"xactGroup" + myid + "\"); try{\n" + "");
    int ff = db.getRowCountNocon(XMLDataModel.NODE_TABLENAME, "`GROUP_ID`=" + res[0]);
    int i = 0;




    db.closeCon();


    String heihlight = "";
    if (request.getParameter("heighlight") != null) {

        heihlight = request.getParameter("heighlight");

    }


    out.print(group.get_nodes(res, SCENARIOID, mod_id, myid, heihlight, ids[1]));
    out.print(group.get_groups(res, SCENARIOID, mod_id, myid, heihlight, ids[1]));
    out.print(group.get_groups1(res, SCENARIOID, mod_id, myid, heihlight, ids[1]));
    out.print(group.get_edgs(res, SCENARIOID, mod_id, myid, ids[1]));
    // out.print(get_edgs_group(res, SCENARIOID, mod_id, myid));
    String nameg = "";
    if (res[3].length() > 6) {

        nameg = res[3].substring(0, 6) + "...";
    } else {

        nameg = res[3];
    }

//moreEvents function moreEvents(G, catid, modid, pro_id, group, heightlight) {

    out.print("moreEvents( graph_group_" + myid + ",'" + GroupID + "','" + mod_id + "','" + pro_id + "','" + urlgroup + "','" + heihlight + "'); }finally {      "
            + "get_ViewGroupBar(graph_group_" + myid + " ,'.group_toolbar" + myid + "' ,'" + GroupID + "','" + mod_id + "'," + doEdit + "," + isScenario + ",'" + pro_id + "','" + urlgroup + "','" + heihlight + "');     graph_group_" + myid + ".getModel().endUpdate();  }   }"
            + "   $(\".do_group.actgroup .group_tabs .button\").removeClass(\"act\"); "
            + "$(\".do_group.actgroup .group_tabs .th_close\").removeClass(\"act\");  "
            + " $('.do_group.actgroup .group_tabs').append('<li id=\"" + myid + "\" class=\"button act\">" + nameg + " <a class=\"th_close act\"><a></li>');     }) "
            + " </script>");
    lib.tools.test.setMessage(request);

%>



<div class="groupstab <%=myid%> group<%=myid%>     ">

    <div class="tbar group_toolbar<%=myid%>"  style="margin-top: -96px; "  >
        <ul>                         </ul>
    </div>

    <div id="xactGroup<%=myid%>" style="margin-top: 40px;  height:1000px;" ></div>


</div>

<style>.MEP_tabs_header{

        width: 40px;
        width: 90px;
        float: left;
        float: left;
        text-align: center;
        cursor: pointer
    }
    .MEP_tabs{
        width:100%;
        clear: both
    }
    .MEP_tabs_body{
        width:400px;
        margin-top: 20px;
        /*display: none;*/
        height:130px;
        position: relative;
        border: 1px #0070a3 solid;
        padding: 5px;

    }


    .tabs_divs .div_imp{

        z-index: 1;
    }
</style>