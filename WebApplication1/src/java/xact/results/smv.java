/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact.results;

import lib.Options.XMLDataModel;
import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.tools.Utils;
import xact.utils;

/**
 * The class that calculates and renders the SMV.
 *
 * @author ismail
 */
public class smv {

    String id = "";
    String mod_id = "";
    String sid = "";
    double get_service = 0;
    double get_elon = 0;
    double get_rsponse, get_tpmax, get_tpactual, get_a1, get_a2, get_a3, get_a4 = 0;
    String point = "";
    double servicTimeIdeal, maxTP, responseTime, tpActual, a1, a2, a3, a4 = 0;
    double maxrestime = 0;
    String resultId = "";

    /**
     *
     */
    public String out = "";

    /**
     * the constructor for the smv. In addition to setting the model id and
     * scenario id, the constructor also calls the {@link #fillLists} method to
     * instantiate the list of aci for each type and puts them in the
     * {@link  #container} map for easier access to them whenever the need
     * arises.
     *
     * @param myid id of the service node to get its smv
     * @param mymid model id
     * @param mysid scenario id
     * @param mypoint plan point
     */
    public smv(String myid, String mymid, String mysid, String mypoint) {

        id = myid;
        mod_id = mymid;
        sid = mysid;
        point = mypoint;
        resultId = Utils.getResultID(mod_id, sid);
        con = db.openDBConNewcon(lib.Options.DbInfo.connectionString);
        fillLists(id);

        container.put("0", serverTrans);
        container.put("2", serverbatch);
        container.put("6", humanBatch);
        container.put("5", humanTrans);
        container.put("7", equip);
        container.put("10", network);
        container.put("8", vehicle);

    }

