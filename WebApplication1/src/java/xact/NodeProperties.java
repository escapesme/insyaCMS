/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import lib.Options.XMLDataModel;
import lib.tools.Utils;

/**
 *
 * @author ismail
 */
public class NodeProperties {
     lib.engine.db.operations db = new lib.engine.db.operations();
     
     
     
      public String showProcess(String[] data, double workload, String[] data2, String[] data3, String myarr, String MODELID, String SCENARIOID, HttpServletRequest request) throws SQLException {

        String data22 = "";




        data22 = "<table class=\"tb_Property\"><thead><th class=\"th_Property\">Property</th>"
                + "<th class=\"th_Value\">Value</th></thead><thead>"
                + "<th colspan=2>process</th></thead><tr class=\"one\"><td>Name</td><td>" + data[2] + "</td></tr>"
                + "<tr class=\"one\"><td>ID</td><td>" + data[0] + "</td></tr><tr><td>TAG</td><td>" + data[1] + "</td></tr>  ";



        if (data[8].equals("0")) {


            data22 += "<tr><td>Job Type</td><td>transactional </td></tr>"
                    + "<tr><td>Occurrence During Window</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "process", "OCCURRENCE", data[10], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + "</td></tr>"
                    + "<tr><td>Expected Window</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "process", "T_O_D", data[12], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>";

        } else {


            data22 += "<tr><td>Job Type</td><td>Batch </td></tr><tr><td>Occurrence During Window</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "process", "OCCURRENCE", data[9], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + "</td></tr>"
                    + "<tr><td>Job Start Offset</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "process", "T_O_D", data[12], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>"
                    + "<tr><td>Number Of Streams</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "process", "STREAMS", data[14], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>"
                    + "<tr><td>Expected Window</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "process", "DURATION_1", data[9], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>"
                    + "<tr><td>SLA Window</td><td>" + data[11] + " </td></tr><tr>";
                    if(data2!=null) data22+= "<tr><td>Computed window</td><td>" + data2[9] + "</td></tr>";
                   data22 +="<td>outstanding workload</td><td>" + (workload - 100) + " </td></tr>";
//"<tr><td>Computed window</td><td>" + data2[9] + "</td></tr>"
        }
        data22 += "<td>Computed End Time</td><td>" + data[12] + " </td></tr><tr>"
                + "<tr><td>Arrival Rate</td><td>" + myarr + "</td></tr>";
                if(data3!=null)data22+= "<tr><td>Throughput</td><td>" + data3[7] + "</td></tr></table>";






        return data22;


    }

    public String showTask(String[] data, double workload, String[] data2, String[] data3, String myarr, String MODELID, String SCENARIOID, HttpServletRequest request) throws SQLException {
        String data22 = "";
        data22 = "<table class=\"tb_Property\"><thead><th colspan=2 >task</th></thead><thead>"
                + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                + "<tr class=\"one\" ><td  >Name</td><td>" + data[2] + "</td></tr>"
                + "<tr class=\"\" ><td  >ID</td><td>" + data[0] + "</td></tr>"
                + "<tr class=\"one\"><td>TAG</td><td>" + data[1] + "</td></tr>"
                + "<tr><td>Type</td><td>" + data[7] + "</td></tr>";




        if (data[8].equalsIgnoreCase("preperation")) {
            data22 += "<tr class=\"one\" ><td>Job Type</td><td>";

            if (data[9].equals("0")) {
                data22 += "transactional";
            } else {

                data22 += "patch";
            }



            data22 += "</td></tr> <tr><td>Response Time</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "task", "OCCURRENCE", data[9], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>";

        } else {
            if (data[9].equals("0")) {


                data22 += "<tr class=\"one\" ><td>Job Type</td><td>transactional</td></tr><tr><td>Number of occurrence</td><td>" + data[9] + " </td></tr><tr class=\"one\" ><td>Expected Window</td><td>" + data[10] + " </td></tr>";


            } else {
                data22 += "<tr><td>Job Type</td><td>batch </td></tr><tr class=\"one\" ><td>Job Start Offset</td><td>" + data[12] + "</td></tr><tr><td>Computed duration</td><td>" + data2[8] + " </td></tr><tr class=\"one\"><td>Computed End Time</td><td>>" + data[12] + " </td></tr> <tr><td>outstanding workload</td><td>" + String.format("%1$02.3f", (workload - 100)) + "</td></tr>";

            }
        }

        data22 += "<tr><td>SLA Throughput</td><td>" + data[13] + " </td></tr><tr><td>SLA Resource Consumption</td><td>" + data[10] + " </td></tr><tr><td>Arrival Rate</td><td>" + myarr;
        if (data3 != null && data3.length > 0) {
            data22 += " </td></tr><tr><td>Throughput</td><td>" + data3[7] + "</td></tr></table>";
        }

        return data22;
    }

