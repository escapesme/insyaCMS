/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import lib.Options.XMLDataModel;
import lib.tools.Utils;

/**
 *
 * @author Ahmed
 */
public class ServerOperations {

    public void copyACI(String LOGICAL_SERVER_INST_ID, String id) throws SQLException {
        db.openCon();
        ResultSet aci = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "LOGICAL_SERVER_INST_ID=" + LOGICAL_SERVER_INST_ID);
        while (aci.next()) {

            String[] aciRow = db.getRowNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "id=" + aci.getString("ID"));
            String aciId = Utils.getNewID();
            aciRow[0] = aciId;
            aciRow[4] = id;
            String[][] aciData = {
                {"ID", "MODEL_ID", "ACD_ID", "AC_ID", "LOGICAL_SERVER_INST_ID", "DISK_VOL_ID", "INST_NAME", "INST_MULTIPRO", "ARRIVAL_RATE", "TOTAL_CPU", "MEAN_DASD_IO", "MEAN_AUX_DELAY", "AVG_AUX_DELAY", "MEAN_EXT_STORAGE", "AVG_PAGE_XFER", "PGRP_OVERLAP", "DGRP_OVERLAP", "MEAN_IO", "MEAN_LOCK_REQ", "TEMP", "DISTANCE", "FAILOVER_DELAY", "ACTIVE_STATUS", "NUM_TERMINAL"},
                aciRow
            };
            db.setInsertNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, aciData);
        }
        db.closeCon();

    }

    public String addServer(String id, String complexId, String modelId, String[] addDataa, String Satatus) {
        db.openCon();
        String newID = Utils.getNewID();
        String[] addData = null;

        if (addDataa == null) {

            String[] row = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "id=" + id);

            row[0] = newID;
            row[2] = complexId;
            addData = row;

        } else {
            addData = addDataa;

        }

        //            {"ID", "LOGICAL_SERVER_ID", "COMPLEX_INST_ID", "MODEL_ID", "LOGICAL_PROCESSORS", "TOTAL_PRIO", "TIME_SLICE", "CPU_LIMIT", "CPU_QUANTUM"},
        String[][] mydata = {
            {"ID", "LOGICAL_SERVER_ID", "COMPLEX_INST_ID", "MODEL_ID", "LOGICAL_PROCESSORS", "TOTAL_PRIO", "TIME_SLICE", "CPU_LIMIT", "CPU_QUANTUM"},
            addData
        };

        db.setInsertNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, mydata);

        if (Satatus.equalsIgnoreCase("create")) {
            addData[2] = "0";
            addData[0] = Utils.getNewID();
            String[][] mydata2 = {
                {"ID", "LOGICAL_SERVER_ID", "COMPLEX_INST_ID", "MODEL_ID", "LOGICAL_PROCESSORS", "TOTAL_PRIO", "TIME_SLICE", "CPU_LIMIT", "CPU_QUANTUM"},
                addData
            };
            db.setInsertNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, mydata2);
        }

        db.closeCon();
        return newID;
    }

    public String updateServer(String[] addData, String id) {
        db.openCon();

        String[][] mydata = {
            {"LOGICAL_PROCESSORS", "TOTAL_PRIO", "TIME_SLICE", "CPU_LIMIT", "CPU_QUANTUM"},
            addData
        };

      String r=  db.setUpdateNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, mydata, "id='" + id + "'");

        db.closeCon();
        return r;
    }

    public void delServer(String id) {
        db.openCon();
        db.setDeleteNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + id);
        db.closeCon();

    }

    public void delServerimage(String id) {
        db.openCon();
        db.setDeleteNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + id);
        db.closeCon();

    }
    lib.engine.db.operations db = new lib.engine.db.operations();

    public Map<String, String> getComplexList(String modelId, String complexId) throws SQLException {
        db.openCon();
        Map<String, String> data = new HashMap<String, String>();
        ResultSet serverComData = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "", " MODEL_ID='" + modelId + "' AND COMPLEX_INST_ID =" + complexId);
        while (serverComData.next()) {
            String[] serverRow = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "ID=" + serverComData.getString("LOGICAL_SERVER_ID"));
            data.put(serverComData.getString("ID"), serverRow[2]);

        }
        db.closeCon();
        return data;
    }

    public Map<String, String> getACDList(String modelId, String serverId) throws SQLException {

        Map<String, String> data = new HashMap<String, String>();

        db.openCon();
        String lsId = db.getRowNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID=" + serverId)[1];

        ResultSet serverComData = db.getData(XMLDataModel.ACD2LS_LIST_TABLENAME, "", " MODEL_ID='" + modelId + "' AND LS_ID =" + lsId);
        while (serverComData.next()) {
            String[] serverRow = db.getRowNocon(XMLDataModel.application_component_desc_TABLENAME, "ID=" + serverComData.getString("ACD_ID"));

            data.put(serverRow[0], serverRow[2]);

        }
        db.closeCon();

        return data;
    }

}
