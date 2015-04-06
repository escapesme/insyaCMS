

<%@page import="xact.results.rmv"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%
    String Status = request.getParameter("status");
    lib.engine.db.operations db = new lib.engine.db.operations();

    xact.utils u = new xact.utils();
    rmv myrmv = new rmv("", "", "");

    if (Status.equalsIgnoreCase("deletemessage")) {
        out.print(db.setDelete(XMLDataModel.SEGEMENT_TABLENAME, "MESSAGE_ID=" + request.getParameter("id")));
        out.print(db.setDelete(XMLDataModel.MESSAGE_TABLENAME, "id=" + request.getParameter("id")));
    } else if (Status.equalsIgnoreCase("addmessage")) {

        String MODEL_ID = request.getParameter("MODEL_ID");
        String S2S_ID = request.getParameter("S2S_ID");
        String tableData = request.getParameter("Table");

        String ServesName = request.getParameter("ServesName");

        
           String[][] sdatas = {{"NAME"}, {ServesName}};
                String[] ids = request.getParameter("id").split("/");
                out.print(db.setUpdate(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, sdatas, "id='" + ids[1] + "'"));
        if (!tableData.equals("")) {
            String[] table = tableData.split(";");

            System.err.print(request.getParameter("Table"));

            for (String row : table) {
                //a__1392422399072__1392422399076__1392423082290__1392423010769__1__
                String[] rowData = row.split("__");
                String Name = rowData[0];
                String PRODUCER_ACTIVITY = rowData[1];
                String CONSUMER_ACTIVITY = rowData[2];
                String PRODUCER_AC = rowData[3];
                String CONSUMER_AC = rowData[4];
                double UTILIZATION_FREQUENCY = Double.parseDouble(rowData[5]) / 100;

                String ID = Utils.getNewID();
                String[][] data = {{"ID", "MODEL_ID", "Name", "PRODUCER_ACTIVITY", "CONSUMER_ACTIVITY", "PRODUCER_AC", "CONSUMER_AC", "UTILIZATION_FREQUENCY"},
                {ID, MODEL_ID, Name, PRODUCER_ACTIVITY, CONSUMER_ACTIVITY, PRODUCER_AC, CONSUMER_AC, "" + UTILIZATION_FREQUENCY}};
                out.print(db.setInsert(XMLDataModel.MESSAGE_TABLENAME, data));

                String IDs = Utils.getNewID();
                String[][] datax = {{"ID", "MODEL_ID", "S2S_ID", "OBJECT_ID"},
                {IDs, MODEL_ID, S2S_ID, ID}};
                out.print(db.setInsert(XMLDataModel.S2S_XREF_TABLENAME, datax));
                String[][] datas = {{"ID", "MODEL_ID",
                    "AC_ID1",
                    "AC_ID2",
                    "MESSAGE_ID",
                    "INDEX",
                    "REQUEST_PER_SECOND",
                    "REQUEST_SIZE",
                    "RESPONSE_PER_SECOND",
                    "RESPONSE_SIZE",
                    "UTILISATION_RATE",
                    "OVERHEAD",
                    "NETWORK_PROTOCOL",
                    "TRANSPORT_PROTOCOL",
                    "TUNNELING_PROTOCOL"
                },
                {IDs, MODEL_ID,
                    PRODUCER_AC,
                    CONSUMER_AC,
                    ID,
                    "1",
                    "1",
                    "1",
                    "1",
                    "1",
                    "1", "0", "none", "none", "none"}};

                out.print(db.setInsert(XMLDataModel.SEGEMENT_TABLENAME, datas));

             

            }

        }

    } else if (Status.equalsIgnoreCase("getsegement")) {
        db.openCon();
        String id = request.getParameter("id");
        ResultSet arrData = db.getData(XMLDataModel.SEGEMENT_TABLENAME, "*", "MESSAGE_ID=" + id + " order by `INDEX`  ");
        String[] arrmData = db.getRowNocon(XMLDataModel.MESSAGE_TABLENAME, "ID=" + id);
        String ret = "";
        myrmv.openConnections();
        while (arrData.next()) {

            ret += arrData.getString("ID")
                    + ";" + arrData.getString("MODEL_ID")
                    + ";" + arrData.getString("AC_ID1")
                    + ";" + arrData.getString("AC_ID2")
                    + ";" + arrData.getString("REQUEST_PER_SECOND")
                    + ";" + arrData.getString("REQUEST_SIZE")
                    + ";" + arrData.getString("RESPONSE_PER_SECOND")
                    + ";" + arrData.getString("RESPONSE_SIZE")
                    + ";" + arrData.getString("UTILISATION_RATE")
                    + ";" + arrData.getString("OVERHEAD")
                    + ";" + arrData.getString("NETWORK_PROTOCOL")
                    + ";" + arrData.getString("TRANSPORT_PROTOCOL")
                    + ";" + arrData.getString("TUNNELING_PROTOCOL")
                    + ";" + arrData.getString("MESSAGE_ID")
                    + ";" + arrData.getString("INDEX")
                    + ";" + myrmv.getacname(arrData.getString("AC_ID1").trim())
                    + ";" + arrmData[6].trim()
                    + "__";

        }
        myrmv.closeConnections();
        out.print(ret);
        db.closeCon();
    } else if (Status.equalsIgnoreCase("getmessages")) {
        db.openCon();
        String id = request.getParameter("id");
        ResultSet arrData = db.getData(XMLDataModel.S2S_XREF_TABLENAME, "*", "S2S_ID=" + id);
        String ret = "";
        myrmv.openConnections();
        while (arrData.next()) {

            String[] arrDatam = db.getRowNocon(XMLDataModel.MESSAGE_TABLENAME, "id=" + arrData.getString("OBJECT_ID"));
            // ret += arrDatam[5];
            if (arrDatam[5] != null && arrDatam[6] != null) {
                if (!arrDatam[5].equalsIgnoreCase("null") && !arrDatam[6].equalsIgnoreCase("null")) {
                    // out.print(arrDatam[6]+"__");
                    arrDatam[5] = myrmv.getacname(arrDatam[5].trim());
                    arrDatam[6] = myrmv.getacname(arrDatam[6].trim());
                    String sr_data = Arrays.deepToString(arrDatam);
                    sr_data = sr_data.replace("]", "");
                    sr_data = sr_data.replace("[", "");
                    sr_data = sr_data.replace(",", ";");
                    ret += sr_data + "__";

                }
            }
        }
        myrmv.closeConnections();
        out.print(ret);
        db.closeCon();

    } else if (Status.equalsIgnoreCase("getPRODUCER_ACTIVITY")) {
        String outData = "";
        String[] ids = request.getParameter("id").split(",");
        for (String myid : ids) {
            String[] id = myid.split("/");
            outData += "," + Arrays.deepToString(u.getAllactivity(id[1]).toArray());
            String[] thisrs = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "ID=" + id[1]);
            if (thisrs[1].equalsIgnoreCase("activity")) {
                outData += "," + thisrs[0] + "__" + thisrs[2];
            }
        }
        out.print(outData);

    } else if (Status.equalsIgnoreCase("getCONSUMER_ACTIVITY")) {

        String outData = "";
        String[] ids = request.getParameter("id").split(",");
        for (String myid : ids) {
            String[] id = myid.split("/");
            outData += "," + Arrays.deepToString(u.getAllactivity(id[1]).toArray());
            String[] thisrs = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "ID=" + id[1]);
            if (thisrs[1].equalsIgnoreCase("activity")) {
                outData += "," + thisrs[0] + "__" + thisrs[2];
            }
        }
        out.print(outData);

    } else if (Status.equalsIgnoreCase("getPRODUCER_AC")) {
        String id = request.getParameter("id");
        out.print(Arrays.deepToString(u.getAcifromActivityNodeId(id).toArray()));
    } else if (Status.equalsIgnoreCase("getCONSUMER_AC")) {
        String id = request.getParameter("id");
        out.print(Arrays.deepToString(u.getAcifromActivityNodeId(id).toArray()));

    } else if (Status.equalsIgnoreCase("getAPPLICATION")) {

        String id = request.getParameter("id");

        String[] arrDatam = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "id=" + id);
        db.openCon();
        ResultSet arrData = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "MODEL_ID=" + arrDatam[1]);
        String ret = "";
        while (arrData.next()) {
            ret += arrData.getString("ID") + "__" + arrData.getString("INST_NAME");
            ret += ";";
        }
        out.print(ret);
        db.closeCon();

    } else if (Status.equalsIgnoreCase("getPRODUCER")) {
        String id = request.getParameter("id");
        String[] arrData = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "id=" + id);
        arrData = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + arrData[5]);
        out.print(arrData[0] + "__" + arrData[6]);

    } else if (Status.equalsIgnoreCase("getPRODUCERName")) {
        String id = request.getParameter("id");

        String[] arrData = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + id);
        out.print(arrData[6]);

    } else if (Status.equalsIgnoreCase("getPRODUCER_AC_value")) {
        String id = request.getParameter("id");
        out.print(myrmv.getacname(id));

    } else if (Status.equalsIgnoreCase("getCONSUMER_AC_value")) {
        String id = request.getParameter("id");
        out.print(myrmv.getacname(id));
    } else if (Status.equalsIgnoreCase("deletesegment")) {
        String id = request.getParameter("id");
        // out.print(myrmv.getacname(id));

        db.openCon();
        ResultSet resul = db.getData(XMLDataModel.SEGEMENT_TABLENAME, " max(`INDEX`) as mINDEX ", "MESSAGE_ID=" + id);

        while (resul.next()) {
            out.print(db.setDelete(XMLDataModel.SEGEMENT_TABLENAME, "MESSAGE_ID=" + id + " and `INDEX`='" + resul.getString("mINDEX") + "'"));

        }

        db.closeCon();

    } else if (Status.equalsIgnoreCase("deleteAllsegment")) {
        String id = request.getParameter("id");

        out.print(db.setDelete(XMLDataModel.SEGEMENT_TABLENAME, "MESSAGE_ID=" + id));

    } else if (Status.equalsIgnoreCase("addsegment")) {

        String id = request.getParameter("id");
        String[] arrDatam = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "id=" + id);

        String Networkprotocol = request.getParameter("Networkprotocol");
        String Tunnelingprotocol = request.getParameter("Tunnelingprotocol");
        String Transferprotocol = request.getParameter("Transferprotocol");
        String UtilizationRate = request.getParameter("UtilizationRate");
        String ConsumerApplcomp = request.getParameter("ConsumerApplcomp");
        String ProducerApplComp = request.getParameter("ProducerApplComp");
        String RESPONSESize = request.getParameter("RESPONSESize");
        String RESPONSEPerSecond = request.getParameter("RESPONSEPerSecond");
        String RequestSize = request.getParameter("RequestSize");
        String RequestsPerSecond = request.getParameter("RequestsPerSecond");
        String Overhead = request.getParameter("Overhead");
        String index = request.getParameter("index");

        String newId = Utils.getNewID();

        String[][] datas = {{"ID",
            "MODEL_ID",
            "AC_ID1",
            "AC_ID2",
            "MESSAGE_ID",
            "INDEX",
            "REQUEST_PER_SECOND",
            "REQUEST_SIZE",
            "RESPONSE_PER_SECOND",
            "RESPONSE_SIZE",
            "UTILISATION_RATE",
            "OVERHEAD",
            "NETWORK_PROTOCOL",
            "TRANSPORT_PROTOCOL",
            "TUNNELING_PROTOCOL"
        },
        {newId, arrDatam[1],
            ProducerApplComp,
            ConsumerApplcomp,
            id,
            index,
            RequestsPerSecond,
            RequestSize,
            RESPONSEPerSecond,
            RESPONSESize,
            UtilizationRate,
            Overhead,
            Networkprotocol,
            Transferprotocol,
            Tunnelingprotocol}};

        out.print(db.setInsert(XMLDataModel.SEGEMENT_TABLENAME, datas));

    }


%>

