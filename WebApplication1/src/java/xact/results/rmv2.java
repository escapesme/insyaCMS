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
 *
 * @author ismail
 */
public class rmv2 {

    String mod_id = "";
    String sid = "";
    String point = "";
    String resultId = "";
    double totalUtilization = 0;
    public String test = "";
    Connection con = null;
    Connection conRes = null;

    public rmv2(String mymoid, String mysid, String mypoint) {
        mod_id = mymoid;
        sid = mysid;
        point = mypoint;
        resultId = Utils.getResultID(mod_id, sid);

    }

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
    public static final int SECONDS_REFERENCE[] = new int[]{60 * 60 * 24, 60 * 60, 60, 1};
    HashMap<String, Double> conso_vals = new HashMap<String, Double>();

    private String getModName(String mod_id, String sid) {

        String data = "";

        if (sid.equals("0")) {
            data = db.getRowNewCon(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id, con)[4];
        } else {
            data = db.getRowNewCon(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid, con)[3];
        }
        return data;
    }

    public String getCOMPLEX(String id) throws SQLException {
        String retdata = "";
        ResultSet myrs = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "NODE_ID=" + id, con);
        String my = "";
        // retdata += "<option></option>";
        while (myrs.next()) {
            String data = myrs.getString("COMPLEX").split("->")[0].replace("Complex", "");
            if (!my.equals(data)) {
                my = data;
                retdata += "<option value='" + my + "'>" + my + "</option>";
            }
        }
        return retdata;
    }

    public String getParttion(String id, String Complex) throws SQLException {
        ArrayList<String> ol = new ArrayList<String>();
        String retdata = "";
        if (!Complex.equals("")) {
            ResultSet myrs = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "NODE_ID='" + id + "' and Complex like '%Complex" + Complex + "%'", con);
            String my = "";
            // retdata += "<option></option>";
            while (myrs.next()) {
                String data = myrs.getString("COMPLEX").split("->")[1].replace("Partition", "");
                if (!my.equals(data)) {
                    my = data.split("/")[1];
                    if (!ol.contains(my)) {
                        ol.add(my);
                        retdata += "<option value='" + data + "'>" + my + "</option>";
                    }
                }
            }
        }
        return retdata;
    }

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
        while (myrs.next()) {
            if (myrs.getString("MODEL_FILENAME") != null && !"null".equalsIgnoreCase(myrs.getString("MODEL_FILENAME"))) {
                if (myrs.getString("REFERENCE").equalsIgnoreCase("1")) {
                    retdata += "<option value='" + myrs.getString("id") + "'>" + myrs.getString("hostname") + "</option>";
                }
            }
        }

        return retdata;
    }

    public String getTotalCom(String type, String id, String par, String com) throws Exception {

        String data = "<br/>";
        double cpu = 0;
        double cpum = 0;



        if (type.equalsIgnoreCase("server")) {
            cpu = getServerconso(id, type, par.split("/")[1], com);
            cpum = getServerconsomax(id, type, par.split("/")[1], com);

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

    private ArrayList<String> getallbbs(ArrayList<String> ids) throws SQLException {

db.openConres();
        ArrayList<String> bbs = new ArrayList<String>();
        for (String aciId:ids) {
            //bbs.add("gggg");
           
            ResultSet acs = db.getData(XMLDataModel.COMP2TRAJ, "*", "AcI_ID=" + aciId);
            // bbs.add("gggg");



            while (acs.next()) {
                String buid = acs.getString("BP_ID");


                if (!bbs.contains(buid)) {



                    bbs.add(buid);

                }

            }
            db.closeCon();
        }







        db.closeCon();



        return bbs;
    }

    //request.getParameter("part"), request.getParameter("ty"), request.getParameter("mac"),request.getParameter("modid")
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
                complex = "Complex" + com + "->Partition" + part;


                acResultSet = db.getData(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "NODE_ID= '" + id + "' AND COMPLEX='" + complex + "'");

                String[] part1 = part.split("/");

                String par = part1[1];

                serverConsume = getServerconso(id, ty, par, com);
                serverConsumemax = getServerconsomax(id, ty, par, com);

            } else {

                acResultSet = db.getData(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "NODE_ID= '" + id + "'");
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

    

    private String getbbname(String get) {


        String name = db.getRowNewCon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + get, con)[3];
        return name;
    }

    public ArrayList<String> getalacs(String get, String nod_id, String mod_id, String sid) throws SQLException {
        ArrayList<String> acs = new ArrayList<String>();

        utils u = new utils();
        ResultSet Acrs = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + get, con);
        while (Acrs.next()) {
            if (!Acrs.getString("TAG").equalsIgnoreCase("start") && !Acrs.getString("TAG").equalsIgnoreCase("end")) {
                if (Acrs.getString("TAG").equalsIgnoreCase("activity")) {
                    if (!sid.equals("0") && !sid.equals("")) {
                        if (u.getISScenarioPram(mod_id, sid, Acrs.getString("ID"), "ACTIVE_STATUS").equals("-1")) {
                            acs.addAll(getacfromactivity(Acrs.getString("ID"), nod_id));
                        }

                    } else {
                        acs.addAll(getacfromactivity(Acrs.getString("ID"), nod_id));
                    }


                } else {
                    try {
                        acs.addAll(getalacs(Acrs.getString("ID"), nod_id, mod_id, sid));
                    } catch (Exception exception) {
                    }
                }
            }
        }

        return acs;
    }

    private Collection<String> getacfromactivity(String string, String node_id) throws SQLException {


        ArrayList<String> acs = new ArrayList<String>();
        int aciCount = db.getRowCountNewcon(XMLDataModel.ACI2ACT_TABLENAME, "SERVICE_ACTIVITY_ID=" + string, con);


        if (aciCount > 0) {
            ResultSet acid = db.getDataNeWcon(XMLDataModel.ACI2ACT_TABLENAME, "*", "SERVICE_ACTIVITY_ID=" + string, con);
            while (acid.next()) {

                String[] act2 = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID='" + acid.getString("AC_INST_ID") + "'", con);
                String[] act = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + act2[3] + "' and NODE_ID='" + node_id + "'", con);

                if (act[0] != null && !act[0].equals("") && !act[0].equalsIgnoreCase("null")) {


                    acs.add(act[0] + "__" + string);

                }

            }
        } else {
            ResultSet acid = db.getDataNeWcon(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "ACTIVITY_ID=" + string, con);
            while (acid.next()) {
                String[] act = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + acid.getString("AC_ID") + "' and NODE_ID='" + node_id + "'", con);


                if (act[0] != null && !act[0].equals("") && !act[0].equalsIgnoreCase("null")) {


                    acs.add(act[0] + "__" + string);

                }

            }
        }
        // db.closeCon();
        return acs;
    }

    public BigDecimal compCAR(String ID, String MID, String tag, String scenarioid) throws SQLException {
        BigDecimal returnData = new BigDecimal(BigInteger.ZERO);



        if (tag.equalsIgnoreCase("be_bp")) {

            ResultSet mybe_bp = db.getDataNeWcon(XMLDataModel.BE_BP_TABLENAME, "*", "BP_TO_ID=" + ID + " AND MODEL_ID=" + MID, con);

            while (mybe_bp.next()) {
                BigDecimal uf = new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));
                uf = new BigDecimal(getSCENARIOPram(MID, scenarioid, mybe_bp.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Be_Bp"));
                // return new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));

                returnData = returnData.add(compCAR(mybe_bp.getString("BE_FROM_ID"), MID, "be_be", scenarioid).multiply(uf));
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






                    beNumber = beNumber.add(compCAR(id, MID, "be_be", scenarioid).multiply(uf));
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

    String getClassNAME(String Type) {





        String retunData = "";
        if (Type.equalsIgnoreCase("corporate")) {

            retunData = "com.acrtek.xact.data.bo.BoCorporate";

        } else if (Type.equalsIgnoreCase("CORPORATE_BE")) {

            retunData = "com.acrtek.xact.data.bo.BoCorporateToBE";

        } else if (Type.equalsIgnoreCase("business_entity")) {

            retunData = "com.acrtek.xact.data.bo.BoBusinessEntity";

        } else if (Type.equalsIgnoreCase("be_be")) {

            retunData = "com.acrtek.xact.data.bo.BoBEToBE";

        } else if (Type.equalsIgnoreCase("BE_BP")) {

            retunData = "com.acrtek.xact.data.bo.BoBEToBP";

        } else if (Type.equalsIgnoreCase("group_node")) {

            retunData = "com.acrtek.xact.data.bo.BoNode";

        } else if (Type.equalsIgnoreCase("corporate")) {

            retunData = "com.acrtek.xact.data.bo.BoCorporate";

        } else if (Type.equalsIgnoreCase("corporate_be")) {

            retunData = "com.acrtek.xact.data.bo.BoCorporateToBE";

        } else if (Type.equalsIgnoreCase("message")) {

            retunData = "com.acrtek.xact.data.bo.BoMessage";

        } else if (Type.equalsIgnoreCase("SERVICE_PROCESS_LINKS")) {

            retunData = "com.acrtek.xact.data.bo.BoSPVLine";

        } else if (Type.equalsIgnoreCase("Insertion")) {

            retunData = "com.acrtek.xact.data.bo.BoInsertion";

        }






        return retunData;
    }

    public String getSCENARIOPram(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER, String OLDVAL, String Type) {
        String retunData = "";
        retunData = OLDVAL;

        String OBJECT_CLASS = getClassNAME(Type);

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

    public String createResourceTable(String id, String mac, String part, String acr, String Type) throws SQLException, ParseException {


        String data = "";

        String complex = "Complex" + mac + "->Partition" + part;
        //data+="Complex"+mac+"->Partition"+part;

        ArrayList<String> ids = new ArrayList<String>();
        ResultSet acs = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "NODE_ID=" + id + " AND COMPLEX='" + complex + "'", con);


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
                String path = getbbname(bbs.get(i)) + ";" + getservername(id);

                String where = "TPR_KEY like '%" + bbs.get(i) + "%' and RESULT_ID='" + mid22 + "' and MOD_NAME='" + name.trim() + "_" + this.point + "'";
                String where2 = "SP_ID= '" + bbs.get(i) + "' and MODEL_ID='" + mid22 + "' and NAME='" + name.trim() + "_" + this.point + "'";
                String where3 = "ITERATION= '" + this.point + "' and RESULT_ID='" + mid22 + "' and PATH='" + path + "'";
                String[] oneRow = db.getRowNewCon(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, where, conRes);

                String[] oneRow2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, where2, conRes);
                String[] oneRow3 = db.getRowNewCon(XMLDataModel.new_svr_use_results_TABLENAME, where3, conRes);


                if (oneRow[8] != null) {
                    ar = oneRow[8];
                }
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

                ArrayList<String> acid = getalacs(bbs.get(i), id, mod_id, sid);


                DecimalFormat df = new DecimalFormat("#.##");

                ar = df.format(compCAR(bbs.get(i), mod_id, "be_bp", sid).doubleValue());




                data += getAllAcValues(acid, mod_id, sid, mac, part, acr, id, Type, tp, resTime, A1, ar, oneRow3) + "</tr>";
                ArrayList<String> myr = new ArrayList<String>();

                for (int j = 0; j < acid.size(); j++) {
                    //data+="<br> in for";
                    String[] ids2 = acid.get(j).split("__");
                    if (ids.contains(ids2[0])) {
                        String cnam = getacname(ids2[0]);

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
        String partition = part.split("/")[1];
        double dt = 0;
        String path = "";


        String serverName = getservernamebyid(ids[0]);
        String componentName = getacname(ids[0]);
        path = getbbname(bbid);
        path += ";%" + serverName + ";" + componentName;

        String data = "";
//        data += path;
        String data2 = "VAL0='APPLICATION_COMPONENT' AND VAL1='" + serverName + "' AND VAL4='" + componentName + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
        String data63 = "VAL0='CACHE_A_PER_COMPONENT' AND VAL1='" + serverName + "' AND VAL4='" + componentName + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
        String data64 = "VAL0='FLOW_COMP'  AND VAL2='" + componentName + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
        String recourcedata = "ITERATION= '" + this.point + "' and RESULT_ID='" + resultId + "' and PATH like'" + path + "' AND COMPLEX=" + com + " AND PARTITION=" + partition;



        String[] resultrow = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data2, conRes);
        String[] resultchr = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data63, conRes);
        String[] flowResult = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, data64, conRes);
        ResultSet resourceResult = db.getDataNeWcon(XMLDataModel.new_svr_use_results_TABLENAME, "*", recourcedata, conRes);

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
        String dd2 = convertToDHMS(ddd1);
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

            ResultSet acs = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "ID=" + combinedId[0] + " AND COMPLEX='" + complex + "'", con);

            if (acs.next()) {
                String name = getModName(mod_id, sid);
                String data2 = "VAL0='APPLICATION_COMPONENT' AND VAL1='" + getservernamebyid(combinedId[0]) + "' AND VAL4='" + getacname(combinedId[0]) + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
                String data63 = "VAL0='CACHE_A_PER_COMPONENT' AND VAL1='" + getservernamebyid(ids.get(i)) + "' AND VAL4='" + getacname(combinedId[0]) + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;
                String data64 = "VAL0='FLOW_COMP'  AND VAL2='" + getacname(combinedId[0]) + "' and MOD_NAME='" + name.trim() + "_" + this.point + "' and RESULT_ID=" + resultId;

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
                    if (!resultrow[11].equalsIgnoreCase("null")) {
                        if (rt < Double.parseDouble(resultrow[11])) {
                            rt = Double.parseDouble(resultrow[11]);
                        }
                    }
                }
                if (resultrow[12] != null) {
                    if (!resultrow[12].equalsIgnoreCase("null")) {
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


        retdata += "<td style=\"text-align:center\">" + df.format(through) + "(" + ar + ")</td><td style=\"text-align:center\">" + convertToDHMS(response) + "</td><td style=\"text-align:center\">" + dd3 + "</td><td style=\"text-align:center\">" + df.format(elon) + "</td><td style=\"text-align:center\">" + av + "</td><td style=\"text-align:center\">" + df.format(dis) + "</td><td style=\"text-align:center\">" + inc + "</td>";

        // data += "<td>" + resultrow[14] + "</td><td>" + resultrow[11] + "</td><td>" +resultrow[10]  + "</td><td>" + resultrow[12] + "</td><td>" + dt + "</td><td>" + dis + "</td><td>" + inc + "</td>";



        return retdata;


    }

    public String getacname(String get) {
        String fullname = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + get + "'", con)[6];
        //String name = fullname.substring(fullname.lastIndexOf('^') + 1, fullname.length());
        return fullname.split("/")[0].replace("^", "");
    }

    public String getacnameNoCon(String get) {
        String fullname = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + get + "'")[6];
        //String name = fullname.substring(fullname.lastIndexOf('^') + 1, fullname.length());
        return fullname.split("/")[0].replace("^", "");
    }

    private String getservernamebyid(String id) {
        String fullname = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID='" + id + "'", con)[6];
        return fullname.split("/")[1].replace("^", "");
    }

    private String getservername(String id) {
        String fullname = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NODE_ID='" + id + "'", con)[6];

        return fullname.split("/")[1].replace("^", "");
    }

    public double get_component_result(String vaL12, String acname, String servername, String id) {
        double val = 0;
        String ModelName = getModelName(id);

        db.openConres();
        if (acname != null && !"".equals(acname) && servername != null && !"".equals(servername)) {
            String value = db.getValueNocon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, vaL12, "VAL0='APPLICATION_COMPONENT' AND MOD_NAME='" + ModelName + "' AND VAL4='" + acname + "' AND VAL1='" + servername + "' and RESULT_ID=" + resultId);
            if (value != null && !"".equals(value.trim()) && !"null".equals(value.trim())) {
                val = Double.parseDouble(value.trim());
            }
        }
        db.closeCon();
        return val;
    }

    private double getServerconso(String id, String ty, String part, String com) {
        double cons = 0;

        String daa = getservername(id);
        String model_name = getModName(mod_id, sid) + "_" + point;


        test += "MOD_NAME='" + model_name.trim() + "' AND VAL0='PARTITION_CPU_RATE' AND VAL2='" + com + "' AND VAL1='" + daa + "' and RESULT_ID=" + resultId + " AND VAL3='" + part + "'";
        if (ty.equalsIgnoreCase("Server") && !part.equalsIgnoreCase("") && !com.equalsIgnoreCase("")) {

            // String where ="VAL0='PARTITION_CPU_RATE' AND VAL2='" + com + "' AND VAL1='" + getservername(id) + "' ";

            String[] res_row = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "MOD_NAME='" + model_name.trim() + "' AND VAL0='PARTITION_CPU_RATE' AND VAL2='" + com + "' AND VAL1='" + daa + "' and RESULT_ID=" + resultId + " AND VAL3='" + part + "'", conRes);

            if (res_row[8] != null) {
                if (!res_row[8].equalsIgnoreCase("null")) {
                    cons = Double.parseDouble(res_row[8]);
                }
            }

        } else if (part.equalsIgnoreCase("") && !ty.equalsIgnoreCase("") && com.equalsIgnoreCase("")) {

            String where2 = " MOD_NAME='" + model_name + "' AND VAL0='COMPLEX_CPU_RATE'  AND VAL1='" + daa + "' and RESULT_ID=" + resultId;
            String[] res_row = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, where2, conRes);
            cons = Double.parseDouble(res_row[7]);

        }

        return cons;
    }

    private double getServerconsomax(String id, String ty, String part, String com) {
        double cons = 0;
        String daa = getservername(id);
        String model_name = getModName(mod_id, sid) + "_" + point;

        if (ty.equalsIgnoreCase("Server") && !part.equalsIgnoreCase("") && !com.equalsIgnoreCase("")) {

            String[] res_row = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "MOD_NAME='" + model_name.trim() + "' AND VAL0='PARTITION_CPU_RATE' AND VAL2='" + com + "' AND VAL1='" + daa + "' AND VAL3='" + part + "' and RESULT_ID=" + resultId, conRes);
            if (res_row[9] != null) {
                if (!res_row[9].equalsIgnoreCase("null")) {
                    cons = Double.parseDouble(res_row[9]);
                }
            }

        } else if (!part.equalsIgnoreCase("") && ty.equalsIgnoreCase("") && com.equalsIgnoreCase("")) {
            String[] res_row = db.getRowNewCon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, " MOD_NAME='" + model_name + "' AND VAL0='COMPLEX_CPU_RATE'  AND VAL1='" + daa + "' and RESULT_ID=" + resultId, conRes);
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

    public static String convertToDHMS(double value) {
        String DHMS;
        double dDay;
        double dHour;
        double dMin;
        double dSec;
        BigDecimal hrsBD = new BigDecimal(86400);
        BigDecimal minBD = new BigDecimal(3600);
        BigDecimal secBD = new BigDecimal(60);

        NumberFormat nf0 = NumberFormat.getInstance(Locale.US);
        nf0.setMaximumFractionDigits(0);
        nf0.setMinimumFractionDigits(0);
        nf0.setMinimumIntegerDigits(2);

        NumberFormat nf2 = NumberFormat.getInstance(Locale.US);
        nf2.setMaximumFractionDigits(4);
        nf2.setMinimumFractionDigits(4);
        nf2.setMinimumIntegerDigits(2);

        BigDecimal valDB = new BigDecimal(value).setScale(18, RoundingMode.DOWN);
        BigDecimal day = valDB.divide(hrsBD, 18, RoundingMode.DOWN);
//        BigDecimal day = new BigDecimal(value / 86400).setScale(18, RoundingMode.DOWN);
        day = day.setScale(0, BigDecimal.ROUND_DOWN);
        dDay = day.doubleValue();

        BigDecimal hour = valDB.remainder(hrsBD).divide(minBD, 18, RoundingMode.DOWN);
//        BigDecimal hour = new BigDecimal((value % 86400) / 3600).setScale(18, RoundingMode.DOWN);
        hour = hour.setScale(0, BigDecimal.ROUND_DOWN);
        dHour = hour.doubleValue();

        BigDecimal min = valDB.remainder(new BigDecimal(86400)).remainder(minBD).divide(secBD, 18, RoundingMode.DOWN);
//        BigDecimal min = new BigDecimal((value % 86400 % 3600) / 60).setScale(18, RoundingMode.DOWN);
        min = min.setScale(0, BigDecimal.ROUND_DOWN);
        dMin = min.doubleValue();

        BigDecimal sec = valDB.remainder(hrsBD).remainder(minBD).remainder(secBD).setScale(18, RoundingMode.DOWN);
//        BigDecimal sec = new BigDecimal((value % 86400 % 3600) % 60).setScale(18, RoundingMode.DOWN);
        sec = sec.setScale(2, BigDecimal.ROUND_DOWN);
        dSec = sec.doubleValue();

        if (dDay >= 1) {
            DHMS = nf0.format(day) + "d " + nf0.format(hour) + "h " + nf0.format(min) + "mn " + nf2.format(sec) + "s";
        } else if (dHour >= 1) {
            DHMS = nf0.format(hour) + "h " + nf0.format(min) + "mn " + nf2.format(sec) + "s";
        } else if (dMin >= 1) {
            DHMS = nf0.format(min) + "mn " + nf2.format(sec) + "s";
        } else {
            DHMS = nf2.format(sec) + "s";
        }

        return DHMS;
    }

    private String getParentName(String id) throws SQLException {
        db.openCon();
        String path = "";
        ResultSet acid = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "ID=" + id);
        while (acid.next()) {
            String[] datarow = db.getRowNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + acid.getString("Parent_ID"));
            if (datarow[2] != null) {
                path += getParentName(datarow[0]);
                path += ";" + datarow[2];

            }
        }
        db.closeCon();
        return path;
    }
}
