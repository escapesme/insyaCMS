/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact.results;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.jstl.sql.Result;
import lib.Options.DbInfo;
import lib.Options.XMLDataModel;
import lib.engine.db.operations;
import lib.tools.Utils;
import xact.utils;

/**
 *
 * @author A7med
 *
 *
 */
/**
 * The class where the data for the financial view is created
 *
 */
public class FinancialView {

    utils u = new utils();
    lib.engine.db.operations db = new operations();
    ArrayList<Double> cpuCons = new ArrayList<Double>();
    ArrayList<Double> acRates = new ArrayList<Double>();
    ArrayList<Double> throughputs = new ArrayList<Double>();
    ArrayList<Double> elongation = new ArrayList<Double>();
    ArrayList<Double> arrivals = new ArrayList<Double>();
    ArrayList<Double> responseTimes = new ArrayList<Double>();
    ArrayList<Double> computedDuration = new ArrayList<Double>();
    public String test = "";
    public String test2 = "";
    double maxRate = 0;
    double maxThroughput = 0;
    double maxeffeciency = 0;

    /**
     *
     *
     * @param modelId
     * @return string contains the html data for the drop down of the scenarios
     * in the passed model with results
     * @throws SQLException
     */
    private String getSresules(String modelId, String selectedModel) throws SQLException {

        String returnData = "";

        ResultSet res = db.getData(XMLDataModel.SCENARIO_TABLENAME, "", "MODEL_ID='" + modelId + "'");
        while (res.next()) {
            String selected = "";
            String modid = res.getString("ID");

            java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
            String[] data = db.getRowNewCon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "ID='" + modid + "' and STATUS='3'", con);
            db.closeConNewcon(con);

            if (data[0] != null && !data[0].equalsIgnoreCase("null")) {
                if (res.getString("ID").equalsIgnoreCase(selectedModel)) {
                    selected = "selected='selected'";

                }
                returnData += "<option value='" + res.getString("ID") + "'" + selected + ">" + res.getString("NAME") + "</option>";

            }
        }