    public String showMessage(String[] data, String[] mes1, String[] prod_act, String[] cons_act, String[] prod_comp, String[] cons_comp, String MODELID, String SCENARIOID) throws SQLException {

        String data22 = "";

        data22 += "<table class=\"tb_Property\"><thead><th colspan=2 >" + data[1] + "</th></thead><thead>"
                + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th>"
                + "</thead>" + " <tr class=\"one\" ><td  >ID</td><td>" + data[0] + "</td></tr><tr><td>TAG</td><td>" + data[1] + "</td></tr> "
                + "<tr><td>Utilization Frequency</td><td></td></tr>"
                + "<tr><td>Producer activity</td><td>" + prod_act[2] + " </td></tr> "
                + "<tr><td>Consuming activity</td><td>" + cons_act[2] + "</td></tr>"
                + "<tr><td>Producing component</td><td>" + prod_comp[6] + "</td></tr>"
                + "<tr><td>Consuming component</td><td>" + cons_comp[6] + "</td></tr></table>";







        return data22;
    }

   public  String showActXref(String[] data, String[] data3, String[] ac1, String[] node1, String[] act1, String MODELID, String SCENARIOID, HttpServletRequest request) throws SQLException {

        String data22 = "";




        data22 = "<table class=\"tb_Property\"><thead><th colspan=2 >" + data[1] + "</th></thead><thead>"
                + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th><thead>"
                + "<th colspan=2 >act_xref</th></thead><tr class=\"one\" ><td  >Name</td><td>" + data[2] + "</td></tr>"
                + "<tr class=\"one\" ><td  >ID</td><td>" + data[0] + "</td></tr>"
                + "<tr><td>Utilization Frequency</td><td>"
                + createEditableCell(MODELID, SCENARIOID, data[0], "act_xref", "OCCURRENCE", data[4], XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, request)
                + "</td></tr>"
                + "<tr><td>Physical Machine</td><td>" + ac1[2] + "</td></tr>"
                + "<tr><td>CPU factor</td><td>" + ac1[3] + "</td></tr>"
                + "<tr><td>IO factor</td><td>" + ac1[4] + "</td></tr> "
                + "<tr><td>Node</td><td>" + node1[5] + "</td></tr>"
                + "<tr><td>Parallel factor</td><td>" + ac1[7] + "</td></tr>"
                + "<tr><td>Virtual</td><td>" + ac1[9] + "</td></tr>"
                + "<tr><td>Workload Type</td><td>" + ac1[10] + "</td></tr>"
                + "<tr><td>Number of interrupts</td><td>" + ac1[11] + "</td></tr>"
                + "<tr><td>Average Interrupt Time</td><td>" + ac1[12] + "</td>"
                + "</tr> <tr><td>Distance</td><td>" + ac1[13] + "</td></tr>"
                + "<tr><td>Arrival Rate</td><td>" + " </td></tr> "
                + "<tr><td>Throughput</td><td>" + data3[7] + "</td></tr></table>";



        return data22;
    }

