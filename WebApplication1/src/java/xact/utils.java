/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import com.google.common.collect.Lists;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import lib.Options.XMLDataModel;
import lib.tools.Utils;
import xact.results.rmv;

/**
 *
 * @author ismeil
 */
public class utils {

    public String outProp(String name, String s) {
        try {
            Context c = new InitialContext();
            Properties p = (Properties) c.lookup(name);
            return p.getProperty(s);
        } catch (NamingException ex) {
            Logger.getLogger(utils.class.getName()).log(Level.SEVERE, null, ex);
            return "no properties found";
        }
    }
    lib.engine.db.operations db = new lib.engine.db.operations();

    HashMap<String, String> idsCache = new HashMap<String, String>();
    String[] nodesFildesArray = {"ID", "TAG", "NAME", "Parent_id", "ATTRIB_ID", "ATTRIB_CLASS", "MODEL_ID", "TYPE", "SELECTOR", "DURATION_1", "OCCURENCE", "DURATION_2", "T_O_D", "THROUGHPUT", "STREAMS", "Level", "COMMENT"};
    String[] linksFildesArray = {"ID", "TAG", "NAME", "FROM_ID", "TO_ID", "Parent_id", "ATTRIB_ID", "ATTRIB_CLASS", "MODEL_ID", "TYPE", "UTILIZATION_FREQUENCY"};
    String[] AcFildesArray = {"ID", "MODEL_ID", "COMPLEX", "CPU_FACTOR", "IO_FACTOR", "TO_ID", "Parent_id", "ATTRIB_ID", "ATTRIB_CLASS", "TYPE", "UTILIZATION_FREQUENCY"};

