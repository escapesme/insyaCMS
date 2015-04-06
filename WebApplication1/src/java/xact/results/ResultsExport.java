/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.results;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import lib.Options.DbInfo;
import lib.Options.XMLDataModel;
import lib.tools.Utils;

/**
 *
 * @author Ahmed
 */
public class ResultsExport {

    lib.engine.db.operations db = new lib.engine.db.operations();
    public String[] AcresultsFildesArray = {"VAL1", "VAL6", "VAL7", "VAL8", "VAL10", "VAL12", "VAL13", "VAL14", "VAL15", "VAL16", "VAL17", "VAL18", "VAL19", "VAL20", "VAL21", "VAL22"};
    public String[] AcresultsValuesArray = {"Server Name", "CPU Rate", "Response Time", "Elongation", "Throughput", "Arrival Rate", "CPU Time", "Job no Physical IO", "Service Time", "Wait Time", "IO Time", "AUX Time", "Lock Time", "IOD Time", "IOP Time", "Tempo Time"};
    public String[] trhoughputresultsFieldsArray = {"AC_NAME", "THRUPUT", "SCALABILITY", "EFFICIENCY", "MAX_THRUPUT"};
    public String[] trhoughputresultsValuesArray = {"AC Name", "Throughput", "Scalability", "Effeciency", "Max Throughput"};

    /**
     * Creates the key - value array for the columns used in the detail results
     * export
     *
     * @return
     * @throws SQLException
     */
    public String getNewDetailColumns() throws SQLException {
        String data = "";
        for (int i = 0; i < AcresultsFildesArray.length; i++) {
            data += AcresultsFildesArray[i] + "__" + AcresultsValuesArray[i] + ";";
        }
        return data;
    }

    /**
     * Creates the key - value array for the columns used in the throughput
     * results export
     *
     * @return
     * @throws SQLException
     */
    public String getThroughputColumns() throws SQLException {
        String data = "";
        for (int i = 0; i < trhoughputresultsFieldsArray.length; i++) {
            data += trhoughputresultsFieldsArray[i] + "__" + trhoughputresultsValuesArray[i] + ";";
        }
        return data;
    }

