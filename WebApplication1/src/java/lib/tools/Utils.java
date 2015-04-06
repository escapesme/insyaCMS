/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tools;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletResponse;
import lib.Options.XMLDataModel;

/**
 *
 * @author ismail
 */
public class Utils {

    static lib.engine.db.operations db = new lib.engine.db.operations();
    public static String test = "";
    private final static String[] illegal = {"#", "%", "&", "{", "}", "\\", "<", ">", "*", "?", "/", " ", "$", "!", "'", "\"", ":", "@", "+", "`", "|", "="};

    public static String getModName(String mod_id) throws SQLException {

        String data = "";

        if (Utils.isScenario(mod_id)) {

            data = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + mod_id)[3];

        } else {

            data = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id)[4];

        }
        return data;

    }

    public static String getLegalFileName(String filename) throws SQLException {

        String data = filename;

        for (int i = 0; i < illegal.length; i++) {
            data = data.replace(illegal[i], "-");
        }
        return data;

    }

    public static String getModName(String mod_id, String sid) {

        String data = "";

        if (sid.equals("0")) {

            data = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id)[4];

        } else {

            data = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid)[3];

        }
        return data;

    }

    public static String getModelName(String mod_id) {

        String data = "";

        data = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + mod_id)[4];

        return data;

    }

    public static String getResultID(String mod_id, String sid) {
        String data = mod_id;
        if (sid != null) {
            if (!sid.equals("0") && !sid.equals("")) {

                data = sid;

            }
        }

        return data;

    }

    public static String getComponentName(String ComponentNameFull) {
        return ComponentNameFull.split("/")[0].replace("^", "");

    }

    public static String getServerName(String ComponentNameFull) {
        return ComponentNameFull.split("/")[1].replace("^", "");

    }

    public static String getScenarioName(String scenarioId) {
        String name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "ID=" + scenarioId)[3];
        return name;

    }

    public static String getAdminMail() {

        try {
            Context c = new InitialContext();
            Properties p = (Properties) c.lookup("MAILCONFIG");
            return p.getProperty("adminMail");
        } catch (NamingException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public static String sendmail(String to, String from, String Subject, String Text) {
        String result = "";
        try {

            final String id;
            final String password;
            String host;
            String port;

            // Assuming you are sending email from localhost
            Context c = new InitialContext();
            Properties p = (Properties) c.lookup("MAILCONFIG");
            id = p.getProperty("id");
            password = p.getProperty("password");
            host = p.getProperty("host");
            port = p.getProperty("port");

            // Get system properties object
            Properties properties = System.getProperties();

            // Setup mail server
            properties.setProperty("mail.smtp.host", host);
            properties.setProperty("mail.smtp.port", port);
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.starttls.enable", "true");

            // Get the default Session object.
            Authenticator auth = new Authenticator() {
                @Override
                public PasswordAuthentication getPasswordAuthentication() {
                    PasswordAuthentication pa = new PasswordAuthentication(id, password);
                    return pa;
                }
            };
            Session mailSession = Session.getInstance(properties, auth);

            try {
                // Create a default MimeMessage object.
                MimeMessage message = new MimeMessage(mailSession);
                // Set From: header field of the header.
                message.setFrom(new InternetAddress(id));
                // Set To: header field of the header.
                message.addRecipient(Message.RecipientType.TO,
                        new InternetAddress(to));
                // Set Subject: header field
                message.setSubject(Subject);
                // Now set the actual message
                //  message.setText(Text);
                Multipart multipart = new MimeMultipart("alternative");
                MimeBodyPart htmlPart = new MimeBodyPart();

                htmlPart.setContent(Text, "text/html");
                multipart.addBodyPart(htmlPart);
                message.setContent(multipart);
                // Send message
                Transport.send(message);
                result = p.getProperty("successMessage");
            } catch (MessagingException mex) {
                mex.printStackTrace();
                result = "Error: unable to send message....";
            }

        } catch (NamingException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static String getScenarioParent(String scenarioId) {
        String name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "ID=" + scenarioId)[2];
        return name;

    }

    public static String getComponentNameFull(String ComponentName, String ServerName) {

        return ComponentName + "^/^" + ServerName;

    }

    public static String getClassName(String Type) {

        String retunData = "";
        if (Type.equalsIgnoreCase("corporate")) {

            retunData = "com.acrtek.xact_services.data.bo.BoCorporate";

        } else if (Type.equalsIgnoreCase("CORPORATE_BE")) {

            retunData = "com.acrtek.xact.data.bo.BoCorporateToBE";

        } else if (Type.equalsIgnoreCase("business_entity")) {

            retunData = "com.acrtek.xact_services.data.bo.BoBusinessEntity";

        } else if (Type.equalsIgnoreCase("be_be")) {

            retunData = "com.acrtek.xact.data.bo.BoBEToBE";

        } else if (Type.equalsIgnoreCase("BE_BP")) {

            retunData = "com.acrtek.xact.data.bo.BoBEToBP";

        } else if (Type.equalsIgnoreCase("group_node") || Type.equalsIgnoreCase("node")) {

            retunData = "com.acrtek.xact_services.data.bo.BoNode";

        } else if (Type.equalsIgnoreCase("process")) {

            retunData = "com.acrtek.xact.data.bo.BoProcess";

        } else if (Type.equalsIgnoreCase("component")) {

            retunData = "com.acrtek.xact.data.bo.BoComponent";

        } else if (Type.equalsIgnoreCase("task")) {

            retunData = "com.acrtek.xact.data.bo.BoTask";

        } else if (Type.equalsIgnoreCase("act_xref")) {

            retunData = "com.acrtek.xact.data.bo.ActivityACListElement";

        } else if (Type.equalsIgnoreCase("message")) {

            retunData = "com.acrtek.xact.data.bo.BoMessage";

        } else if (Type.equalsIgnoreCase("Activity")) {

            retunData = "com.acrtek.xact.data.bo.BoActivity";

        } else if (Type.equalsIgnoreCase("service_link")) {

            retunData = "com.acrtek.xact.data.bo.BoSPVLine";

        } else if (Type.equalsIgnoreCase("LOGBUF_DESC")) {

            retunData = "com.acrtek.xact_services.data.logical.LOGBUF_DESC";

        } else if (Type.equalsIgnoreCase("LOGBUF_INST")) {

            retunData = "com.acrtek.xact_services.data.logical.LOGBUF_INST";

        } else if (Type.equalsIgnoreCase("CACHE_DESC")) {

            retunData = "com.acrtek.xact_services.data.logical.CACHE_DESC";

        } else if (Type.equalsIgnoreCase("CACHE_INST")) {

            retunData = "com.acrtek.xact_services.data.server.CACHE_INST";

        } else if (Type.equalsIgnoreCase("TABLE_DESC")) {

            retunData = "com.acrtek.xact_services.data.logical.TABLE_DESC";

        } else if (Type.equalsIgnoreCase("TABLE_INST")) {

            retunData = "com.acrtek.xact_services.data.server.TABLE_INST";

        } else if (Type.equalsIgnoreCase("INDEX_DESC")) {

            retunData = "com.acrtek.xact_services.data.logical.INDEX_DESC";

        } else if (Type.equalsIgnoreCase("INDEX_INST")) {

            retunData = "com.acrtek.xact_services.data.server.INDEX_INST";

        } else if (Type.equalsIgnoreCase("SQL_COMPONENT_DESC")) {

            retunData = "com.acrtek.xact_services.data.logical.SQL_COMPONENT_DESC";

        } else if (Type.equalsIgnoreCase("SQL_COMPONENT_INST")) {

            retunData = "com.acrtek.xact_services.data.server.SQL_COMPONENT_INST";

        } else if (Type.equalsIgnoreCase("BASE_SQL_INST")) {

            retunData = "com.acrtek.xact_services.data.server.BASE_SQL_INST";

        } else if (Type.equalsIgnoreCase("COMPLEX_SQL_INST")) {

            retunData = "com.acrtek.xact_services.data.server.COMPLEX_SQL_INST";

        } else if (Type.equalsIgnoreCase("APPLICATION_COMPONENT_INST")) {

            retunData = "com.acrtek.xact_services.data.server.APPLICATION_COMPONENT_INST";

        } else if (Type.equalsIgnoreCase("lineconnector")) {

            retunData = "BoLine";

        } else if (Type.equalsIgnoreCase("BoSegment")) {

            retunData = "com.acrtek.xact_services.data.bo.BoSegment";

        } else {

            retunData = Type;

        }
        return retunData;
    }

    public static String getScenarioPram(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER, String OLDVAL, String Type) {
        String retunData = "";
        retunData = OLDVAL;

        String OBJECT_CLASS = getClassName(Type);
        String wgere = "0";
        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null) {
            wgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "' and OBJECT_CLASS='" + OBJECT_CLASS + "'";

            String[] retd = db.getRow(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wgere);

            if (retd[6] == null || retd[6].equals("")) {
                retunData = OLDVAL;

            } else {

                retunData = retd[6];

            }
        }

        return retunData;
    }

    /**
     * *
     *
     * @param values //"Id", "MODEL_ID", "SCENARIO_ID", "OBJECT_ID",
     * "OBJECT_CLASS", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE"
     * @return
     */
    public static String addScenarioParameters(String[] values) {
        String returnData = "";

        String[][] Datas = {
            {"Id", "MODEL_ID", "SCENARIO_ID", "OBJECT_ID", "OBJECT_CLASS", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE"},
            values
        };
        test += Arrays.deepToString(values) + "<br>";

        returnData = db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, Datas);
        test += returnData;
        return returnData;

    }

    public static String getScenarioPramtest(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER, String OLDVAL, String Type) {
        String retunData = "";
        retunData = OLDVAL;

        String OBJECT_CLASS = getClassName(Type);
        String wgere = "0";
        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null) {
            wgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "' and OBJECT_CLASS='" + OBJECT_CLASS + "'";

            /*
             * String[] retd =
             * db.getRow(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wgere);
             *
             *
             *
             * if (retd[6].equals("") || retd[6] == null) { retunData = OLDVAL;
             *
             * } else {
             *
             * retunData = retd[6];
             *
             * }
             */
        }

        return OBJECT_ID;
    }

    private static boolean contains(String activity, String acId) {
        int count = db.getRowCount(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "ACTIVITY_ID=" + activity + " AND AC_ID=" + acId);
        if (count > 0) {
            return true;
        }
        return false;
    }

    public boolean serachInArray(String[] arr, String value) {
        boolean ret = false;

        //  arr=null;
        for (int index = 0; index < arr.length; index++) {
            if (arr[index].equals(value)) {
                ret = true;

            }

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
        sec = sec.setScale(4, BigDecimal.ROUND_HALF_EVEN);
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

    public static void outPrint(HttpServletResponse response, String data) {
        try {
            PrintWriter out = response.getWriter();
            out.print(data);
        } catch (IOException ex) {
            // Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String getNodeChildrens1(String parentID) throws java.sql.SQLException {

        db.openCon();
        String returnData = "";
        ResultSet ch = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + parentID);

        while (ch.next()) {
            returnData += ch.getString("ID") + "__" + ch.getString("Name") + "__" + ch.getString("type") + "/";
        }

        db.closeCon();

        return returnData;

    }

    public static String getNodeChildrens(String ID) throws java.sql.SQLException {

        xact.viewsClass v = new xact.viewsClass();
        String returnData = "";
        v.impactpathView(ID);

        db.openCon();
        ResultSet ch = db.getData(XMLDataModel.SERVICE_DATA_VIEW, "distinct (NAME),nodes_ID ", "1=1 group by `nodes_ID` ");
        while (ch.next()) {
            returnData += ch.getString("nodes_ID") + "__" + ch.getString("Name") + "__" + "/";
            returnData += getNodeChildrens(ch.getString("nodes_ID"));
        }
        db.closeCon();
        return returnData;
    }

    public static String getBPName(String ID) throws java.sql.SQLException {

        String returnData = "";

        String[] mynodes = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + ID);

        returnData = mynodes[3];
        return returnData;
    }

    public static String getAciNMLName(String ID) throws java.sql.SQLException {

        String returnData = "";

        String[] mynodes = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + ID);
        String lsi = mynodes[4];
        String[] lsiRow = db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + lsi);
        String[] complex = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID=" + lsiRow[2]);
        String partition = db.getRow(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + lsiRow[1])[2];

        partition = partition.replace("Complex", "");
        partition = partition.replace("Part", "");

        returnData = partition.substring(0, partition.length() - 2) + "__" + partition.charAt(partition.length() - 2) + "__" + partition.charAt(partition.length() - 1);
        return partition;
    }

    public static String getBPparent(String parentID) throws java.sql.SQLException {
        String returnData = "";

        String LINKS[] = db.getRow(XMLDataModel.SERVICE_LINK_TABLENAME, "`TO_ID`=" + parentID + "  or `FROM_ID` =" + parentID);

        String[] mynodes = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + LINKS[5]);

        if (mynodes[1].equalsIgnoreCase("process")) {

            returnData = mynodes[3];

        } else {
            getBPparent(mynodes[0]);

        }

        return returnData;
    }

    public static ArrayList<String> getPathToParent(String parentID) throws java.sql.SQLException {
        ArrayList<String> returndata = new ArrayList<String>();

        db.openCon();
        /*
         * ResultSet LINKS = db.getData(XMLDataModel.SERVICE_LINK_TABLENAME,
         * "*", "`TO_ID`=" + parentID + " or `FROM_ID` =" + parentID);
         *
         * while (LINKS.next()) {
         */

        ResultSet mynodes = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "ID=" + parentID);
        while (mynodes.next()) {

            if (mynodes.getString("tag").equalsIgnoreCase("process")) {
                returndata.add(mynodes.getString("ID"));
                returndata.add(mynodes.getString("parent_ID"));
            } else {

                returndata.add(mynodes.getString("ID"));

                returndata.addAll(getPathToParent(mynodes.getString("parent_ID")));

            }
        }

        /*
         * }
         */
        db.closeCon();

        return returndata;

    }

    public static String getbbid(String get) {
        String bbid = "";

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

    public static ArrayList<String> getnodenebor(String id, String type) throws SQLException {
        ArrayList<String> returnarray = new ArrayList<String>();
        db.openCon();

        if (type.equalsIgnoreCase("right")) {

            ResultSet ch = db.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "From_id=" + id);
            while (ch.next()) {
                if (!returnarray.contains(ch.getString("to_id"))) {
                    returnarray.add(ch.getString("to_id"));
                }
                returnarray.addAll(getnodenebor(ch.getString("to_id"), "right"));
            }

        } else if (type.equalsIgnoreCase("left")) {
            ResultSet ch = db.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "to_id=" + id);
            while (ch.next()) {
                returnarray.add(ch.getString("from_id"));
                returnarray.addAll(getnodenebor(ch.getString("from_id"), "left"));
            }

        }

        db.closeCon();
        return returnarray;

    }

    public static String previousNode(String id) throws SQLException {

        db.openCon();
        String returnId = "";

        ResultSet ch = db.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "to_id=" + id);
        if (ch.next()) {
            returnId = ch.getString("from_id");

        }

        db.closeCon();
        return returnId;

    }

    public static String nextNode(String id) throws SQLException {

        db.openCon();
        String returnId = "";

        ResultSet ch = db.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "from_id=" + id);
        if (ch.next()) {
            returnId = ch.getString("to_id");

        }

        db.closeCon();
        return returnId;

    }

    public static String HtmlPalnel(String title, String data) {

        return "<fieldset><legend>" + title + "</legend>" + data + "</fieldset>";

    }

    public static String HtmlPalnel(String title, String data, String addClass) {

        return "<fieldset class='addClass'><legend>" + title + "</legend>" + data + "</fieldset>";

    }

    public static synchronized String getNewID() {
        try {
            Thread.sleep(10);
        } catch (InterruptedException ex) {
        }
        Date td = new Date();
        long sd = td.getTime();
        return "" + sd;
    }
