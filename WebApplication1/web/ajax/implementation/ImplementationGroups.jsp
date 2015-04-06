<%@page import="javax.xml.bind.annotation.XmlAccessOrder"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%

    String id = request.getParameter("id");
    String sid = request.getParameter("sid");
//table=NET_GROUP&filde=NAME&ofilde=LOCATION_ID
    lib.engine.db.operations db = new lib.engine.db.operations();

    db.openCon();
    String[] myid = id.split("/");

    ResultSet rs = db.getData(XMLDataModel.NET_GROUP_TABLENAME, "*", "LOCATION_ID=" + myid[0]);




    String data = "<div class=\"list_body\"><ul>";
    while (rs.next()) {

        String[] typedata = db.getRowNocon(XMLDataModel.GROUP_TYPE_TABLENAME, "id=" + rs.getString("type_id"));

        String addstyle = " color:#ccc ";
        String info = "";
        String[] groupOutall = db.getRowNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "OBJECT_ID='" + rs.getString("id") + "' and OBJECT_CLASS='com.acrtek.xact_services.data.bo.BoGroup' and S_PARAMETER='LOCATION' and SCENARIO_ID='" + sid + "'");
        String groupOut = groupOutall[5];



        if (groupOut == null || groupOut.equalsIgnoreCase("null")) {

            addstyle = "";
        } else {
            String location = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + groupOutall[6])[5];
            info += "<br>This group has been moved to '" + location + "'";
        }










        data += "<li class=\"getgroup\" style='" + addstyle + "' id=\"location/" + rs.getString("ID") + "/" + myid[1] + "/" + myid[2] + "\">" + rs.getString("NAME") + " (" + typedata[2] + ")  " + info + "   </li>";


    }







    db.closeCon();

    db.openCon();

    ResultSet rs2 = db.getData(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "*", "NEW_VALUE='" + myid[0] + "' and OBJECT_CLASS='com.acrtek.xact_services.data.bo.BoGroup' and S_PARAMETER='LOCATION' and SCENARIO_ID='" + sid + "'");


    while (rs2.next()) {

        String info = "";

        String[] groupData = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, " ID='" + rs2.getString("OBJECT_ID") + "'");
        String[] typedata = db.getRowNocon(XMLDataModel.GROUP_TYPE_TABLENAME, "id=" +  groupData[5]);
        
        String addstyle = " color:#0C38DD ";
        
        

            String location = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, "id=" + groupData[2])[5];
            info += "<br>This group has been moved from '" + location + "'";
       


        data += "<li class=\"getgroup\" style='"+addstyle+"' id=\"location/" + groupData[0] + "/" + myid[1] + "/" + myid[2] + "\">" + groupData[3] + " (" + typedata[2] + ")  " + info + "   </li>";




    }

    db.closeCon();


    data += "</ul></div></div>";

    out.print(data);







%>