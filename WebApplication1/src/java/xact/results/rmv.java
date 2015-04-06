/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact.results;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.*;
import lib.Options.XMLDataModel;
import lib.tools.Utils;
import xact.utils;

/**
 * The class responsible for creating the resource view and the charts in it.
 * @author ismail
 */
public class rmv {

    String mod_id = "";
    String sid = "";
    String point = "";
    String resultId = "";
    double totalUtilization = 0;

    /**
     *
     */
    public String test = "";
    Connection con = null;
    Connection conRes = null;

    /**
     *
     */
    public String out = "";

    /**
     * The constructor of the class initializes it with the model id, scenario id and plan point values.
     * @param mymoid model id
     * @param mysid scenario id
     * @param mypoint plan point
     */
    public rmv(String mymoid, String mysid, String mypoint) {
        mod_id = mymoid;
        sid = mysid;
        point = mypoint;
        resultId = Utils.getResultID(mod_id, sid);

    }

    /**
     * Closes all the open connections used by the view.
     */
    public void closeConnections() {
        if (con != null) {
            System.out.print("closing db con");
            db.closeConNewcon(con);
        }
        if (conRes != null) {
            System.out.print("closing res con");
            db.closeConNewcon(conRes);
        }
    }

    /**
     * Lazily creates and initializes the connection to the xactdb and the xact results.
     */
    public void openConnections() {
        if (con == null) {
            System.out.print("creating db con");
            con = db.openDBConNewcon(lib.Options.DbInfo.connectionString);
        }
        if (conRes == null) {
            System.out.print("creating res con");
            conRes = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
        }
    }
    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     *
     */
    public static final int SECONDS_REFERENCE[] = new int[]{60 * 60 * 24, 60 * 60, 60, 1};
    HashMap<String, Double> conso_vals = new HashMap<String, Double>();

    /**
     * Finds an aci name given its id.
     * @param get the id of the aci
     * @return the name of the aci
     */
    public String getacname(String get) {
        String fullname = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID='" + get + "'", con)[6];
        //String name = fullname.substring(fullname.lastIndexOf('^') + 1, fullname.length());
        return fullname;
    }

    /**
     * Returns the name of the model to be used with the results, if the scenario exists it returns the scenario name
     * otherwise it returns the model name.
     * @param mod_id the moidel id
     * @param sid the scenario id
     * @return the name to be used ith the results
     */
    private String getModName(String mod_id, String sid) {

        String data = "";

        if (sid.equals("0")) {
            data = db.getRowNewCon(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id, con)[4];
        } else {
            data = db.getRowNewCon(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid, con)[3];
        }
        return data;
    }

    /**
     * gets the list of complexes accordnig to the given node id.
     * @param id node id to get the complexes in it
     * @return String containing the list of complexes in the node.
     * @throws SQLException
     */
    public String getCOMPLEX(String id) throws SQLException {
        String retdata = "";
        ResultSet myrs = db.getDataNeWcon(XMLDataModel.SERVER_INST_TABLENAME, "*", "NODE_ID=" + id, con);
        String my = "";
        // retdata += "<option></option>";
        while (myrs.next()) {
            ResultSet complex = db.getDataNeWcon(XMLDataModel.COMPLEX_INST_TABLENAME, "*", "SERVER_INST_ID=" + myrs.getString("ID"), con);

            while (complex.next()) {
                String data = complex.getString("NAME");
                data = data.substring(data.length() - 1);
                if (!my.equals(data)) {
                    my = data;
                    retdata += "<option value='" + complex.getString("ID") + "'>" + my + "</option>";
                }
            }
        }
        return retdata;
    }