        return returnData;

    }

    /**
     *
     *
     * @param ProjectId
     * @return string contains the html data for the drop down of the models
     * with results
     * @throws SQLException
     */
    public String modelList(String ProjectId, String selectedModel) throws SQLException {
        String returnData = "";

        db.openCon();
        ResultSet res = db.getData(XMLDataModel.PMXREF_TABLENAME, "", "pid=" + ProjectId);

        while (res.next()) {
            String modid = res.getString("mid");
            String selected = "";
            java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
            String[] data = db.getRowNewCon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "ID='" + modid + "' and STATUS='3'", con);
            db.closeConNewcon(con);

            if (data[0] != null && !data[0].equalsIgnoreCase("null")) {
                int points = Integer.parseInt(data[5]);
                if (points > 2) {
                    String[] sdata = db.getRowNocon(XMLDataModel.MODEL_TABLENAME, "ID='" + modid + "'");
                    if (modid.equalsIgnoreCase(selectedModel)) {
                        selected = "selected='selected'";

                    }

                    returnData += "<option value='" + modid + "'" + selected + " >" + sdata[4] + "</option>";



                }
            }
            returnData += getSresules(modid, selectedModel);

        }
        db.closeCon();
        return returnData;


    }

    /**
     *
     * Gets the list of the business trajectory in the selected model.<br> if
     * the selected model is a scenario, it gets the objects from its parent
     * reference model.
     *
     * @param modelId
     * @return a list of the contained trajectories in the model
     * @throws SQLException
     */
    public String BPList(String modelId, String sid) throws SQLException {
        String returnData = "";
        db.openCon();

        ResultSet res = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "", "MODEL_ID=" + modelId);
        while (res.next()) {
            if (u.getISScenarioPram(modelId, sid, res.getString("ID"), "ACTIVE_STATUS").equals("-1")) {
                returnData += "<option value='" + res.getString("ID") + "'>" + res.getString("NAME") + "</option>";
            }
        }
        db.closeCon();
        return returnData;
    }

    /**
     *
     * calculates the productivity values for a certain business trajectory for
     * all plan points. The output of this method will be used in the
     * calculations of the cost
     *
     * @param bbId the business process id
     * @param modelId the model id
     * @param scenarioId the scenario id, or 0 if it's not a scenario
     * @param planPoints number of plan points
     * @param elongations the list of elongation values calculated to be used in
     * the batch type calculations
     * @return the values of the productivity as an array.
     * @throws SQLException
     */
    public String getProductivity(String bbId, String modelId, String scenarioId, int planPoints, String elongations) throws SQLException {
        String result = "";
        String[] bpRow = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + bbId + " AND MODEL_ID=" + modelId);
        String selector = bpRow[5];
        double productivity = 0;
        double sla = getduration(modelId, scenarioId);
        //test += "duration=" + sla;
        String[] elongationValues = elongations.split("__");


        db.openConres();

        if (selector.equalsIgnoreCase("0")) {
            for (int i = 0; i <= planPoints; i++) {

                productivity = (throughputs.get(i) / maxThroughput) * 100;
                // test+=productivity+"<br>";
                if (productivity > maxeffeciency) {
                    maxeffeciency = productivity;
                }
                if (i != 0) {
                    result += "__";
                }
                result += Utils.numberFormat(productivity, 2);
            }
        } else {


            for (int i = 0; i <= planPoints; i++) {
                productivity = arrivals.get(i) / sla;
                productivity = productivity * getNormalization(productivity);
                if (productivity < 10) {
                    productivity = productivity * 10;
                }
                double complexity = Double.parseDouble(elongationValues[i]);
                if (complexity > 0) {
                    productivity = productivity / complexity;
                }
                if (productivity > maxeffeciency) {
                    maxeffeciency = productivity;
                }
                if (i != 0) {
                    result += "__";
                }
                result += Utils.numberFormat(productivity, 2);
            }

        }
        db.closeCon();
        return result;

    }

    /**
     * calculates the elongation values for a certain business trajectory for
     * all plan points. The output of this method will be used in the
     * calculations of the productivity values
     *
     * @param bbId the business process id
     * @param modelId the model id
     * @param scenarioId the scenario id, or 0 if it's not a scenario
     * @param planPoints number of plan points
     * @return the values of the elongation as an array.
     * @throws SQLException
     */
    public String getElongation(String bbId, String modelId, String scenarioId, int planPoints) throws SQLException {
        String result = "";
        String[] bpRow = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + bbId + " AND MODEL_ID=" + modelId);
        String selector = bpRow[5];


        double sla = getduration(modelId, scenarioId);
        db.openConres();
        double rdata2 = 0;
        double currentDuration = 0;

        if (selector.equalsIgnoreCase("0")) {
            for (int i = 0; i <= planPoints; i++) {
                if (i != 0) {
                    result += "__";
                }
                result += Utils.numberFormat(elongation.get(i), 2);
            }
        } else {


            for (int i = 0; i <= planPoints; i++) {


                currentDuration = computedDuration.get(i);
                test2 += currentDuration + ";" + sla + ";";
                if (currentDuration < sla) {
                    rdata2 = 0;
                } else {
                    rdata2 = 100 - (sla / currentDuration);
                    if (rdata2 < 1) {
                        rdata2 = 1;
                    }
                }
                if (i != 0) {
                    result += "__";
                }
                test2 += rdata2 + "__";
                result += Utils.numberFormat(rdata2, 2);

            }


        }
        db.closeCon();
        return result;

    }

    /**
     * calculates the cost values for a certain business trajectory for all plan
     * points based on the provided productivity values.
     *
     * @param bbId
     * @param modelId
     * @param scenarioId
     * @param planPoints
     * @param pe
     * @return
     */
    public String getCost(String bbId, String modelId, String scenarioId, int planPoints, String pe) {
        int processorsNo = 0;
        String result = "";
        String pes[] = pe.split("__");

        String[] bpRow = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + bbId + " AND MODEL_ID=" + modelId);
        String selector = bpRow[5];

        double cost = 0;
        if (selector.equalsIgnoreCase("1")) {
            db.openConres();
            for (int i = 0; i <= planPoints; i++) {
                cost = maxRate - acRates.get(i);
                double prod = Double.parseDouble(pes[i]);
                cost = cost / prod;
                if (cost > maxeffeciency) {
                    maxeffeciency = cost;
                }
                if (i != 0) {
                    result += "__";
                }

                result += Utils.numberFormat(cost, 2);
            }
        } else {

            for (int i = 0; i <= planPoints; i++) {


                processorsNo = (int) (acRates.get(i) + 100) / 100;
                cost = (processorsNo * 100 - acRates.get(i)) / processorsNo;
                if (cost > maxeffeciency) {
                    maxeffeciency = cost;
                }
                if (i != 0) {
                    result += "__";
                }

                result += Utils.numberFormat(cost, 2);
                db.closeCon();
            }
        }
        return result;
    }

    /**
     * Calculates the window duration of a corporate in seconds
     *
     * @param modelId
     * @return the value of window duration of corporate
     */
    private double getduration(String modelId, String scenarioId) {
        double duration = 0;

        String[] corporate = db.getRow(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + modelId);
        duration = Double.parseDouble(corporate[5]);
        if (!scenarioId.equals("0")) {
            duration = Double.parseDouble(Utils.getScenarioPram(modelId, scenarioId, corporate[0], "WINDOW_DURATION", "" + duration, "corporate"));

        }

        duration = duration * SECONDS_REFERENCE[Integer.parseInt(corporate[6]) - 1];
        return duration;
    }
    public static final int SECONDS_REFERENCE[] = new int[]{60 * 60 * 24, 60 * 60, 60, 1};

    /**
     * Gets the number of the plan points in a computed model or scenario
     *
     * @param modid
     * @return
     */
    public int getpp(String modid) {

        int returnData = 0;


        java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
        String[] data = db.getRowNewCon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "ID='" + modid + "' and STATUS='3'", con);
        db.closeConNewcon(con);


        returnData = Integer.parseInt(data[5]);

        return returnData;
    }

    public int getACWithMaxRate(String modid, String scenarioId, ArrayList acList) {
        double cpu = 0;


        String serverName = "";
        String acName = "";
        String where = "";
        String modName = Utils.getModName(modid, scenarioId);
        String resultId = Utils.getResultID(modid, scenarioId);
        double current = 0;
        int index = 0;

        for (int i = 0; i < acList.size(); i++) {
            serverName = getservernameFromAci((String) acList.get(i));
            acName = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + (String) acList.get(i))[6];
//            serverName = getservernameById((String) acList.get(i));
//            acName = getACnameById((String) acList.get(i));
            db.openDBCon(DbInfo.connectionStringRes);
            where = "VAL0='APPLICATION_COMPONENT' AND VAL1='" + serverName + "' AND VAL4='" + acName + "' AND RESULT_ID=" + resultId + " AND MOD_NAME='" + modName + "_0'";
            // test += where + "<br>";

            String[] row = db.getRowNocon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "VAL0='APPLICATION_COMPONENT' AND VAL1='" + serverName + "' AND VAL4='" + acName + "' AND RESULT_ID=" + resultId + " AND MOD_NAME='" + modName + "_0'");
            if (row[10] != null) {
                current = Double.parseDouble(row[10]);
            }
            if (current > cpu) {
                cpu = current;
                index = i;
            }
            // test+="ac name="+acName+" and ac id="+(String) acList.get(i)+"And cpu rate="+current+"<br>";

            db.closeCon();

        }

        return index;
    }

    private String getbbname(String get) {
        db.openCon();

        String name = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + get)[3];
        return name;
    }