   public String showActivity(String[] data, String[] data3, String arr,String scenarioId) throws SQLException {

        String data22 = "";
        String type=data[7];
        if(type.equalsIgnoreCase("delay"))
            arr="0";

        data22 += "<table class=\"tb_Property\"><thead><th colspan=2 >" + data[1] + "</th></thead><thead>"
                + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                + " <tr class=\"one\" ><td  >Name</td><td>" + data[2] + "</td>"
                + "</tr><tr class=\"one\" ><td  >ID</td><td>" + data[0] + "</td>"
                + "</tr><tr><td>TAG</td><td>" + data[1] + "</td></tr>"
                + "<tr><td>Type</td><td>" + data[7] + "</td></tr>"
                + " <tr><td>Arrival Rate</td><td>" + arr + " </td></tr>";
                if(data3!=null)data22+= "<tr><td>Throughput</td><td>" + data3[7] + "</td></tr>";


        //   if (data[7].equalsIgnoreCase("application")) {


        data22 += "<tr><td colspan=\"2\" class=\"show_d_act\"> Detail</td><td></td></tr>";


        // }

        data22 += "</table>";

        data22 += "<script> propertyjs('" + showMsgPopup(data[0]) + "','" + showActivityPopup(data[0]) + "','"+scenarioId+"');</script>";


        return data22;
    }

  public  String showOtherTags(String[] data) {

        String data22 = "";

        data22 = "<table class=\"tb_Property\"><thead><th colspan=2 >" + data[1] + "</th></thead><thead>"
                + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                + "<tr class=\"one\" ><td  >Name</td><td>" + data[2] + "</td>"
                + "</tr><tr class=\"one\" ><td>ID</td><td>" + data[0] + "</td>"
                + "</tr><tr><td>TAG</td><td>" + data[1] + "</td></tr></table>";


        return data22;
    }

   public String showService(String[] data, String SCENARIOID, String MODELID, HttpServletRequest request,String ids) throws SQLException {

        String data22 = "";


        String[] mys = db.getRow(XMLDataModel.S2S_XREF_TABLENAME, "`S2S_ID`=" + data[0]);
        String[] mym = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "`ID`=" + mys[3]);
        
        if (mym[0] == null || mym[0].equals("") ) {

            data22 = "<table class=\"tb_Property\"><thead><th colspan=2 >" + data[1] + "</th></thead><thead>"
                    + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                    + "<tr class=\"one\" ><td  >Name</td><td>" + data[2] + "</td>"
                    + "</tr><tr class=\"one\" ><td>ID</td><td>" + data[0] + "</td>"
                    + "</tr><tr><td>TAG</td><td>" + data[1] + "</td></tr></table>";
        } else {


            String myr5 = Utils.getComponentName(getval(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NAME", mym[5])) ;
            String myr6 = Utils.getComponentName(getval(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NAME", mym[6])) ;

            data22 += "<table class=\"tb_Property\"><thead><th colspan=2 >Message</th></thead><thead>"
                    + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                    + "</tr><tr  ><td>ID</td><td>" + data[0] + "</td>"
                    + "</tr><tr class=\"one\" ><td>TAG</td><td>Message</td>"
                    + "<tr><td>Utilization </td><td>" + createEditableCell(MODELID, SCENARIOID, mym[0], "message", "UTILIZATION_FREQUENCY", mym[7], XMLDataModel.MESSAGE_TABLENAME, request) + "</td></tr>"
                    + "<tr class=\"one\"><td>Producing Activity </td><td>" + getval(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "NAME", mym[3]) + "</td></tr>"
                    + "<tr ><td>Consuming Activity</td><td>" + getval(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "NAME", mym[4]) + "</td></tr>"
                    + "<tr class=\"one\" ><td>Producing Component</td><td>" + myr5 + "</td></tr>"
                    + "<tr><td>Consuming Component</td><td>" + myr6 + "</td></tr>"
                    + "<tr><td colspan=\"2\" data-ids=\""+ids+"\"  data-id=\""+data[0]+"\" class=\"show_d_msg\">Detail</td><td></td></tr>"
                    + ""
                    + "<tr><td></td><td></td></tr>"
                    + "</table>";




            //  data22 += show_msg_popup(data[0]);

        }
        data22 += "<script> propertyjs('" + showMsgPopup(data[0]) + "','" + showActivityPopup(data[0]) + "');</script>";

        return data22;
    }

    String showMsgPopup(String id) throws SQLException {

        db.openCon();
        String data22 = "<div class=\"msg_all\"><div class=\"data\"><div class=\"metitle\">Message</div> ";
        data22 += "<div class=\"formrow\"><label>Message Name:</lable><div class=\"forminput\"><select class=\"mythid\">";
        ResultSet myyrs = db.getData(XMLDataModel.S2S_XREF_TABLENAME, "*", "S2S_ID=" + id);
        while (myyrs.next()) {

            String[] ms = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "id=" + myyrs.getString("OBJECT_ID"));



            data22 += "<option value=\"" + ms[0] + "\">" + ms[2] + "</option>";

        }
        data22 += "</select></div></div>";


        data22 += "<div class=\"getMessageD\"></div></div>";





        data22 += "  </div> ";

        db.closeCon();

        return data22;

    }

    String showActivityPopup(String id) throws SQLException {



        db.openCon();
        String data22 = "<div class=\"msg_all av\"><div class=\"data\">"
                + "<div><div class=\"me_title\">Service Activity</div>";
        data22 += "<div class=\"formrow\"><label>Application Component Name:</lable><div class=\"forminput\"><select class=\"mythida\">";



        ResultSet myyrs = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "service_activity_id=" + id);
        while (myyrs.next()) {

            String[] ms = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "id=" + myyrs.getString("ac_inst_id"));

            data22 += "<option value=\"" + ms[0] + "\">" + ms[6]+ "</option>";

        }
        data22 += "</select></div></div>";


        data22 += "<div class=\"getActivityD\"></div></div>";





        data22 += "  </div> </div> ";

        db.closeCon();

        return data22;
    }

