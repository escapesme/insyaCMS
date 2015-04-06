/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.85.1625634089
 */
package xact.results;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import lib.Options.DbInfo;
import lib.Options.XMLDataModel;
import lib.tools.Utils;
import xact.utils;

/**
 * The class responsible for calculating the values for the diagnosis and repair
 * dials as well as the components list.<br>
 * the class uses many helper functions from the {@link utils} class and the
 * {@link Utils} class. for more information refer to the see also section.<br>
 *
 * @author ahmed
 *
 */
public class resultes {

    String resTebleName = XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME;
    // xact.results.getResults X = new xact.results.getResults();
    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     * Used to store test parameters values to display in the test page
     */
    public String test = "";

    /**
     *
     */
    public String test3 = "";

    /**
     *
     */
    public String test2 = "";

    /**
     *
     */
    public String testAci = "";

    /**
     *
     */
    public String test3Aci = "";

    /**
     *
     */
    public String test2Aci = "";
    double maxTP = 0;
    double MaxTpCputime = 0;
    double MaxTpServicetime = 0;
    double maxAr = 0;
    String MaxTpcName = "";
    String MaxTpServername = "";
    String scenario_id = "";
    String mod_id = "";
    String point = "";
    String pro_id = "";
    String cid = "";
    String gid = "";
    String resultId = "";

    /**
     *
     */
    public String returndata2 = "";

    /**
     * used to store the server with highest utilization rate
     */
    public String serverName = "";
    String serverAllName;

    /**
     * used to store the partition with highest utilization rate
     */
    public String partitionName = "";

    /**
     * used to store the complex with highest utilization rate
     */
    public String complexName = "";

    /**
     * used to store the aci with highest utilization rate
     */
    public String componentName = "";

    /**
     *
     */
    public double comTP = 0;

    double hieghestRate = 0;
    double hieghestmax = 0;
    private ArrayList<String> processedAci = new ArrayList<String>();
    /**
     *
     */
    
    Connection dbCon = null;
    private double initialCost;

    /**
     *
     */
    public String out;

    /**
     * the constructor for the class. the main function of the constructor is to
     * initialize the values of project id, model id<br>
     * scenario id, client id, group id and current plan point.
     *
     * @param mypro_id id of the current project
     * @param mymod_id id of selected model
     * @param myscenario_id id of scenario or 0 if in model
     * @param mypoint current plan point
     * @param mycid client id
     * @param mygid group id
     */
    public resultes(String mypro_id, String mymod_id, String myscenario_id, String mypoint, String mycid, String mygid) {

        mod_id = mymod_id;
        pro_id = mypro_id;
        scenario_id = myscenario_id;
        point = mypoint;
        cid = mycid;
        gid = mygid;
        resultId = Utils.getResultID(mod_id, scenario_id);

    }
    Map<String, Double> allServers = new HashMap<>();
    List<String> list;

    /**
     * calculates the efficiency ratio of the model or scenario. the value is
     * calculated by iterating through all the servers in the model and finding
     * the server with highest ratio which is cpu rate/cpu max. the final value
     * is then multiplied by 100.
     *
     * @return the value of efficiency ratio rounded to two decimals.
     * @throws SQLException
     */
    public String getEffciency() throws SQLException {

        /* ResultSet res3 = getresFromDate("APPLICATION_COMPONENT;" + serverName.trim() + ";" + "0" + ";" + componentName.trim() + ";" + partitionName, "0;1;2;4;3", point, mod_id, scenario_id);
         if (res3.next()) {

         String type = res3.getString("VAL5");
         if (type.equals("2")) {

         double duration = Double.parseDouble(res3.getString("VAL7")) * Double.parseDouble(res3.getString("VAL12"));
         double level = Double.parseDouble(res3.getString("VAL11"));
         double rate = Double.parseDouble(res3.getString("VAL6"));
         double window = getduration(mod_id, scenario_id);

         test3 += "<br>duration: " + duration;
         test3 += "<br>MPL: " + level;
         test3 += "<br>CPU rate: " + rate;
         test3 += "<br>window: " + window;
         dtt = (duration * rate) / (window * 100 * level);
         } else {

         dtt = maxRate;
         }

         }*/
        ResultSet res2 = getresFromDate("PARTITION_CPU_RATE", "0", point, mod_id, scenario_id);
        res2.afterLast();
        while (res2.previous()) {
              System.out.println("1st item="+hieghestmax);
            double currentRate = Double.parseDouble(res2.getString("VAL4"));
            double currentMax = Double.parseDouble(res2.getString("VAL5"));
            allServers.put(res2.getString("VAL1") + ";" + res2.getString("VAL2") + ";" + res2.getString("VAL3"), currentRate);
            if (currentRate > hieghestRate) {
                hieghestRate = currentRate;
                hieghestmax = currentMax;
                serverName = res2.getString("VAL1");
                complexName = res2.getString("VAL2");
                partitionName = res2.getString("VAL3");
                serverAllName = serverName + ";" + complexName + ";" + partitionName;
            }

        }
        list = new LinkedList(allServers.keySet());
       Collections.sort(list);
       
        double efficiency =0;
        if(hieghestRate!=0&&hieghestmax!=0){
           efficiency = hieghestRate / hieghestmax;
        }
      
        test3 += "<br>Efficiency index: " + (roundToTwoDecimals(efficiency * 100));
        return Double.toString(roundToTwoDecimals(efficiency * 100));
        //    return test;

    }