    /**
     * gets the list of logical servers inside a complex
     * @param Complex the id of the complex to get its logical servers
     * @return a string representing the logical servers list
     * @throws SQLException
     */
    public String getParttion(String Complex) throws SQLException {
        ArrayList<String> ol = new ArrayList<String>();
        String retdata = "";
        if (!Complex.equals("")) {
            ResultSet myrs = db.getDataNeWcon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "COMPLEX_INST_ID='" + Complex + "'", con);

            String my = "";
            // retdata += "<option></option>";
            while (myrs.next()) {

                String serverName = db.getRowNewCon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + myrs.getString("LOGICAL_SERVER_ID"), con)[2];

                // String data = serverName.substring(serverName.length() - 1);
                String data = serverName;//.substring(serverName.length() - 1);

                if (!my.equals(data)) {
                    my = data;
                    if (!ol.contains(my)) {
                        ol.add(my);
                        retdata += "<option value='" + myrs.getString("ID") + "'>" + my + "</option>";
                    }
                }
            }
        }
        return retdata;
    }

    /**
     * Gets the nodes inside a model according to the given type.
     * @param model_id the model to get its nodes
     * @param serverType the type to match the nodes with
     * @return a string representing the nodes inside the model
     * @throws SQLException
     */
    public String getNames(String model_id, String serverType) throws SQLException {
        String retdata = "";
        String[] fles = serverType.split(",");
        String mywhere = "(";
        //  retdata += "<option></option>";
        for (int i = 0; i < fles.length; i++) {
            String more = "";
            if (i != 0) {
                more = " or ";
            }
            mywhere += more + "   type= '" + fles[i].toUpperCase() + "'";
        }
        mywhere += ")";
        ResultSet myrs = db.getDataNeWcon(XMLDataModel.NODE_TABLENAME, "*", "MODEL_ID=" + model_id + " and  " + mywhere, con);
        System.out.println("MODEL_ID=" + model_id + " and  " + mywhere);
        while (myrs.next()) {
           // if (myrs.getString("MODEL_FILENAME") != null && !"null".equalsIgnoreCase(myrs.getString("MODEL_FILENAME"))) {
               // if (myrs.getString("REFERENCE").equalsIgnoreCase("1")) {
                    retdata += "<option value='" + myrs.getString("id") + "'>" + myrs.getString("hostname") + "</option>";
                //}
           // }
        }

        return retdata;
    }

    /**
     * Returns the total consumption panel and its measurements.
     * @param type the type of the currently selected server.
     * @param id node id
     * @param par logical server id
     * @param com complex id
     * @return the html of the consumption panel.
     * @throws Exception
     */
    public String getTotalCom(String type, String id, String par, String com) throws Exception {

        String data = "<br/>";
        double cpu = 0;
        double cpum = 0;

        if (type.equalsIgnoreCase("server")) {
            cpu = getServerconso(id, type, par, com);
            cpum = getServerconsomax(id, type, par, com);

//data+=test+"<br>";
        } else {

            cpu = getServerconso(id, type, "", "") / 3600;
            cpum = getServerconsomax(id, type, "", "") / 3600;

        }
        double percentage = 0;
        if (cpum != 0) {
            percentage = 100 * (cpu) / cpum;
        }

        DecimalFormat df = new DecimalFormat("#.####");

        if (type.equalsIgnoreCase("server")) {

            data += "Total resource consumed:" + Math.round(cpu) + "p.u. (" + df.format(percentage) + "% of resource max)<BR/>";
        } else if (type.equalsIgnoreCase("human")) {

            data += "Total resource consumed:" + Math.round(cpu) + "MHrs (" + df.format(percentage) + "% of resource max)<BR/>";

        } else if (type.equalsIgnoreCase("machine")) {
            data += "Total resource consumed:" + Math.round(cpu) + "SHrs (" + df.format(percentage) + "% of resource max)<BR/>";

        } else if (type.equalsIgnoreCase("Vehicle")) {
            data += "Total resource consumed:" + Math.round(cpu) + "Units (" + df.format(percentage) + "% of resource max)<BR/>";

        }

        data += "Total ressource Max = " + Math.round(cpum) + "<br/>"
                + "";

        return data;

    }
/**
 * Finds all the trajectories making use of the selected server.
 * @param ids list of acis on the selected server to be used on finding the trajectories list
 * @return list of trajectories using the selected server
 * @throws SQLException 
 */
    private ArrayList<String> getallbbs(ArrayList<String> ids) throws SQLException {

        ArrayList<String> bbs = new ArrayList<String>();
        for (int i = 0; i < ids.size(); i++) {
            //bbs.add("gggg");

            db.openCon();
            ResultSet acs = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "AC_INST_ID=" + ids.get(i));
            // bbs.add("gggg");

            while (acs.next()) {
                String buid = getbbid(acs.getString("SERVICE_ACTIVITY_ID"));

                this.out = buid;

                if (!bbs.contains(buid)) {

                    bbs.add(buid);

                }

            }
            db.closeCon();
        }

        db.closeCon();

        return bbs;
    }


    /**
     * Returns the charts values to be rendered by the google charts api. the chart consists of the distribution of the ratio of resource
     * consumption form each businss trajectory to the total consumption of the currently selected server
     * @param id
     * @param part
     * @param ty
     * @param com
     * @return
     * @throws Exception
     */
        public String getcharts(String id, String part, String ty, String com) throws Exception {
        utils u = new utils();
        String returndata = "";
        if (id != null && !id.equals("")) {
            String complex = "";

            double serverConsume = 0;
            double serverConsumemax = 0;
            double totalbbs = 0;

            ArrayList<String> ac_names = new ArrayList<String>();

            db.openCon();
            ResultSet acResultSet = null;

            if (part != null && !part.equals("") && ty.equalsIgnoreCase("Server")) {
                acResultSet = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID= '" + part + "'");

                serverConsume = getServerconso(id, ty, part, com);
                serverConsumemax = getServerconsomax(id, ty, part, com);

            } else {

                acResultSet = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID= '" + part + "'");
                serverConsume = getServerconso(id, ty, "", "");
                serverConsumemax = getServerconsomax(id, ty, "", "");

            }

            while (acResultSet.next()) {
                if (acResultSet.getString("ID") != null) {
                    ac_names.add(acResultSet.getString("ID"));
                }

            }

            db.closeCon();

            double consu_cpu = 0;
            ArrayList<String> allbbs = getallbbs(ac_names);
            //  returndata+=allbbs.get(0);
            for (int i = 0; i < allbbs.size(); i++) {
                if (u.getISScenarioPram(mod_id, sid, allbbs.get(i), "ACTIVE_STATUS").equals("-1")) {

                    String path = getbbname(allbbs.get(i)) + ";" + getservername(id);

                    double total = 0;

                    String where3 = "ITERATION= '" + this.point + "' and RESULT_ID='" + Utils.getResultID(mod_id, sid) + "' and PATH='" + path + "'";

                    ResultSet oneRow3 = db.getDataNeWcon(XMLDataModel.new_svr_use_results_TABLENAME, "*", where3, conRes);

                    if (oneRow3.next()) {

                        consu_cpu = oneRow3.getDouble("WEIGHTED_CPU");
                    }

                    total += consu_cpu;
                    totalbbs += total;

                    returndata += getbbname(allbbs.get(i)) + "___" + total + ";;;";
                    conso_vals.put(allbbs.get(i), total);

                }
            }

            double bbdiff = serverConsume - (totalbbs);
            if (bbdiff > 0) {
                returndata += "Non Business___" + bbdiff + ";;;";
            }
            double diff = serverConsumemax - serverConsume;
            if (diff > 0) {
                returndata += "IDLE___" + diff + ";;;";
            }
        }
        return "" + returndata;

    }
