/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package lib.tools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;

/**
 *
 * @author A7med
 */
/**
 * <b><i>Example usage for the class.</i> </b><p> <br> <b>Getting the node
 * values for the current time</b>:<br> NodeFunctions nf=new
 * NodeFunctions("1274887087101");<br> nf.initDownTime();<br> Now you can access
 * the node various properties through the getxxx() methods. <br>e.g:
 * nf.getDownTimeYear() will give the down time of the past year.<br><br>
 * <b>Getting the node values for the a specific month</b>:<br> NodeFunctions
 * nf=new NodeFunctions("1274887087101");<br> nf.initDownTimeForMonth(1);<br>
 * This will set the node for February, and you can access the node properties in
 * the same way.
 *
 *
 */
public class NodeFunctions {

    private String nodeId;
    private int status;
    private double mtbf;
    private double mttr;
    private double mttf;
    private int yearOuts = 0;
    private int monthOuts = 0;
    private int yearUps = 0;
    private int monthUps = 0;
    private long downTimeYear;
    private long downTimeMonth;
    private Date lastFailure;
    private Date lastRestore;
    private ResultSet col;
    private int month = -1;
    static lib.engine.db.operations db = new lib.engine.db.operations();

    /**
    * Class constructor specifying the initial node id.
    */
    public NodeFunctions(String node) {

        this.nodeId = node;


    }

