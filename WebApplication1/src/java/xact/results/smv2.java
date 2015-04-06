/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact.results;

import java.math.BigDecimal;
import java.math.RoundingMode;
import lib.Options.XMLDataModel;
import java.sql.*;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Locale;
import lib.tools.Utils;
import xact.utils;

/**
 *
 * @author ismail
 */
public class smv2 {

    String id = "";
    String mod_id = "";
    String sid = "";
    double get_service = 0;
    double get_elon = 0;
    double get_rsponse, get_tpmax, get_tpactual, get_a1, get_a2, get_a3, get_a4 = 0;
    String point = "";
    double servicTimeIdeal, maxTP, responseTime, tpActual, a1, a2, a3, a4 = 0;
    double maxrestime = 0;
     String resultId="";
    public smv2(String myid, String mymid, String mysid, String mypoint) {

        id = myid;
        mod_id = mymid;
        sid = mysid;
        point = mypoint;
        resultId=Utils.getResultID(mod_id, sid);

    }
    xact.results.resultes rx = new xact.results.resultes("", "", "", "", "", "");
    public double net, server, serverBatch, humen, machen, Transport = 0;
    public double dvl = 0;
    lib.engine.db.operations db = new lib.engine.db.operations();
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
    int counters = 0;
    String reurntest = "";
    utils u = new utils();

    public String getSMVTableValues(String id, String Type, String Type1) throws SQLException, ParseException {

 String returndata = "";
        sid = sid.trim();
        id = id.trim();
        mod_id = mod_id.trim();
        point = point.trim();
//returndata+="parent_id=" + id.trim();
        String modname = getModName(mod_id, sid) + "_" + point;
        String resultId=Utils.getResultID(mod_id, sid);
        String data = "";

        Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionString);

        String retunall = "";