  public  String showCollector(String[] data) {

        String data22 = "";

        data22 = "<table class=\"tb_Property\"><thead><th colspan=2 >" + data[1] + "</th></thead><thead>"
                + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                + "<tr class=\"one\" ><td  >Name</td><td>" + data[2] + "</td></tr><tr class=\"one\" ><td  >ID</td><td>" + data[0] + "</td></tr>"
                + " <tr><td>TAG</td><td>" + data[1] + "</td></tr><tr><td>Insertion Point </td><td>" + data[1] + "</td></tr>"
                + "<tr><td>Number</td><td>" + data[9] + " </td></tr></table>";

        return data22;
    }

  public  String showInsertion(String[] data) {

        String data22 = "";



        data22 = "<table class=\"tb_Property\"><thead><th colspan=2 >" + data[1] + "</th></thead><thead>"
                + "<th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                + "<tr class=\"one\" ><td  >Name</td><td>" + data[2] + "</td></tr><tr class=\"one\" ><td  >ID</td><td>" + data[0] + "</td></tr>"
                + "<tr><td>TAG</td><td>" + data[1] + "</td></tr>"
                + " <tr><td>Collector </td><td>" + data[1] + "</td></tr>"
                + "<tr><td>Number</td><td>" + data[9] + " </td></tr></table>";

        return data22;
    }