    public Collection<String> getAcifromActivityNodeId(String activity) throws SQLException {
        db.openCon();

        ArrayList<String> acs = new ArrayList<String>();
        ResultSet acid = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "Service_ACTIVITY_ID=" + activity);
        while (acid.next()) {
            String[] act = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID='" + acid.getString("AC_INST_ID") + "'");

            if (act[0] != null && !act[0].equals("") && !act[0].equalsIgnoreCase("null")) {

                acs.add(act[0] + "__" + act[6]);

            }

        }
        db.closeCon();
        return acs;
    }

    public String getNodeId(String aciID) {
        String serverId = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + aciID)[4];
        String id = db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId)[2];
        String ServerID = db.getRow(XMLDataModel.COMPLEX_INST_TABLENAME, "ID=" + id)[1];
        String nodeId = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "ID=" + ServerID)[1];

        return nodeId;
    }

    public List<String> getAllAciInModel(String modelId) {
        List<String> all = new ArrayList<>();
        String[] names = db.getColumn(XMLDataModel.ACI2ACT_TABLENAME, "AC_INST_ID", "MODEL_ID=" + modelId);
        all.addAll(Arrays.asList(names));
        return all;
    }

    public int getNumberProcessors(String serverName, String modelId, String complex, String part) {
        int no = 0;
        String serverId = db.getRow(XMLDataModel.LOGICAL_SERVER_TABLENAME, "NAME ='" + serverName + "Complex" + complex + "Part" + part + "' and MODEL_ID=" + modelId)[0];
        String proc = db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "LOGICAL_SERVER_ID=" + serverId)[4];
        try {
            no = Integer.parseInt(proc);
        } catch (NumberFormatException numberFormatException) {
        }

        return no;
    }

    /**
     *
     * @param parent id of the node to get all included activities
     * @return {@code ArrayList<String>} with all the activities in the passed
     * node
     * @throws SQLException
     */
    public ArrayList<String> getAllactivity(String parent) throws SQLException {
        ArrayList<String> acs = new ArrayList<String>();
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + parent);

        while (rs.next()) {
            if (!rs.getString("TAG").equalsIgnoreCase("start") && !rs.getString("TAG").equalsIgnoreCase("end")) {

                if (rs.getString("TAG").equalsIgnoreCase("activity")) {
                    acs.add(rs.getString("ID") + "__" + rs.getString("NAME"));

                } else {
                    try {
                        acs.addAll(getAllactivity(rs.getString("ID")));
                    } catch (Exception exception) {
                    }

                }
            }
        }
        return acs;
    }

    /**
     * creates a list of application component in an activity
     *
     * @param activity
     * @return collection of all application components in the passed activity
     * @throws SQLException
     */
    /**
     * creates a formated string for time value in the format : dd:hh:mm:ss
     *
     * @param val
     * @return
     * @throws Exception
     */
    public static String validateTOD(String val) throws Exception {
        int dd, hh, mm, ss = 0;
        String[] field = val.split(":");
        if (field.length == 4) {
            int[] ifield = new int[4];
            for (int i = 0; i < field.length; i++) {
                ifield[i] = Integer.valueOf(field[i]).intValue();
            }
            if (ifield[0] < 0 || ifield[0] > 31) {
                throw new Exception("Invalid value for day.");
            } else {
                dd = ifield[0];
            }
            if (ifield[1] < 0 || ifield[1] > 24) {
                throw new Exception("Invalid value for hour.");
            } else {
                hh = ifield[1];
            }
            if (ifield[2] < 0 || ifield[2] > 59) {
                throw new Exception("Invalid value for minutes.");
            } else {
                mm = ifield[2];
            }
            if (ifield[3] < 0 || ifield[3] > 59) {
                throw new Exception("Invalid value for seconds.");
            } else {
                ss = ifield[3];
            }
        } else if (field.length == 3) {
            int[] ifield = new int[3];
            for (int i = 0; i < field.length; i++) {
                ifield[i] = Integer.valueOf(field[i]).intValue();
            }
            dd = 0;
            if (ifield[0] < 0 || ifield[0] > 24) {
                throw new Exception("Invalid value for hour.");
            } else {
                hh = ifield[0];
            }
            if (ifield[1] < 0 || ifield[1] > 59) {
                throw new Exception("Invalid value for minutes.");
            } else {
                mm = ifield[1];
            }
            if (ifield[2] < 0 || ifield[2] > 59) {
                throw new Exception("Invalid value for seconds.");
            } else {
                ss = ifield[2];
            }
        } else {
            throw new Exception("Invalid Time Format please use dd:hh:mm:ss.");
        }
        String str = String.format("%1$02d:%2$02d:%3$02d:%4$02d", dd, hh, mm, ss);
        return str;
    }

    /**
     * deletes all the child objects inside a service node
     *
     * @param parentId node id to delete all its children objects.
     * @throws SQLException
     */
    public void deleteServiceChildren(String parentId) throws SQLException {
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + parentId);
        String currentId = "";
        while (rs.next()) {
            currentId = rs.getString("ID");
            db.setDeleteNocon(XMLDataModel.SERVICE_LINK_TABLENAME, "FROM_ID=" + currentId + " OR TO_ID=" + currentId);
            deleteServiceChildren(currentId);
            db.setDeleteNocon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + currentId);
        }

    }

    /**
     *
     * @param modID
     * @param id
     * @param tabelName
     * @param fildesArray
     * @param X
     * @param Y
     * @return
     * @throws SQLException
     */
    public String duplicateObject(String modID, String id, String tabelName, String[] fildesArray, int X, int Y) throws SQLException {

        String[] DataRow = db.getRow(tabelName, "id=" + id);

        String returnData;

        DataRow[1] = modID;

        /*        if (X < 1000 && Y < 1000) {

         DataRow[X] = "0";
         DataRow[Y] = "0";

         }
         */
        String newId = Utils.getNewID();
        returnData = DataRow[0] + "__" + newId;

        DataRow[0] = newId;

        for (int i = 0; i < DataRow.length; i++) {

            if (DataRow[i] == null || DataRow[i].equalsIgnoreCase("null")) {
                DataRow = removeElements(DataRow, i);
                fildesArray = removeElements(fildesArray, i);

            }

        }
        String[][] data = {
            fildesArray,
            DataRow
        };

        db.setInsert(tabelName, data);

        return returnData;

    }

    /**
     *
     * @param id
     * @param tabelName
     * @param fildesArray
     * @param DataRow
     * @return
     * @throws SQLException
     */
    public static String[] removeElements(String[] array, int deleteMe) {
        List<String> list = new ArrayList<String>(Arrays.asList(array));
        list.remove(deleteMe);

        String[] stockArr = new String[list.size()];
        return list.toArray(stockArr);

    }

    public String duplicateObject(String id, String tabelName, String[] fildesArray, String[] DataRow) throws SQLException {

        String returnData;

        String newId = Utils.getNewID();
        returnData = DataRow[0] + "__" + newId;

        DataRow[0] = newId;

        for (int i = 0; i < DataRow.length; i++) {

            if (DataRow[i] == null || DataRow[i].equalsIgnoreCase("null")) {
                DataRow = removeElements(DataRow, i);
                fildesArray = removeElements(fildesArray, i);

            }

        }

        String[][] data = {
            fildesArray,
            DataRow
        };

        String other = db.setInsert(tabelName, data);
        return returnData + "__" + other + "__<br/>" + "<br/>";

    }

    /**
     * Copy the service including all the child nodes down to the activity
     * level.
     *
     * @param modelId
     * @param oldParentId
     * @param newParentId
     * @param level
     * @return
     * @throws SQLException
     */
    public String copyServiceObjects(String modelId, String oldParentId, String newParentId, String level, String process_id) throws SQLException {

        String returnData = "";
        String newId = "";
        String oldId = "";
        String newFromId = "";
        String newToId = "";
        String newLinkId = "";
        Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionString);

        ResultSet rs = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + oldParentId, con);
        while (rs.next()) {
            String[] row = db.getRowNewCon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "id=" + rs.getString("ID"), con);

            newId = Utils.getNewID();
            oldId = row[0];
            row[0] = newId;
            row[3] = newParentId;
            row[6] = modelId;
            //row[3] = process_id;

            if (row[4] == null || row[4].equalsIgnoreCase("null")) {
                row[4] = "100";
            }
            idsCache.put(oldId, newId);

            for (int i = 0; i < row.length; i++) {

                if (row[i] == null || row[i].equalsIgnoreCase("null")) {
                    row = removeElements(row, i);
                    nodesFildesArray = removeElements(nodesFildesArray, i);

                }

            }

            String[][] data = {
                nodesFildesArray,
                row
            };

            returnData += db.setInsert(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, data);
            if (row[1].equalsIgnoreCase("process") || row[1].equalsIgnoreCase("component") || (row[1].equalsIgnoreCase("task") && !row[7].equalsIgnoreCase("preparation"))) {
                copyServiceObjects(modelId, oldId, newId, "2", process_id);
            }
            if (!level.equalsIgnoreCase("1")) {
                String[][] childData = {
                    {"PARENT_ID", "CHILD_ID"},
                    {newParentId, newId}
                };
                returnData += db.setInsert(XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME, childData);
            }
            if (row[1].equalsIgnoreCase("activity")) {
                //updateXref(modelId,newId,oldId);
            }
        }
        ResultSet linksRs = db.getDataNeWcon(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "PARENT_ID=" + oldParentId, con);
        while (linksRs.next()) {

            String[] row = db.getRowNewCon(XMLDataModel.SERVICE_LINK_TABLENAME, "id=" + linksRs.getString("ID"), con);
            newFromId = idsCache.get(row[3]);
            newToId = idsCache.get(row[4]);
            newLinkId = Utils.getNewID();
            row[0] = newLinkId;
            row[3] = newFromId;
            row[4] = newToId;
            row[8] = modelId;
            row[5] = newParentId;

            if (row[6] == null || row[6].equalsIgnoreCase("null")) {
                row[6] = "100";
            }
            String[][] data = {
                linksFildesArray,
                row
            };
            returnData += "<br>link data=" + Arrays.deepToString(data) + "<br>";
            returnData += db.setInsert(XMLDataModel.SERVICE_LINK_TABLENAME, data);

        }
        db.closeConNewcon(con);
        return returnData;

    }

    private void updateXref(String modelId, String newId, String oldId) throws SQLException {
        String acId = "";
        String newAcId = "";
        db.openCon();
        ResultSet actXref = db.getData(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "ACTIVITY_ID=" + oldId);
        while (actXref.next()) {
            acId = actXref.getString("AC_ID");
            String[] acrow = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + acId);
            newAcId = Utils.getNewID();
            acrow[0] = newAcId;
            acrow[1] = modelId;

        }
    }

    /**
     * gets the service view tree for a business trajectory object down to the
     * activity level
     *
     * @param bpId
     * @param sid
     * @param level
     * @return
     * @throws SQLException
     */
    /**
     *
     * @param bpId
     * @param modelId
     * @param sid
     * @param level
     * @return String representing the html code for the service tree.
     * @throws SQLException
     */
    public String getServiceTree(String bpId, String sid, String modelId, int level) throws SQLException {
        String data = "";
        String tag = "";
        // db.openCon();
        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + bpId);
        String where = "";
        String checked = "";
        data += "<ul>";

        while (rs.next()) {
            checked = "checked='checked'";
            if (!sid.equals("0") && !sid.equals("")) {
                where = getISScenarioPramNcon(modelId, sid, rs.getString("ID"), "ACTIVE_STATUS").trim();

                if (!where.equalsIgnoreCase("-1")) {

                    checked = "";

                }
            }
            tag = rs.getString("TAG");
            if (!rs.getString("NAME").equalsIgnoreCase("Start")
                    && !rs.getString("NAME").equalsIgnoreCase("End")
                    && !tag.equalsIgnoreCase("service")
                    && !tag.equalsIgnoreCase("Message")
                    && !tag.equalsIgnoreCase("insertion")
                    && !tag.equalsIgnoreCase("collector")
                    && !(tag.equalsIgnoreCase("task")
                    && rs.getString("type").equalsIgnoreCase("preperation"))) {

                // data += rs.getString("NAME") + "__" + rs.getString("ID") + "__" + level + ";";
                data += "<li>"
                        + "<input type='checkbox' " + checked + " class='incheck' value='" + rs.getString("ID") + "' />"
                        + "" + rs.getString("NAME");

                if (!tag.equalsIgnoreCase("activity")) {
                    data += getServiceTree(rs.getString("ID"), sid, modelId, level + 1);
                } else {
                    data += getServiceApplications(rs.getString("ID"), sid, level + 1);
                }

                data += "</li>";

            }
        }

        data += "</ul>";
        //db.closeCon();
        return data;
    }

    /**
     * gets the service tree for all business trajectories in a model
     *
     * @param modelId
     * @param sid
     * @return
     * @throws SQLException
     */
    public String getTrajectoryTree(String modelId, String sid) throws SQLException {
        String data = "";
        String checked = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID=" + modelId);
        String where = "";
        data += "<ul class='l treein level'>";
        while (rs.next()) {
            checked = "checked='checked'";
            if (!sid.equals("0") && !sid.equals("")) {
                where = getISScenarioPramNcon(modelId, sid, rs.getString("ID"), "ACTIVE_STATUS");

                if (!where.equals("-1")) {

                    checked = "";

                }
            }

            data += ""
                    + "<li>"
                    + "<input type='checkbox' " + checked + " class='incheck' value='" + rs.getString("ID") + "' />" + rs.getString("NAME");
            data += getServiceTree(rs.getString("ID"), sid, modelId, 2);

            data += "</li>";

        }

        data += "</ul>";
        db.closeCon();
        return data;
    }

    /**
     *
     * @param bpId
     * @param sid
     * @param level
     * @return
     * @throws SQLException
     */
    /**
     *
     * @param bpId
     * @param sid
     * @param level
     * @return
     * @throws SQLException
     */
    public String getServiceApplications(String bpId, String sid, int level) throws SQLException {
        String data = "";
        String tag = "";
        String where = "";
        String checked = "checked='checked'";
        // db.openCon();
        data += "<ul>";
        ResultSet rs = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "SERVICE_ACTIVITY_ID=" + bpId);
        while (rs.next()) {
            String[] datarwo = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "ID=" + rs.getString("AC_INST_ID"));
            if (!sid.equals("0") && !sid.equals("")) {
                where = " SCENARIO_ID=" + sid + " and OBJECT_ID=" + datarwo[0] + " and S_PARAMETER='ACTIVE_STATUS'";
                ResultSet retd = db.getData(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "*", where);

                if (retd.next()) {
                    if (retd.getString("NEW_VALUE").equals("0")) {
                        checked = "";
                    }
                }
            }
            //   data += datarwo[5] + "__" + datarwo[0] + "__" + level + ";";

            data += "<li class='llast level' ><input type='checkbox' " + checked + " class='incheck' value='" + datarwo[0] + "' />" + datarwo[6] + "</li>";

        }
        data += "</ul>";
        //   db.closeCon();
        return data;
    }

    /**
     * checks wither a scenario parameter is present for a certain object or
     * not.
     *
     * @param MODEL_ID
     * @param SCENARIO_ID
     * @param OBJECT_ID
     * @param S_PARAMETER
     * @return
     */
    public String getISScenarioPram(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER) {
        String retunData = "-1";

        String wgere = "";
        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null) {
            wgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "'";

            String[] retd = db.getRow(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wgere);

            if (retd[6] != null) {

                if (!retd[6].equals("")) {
                    retunData = retd[6];

                }
            }
        }

        return retunData;
    }

    /**
     *
     * @param MODEL_ID
     * @param SCENARIO_ID
     * @param OBJECT_ID
     * @param S_PARAMETER
     * @param OLD_VALUE
     * @param NEW_VALUE
     * @return
     */
    public String setScenarioParameters(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER, String OLD_VALUE, String NEW_VALUE) {

        String returnData = "";
        if (!NEW_VALUE.equals(OLD_VALUE)) {
            String[][] Datas = {
                {"Id", "MODEL_ID", "SCENARIO_ID", "OBJECT_ID", "OBJECT_CLASS", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE"},
                {Utils.getNewID(), MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER, OLD_VALUE, NEW_VALUE}
            };
            returnData = db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, Datas);
        }

        return returnData;

    }

    public String setScenarioParameters(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String OBJECT_CLASS, String S_PARAMETER, String OLD_VALUE, String NEW_VALUE) {

        String returnData = "";
        if (!NEW_VALUE.equals(OLD_VALUE)) {

            String delwgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "'";
            db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, delwgere);
            String[][] Datas = {
                {"Id", "MODEL_ID", "SCENARIO_ID", "OBJECT_ID", "OBJECT_CLASS", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE"},
                {Utils.getNewID(), MODEL_ID, SCENARIO_ID, OBJECT_ID, OBJECT_CLASS, S_PARAMETER, OLD_VALUE, NEW_VALUE}
            };
            returnData = db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, Datas);
        }

        return returnData;

    }

    public String setScenarioParameters(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String OBJECT_CLASS, String S_PARAMETER, String OLD_VALUE, String NEW_VALUE, boolean Add_OLD_VALUE) {

        String returnData = "";
        if (!NEW_VALUE.equals(OLD_VALUE)) {

            String delwgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "'";

            if (Add_OLD_VALUE == true) {

                OLD_VALUE = db.getRow(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "OLD_VALUE", delwgere)[0];

            }

            db.setDelete(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, delwgere);

            String[][] Datas = {
                {"Id", "MODEL_ID", "SCENARIO_ID", "OBJECT_ID", "OBJECT_CLASS", "S_PARAMETER", "OLD_VALUE", "NEW_VALUE"},
                {Utils.getNewID(), MODEL_ID, SCENARIO_ID, OBJECT_ID, OBJECT_CLASS, S_PARAMETER, OLD_VALUE, NEW_VALUE}
            };

            returnData = db.setInsert(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, Datas);

        }

        return returnData;

    }
    /*
     public String setScenarioParametersArray(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER[], String OLD_VALUE[], String NEW_VALUE[], String ObjectClass[]) {
     String returnData = "";
     for (int i = 0; i < S_PARAMETER.length; i++) {
     this.setScenarioParameters(MODEL_ID, SCENARIO_ID, OBJECT_ID, Utils.getClassName(ObjectClass[i]), S_PARAMETER[i], OLD_VALUE[i], NEW_VALUE[i]);
     }
     return returnData;

     }*/

    public String setScenarioParametersArray(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID[], String S_PARAMETER[], String OLD_VALUE[], String NEW_VALUE[], String ObjectClass[]) {
        String returnData = "";
        for (int i = 0; i < S_PARAMETER.length; i++) {
            setScenarioParameters(MODEL_ID, SCENARIO_ID, OBJECT_ID[i], Utils.getClassName(ObjectClass[i]), S_PARAMETER[i], OLD_VALUE[i], NEW_VALUE[i]);
        }
        return returnData;

    }/*

     public String[] getScenarioParametersArray(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER[]) {
     String[] returnData = new String[S_PARAMETER.length];
     for (int i = 0; i < S_PARAMETER.length; i++) {

     returnData[i] = this.getISScenarioPram(MODEL_ID, SCENARIO_ID, OBJECT_ID, S_PARAMETER[i]);

     }
     return returnData;

     }
     */


    public String[] getScenarioParametersArray(String MODEL_ID, String SCENARIO_ID, String[] OBJECT_ID, String S_PARAMETER[]) {
        String[] returnData = new String[S_PARAMETER.length];
        for (int i = 0; i < S_PARAMETER.length; i++) {

            returnData[i] = this.getISScenarioPram(MODEL_ID, SCENARIO_ID, OBJECT_ID[i], S_PARAMETER[i]);

        }
        return returnData;

    }

    public String getISScenarioPramNcon(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER) {
        String retunData = "-1";

        String wgere = "";
        if (!SCENARIO_ID.equals("") && !SCENARIO_ID.equals("null") && SCENARIO_ID != null) {

            wgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "'";

            String[] retd = db.getRowNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wgere);
            if (retd[6] != null) {

                if (!retd[6].equals("")) {
                    retunData = retd[6];

                }
            }
        }

        return retunData;
    }

    /**
     *
     * @param id
     * @param mod_id
     * @param sid
     * @return
     */
    public String producerActive(String id, String mod_id, String sid) {
        String data = "";
        String producerId = db.getValue(XMLDataModel.MESSAGE_TABLENAME, "PRODUCER_ACTIVITY", "ID=" + id);
        data = getISScenarioPram(mod_id, sid, producerId, "ACTIVE_STATUS");
        return data;
    }

    /**
     *
     * @param id
     * @param mod_id
     * @param sid
     * @return
     */
    public String serviceProducerActive(String id, String mod_id, String sid) {
        String data = "";
        String messageId = db.getValue(XMLDataModel.S2S_XREF_TABLENAME, "OBJECT_ID", "S2S_ID=" + id);
        if (messageId != null) {
            if (!messageId.equals("")) {
                String producerId = db.getValue(XMLDataModel.MESSAGE_TABLENAME, "PRODUCER_ACTIVITY", "ID=" + messageId);
                data = getISScenarioPram(mod_id, sid, producerId, "ACTIVE_STATUS");
            }

        }

        return data;
    }

    /**
     * checks all the child object of a node to see if any of them is active to
     * change the visual representation of the node.
     *
     * @param MODEL_ID
     * @param SCENARIO_ID
     * @param OBJECT_ID
     * @return true if any of the child elements are active.
     */
    public boolean isChildActive(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID) {
        String myTAG = "";
        String TYPE = "";
        ArrayList<String> childList = new ArrayList<String>();
        boolean hasActive = false;
        try {
            db.openCon();
            ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + OBJECT_ID);
            while (rs.next()) {
                myTAG = rs.getString("TAG");
                TYPE = rs.getString("TYPE");
                if (!myTAG.equalsIgnoreCase("start") && !myTAG.equalsIgnoreCase("end") && !myTAG.equalsIgnoreCase("service")) {
                    if (getISScenarioPramNcon(MODEL_ID, SCENARIO_ID, rs.getString("ID"), "ACTIVE_STATUS").equalsIgnoreCase("-1")) {
                        hasActive = true;
                        return true;
                    }
                    childList.add(rs.getString("ID"));
                }

            }
            db.closeCon();
            for (int i = 0; i < childList.size(); i++) {
                hasActive = isChildActive(MODEL_ID, SCENARIO_ID, childList.get(i));
            }

        } catch (SQLException ex) {
            Logger.getLogger(utils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hasActive;
    }

    /**
     *
     * @param componentName
     * @param modelId
     * @param sid
     * @return
     * @throws SQLException
     */
    public boolean isComponentActive(String componentName, String modelId, String sid) throws SQLException {
        boolean active = true;
        db.openCon();
        String acId = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NAME='" + componentName + "'")[0];

        ResultSet actXref = db.getData(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "AC_ID=" + acId);
        while (actXref.next()) {
            if (getISScenarioPramNcon(modelId, sid, actXref.getString("ACTIVITY_ID"), acId).equals("0")) {
                return false;
            }
        }
        db.closeCon();
        return active;
    }

    /**
     *
     * @param componentName
     * @param modelId
     * @param sid
     * @return
     * @throws SQLException
     */
    public boolean isComponentInTrajectory(String componentName, String modelId, String sid) throws SQLException {
        boolean active = false;
        db.openCon();
        String acId = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NAME='" + componentName + "'")[0];

        ResultSet actXref = db.getData(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "AC_ID=" + acId);
        if (actXref.next()) {
            return true;
        }
        db.closeCon();

        return active;
    }

    public boolean isComponentInTrajectoryNewCon(String componentName, String modelId, String sid, Connection con) throws SQLException {
        boolean active = false;

        String acId = db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_TABLENAME, "NAME='" + componentName + "'", con)[0];

        ResultSet actXref = db.getDataNeWcon(XMLDataModel.ACTIVITY_AC_XREF_TABLENAME, "*", "AC_ID=" + acId, con);
        if (actXref.next()) {
            return true;
        }

        return active;
    }

    public boolean isAciInTrajectory(String componentName, String modelId, String sid) throws SQLException {
        boolean active = false;
        db.openCon();
        ResultSet r = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "", "INST_NAME='" + componentName + "' AND MODEL_ID=" + modelId);

        while (r.next()) {

            ResultSet actXref = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "AC_INST_ID=" + r.getString("ID"));
            if (actXref.next()) {
                return true;
            }
        }

        db.closeCon();
        return active;
    }

    public boolean isAciIDInTrajectory(String componentID, String modelId, String sid) throws SQLException {
        boolean active = false;
        db.openCon();

        ResultSet actXref = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "AC_INST_ID=" + componentID);
        if (actXref.next()) {
            return true;

        }

        db.closeCon();
        return active;
    }

    public boolean isAciActive(String componentName, String modelId, String sid) throws SQLException {
        boolean active = true;
        db.openCon();

        ResultSet r = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "", "INST_NAME='" + componentName + "' AND MODEL_ID=" + modelId);

        while (r.next()) {

            ResultSet actXref = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "AC_INST_ID=" + r.getString("ID"));
            while (actXref.next()) {
                if (getISScenarioPramNcon(modelId, sid, actXref.getString("SERVICE_ACTIVITY_ID"), "ACTIVE").equals("0")) {
                    return false;
                }
            }

        }
        db.closeCon();

        return active;
    }

    /**
     * Determines if the given aci active or not.
     *
     * @param componentID aci id to check its activeness
     * @param modelId model id
     * @param sid scenario id
     * @return true if the aci is active and false otherwise
     * @throws SQLException
     */
    public boolean isAciIdActive(String componentID, String modelId, String sid) throws SQLException {
        boolean active = true;
        db.openCon();

        ResultSet actXref = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "AC_INST_ID=" + componentID);
        while (actXref.next()) {
            if (getISScenarioPramNcon(modelId, sid, actXref.getString("SERVICE_ACTIVITY_ID"), "ACTIVE").equals("0")) {
                return false;
            }
        }

        db.closeCon();

        return active;
    }

    /**
     * Finds the status of a business trajectory if batch or not.
     *
     * @param bpId the business trajectory to find its status
     * @return true if batch and false otherwise
     */
    public boolean isBatch(String bpId) {
        boolean active = true;
        String selector = db.getValue(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "SELECTOR", "ID='" + bpId + "'");
        active = selector.equalsIgnoreCase("1");
        return active;
    }
}
