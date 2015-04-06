
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();

    String myid = request.getParameter("id");

    db.openCon();
    String[] dt = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "id=" + myid);

    String[] LSIDAta = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "id=" + dt[4]);

    String[] ACData = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "id=" + dt[3]);

    String[] NODEData = db.getRowNocon(XMLDataModel.NODE_TABLENAME, "id=" + ACData[5]);

    db.closeCon();

    String serverID = NODEData[2];

    String modId = request.getParameter("modid");
    String sId = request.getParameter("sid");
    String point = request.getParameter("point");

    String modName = Utils.getModName(modId, sId) + "_" + point;
    modName = modName.trim();
    String resultId = Utils.getResultID(modId, sId);

    //String name1 = dt[6];
    // String name2 = Utils.getAciNMLName(dt[0]);
   /* String serverName = name2.split("__")[0];
     String machine = name2.split("__")[1];
     String partition = name2.split("__")[2];*/
    String outdata = "<tr>";

    //out.print(partition.charAt(partition.length()-1));
    db.openConres();

    // out.print("VAL0='DISK' AND MOD_NAME='" + modName + "' AND RESULT_ID=" + resultId + " AND VAL13=" + LSIDAta[2] + " AND VAL12=" + dt[4]);
    ResultSet dt3 = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "VAL0='DISK' AND MOD_NAME='" + modName + "' AND RESULT_ID=" + resultId + " AND VAL13=" + LSIDAta[2] + " AND VAL12=" + dt[4]);

    NumberFormat nf4 = NumberFormat.getInstance(Locale.US);
    nf4.setMaximumFractionDigits(4);
    nf4.setMinimumFractionDigits(4);

    // out.print(dt3[14]);
    while (dt3.next()) {
        String[] dt2 = db.getRowNocon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "VAL0='DISTRIBUTION_IO'  AND MOD_NAME='" + modName + "' AND RESULT_ID=" + resultId + "  AND VAL7='" + dt3.getString("VAL7") + "'");
        double responseTime = Double.parseDouble(dt3.getString("VAL10"));

        double queueTime = Double.parseDouble(dt3.getString("VAL11"));
        double elongation = ((responseTime / (responseTime - queueTime)) - 1) * 100;

        outdata += "<td>" + dt3.getString("VAL1") + "</td><td>" + dt3.getString("VAL2") + "</td><td>" + dt3.getString("VAL3") + "</td><td>" + dt3.getString("VAL7") + "</td><td>" + nf4.format(Double.parseDouble(dt3.getString("VAL9"))) + "%</td><td>" + nf4.format(responseTime) + "ms</td><td>" + nf4.format(queueTime) + "ms</td><td>" + nf4.format(elongation) + "%</td><td>" + (int) Double.parseDouble(dt2[13]) + "%</td></tr>";
    }

    db.closeCon();
    out.print(outdata);


%>

<style>

    table{
        width:100%  
    }
    TD{
        border:1px #888 solid    
    }

    th{
        border:1px #888 solid;  
        border-bottom:2px #888 solid    
    }

</style>