   public String showComponent(String[] data, double workload, String[] data2, String[] data3, String myarr,  String MODELID, String SCENARIOID, HttpServletRequest request) throws SQLException {

        String data22 = "";


        data22 = "<table class=\"tb_Property\"><thead><th colspan=2 >" + data[1] + "</th></thead><thead>"
                + "<thead><th class=\"th_Property\">Property</th><th class=\"th_Value\">Value</th></thead>"
                + "<tr class=\"one\" ><td  >Name</td><td>" + data[2] + "</td></tr>"
                + "<tr class=\"one\" ><td  >ID</td><td>" + data[0] + "</td></tr>"
                + "<tr><td>TAG</td><td>" + data[1] + "</td></tr>";


        if (data[8].equals("0")) {
            data22 += "<tr><td>Job Type</td><td>transactional </td></tr>"
                    + "<tr><td>Occurrence During Window</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "component", "OCCURRENCE", data[10], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>"
                    + "<tr><td>Expected Window</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "component", "DURATION_1", data[9], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>";

        } else {
            data22 += "<tr><td>Job Type</td><td>Batch </td></tr>"
                    + " <tr><td>Occurrence During Window</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "component", "OCCURRENCE", data[10], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>"
                    + "<tr><td>Job Start Offset</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "component", "T_O_D", data[12], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>"
                    + "<tr><td>Expected Window</td><td>"
                    + createEditableCell(MODELID, SCENARIOID, data[0], "component", "DURATION_1", data[9], XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, request)
                    + " </td></tr>";
                    if(data2!=null)data22+= "<tr><td>Computed Duration</td><td>" + data2[8] + " </td></tr>";
                    data22+="<tr><td>Computed End Time</td><td>" + data[12] + " </td></tr>"
                    + "<tr><td>outstanding workload</td><td>" + "" + (workload - 100) + " </td></tr>";
        }

        data22 += " <tr><td>Arrival Rate</td><td>" + myarr + "</td></tr>";
        if(data3!=null)data22+="<tr><td>Throughput</td><td>" + data3[7] + "</td></tr></table>";

        return data22;
    }

    
    
public String createEditableCell(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String Type, String S_PARAMETER, String OLD_VALUE, String typep, HttpServletRequest rq) throws SQLException {
        String retunData = "";
        S_PARAMETER=S_PARAMETER.toUpperCase();
        retunData = Utils.getScenarioPram(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, Type);
        if(S_PARAMETER.equalsIgnoreCase("UTILIZATION_FREQUENCY")){
            double val=Double.parseDouble(retunData)*100;
            retunData=""+val;
        }
        xact.users.users u = new xact.users.users();


        Boolean makeScenario = u.userper(rq, "makeScenario");

        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null && makeScenario == true) {

            String thid = OBJECT_ID + "_" + S_PARAMETER;
            String OBJECT_CLASS =Utils.getClassName(Type) ;


            retunData += "<div id=\"" + thid + "\" class=\"SeditBT\"></div>";
            retunData += "<script>$(\"#" + thid + "\").click(function(){";
            retunData += "makeWinDows(\"scenarios properties\",\"_scenarios_properties\" ,scenario_par(\"" + MODEL_ID + "\",\"" + SCENARIO_ID + "\",\"" + OBJECT_ID + "\",\"" + OBJECT_CLASS + "\",\"" + S_PARAMETER + "\",\"" + OLD_VALUE + "\",\"" + typep + "\"), 150, 150,300,null);";

            retunData += "});</script>";


        }



        return retunData;



    }

   public String creatSCENARIOwithoutreturn(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String Type, String S_PARAMETER, String OLD_VALUE, String typep, HttpServletRequest rq) throws SQLException {
        String retunData = "";
        retunData += "";

        xact.users.users u = new xact.users.users();


        Boolean makeScenario = u.userper(rq, "makeScenario");

        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null && makeScenario == true) {

            String thid = OBJECT_ID + "_" + S_PARAMETER;
            String OBJECT_CLASS =Utils.getClassName(Type);


            retunData += "<div id=\"" + thid + "\" class=\"SeditBT\"></div>";
            retunData += "<script>$(\"#" + thid + "\").click(function(){";
            retunData += "makeWinDows(\"scenarios properties\",\"_scenarios_properties\" ,scenario_par(\"" + MODEL_ID + "\",\"" + SCENARIO_ID + "\",\"" + OBJECT_ID + "\",\"" + OBJECT_CLASS + "\",\"" + S_PARAMETER + "\",\"" + OLD_VALUE + "\",\"" + typep + "\"), 150, 150,300,null);";

            retunData += "});</script>";


        }



        return retunData;



    }
    
    
   public String getval(String table, String filde, String id) {


        String arr = db.getValue(table, filde, "id=" + id);


        return arr;


    }
    
    

}