    /**
     * Gets the name of an object from its id and key values
     *
     * @param id
     * @param key
     * @return
     */
    private String getObjectName(String id, String key) {
        String name = "";
        Connection con = db.openDBConNewcon(DbInfo.connectionString);
        if (key.equalsIgnoreCase("BoBusinessProcess")) {
            name = db.getRowNewCon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + id, con)[3];
        } else {
            name = db.getRowNewCon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + id, con)[2];

        }
        db.closeConNewcon(con);
        return name;
    }

    /**
     * Creates a string containing the CSV for the detail results to be
     * exported.
     *
     * @param start Starting results point
     * @param end End results point
     * @param fields Field set to exported in the file
     * @param resultsId Scenario or model id
     * @param modelName Scenario or model name
     * @return
     * @throws SQLException
     */
    public String exportDetailResults(int start, int end, String fields, String resultsId, String modelName, boolean cache, boolean io) throws SQLException {

        String csv = "";
        String header = "";
        String[] fieldSet = fields.split(",");
        for (int i = 0; i < fieldSet.length; i++) {
            int index = Arrays.asList(AcresultsFildesArray).indexOf(fieldSet[i].trim());
            if (i != 0) {
                header += ",";
            }
            header += AcresultsValuesArray[index];
        }
        if (cache) {
            header += ",Cache Usage";
        }
        if (io) {
            header += ",Cache Size";
            header += ",IO";
        }
        db.openConres();
        String where = "";
        for (int i = start; i <= end; i++) {
            csv += "Plan Point " + i + " Records";
            csv += "\n\n";
            csv += "Component Name," + header;
            csv += "\n";
            where = "VAL0='APPLICATION_COMPONENT' AND RESULT_ID=" + resultsId + " AND MOD_NAME='" + modelName + "_" + i + "'";
            ResultSet rs = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", where);
            while (rs.next()) {
                csv += rs.getString("VAL4") + ",";
                for (int j = 0; j < fieldSet.length; j++) {
                    csv += rs.getString(fieldSet[j]) + ",";
                }
                if (cache) {
                    where = "VAL0='CACHE_A_PER_COMPONENT' AND RESULT_ID=" + resultsId + " AND MOD_NAME='" + modelName + "_" + i + "' AND VAL1='" + rs.getString("VAL1") + "' AND VAL4='" + rs.getString("VAL4") + "'";
                    ResultSet cacheResults = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", where);
                    if (cacheResults.next()) {
                        csv += cacheResults.getString("VAL8") + ",";

                    } else {
                        csv += "N/A,";
                    }
                }
                if (io) {
                    where = "VAL0='CACHE_PER_CACHE' AND RESULT_ID=" + resultsId + " AND MOD_NAME='" + modelName + "_" + i + "' AND VAL1='" + rs.getString("VAL1") + "'";
                    ResultSet cacheResults = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", where);
                    if (cacheResults.next()) {
                        csv += cacheResults.getString("VAL5") + ",";
                        csv += cacheResults.getString("VAL3") + ",";

                    } else {
                        csv += "N/A,";
                        csv += "N/A,";
                    }
                }
                csv += "\n";
            }
            csv += "\n";
        }
        db.closeCon();
        return csv;
    }

    /**
     * Creates a string containing the CSV for the throughput results to be
     * exported.
     *
     * @param start Starting results point
     * @param end End results point
     * @param fields Field set to exported in the file
     * @param resultsId Scenario or model id
     * @param modelName Scenario or model name
     * @return
     * @throws SQLException
     */
    public String exportThroughputResults(int start, int end, String fields, String resultsId, String modelName) throws SQLException {

        String csv = "";
        String header = "";
        String compundName = "";
        String[] fieldSet = fields.split(",");
        db.openConres();
        for (int i = 0; i < fieldSet.length; i++) {
            int index = Arrays.asList(trhoughputresultsFieldsArray).indexOf(fieldSet[i].trim());
            if (i != 0) {
                header += ",";
            }
            header += trhoughputresultsValuesArray[index];
        }

        String where = "";
        for (int i = start; i <= end; i++) {
            csv += "Plan Point " + i + " Records";
            csv += "\n\n";
            csv += "Object Name," + header;
            csv += "\n";
            where = "RESULT_ID=" + resultsId + " AND MOD_NAME='" + modelName + "_" + i + "'";

            ResultSet rs = db.getData(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, "*", where);

            while (rs.next()) {
                compundName = rs.getString("TPR_KEY");

                csv += getObjectName(compundName.split("_")[0], compundName.split("_")[1]) + ",";
                for (int j = 0; j < fieldSet.length; j++) {
                    csv += rs.getString(fieldSet[j]) + ",";
                }
                csv += "\n";
            }
            csv += "\n";
        }
        db.closeCon();
        return csv;
    }

    /**
     *
     * @param start Starting results point
     * @param end End results point
     * @param fields Field set to exported in the file
     * @param resultsId Scenario or model id
     * @param modelName Scenario or model name
     * @return
     * @throws SQLException
     */
    public String exportXMLThroughputResults(int start, int end, String fields, String resultsId, String modelName) throws SQLException {

        String csv = "";
        String header = "";
        String compundName = "";
        String[] fieldSet = fields.split(",");
        csv += "<?xml version=\"1.0\"?>";
        csv += " <ss:Workbook xmlns:ss=\"urn:schemas-microsoft-com:office:spreadsheet\">";

        db.openConres();
        for (int i = 0; i < fieldSet.length; i++) {
            int index = Arrays.asList(trhoughputresultsFieldsArray).indexOf(fieldSet[i].trim());
            if (i != 0) {
                header += ",";
            }
            header += trhoughputresultsValuesArray[index];
        }
        String[] headers = header.split(",");
        String where = "";
        for (int i = start; i <= end; i++) {
            csv += "<ss:Worksheet ss:Name=\"Plan Point " + i + " Records\">";

            csv += " <ss:Table>";
            for (int k = 0; k < headers.length; k++) {
                csv += "<ss:Column ss:Width=\"120\"/>";
            }
            csv += "<ss:Row>";
            csv += "<ss:Cell><><ss:Data ss:Type=\"String\" xmlns=\"http://www.w3.org/TR/REC-html40\"><B>Object Name</B></ss:Data></ss:Cell>";
            for (int k = 0; k < headers.length; k++) {
                csv += "<ss:Cell ><ss:Data ss:Type=\"String\"  xmlns=\"http://www.w3.org/TR/REC-html40\"> <B>" + headers[k] + "</B></ss:Data></ss:Cell>";
            }
            csv += "</ss:Row>";
            where = "RESULT_ID=" + resultsId + " AND MOD_NAME='" + modelName + "_" + i + "'";

            ResultSet rs = db.getData(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, "*", where);

            while (rs.next()) {
                compundName = rs.getString("TPR_KEY");
                csv += "<ss:Row>";
                csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + getObjectName(compundName.split("_")[0], compundName.split("_")[1]) + "</ss:Data></ss:Cell>";

                for (int j = 0; j < fieldSet.length; j++) {
                    csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + rs.getString(fieldSet[j]) + "</ss:Data></ss:Cell>";

                }
                csv += "</ss:Row>";
            }
            csv += "</ss:Table>";
            csv += "</ss:Worksheet>";
        }
        csv += " </Workbook>";
        db.closeCon();
        return csv;
    }

    /**
     *
     * @param start Starting results point
     * @param end End results point
     * @param fields Field set to exported in the file
     * @param resultsId Scenario or model id
     * @param modelName Scenario or model name
     * @return
     * @throws SQLException
     */
    public String exportXMLDetailResults(int start, int end, String fields, String resultsId, String modelName, boolean cache, boolean io) throws SQLException {

        String csv = "";
        String header = "";

        String[] fieldSet = fields.split(",");
        csv += "<?xml version=\"1.0\"?>";
        csv += " <ss:Workbook xmlns:ss=\"urn:schemas-microsoft-com:office:spreadsheet\">";
        db.openConres();
        for (int i = 0; i < fieldSet.length; i++) {
            int index = Arrays.asList(AcresultsFildesArray).indexOf(fieldSet[i].trim());
            if (i != 0) {
                header += ",";
            }
            header += AcresultsValuesArray[index];
        }
        if (cache) {
            header += ",Cache Usage";
        }
        if (io) {
            header += ",Cache Size";
            header += ",IO";
        }
        String[] headers = header.split(",");
        String where = "";
        for (int i = start; i <= end; i++) {
            csv += "<ss:Worksheet ss:Name=\"Plan Point " + i + " Records\">";

            csv += " <ss:Table>";
            for (int k = 0; k < headers.length; k++) {
                csv += "<ss:Column ss:Width=\"120\"/>";
            }
            csv += "<ss:Row>";
            csv += "<ss:Cell><ss:Data ss:Type=\"String\" xmlns=\"http://www.w3.org/TR/REC-html40\"><B>Component Name</B></ss:Data></ss:Cell>";
            for (int k = 0; k < headers.length; k++) {
                csv += "<ss:Cell><ss:Data ss:Type=\"String\" xmlns=\"http://www.w3.org/TR/REC-html40\"><B>" + headers[k] + "</B></ss:Data></ss:Cell>";
            }
            csv += "</ss:Row>";
            where = "VAL0='APPLICATION_COMPONENT' AND RESULT_ID=" + resultsId + " AND MOD_NAME='" + modelName + "_" + i + "'";
            ResultSet rs = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", where);

            while (rs.next()) {

                csv += "<ss:Row>";
                csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + rs.getString("VAL4") + "</ss:Data></ss:Cell>";
                for (int j = 0; j < fieldSet.length; j++) {
                    csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + rs.getString(fieldSet[j]) + "</ss:Data></ss:Cell>";

                }
                if (cache) {
                    where = "VAL0='CACHE_A_PER_COMPONENT' AND RESULT_ID=" + resultsId + " AND MOD_NAME='" + modelName + "_" + i + "' AND VAL1='" + rs.getString("VAL1") + "' AND VAL4='" + rs.getString("VAL4") + "'";
                    ResultSet cacheResults = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", where);
                    if (cacheResults.next()) {
                        csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + cacheResults.getString("VAL8") + "</ss:Data></ss:Cell>";

                    } else {
                        csv += "<ss:Cell><ss:Data ss:Type=\"String\">N/A</ss:Data></ss:Cell>";

                    }
                }
                if (io) {
                    where = "VAL0='CACHE_PER_CACHE' AND RESULT_ID=" + resultsId + " AND MOD_NAME='" + modelName + "_" + i + "' AND VAL1='" + rs.getString("VAL1") + "'";
                    ResultSet cacheResults = db.getData(XMLDataModel.NEW_DETAIL_RESULTS_TABLENAME, "*", where);
                    if (cacheResults.next()) {
                        csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + cacheResults.getString("VAL5") + "</ss:Data></ss:Cell>";
                        csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + cacheResults.getString("VAL3") + "</ss:Data></ss:Cell>";

                    } else {
                        csv += "<ss:Cell><ss:Data ss:Type=\"String\">N/A</ss:Data></ss:Cell>";
                        csv += "<ss:Cell><ss:Data ss:Type=\"String\">N/A</ss:Data></ss:Cell>";
                    }
                }
                csv += "</ss:Row>";
            }
            csv += "</ss:Table>";
            csv += "</ss:Worksheet>";
        }
        csv += " </Workbook>";
        db.closeCon();
        return csv;
    }

    public String exportXMLFinancialResults(int start, int end, String values) throws SQLException {

        String csv = "";

        String[] fieldSet = values.split("/");

        csv += "<?xml version=\"1.0\"?>";
        csv += " <ss:Workbook xmlns:ss=\"urn:schemas-microsoft-com:office:spreadsheet\">";

        for (int i = 0; i < fieldSet.length; i++) {
            String[] innerfieldSet = fieldSet[i].split("::");
            String[] data = innerfieldSet[2].split(";");
            String[] proData = data[0].split("__");
            String[] costData = data[1].split("__");
            String[] elonData = data[2].split("__");
            String bpName = Utils.getBPName(innerfieldSet[0]);

            String Sname = Utils.getModName(innerfieldSet[1]);
            csv += "<ss:Worksheet ss:Name=\" " + bpName + "__" + Sname + " \">";

            csv += " <ss:Table>";

            csv += "<ss:Column ss:Width=\"120\"/>";
            csv += "<ss:Column ss:Width=\"120\"/>";
            csv += "<ss:Column ss:Width=\"120\"/>";
            csv += "<ss:Column ss:Width=\"120\"/>";

            csv += "<ss:Row>";
            csv += "<ss:Cell><ss:Data ss:Type=\"String\" xmlns=\"http://www.w3.org/TR/REC-html40\"><B>Plan Point</B></ss:Data></ss:Cell>";
            csv += "<ss:Cell><ss:Data ss:Type=\"String\" xmlns=\"http://www.w3.org/TR/REC-html40\"><B>Productivity</B></ss:Data></ss:Cell>";
            csv += "<ss:Cell><ss:Data ss:Type=\"String\" xmlns=\"http://www.w3.org/TR/REC-html40\"><B>Cost</B></ss:Data></ss:Cell>";
            csv += "<ss:Cell><ss:Data ss:Type=\"String\" xmlns=\"http://www.w3.org/TR/REC-html40\"><B>Dynamic Complexity</B></ss:Data></ss:Cell>";

            csv += "</ss:Row>";

            for (int k = 0; k < proData.length; k++) {

                csv += "<ss:Row>";
                csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + k + "</ss:Data></ss:Cell>";
                csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + proData[k] + "</ss:Data></ss:Cell>";
                csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + costData[k] + "</ss:Data></ss:Cell>";
                csv += "<ss:Cell><ss:Data ss:Type=\"String\">" + elonData[k] + "</ss:Data></ss:Cell>";

                csv += "</ss:Row>";
            }
            csv += "</ss:Table>";
            csv += "</ss:Worksheet>";

        }
        csv += " </Workbook>";
        db.closeCon();
        return csv;
    }

    public void dataimport() throws IOException {

        String csvFile = "/Users/mkyong/Downloads/GeoIPCountryWhois.csv";
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";

        try {

            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {

                String[] country = line.split(cvsSplitBy);

                System.out.println("Country [code= " + country[4] + " , name=" + country[5] + "]");

            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        System.out.println("Done");
    }

   
    
    
    public ArrayList<String[]> exportimport(String sFileName) throws IOException {

        String csvFile = "GeoIPCountryWhois.csv";
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";

        ArrayList<String[]> twoDArray = new ArrayList<String[]>();

        try {

            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {

                twoDArray.add(line.split(cvsSplitBy));

            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return twoDArray;
    }

    private static void generateCsvFile(String sFileName, String[][] data) {
        try {
            FileWriter writer = new FileWriter(sFileName);

            for (String[] ds : data) {
                for (String d : ds) {
                    writer.append(d);
                    writer.append(',');
                }
                writer.append('\n');
            }
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
