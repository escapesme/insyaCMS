/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import lib.Options.XMLDataModel;
import lib.tools.Utils;

/**
 *
 * @author ismail
 */
public class ArrivalRateCalculator {

    lib.engine.db.operations DB = new lib.engine.db.operations();
    public String Teststring = "";
    ArrayList<String> processed = new ArrayList<String>();
    int count = 0;

    public BigDecimal compSAR(String ID, String MID, String scenarioid) throws SQLException {

        BigDecimal returnData = new BigDecimal(BigInteger.ZERO);

        String[] myTag = DB.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "id=" + ID + " AND MODEL_ID=" + MID);
        int[] SECONDS_REFERENCE = {60 * 60 * 24, 60 * 60, 60, 1};
        String[] mycorporate = DB.getRow(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + MID);
        String test = "";

        DB.openCon();

        String TAG = myTag[1];

        if (TAG.equalsIgnoreCase("activity")) {

            //returnData = returnData.add(new BigDecimal(ID));
            ResultSet mylinkes = DB.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "TO_ID=" + ID + " AND MODEL_ID=" + MID);

            while (mylinkes.next()) {

                String[] th_nodid = DB.getRowNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "id=" + mylinkes.getString("FROM_ID") + " AND MODEL_ID=" + MID);

                BigDecimal UTILIZATION_FREQUENCY = new BigDecimal(mylinkes.getString("UTILIZATION_FREQUENCY"));
                UTILIZATION_FREQUENCY = new BigDecimal(getSCENARIOPram(MID, scenarioid, mylinkes.getString("ID"), "UTILIZATION_FREQUENCY", UTILIZATION_FREQUENCY.toString(), "SERVICE_PROCESS_LINKS"));
                String ch_id = th_nodid[0];

                if (th_nodid[1] != null) {

                    if (th_nodid[1].equalsIgnoreCase("start")) {
                        ch_id = mylinkes.getString("PARENT_ID");
                        //Teststring += ch_id;
                    }
                    if ("delay".equalsIgnoreCase(Utils.getNodeValue(ch_id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "type"))) {
                        returnData = compSAR(ch_id, MID, scenarioid);
                    } else {

                        returnData = returnData.add(compSAR(ch_id, MID, scenarioid).multiply(UTILIZATION_FREQUENCY));
                    // Teststring+="<br>number="+returnData;

                    }

                }

            }

        } else if (TAG.equalsIgnoreCase("service")) {

            ResultSet myescx = DB.getData(XMLDataModel.S2S_XREF_TABLENAME, "*", "S2S_ID=" + ID + " AND MODEL_ID=" + MID);
            //Teststring += "S2S_ID=" + ID + " AND MODEL_ID=" + MID;

            int Rowss2s = DB.getRowCountNocon(XMLDataModel.S2S_XREF_TABLENAME, "S2S_ID=" + ID + " AND MODEL_ID=" + MID);
            if (Rowss2s < 1) {

                ResultSet mylinkes = DB.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "TO_ID=" + ID + " AND MODEL_ID=" + MID);

                while (mylinkes.next()) {

                    String[] th_nodid = DB.getRowNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "id=" + mylinkes.getString("FROM_ID") + " AND MODEL_ID=" + MID);
                    String ch_id = th_nodid[0];

                    BigDecimal UTILIZATION_FREQUENCY = BigDecimal.ONE;
                    if (th_nodid[1].equalsIgnoreCase("start")) {
                        ch_id = mylinkes.getString("PARENT_ID");
                    }

                    returnData = returnData.add(compSAR(ch_id, MID, scenarioid).multiply(UTILIZATION_FREQUENCY));

                }

            } else {

                while (myescx.next()) {

                    if (myescx.getString("TYPE").equalsIgnoreCase("0")) {

                        count++;
                        String[] th_nodid = DB.getRowNocon(XMLDataModel.MESSAGE_TABLENAME, "ID=" + myescx.getString("OBJECT_ID") + " AND MODEL_ID=" + MID);
                        String uf = th_nodid[7];
                        // Teststring += "<br>" + myescx.getString("OBJECT_ID") + "firsr id<br> number of reuslts=" + count + "<br>";
                        //uf=getSCENARIOPram(MID, scenarioid,th_nodid[0], "UTILIZATION_FREQUENCY", uf, "message");
                        int ufScenario = DB.getRowCountNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "MODEL_ID=" + MID + " and SCENARIO_ID=" + scenarioid + " and OBJECT_ID=" + th_nodid[0]);
                        //Teststring+="number of row for "+th_nodid[0]+ "is<br>"+ufScenario+"<br>";
                        if (ufScenario > 0) {
                            uf = DB.getRowNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "MODEL_ID=" + MID + " and SCENARIO_ID=" + scenarioid + " and OBJECT_ID=" + th_nodid[0])[6];

                        }

                        ResultSet myecxref = DB.getData(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "ACTIVITY_ID=" + th_nodid[3] + " AND MODEL_ID=" + MID);
                        BigDecimal returnData11 = compSAR(th_nodid[3], MID, scenarioid);

                        //return returnData11;
                        //
                        double ALL = 0;

                        while (myecxref.next()) {

                            ALL += Double.parseDouble(myecxref.getString("UTILIZATION_FREQUENCY"));

                        }
                        // Teststring += "<br> utlization =" + ALL + "<br>";

                        returnData11 = returnData11.multiply(new BigDecimal(ALL));

                        returnData = returnData.add((returnData11).multiply(new BigDecimal(uf)));

                    }

                }

            }

        } else if (TAG.equalsIgnoreCase("task") || TAG.equalsIgnoreCase("process") || TAG.equalsIgnoreCase("component")) {

            ResultSet mylinkes = DB.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "TO_ID=" + ID + " AND MODEL_ID=" + MID);

            while (mylinkes.next()) {

                //Teststring+="contains"+ processed.contains(mylinkes.getString("FROM_ID"));
                //Teststring+="processes so far "+Arrays.deepToString(processed.toArray());
                String[] th_nodid = DB.getRowNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "id=" + mylinkes.getString("FROM_ID") + " AND MODEL_ID=" + MID);
