/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.results;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;
import lib.tools.Utils;
import xact.utils;

/**
 *
 * @author Ahmed
 */
public class TimeBoxChronograph {

    String modelId = "";
    String scenarioId = "";

    /**
     *
     */
    public String resultId = "";
    String modName = "";
    int point = 0;

    /**
     *
     */
    public ArrayList<String> seriesIds;

    /**
     *
     */
    public ArrayList<String> seriesnames;

    /**
     *
     */
    public ArrayList<String> durations;

    /**
     *
     */
    public ArrayList<String> durationsValues;

    /**
     *
     */
    public ArrayList<String> trajectories;

    /**
     *
     */
    public ArrayList<String> trajectoriesNames;

    /**
     *
     */
    public ArrayList<String> trajectoriesValues;

    /**
     *
     */
    public String test = "";

    /**
     *
     */
    public String bpData = "";
    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     * The constructor of the class. The constructor is responsible for setting
     * the values of the model id, scenario id and plan point as well using the
     * {@link Utils} class methods {@link Utils#getResultID} and 
     * {@link Utils#getModName} to get the result id
     * and model name to be used in getting results. In addition the constructor
     * calls the method {@link #fillTrajectories() }
     * to get a list of all batch trajectories in the model.
     *
     * @param modelId
     * @param scenarioId
     * @param point
     */
    public TimeBoxChronograph(String modelId, String scenarioId, int point) {
        this.modelId = modelId;
        this.scenarioId = scenarioId;
        this.point = point;
        resultId = Utils.getResultID(modelId, scenarioId);
        modName = Utils.getModName(modelId, scenarioId) + "_" + point;
        seriesIds = new ArrayList<String>();
        seriesnames = new ArrayList<String>();
        durations = new ArrayList<String>();

        durationsValues = new ArrayList<String>();
        trajectoriesValues = new ArrayList<String>();
        trajectories = new ArrayList<String>();
        trajectoriesNames = new ArrayList<String>();
        fillTrajectories();

    }

    /**
     * Gets the time scenario series that the passed scenario belongs to. it
     * also fills the scenario names list with the names of the scenarios in the
     * series.
     *
     * @return a list of scenario ids in the selected time box series.
     */
    public ArrayList<String> getScenarioSeries() {
        ArrayList<String> series = new ArrayList<String>();
        if (!modelId.equals(Utils.getScenarioParent(scenarioId))) {
            getParents(modelId, Utils.getScenarioParent(scenarioId));
        }
        seriesIds.add(scenarioId);
        seriesnames.add(Utils.getScenarioName(scenarioId));
        getChildren(modelId, scenarioId);

        return series;
    }

    /**
     * Checks if all scenarios in the time box series are computed or not, so
     * the results will not fail on one of them.
     *
     * @return true if all are computed and false otherwise.
     */
    public boolean isAllComputed() {

        for (int i = 0; i < seriesIds.size(); i++) {
            db.openConres();
            String[] data = db.getRowNocon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "ID='" + seriesIds.get(i) + "' and STATUS='3'");
            db.closeCon();

            if (data[0] == null || data[0].equalsIgnoreCase("null")) {
                return false;

            }
        }
        return true;
    }

    /**
     * Finds the parents of a scenario to fill out the series.
     *
     * @param modelId
     * @param scenarioId
     */
    private void getParents(String modelId, String scenarioId) {
        db.openCon();
        ResultSet scenarios = db.getData(XMLDataModel.SCENARIO_TABLENAME, "*", "ID=" + scenarioId);
        try {
            while (scenarios.next()) {
                getParents(modelId, scenarios.getString("PARENT_ID"));
                seriesIds.add(scenarios.getString("ID"));
                seriesnames.add(scenarios.getString("NAME"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeBoxChronograph.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }
/**
 * Finds scenario children to get out the scenarios in the series. Used in tandem with {@link #getParents(java.lang.String, java.lang.String) }
 * to get the scenario parents and children.
 * @param modelId
 * @param scenarioId 
 */
    private void getChildren(String modelId, String scenarioId) {
        db.openCon();
        ResultSet scenarios = db.getData(XMLDataModel.SCENARIO_TABLENAME, "*", "PARENT_ID=" + scenarioId);
        try {
            while (scenarios.next()) {
                seriesIds.add(scenarios.getString("ID"));
                seriesnames.add(scenarios.getString("NAME"));
                getChildren(modelId, scenarios.getString("ID"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeBoxChronograph.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    /**
     *Fills out the list containing the duration values for each scenario in the series.
     */
    public void fillDurations() {

        double duration = 0;
        for (int i = 0; i < seriesIds.size(); i++) {
            String[] corporate = db.getRow(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + modelId);
            duration = Double.parseDouble(corporate[5]);
            String type = corporate[6];
            if (!scenarioId.equals("0")) {
                duration = Double.parseDouble(Utils.getScenarioPram(modelId, seriesIds.get(i), corporate[0], "WINDOW_DURATION", "" + duration, "corporate"));
                type = Utils.getScenarioPram(modelId, seriesIds.get(i), corporate[0], "WINDOW_DURATION_TYPE", type, "corporate");
            }
            int intType = Integer.parseInt(type);
            if (intType > 3) {
                intType = 3;
            }
            duration = duration * SECONDS_REFERENCE[Integer.parseInt(type)];
            durations.add(Utils.convertToDHMS(duration));
            durationsValues.add("" + duration);
        }
    }

    /**
     *Calculates the chronograph results for each active business trajectory in each scenario. The value that we are looking for
     * is <i>DURATION</i> from the table <i>SP_REULTS</i>. The other values returned are used to render the chart, those values are
     * in order of adding:
     * <ol>
     * <li>Trajectory name</li>
     * <li>Total duration of the trajectory in all scenarios</li>
     * <li>Color of the value bar</li>
     * <li>Raw value of duration in current scenario</li>
     * <li>Number of current scenario</li>
     * <li>DHMS value of duration in current scenario</li>
     * </ol>
     */
    public void fillResults() {

        utils u = new utils();
        double total = 0;
        String name = "";
        double highestInPeriod = 0;
        bpData += "[";
        double alltotal = 0;
        for (int jv = 0; jv < seriesIds.size(); jv++) {
            highestInPeriod = 0;
            for (int k = 0; k < trajectories.size(); k++) {
                if (u.getISScenarioPram(modelId, seriesIds.get(jv), trajectories.get(k), "ACTIVE_STATUS").equals("-1")) {
                    db.openDBCon(lib.Options.DbInfo.connectionStringRes);
                    String[] spResults = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + trajectories.get(k) + " and Name='" + Utils.getScenarioName(seriesIds.get(jv)) + "_" + point + "' And MODEL_ID=" + seriesIds.get(jv));
                    double curent = 0;
                    db.closeCon();
                    if (spResults[12] != null) {
                        curent += Double.parseDouble(spResults[12]);
                    }
                    if (curent > highestInPeriod) {
                        highestInPeriod = curent;
                    }
                }
            }

            alltotal += highestInPeriod;
            test += "<br>hieghst=" + highestInPeriod;
        }
        for (int i = 0; i < trajectories.size(); i++) {
            total = 0;

            name = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + trajectories.get(i))[3];
            bpData += "[";
            String dudata = "";
            for (int jv = 0; jv < seriesIds.size(); jv++) {

                if (u.getISScenarioPram(modelId, seriesIds.get(jv), trajectories.get(i), "ACTIVE_STATUS").equals("-1")) {
                    db.openDBCon(lib.Options.DbInfo.connectionStringRes);
                    String[] spResults = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + trajectories.get(i) + " and Name='" + Utils.getScenarioName(seriesIds.get(jv)) + "_" + point + "' And MODEL_ID=" + seriesIds.get(jv));

                    db.closeCon();
                    if (spResults[12] != null) {
                        total += Double.parseDouble(spResults[12]);
                    }

                }

            }
            for (int j = 0; j < seriesIds.size(); j++) {

                if (u.getISScenarioPram(modelId, seriesIds.get(j), trajectories.get(i), "ACTIVE_STATUS").equals("-1")) {
                    double response = 0;
                    dudata += "[";
                    db.openDBCon(lib.Options.DbInfo.connectionStringRes);
                    String[] spResults = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + trajectories.get(i) + " and Name='" + Utils.getScenarioName(seriesIds.get(j)) + "_" + point + "' And MODEL_ID=" + seriesIds.get(j));
                    if (spResults[12] != null) {
                        response = Double.parseDouble(spResults[12]);
                    }

                    dudata += "'" + name + " (" + Utils.convertToDHMS(total) + ")', 'green', '" + response + "', '" + (j + 1) + "','" + Utils.convertToDHMS(response) + "'";
                    db.closeCon();
                    dudata += "],";
                }
            }

            if (dudata == "") {

                bpData += "[";
                bpData += "'" + name + " (" + Utils.convertToDHMS(total) + ")', 'green', '0', '0'";
                bpData += "],";

            } else {
                bpData += dudata;

            }

            bpData += "],";

        }

        bpData += "[[";
        bpData += "'End to End (" + Utils.convertToDHMS(alltotal) + ")', 'green', '" + alltotal + "', '1','" + Utils.convertToDHMS(alltotal) + "'";
        bpData += "]]";

        bpData = bpData.replace("[],", "");
        bpData += "]";
    }

    /**
     *Calculates the chronograph throughput results for each active business trajectory in each scenario. The value that we are looking for
     * is <i>Throughput</i> and <i>Max_Throughput</i> from the table <i>NEW_BP_THROUGHPUT_RESULTS</i>. The other values returned are used to render the chart, those values are
     * in order of adding:
     * <ol>
     * <li>Trajectory name</li>
     * <li>Max throughput of the trajectory in all scenarios</li>
     * <li>Color of the value bar</li>
     * <li>Raw value of throughput in current scenario</li>
     * <li>Number of current scenario</li>
     * <li>DHMS value of throughput in current scenario</li>
     * <li>DHMS value of work done in current scenario, which is equal to duration * throughput</li>
     * </ol>
     */
    public void fillThroughputResults() throws SQLException {

        utils u = new utils();
        double total = 0;
        String name = "";
        bpData += "[";
        String color = "";
        double maxThroughput = 0;
        for (int i = 0; i < trajectories.size(); i++) {
            total = 0;
            maxThroughput = 0;
            name = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + trajectories.get(i))[3];
            bpData += "[";
            String dudata = "";
            for (int jv = 0; jv < seriesIds.size(); jv++) {

                if (u.getISScenarioPram(modelId, seriesIds.get(jv), trajectories.get(i), "ACTIVE_STATUS").equals("-1")) {
                    db.openDBCon(lib.Options.DbInfo.connectionStringRes);
                    String[] spResults = db.getRowNocon(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, "TPR_KEY = '" + trajectories.get(i) + "_BoBusinessProcess' and MOD_NAME like'%" + Utils.getModName(modelId).trim() + "_" + point + "%' And RESULT_ID=" + seriesIds.get(jv));

                    test += "<br>" + "TPR_KEY = '" + trajectories.get(i) + "_BoBusinessProcess' and MOD_NAME like'%" + Utils.getModName(modelId).trim() + "_" + point + "%' And RESULT_ID=" + seriesIds.get(jv);
                    db.closeCon();
                    if (spResults[7] != null) {
                        total = Double.parseDouble(spResults[7]) / Double.parseDouble(spResults[10]);
                    }

                    if (total > maxThroughput) {
                        maxThroughput = total;
                    }

                }
            }
            for (int j = 0; j < seriesIds.size(); j++) {
                color = "green";
                if (u.getISScenarioPram(modelId, seriesIds.get(j), trajectories.get(i), "ACTIVE_STATUS").equals("-1")) {
                    dudata += "[";
                    db.openDBCon(lib.Options.DbInfo.connectionStringRes);
                    String[] spResults = db.getRowNocon(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, "TPR_KEY = '" + trajectories.get(i) + "_BoBusinessProcess' and MOD_NAME like'%" + Utils.getModName(modelId).trim() + "_" + point + "%' And RESULT_ID=" + seriesIds.get(j));
                    String[] spResults2 = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + trajectories.get(i) + " and Name='" + Utils.getScenarioName(seriesIds.get(j)) + "_" + point + "' And MODEL_ID=" + seriesIds.get(j));
                    double throughput = 0;

                    if (spResults[7] != null) {
                        throughput = (Double.parseDouble(spResults[7]) / Double.parseDouble(spResults[10]));
                    }
                    if (throughput >= 1) {
                        color = "red";
                    } else if (throughput > 8 && throughput < 1) {
                        color = "yellow";
                    }
                    double work = Double.parseDouble(spResults2[12]) * throughput;
                    test += "<br>" + "TPR_KEY = '" + trajectories.get(i) + "_BoBusinessProcess' and MOD_NAME='" + Utils.getModName(modelId).trim() + "_" + point + "' And RESULT_ID=" + seriesIds.get(j);
                    dudata += "'" + name + " (" + Utils.numberFormat(maxThroughput, 2) + ")', '" + color + "', '" + "" + throughput + "', '" + (j + 1) + "','" + Utils.numberFormat(throughput * 100, 2) + "%'" + ",'" + Utils.numberFormat(work, 2) + "'";
                    db.closeCon();
                    dudata += "],";
                }
            }
            if (dudata.equals("")) {

                bpData += "[";
                bpData += "'" + name + " (" + maxThroughput + ")', 'green', '0', '0', '0'";
                bpData += "],";
            } else {
                bpData += dudata;
            }
            bpData += "],";
        }

        bpData = bpData.replace("[],", "");
        bpData += "]";
    }

    /**
     *
     */
    public static final int SECONDS_REFERENCE[] = new int[]{60 * 60 * 24, 60 * 60, 60, 1};

    private void fillTrajectories() {
        db.openCon();
        ResultSet trajets = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID=" + modelId);
        try {
            while (trajets.next()) {

                trajectories.add(trajets.getString("ID"));
                trajectoriesNames.add(trajets.getString("NAME"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeBoxChronograph.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }
}
