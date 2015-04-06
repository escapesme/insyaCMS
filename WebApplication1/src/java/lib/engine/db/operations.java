/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.sql.Connection;
import java.util.HashMap;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import lib.tools.Utils;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;

/**
 *
 * @author Ismail
 *
 *
 */
public class operations extends HttpServlet implements lib.Options.DbInfo {

    Connection con = null;
    Connection con2 = null;
    Statement st = null;
    ResultSet res = null;
    ResultSetMetaData resMetaData = null;
    String tableName = "";
    String Where = "";
    String cdata = "";
    String Result = "";
    String type = "";
    public String returnSQL = "";
    public String ErrorMsg = "";
    lib.tools.Utils utils = new lib.tools.Utils();

    //<editor-fold defaultstate="collapsed" desc="other">
    public String outPrint(HttpServletResponse response, String data) throws IOException, JspException {
        String fdd = "";

        PrintWriter out = response.getWriter();
        /*
         * try { // out.print(data); } catch (IOException ex) { //
         * Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
         * fdd=ex.getMessage();
         *
         * }
         */
        return fdd;

    }

    public void settableName(String tableName) {
        this.tableName = tableName;
    }

    public void setcdata(String cdata) {
        this.cdata = cdata;
    }

    public void setWhere(String setWhere) {
        this.tableName = Where;
    }

    public void setType(String Type) {
        this.type = Type;
    }

    public Object getResult() {
        Object returnOject = null;
        if (this.type == "get_data") {
            returnOject = this.getData(this.tableName, this.cdata, this.Where);
        }
        return returnOject;

    }

