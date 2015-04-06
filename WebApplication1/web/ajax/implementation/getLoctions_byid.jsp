<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();
    String returnData = "";
    db.openCon();

    if (request.getParameter("status") != null && request.getParameter("status").equalsIgnoreCase("line")) {

        String ID = request.getParameter("id");
        ResultSet rs = db.getData(XMLDataModel.LINE_TABLENAME, "*", " ID=" + ID);

        String g1 = "", g2 = "";
        ResultSet rscon = db.getData(XMLDataModel.CONNECTORS_TABLENAME, "*", " ID=" + ID);

        if (rs.next()) {
            returnData += rs.getString("ID") + "__" + rs.getString("MODEL_ID") + "__" + rs.getString("ERROR_RATE")
                    + "__" + rs.getString("LENGTH")
                    + "__" + rs.getString("NODE_ID1")
                    + "__" + rs.getString("NODE_ID2")
                    + "__" + rs.getString("OVERHEAD")
                    + "__" + rs.getString("PROTOCOL")
                    + "__" + rs.getString("REFERENCE")
                    + "__" + rs.getString("THROUGHPUT")
                    + "__" + rs.getString("IMG")
                    + "__" + rs.getString("WIRELESS");
            g1 = db.getValueNocon(XMLDataModel.NODE_TABLENAME, "GROUP_ID", "ID=" + rs.getString("NODE_ID1"));
            g2 = db.getValueNocon(XMLDataModel.NODE_TABLENAME, "GROUP_ID", "ID=" + rs.getString("NODE_ID2"));

        }

        if (rscon.next()) {
            returnData += "__" + rscon.getString("LOCATION_ID1") + "__" + rscon.getString("LOCATION_ID2") + "__" + g1 + "__" + g2;
        }

    } else {

        String ID = request.getParameter("ID");
        ResultSet rs = db.getData(XMLDataModel.LOCATION_TABLENAME, "*", " ID=" + ID);

        if (rs.next()) {

            if (rs.getString("LONGITUDE_DEC").equalsIgnoreCase("-1")) {
                returnData += rs.getString("NAME") + "__" + rs.getString("LATITUDE") + "__" + rs.getString("LONGITUDE");

            } else {

                returnData += rs.getString("NAME") + "__" + rs.getString("LATITUDE_DEC") + "__" + rs.getString("LONGITUDE_DEC");

            }
        }

    }

    out.print(returnData);
    db.closeCon();

%>