    /**
     * method to return a result set from new_detail_result table given the keys
     * for the query and their corresponding values.
     *
     * @param Values values of the search query columns
     * @param fildes the query columns numbers, this is according to the passed
     * values
     * @param point plan point
     * @param mod_id model id
     * @param scenario_id scenario id
     * @return the results set according to passed parameters
     * @throws SQLException
     */
    public ResultSet getresFromDate(String Values, String fildes, String point, String mod_id, String scenario_id) throws SQLException {

        String ret = "";

        String[] Vls = Values.split(";");
        String[] Fls = fildes.split(";");
        String wheredata = "";

        for (int i = 0; i < Vls.length; i++) {

            String myand = "";
            if (i > 0) {

                myand = " and ";

            }

            wheredata += myand + " VAL" + Fls[i] + "='" + Vls[i] + "'";

        }
        ret += wheredata;

        java.sql.Connection con = db.openDBConNewcon("");
        ret += con.toString();

        String mod_name = "";
        if (!scenario_id.equalsIgnoreCase("0") && !scenario_id.equalsIgnoreCase("")) {

            ResultSet rs = db.getDataNeWcon(XMLDataModel.SCENARIO_TABLENAME, "*", "ID=" + scenario_id, con);

            if (rs.next()) {
                mod_name = rs.getString("NAME");

            }

            ret += mod_name;

        } else {

            // mod_name = db.getRow([4];
            ResultSet rs2 = db.getDataNeWcon(XMLDataModel.MODEL_TABLENAME, "*", "ID=" + mod_id, con);
            // ResultSet rs22= db.getDataNeWcon(XMLDataModel.MODEL_TABLENAME, "*","id=" + mod_id);
            if (rs2.next()) {

                mod_name = rs2.getString("MODEL_NAME");
                ret += mod_name;
            }

        }
        db.closeConNewcon(con);
        wheredata += " and MOD_NAME='" + mod_name.trim() + "_" + point + "' AND RESULT_ID=" + resultId;
        db.openConres();
        ret += "<br>" + db.toString();

        ResultSet rs = db.getData(resTebleName, "*", wheredata);

        // test3 += "<br>"+wheredata;
        return rs;
    }

    double rate = 0;
    double current = 0;
    double serviceTime = 0;
    double cpuTime = 0;
    double elongation = 0;
    double responseTime = 0;
    double arrival = 0;
    double idealST = 0;
    utils u = new utils();

    /**
     * 
     * calculates the productivity index of the model.<br>the value is
     * calculated by finding the aci with the highest cpu rate in the server
     * with highest utilization rate found in
     * {@link resultes#getEffciency() the efficiency ratio caclulation}, the
     * method
     * {@link resultes#getComponentWithHighestRate() getComponentWithHighestRate()}
     * is used to get the component with the highest rate. then, if the
     * component has cache ratio and the ratio is 100% we modify its ideal
     * service time to become (response time/(1+elongation)) else we make it
     * equal to cpu time. then we get the number of processors. the value of
     * productivity index is equal to number of processors/ideal service time.
     *
     * @return the productivity index value
     * @throws SQLException
     */
    public String getProductivityIndex() throws SQLException {
        double cpumax=0;
        String pro_index = "";
        //System.out.println("batrch" + allBatch());
        if (allBatch()) {
            return "0";
        }
        double dtt = 0;
        if (dbCon == null) {
            dbCon = db.openDBConNewcon(DbInfo.connectionString);
        }

        String componentHighestRate = getComponentWithHighestRate();
        if (componentHighestRate.equals("")) {
            return "0";
        }
        MaxTpcName = componentHighestRate;
        ResultSet cpuMax = getresFromDate("PARTITION_CPU_RATE;" + serverAllName , "0;1;2;3", point, mod_id, scenario_id);
        if(cpuMax.next()){
            cpumax=Double.parseDouble(cpuMax.getString("VAL5"));
        }
        ResultSet cache = getresFromDate("CACHE_A_PER_COMPONENT;" + serverAllName + ";" + componentHighestRate, "0;1;2;3;4", point, mod_id, scenario_id);
        if (cache.next()) {
            if (cache.getString("VAL9").equals("100")) {
                idealST = responseTime / (1 + elongation);
            } else {
                idealST = cpuTime;
            }
        } else {
            idealST = cpuTime;
        }
       // int proc = u.getNumberProcessors(serverName, mod_id, complexName, partitionName);
        double maxThrp = (cpumax / 100) / idealST;
       // System.err.println("modelname=" + Utils.getModName(mod_id, scenario_id) + "_0 " + serverAllName + " component=" + componentHighestRate + " arrival=" + arrival + " ; maxtp=" + maxThrp);
        test3 += "<br>productivity index: " + dtt;
        NumberFormat nf=NumberFormat.getInstance();
        nf.setMaximumFractionDigits(2);
        pro_index = nf.format(100 * arrival / maxThrp);
        db.closeCon();
        db.closeConNewcon(dbCon);
        dbCon = null;

        return pro_index;
        /////////////////////////////pro_idx
    }

    /**
     * the number of seconds in 1 day, 1 hour, i minute and 1 second
     * respectively.
     */
    public static final int SECONDS_REFERENCE[] = new int[]{60 * 60 * 24, 60 * 60, 60, 1};

    /**
     * calculates the cost variation value for the model. the value is the
     * difference between the (cpu time/servcie time) value in plan point 0 and
     * current plan point.<br>
     * the server used in the search is the one found in
     * {@link resultes#getEffciency()  efficiency ratio} and the aci found in
     * the {@link resultes#getProductivityIndex()  productivity index}.<br>
     * the value for plan point 0 will always be 0 so we skip he calculation.
     *
     * @return cost variation value for current point.
     * @throws SQLException
     */
    public double getCostvariation() throws SQLException {

        double returndata = 0;

        double X0 = 0;
        double Xin = 0;
        if (point.equals("0")) {
            return 0;
        }
        ResultSet rs = getresFromDate("APPLICATION_COMPONENT;" + serverAllName + ";" + MaxTpcName, "0;1;2;3;4", "0", mod_id, scenario_id);
        if (rs.next()) {

            X0 = Double.parseDouble(rs.getString("VAL13")) / Double.parseDouble(rs.getString("VAL15"));
           // System.err.println("point=" + point + " x0=" + X0);

        }

        ResultSet rs3 = getresFromDate("APPLICATION_COMPONENT;" + serverAllName + ";" + MaxTpcName, "0;1;2;3;4", point, mod_id, scenario_id);

        if (rs3.next()) {

            Xin = Double.parseDouble(rs3.getString("VAL13")) / Double.parseDouble(rs3.getString("VAL15"));
           // System.err.println("point=" + point + " xn=" + Xin);

        }

        returndata = (X0 - Xin) * 100;
        db.closeCon();

        return roundToTwoDecimals(returndata);

    }

