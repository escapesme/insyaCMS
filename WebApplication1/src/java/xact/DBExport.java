/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.DbInfo;
import lib.Options.XMLDataModel;

/**
 *
 * @author Ahmed
 */
public class DBExport {
/*
    ArrayList<String> tableList = new ArrayList<String>();
    ArrayList<String> dbList = new ArrayList<String>();
    lib.engine.db.operations db = new lib.engine.db.operations();

    public void saveACI(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "ARRIVAL_RATE", "INST_NAME", "MEAN_DASD_IO", "TOTAL_CPU", "ACD_ID", "LOGICAL_SERVER_INST_ID"},
                    {aci.getString("ID"), aci.getString("ARRIVAL_RATE"), aci.getString("INST_NAME"), aci.getString("MEAN_DASD_IO"), aci.getString("TOTAL_CPU"), aci.getString("ACD_ID"), aci.getString("LOGICAL_SERVER_INST_ID")}
                };

                db.setInsertNocon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveACD(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.application_component_desc_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "MPL", "NAME",},
                    {aci.getString("ID"), aci.getString("MPL"), aci.getString("NAME")}
                };

                db.setInsertNocon(XMLDataModel.application_component_desc_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveBaseSqlDesc(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.BASE_SQL_DESC_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "ORDER_TYPE", "NAME", "INDEX_DESC_ID", "SQL_COMPONENT_DESC_ID", "TABLE_DESC_ID"},
                    {aci.getString("ID"), aci.getString("ORDER_TYPE"), aci.getString("NAME"), aci.getString("INDEX_DESC_ID"), aci.getString("SQL_COMPONENT_DESC_ID"), aci.getString("TABLE_DESC_ID")}
                };

                db.setInsertNocon(XMLDataModel.BASE_SQL_DESC_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveBaseSqlInst(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.BASE_SQL_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "ORDER_FREQ", "BASE_SQL_DESC_ID", "SQL_COMPONENT_INST_ID", "TABLE_INST_ID"},
                    {aci.getString("ID"), aci.getString("ORDER_FREQ"), aci.getString("BASE_SQL_DESC_ID"), aci.getString("SQL_COMPONENT_INST_ID"), aci.getString("TABLE_INST_ID")}
                };

                db.setInsertNocon(XMLDataModel.BASE_SQL_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveComplexInst(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.COMPLEX_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "COMPLEX_TYPE", "NAME", "NUM_PROCESSORS", "TOT_LOGICAL_PROC", "VSNAME"},
                    {aci.getString("ID"), aci.getString("COMPLEX_TYPE"), aci.getString("NAME"), aci.getString("NUM_PROCESSORS"), aci.getString("TOT_LOGICAL_PROC"), aci.getString("VSNAME")}
                };

                db.setInsertNocon(XMLDataModel.COMPLEX_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveComplexSQLDesc(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "TYPE", "NAME", "SQL_COMPONENT_DESC_ID"},
                    {aci.getString("ID"), aci.getString("TYPE"), aci.getString("NAME"), aci.getString("SQL_COMPONENT_DESC_ID")}
                };

                db.setInsertNocon(XMLDataModel.COMPLEX_SQL_DESC_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveComplexSQLInst(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.COMPLEX_SQL_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "ORDER_FREQ", "COMPLEX_SQL_DESC_ID", "SQL_COMPONENT_INST_ID"},
                    {aci.getString("ID"), aci.getString("ORDER_FREQ"), aci.getString("COMPLEX_SQL_DESC_ID"), aci.getString("SQL_COMPONENT_INST_ID")}
                };

                db.setInsertNocon(XMLDataModel.COMPLEX_SQL_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveDbInst(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.DB_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "DB_CONFIG_NAME", "TYPE", "LOGICAL_SERVER_INST_ID"},
                    {aci.getString("ID"), aci.getString("DB_CONFIG_NAME"), aci.getString("TYPE"), aci.getString("LOGICAL_SERVER_INST_ID")}
                };

                db.setInsertNocon(XMLDataModel.DB_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveDbNameSpaceDesc(String projectId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, "*", "PROJECT_ID=" + projectId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                if(!dbList.contains(aci.getString("ID"))){
                    dbList.add(aci.getString("ID"));
                }
                String[][] data = {
                    {"ID", "NAME"},
                    {aci.getString("ID"), aci.getString("NAME")}
                };

                db.setInsertNocon(XMLDataModel.DB_NAMESPACE_DESC_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveDbNameSpaceInst(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "DB_INST_ID", "DB_NAMESPACE_DESC_ID"},
                    {aci.getString("ID"), aci.getString("DB_INST_ID"), aci.getString("DB_NAMESPACE_DESC_ID")}
                };

                db.setInsertNocon(XMLDataModel.DB_NAMESPACE_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveIndexDesc(String modelId) {
        for (String tableId : tableList) {
            try {
                
                ResultSet aci = db.getDataNeWcon(XMLDataModel.INDEX_DESC_TABLENAME, "*", "TABLE_DESC_ID=" + tableId,con);
                db.openDBCon(DbInfo.connectionStringExport);
                while (aci.next()) {
                    String[][] data = {
                        {"ID", "NAME", "USEFUL_SIZE", "TABLE_DESCRIPTION_ID"},
                        {aci.getString("ID"), aci.getString("NAME"), aci.getString("USEFUL_SIZE"), aci.getString("TABLE_DESC_ID")}
                    };

                    db.setInsertNocon(XMLDataModel.INDEX_DESC_TABLENAME, data);


                }
            } catch (SQLException ex) {
                Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
            }
            db.closeCon();
             
        }
        
    }

    public void saveIndexInst(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.INDEX_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "LOGICAL_DRIVE_NAME", "OTHER_ACCESS", "INDEX_DESC_ID", "TABLE_INSTANCE_ID"},
                    {aci.getString("ID"), aci.getString("LOGICAL_DRIVE_NAME"), aci.getString("OTHER_ACCESS"), aci.getString("INDEX_DESC_ID"), aci.getString("TABLE_INST_ID")}
                };

                db.setInsertNocon(XMLDataModel.INDEX_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveLogicalServerDesc(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.LOGICAL_SERVER_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "NAME"},
                    {aci.getString("ID"), aci.getString("NAME")}
                };

                db.setInsertNocon(XMLDataModel.LOGICAL_SERVER_DESC_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveLogicalServerInst(String modelId) {
        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "LOGICAL_PROCESSORS", "COMPLEX_INST_ID", "LOGICAL_SERVER_ID"},
                    {aci.getString("ID"), aci.getString("LOGICAL_PROCESSORS"), aci.getString("COMPLEX_INST_ID"), aci.getString("LOGICAL_SERVER_ID")}
                };

                db.setInsertNocon(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
    }

    public void saveSQlAppDesc(String modelId) {

        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.SQL_APPLICATION_DESC_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            String acdId="";

            while (aci.next()) {
                            acdId=db.getRowNewCon(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "AC_ID="+aci.getString("AC_ID"), con)[2];
                String[][] data = {
                    {"ID", "NAME", "AC_ID"},
                    {aci.getString("ID"), aci.getString("NAME"), acdId}
                };

                db.setInsertNocon(XMLDataModel.SQL_APPLICATION_DESC_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }

        db.closeCon();
    }

    public void saveSQlAppInst(String modelId) {

        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.SQL_APPLICATION_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "ACTIVATION", "CPU_BEFORE", "IO_BEFORE", "NUM_TRANS_BEFORE", "AC_INST_ID", "SQL_APPLICATION_DESC_ID"},
                    {aci.getString("ID"), aci.getString("ACTIVATION"), aci.getString("CPU_BEFORE"), aci.getString("IO_BEFORE"), aci.getString("NUM_TRANS_BEFORE"), aci.getString("AC_INST_ID"), aci.getString("SQL_APPLICATION_DESC_ID")}
                };

                db.setInsertNocon(XMLDataModel.SQL_APPLICATION_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }

        db.closeCon();
    }

    public void saveSQlComponentDesc(String modelId) {

        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "NAME", "SQL_APPLICATION_DESC_ID"},
                    {aci.getString("ID"), aci.getString("NAME"), aci.getString("SQL_APPLICATION_DESC_ID")}
                };

                db.setInsertNocon(XMLDataModel.SQL_COMPONENT_DESC_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }

        db.closeCon();
    }

    public void saveSQlComponentInst(String modelId) {

        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "ORDER_FREQ", "SQL_APPLICATION_INST_ID", "SQL_COMPONENT_DESC_ID"},
                    {aci.getString("ID"), aci.getString("ORDER_FREQ"), aci.getString("SQL_APPLICATION_INST_ID"), aci.getString("SQL_COMPONENT_DESC_ID")}
                };

                db.setInsertNocon(XMLDataModel.SQL_COMPONENT_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }

        db.closeCon();
    }

    public void saveTableDesc(String projectId) {
       
       // System.err.println("dbnamespaces="+dbList.size());
        for(String dbId:dbList){
        try {
            
           
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.TABLE_DESC_TABLENAME, "*", "DB_NAMESPACE_DESC_ID=" + dbId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                 //System.err.println("current id="+dbId);
                if (!tableList.contains(aci.getString("ID"))) {
                    tableList.add(aci.getString("ID"));
                }
                String[][] data = {
                    {"ID", "NAME", "USEFUL_SIZE", "DB_NAMESPACE_DESC_ID"},
                    {aci.getString("ID"), aci.getString("NAME"), aci.getString("USEFUL_SIZE"), aci.getString("DB_NAMESPACE_DESC_ID")}
                };

                db.setInsertNocon(XMLDataModel.TABLE_DESC_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
          
    }
        
    }

    public void saveTableInst(String modelId) {

        try {
            
            ResultSet aci = db.getDataNeWcon(XMLDataModel.TABLE_INST_TABLENAME, "*", "MODEL_ID=" + modelId,con);
            db.openDBCon(DbInfo.connectionStringExport);
            while (aci.next()) {
                String[][] data = {
                    {"ID", "DB_NAMESPACE_INST_ID", "TABLE_DESC_ID"},
                    {aci.getString("ID"), aci.getString("DB_NAMESPACE_INST_ID"), aci.getString("TABLE_DESC_ID")}
                };

                db.setInsertNocon(XMLDataModel.TABLE_INST_TABLENAME, data);


            }
        } catch (SQLException ex) {
            Logger.getLogger(DBExport.class.getName()).log(Level.SEVERE, null, ex);
        }

        db.closeCon();
    }
 Connection con = null;
    public void saveTables(String modelId, String projectId) {
        con = db.openDBConNewcon(lib.Options.DbInfo.connectionString);
        saveACD(modelId);
        saveACI(modelId);
        saveBaseSqlDesc(modelId);
        saveBaseSqlInst(modelId);
        saveComplexInst(modelId);
        saveComplexSQLDesc(modelId);
        saveComplexSQLInst(modelId);
        saveDbInst(modelId);
        saveDbNameSpaceDesc(projectId);
        saveTableDesc(projectId);
        saveDbNameSpaceInst(modelId);
        saveIndexDesc(modelId);
        saveIndexInst(modelId);
        saveLogicalServerDesc(modelId);
        saveLogicalServerInst(modelId);
        saveSQlAppDesc(modelId);
        saveSQlAppInst(modelId);
        saveSQlComponentDesc(modelId);
        saveSQlComponentInst(modelId);
        saveTableInst(modelId);
        db.closeConNewcon(con);
    }*/
}
