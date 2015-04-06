/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;

/**
 *
 * @author Ahmed
 */
public class ServerNodeOperations {
    lib.engine.db.operations db = new lib.engine.db.operations();

    public String getNodeList(String modelId, String type) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.NODE_TABLENAME, "*", "MODEL_ID=" + modelId + " AND TYPE='" + type + "'");
        try {
            while (rs.next()) {
                data += rs.getString("ID") + "__" + rs.getString("NAME") + ";";
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public String getNodeType(String nodeid) {
        
        db.openCon();
       
      
        String nodeType=db.getValueNocon(XMLDataModel.NODE_TABLENAME, "TYPE", "ID="+nodeid);
        db.closeCon();
        return nodeType;
    }
         public boolean isDisksDeletable(String nodeid) {
        
        db.openCon();
       
      
        String nodeType=db.getValueNocon(XMLDataModel.NODE_TABLENAME, "TYPE", "ID="+nodeid);
        if(nodeType.equalsIgnoreCase("Storage")){
        ResultSet rs = db.getData(XMLDataModel.LINE_TABLENAME, "*", "NODE_ID1=" + nodeid + " OR NODE_ID2=" + nodeid );
        try {
            return !rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
            return true;
        }
        }
         db.closeCon();
        return true;
    }
     public String getConnectedStorageNode(String nodeid) {
        String data = "";
        db.openCon();
        String storageNode="";
      
        
        ResultSet rs = db.getData(XMLDataModel.LINE_TABLENAME, "*", "NODE_ID1=" + nodeid + " OR NODE_ID2=" + nodeid );
        
        try {
            while (rs.next()) {
                if(rs.getString("NODE_ID1").equals(nodeid)){
                    storageNode=rs.getString("NODE_ID2");
                }else{
                    storageNode=rs.getString("NODE_ID1");
                }
               
               
                String []nodeType=db.getRowNocon(XMLDataModel.NODE_TABLENAME, "ID="+storageNode);
                if(nodeType[10].equalsIgnoreCase("storage")){
                data = nodeType[0] ;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
            
       // data=    ex.getMessage();
            
        }
         db.closeCon();
        return data;
    }
      public String getConnectedNode(String nodeid,String type) {
        String data = "";
        db.openCon();
        String storageNode="";
      
        
        ResultSet rs = db.getData(XMLDataModel.LINE_TABLENAME, "*", "NODE_ID1=" + nodeid + " OR NODE_ID2=" + nodeid );
        try {
            while (rs.next()) {
                if(rs.getString("NODE_ID1").equals(nodeid)){
                    storageNode=rs.getString("NODE_ID2");
                }else{
                    storageNode=rs.getString("NODE_ID2");
                }
                String []nodeType=db.getRowNocon(XMLDataModel.NODE_TABLENAME, "ID="+storageNode);
                if(nodeType[10].equalsIgnoreCase(type)){
                data += nodeType[0] + "__" + nodeType[5] + ";";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
         db.closeCon();
        return data;
    }
    public String getNodeListMDL(String modelId, String type) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.NODE_TABLENAME, "*", "MODEL_ID=" + modelId + " AND TYPE='" + type + "'");
        try {
            while (rs.next()) {
                ResultSet serverList = db.getData(XMLDataModel.SERVER_INST_TABLENAME, "*", "NODE_ID=" + rs.getString("ID"));
                if (serverList.next()) {
                    data += rs.getString("ID") + "__" + rs.getString("NAME") + ";";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
         db.closeCon();
        return data;
    }

    public String getServeses(String modelId, String groupid) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.NODE_TABLENAME, "*", "MODEL_ID=" + modelId + " AND GROUP_ID='" + groupid + "'");
        try {
            while (rs.next()) {
               // if(rs.getString("TYPE").equalsIgnoreCase("server")){
                ResultSet serverList = db.getData(XMLDataModel.SERVER_INST_TABLENAME, "*", "NODE_ID=" + rs.getString("ID"));
                while (serverList.next()) {
                    data += rs.getString("ID") + "__" + rs.getString("NAME") + ";";
                }
               // }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
         db.closeCon();
        return data;
    }

    public String getComplex(String modelId, String serverid) {
        String data = "";



        String[] rsdata = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, "MODEL_ID=" + modelId + " AND NODE_ID='" + serverid + "'");


        db.openCon();



        ResultSet rs = db.getData(XMLDataModel.COMPLEX_INST_TABLENAME, "*", "MODEL_ID=" + modelId + " AND SERVER_INST_ID='" + rsdata[0] + "'");
        try {
            while (rs.next()) {

                data += rs.getString("ID") + "__" + rs.getString("NAME") + ";";

            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }

 db.closeCon();

        return data;
    }

    public String getACIs(String modelId, String serverid) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "*", "MODEL_ID=" + modelId + " AND LOGICAL_SERVER_INST_ID='" + serverid + "'");
        try {
            while (rs.next()) {

                data += rs.getString("ID") + "__" + rs.getString("INST_NAME") + ";";

            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
         db.closeCon();
        return data;
    }
     public String getACDs(String modelId, String serverid) {
        String data = "";
        String lsID=db.getRow(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "ID="+serverid)[1];
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.ACD2LS_LIST_TABLENAME, "*", "MODEL_ID=" + modelId + " AND LS_ID='" + lsID + "'");
        try {
            while (rs.next()) {
                String []acdRow=db.getRowNocon(XMLDataModel.application_component_desc_TABLENAME, "ID="+rs.getString("ACD_ID"));
                data += rs.getString("ACD_ID") + "__" + acdRow[2]+ ";";

            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
         db.closeCon();
        return data;
    }

    public String getlogical_servers(String modelId, String serverid) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "MODEL_ID=" + modelId + " AND COMPLEX_INST_ID='" + serverid + "'");
        try {
            while (rs.next()) {
                ResultSet serverList = db.getData(XMLDataModel.LOGICAL_SERVER_TABLENAME, "*", "ID=" + rs.getString("LOGICAL_SERVER_ID"));
                while (serverList.next()) {
                    data += rs.getString("ID") + "__" + serverList.getString("NAME") + ";";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
         db.closeCon();
        return data;
    }
      public String getAlllogicalServers(String modelId) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.LOGICAL_SERVER_INST_TABLENAME, "*", "MODEL_ID=" + modelId+" AND COMPLEX_INST_ID <> '0'");
        try {
            while (rs.next()) {
                ResultSet serverList = db.getData(XMLDataModel.LOGICAL_SERVER_TABLENAME, "*", "ID=" + rs.getString("LOGICAL_SERVER_ID"));
                while (serverList.next()) {
                    data += rs.getString("ID") + "__" + serverList.getString("NAME") + ";";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
         db.closeCon();
        return data;
    }

    public String getNodeListNoMDL(String modelId, String type) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.NODE_TABLENAME, "*", "MODEL_ID=" + modelId );
        try {
            while (rs.next()) {
                ResultSet serverList = db.getData(XMLDataModel.SERVER_INST_TABLENAME, "*", "NODE_ID=" + rs.getString("ID"));
                if (!serverList.next()) {
                    data += rs.getString("ID") + "^" + rs.getString("GROUP_ID") + "__" + rs.getString("NAME") + ";";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
         db.closeCon();
        return data;
    }

    public String getGroups(String modelId) {
        String data = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.NET_GROUP_TABLENAME, "*", "MODEL_ID='" + modelId + "'");
        try {
            while (rs.next()) {

                data += rs.getString("ID") + "__" + rs.getString("NAME") + ";";

            }
        } catch (SQLException ex) {
            Logger.getLogger(ServerNodeOperations.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
        return data;
    }
}
