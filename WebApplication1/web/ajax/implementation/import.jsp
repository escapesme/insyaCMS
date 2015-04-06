<%@page import="java.lang.String"%>
<%@page import="xact.drawing.Implementation"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.tools.files"%>
<%

    //  String filename = "/Users/eScapes/Documents/test.csv";
    MODEL_ID = request.getParameter("mod_id");

    String filename = request.getParameter("loction") + "/" + request.getParameter("filename");
    String status = request.getParameter("status");

    ArrayList<String[]> datacsv = f.ImportCSV(filename, request, response);
    String r = "";

    // String MODEL_ID = request.getParameter("mod_id");
    // if (status.equalsIgnoreCase("sql")) {
    r += "Location Name,Location Latitude,Location Longitude,Group Name,Group Type,Node Name,Node Reference,Node Type,Node Response,Node Time ,NodeService Time\n";
    for (int i = 0; i < datacsv.size(); i++) {
        if (i > 1) {
            String[] m = datacsv.get(i);
            r += updateData(m, request, response);

        }
    }
    //}
    //out.print(test);
    //out.print(r);
    f.exportCSV("log-" + Utils.getNewID() + ".csv", r, request, response);
%>

<%!
    lib.engine.db.operations db = new lib.engine.db.operations();
    Implementation im = new Implementation();

    String test = "";
    String error = "";
    files f = new files();

    String MODEL_ID = "1393289470274";

    String updateData(String[] data, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String r = "";
        String MODEL_ID = request.getParameter("mod_id");

        String arrs = Arrays.deepToString(data).replace("[", "");
        r += arrs.replace("]", "");
        String error = "";
        r += "," + addLocation(data) + "\n";

        return r; //+ "\n" + "<br/>";
    }

    String thisLoactionID = "";

    String thisGroupId = "";

    String groupName = "";

    String[] updatemyData(String[] data) {
        String[] r = new String[data.length];
        for (int i = 0; i < data.length; i++) {
            r[i] = data[i].trim();

        }
        return r;

    }

    String addLocation(String[] data) {
        String r = "";
        if (data.length > 0) {
            r = "";

            data = updatemyData(data);

            if (!data[0].equalsIgnoreCase("")) {
                thisLoactionID = Utils.getNewID();
                // test += "<br>-----------------------------------------------<br> create Loction ID" + thisLoactionID;

                String[] rData = saveLocation(data);
                if (rData[0].equalsIgnoreCase("1")) {
                    r += " ,Location;" + rData[2] + ";" + "" + rData[1];
                } else {
                    r += " ,Location;" + rData[2] + ";" + "Error:" + rData[1];

                }

            } else {
                r += " ,";
            }

            if (!data[3].equalsIgnoreCase("")) {
                thisGroupId = Utils.getNewID();
                //  test += "<br>-----------------------------------------------<br> create Group ID" + thisGroupId;
                groupName = data[3];

                String[] rData = saveGroup(data);

                if (rData[0].equalsIgnoreCase("1")) {
                    r += ", Group;" + rData[2] + ";" + "" + rData[1];
                } else {
                    r += " ,Group;" + rData[2] + ";" + "Error:" + rData[1];

                }

            } else {
                r += " ,";

            }

            if (!data[5].equalsIgnoreCase("")) {

                String[] rData = saveNode(data);

                if (rData[0].equalsIgnoreCase("1")) {
                    r += ", Node;" + rData[2] + ";" + "" + rData[1];
                } else {
                    r += ", Node;" + rData[2] + ";" + "Error:" + rData[1];

                }

            } else {
                r += " ,";

            }
        }

        return r;
    }

    String[] saveLocation(String[] data) {

        String r = "";

        //  String corTypes
        //= String LATITUDE = "";
        String LONGITUDE = "";

        String LATITUDE_DEC = "";
        String LONGITUDE_DEC = "";

        String LATITUDE = "";

        String[] la = returnEmpty(data[1], "Latitude required");

        if (la[0].equals("0")) {
            return la;
        }

        la = returnEmpty(data[2], "Longitude required");

        if (la[0].equals("0")) {
            return la;
        }

        if (getCorType(data[1]).equalsIgnoreCase("g")) {

            LATITUDE_DEC = data[1];
            LONGITUDE_DEC = data[2];

            LONGITUDE = im.decimalToDMS(Double.parseDouble(LONGITUDE_DEC), "lng");
            LATITUDE = im.decimalToDMS(Double.parseDouble(LATITUDE_DEC), "lat");

        } else {
            LATITUDE = data[1];
            LONGITUDE = data[2];
            LATITUDE_DEC = im.parsedeg(LATITUDE);
            LONGITUDE_DEC = im.parsedeg(LONGITUDE);

        }

        String where = "NAME='" + data[0] + "'  and MODEL_ID='" + MODEL_ID + "'";

        String[] filesd = {"MODEL_ID", "LATITUDE", "LONGITUDE", "NAME", "PATH", "TYPE", "VISIBLE", "LATITUDE_DEC", "LONGITUDE_DEC"};

        //LATITUDE = LATITUDE.replace("'", "");
        // LONGITUDE = LONGITUDE.replace("'", "");
        String[] values = {MODEL_ID, LATITUDE, LONGITUDE, data[0], data[0], "City", "1", LATITUDE_DEC, LONGITUDE_DEC};

        // r = "" + saveData(XMLDataModel.LOCATION_TABLENAME, thisLoactionID, where, filesd, values, "loction");
        return saveData(XMLDataModel.LOCATION_TABLENAME, thisLoactionID, where, filesd, values, "loction");

    }

    String[] saveGroup(String[] data) {

        String where = "NAME='" + data[3] + "'  and LOCATION_ID='" + thisLoactionID + "'";
        String[] filesd = {"MODEL_ID", "LOCATION_ID", "NAME", "REFERENCE", "TYPE_ID"};

        String[] la = returnEmpty(data[4], "Group Type required");

        if (la[0].equals("0")) {
            return la;
        }

        String[] values = {MODEL_ID, thisLoactionID, data[3], "1", getGroupType(data[4])};

        return saveData(XMLDataModel.NET_GROUP_TABLENAME, thisGroupId, where, filesd, values, "group");

    }

    String[] saveNode(String[] data) {

        String myname = data[5].replace(" ", "-");

        String TableName = XMLDataModel.NODE_TABLENAME;

        String where = "NAME='" + myname + "' and GROUP_ID='" + thisGroupId + "'";

        String SERVICE_TIME = "0.001";
        String REPETITION = "0.001";

        String RESPONSE_TIME = "0.001";

        try {
            SERVICE_TIME = setDefult(data[10], "0.001");
        } catch (Exception e) {

        }

        try {
            RESPONSE_TIME = setDefult(data[9], "0.001");
        } catch (Exception e) {

        }

        try {
            REPETITION = setDefult(data[8], "0.001");
        } catch (Exception e) {

        }

        String[] la = returnNumber(SERVICE_TIME, " SERVICE_TIME must be Number");

        if (la[0].equals("0")) {
            return la;
        }

        la = returnNumber(RESPONSE_TIME, " RESPONSE_TIME must be Number");

        if (la[0].equals("0")) {
            return la;
        }

        la = returnNumber(REPETITION, " Repetition must be Number");

        if (la[0].equals("0")) {
            return la;
        }

        String[] getoldData = getActionStatus(TableName, where);

        if (getoldData[0] != null) {
            SERVICE_TIME = setDefult(SERVICE_TIME, getoldData[9]);
            RESPONSE_TIME = setDefult(RESPONSE_TIME, getoldData[8]);
            REPETITION = setDefult(REPETITION, getoldData[7]);
        }

        try {

            double mynum = Double.parseDouble(data[6]);
            if (mynum >= 1) {
                data[6] = "1";
            } else {

                data[6] = "0";
            }
        } catch (NumberFormatException e) {
            data[6] = "0";

        }

        String[] types = {"EQUIPMENT", "HUMAN", "POINT_OF_SALE", "ROUTER", "SERVER", "SMART_PHONE", "STORAGE", "SWITCH", "TERMINAL", "VEHICLE"};

        if (!Arrays.asList(types).contains(data[7].toUpperCase())) {

            String[] r = new String[3];
            r[0] = "0";
            r[1] = "Type not found";
            r[2] = "";
            return r;
        }

        String[] filesd = {"MODEL_ID", "HOSTNAME", "GROUP_ID", "NAME", "REFERENCE", "REPETITION", "RESPONSE_TIME", "SERVICE_TIME", "TYPE", "X", "Y", "IMG"};
        String[] values = {MODEL_ID, groupName + "_" + myname, thisGroupId, myname, data[6], REPETITION, RESPONSE_TIME, SERVICE_TIME, data[7].toUpperCase(), "0", "0", "0"};
        String id = Utils.getNewID();

        return saveData(TableName, id, where, filesd, values, "node");

    }

    String getCorType(String s) {
        String r = "g";

        try {
            Double.parseDouble(s);
        } catch (NumberFormatException e) {
            r = "c";
        }
        return r;
    }

    String getGroupType(String Type) {
        String r = "";
        r = db.getRow(XMLDataModel.GROUP_TYPE_TABLENAME, "NAME='" + Type + "'")[0];
        if (r == null) {
            String myid = Utils.getNewID();
            String[][] daaa = {{"ID", "NAME"}, {myid, Type}};
            db.setInsert(XMLDataModel.GROUP_TYPE_TABLENAME, daaa);
            r = myid;
        }

        return r;
    }

    String[] getActionStatus(String TableName, String where) {
        String[] rdata = db.getRow(TableName, where);
        return rdata;

    }

    String[] saveData(String TableName, String addID, String where, String[] filesd, String[] values, String status) {

        String[] r = new String[3];
        String[] rdata = db.getRow(TableName, where);

        if (rdata[0] != null) {

            addID = rdata[0];
            String[][] data = {filesd, values};

            error = db.setUpdate(TableName, data, "ID='" + rdata[0] + "'");
            //    test += "<br>-----------------------------------------------<br>" + db.returnSQL + "<br>";

            test += "<br>-----------------------------------------------<br>" + TableName + " Update <br>" + Arrays.deepToString(data) + " >>" + error + "<br>";

            if (status.equalsIgnoreCase("loction")) {
                thisLoactionID = rdata[0];

                test += "<br>-----------------------------------------------<br> updae Location ID :" + thisLoactionID;

            } else if (status.equalsIgnoreCase("group")) {
                thisGroupId = rdata[0];
                groupName = rdata[3];
                test += "<br>-----------------------------------------------<br> updae GRoup ID :" + thisGroupId;

            } else if (status.equalsIgnoreCase("node")) {

            }

        } else {

            String[] filesdm = new String[filesd.length + 1];

            String[] valuesm = new String[values.length + 1];

            for (int i = 0; i < filesd.length; i++) {
                filesdm[i] = filesd[i];
            }

            for (int i = 0; i < values.length; i++) {
                valuesm[i] = values[i];
            }

            filesdm[filesd.length] = "ID";

            valuesm[values.length] = addID;

            String[][] data = {filesdm, valuesm};

            error = db.setInsert(TableName, data);
            test += "<br>-----------------------------------------------<br>" + TableName + " Insert <br>" + Arrays.deepToString(data) + " >>" + error + "<br>";

        }

        if (error.equals("")) {
            r[0] = "1";
            r[1] = addID;

        } else {
            r[0] = "0";
            r[1] = error;

        }
        if (rdata[0] != null) {

            r[2] = "update";
        } else {
            r[2] = "add";

        }

        test += "" + Arrays.deepToString(r) + "<br>-----------------------------------------------<br>";

        return r; // r;
    }

    String setDefult(String v, String d) {

        String r = "";

        if (v != null) {

            if (v.equalsIgnoreCase("") || v.equalsIgnoreCase("0")) {
                r = d;
            } else {
                r = v;

            }
        } else {

            r = d;
        }

        return r;

    }

    String[] returnEmpty(String val, String msg) {
        String[] r = new String[3];

        if (val.equalsIgnoreCase("")) {
            r[0] = "0";

            r[1] = "" + msg + "";
        } else {
            r[0] = "1";
            r[1] = "";
        }

        r[2] = "";

        return r;

    }

    String[] returnNumber(String val, String msg) {
        String[] r = new String[3];
        boolean s = false;
        try {
            double dVal = Double.parseDouble(val);

        } catch (NumberFormatException e) {
            s = true;
        }

        if (s) {
            r[0] = "0";

            r[1] = "" + msg + "";
        } else {
            r[0] = "1";
            r[1] = "";
        }

        r[2] = "";

        return r;

    }


%>



