/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;
import lib.tools.Utils;

/**
 *
 * @author Ahmed
 */
public class DatabaseImport {

    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     *
     * @param f The csv file to read its content
     * @return
     */
    public String readTable(File f) {
        String tableData = "";
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(f));
        } catch (FileNotFoundException ex) {
            Logger.getLogger(DatabaseImport.class.getName()).log(Level.SEVERE, null, ex);
        }

        String temp;
        try {
            while ((temp = reader.readLine()) != null) {
                tableData += temp + ";";
            }
        } catch (IOException ex) {
            Logger.getLogger(DatabaseImport.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tableData;
    }

    /**
     *
     * @param tableRows tableRows the records to be inserted in the database
     * separated by ';' for rows and ',' for columns
     * @return
     */
    public String displayTable(String tableRows) {
        String data = "";
        data += "<table>";
        String[] rows = tableRows.split(";");
        for (int i = 0; i < rows.length; i++) {
            String innerRows[] = rows[i].split(",");
            for (int j = 0; j < innerRows.length; j++) {
                data += " <tr><td></td></tr>";
            }

        }

        return data;
    }

    /**
     *
     * @param tableRows tableRows the records to be inserted in the database
     * separated by ';' for rows and ',' for columns
     * @return
     */
    public String saveData(String tableRows) {
        String out = "";

        String[] rows = tableRows.split(";");
        for (int i = 0; i < rows.length; i++) {
            String innerRows[] = rows[i].split(",");
            String myid2 = Utils.getNewID();
            String[][] dataxref = {{"ID", "NAME", "DB_NAMESPACE_DESC_ID", "CACHE_DESC_ID", "USEFUL_SIZE", "ROW_LEN", "INDEX_TYPE_NAME", "TOT_NUM_INDEX", "DEFAULT_IND"},
                {myid2, innerRows[0], innerRows[4], innerRows[3], innerRows[1], innerRows[2], "!!!!", "0", "0"}};
            out += db.setInsert(XMLDataModel.TABLE_DESC_TABLENAME, dataxref);
        }
        if (out.equals("")) {
            out = "Data save sucessfully";
        }

        return out;
    }

    /**
     *
     * @param tableRows tableRows the records to be inserted in the database
     * separated by ';' for rows and ',' for columns
     * @return
     */
    public String saveIndexData(String tableRows) {
        String out = "";

        String[] rows = tableRows.split(";");
        for (int i = 0; i < rows.length; i++) {
            String innerRows[] = rows[i].split(",");
            String myid2 = Utils.getNewID();
            String[][] dataxref = {{"ID", "NAME", "TABLE_DESC_ID", "USEFUL_SIZE", "INDEX_TYPE_NUM", "ROW_LEN", "DEFAULT_IND"},
                {myid2, innerRows[0], innerRows[1], innerRows[2], "2", innerRows[3], "0"}};



            out += db.setInsert(XMLDataModel.INDEX_DESC_TABLENAME, dataxref);


        }
        if (out.equals("")) {
            out = "Data save sucessfully";
        }
        return out;
    }

    /**
     *
     * @param tableRows tableRows the records to be inserted in the database
     * separated by ';' for rows and ',' for columns
     * @param proId
     * @return
     */
    public String saveCacheData(String tableRows, String proId) {
        String out = "";

        String[] rows = tableRows.split(";");
        for (int i = 0; i < rows.length; i++) {
            String innerRows[] = rows[i].split(",");
            String myid2 = Utils.getNewID();
            String[][] dataxref = {{"ID", "PROJECT_ID", "CACHE_NAME", "CACHE_SIZE", "PAGE_SIZE"},
                {myid2, proId, innerRows[0], innerRows[2], innerRows[1]}};



            out += db.setInsert(XMLDataModel.CACHE_DESC_TABLENAME, dataxref);


        }
        if (out.equals("")) {
            out = "Data save sucessfully";
        }
        return out;
    }

    public String saveSqlData(String tableRows, String sqlInstId) {
        String out = "";
        String[] ids = sqlInstId.split(",");
        String instanceId = ids[0];
        String descId = ids[1];
        String modelId = ids[2];
        String[] rows = tableRows.split(";");
        for (int i = 0; i < rows.length; i++) {
            String innerRows[] = rows[i].split(",");
            String myid2 = Utils.getNewID();
            String[][] desc = {{"ID", "SQL_COMPONENT_DESC_ID", "TABLE_DESC_ID", "INDEX_DESC_ID", "MODEL_ID", "NAME", "ORDER_TYPE", "NUM_MONOTONIES"},
                {myid2, descId, innerRows[4], innerRows[5], modelId, innerRows[0], innerRows[1], "0"}};

            String tableInstId = db.getRow(XMLDataModel.TABLE_INST_TABLENAME, "TABLE_DESC_ID=" + innerRows[4])[0];

            out += db.setInsert(XMLDataModel.BASE_SQL_DESC_TABLENAME, desc);
            String myid = Utils.getNewID();
            String[][] inst = {{"ID", "BASE_SQL_DESC_ID", "SQL_COMPONENT_INST_ID", "TABLE_INST_ID", "MODEL_ID", "ORDER_FREQ", "JOIN_MISSES", "ACCESS_PER_TRAN", "DISPERSMENT", "PREFETCH"},
                {myid, myid2, instanceId, tableInstId, modelId, "0", innerRows[3], innerRows[2], innerRows[6], "0"}};



            out += db.setInsert(XMLDataModel.BASE_SQL_INST_TABLENAME, inst);

        }
        if (out.equals("")) {
            out = "Data save sucessfully";
        }
        return out;
    }

    public String updateSqlData(String tableRows, String sqlInstId) {
        String out = "";
        String[] ids = sqlInstId.split(",");
        String instanceId = ids[0];
        String descId = ids[1];
        
        String[] rows = tableRows.split(";");
        for (int i = 0; i < rows.length; i++) {
            String innerRows[] = rows[i].split(",");
            
            String[][] desc = {{ "ORDER_TYPE"},
                {innerRows[0]}};

            

            out += db.setUpdate(XMLDataModel.BASE_SQL_DESC_TABLENAME, desc,"ID="+innerRows[4]);
            
            String[][] inst = {{ "JOIN_MISSES", "ACCESS_PER_TRAN", "DISPERSMENT"},
                {innerRows[2], innerRows[1], innerRows[3]}};



            out += db.setUpdate(XMLDataModel.BASE_SQL_INST_TABLENAME, inst,"ID="+innerRows[5]);

        }
        if (out.equals("")) {
            out = "Data save sucessfully";
        }
        return out;
    }

    /**
     *
     * @param tableRows the records to be inserted in the database separated by
     * ';' for rows and ',' for columns
     * @param proId the project id
     * @return
     */
    public String saveBufferData(String tableRows, String proId) {
        String out = "";

        String[] rows = tableRows.split(";");
        for (int i = 0; i < rows.length; i++) {
            String innerRows[] = rows[i].split(",");
            String myid2 = Utils.getNewID();
            String[][] dataxref = {{"ID", "PROJECT_ID", "NAME", "BUFPOOL_SIZE", "PAGE_SIZE"},
                {myid2, proId, innerRows[0], innerRows[2], innerRows[1]}};



            out += db.setInsert(XMLDataModel.LOGBUF_DESC_TABLENAME, dataxref);


        }
        if (out.equals("")) {
            out = "Data save sucessfully";
        }
        return out;
    }

    /**
     * Gets a list of all caches in this project to be used in the table dialog
     *
     * @param proId the project id
     * @return
     */
    public String getCaches(String proId) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.CACHE_DESC_TABLENAME, "*", "PROJECT_ID=" + proId);
        try {
            while (rs.next()) {
                data += rs.getString("ID") + "__" + rs.getString("CACHE_NAME") + ";";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseImport.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    /**
     * Gets a list of all name spaces in this project to be used in the table
     * dialog
     *
     * @param proId the project id
     * @return
     */
    public String getNamespaces(String proId) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "*", "PROJECT_ID=" + proId);
        try {
            while (rs.next()) {
                data += rs.getString("ID") + "__" + rs.getString("NAME") + ";";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseImport.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    /**
     * Gets a list of all tables in this project to be used in the index dialog
     *
     * @param proId the project id
     * @return
     */
    public String getTables(String proId) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "*", "PROJECT_ID=" + proId);
        try {
            while (rs.next()) {
                ResultSet tableRs = db.getData(XMLDataModel.TABLE_DESC_TABLENAME, "*", "DB_NAMESPACE_DESC_ID=" + rs.getString("ID"));
                while (tableRs.next()) {
                    data += tableRs.getString("ID") + "__" + tableRs.getString("NAME") + ";";
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseImport.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public String getIndeces(String tableId) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.INDEX_DESC_TABLENAME, "*", "TABLE_DESC_ID=" + tableId);
        try {
            while (rs.next()) {

                data += rs.getString("ID") + "__" + rs.getString("NAME") + ";";


            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseImport.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
}