    /**
     * calculates the complexity gradient value of the model. the value is the
     * highest elongation in the <b>active</b> business trajectories.
     *
     * @return the complexity gradient value
     * @throws SQLException
     */
    public double getComplexityGradient() throws SQLException {
        double aln = 0;
        if (gid.equals("")) {
            gid = "2";
        }
        if (cid.equals("")) {
            cid = "2";
        }
        String[] bu_ID = db.getColumn(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID", "MODEL_ID=" + mod_id);
        String[] names = db.getColumn(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "NAME", "MODEL_ID=" + mod_id);
        db.openDBCon(lib.Options.DbInfo.connectionStringRes);
        String name = Utils.getModName(mod_id, scenario_id) + "_" + point;
        test += "<br>complexity gradient:<br>";

        for (int i = 0; i < bu_ID.length; i++) {

            //  test += "SP_ID ='" + bu_ID[i] + "' AND MODEL_ID ='" + mod_id + "' AND NAME ='" + name + "'";
            test += "<br>business process: " + names[i] + "<br>";
            if (u.getISScenarioPram(mod_id, scenario_id, bu_ID[i], "ACTIVE_STATUS").equals("-1")) {
                test += "<br>business process active";
                String[] mysp = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID =" + bu_ID[i] + " AND MODEL_ID =" + resultId + " AND NAME ='" + name.trim() + "' AND CLIENT_ID=" + cid + " AND GROUP_ID=" + gid);

                if (mysp[10] != null && !mysp[10].equalsIgnoreCase("null")) {
                    if (Double.parseDouble(mysp[10]) > aln) {
                        aln = Double.parseDouble(mysp[10]);

                    }
                }
            }
        }
        db.closeCon();

        if (aln > 200) {
            aln = 200;
        }
        if (aln < 0) {
            aln = 0;
        }
        return roundToTwoDecimals(aln);

    }

    /**
     * calculates the batch efficiency of the model. if the model doesn't
     * contain batch trajectories the value will be 0.<br>
     * the value is equal to highest response time / duration value among batch
     * trajectories rounded to two decimal.
     *
     * @return the batch efficiency value
     * @throws Exception
     * @see resultes#roundToTwoDecimals roundToTwoDecimals
     */
    public double getBatchEfficiency() throws Exception {
        double eff = Double.NEGATIVE_INFINITY;
        ArrayList<String> totalnames = new ArrayList<String>();
        HashMap<String, Double> mapCpu = new HashMap();
        HashMap<String, Double> mapEff = new HashMap();
        db.openCon();
        
        ResultSet acis = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "MODEL_ID=" + mod_id);
        double sla = getduration(mod_id);
        //db.openDBCon(lib.Options.DbInfo.connectionStringRes);

        while (acis.next()) {
            totalnames.add(acis.getString("AC_INST_ID"));
        }
        db.closeCon();
        ResultSet myres = getresFromDate("APPLICATION_COMPONENT", "0", point, this.mod_id, scenario_id);
        while (myres.next()) {
            double cpu = Double.parseDouble(myres.getString("VAL13"));
            String aciId = myres.getString("VAL23");
            String key = myres.getString("VAL1") + myres.getString("VAL2") + myres.getString("VAL3");
            if (totalnames.contains(aciId)) {
               
            if (mapCpu.containsKey(key)) {
                if (mapCpu.get(key) < cpu) {
                    
                        if (myres.getString("VAL5").equals("2")) {

                            double duration = Double.parseDouble(myres.getString("VAL7")) * (Double.parseDouble(myres.getString("VAL12")) * sla);
                            double per = duration / sla;
                            double indx;
                            if (per < 1.0d) {
                                indx = (1 - per) * -1;

                            } else {
                                indx = per - 1;

                            }
                            mapCpu.put(key, cpu);
                            mapEff.put(key, indx);
                        }
                    }
                } else {
                if (myres.getString("VAL5").equals("2")) {
                    
                            double duration = Double.parseDouble(myres.getString("VAL7")) * (Double.parseDouble(myres.getString("VAL12")) * sla);
                            double per = duration / sla;
                            double indx;
                            if (per < 1.0d) {
                                indx = (1 - per) * -1;

                            } else {
                                indx = per - 1;

                            }
                            mapCpu.put(key, cpu);
                            mapEff.put(key, indx);
                        }

            }
            } 
        }
        for(String key:mapEff.keySet()){
         //   System.out.println(key+":"+mapEff.get(key));
        }
         List list = new LinkedList(mapEff.entrySet());
        Collections.sort(list, new Comparator() {

            public int compare(Object o1, Object o2) {
                try {
                    return Double.compare((Double) o2, (Double) o1);
                } catch (Exception e) {
                    return 0;
                }
            }
        });
        Map result = new LinkedHashMap();
        for (Iterator it = list.iterator(); it.hasNext();) {
            Map.Entry entry = (Map.Entry) it.next();
            result.put(entry.getKey(), entry.getValue());
        }
        Collection<Double> col = result.values();
            Object[] aryPc = col.toArray();
            try {
            eff = (double) aryPc[0];
        } catch (Exception e) {
        }
        //<editor-fold defaultstate="collapsed" desc="old code">
        /*String resId = Utils.getResultID(mod_id, scenario_id);
        String bp = "";
        double eff = -100d;
        double returndata = Double.MAX_VALUE;
        double maxvalue = 100;
        double minvalue = -100;
        
        /////////////////////////////Batch efficiency
        String module_name = Utils.getModName(mod_id, scenario_id) + "_0";
        
        // module_name += mod_id;
        String[] DURATION_cOL = db.getColumn(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "DURATION", "MODEL_ID=" + mod_id);
        String[] SELECTOR_cOL = db.getColumn(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "SELECTOR", "MODEL_ID=" + mod_id);
        String[] ID_cOL = db.getColumn(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID", "MODEL_ID=" + mod_id);
        String[] names = db.getColumn(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "NAME", "MODEL_ID=" + mod_id);
        test += "<br>Batch effeciency";
        for (int i = 0; i < DURATION_cOL.length; i++) {
        test += "<br>business process: " + names[i] + "<br>";
        if (u.getISScenarioPram(mod_id, scenario_id, ID_cOL[i], "ACTIVE_STATUS").equals("-1")) {
        test += "<br>business process active<br>";
        
        String DURATION = DURATION_cOL[i];
        System.out.println("trajectory:" + names[i] + " and duration=" + DURATION + " and batch=" + SELECTOR_cOL[i]);
        if (!SELECTOR_cOL[i].equalsIgnoreCase("0")) {
        
        db.openCon();
        
        
        String[] cu = db.getRowNocon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + mod_id);
        DURATION = "" + getduration(mod_id);
        
        
        
        db.closeCon();
        
        db.openDBCon(lib.Options.DbInfo.connectionStringRes);
        
        String[] sp_rs = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + ID_cOL[i] + " and Name='" + module_name + "' And MODEL_ID=" + resId);
        
        db.closeCon();
        String currentbp = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + ID_cOL[i])[3];
        double data = 0;
        if (sp_rs[8] != null) {
        data = Double.parseDouble(sp_rs[8]) / Double.parseDouble(DURATION);
        }
        double indx;
        
        if (data < 1d) {
        indx = (1 - data) * -1;
        } else {
        indx = data - 1;
        }
        returndata2 += "business process=" + currentbp + " and the response is=" + sp_rs[8] + "<br>";
        // returndata2+="index="+indx+"<br>";
        if (indx > eff) {
        eff = indx;
        bp = currentbp;
        }
        
        }
        }
        }
        
        returndata2 += "business process=" + bp + "and value=<br>" + eff;
        System.err.println("business process=" + bp + "and value=<br>" + eff);
        if (returndata == Double.MAX_VALUE) {
        returndata = 0;
        }
        
        if (returndata > maxvalue) {
        
        returndata = maxvalue;
        
        }
        if (returndata < minvalue) {
        returndata = minvalue;
        }
        
        if (eff == -100) {
        eff = 0;
        }*/
//</editor-fold>
        if (eff == Double.NEGATIVE_INFINITY) {
            eff = 0;
        }
       
        return eff;
    }

    

