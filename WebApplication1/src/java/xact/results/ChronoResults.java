/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact.results;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;
import lib.tools.DatePair;
import lib.tools.DatePairComp;
import lib.tools.EndTimeDisplay;
import lib.tools.Utils;
import org.jfree.data.gantt.Task;
import org.jfree.data.gantt.TaskSeries;
import org.jfree.data.gantt.TaskSeriesCollection;
import org.jfree.data.time.SimpleTimePeriod;

/**
 *
 * @author A7med
 */
/**
 * <b><i>The class for calculating the chronograph dates.</i></b>  <br>
 * <b>the values are stored in the array mydata. It can be sued in this way
 * </b>:<br> ChronoResults cr=new ChronoResults("result id", "model name");<br>
 * cr.getdata();<br> Now you can access the start and end dates for the business
 * process. <br>
 *
 */
public class ChronoResults {

    lib.engine.db.operations db = new lib.engine.db.operations();
    String results_id = "";
    String modelName = "";
    String type = "";
    public HashMap<String, Date> ends1 = new HashMap<String, Date>();
    public HashMap<String, Date> ends2 = new HashMap<String, Date>();
    public HashMap<String, Date> starts2 = new HashMap<String, Date>();
    public HashMap<String, Date> starts1 = new HashMap<String, Date>();
    public ArrayList<String> mydata = new ArrayList<String>();
    public ArrayList<Date> starta1 = new ArrayList<Date>();
    public ArrayList<Date> starta2 = new ArrayList<Date>();
    public ArrayList<Date> enda1 = new ArrayList<Date>();
    public ArrayList<Date> enda2 = new ArrayList<Date>();
    public String test = "";

    /**
     * Class constructor specifying the initial result id and model name.
     * 
     */
    public ChronoResults(String resID, String modName, String type) {
        results_id = resID;
        modelName = modName.trim();
        this.type = type;

    }

    /**
     * gets the date at midnight time.
     *
     * @return the date at midnight time of the current day.
     *
     */
    Date getZeroDate() {
        Calendar tc = Calendar.getInstance();
        tc.set(Calendar.HOUR_OF_DAY, 0);
        tc.set(Calendar.MINUTE, 0);
        tc.set(Calendar.SECOND, 0);
        tc.set(Calendar.MILLISECOND, 0);
        return tc.getTime();
    }

    /**
     * gets the date at just before the new day.
     *
     * @return the date just before midnight time of the next day.
     *
     */
    Date getendDate() {
        Calendar tc = Calendar.getInstance();
        tc.set(Calendar.HOUR_OF_DAY, 23);
        tc.set(Calendar.MINUTE, 59);
        tc.set(Calendar.SECOND, 59);
        tc.set(Calendar.MILLISECOND, 0);
        return tc.getTime();
    }

    /**
     * Business Trajectory start date is calculated through its children. this
     * method finds the earliest date of the children and sets it to the
     * business process start date.
     *
     * @return the scheduled start date of the business process.
     *
     */
    public Date getbpStartdate() {
        Date start = null;
        Iterator it = starts1.keySet().iterator();
        while (it.hasNext()) {

            Date current = starts1.get(it.next());
            if (start == null) {
                start = current;
            }
            if (current.before(start)) {
                start = current;
            }
        }
        return start;
    }

    /**
     * Business Trajectory end date is calculated through its children. this
     * method finds the latest date of the children and sets it to the business
     * process end date.
     *
     * @return the scheduled end date of the business process.
     *
     */
    public Date getbpEnddate() {
        Date bpend = null;
        Iterator it = ends1.keySet().iterator();
        while (it.hasNext()) {
            Date current = ends1.get(it.next());
            if (bpend == null) {
                bpend = current;
            }
            if (current.after(bpend)) {
                bpend = current;
            }
        }
        return bpend;
    }

    /**
     * Business Trajectory start date is calculated through its children. This
     * version gets the actual start date.<br> this method finds the earliest
     * date of the children and sets it to the business process start date.
     *
     * @return the actual start date of the business process.
     *
     */
    public Date getbpStartdate2() {
        Date start = null;
        Iterator it = starts2.keySet().iterator();
        while (it.hasNext()) {
            Date current = starts2.get(it.next());
            if (start == null) {
                start = current;
            }
            if (current.before(start)) {
                start = current;
            }
        }
        return start;
    }

    /**
     * Business Trajectory end date is calculated through its children. this
     * method finds the latest date of the children and sets it to the business
     * process end date.
     *
     * @return the actual end date of the business process.
     *
     */
    public Date getbpEnddate2() {
        Date bpend = null;
        Iterator it = ends2.keySet().iterator();
        while (it.hasNext()) {
            Date current = ends2.get(it.next());
            if (bpend == null) {
                bpend = current;
            }
            if (current.after(bpend)) {
                bpend = current;
            }
        }
        return bpend;
    }

    /**
     * The starting point for the chronograph calculation. It sets the starting
     * dates and then calls GetChildrenData() to get the dates.
     *
     * @param id The business process id to get the chart data for.
     *
     */
    public void getdata(String id) throws SQLException {


        Date ts1 = null;
        Date ts2 = null;
        Date te1 = null;
        Date te2 = null;

        ts1 = getZeroDate();
        ts2 = getZeroDate();
        te1 = getZeroDate();
        te2 = getZeroDate();



        if (!type.equalsIgnoreCase("ops")) {








            GetChildrenData(id, ts1, ts2, te1, te2);




        } else {

            GetChildrenDataOPS(id, "", "", ts1, ts2, te1, te2);
        }



    }

    public void getdataForOps(String id, String s1, String s2) throws SQLException {


        Date ts1 = null;
        Date ts2 = null;
        Date te1 = null;
        Date te2 = null;

        ts1 = getZeroDate();
        ts2 = getZeroDate();
        te1 = getZeroDate();
        te2 = getZeroDate();

        GetChildrenDataOPS(id, s1, s2, ts1, ts2, te1, te2);

    }