    /**
 * Sets the node id to a new value. 
 * <p>
 * This method recalculates the node values after setting the new id. 
 * it first checks to see if we're looking for a specific month or the current time,
 * and updates the data accordingly.
 
 * @param  nodeId  the new node id
 * 
 */
    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
        if (month == -1) {
            try {


                initDownTime();
            } catch (SQLException ex) {
                Logger.getLogger(NodeFunctions.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                initDownTimeForMonth(month);
            } catch (SQLException ex) {
                Logger.getLogger(NodeFunctions.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
 * Returns the current node id. 

 * @return  nodeId  the node id
 */
    public String getNodeId() {
        return nodeId;
    }

    /**
 * Returns the calculated node Mtbf. 

 * @return  mtbf  the node mtbf
 */
    public double getMtbf() {
        return mtbf;
    }

    /**
 * Returns the calculated node Mttf. 

 * @return mttf  the node mttf
 */
    public double getMttf() {
        return mttf;
    }

    /**
 * Returns the calculated node Mttr. 

 * @return  mttr  the node mttr
 */
    public double getMttr() {
        return mttr;
    }

    /**
 * Returns the calculated node status. 

 * @return  status  the node status
 */
    public int getStatus() {
        return status;
    }

    /**
 * Calculates the impact of the down time on the node. 
 * <p>
 * This method uses the node down time month to calculate the impact.
 * if the downt time is 0, the impact is 0 too
 
 * @param  month  the month to calculate the impact for
 * @return  impact  the node impact
 */
    public double getImpact(int month) {
        if (downTimeMonth <= 0d) {
            return 0d;
        }
        Calendar c = Calendar.getInstance();
        int maxDays = 0;
        if (month == c.get(Calendar.MONTH)) {
            maxDays = c.get(Calendar.DAY_OF_MONTH);
        } else {
            c.set(Calendar.MONTH, month);
            maxDays = c.getMaximum(Calendar.MONTH);
        }
        double availseconds = maxDays * 24 * 60 * 60;
        return downTimeMonth / availseconds;
    }

    /**
 * Calculates the down time for both the year and month for the node.
 * <p>
 * This method is where the main calculation for the node is done. 
 * @param  col  the results set containing the node down events from availability_event_log.
 * @param  startDate the start date to calculate the down time from it.
 * @param  endDate the end date to calculate the down time up to it.
 * @return dsecs the down time for the specified period.
 */
    private long getDownTime(ResultSet col, Date startDate, Date endDate, boolean mth) throws SQLException {
        boolean up = true;
        Date lfd = null;
        Date lud = null;
        int outs = 0;
        int ups = 0;
        Date sDate = startDate;

        Date wDate = sDate;
        long dsecs = 0l;
        while (col.next()) {
            Date ae = col.getDate("EVENT_DATE");
            if (ae != null) {
                if (ae.after(sDate)) {
                    sDate = ae;
                }
            } else {
                Date modelDate = getModelCreationDate(nodeId);
                if (modelDate.after(sDate)) {
                    sDate = modelDate;
                }
            }

            int eType = col.getInt("EVENT_TYPE");
            Date eTimeStamp = col.getDate("EVENT_DATE");
            if (eTimeStamp.after(endDate)) {
                break;
            }
            switch (eType) {
                case AvailabilityEvent.ENTERED_SERVICE_EVENT:
                    if (eTimeStamp.after((startDate))) {
                        dsecs = 0l;
                        wDate = eTimeStamp;
                    }
                    break;
                case AvailabilityEvent.ENVIRONMENT_EVENT:
                case AvailabilityEvent.HARDWARE_EVENT:
                case AvailabilityEvent.NETWORK_EVENT:
                case AvailabilityEvent.SOFTWARE_EVENT:
                    if (eTimeStamp.after(startDate)) {
                        if (up) {
                            wDate = eTimeStamp;
                            lfd = eTimeStamp;
                            outs++;
                        }
                    }
                    up = false;
                    break;
                case AvailabilityEvent.RESTORED_EVENT:
                    if (eTimeStamp.after(startDate)) {
                        if (!up) {
                            dsecs += getTimeDiff(wDate, eTimeStamp);
                            wDate = eTimeStamp;
                            lud = eTimeStamp;
                            ups++;
                        }
                    }
                    up = true;
                    break;
            }
        }

        if (up) {
            status = 0;
        } else {
            dsecs += getTimeDiff(wDate, endDate);
            status = 2;
        }
        if (mth) {
            monthOuts = outs;
            monthUps = ups;
        } else {
            yearOuts = outs;
            yearUps = ups;
        }
        if (lud == null) {
            lastRestore = sDate;
        } else {
            lastRestore = lud;
        }
        if (lfd == null) {
            lastFailure = sDate;
        } else {
            lastFailure = lfd;
        }
        return dsecs;
    }

    /**
 * Calculates the time difference in seconds between 2 dates.
  
 * @param  sdate  the start date.
 * @param  edate the end date.
 * @return diff the time difference between the 2 dates.
 */
    private long getTimeDiff(Date sdate, Date edate) {
        Calendar scal = Calendar.getInstance();
        Calendar ecal = Calendar.getInstance();
        scal.setTime(sdate);
        ecal.setTime(edate);
        long diff = (ecal.getTimeInMillis() - scal.getTimeInMillis()) / 1000;;
        return diff;
    }

    /**
 * this is the entry point for calculating the node values. This method must be called first.
 * <p>
 * This is the version that calculates for the current time.
   */
    public void initDownTime() throws SQLException {
        Calendar cal = Calendar.getInstance();
        Date endDate = cal.getTime();
        Calendar ncal = Calendar.getInstance();
        ncal.add(Calendar.YEAR, -1);
        Date startDate = ncal.getTime();
        db.openCon();
        col = getEventForRange(nodeId, startDate, endDate);
        // down time for past year.
        downTimeYear = getDownTime(col, startDate, endDate, false);
        Calendar mcal = Calendar.getInstance();
        mcal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), 1, 0, 0, 0);
        startDate = mcal.getTime();
        // down time for month
        downTimeMonth = getDownTime(col, startDate, endDate, true);
        calculateMTBF();
        calculateMTTR();
        calculateMTTF();
        db.closeCon();
    }

    /**
 * this is the entry point for calculating the node values. This method must be called first.
 * <p>
 * This is the version that calculates for a specific month. The calculation can only go back one year from now.
 * @param month the month to calculate the node values for. The month numbers starts with 0. So, January will be 0.
   */
    public void initDownTimeForMonth(int month) throws SQLException {
        Calendar cal = Calendar.getInstance();
        Date endDate;
        if (cal.get(Calendar.MONTH) == month) {
            endDate = cal.getTime();
        } else {
            if (cal.get(Calendar.MONTH) < month) {
                cal.add(Calendar.YEAR, -1);
            }
            cal.set(Calendar.MONTH, month);
            int year = cal.get(Calendar.YEAR);
            int day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
            cal.set(year, month, day, 23, 59, 59);
            endDate = cal.getTime();
        }
        cal.add(Calendar.YEAR, -1);
        Date startDate = cal.getTime();
        db.openCon();
        col = getEventForRange(nodeId, startDate, endDate);
        downTimeYear = getDownTime(col, startDate, endDate, false);
        Calendar mcal = Calendar.getInstance();
        mcal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), 1, 0, 0, 0);
        startDate = mcal.getTime();
        downTimeMonth = getDownTime(col, startDate, endDate, true);
        calculateMTBF();
        calculateMTTR();
        calculateMTTF();
        db.closeCon();
    }
    private static final long SECONDS_YEAR = 365 * 24 * 60 * 60;

    private void calculateMTBF() {

        mtbf = getNodeMtbf(nodeId);

        if (mtbf == 0) {
            if (yearOuts > 0) {
                mtbf = (SECONDS_YEAR - downTimeYear) / yearOuts;
            } else {
                mtbf = SECONDS_YEAR;
            }
        }
    }

    private void calculateMTTF() {
        if (lastRestore == null) {
            mttf = SECONDS_YEAR;
        } else if (status == 1) {
            mttf = 0.0d;
        } else {
            Calendar c = Calendar.getInstance();
            long secondsSinceLastRestart = getTimeDiff(lastRestore, c.getTime());
            if (secondsSinceLastRestart <= 0) {
                mttf = 0d;
            } else {
                mttf = secondsSinceLastRestart;
            }
        }
    }