//    private ArrayList getnodeList(String bbId) {
//        ArrayList<String> acs = new ArrayList<String>();
//        try {
//
//            db.openCon();
//            ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + bbId);
//            while (rs.next()) {
//
//                if (!rs.getString("TAG").equalsIgnoreCase("start") && !rs.getString("TAG").equalsIgnoreCase("end")) {
//                    if (rs.getString("TAG").equalsIgnoreCase("activity")) {
//                        //  test += rs.getString("TAG") + "<br>";
//                        acs.addAll(getacfromactivity(rs.getString("ID")));
//
//                    } else {
//                        try {
//                            acs.addAll(getnodeList(rs.getString("ID")));
//                        } catch (Exception exception) {
//                        }
//                    }
//                }
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(FinancialView.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return acs;
//    }

    public ArrayList getACList(String bbId, String mod_id, String sid) {
        ArrayList<String> acs = new ArrayList<String>();
        try {

            db.openCon();
            ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + bbId);
            while (rs.next()) {

                if (!rs.getString("TAG").equalsIgnoreCase("start") && !rs.getString("TAG").equalsIgnoreCase("end")) {
                    if (rs.getString("TAG").equalsIgnoreCase("activity")) {
                        if (!sid.equals("0")) {

                            if (u.getISScenarioPram(mod_id, sid, rs.getString("ID"), "ACTIVE_STATUS").equals("-1")) {
                                acs.addAll(getACFromaAtivity(rs.getString("ID")));
                            }
                        } else {

                            acs.addAll(getACFromaAtivity(rs.getString("ID")));

                        }


                    } else {
                        try {
                            acs.addAll(getACList(rs.getString("ID"), mod_id, sid));
                        } catch (Exception exception) {
                        }
                    }
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(FinancialView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acs;
    }

//    private Collection<String> getacfromactivity(String string) throws SQLException {
//        ArrayList<String> acs = new ArrayList<String>();
//        ResultSet acid = db.getData(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "ACTIVITY_ID=" + string);
//        while (acid.next()) {
//            String[] act = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID=" + acid.getString("AC_ID"));
//
//            acs.add(act[5]);
//        }
//        db.closeCon();
//        return acs;
//    }

    private Collection<String> getACFromaAtivity(String string) throws SQLException {

        ArrayList<String> acs = new ArrayList<String>();

        ResultSet acid = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "SERVICE_ACTIVITY_ID=" + string);
        while (acid.next()) {
            System.out.println("activity id=" + string);
            String[] act = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + acid.getString("AC_INST_ID"));
            acs.add(act[0]);


        }

        
        return acs;
    }

    private String getservernameFromAci(String aciID) {
      /*  String serverId = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + aciID)[4];
        String id = db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId)[1];
        String name = db.getRow(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + id)[2];
        name = name.replace("Complex", "");
        name = name.replace("Part", "");
        name = name.substring(0, name.length() - 2);
        return name;
        */
        
         String serverId = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + aciID)[4];
        String id = db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId)[2];
        String ServerID = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID=" + id)[1];
        String nodeId = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + ServerID)[1];
        String serverName=db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + nodeId)[2];
        return serverName;
        
    }

    private String getservername(String id) {
        String fullname = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NODE_ID='" + id + "'")[6];

        return fullname.split("/")[1].replace("^", "");
    }