    /**
     *@deprecated 
     * @return @throws Exception
     * @throws SQLException
     */
    public String getAciList_bak() throws Exception, SQLException {
        String retdata = "";
        utils u = new utils();

        ArrayList<String> totalnames = new ArrayList<String>();
        Connection openDBConNewcon = db.openDBConNewcon(DbInfo.connectionString);

        ResultSet acis = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "MODEL_ID=" + mod_id, openDBConNewcon);

        //db.openDBCon(lib.Options.DbInfo.connectionStringRes);
        double th_THROUGHPUT = 0;
        double th_ELONGATION = 0;
        double chr = 0;
        int counter = 0;
        // String outr = "";
        //  outr += "number of ac's=" + names.length;
        String out = "";
        while (acis.next()) {

            String myname = acis.getString("INST_NAME") + "__" + Utils.getAciNMLName(acis.getString("ID"));
            totalnames.add(myname);

            out += "DB:" + myname + "<br/> ";

        }

        db.closeConNewcon(openDBConNewcon);

        ResultSet myres = getresFromDate("APPLICATION_COMPONENT", "0", point, this.mod_id, scenario_id);

        //out=db.returnSQL;
        ArrayList<String> don = new ArrayList<String>();
        while (myres.next()) {

            String currentName = myres.getString("VAL4");

            String currentotalname = currentName + "__" + myres.getString("VAL1") + "__" + myres.getString("VAL2") + "__" + myres.getString("VAL3");
            out += " ==R:" + currentotalname + "<br/> ";

            if (totalnames.contains(currentotalname)) {

                out += "==============<br/>" + currentotalname + "<br/> ";

                if (u.isAciInTrajectory(myres.getString("VAL4"), mod_id, scenario_id)) {
                    if (u.isAciActive(myres.getString("VAL4"), mod_id, scenario_id)) {

                        if (!don.contains(currentotalname)) {
                            testAci += myres.getString("VAL4") + ";";
                            testAci += myres.getString("VAL1") + "__";
                            processedAci.add(myres.getString("VAL4") + myres.getString("VAL1"));
                            don.add(currentotalname);

                            //  test += currentotalname;
                            counter++;

                            th_ELONGATION = 0;
                            th_THROUGHPUT = 0;

                            double val7 = 1000 / Double.parseDouble(myres.getString("VAL7"));

                            double val15 = 0d;
                            try {
                                val15 = 1000 / Double.parseDouble(myres.getString("VAL15"));

                            } catch (Exception sQLException) {
                            }

                            th_THROUGHPUT = val7 / val15;

                            th_ELONGATION = Double.parseDouble(myres.getString("VAL8"));

                            //  test += th_THROUGHPUT + "__" + th_ELONGATION + "<br />";
                            ResultSet myresc = getresFromDate("CACHE_A_PER_COMPONENT;" + currentName, "0;4", point, this.mod_id, scenario_id);

                            chr = 0;

                            while (myresc.next()) {

                                try {
                                    chr = Double.parseDouble(myresc.getString("VAL8"));
                                    //retdata+=chr+"<br>";
                                } catch (Exception numberFormatException) {
                                }

                            }

                            // retdata += currentName + "--th_THROUGHPUT:" + Double.toString(th_THROUGHPUT) + "--th_ELONGATION:" + Double.toString(th_ELONGATION) + "--chr:" + Double.toString(chr) + "--" + myres.getString("VAL4") +"^/^"+ myres.getString("VAL1")+"///<br/>";
                            retdata += currentName + "--" + Double.toString(th_THROUGHPUT) + "--" + Double.toString(th_ELONGATION) + "--" + Double.toString(chr) + "--" + myres.getString("VAL1") + "--" + myres.getString("VAL5") + "--" + myres.getString("VAL2") + "--" + myres.getString("VAL3") + "///";
                        }
                    }
                } else {
                    test2Aci += myres.getString("VAL4") + ";" + myres.getString("VAL1") + ";not in trajectory__";
                }
            } else {
                test2Aci += myres.getString("VAL4") + ";" + myres.getString("VAL1") + ";not in database__";
            }
        }