    /**
     * The method where calculating the dates for the children in the path
     * occurs. This is a recursive routine that gets the dates for the objects
     * in the path. The default start date is midnight time of the current day
     * plus the T_O_D offset.<br> And if the start time is before the start time
     * of the parent it will be set to the parent start time plus the T_O_D
     * offset. End date will be start date plus duration_1 value for scheduled
     * part and start date plus response time value for the actual part.
     *
     * @param id The parent id to calculate the dates for its children.
     * @param ts1 the scheduled start date of the parent.
     * @param ts2 the actual start date of the parent.
     * @param te1 the scheduled end date of the parent.
     * @param te2 the actual end date of the parent.
     */
    /**
     * The method where calculating the dates for the children in the path
     * occurs. This is a recursive routine that gets the dates for the objects
     * in the path. The default start date is midnight time of the current day
     * plus the T_O_D offset.<br> And if the start time is before the start time
     * of the parent it will be set to the parent start time plus the T_O_D
     * offset. End date will be start date plus duration_1 value for scheduled
     * part and start date plus response time value for the actual part.
     *
     * @param id The parent id to calculate the dates for its children.
     * @param ts1 the scheduled start date of the parent.
     * @param ts2 the actual start date of the parent.
     * @param te1 the scheduled end date of the parent.
     * @param te2 the actual end date of the parent.
     */
    void GetChildrenData(String id, Date ts1, Date ts2, Date te1, Date te2) throws SQLException {

        db.openCon();
        Date start1 = ts1;
        Date start2 = ts2;
        Date end1 = te1;
        Date end2 = te2;



        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + id);





        while (rs.next()) {






            if (!starts1.containsKey(rs.getString("ID"))) {




                String TAG = rs.getString("TAG");
                String type = rs.getString("TYPE");



                if (!TAG.equalsIgnoreCase("Start")
                        && !TAG.equalsIgnoreCase("end")
                        && !TAG.equalsIgnoreCase("activity")
                        && !TAG.equalsIgnoreCase("service")
                        && !TAG.equalsIgnoreCase("insertion")
                        && !TAG.equalsIgnoreCase("collector")
                        && !(TAG.equalsIgnoreCase("task") && type.equalsIgnoreCase("preparation"))) {

                    String[] objectData = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + rs.getString("ID"));
                    String tod = objectData[12];
                    double duration = Double.parseDouble(objectData[9]);
                    if (duration == 0) {
                        duration = 1;
                    }

                    if (tod != null) {
                        if (!tod.equals("null")) {
                            start1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(tod));
                            if (start1.before(ts1)) {
                                start1 = calcDate2(ts1, EndTimeDisplay.calcOffsetInSecond(tod));
                            }
                        }
                    }

                    start2 = start1;

                    if (start2.before(ts2)) {
                        start2 = ts2;
                    }
                    java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
                    String[] rs2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + rs.getString("ID") + " AND MODEL_ID=" + results_id + " AND NAME='" + modelName + "_0'", con);
                    end2 = calcDate2(start2, Double.parseDouble(rs2[8]));