//Teststring+="TO_ID=" + ID + " AND MODEL_ID=" + MID+" and from_id="+mylinkes.getString("FROM_ID")+"<br>";

                BigDecimal UTILIZATION_FREQUENCY = new BigDecimal(mylinkes.getString("UTILIZATION_FREQUENCY"));

                UTILIZATION_FREQUENCY = new BigDecimal(getSCENARIOPram(MID, scenarioid, mylinkes.getString("ID"), "UTILIZATION_FREQUENCY", UTILIZATION_FREQUENCY.toString(), "SERVICE_PROCESS_LINKS"));

                if (th_nodid[1].equalsIgnoreCase("service")) {
                    UTILIZATION_FREQUENCY = BigDecimal.ONE;

                }

                String ch_id = th_nodid[0];

                if (th_nodid[1].equalsIgnoreCase("start")) {

                    ch_id = mylinkes.getString("PARENT_ID");
                    if (TAG.equalsIgnoreCase("process")) {
                        returnData = returnData.add(compCAR(ch_id, MID, "be_bp", scenarioid).multiply(UTILIZATION_FREQUENCY));
                        // return UTILIZATION_FREQUENCY;

                    } else {

                        returnData = returnData.add(compSAR(ch_id, MID, scenarioid).multiply(UTILIZATION_FREQUENCY));
                    }

                } else {

                    returnData = returnData.add(compSAR(ch_id, MID, scenarioid).multiply(UTILIZATION_FREQUENCY));
                    // Teststring += "<br>id=" + ch_id + " number gotten=" + returnData;

                }

            }
        }

        //DB.closeCon();
        return returnData;
    }

    public String compCARbak(String ID, String MID, String tag, String scenarioid) throws SQLException {
        BigDecimal returnData = new BigDecimal(BigInteger.ZERO);
        String mreturnData = "";

        DB.openCon();
        if (tag.equalsIgnoreCase("be_bp")) {
            ResultSet mybe_bp = DB.getData(XMLDataModel.BE_BP_TABLENAME, "*", "BP_TO_ID=" + ID + " AND MODEL_ID=" + MID);

            while (mybe_bp.next()) {
                BigDecimal uf = new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));
                uf = new BigDecimal(getSCENARIOPram(MID, scenarioid, mybe_bp.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Be_bp"));
                returnData = returnData.add(compCAR(mybe_bp.getString("BE_FROM_ID"), MID, "be_be", scenarioid).multiply(uf));
                String id = mybe_bp.getString("BE_FROM_ID");
                //Teststring += "be id=" + id + "<br>";

            }
        }

        if (tag.equalsIgnoreCase("be_be")) {

            ResultSet mybe_bp = DB.getData(XMLDataModel.BE_BE_TABLENAME, "*", "BE_TO_ID=" + ID + " AND MODEL_ID=" + MID);
            String[] mycorporate = DB.getRowNocon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "id=" + ID + " AND MODEL_ID=" + MID);
            String Number = mycorporate[4];
            Number = getSCENARIOPram(MID, scenarioid, mycorporate[0], "NUMBER", Number, "BUSINESS_ENTITY");
            BigDecimal beNumber = new BigDecimal(Number);
            //  Teststring += "<br><br>" + beNumber;
            if (beNumber.compareTo(BigDecimal.ZERO) < 0) {
                beNumber = BigDecimal.ZERO;
            }

            if (beNumber.compareTo(BigDecimal.ZERO) > 0) {
                return beNumber.toString();
            } else {
                while (mybe_bp.next()) {

                    BigDecimal uf = new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));

                    uf = new BigDecimal(getSCENARIOPram(MID, scenarioid, mybe_bp.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Be_Be"));

                    String id = mybe_bp.getString("BE_FROM_ID");

                    beNumber = beNumber.add(compCAR(id, MID, "be_be", scenarioid).multiply(uf));
                    returnData = beNumber;
                    /*
                     * Teststring+="<br>"+returnData;
                     */

                }
                DB.closeCon();

                DB.openCon();
                ResultSet mycorporate_be = DB.getData(XMLDataModel.CORPORATE_BE_TABLENAME, "*", " BE_TO_ID=" + ID + " AND MODEL_ID=" + MID);

                mreturnData += returnData;

                // Teststring += "found corp link <br>";
                while (mycorporate_be.next()) {

                    String[] mycorporate2 = DB.getRowNocon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + MID);
                    String Number2 = mycorporate2[3];
                    mreturnData += Number2;
                    Number2 = getSCENARIOPram(MID, scenarioid, mycorporate[0], "NUMBER", Number2, "CORPORATE");
                    mreturnData += "<br>" + Number2 + "<br>";
                    BigDecimal uf = new BigDecimal(mycorporate_be.getString("UTILIZATION_FREQUENCY"));
                    uf = new BigDecimal(getSCENARIOPram(MID, scenarioid, mycorporate_be.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Corporate_be"));
                    mreturnData += "<br>" + uf;
                    double all = Double.parseDouble(Number2) * uf.doubleValue();
                    //Teststring+= "number"+all;

                    returnData = returnData.add(new BigDecimal(all));
                    mreturnData += "<br> returndata=" + returnData;

                }

            }

        }

        if (tag.equalsIgnoreCase("insertion")) {
            String[] service_insertion = DB.getRowNocon("service_insertion", "id=" + ID + " AND MODEL_ID=" + MID);
            returnData = returnData.add(new BigDecimal(service_insertion[10]));
        }

        DB.closeCon();

        return mreturnData;
    }

    public BigDecimal compCAR(String ID, String MID, String tag, String scenarioid) throws SQLException {
        BigDecimal returnData = new BigDecimal(BigInteger.ZERO);

        DB.openCon();
        if (tag.equalsIgnoreCase("be_bp")) {

            ResultSet mybe_bp = DB.getData(XMLDataModel.BE_BP_TABLENAME, "*", "BP_TO_ID=" + ID + " AND MODEL_ID=" + MID);

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

            ResultSet mybe_bp = DB.getData(XMLDataModel.BE_BE_TABLENAME, "*", "BE_TO_ID=" + ID + " AND MODEL_ID=" + MID);
            String[] mycorporate = DB.getRowNocon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "id=" + ID + " AND MODEL_ID=" + MID);
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
                DB.closeCon();

                DB.openCon();
                ResultSet mycorporate_be = DB.getData(XMLDataModel.CORPORATE_BE_TABLENAME, "*", " BE_TO_ID=" + ID + " AND MODEL_ID=" + MID);

                // Teststring += "found corp link <br>";
                while (mycorporate_be.next()) {

                    String[] mycorporate2 = DB.getRowNocon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + MID);

                    String Number2 = mycorporate2[3];
                    Number2 = getSCENARIOPram(MID, scenarioid, mycorporate[0], "NUMBER", Number2, "CORPORATE");
                    // Teststring += Number2 + "<br>";
                    BigDecimal uf = new BigDecimal(mycorporate_be.getString("UTILIZATION_FREQUENCY"));
                    uf = new BigDecimal(getSCENARIOPram(MID, scenarioid, mycorporate_be.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Corporate_be"));
                    double all = Double.parseDouble(Number2) * uf.doubleValue();
                    //Teststring+= "number"+all;

                    returnData = returnData.add(new BigDecimal(all));
                    Teststring += "<br> returndata=" + returnData;

                }

            }

        }

        if (tag.equalsIgnoreCase("insertion")) {
            String[] service_insertion = DB.getRowNocon(XMLDataModel.SERVICE_INSERTION_TABLENAME, "id=" + ID + " AND MODEL_ID=" + MID);
            returnData = returnData.add(new BigDecimal(service_insertion[10]));
        }

        // DB.closeCon();
        return returnData;
    }

    public String getSCENARIOPram(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER, String OLDVAL, String Type) {
        String retunData = "";
        retunData = OLDVAL;

        String OBJECT_CLASS = getClassNAME(Type);

        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null) {

            String wgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "' and OBJECT_CLASS='" + OBJECT_CLASS + "'";

//         DB.closeCon();
            String[] retd = DB.getRowNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wgere);

            if (retd[6] == "" || retd[6] == null) {
                retunData = OLDVAL;

            } else {

                retunData = retd[6];

            }

        }

        return retunData;
    }

    String getClassNAME(String Type) {

        String retunData = "";
        if (Type.equalsIgnoreCase("corporate")) {

            retunData = "com.acrtek.xact.data.bo.BoCorporate";

        } else if (Type.equalsIgnoreCase("CORPORATE_BE")) {

            retunData = "com.acrtek.xact.data.bo.BoCorporateToBE";

        } else if (Type.equalsIgnoreCase("business_entity")) {

            retunData = "com.acrtek.xact_services.data.bo.BoBusinessEntity";

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
    /*    private static BigDecimal computeBusinessObject(Object businessObject, String resultId)  {

       

     if (businessObject instanceof BoActivity) {

     BoActivity sa = (BoActivity) businessObject;

     BigDecimal val = BigDecimal.ZERO;

     BoActivity consumer = null;

     // is this activity a message consumer? Need to get arrival rate from message producer.

     Collection<BasicElement> colMessages = corporate.getBoPersistence().requestObjects(BoMessage.class, "CONSUMER_ACTIVITY = '" + sa.getID() + "'");

     if (colMessages != null && (!colMessages.isEmpty())) {

     consumer = sa;

     }

     {

     Iterator<BasicElement> ite = corporate.getBoPersistence().requestObjects(BoSPVLine.class, "TO_ID = '" + sa.getID() + "'").iterator();

     while (ite.hasNext()) {

     BoSPVLine bcTobc = (BoSPVLine) ite.next();

     BasicMutableNodeElement fromNode = (BasicMutableNodeElement) bcTobc.getFrom();

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service Activity " + sa.getName() + " missing neighbor.");

     }

     if (((String) fromNode.getProperty("TAG")).equalsIgnoreCase("start")) {

     fromNode = (BasicMutableNodeElement) fromNode.getParent();

     }

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service Activity " + sa.getName() + " missing parent.");

     }

     BigDecimal ufreq = new BigDecimal(bcTobc.getUtilizationFrequency());

     if (((String) fromNode.getProperty("TYPE")).equals("delay")){

     ufreq = BigDecimal.ONE;

     }

     val = val.add(computeBusinessObject(fromNode, table, corporate, scenario, iteration, consumer).multiply(ufreq));

     }

     }

 

     addArrivalRate(table, sa, val);

     Collection<BasicElement> col = sa.getMyACsWithUtilization();

     Iterator itAC = col.iterator();

     while (itAC.hasNext()) {

     ActivityACListElement ale = (ActivityACListElement) itAC.next();

     BoApplicationComponent ac = ale.getAc();

     double uf = ale.getUfreq();

     BigDecimal bdDur = BigDecimal.ONE;

     if (ac.getWorkloadType() == BoApplicationComponent.OLTP_WORKLOAD) {

     bdDur = new BigDecimal((double) corporate.getWindowDuration() * (double) BoCorporate.SECONDS_REFERENCE[corporate.getWindowDurationType()]);

     }

     BigDecimal acRatePerSecond = (val.divide(bdDur,18,RoundingMode.DOWN)).multiply(new BigDecimal(uf));

 

     if (((String) sa.getProperty("TYPE")).equals("delay")){

     acRatePerSecond = BigDecimal.ZERO;

     }

     addArrivalRate(table, ac, acRatePerSecond);

     }

 

     return val;

 

     } else if (businessObject instanceof BoService) {

     BoService svc = (BoService) businessObject;

     BigDecimal val = BigDecimal.ZERO;

     // if message consumer is not set use default utilization frequency.

     Collection<BoS2SXref> colXref = svc.getMyServices();

     if (colXref == null || colXref.isEmpty()) {

     {

     Iterator<BasicElement> ite = corporate.getBoPersistence().requestObjects(BoSPVLine.class, "TO_ID = '" + svc.getID() + "'").iterator();

     while (ite.hasNext()) {

     BoSPVLine lnk = (BoSPVLine) ite.next();

     BasicMutableNodeElement fromNode = (BasicMutableNodeElement) lnk.getFrom();

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service2Service " + svc.getName() + " missing neighbor.");

     }

     BigDecimal freq = BigDecimal.ONE;

     val = val.add(computeBusinessObject(fromNode, table, corporate, scenario, iteration, mConsumer).multiply(freq));

     }

     }

     } else {

     // if message consumer is set locate the messages that the consumer recieves.

     Iterator<BoS2SXref> itXref = colXref.iterator();

     while (itXref.hasNext()) {

     BoS2SXref xf = itXref.next();

     if (xf.getType() == BoS2SXref.SIMPLELINK) {

     BoMessage msg = (BoMessage) xf.getBoPersistence().getObjectById(BoMessage.class, xf.getObject_ID());

     //                            BigDecimal mVal = BigDecimal.ZERO;

     // get the message producer

     BoActivity p = msg.getProducerActivity();

     // this shouldn't happen but if I have multiples only use the first.

     // get the arrival rate of the producer

     BigDecimal iVal = computeBusinessObject(p, table, corporate, scenario, iteration, null);

     Collection<BasicElement> col = p.getMyACsWithUtilization();

     Iterator itAC = col.iterator();

     double uf = 0;

     // sum the utilization rate of all ac's

     while (itAC.hasNext()) {

     ActivityACListElement ale = (ActivityACListElement) itAC.next();

     uf += ale.getUfreq();

     }

     // multiply the arrival rate of the producer by the sum of ac's utilization rate.

     BigDecimal mVal = iVal.multiply(new BigDecimal(uf));

     // take the computed arrival rate of the producer and multiply

     // it by the utilization rate of the message summing for the

     // value for the S2S that will be passed down.

     val = val.add(mVal.multiply(new BigDecimal(msg.getUtilizationFrequency())));

     }

     }

     }

     addArrivalRate(table, svc, val);

     return val;

 

     } else if (businessObject instanceof BoTask) {

 

     BoTask st = (BoTask) businessObject;

     BigDecimal val = BigDecimal.ZERO;

     {

     Iterator<BasicElement> ite = corporate.getBoPersistence().requestObjects(BoSPVLine.class, "TO_ID = '" + st.getID() + "'").iterator();

     while (ite.hasNext()) {

     BoSPVLine bptobp = (BoSPVLine) ite.next();

     BasicMutableNodeElement fromNode = (BasicMutableNodeElement) bptobp.getFrom();

     double freq = bptobp.getUtilizationFrequency();

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service Task " + st.getName() + " missing neighbor.");

     }

     if (((String) fromNode.getProperty("TAG")).equalsIgnoreCase("start")) {

     fromNode = (BasicMutableNodeElement) fromNode.getParent();

     }

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service Task " + st.getName() + " missing parent.");

     }

     if (((String) fromNode.getProperty("TAG")).equalsIgnoreCase("service")) {

     freq = 1.0;

     }

     val = val.add(computeBusinessObject(fromNode, table, corporate, scenario, iteration, mConsumer).multiply(new BigDecimal(freq)));

     }

     }

     addArrivalRate(table, st, val);

     return val;

 

     } else if (businessObject instanceof BoComponent) {

 

     BoComponent sc = (BoComponent) businessObject;

     BigDecimal val = BigDecimal.ZERO;

     {

     Iterator<BasicElement> ite = corporate.getBoPersistence().requestObjects(BoSPVLine.class, "TO_ID = '" + sc.getID() + "'").iterator();

     while (ite.hasNext()) {

     BoSPVLine bptobp = (BoSPVLine) ite.next();

     BasicMutableNodeElement fromNode = (BasicMutableNodeElement) bptobp.getFrom();

     double freq = bptobp.getUtilizationFrequency();

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service Component " + sc.getName() + " missing neighbor.");

     }

     if (((String) fromNode.getProperty("TAG")).equalsIgnoreCase("start")) {

     fromNode = (BasicMutableNodeElement) fromNode.getParent();

     }

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service Component " + sc.getName() + " missing parent.");

     }

     if (((String) fromNode.getProperty("TAG")).equalsIgnoreCase("service")) {

     freq = 1.0;

     }

     val = val.add(computeBusinessObject(fromNode, table, corporate, scenario, iteration, mConsumer).multiply(new BigDecimal(freq)));

     }

     }

     addArrivalRate(table, sc, val);

     return val;

 

     } else if (businessObject instanceof BoProcess) {

 

     BoProcess sp = (BoProcess) businessObject;

     BigDecimal val = BigDecimal.ZERO;

     {

     Iterator<BasicElement> ite = corporate.getBoPersistence().requestObjects(BoSPVLine.class, "TO_ID = '" + sp.getID() + "'").iterator();

     while (ite.hasNext()) {

     BoSPVLine bptobp = (BoSPVLine) ite.next();

     Object fromNode = bptobp.getFrom();

     double freq = bptobp.getUtilizationFrequency();

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service Process " + sp.getName() + " missing neighbor.");

     }

     if (((String) ((BasicMutableNodeElement) fromNode).getProperty("TAG")).equalsIgnoreCase("start")) {

     fromNode = ((BasicMutableNodeElement) fromNode).getParent();

     if (fromNode == null) {

     fromNode = sp.getBoPersistence().getObjectById(BoBusinessProcess.class, bptobp.getParentID());

     }

     }

     if (fromNode == null) {

     throw new XactComputeException("Broken from link for Service Process " + sp.getName() + " missing neighbor.");

     }

     if (fromNode instanceof BoService) {

     freq = 1.0;

     }

     val = val.add(computeBusinessObject(fromNode, table, corporate, scenario, iteration, mConsumer).multiply(new BigDecimal(freq)));

     }

     }

     addArrivalRate(table, sp, val);

     return val;

 

     } else if (businessObject instanceof BoBusinessProcess) {

 

     BoBusinessProcess bp = (BoBusinessProcess) businessObject;

     BigDecimal val = BigDecimal.ZERO;

     {

     Iterator<BasicElement> ite = corporate.getBoPersistence().requestObjects(BoBEToBP.class, "BP_TO_ID = '" + bp.getID() + "'").iterator(); //BusinessDAOManager.getBEToBPParentOf(DAOManager.getPersistence(),bp).iterator();

     while (ite.hasNext()) {

     BoBEToBP betobp = (BoBEToBP) ite.next();

     val = val.add(computeBusinessObject(betobp.getFrom(), table, corporate, scenario, iteration, mConsumer).multiply(new BigDecimal(betobp.getUtilizationFrequency())));

     }

     }

 

     addArrivalRate(table, bp, val);

     return val;

 

     } else if (businessObject instanceof BoBusinessEntity) {

     BoBusinessEntity be = (BoBusinessEntity) businessObject;

 

     BigDecimal val = new BigDecimal(be.getNumber());

 

     if (scenario != null && scenario.exist(be)) {

     val = new BigDecimal(scenario.getNumber(be, iteration));

     }

 

     if (val.compareTo(BigDecimal.ZERO) < 0) {

     val = BigDecimal.ZERO;

     {

     Iterator<BasicElement> ite = corporate.getBoPersistence().requestObjects(BoBEToBE.class, "BE_TO_ID = '" + be.getID() + "'").iterator();

     while (ite.hasNext()) {

     BoBEToBE betobe = (BoBEToBE) ite.next();

     val = val.add(computeBusinessObject(betobe.getFrom(), table, corporate, scenario, iteration, mConsumer).multiply(new BigDecimal(betobe.getUtilizationFrequency())));

     }

     }

     {

     Iterator<BasicElement> ite = corporate.getBoPersistence().requestObjects(BoCorporateToBE.class, "BE_TO_ID = '" + be.getID() + "'").iterator();

     while (ite.hasNext()) {

     BoCorporateToBE corptobe = (BoCorporateToBE) ite.next();

     val = val.add(new BigDecimal(corptobe.getMyCorporateFrom().getNumber() * corptobe.getUtilizationFrequency()));

     }

     }

     }

     addArrivalRate(table, be, val);

     return val;

     } else if (businessObject instanceof BoInsertion) {

     BoInsertion bi = (BoInsertion) businessObject;

     BigDecimal val = new BigDecimal(bi.getNumber());

     // Insertion Point is the top of the chain. No need to check any higher.

     addArrivalRate(table, bi, val);

     return val;

     }

      

 

    

 

     }*/
}
