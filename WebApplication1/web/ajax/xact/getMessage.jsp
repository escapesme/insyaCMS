<%@page import="lib.tools.Utils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xact.utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();

    String status = request.getParameter("status");

    String Network_Protocol = "";
    String Transport_Protocol = "";
    String Tunneling_Protocol = "";
    String Utilization_rate_s = "";
    String Utilization_rate_r = "";
    String size_Message_s = "";
    String size_Message_r = "";

    String Location_o = "";
    String Server_o = "";
    String Componnet_o = "";

    String Datacenter_o = "";

    String Location_d = "";
    String Server_d = "";
    String Componnet_d = "";

    String Datacenter_d = "";
    String smID = "";

    if (status.equalsIgnoreCase("getmessageName")) {

        String id = request.getParameter("id");

        db.openCon();
        String data22 = "";
        ResultSet myyrs = db.getData(XMLDataModel.S2S_XREF_TABLENAME, "*", "S2S_ID=" + id);
        while (myyrs.next()) {

            String[] ms = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "id=" + myyrs.getString("OBJECT_ID"));

            data22 += ms[0] + "__" + ms[2] + ";";

        }
        db.closeCon();
        out.print(data22);

    } else if (status.equalsIgnoreCase("setmessagescenario")) {
        xact.utils u = new xact.utils();

        String SCENARIO_ID = request.getParameter("sid");
        String id = request.getParameter("oid");
        String MODEL_ID = request.getParameter("mid");

        String[] S_PARAMETER = {"NETWORK_PROTOCOL", "TRANSPORT_PROTOCOL", "TUNNELING_PROTOCOL", "REQUEST_PER_SECOND", "REQUEST_SIZE", "RESPONSE_PER_SECOND", "RESPONSE_SIZE"};

        String[] OLD_VALUE = {request.getParameter("NetworkProtocol"), request.getParameter("TransportProtocol"), request.getParameter("TunnelingProtocol"), request.getParameter("Utilizationrate"), request.getParameter("sizeMessage"), request.getParameter("UtilizationrateReceiving"), request.getParameter("sizeMessageReceiving")

        };
        String[] NEW_VALUE = {request.getParameter("NetworkProtocol_new"), request.getParameter("TransportProtocol_new"), request.getParameter("TunnelingProtocol_new"), request.getParameter("Utilizationrate_new"), request.getParameter("sizeMessage_new"), request.getParameter("UtilizationrateReceiving_new"), request.getParameter("sizeMessageReceiving_new")};

        String[] ObjectClass = {"BoSegment", "BoSegment", "BoSegment", "BoSegment", "BoSegment", "BoSegment", "BoSegment"};
        String[] OBJECT_ID = {id, id, id, id, id, id, id};

        u.setScenarioParametersArray(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE, ObjectClass);

    } else if (status.equalsIgnoreCase("getmessagescenario")) {
       db.openCon();

        String mid = request.getParameter("id");

        String SCENARIO_ID = request.getParameter("sid");
        String MODEL_ID = request.getParameter("mid");
        
        
        String[] sedata = db.getRowNocon(XMLDataModel.SEGMENT_TABLENAME, "MESSAGE_ID=" + mid);

        String ACID_o = sedata[2];
        String ACID_d = sedata[3];
        String[] prodAc = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, " ID=" + ACID_o);
        String[] conAc = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, " ID=" + ACID_d);

        String MYnodeID_o = new utils().getNodeId(prodAc[0]);
        String MYnodeID_d = new utils().getNodeId(conAc[0]);

        String[] nodedata_o = db.getRowNocon(XMLDataModel.NODE_TABLENAME, " ID=" + MYnodeID_o);
        String[] nodedata_d = db.getRowNocon(XMLDataModel.NODE_TABLENAME, " ID=" + MYnodeID_d);

        String groyp_id_o = nodedata_o[4];
        String groyp_id_d = nodedata_d[4];

        String[] datacenter_o = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, " ID=" + groyp_id_o);
        String[] datacenter_d = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, " ID=" + groyp_id_d);

        String[] location_o = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, " ID=" + datacenter_o[2]);
        String[] location_d = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, " ID=" + datacenter_d[2]);

        smID = sedata[0];

        Componnet_d = prodAc[6];
        Componnet_o = conAc[6];

        Location_o = location_o[5];
        Location_d = location_d[5];
        Server_o = nodedata_o[2];
        Datacenter_o = datacenter_o[3];

        Server_d = nodedata_d[2];
        Datacenter_d = datacenter_d[3];

        db.closeCon();


        //        String[] S_PARAMETER = {"NETWORK_PROTOCOL", "TRANSPORT_PROTOCOL", "TUNNELING_PROTOCOL", "REQUEST_PER_SECOND", "REQUEST_SIZE", "RESPONSE_PER_SECOND", "RESPONSE_SIZE"};
        Network_Protocol = Utils.getScenarioPram(MODEL_ID, SCENARIO_ID, smID, "NETWORK_PROTOCOL", sedata[6], "com.acrtek.xact_services.data.bo.BoSegment");;
        Transport_Protocol = Utils.getScenarioPram(MODEL_ID, SCENARIO_ID, smID, "TRANSPORT_PROTOCOL", sedata[12], "com.acrtek.xact_services.data.bo.BoSegment");;
        Tunneling_Protocol = Utils.getScenarioPram(MODEL_ID, SCENARIO_ID, smID, "TUNNELING_PROTOCOL", sedata[13], "com.acrtek.xact_services.data.bo.BoSegment");
        Utilization_rate_s = Utils.getScenarioPram(MODEL_ID, SCENARIO_ID, smID, "REQUEST_PER_SECOND", sedata[8], "com.acrtek.xact_services.data.bo.BoSegment");
        size_Message_s = Utils.getScenarioPram(MODEL_ID, SCENARIO_ID, smID, "REQUEST_SIZE", sedata[9], "com.acrtek.xact_services.data.bo.BoSegment");
        Utilization_rate_r = Utils.getScenarioPram(MODEL_ID, SCENARIO_ID, smID, "RESPONSE_PER_SECOND", sedata[10], "com.acrtek.xact_services.data.bo.BoSegment");

        size_Message_r = Utils.getScenarioPram(MODEL_ID, SCENARIO_ID, smID, "RESPONSE_SIZE", sedata[11], "com.acrtek.xact_services.data.bo.BoSegment");

        String data22 = smID + "," + Location_o + ";" + Location_d + "," + Datacenter_o + ";" + Datacenter_d + "," + Server_o + ";" + Server_d + ","
                + Componnet_o + ";" + Componnet_d + "," + Network_Protocol + "," + Transport_Protocol + "," + Tunneling_Protocol + "," + Utilization_rate_s
                + "," + size_Message_s + "," + Utilization_rate_r + "," + size_Message_r;

        out.print(data22);

    } else {

        String mid = request.getParameter("id");

        //db.getData(XMLDataModel.SEGMENT_TABLENAME, "*", "MESSAGE_ID=" + mid);
        db.openCon();

        int senumber = db.getRowCountNocon(XMLDataModel.SEGMENT_TABLENAME, "MESSAGE_ID=" + mid);

        if (senumber == 1) {

            String[] sedata = db.getRowNocon(XMLDataModel.SEGMENT_TABLENAME, "MESSAGE_ID=" + mid);

            String ACID_o = sedata[2];
            String ACID_d = sedata[3];
            String[] prodAc = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, " ID=" + ACID_o);
            String[] conAc = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, " ID=" + ACID_d);

            String MYnodeID_o = new utils().getNodeId(prodAc[0]);
            String MYnodeID_d = new utils().getNodeId(conAc[0]);

            String[] nodedata_o = db.getRowNocon(XMLDataModel.NODE_TABLENAME, " ID=" + MYnodeID_o);
            String[] nodedata_d = db.getRowNocon(XMLDataModel.NODE_TABLENAME, " ID=" + MYnodeID_d);

            String groyp_id_o = nodedata_o[4];
            String groyp_id_d = nodedata_d[4];

            String[] datacenter_o = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, " ID=" + groyp_id_o);
            String[] datacenter_d = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, " ID=" + groyp_id_d);

            String[] location_o = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, " ID=" + datacenter_o[2]);
            String[] location_d = db.getRowNocon(XMLDataModel.LOCATION_TABLENAME, " ID=" + datacenter_d[2]);

            Network_Protocol = sedata[6];
            Transport_Protocol = sedata[12];
            Tunneling_Protocol = sedata[13];
            Utilization_rate_s = sedata[8];

            size_Message_s = sedata[9];
            Utilization_rate_r = sedata[10];
            size_Message_r = sedata[11];

            smID = sedata[0];

            Componnet_d = prodAc[6];
            Componnet_o = conAc[6];

            Location_o = location_o[5];
            Location_d = location_d[5];
            Server_o = nodedata_o[2];
            Datacenter_o = datacenter_o[3];

            Server_d = nodedata_d[2];
            Datacenter_d = datacenter_d[3];

        }

        db.closeCon();

        String data22 = smID + "," + Location_o + ";" + Location_d + "," + Datacenter_o + ";" + Datacenter_d + "," + Server_o + ";" + Server_d + ","
                + Componnet_o + ";" + Componnet_d + "," + Network_Protocol + "," + Transport_Protocol + "," + Tunneling_Protocol + "," + Utilization_rate_s
                + "," + size_Message_s + "," + Utilization_rate_r + "," + size_Message_r;

        out.print(data22);
    }

%>