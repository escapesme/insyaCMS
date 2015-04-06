<%@page import="lib.tools.Utils"%>
<%@page import="xact.utils"%>
<%@page import="lib.Options.XMLDataModel"%>

<script>
    
    
    /*
function addCloude(myid, cloudName, heightlight, cloudID) {

    alert(myid + cloudID);
    var h = new helperClass();
    var newcludeID = h.generateId();
    var gruopID = h.generateId();
    $("#groupoutline_con").html("");
    var link2 = "?alias=xact&module=groupview&addto=im_" + newcludeID + "&pro_id=" + myid + "&group=group" + cloudID;

    if (heightlight) {
        link2 += "&heighlight=" + heightlight;
    }

    var x2 = new Array(defajax);
    ajaxAbort(x2);

    defajax = setAjax("ajax/engine/get_model_1.jsp" + link2, "all,main", "", function(data) {
        $(".im_tabs_li").removeClass("act");
        $("#group" + cloudID).remove();



        $(".im_tabs ul").append(" <li    data-cludeid='" + newcludeID + "'  data-groupid='" + gruopID + "'  id='group" + cloudID + "'    style=\"border-bottom:4px solid #" + heightlight + "\"  class=\"formoer im_tabs_li act \"><span>" + cloudName + " Group View </span></li>");

        $(".im_divs").append("<div data-cludeid='" + newcludeID + "'  data-groupid='" + gruopID + "'  class=' im_" + newcludeID + " formoer imps_vids do_group  actgroup group" + cloudID + "'  >\n\
      <ul class=\"group_tabs\"></ul><div class='data'>" + data + "</div></div>");

        $(".im_divs .imps_vids").css("z-index", "0");

        $(".im_" + newcludeID).css("z-index", "1");

    })





}

*/


</script>



<%

    String Frequency = "";
    String Server = "";
    String Data_Center = "";

    String Location = "";

    lib.engine.db.operations db = new lib.engine.db.operations();
    String mid = request.getParameter("id");
    String sid = request.getParameter("scenarioId");

    //db.getData(XMLDataModel.SEGMENT_TABLENAME, "*", "MESSAGE_ID=" + mid);
//out.print(mid);
    db.openCon();
    String[] avdata = db.getRowNocon(XMLDataModel.ACI2ACT_TABLENAME, "ac_inst_id=" + mid);
    Frequency = avdata[4];

    String[] acdata = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "id=" + mid);
    String nodeId = new utils().getNodeId(acdata[0]);
    String[] acnode = db.getRowNocon(XMLDataModel.NODE_TABLENAME, "id=" + nodeId);
    Server = acnode[2];

    String[] groupid = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, "id=" + acnode[4]);
    Data_Center = groupid[3];
    String locationId = Utils.getScenarioPram(groupid[1], sid, groupid[0], "LOCATION", groupid[2], "com.acrtek.xact_services.data.bo.BoGroup");
    String[] loctiondata = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + locationId);
    Location = loctiondata[5];

    db.closeCon();

    String data22 = "";
    data22 += "<div class=\"formrow\"><label>Frequency:</lable><div class=\"forminput\">" + Frequency + "</div></div>";
    data22 += "<div class=\"formrow\"><label>Server:</lable><div class=\"forminput\">" + Server + "</div></div>";
    data22 += "<div class=\"formrow\"><label> Data Center</lable><div class=\"forminput\">" + Data_Center + "</div></div>";
    data22 += "<div class=\"formrow\"><label>Location</lable><div class=\"forminput\">" + Location + "</div></div>";
    data22 += "<div class=\"formrow\"><label></lable><div class=\"forminput\"><a class=\"is_View_Server\" id=\"" + groupid[0] + "__" + acnode[0] + "__" + groupid[1] + "\">View Server</a></div></div>";

    out.print(data22);


%>
<style>

    .show_d .msg_all .data {
        height:120px;
    }

</style>
