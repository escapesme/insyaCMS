
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<div class="mydata" id="mydata"> 










    <%

        lib.engine.db.operations db = new lib.engine.db.operations();
        xact.viewsClass v = new xact.viewsClass();

        db.openCon();
        v.group();
        String data = "";


        String groupID = request.getParameter("groupid");
        String sid = request.getParameter("sid");
        String locationid = request.getParameter("locationid");

        String[] newLoctionData = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + locationid);
        String[] groupData = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, "ID='" + groupID + "'");
        String currentLocation = Utils.getScenarioPram(groupData[1], sid, groupID, "LOCATION", groupData[2], "com.acrtek.xact_services.data.bo.BoGroup");

        String[] oldLoctionData = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + currentLocation);




        String test = "group=" + groupID;
        String groupName = groupData[3];
        String oldLocation = oldLoctionData[5];
        String newLocation = newLoctionData[5];

        data += " Please Confirm moving " + groupName + " from " + oldLocation + " to " + newLocation + ". Please note that the following changes will take place."
                + "<table class='movetable'><tr><td>Description</td><td>Default Value</td><td>Adjusted Value</td></tr>";

        xact.drawing.Implementation im = new xact.drawing.Implementation();



        ResultSet rg = db.getData(XMLDataModel.GROUP_CONNECTORS_TABLENAME, "*", "GROUP_ID2='" + groupID + "'");

        while (rg.next()) {

            test += " <br />GROUP_ID1: " + rg.getString("GROUP_ID1");



            // test += "NODE_ID1='" + rg.getString("NODE_ID1") + "' and NODE_ID1='" + rg.getString("NODE_ID1") + "'";
            String[] line = db.getRowNocon(XMLDataModel.LINE_TABLENAME, " NODE_ID1='" + rg.getString("NODE_ID1") + "' and NODE_ID2='" + rg.getString("NODE_ID2") + "'");
            test += " <br />lineID " + line[0];


            String[] th_groupData = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, "ID='" + rg.getString("GROUP_ID1") + "'");
            String[] l2 = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + th_groupData[2]);




            String let = im.parsedeg(l2[3]);
            String lng = im.parsedeg(l2[2]);
            String let2 = im.parsedeg(newLoctionData[3]);
            String lng2 = im.parsedeg(newLoctionData[2]);

            out.print(data(let, lng, let2, lng2, "in" + line[0]));

            test += "location:" + let + "::" + lng;
            data += " <tr><td>Line Between " + groupName + " and  " + th_groupData[3] + "</td><td>" + line[3] + "</td><td><input  value='" + line[0] + "'  class='movegroupid'  type='hidden'/> <input  value=''  class='in" + line[0] + " movelinelength'  type='text'/></td></tr>";


        }





        ResultSet rg2 = db.getData(XMLDataModel.GROUP_CONNECTORS_TABLENAME, "*", "GROUP_ID1='" + groupID + "'");

        while (rg2.next()) {

            test += " <br />GROUP_ID2: " + rg2.getString("GROUP_ID2");
            // test += "NODE_ID1='" + rg.getString("NODE_ID1") + "' and NODE_ID1='" + rg.getString("NODE_ID1") + "'";
            String[] line = db.getRowNocon(XMLDataModel.LINE_TABLENAME, " NODE_ID1='" + rg2.getString("NODE_ID1") + "' and NODE_ID2='" + rg2.getString("NODE_ID2") + "'");

            test += " <br />lineID " + line[0];



            String[] th_groupData = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, "ID='" + rg2.getString("GROUP_ID2") + "'");

            String[] l2 = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + th_groupData[2]);




            String let = im.parsedeg(l2[3]);
            String lng = im.parsedeg(l2[2]);

            String let2 = im.parsedeg(newLoctionData[3]);
            String lng2 = im.parsedeg(newLoctionData[2]);

            out.print(data(let, lng, let2, lng2, "in" + line[0]));



            test += "location:" + let + "::" + lng;
            data += " <tr><td>Line Between " + groupName + " and  " + th_groupData[3] + "</td><td>" + line[3] + "</td><td><input  value='" + line[0] + "'  class='movegroupid'  type='hidden'/> <input  value=''  class='in" + line[0] + " movelinelength'  type='text'/></td></tr>";


        }

        db.closeCon();

        data += "</table>";

        out.print(data);







    %>



    <%!
        String data(String lat1, String lng1, String lat2, String lng2, String inputClass) {

            return "<script>"
                    + "var p1 = new google.maps.LatLng('" + lng1 + "' ,  '" + lat1 + "' );"
                    + "var p2 = new google.maps.LatLng('" + lng2 + "' ,'" + lat2 + "' );"
                    + "$('." + inputClass + "').val((google.maps.geometry.spherical.computeDistanceBetween(p1, p2) / 1000).toFixed(2));"
                    + "</script>";


        }
    %>






</div>
    <div class="do_center">
<input type="button" class=" groupMove_Confirm "  value="Confirm">
<input type="button" class=" groupMove_do_Close "  value="Close">
</div>




<style>
    .movetable td {
        border: 1px #333 solid
            ;
        padding:1px;
        text-align: center;
    }


    .movetable {
        width:99%;

    }
    .movetable td  input{ margin: auto;

                          margin-left: 11px;

    }
    #mydata{
        height: 300px;
        overflow: auto;
    }
</style>

