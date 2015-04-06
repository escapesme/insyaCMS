/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.users;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lib.Options.MyVariables;
import lib.Options.XMLDataModel;
import lib.tools.Utils;
import net.sf.javainetlocator.InetAddressLocator;
import net.sf.javainetlocator.InetAddressLocatorException;

/**
 *
 * @author es
 */
public class users implements lib.Options.MyVariables {
    lib.engine.db.operations db = new lib.engine.db.operations();
    public String UpdatePass(HttpServletRequest rq) throws InetAddressLocatorException, ParseException {
        String retunstatus = "";
        db.openDBCon(lib.Options.DbInfo.connectionStringUsers);

        HttpSession session = rq.getSession(true);

        String[] userData = db.getRowNocon(XMLDataModel.USER_TABLENAME, " username='" + session.getAttribute("userNameForChange") + "'  and  passwordStatus= 1 ");

        if (userData[0] == null || userData[0].equalsIgnoreCase("null")) {

            userData = db.getRowNocon(XMLDataModel.USER_TABLENAME, " username='" + session.getAttribute("userNameForChange") + "'");

        }
        String[][] UpdatepassStatus = {{"passwordStatus"}, {"2"}};
        db.setUpdateNocon(XMLDataModel.USER_TABLENAME, UpdatepassStatus, " username like '%" + session.getAttribute("userNameForChange") + "-ch-%'");

        String[][] addnewDataupdate = {
            {"username", "passwordStatus"},
            {userData[0] + "-ch-" + Utils.getNewID(), "2"}
        };
        db.setUpdateNocon(XMLDataModel.USER_TABLENAME, addnewDataupdate, "username='" + userData[0] + "'");

        SimpleDateFormat simpleDateformat = new SimpleDateFormat("yyyy-MM-dd");
        String myDate = simpleDateformat.format(new Date());
        String[][] addnewData = {
            {"username", "password", "firstname", "lastname", "phone", "location", "status", "cid", "gid", "pid", "updateDate", "passwordStatus", "email"},
            {userData[0], hash(rq.getParameter("password")), userData[2], userData[3], userData[4], userData[5], userData[6], userData[7], userData[8], userData[9], myDate, "0", userData[12]}
        };

        Arrays.deepToString(addnewData);
        db.setInsertNocon(XMLDataModel.USER_TABLENAME, addnewData);

        ResultSet data222 = db.getData(XMLDataModel.USER_TABLENAME, "*", "  passwordStatus=2 and   username like '%" + session.getAttribute("userNameForChange") + "-ch-%' order by `updateDate` limit 0,3 ");
        String w = "";
        try {
            while (data222.next()) {

                w += " and `username`<>'" + data222.getString("username") + "' ";

            }
        } catch (SQLException ex) {
            Logger.getLogger(users.class.getName()).log(Level.SEVERE, null, ex);
        }

        db.setDeleteNocon(XMLDataModel.USER_TABLENAME, "  passwordStatus=2 and   username like '%" + session.getAttribute("userNameForChange") + "-ch-%' " + w);

        db.closeCon();

        retunstatus = UpdateDon;

        return retunstatus;

    }

    public String CheckNewForUpdate(HttpServletRequest rq) throws InetAddressLocatorException, ParseException {
        String retunstatus = "";
        db.openDBCon(lib.Options.DbInfo.connectionStringUsers);

        HttpSession session = rq.getSession(true);
        String[] userData = db.getRowNocon(XMLDataModel.USER_TABLENAME, " username='" + session.getAttribute("userNameForChange") + "' and   password='" + hash(rq.getParameter("password")) + "' and  ( passwordStatus=0  or passwordStatus=1 )");

        if (userData[0] != null) {

            retunstatus = "<div class=\"failedmsg\">" + userPassWordEg + "</div>";
        } else {

            retunstatus = "success";
        }

        db.closeCon();

        return retunstatus;

    }

    public String CheckPssForUpdate(HttpServletRequest rq) throws InetAddressLocatorException, ParseException {
        String retunstatus = "";
        db.openDBCon(lib.Options.DbInfo.connectionStringUsers);

        HttpSession session = rq.getSession(true);

        String[] userData = db.getRowNocon(XMLDataModel.USER_TABLENAME, "  username='" + session.getAttribute("userNameForChange") + "' and  password='" + hash(rq.getParameter("password")) + "' and  ( passwordStatus=0  or passwordStatus=1 )");

        if (userData[0] != null) {

            retunstatus = "success";
        } else {

            retunstatus = "<div class=\"failedmsg\">" + userPassWordRowng + "</div>";

        }

        db.closeCon();

        return retunstatus;
    }

