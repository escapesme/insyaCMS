
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.drawing.Implementation"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();

    Implementation im = new Implementation();

    String status = request.getParameter("status");

    if (status.equalsIgnoreCase("addline")) {

        
        
        
        
        
        
        
        String node1 = request.getParameter("nformid");

        String node2 = request.getParameter("ntoid");

        out.print(node2);

        String errorRate = request.getParameter("errorrate");
        String length = request.getParameter("length");
        String overhead = request.getParameter("overhead");
        String throughput = request.getParameter("throughput");
        String protocol = request.getParameter("protocol");
        String modid = request.getParameter("modid");
        String active = request.getParameter("active");
        String ID = Utils.getNewID();
        String[][] data = {{"ID", "MODEL_ID", "ERROR_RATE", "LENGTH", "NODE_ID1", "NODE_ID2", "OVERHEAD", "PROTOCOL", "REFERENCE", "THROUGHPUT"},
        {ID, modid, errorRate, length, node1, node2, overhead, protocol, active, throughput}
        };

        out.print(Arrays.deepToString(data));
        out.print(db.setInsert(XMLDataModel.LINE_TABLENAME, data));
        
        
        
        
        
        
        
        
        
        
        

    } else if (status.equalsIgnoreCase("editline")) {
        String node1 = request.getParameter("nformid");
        String node2 = request.getParameter("ntoid");
        String id = request.getParameter("id");
        String errorRate = request.getParameter("errorrate");
        String length = request.getParameter("length");
        String overhead = request.getParameter("overhead");
        String throughput = request.getParameter("throughput");
        String protocol = request.getParameter("protocol");
        String active = request.getParameter("active");
        String[][] data = {{"ERROR_RATE", "LENGTH", "NODE_ID1", "NODE_ID2", "OVERHEAD", "PROTOCOL", "REFERENCE", "THROUGHPUT"},
        {errorRate, length, node1, node2, overhead, protocol, active, throughput}
        };

        out.print(Arrays.deepToString(data));
        out.print(db.setUpdate(XMLDataModel.LINE_TABLENAME, data, "id=" + id));

    } else if (status.equalsIgnoreCase("editloction")) {

        String name = request.getParameter("name");
        String lng = request.getParameter("lng");
        String lot = request.getParameter("lot");

        String ID = request.getParameter("ID");

        String[] getdata = db.getRow(XMLDataModel.LOCATION_TABLENAME, " ID=" + ID);
        String lnga = "-1";
        String lota = "-1";
        if (!getdata[10].equalsIgnoreCase("-1")) {
            lnga = im.decimalToDMS(Double.parseDouble(request.getParameter("lng")), "lng");
            lota = im.decimalToDMS(Double.parseDouble(request.getParameter("lot")), "lat");
            lnga = request.getParameter("lng");
            lota = request.getParameter("lot");
        }

        String[][] data = {{"LATITUDE", "LONGITUDE", "NAME", "LATITUDE_DEC", "LONGITUDE_DEC"},
        {lot, lng, name, lota, lnga}
        };

        out.print(db.setUpdate(XMLDataModel.LOCATION_TABLENAME, data, "ID='" + ID + "'"));

        out.print(ID);
    } else if (status.equalsIgnoreCase("delete")) {

        String ID = request.getParameter("ID");

        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.NET_GROUP_TABLENAME, "*", " LOCATION_ID='" + ID + "'");

        if (rs.next()) {

            out.print("Error: Cannot delete. Please remove all groups in this location first!");
        } else {

            db.setDeleteNocon(XMLDataModel.LOCATION_TABLENAME, "ID='" + ID + "'");

            out.print("Location deleted.");
        }

        db.closeCon();
    } else if (status.equalsIgnoreCase("deleteline")) {

        String ID = request.getParameter("ID");

        db.setDelete(XMLDataModel.LINE_TABLENAME, "ID='" + ID + "'");

        out.print("line deleted.");

    } else {
        String name = request.getParameter("name");
        /* String lng = request.getParameter("lng");
         String lot = request.getParameter("lot");
         */

        String cid = request.getParameter("cloudid");

        String modid = request.getParameter("modid");

        String lnga = im.decimalToDMS(Double.parseDouble(request.getParameter("lng")), "lng");;
        String lota = im.decimalToDMS(Double.parseDouble(request.getParameter("lot")), "lat");;
        String ID = Utils.getNewID();

        String Path = "Global/" + name;
        String type = "City";

        String parentID = db.getValue(XMLDataModel.LOCATION_TABLENAME, "id", "MODEL_ID='" + modid + "' and NAME='Global'");

        if (parentID.trim().equalsIgnoreCase("")) {

            String[][] data2 = {{"ID", "MODEL_ID", "LATITUDE", "LONGITUDE", "NAME", "PATH", "TYPE", "CLOUD_ID", "LATITUDE_DEC", "LONGITUDE_DEC"},
            {ID, modid, lota, lnga, name, Path, type, cid, request.getParameter("lot"), request.getParameter("lng")}
            };

            out.print(db.setInsert(XMLDataModel.LOCATION_TABLENAME, data2));
        } else {

            String[][] data = {{"ID", "MODEL_ID", "LATITUDE", "LONGITUDE", "PARENT_ID", "NAME", "PATH", "TYPE", "CLOUD_ID", "LATITUDE_DEC", "LONGITUDE_DEC"},
            {ID, modid, lota, lnga, parentID, name, Path, type, cid, request.getParameter("lot"), request.getParameter("lng")}
            };

            out.print(db.setInsert(XMLDataModel.LOCATION_TABLENAME, data));

        }

        /*

         data = {{"ID", "MODEL_ID", "LATITUDE", "LONGITUDE", "PARENT_ID", "NAME", "PATH", "TYPE", "CLOUD_ID"},
         {ID, modid, lota, lnga, parentID, name, Path, type, cid}
         };*/
        // db.setInsert(XMLDataModel.LOCATION_TABLENAME, data);
    }

%>