/**
 * Finds the parent trajectory of a service node, the method is a recursive method that searches
 * for the parent of a service node until it finds the trajectory.
 * @param nodeId the service node id to find its parent
 * @return 
 */
    private String getbbid(String nodeId) {
        String bbid = "";

        //   db.openCon();
        int count = db.getRowCountNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "Id=" + nodeId);
        String[] acs2 = db.getRowNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "Id=" + nodeId);
        //bbid+=acs2[3]+" out<br>";

        if (count > 0) {
//bbid = acs2[3];

            try {
                bbid = getbbid(acs2[3]);
            } catch (Exception e) {
            }

        } else {

            String[] ac = db.getRowNocon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "Id=" + nodeId);

            bbid = ac[0];
        }
        // db.closeCon();

        return bbid;

    }
/**
 * Find a business trajectory name.
 * @param get the business trajectory id to get its name
 * @return the name of the trajectory
 */
    private String getbbname(String get) {

        String name = db.getRowNewCon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + get, con)[3];
        return name;
    }

    /**
     * Gets all the aci inside a business trajectory.
     * @param trajectoryId id of trajectory to get its acis
     * @param mod_id model id
     * @param sid scenario id
     * @return list of acis inside the trajectory
     * @throws SQLException
     */
    public ArrayList<String> getalacs(String trajectoryId,  String mod_id, String sid) throws SQLException {
        ArrayList<String> acs = new ArrayList<String>();

        utils u = new utils();
        ResultSet Acrs = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + trajectoryId, con);
        while (Acrs.next()) {
            if (!Acrs.getString("TAG").equalsIgnoreCase("start") && !Acrs.getString("TAG").equalsIgnoreCase("end")) {
                if (Acrs.getString("TAG").equalsIgnoreCase("activity")) {
                    if (!sid.equals("0") && !sid.equals("")) {
                        if (u.getISScenarioPram(mod_id, sid, Acrs.getString("ID"), "ACTIVE_STATUS").equals("-1")) {
                            acs.addAll(getacfromactivity(Acrs.getString("ID")));
                        }

                    } else {
                        acs.addAll(getacfromactivity(Acrs.getString("ID")));
                    }

                } else {
                    try {
                        acs.addAll(getalacs(Acrs.getString("ID"),  mod_id, sid));
                    } catch (Exception exception) {
                    }
                }
            }
        }

        return acs;
    }