        db.closeCon();
        return out;
    }

    /**
     * Builds the list of ACI's in the model. To include an aci in the list it must be in the 
     * xactdb, i.e. have record in the <i>application_component_instance</i> table and inside a trajectory, i.e. have record
     * in the <i>aci_activity</i> table. The list of the aci contains the floowing values:
     * <ul>
     * <li>ACi name</li>
     * <li>Throughput value</li>
     * <li>Elongation value</li>
     * <li>CHR value</li>
     * <li>Server name</li>
     * <li>Component type</li>
     * <li>Complex name</li>
     * <li>Partition name</li>
     * <li>Partition name</li>
     * <li>Component id</li>
     * </ul>
     * 2 methods from the {@link utils} class are used as helpers, {@link utils#isAciIDInTrajectory} and {@link utils#isAciIdActive} 
     * @return @throws Exception
     * @throws SQLException
     */
    public String getAciList() throws Exception, SQLException {
        String retdata = "";
        

        ArrayList<String> totalnames = new ArrayList<String>();
        Connection openDBConNewcon = db.openDBConNewcon(DbInfo.connectionString);

        ResultSet acis = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "MODEL_ID=" + mod_id, openDBConNewcon);

        //db.openDBCon(lib.Options.DbInfo.connectionStringRes);
        double th_THROUGHPUT = 0;
        double th_ELONGATION = 0;
        double chr = 0;
        int counter = 0;
        while (acis.next()) {
            totalnames.add(acis.getString("ID"));
        }

        db.closeConNewcon(openDBConNewcon);

        ResultSet myres = getresFromDate("APPLICATION_COMPONENT", "0", point, this.mod_id, scenario_id);
        String out = "";
        //out=db.returnSQL;
        ArrayList<String> don = new ArrayList<String>();
        while (myres.next()) {

            String currentName = myres.getString("VAL4");

            String currentotalname = currentName + "__" + myres.getString("VAL1") + "__" + myres.getString("VAL2") + "__" + myres.getString("VAL3");
            //  out += " ==R:" + currentotalname + "<br/> ";

            if (totalnames.contains(myres.getString("VAL23"))) {

                //   
                if (u.isAciIDInTrajectory(myres.getString("VAL23"), mod_id, scenario_id)) {
                    if (u.isAciIdActive(myres.getString("VAL23"), mod_id, scenario_id)) {

                        if (!processedAci.contains(myres.getString("VAL4") + myres.getString("VAL1"))) {
                            System.out.println(currentName +" on node "+ myres.getString("VAL1"));
                            testAci += myres.getString("VAL4") + ";";
                            testAci += myres.getString("VAL1") + "__";
                            processedAci.add(myres.getString("VAL4") + myres.getString("VAL1"));
                            don.add(myres.getString("VAL23"));

                            //  test += currentotalname;
                            counter++;

                            th_ELONGATION = 0;
                            th_THROUGHPUT = 0;

                            double val7 = 0;
                            try {
                                val7 = 1000 / Double.parseDouble(myres.getString("VAL7"));
                            } catch (SQLException | NumberFormatException exception) {
                            }

                            double val15 = 0d;
                            try {
                                val15 = 1000 / Double.parseDouble(myres.getString("VAL15"));

                            } catch (Exception sQLException) {
                            }

                            th_THROUGHPUT = val7 / val15;

                            try {
                                th_ELONGATION = Double.parseDouble(myres.getString("VAL8"));
                            } catch (SQLException | NumberFormatException sQLException) {
                            }

                            //  test += th_THROUGHPUT + "__" + th_ELONGATION + "<br />";
                            ResultSet myresc = getresFromDate("CACHE_A_PER_COMPONENT;" + myres.getString("VAL23"), "0;9", point, this.mod_id, scenario_id);

                            chr = 0;

                            while (myresc.next()) {

                                try {
                                    chr = Double.parseDouble(myresc.getString("VAL8"));
                                    
                                } catch (Exception numberFormatException) {
                                }

                            }

                            retdata = currentName + "--" + Double.toString(th_THROUGHPUT) + "--" + Double.toString(th_ELONGATION) + "--" + Double.toString(chr) + "--" + myres.getString("VAL1") + "--" + myres.getString("VAL5") + "--" + myres.getString("VAL2") + "--" + myres.getString("VAL3") + "--" + myres.getString("VAL23") + "--" + myres.getString("VAL5") + "///";
                            System.out.println(retdata);
                            out += retdata ;
                        } else {
                        }
                    }
                } else {
                    test2Aci += myres.getString("VAL4") + ";" + myres.getString("VAL1") + ";not in trajectory__";
                }
            } else {
                test2Aci += myres.getString("VAL4") + ";" + myres.getString("VAL1") + ";not in database__";
            }
        }

        db.closeCon();
        return out;
    }

    /**
     * @deprecated 
     * not used right now
     *
     * @param id
     * @return
     * @throws SQLException
     * @throws ParseException
     */
    public double getDownTime(String id) throws SQLException, ParseException {
        /* db.openCon();
         boolean up = true;
         Date lfd = null;
         Date lud = null;
         int status = 0;
         int outs = 0;
         int ups = 0;
         long dsecs = 0l;
         Calendar rcal = Calendar.getInstance();
         Date endDate = rcal.getTime();
         Calendar ncal = Calendar.getInstance();
         ncal.add(Calendar.YEAR, -1);
         Date startDate = ncal.getTime();
         double retData = 0;
         SimpleDateFormat formatter;
         formatter = new SimpleDateFormat("yyyy-MM-dd HH:MM");
         String sqlenddate = formatter.format(endDate);
         String sqlstartdate = formatter.format(startDate);
         Calendar cal = Calendar.getInstance();

         Date d1 = cal.getTime();

         cal.add(Calendar.YEAR, -1);


         Date d2 = cal.getTime();



         ResultSet rs = db.getData(XMLDataModel.AVAILABILITY_EVENT_LOG_TABLENAME, "*", "  NODE_ID =" + id + " AND EVENT_DATETIME BETWEEN '" + sqlstartdate + "' AND '" + sqlenddate + "' ORDER BY EVENT_DATETIME");
         Calendar mcal = Calendar.getInstance();
         mcal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), 1, 0, 0, 0);
         startDate = mcal.getTime();
         String data = "";


         while (rs.next()) {

         int EVENT_TYPE = Integer.parseInt(rs.getString("EVENT_TYPE"));


         // DateFormat dt = DateFormat.getInstance();

         Date EVENT_DATETIME = formatter.parse(rs.getString("EVENT_DATETIME"));

         if (EVENT_DATETIME.after(d1)) {

         break;

         }
         if (EVENT_TYPE != 2 && EVENT_TYPE != 5) {

         retData++;



         }

         Date eTimeStamp = EVENT_DATETIME;

         Date wDate = d2;

         switch (EVENT_TYPE) {
         case 5:
         if (eTimeStamp.after((startDate))) {
         dsecs = 0l;
         wDate = eTimeStamp;
         }
         break;
         case 3:
         case 0:
         case 1:
         case 2:
         if (eTimeStamp.after(startDate)) {
         if (up) {
         wDate = eTimeStamp;
         lfd = eTimeStamp;
         outs++;
         }
         }
         up = false;
         break;
         case 4:
         if (eTimeStamp.after(startDate)) {
         if (!up) {
         dsecs += getTimeDiff(wDate, eTimeStamp);
         wDate = eTimeStamp;
         lud = eTimeStamp;
         ups++;
         }
         }
         up = true;
         break;
         }





         if (up) {
         status = 0;
         } else {
         dsecs += getTimeDiff(wDate, endDate);
         status = 2;
         }


         }


         */

        return 0;
    }

    /**
     * @deprecated 
     * not used right now
     *
     * @param id
     * @return
     * @throws SQLException
     * @throws ParseException
     */
    public double getDownTimeMonth(String id) throws SQLException, ParseException {

        boolean up = true;
        Date lfd = null;
        Date lud = null;
        int outs = 0;
        int ups = 0;
        long dsecs = 0l;

        double retData = 0;
        Calendar cal = Calendar.getInstance();
        Date d1 = cal.getTime();
        cal.add(Calendar.MONTH, -30);
        Date d2 = cal.getTime();

        int status = 0;

        ResultSet rs = db.getData(XMLDataModel.AVAILABILITY_EVENT_LOG_TABLENAME, "*", "NODE_ID=" + id);

        while (rs.next()) {

            int EVENT_TYPE = Integer.parseInt(rs.getString("EVENT_TYPE"));

            DateFormat dt = DateFormat.getInstance();

            Date EVENT_DATETIME = dt.parse(rs.getString("EVENT_DATETIME"));

            if (EVENT_DATETIME.after(d1)) {

                break;

            }
            if (EVENT_TYPE != 2 && EVENT_TYPE != 5) {

                retData++;

            }

            Date eTimeStamp = EVENT_DATETIME;
            Date startDate = d2;

            Date sDate = d2;
            Date endDate = d1;

            Date wDate = d2;

            switch (EVENT_TYPE) {
                case 5:
                    if (eTimeStamp.after((startDate))) {
                        dsecs = 0l;
                        wDate = eTimeStamp;
                    }
                    break;
                case 3:
                case 0:
                case 1:
                case 2:
                    if (eTimeStamp.after(startDate)) {
                        if (up) {
                            wDate = eTimeStamp;
                            lfd = eTimeStamp;
                            outs++;
                        }
                    }
                    up = false;
                    break;
                case 4:
                    if (eTimeStamp.after(startDate)) {
                        if (!up) {
                            dsecs += getTimeDiff(wDate, eTimeStamp);
                            wDate = eTimeStamp;
                            lud = eTimeStamp;
                            ups++;
                        }
                    }
                    up = true;
                    break;
            }

            if (up) {
                status = 0;
            } else {
                dsecs += getTimeDiff(wDate, endDate);
                status = 2;
            }

        }

        return dsecs;

    }

    /**
     * @deprecated 
     * not used right now
     *
     * @param sdate
     * @param edate
     * @return
     */
    public long getTimeDiff(Date sdate, Date edate) {

        Calendar scal = Calendar.getInstance();
        Calendar ecal = Calendar.getInstance();
        scal.setTime(sdate);
        ecal.setTime(edate);
        long diff = ecal.getTimeInMillis() - scal.getTimeInMillis();
        return diff / 1000;
    }

    /**
     *@deprecated 
     * @param list
     * @param avs
     * @return
     * @throws Exception
     */
    public double rexindex_bck(String list, String avs) throws Exception {

        double ret = 100;
        double temp = 1;
        double wlon = 1;
        double whttp = 1;
        double wchr = 1;
        double wavil = 1;
        if (this.pro_id != null) {
            String[] mypro = db.getRow(XMLDataModel.PROJECT_TABLENAME, "pid=" + this.pro_id.trim());
            wlon = Double.parseDouble(mypro[6]);
            whttp = Double.parseDouble(mypro[7]);
            wchr = Double.parseDouble(mypro[8]);
            wavil = Double.parseDouble(mypro[9]);
        }
        String[] lists = list.split("///");
        ArrayList<String> bkgs = new ArrayList<String>();

        double t = Double.MAX_VALUE;

        for (int i = 0; i < lists.length; i++) {

            temp = 1;
            String[] th_list = lists[i].split("--");

            String wtype = th_list[9];

            double th_THROUGHPUT = Double.parseDouble(th_list[1]);

            double th_ELONGATION = Double.parseDouble(th_list[2]);

            if (Double.parseDouble(wtype) < 3) {

                if (th_ELONGATION < 1) {
                    th_ELONGATION = 1;
                }

                //test += th_list[0] + "--" + Double.toString(th_THROUGHPUT) + "--" + Double.toString(th_ELONGATION) + "--" + th_list[3] + "<br/>";
                double val = Math.pow(th_ELONGATION, wlon);
                temp = temp * val;

                //test+=  temp+"<br />";
                if (!(th_THROUGHPUT == 0)) {
                    if (Double.isNaN(th_THROUGHPUT) || Double.isInfinite(th_THROUGHPUT)) {
                        th_THROUGHPUT = 1.0d;
                    }
                    val = Math.pow(th_THROUGHPUT, whttp);
                    temp = temp * val;

                }

                double chr = Double.parseDouble(th_list[3]);
                if (!(chr == 0)) {
                    val = Math.pow(chr / 100, wchr);
                    temp = temp * val;

                }

            }

            if (temp < t) {

                t = temp;

            }
            bkgs.add("" + temp);

        }

        if (avs != null) {
            String[] av_list = avs.split("///");

            for (int i = 0; i < av_list.length; i++) {
                String[] th_list = av_list[i].split("--");
                double downtime = Double.parseDouble(th_list[1]);
                double uptime = Double.parseDouble(th_list[2]);
                double value = Math.abs(downtime - uptime) / uptime;
                temp = temp * Math.pow(value, wavil);
            }
        }

        if (temp < ret) {
            ret = temp;
        }
        ret = t;
        ret = 1 - ret;

        ret = ret * 100;

        return roundToTwoDecimals(ret);

    }

    /**
     * Calculates the risk index of the project. The value is calculated by aggregating the list of the aci found from
     * the {@link #getAciList() } method and finding the aci that has the lowest value of the multiplication of throughput, elongation or chr value powered to
     * its weight value and. For the component to be eligible for the operation its type must be lower than 3.
     * @param list the aci list
     * @param avs list of down events
     * @return risk index value
     * @throws Exception
     */
    public double getRiskIndex(String list, String avs) throws Exception {

        double ret = 100;
        double temp = 1;
        double wlon = 1;
        double whttp = 1;
        double wchr = 1;
        double wavil = 1;
        if (this.pro_id != null) {
            String[] mypro = db.getRow(XMLDataModel.PROJECT_TABLENAME, "pid=" + this.pro_id.trim());
            wlon = Double.parseDouble(mypro[6]);
            whttp = Double.parseDouble(mypro[7]);
            wchr = Double.parseDouble(mypro[8]);
            wavil = Double.parseDouble(mypro[9]);
        }
        String[] lists = list.split("///");
        ArrayList<String> bkgs = new ArrayList<String>();

        double t = Double.MAX_VALUE;

        for (int i = 0; i < lists.length; i++) {

            temp = 1;
            String[] th_list = lists[i].split("--");

            if (th_list.length > 1) {

                String wtype = th_list[9];

                double th_THROUGHPUT = Double.parseDouble(th_list[1]);

                double th_ELONGATION = Double.parseDouble(th_list[2]);

                if (Double.parseDouble(wtype) < 3) {

                    if (th_ELONGATION < 1) {
                        th_ELONGATION = 1;
                    }

                    //test += th_list[0] + "--" + Double.toString(th_THROUGHPUT) + "--" + Double.toString(th_ELONGATION) + "--" + th_list[3] + "<br/>";
                    double val = Math.pow(th_ELONGATION, wlon);
                    temp = temp * val;

                    //test+=  temp+"<br />";
                    if (!(th_THROUGHPUT == 0)) {
                        if (Double.isNaN(th_THROUGHPUT) || Double.isInfinite(th_THROUGHPUT)) {
                            th_THROUGHPUT = 1.0d;
                        }
                        val = Math.pow(th_THROUGHPUT, whttp);
                        temp = temp * val;

                    }

                    double chr = Double.parseDouble(th_list[3]);
                    if (!(chr == 0)) {
                        val = Math.pow(chr / 100, wchr);
                        temp = temp * val;

                    }

                }

                if (temp < t) {

                    t = temp;

                }
                bkgs.add("" + temp);

            }
        }

        if (avs != null) {
            String[] av_list = avs.split("///");

            for (int i = 0; i < av_list.length; i++) {
                String[] th_list = av_list[i].split("--");
                double downtime = Double.parseDouble(th_list[1]);
                double uptime = Double.parseDouble(th_list[2]);
                double value = Math.abs(downtime - uptime) / uptime;
                temp = temp * Math.pow(value, wavil);
            }
        }

        if (temp < ret) {
            ret = temp;
        }
        ret = t;
        ret = 1 - ret;

        ret = ret * 100;

        this.out += ret;
        return roundToTwoDecimals(ret);

    }

    /**
     * @deprecated 
     * not used right now
     *
     * @return @throws SQLException
     * @throws ParseException
     */
    public String av_itmes() throws SQLException, ParseException {
        String returnData = null;

        double getDownTimeVar = 0;
        db.openCon();
        ResultSet myrs = db.getData(XMLDataModel.NODE_TABLENAME, "*", "MODEL_ID=" + this.mod_id);
        double xptime = 633600;
        double slg = 0.95;
        double fod = 120;
        boolean fo = false;
        while (myrs.next()) {

            if (!myrs.getString("TYPE").equalsIgnoreCase("HUMAN")) {

                String[] mynoesex = db.getRowNocon(XMLDataModel.NODE_EXT_TABLENAME, "ID=" + myrs.getString("ID"));
                if (mynoesex[0] != null) {
                    xptime = Double.parseDouble(mynoesex[12]);
                    slg = Double.parseDouble(mynoesex[11]);
                    fod = Double.parseDouble(mynoesex[10]);
                    fo = Boolean.parseBoolean(mynoesex[5]);

                }

                String myid = myrs.getString("ID");
                String myname = myrs.getString("Name");

                getDownTimeVar = getDownTime(myid);

                if (getDownTimeVar > 0) {
                    if (fo) {
                        getDownTimeVar = numberOfDownEvents(-30, myrs.getString("ID")) * fod;
                    }
                    returnData += myname + "--" + Double.toString(getDownTimeVar) + "--" + Double.toString(xptime) + "--" + Double.toString(slg) + "///";

                }

            }

        }
        db.closeCon();

        return returnData;
    }

    private double numberOfDownEvents(int i, String id) throws SQLException {
        double dif = 0;
        Calendar today = Calendar.getInstance();
        Calendar past = Calendar.getInstance();
        past.add(Calendar.DATE, i);
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("yyyy-MM-dd HH:MM");
        String sqlstartdate = formatter.format(today.getTime());
        String sqlenddate = formatter.format(past.getTime());

        ResultSet rs = db.getData(XMLDataModel.AVAILABILITY_EVENT_LOG_TABLENAME, "*", "  NODE_ID =" + id + " AND EVENT_DATETIME BETWEEN '" + sqlstartdate + "' AND '" + sqlenddate + "' ORDER BY EVENT_DATETIME");
        while (rs.next()) {
            int EVENT_TYPE = Integer.parseInt(rs.getString("EVENT_TYPE"));
            if (!(EVENT_TYPE == 2) && !(EVENT_TYPE == 5)) {
                dif++;
            }

        }
        return dif;
    }

    /**
     * round the passed double value into rounded to 2 decimal string.
     *
     * @param d the double value to round
     * @return the string representing the rounded value
     */
    public double roundToTwoDecimals(double d) {

        String dt = "" + d;

        if (dt.length() > 5) {

            dt = dt.substring(0, 5);

        }
        double output = 0;
        try {
            output = Double.parseDouble(dt);
        } catch (NumberFormatException numberFormatException) {
        }
        return output;
    }

    /**
     * finds the duration of the corporate. the value is equal to window
     * duration*window duration type
     *
     * @param modelId
     * @return
     */
    private double getduration(String modelId) {
        double duration = 0;
        String[] corporate = db.getRowNocon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + modelId);
        duration = Double.parseDouble(corporate[5]) * SECONDS_REFERENCE[Integer.parseInt(corporate[6])];
        return duration;
    }

    /**
     * finds the component with the highest cpu rate inside the server with the
     * highest utilization rate found in
     * {@link resultes#getEffciency() efficiency ratio} method.<br/> in this
     * method, batch components are neglected. if all components in the server
     * with the highest utilization rate are batch, then the server is removed
     * from servers map and the next highest server is used for the calculation.
     *
     * @return name of the component with the highest cpu rate.
     * @throws SQLException
     * @see resultes#findNextHieghestServer() findNextHieghestServer()
     */
    private String getComponentWithHighestRate() throws SQLException {
        String component = "";
        boolean processed = false;
        if(!allServers.isEmpty()){
        List<String> allAci = u.getAllAciInModel(mod_id);
       // System.out.println("current server="+serverAllName);
        ResultSet res3 = getresFromDate("APPLICATION_COMPONENT;" + serverAllName, "0;1;2;3", point, mod_id, scenario_id);
        while (res3.next()) {

            int type = Integer.parseInt(res3.getString("VAL5"));
          //  System.out.println("tyoe=" + type);
            if (type < 2) {
                processed = true;
                rate = Double.parseDouble(res3.getString("VAL6"));
                if (rate > current) {

                    if (allAci.contains(res3.getString("VAL23"))) {
                      //  System.out.println("here" + serverAllName);
                        current = rate;
                        serviceTime = Double.parseDouble(res3.getString("VAL15"));
                        cpuTime = Double.parseDouble(res3.getString("VAL13"));
                        elongation = Double.parseDouble(res3.getString("VAL8"));
                        responseTime = Double.parseDouble(res3.getString("VAL7"));
                        arrival = Double.parseDouble(res3.getString("VAL12"));
                        initialCost = Double.parseDouble(res3.getString("VAL13")) / Double.parseDouble(res3.getString("VAL15"));
                        component = res3.getString("VAL4");
                    }

                }
            }
            /* */
        } if (!processed) {
             allServers.remove(serverAllName);
             findNextHieghestServer();
             db.closeCon();
             return getComponentWithHighestRate();
             
             }else{
        db.closeCon();
        return component;
        }
        }
        return component;
    }

    /**
     * iterates through the servers map and finds the server with highest
     * utilization rate.
     */
    private void findNextHieghestServer() {

        double currentRate = 0;
        for (String key : list) {
            if(allServers.containsKey(key)){
            double r = allServers.get(key);
            if (r > currentRate) {
                currentRate = r;
                serverAllName = key;
            }
        }
        }
    }

    /**
     * Used by {@link #getBatchEfficiency() } method to determine if the model has any batch components or not.
     * @return true if all trajectories are batch and false otherwise.
     * @throws SQLException 
     */
    private boolean allBatch() throws SQLException {
        boolean allBatch = true;
        db.openCon();
        ResultSet allBP = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID=" + mod_id);
        while (allBP.next()) {
            String selector = allBP.getString("SELECTOR");
            if (selector.equals("0")) {
                allBatch = false;
            }
        }
        db.closeCon();
        return allBatch;
    }

}
    