    public ResultSet getSQL(String sql) {
        ResultSet re = null;
        //     this.openCon();
        try {
            Statement st2 = con.createStatement();
            returnSQL = sql;
            re = st2.executeQuery(sql);
        } catch (SQLException ex) {
            this.ErrorMsg = ex.getMessage();

        }
        return re;
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Connection">
    public void closeCon() {
        try {
            if (res != null) {
                if (!res.isClosed()) {
                    res.close();
                    res = null;
                }
            }
            if (st != null) {
                if (!st.isClosed()) {
                    st.close();
                    st = null;
                }
            }
            if (con != null) {
                if (!con.isClosed()) {
                    con.close();
                    con = null;
                }
            }
        } catch (SQLException ex) {
            //utils.outPrint(response, ex.getMessage());
        }

    }

    public boolean isclose() {
        Boolean r = true;
        if (con != null) {

            try {
                r = con.isClosed();
            } catch (SQLException ex) {
                Logger.getLogger(operations.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    public String openCon() {

        String retdata = "";
        retdata = "coseStatus:" + this.isclose() + "---";

        /* if (!this.isclose()) {
         closeCon();
         retdata += "closeed...-----";

         }*/
        retdata += "close:" + this.isclose();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(connectionString, dbUser, dbPassword);
        } catch (SQLException ex) {
            retdata += ex.getMessage();
            //utils.outPrint(response, ex.getMessage());
            Logger.getLogger(operations.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            retdata += "xxx" + ex.getMessage();
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        retdata += "--opened....";

        retdata += "--close:" + this.isclose();
        retdata += "<br/>";

        return retdata;
    }

    public void openConres() {

        /*  if (!this.isclose()) {
         closeCon();
         }*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(connectionStringRes, connectionStringResdbUser, connectionStringResdbPassword);
        } catch (SQLException ex) {
            //     Logger.getLogger(operations.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());

        }
    }

    public void openDBCon(String dburl) {
        try {

            Class.forName("com.mysql.jdbc.Driver");

            if (dburl.equalsIgnoreCase(lib.Options.DbInfo.connectionStringDef)) {

                con = DriverManager.getConnection(dburl, lib.Options.DbInfo.connectionStringDefdbUser, lib.Options.DbInfo.connectionStringDefdbPassword);

            } else if (dburl.equalsIgnoreCase(lib.Options.DbInfo.connectionStringRes)) {
                con = DriverManager.getConnection(dburl, lib.Options.DbInfo.connectionStringResdbUser, lib.Options.DbInfo.connectionStringResdbPassword);

            } else if (dburl.equalsIgnoreCase(lib.Options.DbInfo.connectionStringUsers)) {
                con = DriverManager.getConnection(dburl, lib.Options.DbInfo.connectionStringUsersdbUser, lib.Options.DbInfo.connectionStringUsersdbPassword);

            } else if (dburl.equalsIgnoreCase(lib.Options.DbInfo.connectionStringDef)) {

                con = DriverManager.getConnection(dburl, dbUser, dbPassword);

            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());

        }
    }

    public java.sql.Connection openDBConNewcon(String dburl) {

        java.sql.Connection my = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");

            if (dburl.equalsIgnoreCase(lib.Options.DbInfo.connectionStringDef)) {

                my = DriverManager.getConnection(dburl, lib.Options.DbInfo.connectionStringDefdbUser, lib.Options.DbInfo.connectionStringDefdbPassword);

            } else if (dburl.equalsIgnoreCase(lib.Options.DbInfo.connectionStringRes)) {
                my = DriverManager.getConnection(dburl, lib.Options.DbInfo.connectionStringResdbUser, lib.Options.DbInfo.connectionStringResdbPassword);

            } else if (dburl.equalsIgnoreCase(lib.Options.DbInfo.connectionStringUsers)) {
                my = DriverManager.getConnection(dburl, lib.Options.DbInfo.connectionStringUsersdbUser, lib.Options.DbInfo.connectionStringUsersdbPassword);

            } else if (dburl.equalsIgnoreCase(lib.Options.DbInfo.connectionStringDef)) {

                my = DriverManager.getConnection(dburl, dbUser, dbPassword);

            } else {

                my = DriverManager.getConnection(connectionString, dbUser, dbPassword);

            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        return my;
    }

    public void closeConNewcon(java.sql.Connection mycon) {
        try {

            if (mycon != null) {
                mycon.close();
                mycon = null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="MetaData">
    ////////////////////////////////getData
    ////////////////////////////////getDataToResultSet
    private ResultSetMetaData getFullMyMetaData(String table, String Cdata, String Where) {
        this.openCon();
        String[] maa = null;
        int i = 0;

        try {
            st = con.createStatement();
            if (Where != "") {
                Where = " Where " + Where;
            }
            ;

            res = st.executeQuery("SELECT " + Cdata + " FROM " + table + " " + Where);

            resMetaData = res.getMetaData();

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }
        this.closeCon();
        return resMetaData;
    }

    public ResultSetMetaData getMyMetaData(String table) {
        resMetaData = this.getFullMyMetaData(table, "*", "");
        return resMetaData;
    }

    public ResultSetMetaData getMyMetaData(String table, String Cdata) {
        resMetaData = this.getFullMyMetaData(table, Cdata, "");
        return resMetaData;
    }

    public ResultSetMetaData getMyMetaData(String table, String Cdata, String Where) {
        resMetaData = this.getFullMyMetaData(table, Cdata, Where);
        return resMetaData;
    }

    ////////////////////////////////getData
    private ResultSetMetaData getFullMyMetaDataNocon(String table, String Cdata, String Where) {

        String[] maa = null;
        int i = 0;

        try {
            st = con.createStatement();
            if (Where != "") {
                Where = " Where " + Where;
            }

            res = st.executeQuery("SELECT " + Cdata + " FROM " + table + " " + Where);

            resMetaData = res.getMetaData();

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        return resMetaData;
    }

    public ResultSetMetaData getMyMetaDataNocon(String table) {
        resMetaData = this.getFullMyMetaDataNocon(table, "*", "");
        return resMetaData;
    }

    public ResultSetMetaData getMyMetaDataNocon(String table, String Cdata) {
        resMetaData = this.getFullMyMetaDataNocon(table, Cdata, "");
        return resMetaData;
    }

    public ResultSetMetaData getMyMetaDataNocon(String table, String Cdata, String Where) {
        resMetaData = this.getFullMyMetaDataNocon(table, Cdata, Where);
        return resMetaData;
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="getCount">
    public int getRowCountNocon(String table, String Where) {

        int rowCount = 0;

        try {
            st = con.createStatement();
            if (!Where.equals("")) {
                Where = " Where " + Where;
            }

            res = st.executeQuery("SELECT * FROM " + table + " " + Where);
            if (res != null) {

                res.last();
                rowCount = res.getRow();
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        return rowCount;

    }

    public int getRowCountNewcon(String table, String Where, Connection con) {

        int rowCount = 0;

        try {

            ResultSet rescc = this.getDataFullNeWcon(table, "*", Where, con);
            if (rescc != null) {

                rescc.last();
                rowCount = rescc.getRow();
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        return rowCount;

    }

    public int getRowCount(String table, String Where) {

        this.openCon();
        int rowCount = 0;

        // int i = 0;
        try {
            st = con.createStatement();
            if (Where != "") {
                Where = " Where " + Where;
            }
            ;
            res = st.executeQuery("SELECT * FROM " + table + " " + Where);
            if (res != null) {

                res.last();
                rowCount = res.getRow();
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        this.closeCon();

        return rowCount;

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Views">
    private String creatviewFull(String viewName, String AS, String from, String Where) {
        this.openCon();
        String retunData = "";

        try {
            Statement st2 = con.createStatement();
            st2.executeUpdate("DROP VIEW IF EXISTS `" + viewName + "`;");
            String sql = "";
            if (Where.equals("")) {
                sql = "CREATE VIEW  `" + viewName + "` as SELECT " + AS + "  FROM " + from;
            } else {
                sql = "CREATE VIEW  `" + viewName + "` as SELECT " + AS + " FROM " + from + " WHERE " + Where;
            }
            st2.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
            retunData = ex.getMessage();

            //utils.outPrint(response, ex.getMessage());
        }
        this.closeCon();
        return retunData;
    }

    public String creatview(String viewName, String AS, String from) {

        return this.creatviewFull(viewName, AS, from, "");
    }

    public String creatview(String viewName, String AS, String from, String Where) {
        return this.creatviewFull(viewName, AS, from, Where);
    }

    private String creatviewFullNOCON(String viewName, String AS, String from, String Where) {
        //   this.openCon();
        String retunData = "";

        try {
            Statement st2 = con.createStatement();
            st2.executeUpdate("DROP VIEW IF EXISTS `" + viewName + "`;");
            String sql = "";
            if (Where.equals("")) {
                sql = "CREATE VIEW  `" + viewName + "` as SELECT " + AS + "  FROM " + from;
            } else {
                sql = "CREATE VIEW  `" + viewName + "` as SELECT " + AS + " FROM " + from + " WHERE " + Where;
            }
            st2.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
            retunData = ex.getMessage();
        }
        //  this.closeCon();
        return retunData;
    }

    public String creatviewNOCON(String viewName, String AS, String from) {

        return this.creatviewFullNOCON(viewName, AS, from, "");
    }

    public String creatviewNOCON(String viewName, String AS, String from, String Where) {
        return this.creatviewFullNOCON(viewName, AS, from, Where);
    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="getData">
    private ResultSet getDataFull(String table, String Cdata, String Where) {

        ResultSet re = null;
        try {

            Statement st2 = con.createStatement();

            String sql = "";

            if (!Where.equals("")) {
                if (!Cdata.equals("")) {
                    sql = "SELECT " + Cdata + " FROM " + table + " WHERE " + Where;
                } else {

                    sql = "SELECT * FROM " + table + " WHERE " + Where;

                }

            } else {

                if (!Cdata.equals("")) {
                    sql = "SELECT  " + Cdata + "  FROM " + table;
                } else {

                    sql = "SELECT * FROM " + table;

                }

            }

            returnSQL = sql;

            re = st2.executeQuery(sql);

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
            this.ErrorMsg = ex.getMessage();

        }
        return re;
    }

    public ResultSet getData(String table) {
        ResultSet rs = this.getDataFull(table, "*", "");
        return rs;
    }

    public ResultSet getData(String table, String Cdata) {
        ResultSet rs = this.getDataFull(table, Cdata, "");
        return rs;
    }

    public ResultSet getData(String table, String Cdata, String Where) {
        ResultSet rs = this.getDataFull(table, Cdata, Where);
        return rs;
    }

    private ResultSet getDataFullNeWcon(String table, String Cdata, String Where, java.sql.Connection mycon) {
        //  this.openCon();

        ResultSet re = null;
        try {

            Statement st2 = mycon.createStatement();

            String sql = "";
            if (!Where.equals("")) {
                sql = "SELECT * FROM " + table + " WHERE " + Where;
            } else {

                sql = "SELECT * FROM " + table;
            }

            this.returnSQL = sql;

            re = st2.executeQuery(sql);

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }
        // this.closeCon();
        return re;
    }

    public ResultSet getDataNeWcon(String table, java.sql.Connection mycon) {
        ResultSet rs = this.getDataFullNeWcon(table, "*", "", mycon);
        return rs;
    }

    public ResultSet getDataNeWcon(String table, String Cdata, java.sql.Connection mycon) {
        ResultSet rs = this.getDataFullNeWcon(table, Cdata, "", mycon);
        return rs;
    }

    public ResultSet getDataNeWcon(String table, String Cdata, String Where, java.sql.Connection mycon) {
        ResultSet rs = this.getDataFullNeWcon(table, Cdata, Where, mycon);
        return rs;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="getColumn">
    private String[] getFullColumn(String table, String Cdata, String Where) {

        int clu_num = getRowCount(table, Where);
        this.openCon();
        String[] returnArray = null;
        int i = 0;

        try {

            res = this.getDataFull(table, Cdata, Where);

            if (res != null) {

                returnArray = new String[clu_num];

                while (res.next()) {
                    returnArray[i] = res.getString(Cdata);
                    i++;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }
        this.closeCon();
        return returnArray;
    }

    ////////////////////////////////getFullColumn
    private String[] getFullColumnNOCON(String table, String Cdata, String Where) {

        int clu_num = getRowCountNocon(table, Where);

        String[] returnArray = null;
        int i = 0;

        try {
            res = this.getDataFull(table, Cdata, Where);

            if (res != null) {

                returnArray = new String[clu_num];

                while (res.next()) {
                    returnArray[i] = res.getString(Cdata);
                    i++;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }
        // this.closeCon();
        return returnArray;
    }

    public String[] getColumnNOCON(String table, String Cdata) {
        String[] returnData = this.getFullColumnNOCON(table, Cdata, "");
        return returnData;
    }

    public String[] getColumnNOCON(String table, String Cdata, String Where) {
        String[] returnData = this.getFullColumnNOCON(table, Cdata, Where);
        return returnData;
    }

    public String[] getColumn(String table, String Cdata) {
        String[] returnData = this.getFullColumn(table, Cdata, "");
        return returnData;
    }

    public String[] getColumn(String table, String Cdata, String Where) {
        String[] returnData = this.getFullColumn(table, Cdata, Where);
        return returnData;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="getRow">
    private String[] getFullRow(String table, String Where, String cData) {

        this.openCon();
        String[] returnArray = null;

        try {

            ResultSet re = this.getDataFull(table, cData, Where);

            resMetaData = re.getMetaData();
            int clu_num = resMetaData.getColumnCount();
            returnArray = new String[clu_num];

            int mu = 0;

            if (re.next()) {
                for (int c = 0; c < clu_num; c++) {

                    returnArray[c] = re.getString(c + 1);

                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }
        this.closeCon();
        return returnArray;
    }

    public String[] getRow(String table) {
        String[] returnData = this.getFullRow(table, "", "*");
        return returnData;
    }

    public String[] getRow(String table, String Where) {
        String[] returnData = this.getFullRow(table, Where, "*");
        return returnData;
    }

    public String[] getRow(String table, String cData, String Where) {
        String[] returnData = this.getFullRow(table, Where, cData);
        return returnData;
    }

    public String[] getRow(String table, int id) {

        String pid = Integer.toString(id);
        String[] returnData = this.getFullRow(table, "id=" + pid, "*");
        return returnData;
    }

    public String[] getRowMinData(String table, String Where) {

        String[] returnid = this.getFullRow(table, Where, "MIN(ID) AS ID");

        String[] returnData = this.getFullRow(table, "ID='" + returnid[0] + "'", "*");

        return returnData;
    }

    public String[] getRowMinDataNocon(String table, String Where) {

        String[] returnid = this.getFullRowNocon(table, Where, "MIN(ID) AS ID");

        String[] returnData = this.getFullRowNocon(table, "ID='" + returnid[0] + "'", "*");

        return returnData;
    }

    ////////////////////////////////getRow
    ////////////////////////////////getDataToStringarray
    private HashMap<String, String> getFullRowToMap(String table, String Where) {
        HashMap<String, String> map = new HashMap<String, String>();
        this.openCon();

        try {

            ResultSet re = this.getDataFull(table, "*", Where);

            resMetaData = re.getMetaData();
            int clu_num = resMetaData.getColumnCount();

            int mu = 0;

            if (re.next()) {
                for (int c = 0; c < clu_num; c++) {
                    ;
                    map.put(resMetaData.getColumnName(c + 1), re.getString(c + 1));

                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }
        this.closeCon();
        return map;
    }

    public HashMap<String, String> getRowToMap(String table) {

        return this.getFullRowToMap(table, "");
    }

    public HashMap<String, String> getRowToMap(String table, String Where) {

        return this.getFullRowToMap(table, Where);
    }

    public HashMap<String, String> getRowToMap(String table, int id) {

        String pid = Integer.toString(id);

        return this.getFullRowToMap(table, "id=" + pid);
    }

    ////////////////////////////////getRow
    ////////////////////////////////getDataToStringarray
    private String[] getFullRowNocon(String table, String Where, String cData) {

        String[] returnArray = null;

        try {

            ResultSet ress = this.getDataFull(table, cData, Where);

            resMetaData = ress.getMetaData();
            int clu_num = resMetaData.getColumnCount();
            returnArray = new String[clu_num];

            int mu = 0;

            if (ress.next()) {

                for (int c = 0; c < clu_num; c++) {
                    returnArray[c] = ress.getString(c + 1);
                }
            };

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        return returnArray;
    }

    private String[] getFullRowNocon(String table, String Where) {

        String[] returnArray = null;

        try {

            ResultSet ress = this.getDataFull(table, "*", Where);

            resMetaData = ress.getMetaData();
            int clu_num = resMetaData.getColumnCount();
            returnArray = new String[clu_num];

            int mu = 0;

            if (ress.next()) {

                for (int c = 0; c < clu_num; c++) {
                    returnArray[c] = ress.getString(c + 1);
                }
            };

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        return returnArray;
    }

    private String[] getFullRowNewconn(String table, String Where, Connection mycn) {

        String[] returnArray = null;

        try {

            ResultSet ress = this.getDataFullNeWcon(table, "*", Where, mycn);

            resMetaData = ress.getMetaData();
            int clu_num = resMetaData.getColumnCount();
            returnArray = new String[clu_num];

            int mu = 0;

            if (ress.next()) {

                for (int c = 0; c < clu_num; c++) {
                    returnArray[c] = ress.getString(c + 1);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        return returnArray;
    }

    public String[] getRowNewCon(String table, Connection mycn) {
        String[] returnData = this.getFullRowNewconn(table, "", mycn);
        return returnData;
    }

    public String[] getRowNewCon(String table, String Where, Connection mycn) {
        String[] returnData = this.getFullRowNewconn(table, Where, mycn);
        return returnData;
    }

    public String[] getRowNewCon(String table, int id, Connection mycn) {

        String pid = Integer.toString(id);
        String[] returnData = this.getFullRowNewconn(table, pid, mycn);
        return returnData;
    }

    public String[] getRowNocon(String table) {
        String[] returnData = this.getFullRowNocon(table, "");
        return returnData;
    }

    public String[] getRowNocon(String table, String Where) {
        String[] returnData = this.getFullRowNocon(table, Where);
        return returnData;
    }

    public String[] getRowNocon(String table, int id) {

        String pid = Integer.toString(id);
        String[] returnData = this.getFullRowNocon(table, pid);
        return returnData;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="getValue">
    ////////////////////////////////getRow
    ////////////////////////////////getValue
    private String getFullValue(String table, String Cdata, String Where, String id) {
        this.openCon();
        String return_string = "";
        String sql = "";
        try {
            st = con.createStatement();
            if (!id.equalsIgnoreCase("")) {

                Where = " id=" + id;
            }
            res = this.getDataFull(table, Cdata, Where);

            if (res.next()) {

                return_string = res.getString(Cdata);
            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }
        this.closeCon();
        return return_string;

    }

    public String getValue(String table, String Cdata, int id) {
        String pid = Integer.toString(id);
        String returnData = this.getFullValue(table, Cdata, "", pid);
        return returnData;
    }

    public String getValue(String table, String Cdata, String Where) {
        String returnData = this.getFullValue(table, Cdata, Where, "");
        return returnData;
    }
    ////////////////////////////////getValue

    private String getFullValueNocon(String table, String Cdata, String Where, String id) {

        String retData = "null";
        try {
            ResultSet rss = this.getData(table, Cdata, Where);

            while (rss.next()) {

                retData = rss.getString(Cdata);

            }

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());

        }
        return retData;

    }

    public String getValueNocon(String table, String Cdata, int id) {
        String pid = Integer.toString(id);
        String returnData = this.getFullValueNocon(table, Cdata, "", pid);
        return returnData;
    }

    public String getValueNocon(String table, String Cdata, String Where) {
        String returnData = this.getFullValueNocon(table, Cdata, Where, "");
        return returnData;
    }
        ////////////////////////////////getValue

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="setDelete">
    ////////////////////////////////setDelete
    private String setFullDelete(String table, String Where, String id) {

        String returnStatus = "";
        this.openCon();
        try {
            st = con.createStatement();
            String sql = "";
            if (Where != "") {
                sql = "Delete  From " + table + " Where " + Where;
            } else {
                sql = "Delete  From " + table + " Where id=" + id;
            }

            returnSQL = sql;
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
            returnStatus = ex.getMessage();
        }
        this.closeCon();
        return returnStatus;
    }

    public String setDelete(String table, int id) {

        String pid = Integer.toString(id);
        String returndata = this.setFullDelete(table, "", pid);
        return returndata;

    }

    public String setDelete(String table, String Where) {

        String returndata = this.setFullDelete(table, Where, "");
        return returndata;

    }
        ////////////////////////////////setDelete

    ////////////////////////////////setDelete
    private String setFullDeleteNocon(String table, String Where, String id) {

        String returnStatus = "";

        try {
            st = con.createStatement();
            String sql = "";
            if (Where != "") {
                sql = "Delete  From " + table + " Where " + Where;
            } else {
                sql = "Delete  From " + table + " Where id=" + id;
            }
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
            returnStatus = ex.getMessage();
        }

        return returnStatus;
    }

    public String setDeleteNocon(String table, int id) {

        String pid = Integer.toString(id);
        String returndata = this.setFullDeleteNocon(table, "", pid);
        return returndata;

    }

    public String setDeleteNocon(String table, String Where) {

        String returndata = this.setFullDeleteNocon(table, Where, "");
        return returndata;

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Update">
    private String setFullUpdate(String table, String[][] data, String Where, String id) {

        String valus = "";
        String sql = "";
        String er = "";
        for (int i = 0; i < data[0].length; i++) {
            String spli = ",";
            if (i == 0) {
                spli = "";
            }
            ;

            if (data[1][i].indexOf("'") == -1) {

                valus += spli + "`" + data[0][i] + "` = " + "\"" + data[1][i] + "\"";

            } else {

                valus += spli + "`" + data[0][i] + "` = \"" + data[1][i] + "\"";

            }

            valus = valus.replaceAll("\"<@", "");
            valus = valus.replaceAll("@>\"", "");

            valus = valus.replaceAll("\"<'@", "'");
            valus = valus.replaceAll("@'>\"", "'");
        }
        int returnStatus = 0;
        this.openCon();

        try {
            st = con.createStatement();

            if (Where != "") {

                sql = "Update  `" + table + "`  set " + valus + " Where " + Where;
            } else {

                sql = "Update  `" + table + "`  set " + valus + " Where id=" + id;

            }
            this.returnSQL = sql;
            returnStatus = st.executeUpdate(sql);

        } catch (SQLException ex) {

            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());

            er = ex.getMessage();
        }
        this.closeCon();

        return er;
    }

    public String setUpdate(String table, String[][] data, int id) {
        String pid = Integer.toString(id);
        String returndata = this.setFullUpdate(table, data, "", pid);
        return returndata;
    }

    public String setUpdate(String table, String[][] data, String Where) {
        String returndata = this.setFullUpdate(table, data, Where, "");
        return returndata;

    }
////////////////////////////////setUpdate

    private String setFullUpdateNocon(String table, String[][] data, String Where, String id) {

        String valus = "";
        String sql = "";
        String er = "";
        for (int i = 0; i < data[0].length; i++) {
            String spli = ",";
            if (i == 0) {
                spli = "";
            }
            ;

            if (data[1][i].indexOf("'") == -1) {

                valus += spli + "`" + data[0][i] + "` = " + "'" + data[1][i] + "'";
            } else {

                valus += spli + "`" + data[0][i] + "` = " + data[1][i];

            }

            valus = valus.replaceAll("\"<@", "");
            valus = valus.replaceAll("@>\"", "");

            valus = valus.replaceAll("\"<'@", "'");
            valus = valus.replaceAll("@'>\"", "'");

        }
        int returnStatus = 0;
        // this.openCon();

        try {
            st = con.createStatement();

            if (Where != "") {

                sql = "Update  `" + table + "`  set " + valus + " Where " + Where;
            } else {

                sql = "Update  `" + table + "`  set " + valus + " Where id=" + id;

            }
            returnStatus = st.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());

            er = ex.getMessage();
        }
        //  this.closeCon();

        return er;
    }

    public String setUpdateNocon(String table, String[][] data, int id) {
        String pid = Integer.toString(id);
        String returndata = this.setFullUpdateNocon(table, data, "", pid);
        return returndata;
    }

    public String setUpdateNocon(String table, String[][] data, String Where) {
        String returndata = this.setFullUpdateNocon(table, data, Where, "");
        return returndata;

    }

    ////////////////////////////////setUpdate
    ////////////////////////////////setUpdate
    ////////////////////////////////setUpdateValue
    private int setFullUpdateValueNocon(String table, String fieldName, String Value, String Where, String id) {
        String sql = "";
        int returnStatus = 0;

        String return_string = "";
        try {
            st = con.createStatement();
            if (Where != "") {
                sql = "Update  `" + table + "`  set " + fieldName + "=\"" + Value + "\" Where " + Where;
            } else {
                sql = "Update  `" + table + "`  set " + fieldName + "=\"" + Value + "\" Where id=" + id;
            }
            returnStatus = st.executeUpdate(sql);

        } catch (SQLException ex) {

            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + this.tableName).warning(ex.getMessage());
        }

        return returnStatus;
    }

    public int setUpdateValueNocon(String table, String fieldName, String Value, int id) {
        String pid = Integer.toString(id);
        int returndata = this.setFullUpdateValueNocon(table, fieldName, Value, "", pid);
        return returndata;
    }

    public int setUpdateValueNocon(String table, String fieldName, String Value, String Where) {
        int returndata = this.setFullUpdateValueNocon(table, fieldName, Value, Where, "");
        return returndata;

    }

    ////////////////////////////////setUpdateValue
    ////////////////////////////////setUpdateValue
    private int setFullUpdateValue(String table, String fieldName, String Value, String Where, String id) {

        String sql = "";
        int returnStatus = 0;
        this.openCon();
        String return_string = "";
        try {
            st = con.createStatement();
            if (Where != "") {
                sql = "Update  `" + table + "`  set " + fieldName + "=\"" + Value + "\" Where " + Where;
            } else {
                sql = "Update  `" + table + "`  set " + fieldName + "=\"" + Value + "\" Where id=" + id;
            }
            returnStatus = st.executeUpdate(sql);

        } catch (SQLException ex) {
            //utils.outPrint(response, ex.getMessage());
            Logger.getLogger(operations.class.getName()).warning(ex.getMessage());
        }
        this.closeCon();

        return returnStatus;
    }

    public int setUpdateValue(String table, String fieldName, String Value, int id) {
        String pid = Integer.toString(id);
        int returndata = this.setFullUpdateValue(table, fieldName, Value, "", pid);
        return returndata;
    }

    public int setUpdateValue(String table, String fieldName, String Value, String Where) {
        int returndata = this.setFullUpdateValue(table, fieldName, Value, Where, "");
        return returndata;

    }

    //</editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Insert">
    public String setInsert(String table, String[][] data) {

        String retMsg = "";
        String DBflds = "";
        String valus = "";
        String sql = "";
        for (int i = 0; i < data[0].length; i++) {
            String spli = ",";
            if (i == 0) {
                spli = "";
            }
            try {

                if (data[1][i] != null && data[0][i] != null) {
                    DBflds += spli + "`" + data[0][i] + "`";
                    valus += spli + "\"" + data[1][i] + "\"";

                    valus = valus.replaceAll("\"<@", "");
                    valus = valus.replaceAll("@>\"", "");

                    valus = valus.replaceAll("\"<'@", "'");
                    valus = valus.replaceAll("@'>\"", "'");
                }

            } catch (Exception e) {

            }
        }
        int returnStatus = 0;
        this.openCon();
        String return_string = "";
        try {
            st = con.createStatement();

            sql = "INSERT INTO `" + table + "` (" + DBflds + ") VALUES (" + valus + ")";
            returnSQL = sql;
            returnStatus = st.executeUpdate(sql);

        } catch (SQLException ex) {
            //
            //       Logger.getLogger("dfgfdg").log(Level.SEVERE, null, ex);

            Logger.getLogger(operations.class.getName() + ": this message is from Xact Web :" + table).warning(ex.getMessage());
            //utils.outPrint(response, ex.getMessage());
            retMsg = ex.getMessage();

        }
        this.closeCon();
        return retMsg;//Integer.toString(returnStatus);
    }

    public String setInsertNocon(String table, String[][] data) {

        String retMsg = "";
        String DBflds = "";
        String valus = "";
        String sql = "";
        for (int i = 0; i < data[0].length; i++) {

            if (data[1][i] != null && data[0][i] != null) {

                String spli = ",";
                if (i == 0) {
                    spli = "";
                }

                DBflds += spli + "`" + data[0][i] + "`";

                if (data[1][i].equals("NULL") && data[0][i].equalsIgnoreCase("id")) {
                    valus += spli + "" + data[1][i] + "";
                } else {
                    valus += spli + "'" + data[1][i] + "'";
                }
            }
        }
        int returnStatus = 0;

        String return_string = "";
        try {
            st = con.createStatement();

            sql = "INSERT INTO `" + table + "` (" + DBflds + ") VALUES (" + valus + ")";
            returnSQL = sql;
            returnStatus = st.executeUpdate(sql);

        } catch (SQLException ex) {

            this.ErrorMsg = ex.getMessage();
            Logger.getLogger(operations.class.getName()).log(Level.SEVERE, "sdfsdf", ex);

        }

        return retMsg;//Integer.toString(returnStatus);
    }
    //</editor-fold>

}