    private void calculateMTTR() {

        mttr = getNodeMttr(nodeId);

        if (mttr == 0) {
            if (yearOuts > 0) {
                mttr = downTimeYear / yearOuts;
            } else {
                mttr = 0d;
            }
        }
    }

    public long getDownTimeMonth() {
        return downTimeMonth;
    }

    public long getDownTimeYear() {
        return downTimeYear;
    }

    /**
 * Gets the down time for a certain amount of days.
 * <p>
 * This method calculates the down time for a custom amount of days, this should be used in cases the down time for the current date or the down time
 * for a certain month isn't needed.
 * @param days the amount of days to calculate the down time for.
 * @return downtime the calculated down time for the specified amount of days.
   */
    public long getDownTimeLast(int days) throws SQLException {
        Calendar today = Calendar.getInstance();
        Calendar past = Calendar.getInstance();
        past.add(Calendar.DATE, days);
        ResultSet colAv = getEventForRange(nodeId, today.getTime(), past.getTime());
        long downtime = getDownTime(colAv, today.getTime(), past.getTime(), false);
        return downtime;
    }

    /**
 * Gets the number of events in the past duration of days.
 * @param days the amount of days to calculate the number of events for. the number should be negative.
 * @return cnt the number of events.
   */
    public int numberOfDownEvents(int days) throws SQLException {
        Calendar today = Calendar.getInstance();
        Calendar past = Calendar.getInstance();
        past.add(Calendar.DATE, days);
        ResultSet colAv = getEventForRange(nodeId, today.getTime(), past.getTime());
        int cnt = 0;

        while (colAv.next()) {
            int ae = Integer.parseInt(colAv.getString("EVENT_TYPE"));
            if (!(ae == AvailabilityEvent.SOFTWARE_EVENT) && !(ae == AvailabilityEvent.ENTERED_SERVICE_EVENT)) {
                cnt++;
            }
        }
        return cnt;
    }

    /**
 * Gets the creation date of the model the current node is on.
 * @param nodeID the id of the node to get its model creation date.
 * @return creationDtae the model creation date.
   */
    private Date getModelCreationDate(String nodeID) {
        Date creationDtae = null;
        db.openCon();
        try {

            String modelID = db.getRowNocon(XMLDataModel.NODE_TABLENAME, "ID=" + nodeID)[1];

            ResultSet modelRS = db.getData(XMLDataModel.MODEL_TABLENAME, "*", "ID=" + modelID);
            while (modelRS.next()) {
                creationDtae = modelRS.getDate("CREATION_DATE");

            }
        } catch (SQLException ex) {
            Logger.getLogger(NodeFunctions.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (creationDtae == null) {
            creationDtae = new Date();
        }
        db.closeCon();
        return creationDtae;
    }

    /**
 * Gets a collection of down events for a specific time range.
 * @param nodeID the id to get the down events for.
 * @param startDate the starting point of the time range.
 * @param endDate the end point of the time range.
 * @return rs the result set containing the event collection for the specified range.
   */
    private ResultSet getEventForRange(String nodeID, Date startDate, Date endDate) {
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("yyyy-MM-dd HH:MM");
        String sqlenddate = formatter.format(endDate);
        String sqlstartdate = formatter.format(startDate);
        Calendar cal = Calendar.getInstance();

        Date d1 = cal.getTime();

        cal.add(Calendar.YEAR, -1);


        Date d2 = cal.getTime();



        ResultSet rs = db.getData(XMLDataModel.AVAILABILITY_EVENT_LOG_TABLENAME, "*", "  NODE_ID =" + nodeID + " AND EVENT_DATETIME BETWEEN '" + sqlstartdate + "' AND '" + sqlenddate + "' ORDER BY EVENT_DATETIME");

        return rs;
    }

    /**
 * Gets the node MTBF from the database.
 * @param nodeID the id to get the MTBF value for.
  * @return nodeMtbf the value of the node's MTBF.
   */
    private double getNodeMtbf(String nodeID) {
        double nodeMtbf = 0;
        String mtbfValue = db.getRowNocon(XMLDataModel.NODE_EXT_TABLENAME, "ID=" + nodeID)[5];
        if (mtbfValue != null && !mtbfValue.equals("null")) {
            nodeMtbf = Double.parseDouble(mtbfValue);
        }
        return nodeMtbf;
    }
  /**
 * Gets the node MTTR from the database.
 * @param nodeID the id to get the MTBF value for.
  * @return nodeMttr the value of the node's MTTR.
   */
    private double getNodeMttr(String nodeID) {
        double nodeMttr = 0;
        String mtbfValue = db.getRow(XMLDataModel.NODE_EXT_TABLENAME, "ID=" + nodeID)[5];
        if (mtbfValue != null && !mtbfValue.equals("null")) {
            nodeMttr = Double.parseDouble(mtbfValue);
        }
        return nodeMttr;
    }

    /**
     * @return the month
     */
    public int getMonth() {
        return month;
    }

    /**
     * @param month the month to set
     */
    public void setMonth(int month) {
        this.month = month;
    }
}