    int getdays(String userData) {

        int retData = -1;
        try {
            int mydays = Integer.MAX_VALUE;

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = df.parse(userData);

            SimpleDateFormat simpleDateformat = new SimpleDateFormat("yyyy");
            String Year2 = simpleDateformat.format(startDate);
            simpleDateformat = new SimpleDateFormat("dd");
            String day2 = simpleDateformat.format(startDate);
            simpleDateformat = new SimpleDateFormat("MM");
            String m2 = simpleDateformat.format(startDate);

            simpleDateformat = new SimpleDateFormat("yyyy");
            String Year1 = simpleDateformat.format(new Date());
            simpleDateformat = new SimpleDateFormat("dd");
            String day1 = simpleDateformat.format(new Date());
            simpleDateformat = new SimpleDateFormat("MM");
            String m1 = simpleDateformat.format(new Date());

            Calendar cal1 = new GregorianCalendar();
            Calendar cal2 = new GregorianCalendar();

            cal1.set(Integer.parseInt(Year1), Integer.parseInt(m1), Integer.parseInt(day1));
            cal2.set(Integer.parseInt(Year2), Integer.parseInt(m2), Integer.parseInt(day2));

            retData = Utils.getDaysBetween2DTS(cal1.getTime(), cal2.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(users.class.getName()).log(Level.SEVERE, null, ex);
        }

        return retData;
    }

    public boolean isPasswordSoon(HttpServletRequest rq) {
        boolean returnData = false;
        String userData = this.userReturn(rq, "updateDate");
        int dDays = this.getdays(userData);

        if ((MyVariables.PassWordUpdateDasy - MyVariables.PassWordSoonDays) <= dDays) {
            returnData = true;

        }
        return returnData;
    }

    public int daysTillExpeiration(HttpServletRequest rq) {

        String userData = this.userReturn(rq, "updateDate");
        int dDays = this.getdays(userData);

        return MyVariables.PassWordUpdateDasy - dDays;
    }

    public String userLogin(HttpServletRequest rq) throws InetAddressLocatorException, ParseException {

        HttpSession session = rq.getSession(true);
               session.setMaxInactiveInterval(SESSION_TIME  );
        String status = "";
        String retunstatus = "";

        String lsataus = "";

        if (rq.getParameter("username") != null && rq.getParameter("password") != null) {

            db.openDBCon(lib.Options.DbInfo.connectionStringUsers);
            status = db.getValueNocon(XMLDataModel.USER_TABLENAME, "username", " username='" + rq.getParameter("username") + "' and password='" + hash(rq.getParameter("password")) + "' and  (passwordStatus=0 or passwordStatus=1 )");

            String[] userData = db.getRowNocon(XMLDataModel.USER_TABLENAME, " username='" + rq.getParameter("username") + "' and password='" + hash(rq.getParameter("password")) + "' and  (passwordStatus=0  or passwordStatus=1) ");

            if (userData[0] != null && !userData[0].equalsIgnoreCase("null") && !userData[0].equalsIgnoreCase("")) {

                int mydays = Integer.MAX_VALUE;

                if (userData[10] != null && !userData[10].equals("null") && !userData[10].equals("0000-00-00")) {
                    mydays = this.getdays(userData[10]);
                }

                if (MyVariables.PassWordUpdateDasy <= mydays) {

                    String[][] UpdatepassStatus = {{"passwordStatus"}, {"1"}};
                    db.setUpdateNocon(XMLDataModel.USER_TABLENAME, UpdatepassStatus, " username='" + rq.getParameter("username") + "' and (password='" + hash(rq.getParameter("password")) + "' )");

                    session.setAttribute("userNameForChange", rq.getParameter("username"));

                    lsataus = "DateOut";

                } else {

                    session.setAttribute("user_try_login", "0");
                    String u_status = db.getValueNocon(XMLDataModel.USER_TABLENAME, "status", "username='" + status + "'");

                    if (u_status.equals("0")) {

                        retunstatus = "<div class=\"failedmsg\">" + userlocked + "</div>";

                    } else {
         
                        session.setAttribute("user_id", status);
                        try {

                            if (this.userper(rq, "xactweb")) {

                                retunstatus = "<div class=\"successmsg\">" + userloginsuccessfully + "</div>";

                                lsataus = "Success";
                            } else {

                                retunstatus = "<div class=\"successmsg\">" + userloginPer + "</div>";

                                lsataus = "Failure";

                                session.removeAttribute("user_id");
                            }

                        } catch (SQLException ex) {
                            Logger.getLogger(users.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }

                }

            } else {

                if (session.getAttribute("user_try_login") == null) {
                    session.setAttribute("user_try_login", "0");
                } else {
                    int trys = Integer.parseInt(session.getAttribute("user_try_login").toString()) + 1;
                    session.setAttribute("user_try_login", trys);
                    int thtrys = Integer.parseInt(session.getAttribute("user_try_login").toString());

                    if (thtrys > 3) {
                        session.setAttribute("user_try_login", "0");

                        String statusupdate = db.getValueNocon(XMLDataModel.USER_TABLENAME, "username", " username='" + rq.getParameter("username") + "'");

                        if (!statusupdate.equals("")) {
                            db.setUpdateValueNocon(XMLDataModel.USER_TABLENAME, "status", "0", Integer.parseInt(statusupdate));
                        }
                    }
                }

                retunstatus += "<div class=\"failedmsg\">" + userloginfailed + "[" + session.getAttribute("user_try_login").toString() + "]</div>";
                lsataus = "Failure";
            }

            String etype = "";
            retunstatus += lsataus;

            if (lsataus.equals("Success")) {
                etype = lib.Options.AuditLogEvents.LOGIN_SUCCESS;
            } else if (lsataus.equals("DateOut")) {
                retunstatus += "<div class=\"failedmsg\">" + userDateOut + "<a class='UpdatePassWord'> Click here to update password.</a></div>";
            } else {
                etype = lib.Options.AuditLogEvents.LOGIN_FAILURE;

            }

            this.audit_log(rq, etype, lsataus, "login");

        }
        return retunstatus;
    }

    public void audit_log(HttpServletRequest rq, String ev_type, String ev_des, String login) throws InetAddressLocatorException {

        lib.engine.db.operations db = new lib.engine.db.operations();

        db.openDBCon(lib.Options.DbInfo.connectionStringUsers);
        Date now = new Date();

        String time = DateFormat.getTimeInstance(DateFormat.MEDIUM).format(now);
        String date = DateFormat.getDateInstance(DateFormat.SHORT).format(now);
        Locale l = InetAddressLocator.getLocale(rq.getRemoteAddr());

        String mydata[][] = {
            {"username", "time", "date", "ipaddess", "country", "browser", "os", "event_type", "event_description"},
            {rq.getParameter("username"), time, date, rq.getRemoteAddr(), l.getDisplayCountry(), rq.getHeader("User-Agent"), System.getProperty("os.name"), ev_type, ev_des}
        };

        db.setInsertNocon(XMLDataModel.LOGINDATA_TABLENAME, mydata);
        db.closeCon();

    }

    public void audit_log(HttpServletRequest rq, String ev_type, String ev_des) throws InetAddressLocatorException {

        lib.engine.db.operations db = new lib.engine.db.operations();

        db.openDBCon(lib.Options.DbInfo.connectionStringUsers);
        Date now = new Date();

        String time = DateFormat.getTimeInstance(DateFormat.MEDIUM).format(now);
        String date = DateFormat.getDateInstance(DateFormat.SHORT).format(now);
        Locale l = InetAddressLocator.getLocale(rq.getRemoteAddr());
        String mydata[][] = {
            {"username", "time", "date", "ipaddess", "country", "browser", "os", "event_type", "event_description"},
            {this.userReturn(rq, "username"), time, date, rq.getRemoteAddr(), l.getDisplayCountry(), rq.getHeader("User-Agent"), System.getProperty("os.name"), ev_type, ev_des}
        };

        db.setInsertNocon(XMLDataModel.LOGINDATA_TABLENAME, mydata);
        db.closeCon();

    }

    public String useradminLogin(HttpServletRequest rq) {

        HttpSession session = rq.getSession(true);
        String status = "";
        String retunstatus = "";

        String myusername = rq.getParameter("username");

        String mypassword = rq.getParameter("password");

        if (rq.getParameter("username") != null && rq.getParameter("password") != null) {
            lib.engine.db.operations db = new lib.engine.db.operations();

            db.openDBCon(lib.Options.DbInfo.connectionStringUsers);
            status = db.getValueNocon(XMLDataModel.USER_TABLENAME, "id", " username='" + rq.getParameter("username") + "' and password='" + hash(rq.getParameter("password")) + "'");

            db.closeCon();

            if (!status.equals("")) {

                if (!myusername.equals("ismail") && !myusername.equals("shwells")) {

                    retunstatus = "<div class=\"failedmsg\">" + userloginfailed + "</div>";
                } else {
          session.setMaxInactiveInterval(SESSION_TIME*60);
                    session.setAttribute("user_try_login", "0");

                    retunstatus = "<div class=\"successmsg\">" + userloginsuccessfully + "</div>";

                    session.setAttribute("user_admin_id", status);
          // two hours
                }
            }
        }
        return retunstatus;
    }

    public String userlogout(HttpServletRequest rq) {

        HttpSession session = rq.getSession(true);
                  session.setMaxInactiveInterval(SESSION_TIME *60 );
        String status = "";

        if (rq.getParameter("status") != null) {

            if (rq.getParameter("status").equals("logout")) {
                session.removeAttribute("user_id");
                status = "logout";

            }
        }
        return status;
    }

    public String userlogout_do(HttpServletRequest rq) {

        HttpSession session = rq.getSession(true);
   

        session.removeAttribute("user_id");

        return "logout";
    }

    public String userReturn(HttpServletRequest rq, String getData) {

        String dd = "";
        HttpSession session = rq.getSession(true);
        //   if (status.equals("")||status==null||status.equals("null")) {

        if (session.getAttribute("user_id") != null) {

            String uid = session.getAttribute("user_id").toString();

            if (!uid.equals("") && !uid.equals("null")) {

                lib.engine.db.operations db2 = new lib.engine.db.operations();

                db2.openDBCon(lib.Options.DbInfo.connectionStringUsers);
                dd = db2.getValueNocon(XMLDataModel.USER_TABLENAME, getData.trim(), "username='" + uid + "'");
                db2.closeCon();

            }

        } else {

            dd = "";
        }

        return dd;

    }

    public String randomString(int len) {
        String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return sb.toString();
    }

    public String userReturnBy(HttpServletRequest rq, String filed, String Value, String getData) {

        String dd = "";
        HttpSession session = rq.getSession(true);
        //   if (status.equals("")||status==null||status.equals("null")) {

        lib.engine.db.operations db = new lib.engine.db.operations();

        //if (session.getAttribute("user_id") != null) {
        //    String uid = session.getAttribute("user_id").toString();
           // if (!uid.equals("") && uid != null && !uid.equals("null")) {
        db.openDBCon(lib.Options.DbInfo.connectionStringUsers);
        dd = db.getValueNocon(XMLDataModel.USER_TABLENAME, getData.trim(), filed.trim() + "='" + Value.trim() + "'");
        db.closeCon();

         //   }
       // } else {
       //     dd = "";
        // }
        return dd;

    }

    public Boolean userper(HttpServletRequest rq, String getData) throws SQLException {

        BitSet bs = new BitSet();
        String pi = userReturn(rq, "pid");

      //  System.out.print("pi="+pi);
        Boolean retrundta = false;
        if (!pi.equals("")) {
            db.openDBCon(lib.Options.DbInfo.connectionStringUsers);

            ResultSet data222 = db.getData(XMLDataModel.PROFILE_TABLENAME, "*", "pid=" + pi);
            String name = "";
            if (data222.next()) {
                bs = this.blobToBitSet(data222.getBlob("flags"));
                name = data222.getString("name");
            }
            db.closeCon();

            if (getData.equalsIgnoreCase("create")) {
                retrundta = bs.get(0);
                // retrundta=false;
            } else if (getData.equalsIgnoreCase("edit")) {
                retrundta = bs.get(1);
            } else if (getData.equalsIgnoreCase("makeScenario")) {
                retrundta = bs.get(2);

            } else if (getData.equalsIgnoreCase("Compute")) {
                retrundta = bs.get(3);
            } else if (getData.equalsIgnoreCase("admin")) {
                retrundta = bs.get(4);
            } else if (getData.equalsIgnoreCase("delete")) {
                retrundta = bs.get(5);
            } else if (getData.equalsIgnoreCase("xactweb")) {
                retrundta = bs.get(7);

            } else if (getData.equalsIgnoreCase("timebox")) {
                retrundta = true;
            //retrundta = bs.get(10);

            } else if (getData.equalsIgnoreCase("financial")) {
  retrundta = true;
                //retrundta = bs.get(11);

            }

        }

        return retrundta;

    }

    public String hash(String str) {
        MessageDigest msgdigest;
        byte[] digest = null;
        try {
            msgdigest = MessageDigest.getInstance("SHA1");
            msgdigest.update(str.getBytes());
            digest = msgdigest.digest();

        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(users.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < digest.length; i++) {
            str = Integer.toHexString(0xFF & digest[i]);

            if (str.length() < 2) {
                str = "0" + str;
            }
            sb.append(str);
        }

        return sb.toString();

    }

    public BitSet blobToBitSet(Blob blob) throws SQLException {

        BitSet bitSet = new BitSet();

        if (blob != null) {

            byte[] bytes = blob.getBytes(1, (int) blob.length());
            bitSet = fromByteArray(bytes);
        }
        return bitSet;
    }

    private static BitSet fromByteArray(byte[] bytes) {
        BitSet bits = new BitSet();
        for (int i = 0; i < bytes.length * 8; i++) {
            if ((bytes[bytes.length - i / 8 - 1] & (1 << (i % 8))) > 0) {
                bits.set(i);
            }
        }
        return bits;
    }
}