                    end1 = calcDate2(start1, duration);
                    if (haschildren(rs.getString("ID")) && hasRightNieghbor(rs.getString("ID"))) {
                        //end1 = getTotalEnd1(rs.getString("ID"), start1);
                    }
                    if (!mydata.contains(rs.getString("Name"))) {
                        mydata.add(rs.getString("Name"));
                        starta1.add(start1);
                        starta2.add(start2);
                        enda1.add(end1);
                        enda2.add(end2);
                        starts1.put(rs.getString("ID"), start1);
                        starts2.put(rs.getString("ID"), start2);
                        ends1.put(rs.getString("ID"), end1);
                        ends2.put(rs.getString("ID"), end2);
                    }
                    if (ends1.get(id) != null && ends1.get(id).before(end1)) {
                        int index = enda1.indexOf(ends1.get(id));
                        if (index != -1) {
                            enda1.set(index, end1);
                        }
                        ends1.put(id, end1);

                    }
                    if (ends2.get(id) != null && ends2.get(id).before(end2)) {
                        int index = enda2.indexOf(ends2.get(id));
                        if (index != -1) {
                            enda2.set(enda2.indexOf(ends2.get(id)), end2);
                        }
                        ends2.put(id, end2);

                    }
                    db.closeConNewcon(con);
                }

                GetChildrenData(rs.getString("ID"), start1, start2, end1, end2);

                calculateForNieghbor(id, end1, end2);


            }
        }

        db.closeCon();

    }

    void GetChildrenDataOPS(String id, String Sn1, String Sn2, Date ts1, Date ts2, Date te1, Date te2) throws SQLException {

        db.openCon();
        Date start1 = ts1;
        Date start2 = ts2;
        Date end1 = te1;
        Date end2 = te2;



        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + id);





        while (rs.next()) {






            if (!starts1.containsKey(rs.getString("ID"))) {




                String TAG = rs.getString("TAG");
                String type = rs.getString("TYPE");



                if (!TAG.equalsIgnoreCase("Start")
                        && !TAG.equalsIgnoreCase("end")
                        && !TAG.equalsIgnoreCase("activity")
                        && !TAG.equalsIgnoreCase("service")
                        && !TAG.equalsIgnoreCase("insertion")
                        && !TAG.equalsIgnoreCase("collector")
                        && !(TAG.equalsIgnoreCase("task") && type.equalsIgnoreCase("preparation"))) {




                    String Sn1Name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + Sn1)[3];
                    String Sn2Name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + Sn2)[3];
                    String[] objectData2 = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + rs.getString("ID"));

                    java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);



                    String[] objectData = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + id + " AND MODEL_ID=" + Sn1 + " AND NAME='" + Sn1Name + "_0'", con);
                    String tod = objectData2[12];
                    double duration = Double.parseDouble(objectData[8]);
                    if (duration == 0) {
                        duration = 1;
                    }
                    if (tod != null) {
                        if (!tod.equals("null")) {
                            start1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(tod));
                            if (start1.before(ts1)) {
                                start1 = calcDate2(ts1, EndTimeDisplay.calcOffsetInSecond(tod));
                            }
                        }
                    }





                    start2 = start1;

                    if (start2.before(ts2)) {
                        start2 = ts2;
                    }


                    String[] rs2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + id + " AND MODEL_ID=" + Sn2 + " AND NAME='" + Sn2Name + "_0'", con);
                    end2 = calcDate2(start2, Double.parseDouble(rs2[8]));



                    end1 = calcDate2(start1, duration);

                    if (!mydata.contains(rs.getString("Name"))) {
                        mydata.add(rs.getString("Name"));
                        starta1.add(start1);
                        starta2.add(start2);
                        enda1.add(end1);
                        enda2.add(end2);
                        starts1.put(rs.getString("ID"), start1);
                        starts2.put(rs.getString("ID"), start2);
                        ends1.put(rs.getString("ID"), end1);
                        ends2.put(rs.getString("ID"), end2);
                    }
                    if (ends1.get(id) != null && ends1.get(id).before(end1)) {
                        int index = enda1.indexOf(ends1.get(id));
                        if (index != -1) {
                            enda1.set(index, end1);
                        }
                        ends1.put(id, end1);

                    }
                    if (ends2.get(id) != null && ends2.get(id).before(end2)) {
                        int index = enda2.indexOf(ends2.get(id));
                        if (index != -1) {
                            enda2.set(enda2.indexOf(ends2.get(id)), end2);
                        }
                        ends2.put(id, end2);

                    }
                    db.closeConNewcon(con);
                }

                GetChildrenDataOPS(rs.getString("ID"), Sn1, Sn2, start1, start2, end1, end2);
                calculateForNieghborOps(id, Sn1, Sn2, te1, te2);


            }
        }
        db.closeCon();
    }

    /**
     * The method where calculating the dates for the following neighbors in the
     * path occurs. This is a recursive routine that gets the dates for the
     * objects to the right in the path. Neighbor calculation differs from
     * children calculation in that the start dates for the scheduled and actual
     * parts both take the corresponding end dates of the preceding node. .<br>
     * End date will be start date plus duration_1 value for scheduled part and
     * start date plus response time value for the actual part.
     *
     * @param id The node id to calculate the dates for its neighbor.
     * @param ts1 the scheduled start date of the parent.
     * @param ts2 the actual start date of the parent.
     * @param te1 the scheduled end date of the parent.
     * @param te2 the actual end date of the parent.
     */
    void calculateForNieghbor(String id, Date e1, Date e2) throws SQLException {
        Date start1 = e1;
        Date start2 = e2;
        Date end1 = e1;
        Date end2 = e2;
        String nodeId = Utils.nextNode(id);
        if (!starts1.containsKey(nodeId)) {
            if (!nodeId.equals("")) {

                String[] objectData = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + nodeId);
                String TAG = objectData[1];
                String type = objectData[7];
                String name = objectData[2];
                if (!TAG.equalsIgnoreCase("Start")
                        && !TAG.equalsIgnoreCase("end")
                        && !TAG.equalsIgnoreCase("activity")
                        && !TAG.equalsIgnoreCase("service")
                        && !TAG.equalsIgnoreCase("insertion")
                        && !TAG.equalsIgnoreCase("collector")
                        && !(TAG.equalsIgnoreCase("task") && type.equalsIgnoreCase("preparation"))) {
                    String tod = objectData[12];
                    double duration = Double.parseDouble(objectData[9]);
                    if (duration == 0) {
                        duration = 1;
                    }

                    if (tod != null) {
                        if (!tod.equals("null")) {
                            if (EndTimeDisplay.calcOffsetInSecond(tod) != 0) {
                                start1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(tod));
                                start2 = start1;
                            }
                        }
                    }

                    end1 = calcDate2(start1, duration);
                    java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
                    String[] rs2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + nodeId + " AND MODEL_ID=" + results_id + " AND NAME='" + modelName + "_0'", con);
                    end2 = calcDate2(start2, Double.parseDouble(rs2[8]));
                    test += "node:" + objectData[2] + "start date=" + start2 + "and response=" + rs2[8];

                    if (!mydata.contains(name)) {


                        mydata.add(name);

                        starta1.add(start1);
                        starta2.add(start2);
                        enda1.add(end1);
                        enda2.add(end2);

                        starts1.put(objectData[0], start1);
                        starts2.put(objectData[0], start2);
                        ends1.put(objectData[0], end1);
                        ends2.put(objectData[0], end2);
                    }


                    String parentid = getpaerntid(objectData[0]);
                    if (ends1.get(parentid) != null && ends1.get(parentid).before(end1)) {
                        int index = enda1.indexOf(ends1.get(parentid));
                        if (index != -1) {
                            enda1.set(index, end1);
                        }
                        ends1.put(parentid, end1);

                    }
                    if (ends2.get(parentid) != null && ends2.get(parentid).before(end2)) {
                        int index = enda2.indexOf(ends2.get(parentid));
                        if (index != -1) {
                            enda2.set(enda2.indexOf(ends2.get(parentid)), end2);
                        }
                        ends2.put(parentid, end2);

                    }
                    if (starts1.get(parentid) != null && starts1.get(parentid).after(start1)) {
                        int index = starta1.indexOf(starts1.get(parentid));
                        if (index != -1) {
                            starta1.set(index, end1);
                        }
                        starts1.put(parentid, end1);

                    }
                    if (starts2.get(parentid) != null && starts2.get(parentid).after(start2)) {
                        int index = starta2.indexOf(starts2.get(parentid));
                        if (index != -1) {
                            starta2.set(index, end1);
                        }
                        starts2.put(parentid, end1);

                    }
                    db.closeConNewcon(con);
                    GetChildrenData(nodeId, start1, start2, end1, end2);
                    calculateForNieghbor(nodeId, end1, end2);

                } else if (TAG.equalsIgnoreCase("service")) {
                    calculateForNieghbor(nodeId, end1, end2);
                }

            }
        }


    }

    void calculateForNieghborOps(String id, String sn1, String sn2, Date e1, Date e2) throws SQLException {
        Date start1 = e1;
        Date start2 = e2;
        Date end1 = e1;
        Date end2 = e2;
        String nodeId = Utils.nextNode(id);
        if (!starts1.containsKey(nodeId)) {
            if (!nodeId.equals("")) {

                String[] objectData = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + nodeId);
                String TAG = objectData[1];
                String type = objectData[7];
                String name = objectData[2];
                if (!TAG.equalsIgnoreCase("Start")
                        && !TAG.equalsIgnoreCase("end")
                        && !TAG.equalsIgnoreCase("activity")
                        && !TAG.equalsIgnoreCase("service")
                        && !TAG.equalsIgnoreCase("insertion")
                        && !TAG.equalsIgnoreCase("collector")
                        && !(TAG.equalsIgnoreCase("task") && type.equalsIgnoreCase("preparation"))) {
                    String tod = objectData[12];
                    double duration = Double.parseDouble(objectData[9]);
                    if (duration == 0) {
                        duration = 1;
                    }

                    if (tod != null) {
                        if (!tod.equals("null")) {
                            if (EndTimeDisplay.calcOffsetInSecond(tod) != 0) {
                                start1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(tod));
                                start2 = start1;
                            }
                        }
                    }

                    String Sn1Name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sn1)[3];
                    String Sn2Name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sn2)[3];
                    java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
                    String[] rs1 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + id + " AND MODEL_ID=" + sn1 + " AND NAME='" + Sn1Name + "_0'", con);

                    end1 = calcDate2(start1, Double.parseDouble(rs1[8]));

                    String[] rs2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + id + " AND MODEL_ID=" + sn2 + " AND NAME='" + Sn2Name + "_0'", con);
                    end2 = calcDate2(start2, Double.parseDouble(rs2[8]));


                    test += "node:" + objectData[2] + "start date=" + start2 + "and response=" + rs2[8];

                    if (!mydata.contains(name)) {


                        mydata.add(name);

                        starta1.add(start1);
                        starta2.add(start2);
                        enda1.add(end1);
                        enda2.add(end2);

                        starts1.put(objectData[0], start1);
                        starts2.put(objectData[0], start2);
                        ends1.put(objectData[0], end1);
                        ends2.put(objectData[0], end2);
                    }


                    String parentid = getpaerntid(objectData[0]);
                    if (ends1.get(parentid) != null && ends1.get(parentid).before(end1)) {
                        int index = enda1.indexOf(ends1.get(parentid));
                        if (index != -1) {
                            enda1.set(index, end1);
                        }
                        ends1.put(parentid, end1);

                    }
                    if (ends2.get(parentid) != null && ends2.get(parentid).before(end2)) {
                        int index = enda2.indexOf(ends2.get(parentid));
                        if (index != -1) {
                            enda2.set(enda2.indexOf(ends2.get(parentid)), end2);
                        }
                        ends2.put(parentid, end2);

                    }
                    if (starts1.get(parentid) != null && starts1.get(parentid).after(start1)) {
                        int index = starta1.indexOf(starts1.get(parentid));
                        if (index != -1) {
                            starta1.set(index, end1);
                        }
                        starts1.put(parentid, end1);

                    }
                    if (starts2.get(parentid) != null && starts2.get(parentid).after(start2)) {
                        int index = starta2.indexOf(starts2.get(parentid));
                        if (index != -1) {
                            starta2.set(index, end1);
                        }
                        starts2.put(parentid, end1);

                    }
                    db.closeConNewcon(con);
                    GetChildrenDataOPS(nodeId, sn1, sn2, start1, start2, end1, end2);
                    calculateForNieghborOps(nodeId, sn1, sn2, end1, end2);

                } else if (TAG.equalsIgnoreCase("service")) {
                    calculateForNieghbor(nodeId, end1, end2);
                }

            }
        }



    }

    /**
     * Calculates the date from a starting date and a double duration value in
     * milli seconds and returns it in formated string.
     *
     * @param t_o_d The starting date.
     * @param duration the amount of milli seconds to add.
     * @return The date resulting by adding the start date and the duration
     * value in formated string.
     */
    /**
     * Calculates the date from a starting date and a double duration value in
     * milli seconds and returns it in formated string.
     *
     * @param t_o_d The starting date.
     * @param duration the amount of milli seconds to add.
     * @return The date resulting by adding the start date and the duration
     * value in formated string.
     */
    String calcDate(Date t_o_d, Double duration) {
        Calendar cal = Calendar.getInstance();
        if (t_o_d == null) {
            t_o_d = getZeroDate();
        }
        cal.setTime(t_o_d);
        int millsecs = (int) (duration * 1000);
        cal.add(Calendar.MILLISECOND, millsecs);
        String pattern = "MM/dd/yyyy hh:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);

        return sdf.format(cal.getTime());
    }

    /**
     * Calculates the date from a starting date and a double duration value in
     * milli seconds.
     *
     * @param t_o_d The starting date.
     * @param duration the amount of milli seconds to add.
     * @return The date resulting by adding the start date and the duration
     * value.
     */
    Date calcDate2(Date t_o_d, Double duration) {
        Calendar cal = Calendar.getInstance();
        if (t_o_d == null) {
            t_o_d = getZeroDate();
        }
        cal.setTime(t_o_d);
        int millsecs = (int) (duration * 1000);
        cal.add(Calendar.MILLISECOND, millsecs);
        return cal.getTime();
    }

    String calcDatet_o_d(Date t_o_d) {
        Calendar cal = Calendar.getInstance();
        if (t_o_d == null) {
            t_o_d = getZeroDate();
        }
        cal.setTime(t_o_d);


        String pattern = "MM/dd/yyyy hh:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);

        return sdf.format(cal.getTime());

    }

    public String getBpName(String id) throws SQLException {
        String name = "";
        db.openCon();
        ResultSet rs1 = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "id=" + id);
        if (rs1.next()) {
            name = rs1.getString("NAME");
        } else {
            ResultSet rs2 = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "id=" + id);
            if (rs2.next()) {
                name = rs2.getString("NAME");
            }
        }
        db.closeCon();
        return name;
    }

    public String getNodeId(String name, String modelid) {
        String id = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "name='" + name + "' AND MODEL_ID=" + modelid)[0];
        return id;
    }

    private String getpaerntid(String id) {
        String parentid = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "id=" + id)[3];
        return parentid;
    }

    boolean haschildren(String id) {
        db.openCon();
        boolean state = false;
        try {

            ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + id);
            while (rs.next()) {
                String tag = rs.getString("TAG");
                if (tag.equalsIgnoreCase("component") || tag.equalsIgnoreCase("task")) {
                    state = true;
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(ChronoResults.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
        return state;
    }

    boolean hasRightNieghbor(String id) throws SQLException {
        db.openCon();
        ResultSet ch = db.getData(XMLDataModel.SERVICE_LINK_TABLENAME, "*", "from_id=" + id);
        boolean state = ch.next();
        db.closeCon();
        return state;
    }

    private Date getTotalEnd1(String id, Date start) throws SQLException {
        Date total = null;
        Date accu = null;
        db.openCon();
        test += id;
        ResultSet rs = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + id);

        while (rs.next()) {
            Date current = null;
            String TAG = rs.getString("TAG");
            String type2 = rs.getString("TYPE");
            if (!TAG.equalsIgnoreCase("Start")
                    && !TAG.equalsIgnoreCase("end")
                    && !TAG.equalsIgnoreCase("activity")
                    && !TAG.equalsIgnoreCase("service")
                    && !TAG.equalsIgnoreCase("insertion")
                    && !TAG.equalsIgnoreCase("collector")
                    && !(TAG.equalsIgnoreCase("task") && type2.equalsIgnoreCase("preparation"))) {

                String[] objectData = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + rs.getString("ID"));
                String tod = objectData[12];
                double duration = Double.parseDouble(objectData[9]);
                if (duration == 0) {
                    duration = 1;
                }
                if (accu == null) {
                    accu = start;
                }
                /*
                 * if (tod != null) { if (!tod.equals("null")) {
                 * if(EndTimeDisplay.calcOffsetInSecond(tod)!=0d){ accu =
                 * calcDate2(accu, EndTimeDisplay.calcOffsetInSecond(tod)); } } }
                 */
                current = calcDate2(accu, duration);

                if (hasRightNieghbor(objectData[0]) && haschildren(objectData[0])) {
                    current = getTotalEnd1(objectData[0], start);
                }
                accu = current;
                if (total == null) {
                    total = current;
                }
                if (total.before(current)) {
                    total = current;
                }
            }
        }
        db.closeCon();
        return total;
    }

    /**
     * This method adds task entries for each aggregated object in the business
     * trajectory.  The array that is constructed is in reverse order because the
     * parent values for start and end are not known until after the children are
     * processed so it must be inverted before moving to the chart dataset.
     *
     * @param mbne - The current object being processed. A MutibleBasicNodeElement is
     *              used to represent each node.
     * @param dpc - An object consiting of two Date pairs. The first is the "Expected"
     *              start and end dates as set by the object properties. The second is
     *              the "Actual" start and end dates as computed by X-Act.
     * @param s1 -  Arraylist of the "Expected" task objects.
     * @param s2 -  Arraylist of the "Actual" task objects.
     * @return  -   Returns the two Date pair objects that represent the start and end
     *              time of the child or neighbor object.
     */
    private DatePairComp addTasks(String id, DatePairComp dpc, ArrayList s1, ArrayList s2) throws SQLException, Exception {
        /*
         * Collector objects have no part in the chronogram and are skipped.
         *
         */
        String tag = Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "TAG");
        if (tag == null) {
            tag = "business process";
        }
        //test+="tag=:"+tag;
        if ("collector".equalsIgnoreCase(tag)) {
            return new DatePairComp(new DatePair(dpc.getSetOneStart(), dpc.getSetOneEnd()), new DatePair(dpc.getSetTwoStart(), dpc.getSetTwoEnd()));
        }
        if ("insertion".equalsIgnoreCase(tag)) {
            return new DatePairComp(new DatePair(dpc.getSetOneStart(), dpc.getSetOneEnd()), new DatePair(dpc.getSetTwoStart(), dpc.getSetTwoEnd()));
        }

        /*
         * Service objects have no part in the chronogram and are skipped. But
         * they are in the path so any neighbors must be located.
         */
        if ("service".equalsIgnoreCase(tag)) {
            Iterator<String> itNode = Utils.nextNodes(id).iterator();
            DatePairComp dpcR = null;
            while (itNode.hasNext()) {
                String nn = itNode.next();
                dpcR = addTasks(nn, dpc, s1, s2);
            }
            return dpcR;
        }
        /*
         * Only activities that do not have application components assigned can
         * be incluced so if application components are present this object is
         * skipped.
         */
        if ("Activity".equalsIgnoreCase(tag)) {
            return new DatePairComp(new DatePair(dpc.getSetOneStart(), dpc.getSetOneEnd()), new DatePair(dpc.getSetTwoStart(), dpc.getSetTwoEnd()));
        }
        /*
         * Preparation tasks are not included in the chronogram as they have no
         * computed values.
         */
        if ("task".equalsIgnoreCase(tag) && Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "TYPE").equalsIgnoreCase("preparation")) {
            return new DatePairComp(new DatePair(dpc.getSetOneStart(), dpc.getSetOneEnd()), new DatePair(dpc.getSetTwoStart(), dpc.getSetTwoEnd()));
        }

        /*
         * acc date objects are accumulation object representing the start and
         * end times.
         */
        Date accStart1 = null;
        Date accStart2 = null;
        Date accEnd1 = null;
        Date accEnd2 = null;

        /*
         * These date objects will be the start and end times for the current
         * object.
         */
        Date start1 = dpc.getSetOneStart();
        Date start2 = dpc.getSetTwoStart();
        Date end1 = dpc.getSetOneEnd();
        Date end2 = dpc.getSetTwoEnd();
        /*
         * If the current object is the Business Trajectory it has no start time
         * or duration and must get it from its children.
         */
        if ("business process".equalsIgnoreCase(tag)) {
            test += "<br>business";
            Iterator<String> itNode = Utils.nextNodeChildren(id).iterator();
            Date ts1 = getZeroDate();
            Date ts2 = getZeroDate();
            Date te1 = getZeroDate();
            Date te2 = getZeroDate();

            while (itNode.hasNext()) {
                String nn = itNode.next();
                //test+=nn;
                DatePairComp dpcR = addTasks(nn, dpc, s1, s2);
                if (ts1 == getZeroDate()) {
                    ts1 = dpcR.getSetOneStart();
                } else if (dpcR.getSetOneStart().after(ts1)) {
                    ts1 = dpcR.getSetOneStart();
                }
                if (ts2 == getZeroDate()) {
                    ts2 = dpcR.getSetTwoStart();
                } else if (dpcR.getSetTwoStart().after(ts2)) {
                    ts2 = dpcR.getSetTwoStart();
                }
                if (te1 == getZeroDate()) {
                    te1 = dpcR.getSetOneEnd();
                } else if (dpcR.getSetOneEnd().after(te1)) {
                    te1 = dpcR.getSetOneEnd();
                }
                if (te2 == getZeroDate()) {
                    te2 = dpcR.getSetTwoEnd();
                } else if (dpcR.getSetTwoEnd().after(te2)) {
                    te2 = dpcR.getSetTwoEnd();
                }
            }
            start1 = ts1;
            start2 = ts2;
            end1 = te1;
            end2 = te2;
        } else {
            test += tag;
            /*
             * Initialize start and end time work fields with values from the
             * parent.
             */
            Date ts1 = dpc.getSetOneStart();
            Date ts2 = dpc.getSetTwoStart();
            Date te1 = dpc.getSetOneEnd();
            Date te2 = dpc.getSetTwoEnd();
            /*
             * Locate children of the current object and see if they need to be
             * added to the list.
             */
            Iterator<String> itNode = Utils.nextNodeChildren(id).iterator();

            try {
                String tod = Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "T_O_D");
                if (!EndTimeDisplay.isNotSet(tod)) {
                    ts1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(tod));
                    ts2 = ts1;
                    if (ts1.before(dpc.getSetOneStart())) {

                        test += "WARNING:C1" + tag + " " + getBpName(id) + " job start time " + ts1 + " before parents " + dpc.getSetOneStart() + ", using parents.";

                    }
                    if (ts2.before(dpc.getSetTwoStart())) {
                        test += "WARNING:C2" + tag + " " + getBpName(id) + " job start time " + ts2 + " before parents " + dpc.getSetTwoStart() + ", using parents.";

                    }
                } else {
                    if (ts1 == null) {
                        ts1 = getZeroDate();
                    }
                    if (ts2 == null) {
                        ts2 = getZeroDate();
                    }
                }
            } catch (Exception ex) {
                if (ts1 == null) {
                    ts1 = getZeroDate();
                }
                if (ts2 == null) {
                    ts2 = getZeroDate();
                }
            }
            while (itNode.hasNext()) {
                String nn = itNode.next();
                //test+=nn;
                double eDur = Double.parseDouble(Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "DURATION_1"));
                if (eDur == 0.0d) {
                    eDur = 1.0d;
                }
                te1 = calcDate2(ts1, eDur);
                // test+="duration="+te1+"::";
                te2 = calcDate2(ts2, getresponetime(id));
                DatePairComp dpcR = addTasks(nn, new DatePairComp(new DatePair(ts1, te1), new DatePair(ts2, te2)), s1, s2);
                //test+="eee"+dpcR.getSetOneEnd();
                if (ts1.after(dpcR.getSetOneStart())) {
                    ts1 = dpcR.getSetOneStart();
                }
                if (te1.before(dpcR.getSetOneEnd())) {
                    te1 = dpcR.getSetOneEnd();
                }
                if (ts2.after(dpcR.getSetTwoStart())) {
                    ts2 = dpcR.getSetTwoStart();
                }
                if (te2.before(dpcR.getSetTwoEnd())) {
                    te2 = dpcR.getSetTwoEnd();
                }
            }
            start1 = ts1;
            accStart1 = ts1;
            start2 = ts2;
            accStart2 = ts2;
            end1 = te1;
            accEnd1 = te1;
            end2 = te2;
            accEnd2 = te2;
            /*
             * Locate any neighbors to the current object and see if they need
             * to be added to the list.
             */
            itNode = Utils.nextNodes(id).iterator();
            /*
             * Set the start date equal to the end date of the current object
             * for its neighbor.
             */
            ts1 = accEnd1;
            ts2 = accEnd2;

            try {
                String tod = Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "T_O_D");
                if (!EndTimeDisplay.isNotSet(tod)) {

                    ts1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(tod));
                    ts2 = ts1;
                    if (ts1.before(dpc.getSetOneStart())) {
                        test += "WARNING:C1" + tag + " " + getBpName(id) + " job start time " + ts1 + " before parents " + dpc.getSetOneStart() + ", using parents.";
                        ts1 = dpc.getSetOneStart();
                    }
                    if (ts2.before(dpc.getSetTwoStart())) {
                        test += "WARNING:C1" + tag + " " + getBpName(id) + " job start time " + ts1 + " before parents " + dpc.getSetOneStart() + ", using parents.";
                        ts2 = dpc.getSetTwoStart();
                    }
                } else {
                    if (ts1 == null) {
                        ts1 = getZeroDate();
                    }
                    if (ts2 == null) {
                        ts2 = getZeroDate();
                    }
                }
            } catch (Exception ex) {
                if (ts1 == null) {
                    ts1 = getZeroDate();
                }
                if (ts2 == null) {
                    ts2 = getZeroDate();
                }
            }
            while (itNode.hasNext()) {


                String nn = itNode.next();

                double eDur = Double.parseDouble(Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "DURATION_1"));
                if (eDur == 0.0d) {
                    eDur = 1.0d;
                }
                te1 = calcDate2(ts1, eDur);
                te2 = calcDate2(ts2, getresponetime(id));
                DatePairComp dpcR = addTasks(nn, new DatePairComp(new DatePair(te1, te1), new DatePair(te2, te2)), s1, s2);
                if (dpcR.getSetOneEnd().after(accEnd1)) {
                    accEnd1 = dpcR.getSetOneEnd();
                }
                if (dpcR.getSetTwoEnd().after(accEnd2)) {
                    accEnd2 = dpcR.getSetTwoEnd();
                }

            }

        }


        /*
         * Business Trajector does not have a duration property and must be
         * skipped to prevent a null pointer exception.
         */

        /*
         * Add the current object to the list.
         */
        test = "adding task::" + getBpName(id) + "::";

        s1.add(new Task(getBpName(id), new SimpleTimePeriod(start1, end1)));
        s2.add(new Task(getBpName(id), new SimpleTimePeriod(start2, end2)));
        /*
         * Return to the parent the start time of the current object and the end
         * time of its last childs neighbor.
         */
        return new DatePairComp(new DatePair(accStart1, accEnd1), new DatePair(accStart2, accEnd2));
    }

    private Double getresponetime(String id) {
        double response = 0;
        java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
        String[] rs2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + id + " AND MODEL_ID=" + results_id + " AND NAME='" + modelName + "_0'", con);
        response = Double.parseDouble(rs2[8]);
        return response;

    }

    private Double getresponetime(String id, String sid) {
        double response = 0;
        String Sn1Name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid)[3];
        java.sql.Connection con = db.openDBConNewcon(lib.Options.DbInfo.connectionStringRes);
        String[] rs2 = db.getRowNewCon(XMLDataModel.SP_RESULTS_TABLENAME, "sp_id=" + id + " AND MODEL_ID=" + sid + " AND NAME='" + Sn1Name + "_0'", con);
        response = Double.parseDouble(rs2[8]);
        db.closeConNewcon(con);
        return response;

    }

    public TaskSeriesCollection createDataset(String id) throws Exception {
        ArrayList<Task> mList1 = new ArrayList();
        ArrayList<Task> mList2 = new ArrayList();
        Date iDate = getZeroDate();
        addTasks(id, new DatePairComp(new DatePair(iDate, iDate), new DatePair(iDate, iDate)), mList1, mList2);

        TaskSeries s1 = new TaskSeries("Scheduled");
        TaskSeries s2 = new TaskSeries("Actual");

        invertSeries(mList1, s1);
        invertSeries(mList2, s2);

        final TaskSeriesCollection collection = new TaskSeriesCollection();
        collection.add(s1);
        collection.add(s2);

        return collection;
    }

    public TaskSeriesCollection createDataset(String id, String sid1, String sid2) {
        ArrayList<Task> mList1 = new ArrayList();
        ArrayList<Task> mList2 = new ArrayList();
        String Sn1Name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid1)[3];
        String Sn2Name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "id=" + sid2)[3];
        Date iDate = getZeroDate();
        try {
            addTasks(id, sid1, sid2, new DatePairComp(new DatePair(iDate, iDate), new DatePair(iDate, iDate)), mList1, mList2);
        } catch (SQLException ex) {
            Logger.getLogger(ChronoResults.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ChronoResults.class.getName()).log(Level.SEVERE, null, ex);
        }

        TaskSeries s1 = new TaskSeries(Sn1Name);
        TaskSeries s2 = new TaskSeries(Sn2Name);

        invertSeries(mList1, s1);
        invertSeries(mList2, s2);

        final TaskSeriesCollection collection = new TaskSeriesCollection();
        collection.add(s1);
        collection.add(s2);

        return collection;
    }

    private void invertSeries(ArrayList<Task> list, TaskSeries series) {
        int size = list.size();
        for (int i = list.size() - 1; i >= 0; i--) {
            series.add(list.get(i));
        }
    }

    private DatePairComp addTasks(String id, String sid1, String sid2, DatePairComp dpc, ArrayList s1, ArrayList s2) throws SQLException, Exception {
        /*
         * Collector objects have no part in the chronogram and are skipped.
         *
         */

        String tag = Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "TAG");
        if (tag == null) {
            tag = "business process";
        }
        //test+="tag=:"+tag;
        if ("collector".equalsIgnoreCase(tag)) {
            return new DatePairComp(new DatePair(dpc.getSetOneStart(), dpc.getSetOneEnd()), new DatePair(dpc.getSetTwoStart(), dpc.getSetTwoEnd()));
        }
        if ("insertion".equalsIgnoreCase(tag)) {
            return new DatePairComp(new DatePair(dpc.getSetOneStart(), dpc.getSetOneEnd()), new DatePair(dpc.getSetTwoStart(), dpc.getSetTwoEnd()));
        }
        /*
         * Service objects have no part in the chronogram and are skipped. But
         * they are in the path so any neighbors must be located.
         */
        if ("service".equalsIgnoreCase(tag)) {
            Iterator<String> itNode = Utils.nextNodes(id).iterator();
            DatePairComp dpcR = null;
            while (itNode.hasNext()) {
                String nn = itNode.next();
                dpcR = addTasks(nn, sid1, sid2, dpc, s1, s2);
            }
            return dpcR;
        }
        /*
         * Only activities that do not have application components assigned can
         * be incluced so if application components are present this object is
         * skipped.
         */
        if ("Activity".equalsIgnoreCase(tag)) {
            return new DatePairComp(new DatePair(dpc.getSetOneStart(), dpc.getSetOneEnd()), new DatePair(dpc.getSetTwoStart(), dpc.getSetTwoEnd()));
        }
        /*
         * Preparation tasks are not included in the chronogram as they have no
         * computed values.
         */
        if ("task".equalsIgnoreCase(tag) && Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "TYPE").equalsIgnoreCase("preparation")) {
            return new DatePairComp(new DatePair(dpc.getSetOneStart(), dpc.getSetOneEnd()), new DatePair(dpc.getSetTwoStart(), dpc.getSetTwoEnd()));
        }

        /*
         * acc date objects are accumulation object representing the start and
         * end times.
         */
        Date accStart1 = null;
        Date accStart2 = null;
        Date accEnd1 = null;
        Date accEnd2 = null;

        /*
         * These date objects will be the start and end times for the current
         * object.
         */
        Date start1 = dpc.getSetOneStart();
        Date start2 = dpc.getSetTwoStart();
        Date end1 = dpc.getSetOneEnd();
        Date end2 = dpc.getSetTwoEnd();
        /*
         * If the current object is the Business Trajectory it has no start time
         * or duration and must get it from its children.
         */
        if ("business process".equalsIgnoreCase(tag)) {
            test += "<br>business";
            Iterator<String> itNode = Utils.nextNodeChildren(id).iterator();
            Date ts1 = getZeroDate();
            Date ts2 = getZeroDate();
            Date te1 = getZeroDate();
            Date te2 = getZeroDate();

            while (itNode.hasNext()) {
                String nn = itNode.next();
                //test+=nn;
                DatePairComp dpcR = addTasks(nn, sid1, sid2, dpc, s1, s2);
                if (ts1 == getZeroDate()) {
                    ts1 = dpcR.getSetOneStart();
                } else if (dpcR.getSetOneStart().after(ts1)) {
                    ts1 = dpcR.getSetOneStart();
                }
                if (ts2 == getZeroDate()) {
                    ts2 = dpcR.getSetTwoStart();
                } else if (dpcR.getSetTwoStart().after(ts2)) {
                    ts2 = dpcR.getSetTwoStart();
                }
                if (te1 == getZeroDate()) {
                    te1 = dpcR.getSetOneEnd();
                } else if (dpcR.getSetOneEnd().after(te1)) {
                    te1 = dpcR.getSetOneEnd();
                }
                if (te2 == getZeroDate()) {
                    te2 = dpcR.getSetTwoEnd();
                } else if (dpcR.getSetTwoEnd().after(te2)) {
                    te2 = dpcR.getSetTwoEnd();
                }
            }
            start1 = ts1;
            start2 = ts2;
            end1 = te1;
            end2 = te2;
        } else {
            test += tag;
            /*
             * Initialize start and end time work fields with values from the
             * parent.
             */
            Date ts1 = dpc.getSetOneStart();
            Date ts2 = dpc.getSetTwoStart();
            Date te1 = dpc.getSetOneEnd();
            Date te2 = dpc.getSetTwoEnd();
            /*
             * Locate children of the current object and see if they need to be
             * added to the list.
             */
            Iterator<String> itNode = Utils.nextNodeChildren(id).iterator();

            try {
                String tod = Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "T_O_D");
                if (!EndTimeDisplay.isNotSet(tod)) {
                    ts1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(tod));
                    ts2 = ts1;
                    if (ts1.before(dpc.getSetOneStart())) {

                        test += "WARNING:C1" + tag + " " + getBpName(id) + " job start time " + ts1 + " before parents " + dpc.getSetOneStart() + ", using parents.";

                    }
                    if (ts2.before(dpc.getSetTwoStart())) {
                        test += "WARNING:C2" + tag + " " + getBpName(id) + " job start time " + ts2 + " before parents " + dpc.getSetTwoStart() + ", using parents.";

                    }
                } else {
                    if (ts1 == null) {
                        ts1 = getZeroDate();
                    }
                    if (ts2 == null) {
                        ts2 = getZeroDate();
                    }
                }
            } catch (Exception ex) {
                if (ts1 == null) {
                    ts1 = getZeroDate();
                }
                if (ts2 == null) {
                    ts2 = getZeroDate();
                }
            }
            while (itNode.hasNext()) {
                String nn = itNode.next();
                //test+=nn;
               
                te1 = calcDate2(ts1, getresponetime(id, sid1));
                // test+="duration="+te1+"::";
                te2 = calcDate2(ts2, getresponetime(id, sid2));
                DatePairComp dpcR = addTasks(nn, sid1, sid2, new DatePairComp(new DatePair(ts1, te1), new DatePair(ts2, te2)), s1, s2);
                //test+="eee"+dpcR.getSetOneEnd();
                if (ts1.after(dpcR.getSetOneStart())) {
                    ts1 = dpcR.getSetOneStart();
                }
                if (te1.before(dpcR.getSetOneEnd())) {
                    te1 = dpcR.getSetOneEnd();
                }
                if (ts2.after(dpcR.getSetTwoStart())) {
                    ts2 = dpcR.getSetTwoStart();
                }
                if (te2.before(dpcR.getSetTwoEnd())) {
                    te2 = dpcR.getSetTwoEnd();
                }
            }
            start1 = ts1;
            accStart1 = ts1;
            start2 = ts2;
            accStart2 = ts2;
            end1 = te1;
            accEnd1 = te1;
            end2 = te2;
            accEnd2 = te2;
            /*
             * Locate any neighbors to the current object and see if they need
             * to be added to the list.
             */
            itNode = Utils.nextNodes(id).iterator();
            /*
             * Set the start date equal to the end date of the current object
             * for its neighbor.
             */
            ts1 = accEnd1;
            ts2 = accEnd2;

            try {
                String tod = Utils.getNodeValue(id, XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "T_O_D");
                if (!EndTimeDisplay.isNotSet(tod)) {

                    ts1 = calcDate2(null, EndTimeDisplay.calcOffsetInSecond(tod));
                    ts2 = ts1;
                    if (ts1.before(dpc.getSetOneStart())) {
                        test += "WARNING:C1" + tag + " " + getBpName(id) + " job start time " + ts1 + " before parents " + dpc.getSetOneStart() + ", using parents.";
                        ts1 = dpc.getSetOneStart();
                    }
                    if (ts2.before(dpc.getSetTwoStart())) {
                        test += "WARNING:C1" + tag + " " + getBpName(id) + " job start time " + ts1 + " before parents " + dpc.getSetOneStart() + ", using parents.";
                        ts2 = dpc.getSetTwoStart();
                    }
                } else {
                    if (ts1 == null) {
                        ts1 = getZeroDate();
                    }
                    if (ts2 == null) {
                        ts2 = getZeroDate();
                    }
                }
            } catch (Exception ex) {
                if (ts1 == null) {
                    ts1 = getZeroDate();
                }
                if (ts2 == null) {
                    ts2 = getZeroDate();
                }
            }
            while (itNode.hasNext()) {


                String nn = itNode.next();


                te1 = calcDate2(ts1, getresponetime(id, sid1));
                te2 = calcDate2(ts2, getresponetime(id, sid2));
                DatePairComp dpcR = addTasks(nn, sid1, sid2, new DatePairComp(new DatePair(ts1, te1), new DatePair(ts2, te2)), s1, s2);
                if (dpcR.getSetOneEnd().after(accEnd1)) {
                    accEnd1 = dpcR.getSetOneEnd();
                }
                if (dpcR.getSetTwoEnd().after(accEnd2)) {
                    accEnd2 = dpcR.getSetTwoEnd();
                }

            }

        }


        /*
         * Business Trajector does not have a duration property and must be
         * skipped to prevent a null pointer exception.
         */

        /*
         * Add the current object to the list.
         */
        test = "adding task::" + getBpName(id) + "::";

        s1.add(new Task(getBpName(id), new SimpleTimePeriod(start1, end1)));
        s2.add(new Task(getBpName(id), new SimpleTimePeriod(start2, end2)));
        /*
         * Return to the parent the start time of the current object and the end
         * time of its last childs neighbor.
         */
        return new DatePairComp(new DatePair(accStart1, accEnd1), new DatePair(accStart2, accEnd2));
    }
}
