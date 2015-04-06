/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.views;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import lib.Options.MyVariables;
import lib.Options.XMLDataModel;
import lib.tools.Utils;

/**
 *
 * @author ismail
 */
public class advanceImplementation {
    
    lib.engine.db.operations db = new lib.engine.db.operations();
    ArrayList<String> groupIds = new ArrayList<String>();
    /**
     * return the display for the cloud objects in the implementation view.
     * @param id
     * @param LATITUDE
     * @param LONGITUDE
     * @param pro_id
     * @param mod_id
     * @param sid
     * @return
     * @throws SQLException 
     */
    public String getCludes(String id, String LATITUDE, String LONGITUDE, String pro_id, String mod_id, String sid) throws SQLException {
        String data = "";
        
        
        db.openCon();
        String[] myid = id.split("/");
        
        ResultSet rs4 = db.getData(XMLDataModel.CLOUD_LOC_XREF_TABLENAME, "*", " LOCATION_ID='" + myid[1] + "'");
        
        
        int mnum = 0;
        while (rs4.next()) {
            String[] datac = db.getRowNocon(XMLDataModel.CLOUD_TABLENAME, " ID='" + rs4.getString("CLOUD_ID") + "'");
            String newID = datac[0] + "/" + myid[1] + "/" + datac[1];
            
                data += " GetCludes(" + LATITUDE + "," + LONGITUDE + ",\"" + newID + "\" ,\"" + datac[5] + "\",\"" + datac[6] + "\",\"" + datac[7] + "\",map,\"" + datac[2] + "\",\"" + datac[4] + "\",\"" + myid[1] + "\"," + mnum + ",'"+ MyVariables.imagesURL +"');";
            

             mnum++;
        }
//db.closeCon();

        return data;
        
    }
    /**
     * returns the groups in the implementation view for the consolidation scenarios
     * @param id
     * @param LATITUDE
     * @param LONGITUDE
     * @param pro_id
     * @param mod_id
     * @param sid
     * @return
     * @throws SQLException 
     */
    public String getGroups(String id, String LATITUDE, String LONGITUDE, String pro_id, String mod_id, String sid) throws SQLException {
        
        String retunData = "";
        
        db.openCon();
        String[] myid = id.split("/");
        
        xact.viewsClass v = new xact.viewsClass();
        
        v.group();
        
        
        String[] i_setting = getSetting(pro_id);
        String data = " ";
        int num = 0;
        
        db.closeCon();
        
        db.openCon();
        
        ResultSet rs4 = db.getData(XMLDataModel.NET_GROUP_TABLENAME, "*", " LOCATION_ID='" + myid[1] + "'");
        while (rs4.next()) {
            
            String groupOut = db.getRowNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "OBJECT_ID='" + rs4.getString("id") + "' and OBJECT_CLASS='com.acrtek.xact_services.data.bo.BoGroup' and S_PARAMETER='LOCATION' and SCENARIO_ID='" + sid + "'")[5];
            
            if (groupOut == null || groupOut.equalsIgnoreCase("null")) {
                
                num++;
            }
            
            
            
            
            
        }
        
        
        
        
        ResultSet rs3 = db.getData(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "*", "NEW_VALUE='" + myid[1] + "' and OBJECT_CLASS='com.acrtek.xact_services.data.bo.BoGroup' and S_PARAMETER='LOCATION' and SCENARIO_ID='" + sid + "'");
        while (rs3.next()) {
            
            num++;
            
        }
        
        
        
        
        ResultSet rs = db.getData(XMLDataModel.NET_GROUP_TABLENAME, "*", " LOCATION_ID='" + myid[1] + "'");
        
        while (rs.next()) {
            String mynewid = rs.getString("id");
            
            
            String groupOut = db.getRow(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "OBJECT_ID='" + mynewid + "' and OBJECT_CLASS='com.acrtek.xact_services.data.bo.BoGroup' and S_PARAMETER='LOCATION' and SCENARIO_ID='" + sid + "'")[5];
            
            String[] typedata = db.getRow(XMLDataModel.GROUP_TYPE_TABLENAME, "id=" + rs.getString("TYPE_ID"));
            
            if (groupOut == null || groupOut.equalsIgnoreCase("null")) {
                
                
                groupIds.add(mynewid);
                
                
                String imageName = typedata[2] + ".png";
                
                data += " showPointAddressbayGroup(" + LATITUDE + "," + LONGITUDE + ",\"" + mynewid + "\" ,\"" + imageName + "\",\"" + i_setting[6] + "\",\"" + i_setting[7] + "\",map,\"" + rs.getString("name") + "\",\"" + i_setting[9] + "\",\"" + i_setting[8] + "\",\"" + myid[1] + "\"," + num + ");";
                
            }
            
            
            
            
            
        }
        
        db.closeCon();
        
        
        
        
        db.openCon();
        