/**
 * 
 * @param string
 * @return
 * @throws SQLException 
 */
    private Collection<String> getacfromactivity(String string) throws SQLException {

        ArrayList<String> acs = new ArrayList<String>();
        int aciCount = db.getRowCountNewcon(XMLDataModel.ACI2ACT_TABLENAME, "SERVICE_ACTIVITY_ID=" + string, con);

        if (aciCount > 0) {
            ResultSet acid = db.getDataNeWcon(XMLDataModel.ACI2ACT_TABLENAME, "*", "SERVICE_ACTIVITY_ID=" + string, con);
            while (acid.next()) {

                String[] act2 = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID='" + acid.getString("AC_INST_ID") + "'", con);

                acs.add(act2[0] + "__" + string + "__" + act2[6]);

            }
        }
        // db.closeCon();
        return acs;
    }

    /**
     * calculates the arrival rate of corporate object
     * @param ID corporate object to get its arrival rate
     * @param MID model id
     * @param tag type of the corporate object
     * @param scenarioid scenario id
     * @return arrival rate value
     * @throws SQLException
     */
    public BigDecimal calculateArrivalRate(String ID, String MID, String tag, String scenarioid) throws SQLException {
        BigDecimal returnData = new BigDecimal(BigInteger.ZERO);

        if (tag.equalsIgnoreCase("be_bp")) {

            ResultSet mybe_bp = db.getDataNeWcon(XMLDataModel.BE_BP_TABLENAME, "*", "BP_TO_ID=" + ID + " AND MODEL_ID=" + MID, con);

            while (mybe_bp.next()) {
                BigDecimal uf = new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));
                uf = new BigDecimal(getSCENARIOPram(MID, scenarioid, mybe_bp.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Be_Bp"));
                // return new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));

                returnData = returnData.add(calculateArrivalRate(mybe_bp.getString("BE_FROM_ID"), MID, "be_be", scenarioid).multiply(uf));
                //String id = mybe_bp.getString("BE_FROM_ID");
                //Teststring += "be id=" + id + "<br>"; 

            }
        }

        if (tag.equalsIgnoreCase("be_be")) {

            ResultSet mybe_bp = db.getDataNeWcon(XMLDataModel.BE_BE_TABLENAME, "*", "BE_TO_ID=" + ID + " AND MODEL_ID=" + MID, con);
            String[] mycorporate = db.getRowNewCon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "id=" + ID + " AND MODEL_ID=" + MID, con);
            String Number = mycorporate[4];
            Number = getSCENARIOPram(MID, scenarioid, mycorporate[0], "NUMBER", Number, "BUSINESS_ENTITY");
            BigDecimal beNumber = new BigDecimal(Number);
            //  Teststring += "<br><br>" + beNumber;
            if (beNumber.compareTo(BigDecimal.ZERO) < 0) {
                beNumber = BigDecimal.ZERO;
            }

            if (beNumber.compareTo(BigDecimal.ZERO) > 0) {
                return beNumber;
            } else {
                while (mybe_bp.next()) {

                    BigDecimal uf = new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));

                    uf = new BigDecimal(getSCENARIOPram(MID, scenarioid, mybe_bp.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Be_Be"));

                    String id = mybe_bp.getString("BE_FROM_ID");

                    beNumber = beNumber.add(calculateArrivalRate(id, MID, "be_be", scenarioid).multiply(uf));
                    returnData = beNumber;

                }

                ResultSet mycorporate_be = db.getDataNeWcon(XMLDataModel.CORPORATE_BE_TABLENAME, "*", " BE_TO_ID=" + ID + " AND MODEL_ID=" + MID, con);

                // Teststring += "found corp link <br>";
                while (mycorporate_be.next()) {

                    String[] mycorporate2 = db.getRowNewCon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + MID, con);

                    String Number2 = mycorporate2[3];
                    Number2 = getSCENARIOPram(MID, scenarioid, mycorporate[0], "NUMBER", Number2, "CORPORATE");
                    // Teststring += Number2 + "<br>";
                    BigDecimal uf = new BigDecimal(mycorporate_be.getString("UTILIZATION_FREQUENCY"));
                    uf = new BigDecimal(getSCENARIOPram(MID, scenarioid, mycorporate_be.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Corporate_be"));
                    double all = Double.parseDouble(Number2) * uf.doubleValue();
                    //Teststring+= "number"+all;

                    returnData = returnData.add(new BigDecimal(all));

                }

            }

        }

        if (tag.equalsIgnoreCase("insertion")) {
            String[] service_insertion = db.getRowNewCon(XMLDataModel.SERVICE_INSERTION_TABLENAME, "id=" + ID + " AND MODEL_ID=" + MID, con);
            returnData = returnData.add(new BigDecimal(service_insertion[10]));
        }

        return returnData;
    }

    

    /**
     * checks for an object if it's edited in scenario or not.
     * @param MODEL_ID model id
     * @param SCENARIO_ID scenario id
     * @param OBJECT_ID the object to check its properties
     * @param S_PARAMETER the property to check changed
     * @param OLDVAL old value
     * @param Type
     * @return
     */
    public String getSCENARIOPram(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER, String OLDVAL, String Type) {
        String retunData = "";
        retunData = OLDVAL;

        String OBJECT_CLASS =  Utils.getClassName(Type);

        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null) {

            String wgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "' and OBJECT_CLASS='" + OBJECT_CLASS + "'";

            String[] retd = db.getRowNewCon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wgere, con);

            if (retd[6] == "" || retd[6] == null) {
                retunData = OLDVAL;

            } else {

                retunData = retd[6];

            }

        }

        return retunData;
    }

    /**
     * populates the resource table with header the data available for the selected server in total. 
     * It also calls the method {@link #getAllAcValues} to get the body of the table for the business trajectories
     * and {@link #getAcValues} to get the data for the individual acis.
     * @param id id of the selected server
     * @param mac id of selected complex
     * @param part id of selected partition
     * @param acr display type, possible values are decimal and percentage
     * @param Type selected server type
     * @return the resource table
     * @throws SQLException
     * @throws ParseException
     */
    public String createResourceTable(String id, String mac, String part, String acr, String Type) throws SQLException, ParseException {

        String data = "";

        ArrayList<String> ids = new ArrayList<String>();
        ResultSet acs = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + part, con);

        while (acs.next()) {
            ids.add(acs.getString("ID"));

            //data += acs.getString("ID");
        }

        ArrayList<String> bbs = getallbbs(ids);

        for (int i = 0; i < bbs.size(); i++) {

            if (getISScenarioPram(mod_id, sid, bbs.get(i), "ACTIVE_STATUS").equals("-1")) {

                String mid22 = mod_id;
                if (!sid.equals("0") && !sid.equals("")) {

                    mid22 = sid;

                }
                String name = getModName(mod_id, sid);
                //mid22
                String ar = "";
                String tp = "";
                String resTime = "";
                String A1 = "";

                this.out = id;

                String path = getbbname(bbs.get(i)) + ";" + getservername(id);

                String where = "TPR_KEY like '%" + bbs.get(i) + "%' and RESULT_ID='" + mid22 + "' and MOD_NAME='" + name.trim() + "_" + this.point + "'";
                String where2 = "SP_ID= '" + bbs.get(i) + "' and MODEL_ID='" + mid22 + "' and NAME='" + name.trim() + "_" + this.point + "'";
                String where3 = "ITERATION= '" + this.point + "' and RESULT_ID='" + mid22 + "' and PATH='" + path + "'";

                String[] oneRow = db.getRowNewCon(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, where, conRes);

                String[] oneRow2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, where2, conRes);

                String[] oneRow3 = db.getRowNewCon(XMLDataModel.new_svr_use_results_TABLENAME, where3, conRes);

                if (oneRow[8] != null) {
                    ar = oneRow[8];
                };
                if (oneRow[8] != null) {
                    tp = oneRow[8];
                }
                if (oneRow2[10] != null) {
                    A1 = oneRow2[10];
                }
                if (oneRow2[8] != null) {
                    resTime = oneRow2[8];
                }

                //data+=bbs.get(i);
                data += "<tr id=\"" + bbs.get(i) + "\" class=\"showtabel2 lv1\"><td>" + getbbname(bbs.get(i)) + "</td><td>Business process</td>";

                //data += "<br/>TPR_KEY like '=" +where+"<br/>";
                ArrayList<String> acid = getalacs(bbs.get(i),  mod_id, sid);

                DecimalFormat df = new DecimalFormat("#.##");

                ar = df.format(calculateArrivalRate(bbs.get(i), mod_id, "be_bp", sid).doubleValue());

                data += getAllAcValues(acid, mod_id, sid, mac, part, acr, id, Type, tp, resTime, A1, ar, oneRow3) + "</tr>";
                ArrayList<String> myr = new ArrayList<String>();

                for (int j = 0; j < acid.size(); j++) {
                    //data+="<br> in for";
                    String[] ids2 = acid.get(j).split("__");

                    if (ids.contains(ids2[0])) {
                        String cnam = ids2[2];

                        if (!myr.contains(acid.get(j))) {
                            myr.add(acid.get(j));

                            data += "<tr   id=\"" + ids2[0] + "\" class=\"showtabel1 lv2 " + bbs.get(i) + "ch \"><td>" + cnam + "</td><td>Application Component</td>";

                            data += getAcValues(acid.get(j), mod_id, sid, mac, part, acr, id, Type, bbs.get(i)) + "</tr>";

                        }

                    }
                }
            }

        }

        return data;
    }
    resultes rs = new resultes("", "", "", "", "", "");

    /**
     *
     * @param MODEL_ID
     * @param SCENARIO_ID
     * @param OBJECT_ID
     * @param S_PARAMETER
     * @return
     */
    public String getISScenarioPram(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER) {
        String retunData = "-1";

        String wgere = "";
        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null) {
            wgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "'";

            String[] retd = db.getRowNewCon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wgere, con);
            if (retd[6] != null) {

                if (!retd[6].equals("")) {
                    if (retd[6].equals("0")) {
                        retunData = retd[6];
                    }
                }
            }
        }

        return retunData;
    }

    /**
     *Gets the values for the acis to be used in the resource table and renders them in a table rows format.
     * @param id
     * @param mod_id
     * @param sid
     * @param com
     * @param part
     * @param acr
     * @param nid
     * @param Type
     * @param bbid
     * @return
     * @throws SQLException
     * @throws ParseException
     */
    public String getAcValues(String id, String mod_id, String sid, String com, String part, String acr, String nid, String Type, String bbid) throws SQLException, ParseException {

        String name = getModName(mod_id, sid);
        String complex = "Complex" + com + "->Partition" + part;
        double dis = 0;
        double inc = 0;
        double response = 0;
        double through = 0;
        double arrival = 0;
        double elon = 0;

        String retdata = "";
        double thorp = 0;
        double rt = 0;
        double ru = 0;
        double maa = 0;
        double av = 0;

        String[] ids = id.split("__");
        String partition = getPartName(part);
        String complexName = getComName(com);
        double dt = 0;
        String path = "";

        String serverName = getservernameFromAci(ids[0]);
        String componentName = getaciname(ids[0]);

        path = getbbname(bbid);
        path += ";" + serverName + ";" + componentName;

        String data = "";

        String data2 = "VAL0='APPLICATION_COMPONENT' AND VAL23='" + ids[0] + "' AND VAL4='" + componentName + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
        String data63 = "VAL0='CACHE_A_PER_COMPONENT' AND VAL9='" + ids[0] + "' AND VAL4='" + componentName + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
        String data64 = "VAL0='FLOW_COMP'  AND VAL2='" + componentName + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
        String recourcedata = "ITERATION= '" + this.point + "' and RESULT_ID='" + resultId + "' and  (`PATH` like '" + getbbname(bbid) + "%' and  `PATH` like '%" + componentName + "' )";


        String[] resultrow = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data2, conRes);
        String[] resultchr = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data63, conRes);
        String[] flowResult = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data64, conRes);

        ResultSet resourceResult = db.getDataNeWcon(XMLDataModel.new_svr_use_results_TABLENAME, "*", recourcedata, conRes);

        this.out = db.returnSQL;;

        if (resultchr[12] != null) {
            dis = (100 / Double.parseDouble(resultchr[12]) * 100) - 100;
        }
        if (flowResult[9] != null) {
            inc = Double.parseDouble(flowResult[9]);
        }
        
         while (resourceResult.next()) {
         ru += resourceResult.getDouble("WEIGHTED_CPU");
         }
    
      
         totalUtilization += ru;
         String myuint = "pu";

         if (Type.equalsIgnoreCase("server")) {

         myuint = "p.u";
         } else if (Type.equalsIgnoreCase("human")) {

         myuint = "MHrs";

         } else if (Type.equalsIgnoreCase("machine")) {
         myuint = "SHrs";

         } else if (Type.equalsIgnoreCase("Vehicle")) {
         myuint = "Units";

         }

         if (acr.equalsIgnoreCase("di")) {

         ru = (ru / getServerconso(nid, Type, part, com)) * 100;

         }

         NumberFormat formatter = new DecimalFormat("#,###,###.0000");
         double ddd1 = 0;
         if (resultrow[11] != null) {
         ddd1 = Double.parseDouble(resultrow[11]);
         }
         double ddd2 = 0;
         if (resultrow[11] != null) {
         ddd2 = Double.parseDouble(resultrow[12]);
         }
         String dd1 = "0";
         if (ddd1 != 0) {
         dd1 = formatter.format(1 / ddd1);
         }
         //String dd1 = String.format("%.10g%n", 1 / Double.parseDouble(resultrow[11]));
         String dd2 = Utils.convertToDHMS(ddd1);
         String dd3 = formatter.format(ru);
         String dd4 = String.format("%.4g%n", ddd2);
         // String dd4= String.format("%.2g%n", Double.parseDouble(resultrow[12]));

         if (acr.equalsIgnoreCase("di")) {

         dd3 += "%";

         } else {
         dd3 += myuint;

         }

         data += "<td style=\"text-align:center\" >" + dd1 + "</td><td style=\"text-align:center\" >" + dd2 + "</td><td style=\"text-align:center\" >" + dd3 + "</td><td style=\"text-align:center\" >" + dd4 + "</td><td style=\"text-align:center\" >" + dt + "</td><td style=\"text-align:center\" >" + Math.round(dis) + "</td><td style=\"text-align:center\" >" + inc + "</td>";
         
        return data;
    }

    /**
     *
     * @param ids
     * @param mod_id
     * @param sid
     * @param com
     * @param part
     * @param acr
     * @param nid
     * @param Type
     * @param throughput
     * @param resTime
     * @param A1
     * @param ar
     * @param resourceData
     * @return
     * @throws SQLException
     * @throws ParseException
     */
    public String getAllAcValues(ArrayList<String> ids, String mod_id, String sid, String com, String part, String acr, String nid, String Type, String throughput, String resTime, String A1, String ar, String[] resourceData) throws SQLException, ParseException {

        String complex = "Complex" + com + "->Partition" + part;

        double response = 0;
        double through = 0;
        double arrival = 0;
        double elon = 0;

        String retdata = "";
        double thorp = 0;
        double rt = 0;
        double ru = 0;
        double maa = 0;
        double av = 0;
        double dis = 0;
        double inc = 0;

        if (!throughput.equals("")) {
            through = Double.parseDouble(throughput);
        }
        if (!resTime.equals("")) {
            response = Double.parseDouble(resTime);
        }
        if (!A1.equals("")) {
            elon = Double.parseDouble(A1);
        }
        if (!ar.equals("")) {
            arrival = Double.parseDouble(ar);
        }

        String ff = "";

        for (int i = 0; i < ids.size(); i++) {
            String[] combinedId = ids.get(i).split("__");
            // retdata+="ID=" + combinedId[0]+" AND COMPLEX='"+complex+"'";

            //     ResultSet acs = db.getData(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "ID=" + ids.get(i) + " AND COMPLEX='" + complex + "'");
            ResultSet acs = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "ID=" + combinedId[0], con);

            if (acs.next()) {
                String name = getModName(mod_id, sid);
                String data2 = "VAL0='APPLICATION_COMPONENT' AND VAL23='" + combinedId[0] + "' AND VAL4='" + acs.getString("INST_NAME") + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
                String data63 = "VAL0='CACHE_A_PER_COMPONENT' AND VAL9='" + combinedId[0] + "' AND VAL4='" + acs.getString("INST_NAME") + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
                String data64 = "VAL0='FLOW_COMP'  AND VAL2='" + acs.getString("INST_NAME") + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;

                String[] resultrow = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data2, conRes);
                String[] resultchr = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data63, conRes);
                String[] resultAyehaga = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data64, conRes);

                if (resultrow[14] != null) {
                    if (!resultrow[14].equalsIgnoreCase("null")) {
                        if (thorp < Double.parseDouble(resultrow[14])) {

                            thorp = Double.parseDouble(resultrow[14]);
                        }
                    }
                }
                if (resultrow[11] != null) {
                    if (!resultrow[11].equalsIgnoreCase("null")&&!resultrow[11].equalsIgnoreCase("-nan")&&!resultrow[11].equalsIgnoreCase("nan")) {
                        if (rt < Double.parseDouble(resultrow[11])) {
                            try {
                                rt = Double.parseDouble(resultrow[11]);
                            } catch (NumberFormatException numberFormatException) {
                            }
                        }
                    }
                }
                if (resultrow[12] != null) {
                    if (!resultrow[12].equalsIgnoreCase("null")&&!resultrow[12].equalsIgnoreCase("-nan")&&!resultrow[12].equalsIgnoreCase("nan")) {
                        if (maa < Double.parseDouble(resultrow[12])) {
                            maa = Double.parseDouble(resultrow[12]);
                        }
                    }
                }

                if (resultchr[12] != null) {
                    if (!resultrow[12].equalsIgnoreCase("null")) {
                        if (dis < 1 / (Double.parseDouble(resultchr[12]))) {
                            dis = 1 / (Double.parseDouble(resultchr[12]));
                        }
                    }
                }
                if (resultAyehaga[9] != null) {
                    if (!resultrow[9].equalsIgnoreCase("null")) {
                        if (inc < Double.parseDouble(resultAyehaga[9])) {
                            inc = Double.parseDouble(resultAyehaga[9]);
                        }
                    }
                }

            }
        }
        if (resourceData[8] != null) {
            if (!resourceData[8].equalsIgnoreCase("null")) {
                ru = Double.parseDouble(resourceData[8]);

            }
        }
        String myuint = "pu";
        if (Type.equalsIgnoreCase("server")) {

            myuint = "p.u";
        } else if (Type.equalsIgnoreCase("human")) {

            myuint = "MHrs";

        } else if (Type.equalsIgnoreCase("machine")) {
            myuint = "SHrs";

        } else if (Type.equalsIgnoreCase("Vehicle")) {
            myuint = "Units";

        }

        if (acr.equalsIgnoreCase("di")) {

            ru = (ru / getServerconso(nid, Type, part, com)) * 100;

        }

        //String dd1 = String.format("%.2g%n", thorp);
        NumberFormat formatter = new DecimalFormat("#,###,###.0000");

        String dd3 = formatter.format(ru);

        if (acr.equalsIgnoreCase("di")) {

            dd3 += "%";

        } else {
            dd3 += myuint;

        }

        DecimalFormat df = new DecimalFormat("#.####");

        retdata += "<td style=\"text-align:center\">" + df.format(through) + "(" + ar + ")</td><td style=\"text-align:center\">" + Utils.convertToDHMS(response) + "</td><td style=\"text-align:center\">" + dd3 + "</td><td style=\"text-align:center\">" + df.format(elon) + "</td><td style=\"text-align:center\">" + av + "</td><td style=\"text-align:center\">" + df.format(dis) + "</td><td style=\"text-align:center\">" + inc + "</td>";

        // data += "<td>" + resultrow[14] + "</td><td>" + resultrow[11] + "</td><td>" +resultrow[10]  + "</td><td>" + resultrow[12] + "</td><td>" + dt + "</td><td>" + dis + "</td><td>" + inc + "</td>";
        return retdata;

    }

    private String getservername(String id) {

        String r = db.getRowNewCon(XMLDataModel.NODE_TABLENAME, "ID='" + id + "'", con)[2];

        /*
        
         String fullname = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NODE_ID='" + id + "'", con)[6];

         String r = fullname;

         String[] s = fullname.split("/");
         if (s.length > 1) {
         r = s[1].replace("^", "");
         }*/
        return r;
    }

    /**
     *
     * @param requiredVal
     * @param acname
     * @param servername
     * @param id
     * @return
     */
    public double get_component_result(String requiredVal, String acname, String servername, String id) {
        double val = 0;
        String ModelName = getModelName(id);

        db.openConres();
        if (acname != null && !"".equals(acname) && servername != null && !"".equals(servername)) {
            String value = db.getValueNocon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, requiredVal, "VAL0='APPLICATION_COMPONENT' AND MOD_NAME='" + ModelName + "' AND VAL4='" + acname + "' AND VAL1='" + servername + "' and RESULT_ID=" + resultId);
            if (value != null && !"".equals(value.trim()) && !"null".equals(value.trim())) {
                val = Double.parseDouble(value.trim());
            }
        }
        db.closeCon();
        return val;
    }

    private double getServerconso(String id, String ty, String part, String com) {
        double cons = 0;
       
        
        String model_name = getModName(mod_id, sid) + "_" + point;

        //  test += "MOD_NAME='" + model_name.trim() + "' AND VAL0='PARTITION_CPU_RATE' AND VAL6='" + part + "' AND VAL7='" + com + "' and RESULT_ID=" + resultId ;
        if (ty.equalsIgnoreCase("Server") && !part.equalsIgnoreCase("") && !com.equalsIgnoreCase("")) {

            String where = "MOD_NAME='" + model_name.trim() + "' AND VAL0='PARTITION_CPU_RATE' AND VAL6='" + part + "' AND VAL7='" + com + "' and RESULT_ID=" + resultId;
            System.out.println(where);
            String[] res_row = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, where, conRes);
            System.out.println("consu="+res_row[5]);
            if (res_row[8] != null) {
                if (!res_row[8].equalsIgnoreCase("null")) {
                    cons = Double.parseDouble(res_row[8]);
                }
            }

        } else if (part.equalsIgnoreCase("") && !ty.equalsIgnoreCase("") && com.equalsIgnoreCase("")) {

            String where2 = " MOD_NAME='" + model_name + "' AND VAL='COMPLEX_CPU_RATE'  AND VAL7='" + com + "' and RESULT_ID=" + resultId;
            String[] res_row = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, where2, conRes);
            cons = Double.parseDouble(res_row[7]);

        }

        return cons;
    }

    private double getServerconsomax(String id, String ty, String part, String com) {
        double cons = 0;
        
        String model_name = getModName(mod_id, sid) + "_" + point;
        

        if (ty.equalsIgnoreCase("Server") && !part.equalsIgnoreCase("") && !com.equalsIgnoreCase("")) {

            String[] res_row = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "MOD_NAME='" + model_name.trim() + "' AND VAL0='PARTITION_CPU_RATE' AND VAL6='" + part + "' AND VAL7='" + com + "' AND  RESULT_ID=" + resultId, conRes);
            if (res_row[9] != null) {
                if (!res_row[9].equalsIgnoreCase("null")) {
                    cons = Double.parseDouble(res_row[9]);
                }
            }

        } else if (!part.equalsIgnoreCase("") && ty.equalsIgnoreCase("") && com.equalsIgnoreCase("")) {
            String[] res_row = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, " MOD_NAME='" + model_name + "' AND VAL0='COMPLEX_CPU_RATE'  AND VAL7='" + com + "' and RESULT_ID=" + resultId, conRes);
            if (res_row[8] != null) {
                if (!res_row[8].equalsIgnoreCase("null")) {
                    cons = Double.parseDouble(res_row[8]);
                }
            }

        }

        return cons;
    }

    private String getModelName(String id) {
        String fullname = db.getRow(XMLDataModel.NODE_TABLENAME, "ID='" + id + "'")[1];
        String mod_name = db.getRow(XMLDataModel.MODEL_TABLENAME, "ID='" + fullname + "'")[4] + "_" + this.point;
        return mod_name;
    }

   

   

    private String getPartName(String part) {
        String id = db.getRowNewCon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + part, con)[1];
        String name = db.getRowNewCon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + id, con)[2];
        return name.substring(name.length() - 1);
    }

    private String getComName(String com) {
        String name = db.getRowNewCon(XMLDataModel.COMPLEX_INST_TABLENAME, "ID=" + com, con)[3];
        return name.substring(name.length() - 1);
    }

    private String getservernameFromAci(String aciID) {
        String serverId = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + aciID, con)[4];
        String id = db.getRowNewCon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId, con)[1];
        String name = db.getRowNewCon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + id, con)[2];
        name = name.replace("Complex", "");
        name = name.replace("Part", "");
        name = name.substring(0, name.length() - 2);
        return name;
    }

    private String getaciname(String aciId) {
        return db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + aciId, con)[6];
    }
}