//    private String getservernameById(String id) {
//        String fullname = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + id + "'")[6];
//
//        return fullname.split("/")[1].replace("^", "");
//    }
//  private String getservernameByIdNoCon(String id) {
//        String fullname = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + id + "'")[6];
//
//        return fullname.split("/")[1].replace("^", "");
//    }
//    private String getACnameById(String id) {
//        String fullname = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + id + "'")[6];
//
//        return fullname.split("/")[0].replace("^", "");
//    }
// private String getACnameByIdNoCon(String id) {
//        String fullname = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + id + "'")[6];
//
//        return fullname.split("/")[0].replace("^", "");
//    }
    private double getNormalization(double pe) {
        double norm = 1;
        if (pe > 100 || pe < 10) {
            int i = (int) ((int) Math.log10(pe) / Math.log10(10));
            norm = 1 / Math.pow(10, i - 1);
        }
        return norm;
    }

    private String toNextHundered(double pe) {
        if (pe < 100) {
            return "100";
        } else {
            String data = "" + pe;
            //test += data;
            data = data.substring(0, data.lastIndexOf("."));
            int henderds = 0;
            if (data.length() >= 3) {
                henderds = Integer.parseInt("" + data.charAt(data.length() - 3));
            }


            ++henderds;


            String out = henderds + "00";
            if (data.length() >= 3) {
                out = data.substring(0, data.length() - 3) + out;
            }
            return "" + out;
        }


    }

    public void getMaxRate(String id, String resultId, String modName, int planPoints) {

        String serverName = "";
        String acName = "";
        String where = "";
        double current = 0;
        serverName = getservernameFromAci(id);
        acName = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + id)[6];
        double maxTh = 0;
        db.openConres();
        for (int i = 0; i <= planPoints; i++) {
            where = "VAL0='APPLICATION_COMPONENT' AND VAL1='" + serverName + "' AND VAL4='" + acName + "' AND RESULT_ID=" + resultId + " AND MOD_NAME='" + modName.trim() + "_" + i + "'";
            // test += where + "<br>";
            String[] row = db.getRowNocon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, where);
            current = Double.parseDouble(row[10]);
            // maxTh=1/Double.parseDouble(row[11]);
            if (Double.parseDouble(row[14]) > maxThroughput) {
                maxThroughput = Double.parseDouble(row[14]);
            }
            acRates.add(current);
            throughputs.add(Double.parseDouble(row[14]));

            if (Double.parseDouble(row[12]) > 200) {
                elongation.add(200d);
            } else {
                elongation.add(Double.parseDouble(row[12]));
            }


            arrivals.add(Double.parseDouble(row[16]));
            responseTimes.add(Double.parseDouble(row[11]));
            computedDuration.add(Double.parseDouble(row[11]) * Double.parseDouble(row[16]));
            if (current > maxRate) {
                maxRate = current;
            }
        }
        maxRate = Double.parseDouble(toNextHundered(maxRate));
        db.closeCon();

    }

    public String adjustComplexity(String complexity) {
        String complex = "";
        double value = 0;
        String out = "";
        String pes[] = complexity.split("__");
        for (int i = 0; i < pes.length; i++) {
            value = Double.parseDouble(pes[i]);
            if (value > maxeffeciency) {
                value = maxeffeciency;
                out = toNextHundered(value);
            } else {
                out = Utils.numberFormat(value, 2);
            }
            if (i != 0) {
                complex += "__";
            }
            complex += out;
        }
        return complex;
    }
    
    
}