        ResultSet rs2 = db.getData(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, "*", "NEW_VALUE='" + myid[1] + "' and OBJECT_CLASS='com.acrtek.xact_services.data.bo.BoGroup' and S_PARAMETER='LOCATION' and SCENARIO_ID='" + sid + "'");
        
        
        while (rs2.next()) {
            
            String[] groupData = db.getRowNocon(XMLDataModel.NET_GROUP_TABLENAME, " ID='" + rs2.getString("OBJECT_ID") + "'");
            
            groupIds.add(groupData[0]);
            
            String[] typedata = db.getRowNocon(XMLDataModel.GROUP_TYPE_TABLENAME, "id=" + groupData[5]);
            
            
            String imageName = typedata[2] + ".png";
            
            data += " showPointAddressbayGroup(" + LATITUDE + "," + LONGITUDE + ",\"" + groupData[0] + "\" ,\"" + imageName + "\",\"" + i_setting[6] + "\",\"" + i_setting[7] + "\",map,\"" + groupData[3] + "\",\"" + i_setting[9] + "\",\"" + i_setting[8] + "\",\"" + myid[1] + "\"," + num + ");";
            
            
            
            
        }
        
        db.closeCon();
        
        
        
        
        
        
        
        
        
        
        
        
        return data;
    }
    /**
     * gets the lines connecting the groups in the advanced implementation view
     * @param mod_id
     * @param pro_id
     * @param sid
     * @return
     * @throws SQLException 
     */
    public String getlines(String mod_id, String pro_id, String sid) throws SQLException {
        String[] i_setting = getSetting(pro_id);
        db.openCon();
        String data = "";
        
        xact.viewsClass v = new xact.viewsClass();
        v.group();
        
        db.openCon();
        
        
        data += "   "
                + " "
                + " function domyling(map ,color,width){ "
                + ""
                + " var all_polylinesg  = [];";
        
        for (int i = 0; i < groupIds.size(); i++) {
            
            String groupID = groupIds.get(i);
            
            
            ResultSet rg = db.getData(XMLDataModel.GROUP_CONNECTORS_TABLENAME, "*", "GROUP_ID2='" + groupID + "'");
            
            while (rg.next()) {
                
                
                String[] line = db.getRowNocon(XMLDataModel.LINE_TABLENAME, " NODE_ID1='" + rg.getString("NODE_ID1") + "' and NODE_ID2='" + rg.getString("NODE_ID2") + "'");
                
                
                String myid = XMLDataModel.CONNECTORS_TABLENAME + "/" + line[0] + "/" + sid + "/" + mod_id;
                
                
                data += " var neerg= addNewLineToMap(getmarkerpostion('" + rg.getString("GROUP_ID1") + "', 'lat'),getmarkerpostion('" + rg.getString("GROUP_ID1") + "', 'lng'),"
                        + "getmarkerpostion('" + rg.getString("GROUP_ID2") + "', 'lat'),getmarkerpostion('" + rg.getString("GROUP_ID2") + "', 'lng'),"
                        + "width,map,color,'" + myid + "','y'); "
                        + ""
                        + "  all_polylinesg.push(neerg); ";
                
            }
            
            
            ResultSet rg2 = db.getData(XMLDataModel.GROUP_CONNECTORS_TABLENAME, "*", "GROUP_ID1='" + groupID + "'");
            
            while (rg2.next()) {
                
                String[] line = db.getRowNocon(XMLDataModel.LINE_TABLENAME, " NODE_ID1='" + rg2.getString("NODE_ID1") + "' and NODE_ID2='" + rg2.getString("NODE_ID2") + "'");
                
                
                String myid = XMLDataModel.CONNECTORS_TABLENAME + "/" + line[0] + "/" + sid + "/" + mod_id;
                
                
                data += "  var neerg=  addNewLineToMap(getmarkerpostion('" + rg2.getString("GROUP_ID1") + "', 'lat'),getmarkerpostion('" + rg2.getString("GROUP_ID1") + "', 'lng'),"
                        + " getmarkerpostion('" + rg2.getString("GROUP_ID2") + "', 'lat'),getmarkerpostion('" + rg2.getString("GROUP_ID2") + "', 'lng'),"
                        + " width,map,color,'" + myid + "'); "
                        + " all_polylinesg.push(neerg);   ";
                
            }
            
            
            
            
        }
        
        data += " return all_polylinesg; "
                + "};"
                + " ";
        
        
        db.closeCon();
        
        return data;
        
    }
    /**
     * returns the settings for the implementation view.
     * @param pro_id
     * @return 
     */
    private String[] getSetting(String pro_id) {
        String[] i_setting;
        db.openDBCon(lib.Options.DbInfo.connectionStringDef);
        
        i_setting = db.getRowNocon(XMLDataModel.IMPELEMENTATION_SETTING_TABLENAME, "project=" + pro_id);
        
        if (i_setting[0] == null || i_setting[0].equals("")) {
            
            i_setting = db.getRowNocon(XMLDataModel.IMPELEMENTATION_SETTING_TABLENAME, "allProjects=1");
        }
        
        db.closeCon();
        
        return i_setting;
    }
}