        ResultSet rs = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "parent_id=" + id.trim(), con);

        //reurntest=id;

        while (rs.next()) {

            if (rs.getString("TAG").equalsIgnoreCase("activity")) {
                if (u.getISScenarioPram(mod_id, sid, rs.getString("ID"), "ACTIVE_STATUS").equals("-1")) {
                   // returndata+="activity id="+rs.getString("ID");
                ResultSet rsasct = db.getDataNeWcon(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "activity_id=" + rs.getString("id"), con);


                while (rsasct.next()) {
                    ResultSet acrow = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "*", "id=" + rsasct.getString("AC_id"), con);



                    double response = 0, elon2 = 0, st = 0, thro = 0;
                    double down = 0;

                    if (acrow.next()) {

                        data += "scenario id is" + sid + "<br>";
                        down = rx.getDownTime(acrow.getString("NODE_ID"));
                    }


                    reurntest += "MOD_NAME='" + modname + "' and VAL0='APPLICATION_COMPONENT' AND VAL1='" + acrow.getString("NAME").split("/")[1].replace("^", "") + "' AND VAL4='" + acrow.getString("NAME").split("/")[0].replace("^", "") + "' <br/>";



                    Connection con2 = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);

                    ResultSet resultrow = db.getDataNeWcon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "MOD_NAME='" + modname.trim() + "' and VAL0='APPLICATION_COMPONENT' AND VAL1='" + acrow.getString("NAME").split("/")[1].replace("^", "") + "' AND VAL4='" + acrow.getString("NAME").split("/")[0].replace("^", "") + "' AND RESULT_ID="+resultId, con2);

                    ResultSet resultchr = db.getDataNeWcon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "MOD_NAME='" + modname.trim() + "' and VAL0='CACHE_A_PER_COMPONENT' AND VAL1='" + acrow.getString("NAME").split("/")[1].replace("^", "") + "' AND VAL4='" + acrow.getString("NAME").split("/")[0].replace("^", "") + "' AND RESULT_ID="+resultId, con2);

                    ResultSet resultAyehaga = db.getDataNeWcon(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", "MOD_NAME='" + modname.trim() + "' and VAL0='FLOW_COMP' AND VAL2='" + acrow.getString("NAME").split("/")[0].replace("^", "") + "'AND RESULT_ID="+resultId, con2);
//returndata+="MOD_NAME='" + modname.trim() + "' and VAL0='FLOW_COMP' AND VAL2='" + acrow.getString("NAME").split("/")[0].replace("^", "") + "'AND RESULT_ID="+resultId+"<br>";

                    //while(resultrow.next()){
                    // String[] getrow_is = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID=" + getrow[0]);
                    double chr = 0;

                    if (resultrow != null) {
                        if (resultrow.next()) {
                            counters++;


                            reurntest += "type Is:" + resultrow.getString("VAL5") + "<Br/>";


                            if (resultrow.getString("VAL5").trim().equalsIgnoreCase(Type) || resultrow.getString("VAL5").trim().equalsIgnoreCase(Type1)) {

                                elon2 = Double.parseDouble(resultrow.getString("VAL8"));

                                response = Double.parseDouble(resultrow.getString("VAL7"));
                                
                                
                                
                                
                                
                                if (resultrow.getString("VAL15") != null) {
                                    st = Double.parseDouble(resultrow.getString("VAL15"));

                                }
                                thro = 1 / Double.parseDouble(resultrow.getString("VAL7"));

                                double resultAyehaga2 = 0;

                                while (resultchr.next()) {



                                    chr = Double.parseDouble(resultchr.getString("VAL8"));



                                }



                                double impact = 0;
                                if (chr != 0) {
                                    impact = ((100 / chr) * 100) - 100;
                                }

                                while (resultAyehaga.next()) {

                                    resultAyehaga2 = Double.parseDouble(resultAyehaga.getString("VAL5"));

                                }


                                String headerTitle = acrow.getString("NAME").split("/")[1].replace("^", "");

                                if (!headers.contains(headerTitle)) {





                                    headers_id.add(acrow.getString("NODE_ID"));

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



                                

                                double service_time = (st)-(st)*(1-((chr)/100));
                                double LossTP = 0;
                                double MaxTP = 1 / Double.parseDouble(resultrow.getString("VAL13"));
                                if(Type.equalsIgnoreCase("2")){
                                    double number=Double.parseDouble(resultrow.getString("VAL12"));
                                    double val8=Double.parseDouble(resultrow.getString("VAL8"));
                                    if(!fixDelayComponent(resultrow.getString("VAL4")+"^/^"+resultrow.getString("VAL1")))
                                    response=response*number;
                                    service_time=response/((val8/100)+1);
                                    
                                    
                                    
                                    if(impact!=0)
                                        service_time = (st)-(st)*(1-((chr)/100));
                                }
                                

                                data += response + "__this is st " + Math.round(1 / st) + "__" + thro + "__" + elon2;
                                String this_row = "";
                                this_row += "<tr class=\"st_child ch_" + myindes + "\" >";
                                this_row += "<td>Component " + "</td>";
                               
                                this_row += "<td>" + acrow.getString("NAME").split("/")[0].replace("^", "") + "</td>";
                                this_row += "<td style=\"text-align:center\">" + convertToDHMS(service_time) + "</td>";


                                this_row += "<td style=\"text-align:center\">" + Math.round(MaxTP) + "</td>";
                                
                                String  datar=convertToDHMS(response) ;
                                
                                if (response<1){
                                
                                    
                                    datar =response+"";
                                    
                                datar=  "0"+datar.substring(4)+"s";
                                
                                }
                                
                                this_row += "<td style=\"text-align:center\">" + response+ "</td>";
                                
                                
                                
                                
                                
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
                                this_row += "<td style=\"text-align:center\">" + Math.round(resultAyehaga2) + "</td>";
                                this_row += "</tr>";



                                if (rowsresponse.get(myindes) < response) {
                                    rowsMaxtp.set(myindes, new Double(Math.round(MaxTP)));
                                    rowsservice.set(myindes, new Double(service_time));
                                    rowsresponse.set(myindes, new Double(response));
                                    rowstpactual.set(myindes, new Double(thro));
                                    rowsa1.set(myindes, new Double(elon2));
                                    rowsa2.set(myindes, new Double(down));
                                    rowsa3.set(myindes, new Double(impact));
                                    rowsa4.set(myindes, new Double(resultAyehaga2));
                                }

                                if (!rows.contains(this_row)) {
                                    String dd = rows.get(myindes).replace(this_row, "");

                                    rows.set(myindes, dd + this_row);





                                }



                                double du = elon2 + down + impact + resultAyehaga2;
                                if (du > dvl) {
                                    dvl = du;
                                }


                                server += response;
                            }


                        }

                        db.closeConNewcon(con2);






                    }
                }
            }
            } else if (!rs.getString("TAG").equalsIgnoreCase("end") && !rs.getString("TAG").equalsIgnoreCase("start")) {



                reurntest += "myid:" + rs.getString("id") + "<br/>";

                retunall += getSMVTableValues(rs.getString("id"), Type, Type1);





            }



        }
        db.closeConNewcon(con);

       



        for (int i = 0; i < headers.size(); i++) {



            responseTime = rowsresponse.get(i);
            servicTimeIdeal = rowsservice.get(i);
            tpActual = rowstpactual.get(i);
            a1 = rowsa1.get(i);
            a2 = rowsa2.get(i);
            a3 = rowsa3.get(i);
            a4 = rowsa4.get(i);
            if (rowsresponse.get(i) > getServerBatch_rsponse) {
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
            returndata += "<tr class=\"st_sub_parent pa_" + i + " \" id=\"" + i + " \" ><td >" + val[10] + " </td>" + "<td>" + headers.get(i) + " </td><td  style=\"text-align:center\">" + convertToDHMS(servicTimeIdeal) + "</td>" + "<td  style=\"text-align:center\">" + Math.round(rowsMaxtp.get(i)) + "</td><td  style=\"text-align:center\">" + convertToDHMS(responseTime) + "</td><td  style=\"text-align:center\">" + Math.round(tpActual) + "</td><td  style=\"text-align:center\">"
                    + Math.round(LossTP2)
                    + "%</td><td  style=\"text-align:center\">" + Math.round(a1) + "%</td><td  style=\"text-align:center\">" + Math.round(a2) + "%</td><td  style=\"text-align:center\">" + Math.round(a3) + "%</td><td  style=\"text-align:center\">" + Math.round(a4) + "%</td></tr>"
                    + rows.get(i);



        }






        return returndata;




    }

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




        String data = getSMVTableValues(id, Type, Type1);
        String ret = "";



        if (!Type.equals("10")) {




            if (!data.equals("")) {

                String mytpmax = "0";
                if (get_tpmax != 0 && get_tpactual != 0) {

                    mytpmax = "" + Math.round(((get_tpmax - get_tpactual) / get_tpmax) * 100);

                }


                if (get_service != 0 || get_rsponse != 0 || get_elon != 0) {
                    ret = "<tr class=\"st_parent\"><td>" + title + "</td><td></td><td style=\"text-align:center\">"
                            + convertToDHMS(get_service) + "</td><td style=\"text-align:center\" >" + Math.round(get_tpmax) + "</td><td style=\"text-align:center\">"
                            + convertToDHMS(get_rsponse) + "</td><td style=\"text-align:center\">" + Math.round(get_tpactual) + "</td><td style=\"text-align:center\">" + mytpmax + "%</td><td style=\"text-align:center\">"
                            + Math.round(get_elon) + "%</td> <td style=\"text-align:center\">" + Math.round(get_a2) + "%</td><td style=\"text-align:center\">" + Math.round(get_a3) + "%</td><td style=\"text-align:center\">" + Math.round(get_a4) + "%</td></tr>" + data;
                }
            }


        } else {


            ret = getNetwork();

        }
        return ret;

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
    double getServerBatch_service, getServerBatch_rsponse, getServerBatch_elon = 0;

    
    public String getNetworkChild(String id) throws SQLException {
        String modname = getModName(mod_id, sid) + "_" + point;
        lib.tools.Utils u = new Utils();
        String result_id = u.getResultID(mod_id, sid);
        String returnDataall = "";
        Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionString);
        ResultSet rs = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "parent_id=" + id, con);
        while (rs.next()) {
            if (rs.getString("TAG").equalsIgnoreCase("service")) {
                ResultSet rsasct = db.getDataNeWcon(XMLDataModel.S2S_XREF_TABLENAME, "*", "S2S_ID=" + rs.getString("id"), con);
                int myrsasctnum = db.getRowCount(XMLDataModel.S2S_XREF_TABLENAME, "S2S_ID=" + rs.getString("id"));
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


                    returnDataall +=
                            "<tr class=\"net_child\" ><td>Logical Message </td>";
                    returnDataall += "<td >" + rsascttxt[2] + "</td>";
                    returnDataall += "<td style=\"text-align:center\">" + convertToDHMS(ServeicTime) + "</td>";

                    returnDataall += "<td style=\"text-align:center\">" + Math.round(throupot) + "</td>";

                    returnDataall += "<td style=\"text-align:center\">" + convertToDHMS(responesTime) + "</td>";

                    returnDataall += "<td style=\"text-align:center\">" + Math.round(throupot) + "</td>";

                    returnDataall += "<td style=\"text-align:center\">" + 0 + "</td>";
                    returnDataall += "<td style=\"text-align:center\">" + Math.round(ELon) + "%</td>";
                    returnDataall += "<td style=\"text-align:center\">0%</td>";
                    returnDataall += "<td style=\"text-align:center\">0%</td>";
                    returnDataall += "<td style=\"text-align:center\">0%</td>";
                    returnDataall += "</tr>";

                    net += responesTime;
                    db.closeConNewcon(conres);
                }




            } else {


                returnDataall += getNetworkChild(rs.getString("id"));
            }





        }

        db.closeConNewcon(con);

        return returnDataall;
    }
    double getNetworkservice = 0;
    double getNetworkresponse = 0;
    double getNetworkelon = 0;
    double getNetworkeLosstp = 0;
    double getNetworktp = 0;
    double getNetworkmaxtp = 0;
    public double gettotallTime = 0;

    public String getNetwork() throws SQLException {
        String returnData = "";



        String otherdata = getNetworkChild(id);
        if (getNetworkservice != 0 || getNetworkresponse != 0 || getNetworkelon != 0) {
            returnData = "<tr class=\"net_parent\" ><td>Network</td><td></td><td style=\"text-align:center\" >" + convertToDHMS(getNetworkservice) + "</td><td style=\"text-align:center\" >" + Math.round(getNetworkmaxtp) + "</td><td style=\"text-align:center\" >" + convertToDHMS(getNetworkresponse) + "</td><td   style=\"text-align:center\">" + Math.round(getNetworktp) + "</td><td style=\"text-align:center\" >" + Math.round(getNetworkeLosstp) + "</td><td style=\"text-align:center\" >" + Math.round(getNetworkelon) + "%</td><td style=\"text-align:center\" >0%</td><td style=\"text-align:center\" >0%</td><td style=\"text-align:center\" >0%</td></tr>";
        }


        returnData = returnData + otherdata;
        return returnData;

    }

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
                returnDataall +=
                        "<tr class=\"net_child\" ><td>Preparation Task</td>";
                returnDataall += "<td ></td>";
                returnDataall += "<td style=\"text-align:center\">" + rs.getString("name") + "</td>";

                returnDataall += "<td style=\"text-align:center\"></td>";

                returnDataall += "<td style=\"text-align:center\">" + convertToDHMS(occurence) + "</td>";

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
    public String outtest = "";

    public String getOther() throws SQLException {
        String returnData = "";



        String otherdata = getotherNeighbor("");



        if (gettotallTime != 0) {
            returnData = "<tr class=\"net_parent\" ><td>Other</td><td>" + outtest + "</td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" >" + convertToDHMS(gettotallTime) + "</td><td   style=\"text-align:center\"></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td><td style=\"text-align:center\" ></td></tr>";
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
            if(!processedids.contains(s)){
           // returndata += getOtherChild(s);
            returndata += getotherNeighbor(s);
            processedids.add(s);
            }
        }





        return returndata;
    }
    ArrayList<String> processedids=new ArrayList<String>();
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

    private String getLineName(String producer, String consumer) {
        String name = "";
        String node_pr = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID=" + producer)[5];
        String node_cons = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID=" + consumer)[5];
        String host_cons = db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + node_cons)[2];
        String host_prod = db.getRow(XMLDataModel.NODE_TABLENAME, "ID=" + node_pr)[2];
        name = host_prod + "->" + host_cons;
        return name;
    }

    public String getModName(String mod_id, String sid) {

        String data = "";

        if (sid.equals("0")) {


            data = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id)[4];

        } else {

            data = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid)[3];


        }






        return data;

    }
    private double getduration(String modelId){
        double  duration=0;
        String[] corporate=db.getRow(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID="+modelId);
        duration=Double.parseDouble(corporate[5])*SECONDS_REFERENCE[Integer.parseInt(corporate[6])];
        return duration;
    }
    public static final int SECONDS_REFERENCE[] = new int[]{60*60*24,60*60,60,1};

    private boolean fixDelayComponent(String name) throws SQLException {
        boolean fixDealy=false;
       String row=db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME,  "name='"+name+"'")[0];
       db.openCon();
      ResultSet rs=db.getData(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "AC_ID="+row) ;
       while (rs.next()){
            String type=db.getRowNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME,  "id='"+rs.getString("ACTIVITY_ID") +"'")[7];
            if("delay".equalsIgnoreCase(type))
                fixDealy=true;
       }
       db.closeCon();
        return fixDealy;
    }
    public String getServiceTime(String templateId) throws SQLException{
        String data="";
        double sum=0;
        String modName=Utils.getModName(mod_id, sid)+"_"+point;
        String []ids=db.getRow(XMLDataModel.PATH_TEMPLATE_TABLENAME, "id="+templateId)[3].split("__");
        db.openConres();
        for(int i=0;i<ids.length;i++){
            ResultSet rs=db.getData(XMLDataModel.SP_RESULTS_TABLENAME, "*", "MODEL_ID="+resultId+" AND NAME='"+modName+"' AND SP_ID="+ids[i]);
            if(rs.next()){
                sum+=rs.getDouble("SERVICE_TIME");
            }
        }
        data=""+sum;
        return data;
    }
    public String getProcessTime(String templateId) throws SQLException{
        String data="";
        double sum=0;
        String modName=Utils.getModName(mod_id, sid)+"_"+point;
        String []ids=db.getRow(XMLDataModel.PATH_TEMPLATE_TABLENAME, "id="+templateId)[3].split("__");
        db.openConres();
        for(int i=0;i<ids.length;i++){
            ResultSet rs=db.getData(XMLDataModel.SP_RESULTS_TABLENAME, "*", "MODEL_ID="+resultId+" AND NAME='"+modName+"' AND SP_ID="+ids[i]);
            if(rs.next()){
                sum+=rs.getDouble("RESPONSE_TIME");
            }
        }
        data=""+sum;
        return data;
    }
}