////////////////////////////////////////////ismail

    public static ArrayList<String> getalacs(String get) throws SQLException {
        ArrayList<String> acs = new ArrayList<String>();
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + get);
        while (rs.next()) {
            if (!rs.getString("TAG").equalsIgnoreCase("start") && !rs.getString("TAG").equalsIgnoreCase("end")) {
                if (rs.getString("TAG").equalsIgnoreCase("activity")) {
                    acs.addAll(getacfromactivity(rs.getString("ID")));

                } else {
                    try {
                        acs.addAll(getalacs(rs.getString("ID")));
                    } catch (Exception exception) {
                    }
                }
            }
        }
        return acs;
    }

    public static ArrayList<String[]> getallacs(String get, lib.engine.db.operations db) throws SQLException {
        ArrayList<String[]> acs = new ArrayList<String[]>();

        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + get);
        while (rs.next()) {
            if (!rs.getString("TAG").equalsIgnoreCase("start") && !rs.getString("TAG").equalsIgnoreCase("end")) {
                if (rs.getString("TAG").equalsIgnoreCase("activity")) {

                    String[] mya = {rs.getString("ID"), rs.getString("NAME"), rs.getString("OBC_FLAG")};

                    acs.add(mya);

                } else {
                    try {
                        acs.addAll(getallacs(rs.getString("ID"), db));
                    } catch (Exception exception) {
                    }
                }
            }
        }
        return acs;
    }

    public static ArrayList<String> getAllAcisForSMVDetail(String get) throws SQLException {
        ArrayList<String> acs = new ArrayList<String>();
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + get);
        while (rs.next()) {
            if (!rs.getString("TAG").equalsIgnoreCase("start") && !rs.getString("TAG").equalsIgnoreCase("end")) {
                if (rs.getString("TAG").equalsIgnoreCase("activity")) {
                    acs.addAll(getAciFromaAtivity(rs.getString("ID")));

                } else {
                    try {
                        acs.addAll(getAllAcisForSMVDetail(rs.getString("ID")));
                    } catch (Exception exception) {
                    }
                }
            }
        }
        return acs;
    }

    private static Collection<String> getAciFromaAtivity(String string) throws SQLException {
        db.openCon();

        ArrayList<String> acs = new ArrayList<String>();
        ResultSet rs = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "SERVICE_ACTIVITY_ID=" + string);
        while (rs.next()) {
            String[] act = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + rs.getString("AC_INST_ID"));

            if (act[0] != null && !act[0].equals("") && !act[0].equalsIgnoreCase("null")) {

                String myname = act[0];
                acs.add(myname);

            }
        }

        db.closeCon();
        return acs;
    }

    private static Collection<String> getacfromactivity(String string) throws SQLException {
        db.openCon();

        ArrayList<String> acs = new ArrayList<String>();
        ResultSet rs = db.getData(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "ACTIVITY_ID=" + string);
        while (rs.next()) {
            String[] act = db.getRow(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "ID=" + rs.getString("AC_ID"));

            if (act[0] != null && !act[0].equals("") && !act[0].equalsIgnoreCase("null")) {

                acs.add(act[0]);

            }
        }

        db.closeCon();
        return acs;
    }

    public static String getNodeValue(String id, String table, String value) throws SQLException {
        String output = null;
        db.openCon();
        ResultSet rs = db.getData(table, "*", "id=" + id);
        if (rs.next()) {
            output = rs.getString(value);
        }
        db.closeCon();
        return output;
    }

    public static Vector<String> nextNodes(String id) throws SQLException {
        Vector<String> data = new Vector<String>();
        db.openCon();

        ResultSet ch = db.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "from_id=" + id);
        while (ch.next()) {
            String[] service = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "id=" + ch.getString("to_id"));
            String tag = service[1];
            if (!tag.equalsIgnoreCase("collector")) {
                if (!tag.equalsIgnoreCase("end")) {
                    data.add(ch.getString("to_id"));
                }
            }

        }

        db.closeCon();
        return data;
    }

    public static Vector<String> nextNodeChildren(String id) throws SQLException {
        Vector<String> data = new Vector<String>();
        db.openCon();

        ResultSet ch = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "parent_id=" + id);
        ch.afterLast();
        while (ch.previous()) {
            String tag = ch.getString("TAG");
            if (!(tag.equalsIgnoreCase("start"))) {
                if (!(tag.equalsIgnoreCase("end"))) {
                    data.add(ch.getString("id"));
                }
            }

        }

        db.closeCon();
        return data;
    }

    public static boolean isNotSet(String tod) throws Exception {
        int days = 0;
        int hrs = 0;
        int mins = 0;
        int secs = 0;

        String[] tSegs = tod.split(":");
        if (tSegs.length == 3) {
            try {
                hrs = Integer.parseInt(tSegs[0]);
                mins = Integer.parseInt(tSegs[1]);
                secs = Integer.parseInt(tSegs[2]);
            } catch (NumberFormatException e) {
                throw new Exception("TOD not numeric");
            }

        } else if (tSegs.length == 4) {
            try {
                days = Integer.parseInt(tSegs[0]);
                hrs = Integer.parseInt(tSegs[1]);
                mins = Integer.parseInt(tSegs[2]);
                secs = Integer.parseInt(tSegs[3]);
            } catch (NumberFormatException e) {
                throw new Exception("TOD not numeric");
            }
        } else {
            throw new Exception("Invalid TOD");
        }
        if (days > 0) {
            return false;
        }
        if (hrs > 0) {
            return false;
        }
        if (mins > 0) {
            return false;
        }
        if (secs > 0) {
            return false;
        }
        return true;
    }

    public static int getDaysBetween2DTS(Date date1, Date date2) {

        return (int) ((date1.getTime() - date2.getTime()) / (1000 * 60 * 60 * 24));

    }

    public static String dateFromDate(String date) {

        String retData = date;
        if (!date.equalsIgnoreCase("-")) {

            String[] sdate = date.split("-");
            if (sdate[2] != null) {

                retData = sdate[2] + "/" + sdate[1] + "/" + sdate[0];

            }

        }

        return retData;
    }

    public static String getLocation1FromLine(String lineId, String sID) {
        String location = "";
        String[] linedata = db.getRow(XMLDataModel.LINE_TABLENAME, "id=" + lineId);
        xact.viewsClass v = new xact.viewsClass();
        v.group();
        String[] group = db.getRow(XMLDataModel.GROUP_CONNECTORS_TABLENAME, "NODE_ID1='" + linedata[4] + "' AND NODE_ID2='" + linedata[5] + "'");
        String group1 = group[4];
        String locationId1 = db.getRow(XMLDataModel.NET_GROUP_TABLENAME, "id=" + group1)[2];
        String locationName1 = db.getRow(XMLDataModel.LOCATION_TABLENAME, "id=" + locationId1)[5];
        String where = "SCENARIO_ID='" + sID + "' and  OBJECT_ID='" + group1 + "' and  S_PARAMETER='LOCATION' and OLD_VALUE=" + locationId1;
        String locationName1change = db.getRow(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where)[6];
        if (locationName1change != null && !locationName1change.equals("")) {
            locationName1 = db.getRow(XMLDataModel.LOCATION_TABLENAME, "id=" + locationName1change)[5];
            //Utils.getLocation1FromLine(prodata[0])

        }

        String group2 = group[5];
        String locationId2 = db.getRow(XMLDataModel.NET_GROUP_TABLENAME, "id=" + group2)[2];
        String locationName2 = db.getRow(XMLDataModel.LOCATION_TABLENAME, "id=" + locationId2)[5];
        String where2 = "SCENARIO_ID='" + sID + "' and  OBJECT_ID='" + group2 + "' and  S_PARAMETER='LOCATION' and OLD_VALUE=" + locationId2;
        String locationName2change = db.getRow(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, where2)[6];
        if (locationName2change != null && !locationName2change.equals("")) {
            locationName2 = db.getRow(XMLDataModel.LOCATION_TABLENAME, "id=" + locationName2change)[5];;
            //Utils.getLocation1FromLine(prodata[0])

        }
        return locationName1 + ":" + locationName2;
    }

    public static double getNumber(String beId, String mid, int iteration) {
        double num = 0;
        db.openConres();
        int count = db.getRowCountNocon(XMLDataModel.CAPACITY_PLAN_TABLENAME, "ID=" + mid + " AND PLAN_POINT=" + iteration + " AND BE_ID=" + beId);
        if (count > 0) {
            num = Double.parseDouble(db.getRowNocon(XMLDataModel.CAPACITY_PLAN_TABLENAME, "ID=" + mid + " AND PLAN_POINT=" + iteration + " AND BE_ID=" + beId)[3]);
        } else {
            String[] param = db.getRowNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, "M_ID=" + mid + " AND BE_ID=" + beId);
            double workload = Double.parseDouble(param[5]);
            double increment = Double.parseDouble(param[6]);
            return workload * (1 + ((increment / 100d) * iteration));
        }
        db.closeCon();
        return num;
    }

    public static BigDecimal getBpNumber(String ID, String MID, String tag, String scenarioid, int iteration) throws SQLException {
        BigDecimal returnData = new BigDecimal(BigInteger.ZERO);

        db.openCon();
        if (tag.equalsIgnoreCase("be_bp")) {

            ResultSet mybe_bp = db.getData(XMLDataModel.BE_BP_TABLENAME, "*", "BP_TO_ID=" + ID + " AND MODEL_ID=" + MID);

            while (mybe_bp.next()) {
                BigDecimal uf = new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));
                uf = new BigDecimal(getScenarioPram(MID, scenarioid, mybe_bp.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Be_Bp"));

                returnData = returnData.add(getBpNumber(mybe_bp.getString("BE_FROM_ID"), MID, "be_be", scenarioid, iteration).multiply(uf));

            }
        }

        if (tag.equalsIgnoreCase("be_be")) {

            test += ID + "<br>";
            ResultSet mybe_bp = db.getData(XMLDataModel.BE_BE_TABLENAME, "*", "BE_TO_ID=" + ID + " AND MODEL_ID=" + MID);
            String[] mycorporate = db.getRowNocon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "id=" + ID + " AND MODEL_ID=" + MID);
            String Number = mycorporate[4];
            Number = getScenarioPram(MID, scenarioid, mycorporate[0], "NUMBER", Number, "BUSINESS_ENTITY");
            test += "has results=" + hasResults(ID, getResultID(MID, scenarioid), iteration) + "<br>";
            if (hasResults(ID, getResultID(MID, scenarioid), iteration)) {
                double num = getNumber(ID, getResultID(MID, scenarioid), iteration);

                Number = "" + num;
            }

            BigDecimal beNumber = new BigDecimal(Number);

            if (beNumber.compareTo(BigDecimal.ZERO) < 0) {
                beNumber = BigDecimal.ZERO;
            }

            if (beNumber.compareTo(BigDecimal.ZERO) > 0) {
                return beNumber;
            } else {
                while (mybe_bp.next()) {

                    BigDecimal uf = new BigDecimal(mybe_bp.getString("UTILIZATION_FREQUENCY"));

                    uf = new BigDecimal(getScenarioPram(MID, scenarioid, mybe_bp.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Be_Be"));

                    String id = mybe_bp.getString("BE_FROM_ID");

                    beNumber = beNumber.add(getBpNumber(id, MID, "be_be", scenarioid, iteration).multiply(uf));
                    returnData = beNumber;

                }
                db.closeCon();

                db.openCon();
                ResultSet mycorporate_be = db.getData(XMLDataModel.CORPORATE_BE_TABLENAME, "*", " BE_TO_ID=" + ID + " AND MODEL_ID=" + MID);

                // Teststring += "found corp link <br>";
                while (mycorporate_be.next()) {

                    String[] mycorporate2 = db.getRowNocon(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + MID);

                    String Number2 = mycorporate2[3];
                    Number2 = getScenarioPram(MID, scenarioid, mycorporate[0], "NUMBER", Number2, "CORPORATE");
                    // Teststring += Number2 + "<br>";
                    BigDecimal uf = new BigDecimal(mycorporate_be.getString("UTILIZATION_FREQUENCY"));
                    uf = new BigDecimal(getScenarioPram(MID, scenarioid, mycorporate_be.getString("ID"), "UTILIZATION_FREQUENCY", uf.toString(), "Corporate_be"));
                    double all = Double.parseDouble(Number2) * uf.doubleValue();
                    //Teststring+= "number"+all;

                    returnData = returnData.add(new BigDecimal(all));

                }

            }

        }

        // DB.closeCon();
        return returnData;
    }

    static boolean hasResults(String beid, String resultsID, int iteration) {
        boolean data = false;
        db.openConres();
        ResultSet rs = db.getData(XMLDataModel.CAPACITY_PLAN_TABLENAME, "*", "ID=" + resultsID + " AND PLAN_POINT=" + iteration + " AND BE_ID=" + beid);
        try {
            if (rs.next()) {
                data = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        }
        ResultSet rs2 = db.getData(XMLDataModel.PARAMSYSTEM_TABLENAME, "*", "M_ID=" + resultsID + " AND BE_ID=" + beid);
        try {
            if (rs2.next()) {
                data = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
        return data;
    }

    public static boolean isScenario(String sid) throws SQLException {
        boolean scen = false;
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.SCENARIO_TABLENAME, "*", "ID=" + sid);
        if (rs.next()) {
            return true;
        }
        db.closeCon();

        return scen;

    }

    public static String getMOdelId(String sid) throws SQLException {
        String mid = "";
        ResultSet rs = db.getData(XMLDataModel.SCENARIO_TABLENAME, "*", "ID=" + sid);
        if (rs.next()) {
            mid = rs.getString("MODEL_ID");
        }
        return mid;
    }

    public static String getProjectId(String mid) throws SQLException {
        String pid = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.PMXREF_TABLENAME, "*", "mid=" + mid);
        if (rs.next()) {
            pid = rs.getString("pid");
        }
        db.closeCon();
        return pid;
    }

    public static String numberFormat(double number, int type) {

        /* NumberFormat numberFormat = NumberFormat.getInstance();

         numberFormat.setMinimumFractionDigits(type);
         numberFormat.setMaximumFractionDigits(type);

         String n1 = numberFormat.format(number);*/
        DecimalFormat formatter = new DecimalFormat("#.######");

        return formatter.format(number);
    }

    public static String getImageFolder() throws NamingException {
        String data = "";
        Context c = new InitialContext();
        Properties p = (Properties) c.lookup("XActImages");
        data = p.getProperty("image_store");
        return data;
    }

    public static String getCloudFolder() throws NamingException {
        String data = "";
        Context c = new InitialContext();
        Properties p = (Properties) c.lookup("XActImages");
        data = p.getProperty("image_store") + "/cloud_view/";
        return data;
    }

    public static String getNodeValue(String id, String table, String value, String search) throws SQLException {
        String output = null;
        db.openConres();

        ResultSet rs = db.getData(table, "*", search + "=" + id);
        if (rs.next()) {
            output = rs.getString(value);
        }
        db.closeCon();
        return output;
    }

    public static String getModelFolder() throws NamingException {
        String data = "";
        Context c = new InitialContext();
        Properties p = (Properties) c.lookup("WORKINGDIR");
        data = p.getProperty("exports");
        return data;
    }

    public static String getModelFolderWorking_directory() throws NamingException {
        String data = "";
        Context c = new InitialContext();
        Properties p = (Properties) c.lookup("WORKINGDIR");
        data = p.getProperty("working_directory");
        return data;
    }

    public static boolean isNumeric(String str) {
        try {
            double d = Double.parseDouble(str);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }

    public static String alert(String str) {
        String r = " alert('" + str + "'); \n ";

        return r;

    }

    public static String alert(String str, boolean tag) {
        String r = " <script>alert('" + str + "');</script> \n ";

        return r;

    }

    public static boolean mdlFileExists(String name) {
        List<String> mdls = Arrays.asList(XMLDataModel.ORIGINAL_FILES);
        return mdls.contains(name);
    }

}
