<%-- 
    Document   : getAci2ActList
    Created on : Sep 18, 2013, 3:56:00 PM
    Author     : Ahmed
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%
    String id = request.getParameter("activityId");
    lib.engine.db.operations db = new lib.engine.db.operations();
    String data = "";
    db.openCon();
    ResultSet rs = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "SERVICE_ACTIVITY_ID=" + id);
    try {
        while (rs.next()) {
            String aciRow_0_String = "";
            String aciRow_6_String = "";
            String complexRow_String = "";
            String lsRow_String = "";
            String UTILIZATION_FREQ = "";

            UTILIZATION_FREQ = rs.getString("UTILIZATION_FREQ");

            String[] aciRow = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + rs.getString("AC_INST_ID"));
            aciRow_0_String = aciRow[0];
            aciRow_6_String = aciRow[6];

            String[] lsiRow = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + aciRow[4]);

            if (aciRow[2] != null) {

                String[] complexRow = db.getRowNocon(XMLDataModel.COMPLEX_INST_TABLENAME, "ID=" + lsiRow[2]);

                complexRow_String = complexRow[3];

                String[] lsRow = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + lsiRow[1]);
                lsRow_String = lsRow[2].split("Complex")[0];
            }

            data += aciRow_0_String + "," + aciRow_6_String + "," + complexRow_String + "," + lsRow_String + "," + UTILIZATION_FREQ + "__";

        }
    } catch (SQLException ex) {

    }
    db.closeCon();
    out.print(data);
%>