    /**
     * goes through the service tree starting from the passed service node and
     * finds all the acis in this tree. each aci then is put in the
     * corresponding list according to its type. and the lists are put in the
     * container map with their type as keys.
     *
     * @param id the service node id to get its tree.
     */
    private void fillLists(String id) {

        try {

            ResultSet serviceNodes = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + id, con);
            while (serviceNodes.next()) {
                String type = serviceNodes.getString("TYPE");
                String tag = serviceNodes.getString("TAG");
                if (tag.equalsIgnoreCase("activity")) {
                    if (u.getISScenarioPram(mod_id, sid, serviceNodes.getString("ID"), "ACTIVE_STATUS").equals("-1")) {

                        if (type.equalsIgnoreCase("database") || type.equalsIgnoreCase("application")) {
                            getWorkload(serviceNodes.getString("ID"));

                        } else if (type.equalsIgnoreCase("human_batch")) {
                            humanBatch.addAll(getAcList(serviceNodes.getString("ID")));
                        } else if (type.equalsIgnoreCase("human_trans")) {
                            humanTrans.addAll(getAcList(serviceNodes.getString("ID")));

                        } else if (type.equalsIgnoreCase("vehicle")) {
                            vehicle.addAll(getAcList(serviceNodes.getString("ID")));

                        } else if (type.equalsIgnoreCase("equipment")) {
                            equip.addAll(getAcList(serviceNodes.getString("ID")));

                        }
                    }
                } else if (tag.equalsIgnoreCase("service")) {
                    network.add("" + serviceNodes.getString("ID"));
                } else {
                    fillLists("" + serviceNodes.getString("ID"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(smv.class.getName()).log(Level.SEVERE, null, ex);
            System.out.print(ex.getSQLState());
        }

    }
    xact.results.resultes rx = new xact.results.resultes("", "", "", "", "", "");

    /**
     * total response time for network
     */
    public double net,
            /**
             *
             */
            /**
             * total response time for transactional servers
             */
            server,
            /**
             * total response time for batch servers
             */
            
            serverBatch,
            
            /**
             * total response time for human
             */
            humen,
           
            /**
             * total response time for machines
             */
            machen,
            
            /**
             * total response time for vehicles
             */
            Transport,
            other= 0;

    /**
     *
     */
    public double dvl = 0;
    lib.engine.db.operations db = new lib.engine.db.operations();
    Connection con = null;
    int ashann = 0;
    ArrayList<String> headers = new ArrayList<String>();
    ArrayList<String> headers_id = new ArrayList<String>();
    ArrayList<String> rows = new ArrayList<String>();
    ArrayList<String> headersdata = new ArrayList<String>();
    ArrayList<Double> rowsMaxtp = new ArrayList<Double>();
    ArrayList<Double> rowsservice = new ArrayList<Double>();
    ArrayList<Double> rowsresponse = new ArrayList<Double>();
    ArrayList<Double> rowstpactual = new ArrayList<Double>();
    ArrayList<Double> rowsa1 = new ArrayList<Double>();
    ArrayList<Double> rowsa2 = new ArrayList<Double>();
    ArrayList<Double> rowsa3 = new ArrayList<Double>();
    ArrayList<Double> rowsa4 = new ArrayList<Double>();
    ArrayList<String> serverTrans = new ArrayList<String>();
    ArrayList<String> serverbatch = new ArrayList<String>();
    ArrayList<String> humanBatch = new ArrayList<String>();
    ArrayList<String> humanTrans = new ArrayList<String>();
    ArrayList<String> network = new ArrayList<String>();
    ArrayList<String> equip = new ArrayList<String>();
    ArrayList<String> vehicle = new ArrayList<String>();
    HashMap<String, ArrayList> container = new HashMap<String, ArrayList>();
    int counters = 0;
    String reurntest = "";
    utils u = new utils();

    private String getservernameFromAci(String aciID) {

       /* 
        String serverId = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + aciID, con)[4];
        String lsiId = db.getRowNewCon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId, con)[1];

        String name = db.getRowNewCon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + lsiId, con)[2];
        name = name.replace("Complex", "");
        name = name.replace("Part", "");
        name = name.substring(0, name.length() - 2);*/
        String name="";
        String nodeID= getNodeId(aciID);
        name= db.getRowNewCon(XMLDataModel.NODE_TABLENAME, "ID=" + nodeID, con)[2];
        return name;
    }

    /**
     * Creates the smv table for the given service node and the given type, the list of aci to work with 
     * is retrieved from the {@link #container} map using the given type as key. the format for the returned table is as follows:
     * <ul>
     * <li> component name</li>
     * <li> ideal service time : (st) - (st) * (1 - ((chr) / 100))</li>
     * <li> max throughput : 1/cpu time (val 13 from new_detail_results)</li>
     * <li> response time : val7 from new_detail_results</li>
     * <li> actual throughput : val10 from new_detail_results</li>
     * <li> loss in throughput : max throughput-actual throughput</li>
     * <li> elongation : val8 from new_detail_results</li>
     * <li> availability delay </li>
     * <li> database impact : cache hit ratio</li>
     * <li> incidental : val5 from new_detail_results (flow_comp)</li>
     * 
     * 
     * </ul>
     * @param Type Aci type
     * @param Type1 optional aci type value for the types that can have more than 1 value, i.e. transactional having values 1 and 2
     * @return
     * @throws SQLException
     * @throws ParseException
     */
    public String getSMVTableValues( String Type, String Type1) throws SQLException, ParseException {

        String returndata = "";
        sid = sid.trim();
        
        mod_id = mod_id.trim();
        point = point.trim();
//returndata+="parent_id=" + id.trim();
        String modname = getModName(mod_id, sid) + "_" + point;
        String resultId = Utils.getResultID(mod_id, sid);
        String data = "";

        String retunall = "";

        ArrayList<String> nodeList = container.get(Type);
        // System.out.println(Type + ";;" + nodeList.size());
        for (String nodeId : nodeList) {
            // System.out.print( "id=" + nodeId);
            ResultSet acrow = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "id=" + nodeId, con);

            double response = 0, elon2 = 0, st = 0, thro = 0;
            double down = 0;

            if (acrow.next()) {

                 String serverName = getservernameFromAci(acrow.getString("ID"));

                Connection con2 = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);

                ResultSet resultrow = db.getDataNeWcon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "MOD_NAME='" + modname.trim() + "' and VAL0='APPLICATION_COMPONENT' AND VAL23='" + acrow.getString("ID") + "' AND VAL4='" + acrow.getString("Inst_NAME") + "' AND RESULT_ID=" + resultId, con2);

                ResultSet resultchr = db.getDataNeWcon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "MOD_NAME='" + modname.trim() + "' and VAL0='CACHE_A_PER_COMPONENT' AND VAL9='" + acrow.getString("ID") + "' AND VAL4='" + acrow.getString("Inst_NAME") + "' AND RESULT_ID=" + resultId, con2);

                //this.out=data;
                ResultSet incidentalResults = db.getDataNeWcon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "MOD_NAME='" + modname.trim() + "' and VAL0='FLOW_COMP' AND VAL2='" + acrow.getString("Inst_NAME") + "'AND RESULT_ID=" + resultId, con2);

//returndata+="MOD_NAME='" + modname.trim() + "' and VAL0='FLOW_COMP' AND VAL2='" + acrow.getString("NAME").split("/")[0].replace("^", "") + "'AND RESULT_ID="+resultId+"<br>";
                //while(resultrow.next()){
                // String[] getrow_is = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + getrow[0]);
                double chr = 0;

                if (resultrow != null) {
                    if (resultrow.next()) {
                        counters++;

                        reurntest += "type Is:" + resultrow.getString("VAL5") + "<Br/>";

                        if (resultrow.getString("VAL5").trim().equalsIgnoreCase(Type) || resultrow.getString("VAL5").trim().equalsIgnoreCase(Type1)) {

                            try {
                                elon2 = Double.parseDouble(resultrow.getString("VAL8"));
                            } catch (SQLException sQLException) {
                            } catch (NumberFormatException numberFormatException) {
                            }

                         //   response = Double.parseDouble(resultrow.getString("VAL7"));
                            String val7 = resultrow.getString("VAL7");

                            try {
                                response = Double.parseDouble(val7);
                            } catch (NumberFormatException numberFormatException) {
                            }

                            if (resultrow.getString("VAL15") != null) {
                                if (!resultrow.getString("VAL15").equalsIgnoreCase("null")) {
                                    st = Double.parseDouble(resultrow.getString("VAL15"));
                                }

                            }
                            try {
                                thro = 1 / Double.parseDouble(resultrow.getString("VAL7"));
                            } catch (SQLException sQLException) {
                            } catch (NumberFormatException numberFormatException) {
                            }

                            double incidental = 0;

                            while (resultchr.next()) {

                                try {
                                    chr = Double.parseDouble(resultchr.getString("VAL8"));
                                } catch (SQLException sQLException) {
                                } catch (NumberFormatException numberFormatException) {
                                }

                            }

                            double impact = 0;
                            if (chr != 0) {
                                impact = ((100 / chr) * 100) - 100;
                            }

                            while (incidentalResults.next()) {

                                try {
                                    incidental = Double.parseDouble(incidentalResults.getString("VAL5"));
                                } catch (SQLException sQLException) {
                                } catch (NumberFormatException numberFormatException) {
                                }

                            }

                            String headerTitle = serverName;

                            if (!headers.contains(headerTitle)) {

                                headers_id.add(getNodeId(acrow.getString("ID")));

                                headers.add(headerTitle);

                                rows.add("");
                                rowsMaxtp.add(0d);

                                rowsservice.add(0d);

                                rowsresponse.add(0d);

                                rowstpactual.add(0d);

                                rowsa1.add(elon2);

                                rowsa2.add(0d);

                                rowsa3.add(0d);

                                rowsa4.add(0d);

                            }

                            int myindes = headers.indexOf(headerTitle);

                            double service_time = (st) - (st) * (1 - ((chr) / 100));
                            double LossTP = 0;
                            double MaxTP = 1 / Double.parseDouble(resultrow.getString("VAL13"));
                            if (Type.equalsIgnoreCase("2")) {
                                double number = Double.parseDouble(resultrow.getString("VAL12"));
                                double val8 = Double.parseDouble(resultrow.getString("VAL8"));

                                if (!fixDelayComponent(resultrow.getString("VAL4") + "^/^" + resultrow.getString("VAL1"))) {
                                    response = response * number;
                                }
                                service_time = response / ((val8 / 100) + 1);
                                if (impact != 0) {
                                    service_time = (st) - (st) * (1 - ((chr) / 100));
                                }
                            }

                            data += response + "__this is st " + Math.round(1 / st) + "__" + thro + "__" + elon2;
                            String this_row = "";
                            this_row += "<tr class=\"st_child ch_" + myindes + "\" >";
                            this_row += "<td>Component " + "</td>";

                            this_row += "<td>" + acrow.getString("INST_NAME") + "</td>";
                            this_row += "<td style=\"text-align:center\">" + Utils.convertToDHMS(service_time) + "</td>";

                            this_row += "<td style=\"text-align:center\">" + Math.round(MaxTP) + "</td>";

                            String datar = Utils.convertToDHMS(response);

                            if (response < 1) {

                                datar = response + "";

                                datar = "0" + val7.substring(0, 6) + "s";

                            }

                            this_row += "<td style=\"text-align:center\">" + datar + "</td>";
                            get_service += service_time;
                            this_row += "<td style=\"text-align:center\">" + Math.round(thro) + "</td>";
                            get_rsponse += response;
                            if (MaxTP != 0) {
                                LossTP = ((MaxTP - thro) / MaxTP) * 100;
                            }

                            double L = Double.parseDouble(resultrow.getString("VAL12")) / MaxTP;

                            String mystyle = "";
                            if (L > 1) {
                                mystyle = "background:lightcoral";
                            } else {
                                mystyle = "background:transparent ";

                            }
                            this_row += "<td style =\"" + mystyle + "; text-align:center\">" + Math.round(LossTP) + "%</td>";
                            this_row += "<td style=\"text-align:center\">" + Math.round(elon2) + "%</td>";
                            get_elon += elon2;
                            this_row += "<td style=\"text-align:center\">" + Math.round(down) + "</td>";
                            this_row += "<td style=\"text-align:center\">" + Math.round(impact) + "</td>";
                            this_row += "<td style=\"text-align:center\">" + Math.round(incidental) + "</td>";
                            this_row += "</tr>";

                            if (rowsresponse.get(myindes) < response) {
                                rowsMaxtp.set(myindes, new Double(Math.round(MaxTP)));
                                rowsservice.set(myindes, new Double(service_time));
                                rowsresponse.set(myindes, new Double(response));
                                rowstpactual.set(myindes, new Double(thro));
                                rowsa1.set(myindes, new Double(elon2));
                                rowsa2.set(myindes, new Double(down));
                                rowsa3.set(myindes, new Double(impact));
                                rowsa4.set(myindes, new Double(incidental));
                            }

                            if (!rows.contains(this_row)) {
                                String dd = rows.get(myindes).replace(this_row, "");

                                rows.set(myindes, dd + this_row);

                            }

                            double du = elon2 + down + impact + incidental;
                            if (du > dvl) {
                                dvl = du;
                            }

                            
                        }

                    }
                }
                db.closeConNewcon(con2);

            }

        }

        for (int i = 0; i < headers.size(); i++) {

            responseTime = rowsresponse.get(i);
            
            servicTimeIdeal = rowsservice.get(i);
            tpActual = rowstpactual.get(i);
            a1 = rowsa1.get(i);
            a2 = rowsa2.get(i);
            a3 = rowsa3.get(i);
            a4 = rowsa4.get(i);
            if (rowsresponse.get(i) > getServerBatch_rsponse) {
                getServerBatch_rsponse = rowsresponse.get(i);
                get_rsponse = rowsresponse.get(i);
                get_service = rowsservice.get(i);
                get_tpactual = rowstpactual.get(i);
                get_tpmax = rowsMaxtp.get(i);
                get_elon = rowsa1.get(i);
                get_a2 = rowsa2.get(i);
                get_a3 = rowsa3.get(i);
                get_a4 = rowsa4.get(i);
            }

            String[] val = db.getRow(XMLDataModel.NODE_TABLENAME, "id=" + headers_id.get(i));

            double LossTP2 = 0;

            if (rowsMaxtp.get(i) != 0) {

                LossTP2 = ((rowsMaxtp.get(i) - tpActual) / rowsMaxtp.get(i)) * 100;
            }
            returndata += "<tr class=\"st_sub_parent pa_" + i + " \" id=\"" + i + " \" ><td >" + val[10] + " </td>" + "<td>" + headers.get(i) + " </td><td  style=\"text-align:center\">" + Utils.convertToDHMS(servicTimeIdeal) + "</td>" + "<td  style=\"text-align:center\">" + Math.round(rowsMaxtp.get(i)) + "</td><td  style=\"text-align:center\">" + Utils.convertToDHMS(responseTime) + "</td><td  style=\"text-align:center\">" + Math.round(tpActual) + "</td><td  style=\"text-align:center\">"
                    + Math.round(LossTP2)
                    + "%</td><td  style=\"text-align:center\">" + Math.round(a1) + "%</td><td  style=\"text-align:center\">" + Math.round(a2) + "%</td><td  style=\"text-align:center\">" + Math.round(a3) + "%</td><td  style=\"text-align:center\">" + Math.round(a4) + "%</td></tr>"
                    + rows.get(i);

        }
        server += getServerBatch_rsponse;

        return returndata;

    }

    /**
     * Creates the header row values, the values for the header are chosen from the component with the highest
     * response time.
     * @param title title to be used in the header representing the type of the server or network for messages
     * @param Type aci type
     * @param Type1 aci optional type
     * @return
     * @throws SQLException
     * @throws ParseException
     */
    public String getSMVTableValuesALL(String title, String Type, String Type1) throws SQLException, ParseException {

        get_service = 0;
        get_rsponse = 0;
        get_tpmax = 0;
        get_tpactual = 0;
        get_a2 = 0;
        get_a3 = 0;
        get_a4 = 0;

        headers_id.clear();
        headers.clear();
        rows.clear();
        headersdata.clear();
        rowsMaxtp.clear();
        rowsservice.clear();
        rowsresponse.clear();
        rowstpactual.clear();
        rowsa1.clear();
        rowsa2.clear();
        rowsa3.clear();
        rowsa4.clear();

        String data = getSMVTableValues( Type, Type1);
        String ret = "";

        if (!Type.equals("10")) {

            if (!data.equals("")) {

                String mytpmax = "0";
                if (get_tpmax != 0 && get_tpactual != 0) {

                    mytpmax = "" + Math.round(((get_tpmax - get_tpactual) / get_tpmax) * 100);

                }

                if (get_service != 0 || get_rsponse != 0 || get_elon != 0) {
                    ret = "<tr class=\"st_parent\"><td>" + title + "</td><td></td><td style=\"text-align:center\">"
                            + Utils.convertToDHMS(get_service) + "</td><td style=\"text-align:center\" >" + Math.round(get_tpmax) + "</td><td style=\"text-align:center\">"
                            + Utils.convertToDHMS(get_rsponse) + "</td><td style=\"text-align:center\">" + Math.round(get_tpactual) + "</td><td style=\"text-align:center\">" + mytpmax + "%</td><td style=\"text-align:center\">"
                            + Math.round(get_elon) + "%</td> <td style=\"text-align:center\">" + Math.round(get_a2) + "%</td><td style=\"text-align:center\">" + Math.round(get_a3) + "%</td><td style=\"text-align:center\">" + Math.round(get_a4) + "%</td></tr>" + data;
                }
            }

        } else {

            ret = getNetwork();

        }
        return ret;

    }

    double getServerBatch_service, getServerBatch_rsponse, getServerBatch_elon = 0;

   /**
     * Creates the network part of smv table for the given service node , the list of messages to work with 
     * is retrieved from the {@link #container} map using the given type as key which is 10 for network. the format for the returned table is as follows:
     * <ul>
     * <li> message name</li>
     * <li> service time val 4 from new_detail_results with key =FLOW_LINE</li>
     * <li> throughput : val 8 from new_detail_results with key =FLOW_LINE</li>
     * <li> response time : val7 from new_detail_results with key =FLOW_LINE</li>
     * <li> throughput : val8 from new_detail_results with key =FLOW_LINE</li>
     * <li> loss in throughput : 0 in messages </li>
     * <li> elongation : ((responesTime / ServeicTime) - 1) * 100</li>
     * <li> availability delay:0 </li>
     * <li> database impact : 0</li>
     * <li> incidental : 0</li>
     * </ul>
     * @param id
     * @return
     * @throws SQLException
     */
    public String getNetworkChild(String id) throws SQLException {
        String modname = getModName(mod_id, sid) + "_" + point;
        String result_id = Utils.getResultID(mod_id, sid);
        String returnDataall = "";
        Connection netConnection = db.openDBConNewcon(lib.Options.DbInfo.connectionString);
        ArrayList<String> nodeList = container.get("10");

        for (Iterator nodeIt = nodeList.iterator(); nodeIt.hasNext();) {
            String nodeId = (String) nodeIt.next();

            ResultSet rsasct = db.getDataNeWcon(XMLDataModel.S2S_XREF_TABLENAME, "*", "S2S_ID=" + nodeId, netConnection);
            int myrsasctnum = db.getRowCount(XMLDataModel.S2S_XREF_TABLENAME, "S2S_ID=" + nodeId);
            double mut = Double.MAX_VALUE;
            if (myrsasctnum > 1) {
                while (rsasct.next()) {
                    String[] rsascttxt = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "ID=" + rsasct.getString("object_id"));
                    Connection conres = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
                    ResultSet rsaamk32 = db.getDataNeWcon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "MOD_NAME='" + modname + "' and  VAL0='FLOW_LINE' and VAL1='" + rsascttxt[2] + "' and RESULT_ID=" + result_id, conres);
                    while (rsaamk32.next()) {
                        if (mut > Double.parseDouble(rsaamk32.getString("VAL8"))) {
                            mut = Double.parseDouble(rsaamk32.getString("VAL8"));

                        }

                    }

                }
            }
            rsasct.beforeFirst();
            while (rsasct.next()) {

                String object_id = rsasct.getString("object_id");

                // db.getRow(XMLDataModel.MESSAGE_TABLENAME, "ID=" + rsasct.getString("S2S_ID"));
                String[] rsascttxt = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "ID=" + object_id);
                Connection conres = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);

                ResultSet rsaamk32 = db.getDataNeWcon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "MOD_NAME='" + modname + "' and  VAL0='FLOW_LINE' and VAL1='" + rsascttxt[2] + "' and RESULT_ID=" + result_id, conres);

                double throupot = Double.MAX_VALUE;
                double ELon = 0;
                double ServeicTime = 0;
                double responesTime = 0;

                while (rsaamk32.next()) {

                    if (throupot > Double.parseDouble(rsaamk32.getString("VAL8"))) {

                        throupot = Double.parseDouble(rsaamk32.getString("VAL8"));

                    }
                    ServeicTime += Double.parseDouble(rsaamk32.getString("VAL4"));
                    responesTime += Double.parseDouble(rsaamk32.getString("VAL3"));

                }

                double coff = 0;
                if (mut != Double.MAX_VALUE) {
                    coff = throupot / mut;
                    ServeicTime = coff * ServeicTime;
                    responesTime = coff * responesTime;
                }

                ELon = ((responesTime / ServeicTime) - 1) * 100;

                if (maxrestime < responesTime) {
                    maxrestime = responesTime;
                    getNetworkservice = ServeicTime;
                    getNetworkresponse = responesTime;
                    getNetworkelon = ELon;
                    getNetworkeLosstp = throupot - throupot;
                    getNetworktp = throupot;
                    getNetworkmaxtp = throupot;
                }

                returnDataall
                        += "<tr class=\"net_child\" ><td>Logical Message </td>";
                returnDataall += "<td >" + rsascttxt[2] + "</td>";
                returnDataall += "<td style=\"text-align:center\">" + Utils.convertToDHMS(ServeicTime) + "</td>";

                returnDataall += "<td style=\"text-align:center\">" + Math.round(throupot) + "</td>";

                returnDataall += "<td style=\"text-align:center\">" + Utils.convertToDHMS(responesTime) + "</td>";

                returnDataall += "<td style=\"text-align:center\">" + Math.round(throupot) + "</td>";

                returnDataall += "<td style=\"text-align:center\">" + 0 + "</td>";
                returnDataall += "<td style=\"text-align:center\">" + Math.round(ELon) + "%</td>";
                returnDataall += "<td style=\"text-align:center\">0%</td>";
                returnDataall += "<td style=\"text-align:center\">0%</td>";
                returnDataall += "<td style=\"text-align:center\">0%</td>";
                returnDataall += "</tr>";

                
                db.closeConNewcon(conres);
            }

        }

        db.closeConNewcon(netConnection);

        return returnDataall;
    }
    double getNetworkservice = 0;
    double getNetworkresponse = 0;
    double getNetworkelon = 0;
    double getNetworkeLosstp = 0;
    double getNetworktp = 0;
    double getNetworkmaxtp = 0;

    /**
     *
     */
    public double gettotallTime = 0;

    /**
     * Creates the header row values, the values for the header are chosen from the message with the highest
     * response time.
     * @return
     * @throws SQLException
     */
    public String getNetwork() throws SQLException {
        String returnData = "";

        String otherdata = getNetworkChild(id);
        net += getNetworkresponse;
        if (getNetworkservice != 0 || getNetworkresponse != 0 || getNetworkelon != 0) {
            returnData = "<tr class=\"net_parent\" ><td>Network</td><td></td><td style=\"text-align:center\" >" + Utils.convertToDHMS(getNetworkservice) + "</td><td style=\"text-align:center\" >" + Math.round(getNetworkmaxtp) + "</td><td style=\"text-align:center\" >" + Utils.convertToDHMS(getNetworkresponse) + "</td><td   style=\"text-align:center\">" + Math.round(getNetworktp) + "</td><td style=\"text-align:center\" >" + Math.round(getNetworkeLosstp) + "</td><td style=\"text-align:center\" >" + Math.round(getNetworkelon) + "%</td><td style=\"text-align:center\" >0%</td><td style=\"text-align:center\" >0%</td><td style=\"text-align:center\" >0%</td></tr>";
        }

        returnData = returnData + otherdata;
        return returnData;

    }

    /**
     * Gets the data for preparation tasks, the value of interest in this part is the <i>OCCURENCE</i> value
     * from the table <i>SERVICE_PROCESS_NODE</i>.
     * @param id the id of the node to find all preparation tasks inside it.
     * @return
     * @throws SQLException
     */
    public String getOtherChild(String id) throws SQLException {

        lib.tools.Utils u = new Utils();

        String returnDataall = "";

        Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionString);
        ResultSet rs = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "parent_id=" + id, con);

        double occurence = 0;

        while (rs.next()) {

            if (rs.getString("TAG").equalsIgnoreCase("Task")
                    && rs.getString("type").equalsIgnoreCase("preparation")) {
                // outtest+=":"+rs.getString("TAG")+";"+rs.getString("type");

                occurence = rs.getDouble("OCCURENCE");
                returnDataall
                        += "<tr class=\"net_child\" ><td>Preparation Task</td>";
                returnDataall += "<td ></td>";
                returnDataall += "<td style=\"text-align:center\">" + rs.getString("name") + "</td>";

                returnDataall += "<td style=\"text-align:center\"></td>";

                returnDataall += "<td style=\"text-align:center\">" + Utils.convertToDHMS(occurence) + "</td>";

                returnDataall += "<td style=\"text-align:center\"></td>";

                returnDataall += "<td style=\"text-align:center\">" + 0 + "%</td>";
                returnDataall += "<td style=\"text-align:center\"></td>";
                returnDataall += "<td style=\"text-align:center\"></td>";
                returnDataall += "<td style=\"text-align:center\"></td>";
                returnDataall += "<td style=\"text-align:center\"></td>";
                returnDataall += "</tr>";
                gettotallTime += occurence;

            } else {

                returnDataall += getOtherChild(rs.getString("id"));
            }
        }
        db.closeConNewcon(con);

        return returnDataall;
    }

    /**
     *
     */
    public String outtest = "";

    /**
     *
     * @return @throws SQLException
     */
    public String getOther() throws SQLException {
        String returnData = "";

        String otherdata = getotherNeighbor("");

        if (gettotallTime != 0) {
            returnData = "<tr class=\"net_parent\" ><td>Other</td><td>" + outtest + "</td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" >" + Utils.convertToDHMS(gettotallTime) + "</td><td   style=\"text-align:center\"></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td></tr>";
        }

        returnData = returnData + otherdata;
        return returnData;

    }

    private String getotherNeighbor(String ids) throws SQLException {
        String returndata = "";

        // lib.tools.Utils.getnodenebor(id,"left");  
        if (ids.equals("")) {
            ids = id;
        }

        ArrayList<String> nb = lib.tools.Utils.getnodenebor(ids, "right");
        returndata = getOtherChild(ids);
        for (String s : nb) {
            if (!processedids.contains(s)) {
                // returndata += getOtherChild(s);
                returndata += getotherNeighbor(s);
                processedids.add(s);
            }
        }

        return returndata;
    }
    ArrayList<String> processedids = new ArrayList<String>();
    int num = 0;
    double getHumen_service, getHumen_rsponse, getHumen_elon = 0;

    String getHostName(String id) {

        String retuendata = "";
        String[] hostdata = db.getRow(XMLDataModel.NODE_TABLENAME, "id=" + id);
        retuendata = hostdata[2];

        return retuendata;

    }

    String getMessageName(String id) {

        String retuendata = "";
        String[] hostdata = db.getRow(XMLDataModel.MESSAGE_TABLENAME, "id=" + id);
        retuendata = hostdata[2];

        return retuendata;

    }

    /**
     *
     * @param get
     * @return
     */
    public String getbbid(String get) {
        String bbid = "";
        db.openCon();

        int count = db.getRowCount(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "Id=" + get);
        String[] acs2 = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "Id=" + get);
        //bbid+=acs2[3]+" out<br>";

        if (count > 0) {
//bbid = acs2[3];

            try {
                bbid = getbbid(acs2[3]);
            } catch (Exception e) {
            }

        } else {

            String[] ac = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "Id=" + get);

            bbid = ac[0];
        }

        return bbid;

    }

    /**
     *
     * @param get
     * @return
     */
    public String getbbname(String get) {
        String bbid = "";
        db.openCon();

        int count = db.getRowCount(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "Id=" + get);
        String[] acs2 = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "Id=" + get);
        //bbid+=acs2[3]+" out<br>";

        if (count > 0) {
            bbid = getbbname(acs2[3]);

        } else {

            String[] ac = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "Id=" + get);

            bbid = ac[3];
        }

        return bbid;

    }

    /**
     *
     * @param mod_id
     * @param sid
     * @return
     */
    public String getModName(String mod_id, String sid) {

        String data = "";

        if (sid.equals("0")) {

            data = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id)[4];

        } else {

            data = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid)[3];

        }

        return data;

    }

    /**
     *
     */
    public static final int SECONDS_REFERENCE[] = new int[]{60 * 60 * 24, 60 * 60, 60, 1};

    private boolean fixDelayComponent(String name) throws SQLException {
        boolean fixDealy = false;
        String row = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "name='" + name + "'")[0];
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "AC_ID=" + row);
        while (rs.next()) {
            String type = db.getRowNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "id='" + rs.getString("ACTIVITY_ID") + "'")[7];
            if ("delay".equalsIgnoreCase(type)) {
                fixDealy = true;
            }
        }
        db.closeCon();
        return fixDealy;
    }

    /**
     *
     * @param templateId
     * @return
     * @throws SQLException
     */
    public String getServiceTime(String templateId) throws SQLException {
        String data = "";
        double sum = 0;
        String modName = Utils.getModName(mod_id, sid) + "_" + point;
        String[] ids = db.getRow(XMLDataModel.PATH_TEMPLATE_TABLENAME, "id=" + templateId)[3].split("__");
        db.openConres();
        for (int i = 0; i < ids.length; i++) {
            ResultSet rs = db.getData(XMLDataModel.SP_RESULTS_TABLENAME, "*", "MODEL_ID=" + resultId + " AND NAME='" + modName + "' AND SP_ID=" + ids[i]);
            if (rs.next()) {
                sum += rs.getDouble("SERVICE_TIME");
            }
        }
        data = "" + sum;
        return data;
    }

    /**
     *
     * @param templateId
     * @return
     * @throws SQLException
     */
    public String getProcessTime(String templateId) throws SQLException {
        String data = "";
        double sum = 0;
        String modName = Utils.getModName(mod_id, sid) + "_" + point;
        String[] ids = db.getRow(XMLDataModel.PATH_TEMPLATE_TABLENAME, "id=" + templateId)[3].split("__");
        db.openConres();
        for (int i = 0; i < ids.length; i++) {
            ResultSet rs = db.getData(XMLDataModel.SP_RESULTS_TABLENAME, "*", "MODEL_ID=" + resultId + " AND NAME='" + modName + "' AND SP_ID=" + ids[i]);
            if (rs.next()) {
                sum += rs.getDouble("RESPONSE_TIME");
            }
        }
        data = "" + sum;
        return data;
    }

    private void getWorkload(String id) throws SQLException {

        //  System.out.print("ACTIVITY_ID=" + id);
        ResultSet xref = db.getDataNeWcon(XMLDataModel.ACI2ACT_TABLENAME, "*", "SERVICE_ACTIVITY_ID=" + id, con);
        while (xref.next()) {
            String[] workload = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "id=" + xref.getString("AC_INST_ID"), con);
            int type = Integer.parseInt(db.getRowNewCon(XMLDataModel.application_component_desc_TABLENAME, "id=" + workload[2], con)[5]);
            if (type == 2) {
                if (!serverbatch.contains(workload[0])) {
                    serverbatch.add(workload[0]);
                }
                //  System.out.print(serverbatch.size());
            } else {
                if (!serverTrans.contains(workload[0])) {
                    serverTrans.add(workload[0]);
                }
            }
        }

    }

    private Collection<? extends String> getAcList(String string) throws SQLException {
        // System.out.print("called get ac list");
        ArrayList<String> list = new ArrayList<String>();
        ResultSet acid = db.getDataNeWcon(XMLDataModel.ACI2ACT_TABLENAME, "*", "SERVICE_ACTIVITY_ID=" + string, con);
        while (acid.next()) {
            String[] act = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + acid.getString("AC_INST_ID"), con);
            list.add(act[0]);
        }

        return list;
    }

    private String getNodeId(String aciID) {
        String serverId = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + aciID, con)[4];
        String id = db.getRowNewCon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId, con)[2];
        String ServerID = db.getRowNewCon(XMLDataModel.COMPLEX_INST_TABLENAME, "ID=" + id, con)[1];
        String nodeId = db.getRowNewCon(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + ServerID, con)[1];

        return nodeId;
    }
}
