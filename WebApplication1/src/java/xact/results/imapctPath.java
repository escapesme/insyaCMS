/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.results;

import java.sql.ResultSet;
import java.sql.SQLException;
import lib.Options.XMLDataModel;
import xact.utils;

/**
 *
 * @author ismail
 */
public class imapctPath {

    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     *
     * @param parentID
     * @return
     * @throws SQLException
     */
    public String get_Childrens3(String parentID) throws java.sql.SQLException {
        
        
        db.openCon();
        String returnData = "";
        ResultSet ch = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + parentID);
        returnData += "<ul>";
        while (ch.next()) {
            if (!ch.getString("Name").equalsIgnoreCase("Start") && !ch.getString("Name").equalsIgnoreCase("End") && !ch.getString("Name").equalsIgnoreCase("service") && !ch.getString("Name").equalsIgnoreCase("insertion") && !ch.getString("Name").equalsIgnoreCase("collector") && !ch.getString("Name").equalsIgnoreCase("activtiy")
                    && !(ch.getString("Name").equalsIgnoreCase("task") && ch.getString("type").equalsIgnoreCase("preperation"))) {


                returnData += "<li> <input class=\"n_id\" type=\"checkbox\" name=\"team\" value=\"" + ch.getString("ID") + "\"/>   " + "<div class=\"mytitle\">" + ch.getString("Name") + "</div>";
                returnData += get_Childrens(ch.getString("ID"));
                returnData += "</li>";
            }
        }
        returnData += "</ul>";
        return returnData;
        
        
        
        


    }
    xact.viewsClass v = new xact.viewsClass();

    String get_Childrens(String parentID) throws java.sql.SQLException {
        String returnData = "";
        v.impactpathView(parentID);
        ResultSet ch = db.getData(XMLDataModel.SERVICE_DATA_VIEW, "distinct (NAME),nodes_ID ", "1=1 group by `nodes_ID` ");
        returnData += "<ul>";
        while (ch.next()) {
            if (!ch.getString("Name").equalsIgnoreCase("Start") && !ch.getString("Name").equalsIgnoreCase("End") && !ch.getString("Name").equalsIgnoreCase("service") && !ch.getString("Name").equalsIgnoreCase("insertion") && !ch.getString("Name").equalsIgnoreCase("collector") && !ch.getString("Name").equalsIgnoreCase("activtiy")
                    && !(ch.getString("Name").equalsIgnoreCase("task") && ch.getString("type").equalsIgnoreCase("preperation"))) {
                returnData += "<li> <input class=\"n_id\" type=\"checkbox\" name=\"team\" value=\"" + ch.getString("nodes_ID") + "\"/>   " + "<div class=\"mytitle\">" + ch.getString("Name") + "</div>";
                returnData += get_Childrens(ch.getString("nodes_ID"));
                returnData += "</li>";
            }
        }
        returnData += "</ul>";
        return returnData;
    }
    String ndata = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

    /**
     *
     * @param parentID
     * @param id
     * @return
     * @throws SQLException
     */
    public String get_Childrens3option(String parentID, String id) throws java.sql.SQLException {



        String returnData = "";

        java.sql.Connection mycon2 = db.openDBConNewcon("");
        ResultSet ch = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + parentID, mycon2);


        while (ch.next()) {
            ndata = "";

            if (!ch.getString("TAG").equalsIgnoreCase("Start")
                    && !ch.getString("TAG").equalsIgnoreCase("End")
                    && !ch.getString("TAG").equalsIgnoreCase("service")
                    && !ch.getString("TAG").equalsIgnoreCase("insertion")
                    && !ch.getString("TAG").equalsIgnoreCase("collector")
                    && !ch.getString("TAG").equalsIgnoreCase("activity")
                    && !(ch.getString("TAG").equalsIgnoreCase("task") && ch.getString("TAG").equalsIgnoreCase("preperation"))) {
                String status = "";
                if (ch.getString("id").equalsIgnoreCase(id)) {
                    status = "selected=\"selected\"";


                } else {
                    status = "";
                }

 
                returnData += "<option "+status+" value=\"" + ch.getString("id") + "\">&nbsp;&nbsp;&nbsp;" + ch.getString("Name") + "</option>";
 
                returnData += get_Childrens_option(ch.getString("ID"),id);
                ndata = "";
            }
        }

        db.closeConNewcon(mycon2);
        //returnData += "<option class=\"mytitle\">" + parentID + "</option>";
        return returnData;


    }

    /**
     *
     * @param parentID
     * @param id
     * @param modId
     * @param sid
     * @return
     * @throws SQLException
     */
    public String get_Childrens3option(String parentID, String id,String modId,String sid) throws java.sql.SQLException {

utils u = new utils();

        String returnData = "";

        java.sql.Connection mycon2 = db.openDBConNewcon("");
        ResultSet ch = db.getDataNeWcon(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + parentID, mycon2);


        while (ch.next()) {
            ndata = "";

            if (!ch.getString("TAG").equalsIgnoreCase("Start")
                    && !ch.getString("TAG").equalsIgnoreCase("End")
                    && !ch.getString("TAG").equalsIgnoreCase("service")
                    && !ch.getString("TAG").equalsIgnoreCase("insertion")
                    && !ch.getString("TAG").equalsIgnoreCase("collector")
                    && !ch.getString("TAG").equalsIgnoreCase("activity")
                    && !(ch.getString("TAG").equalsIgnoreCase("task") && ch.getString("TAG").equalsIgnoreCase("preperation"))) {
                String status = "";
                if (ch.getString("id").equalsIgnoreCase(id)) {
                    status = "selected=\"selected\"";


                } else {
                    status = "";
                }

 if (u.getISScenarioPram(modId, sid, ch.getString("id"), "ACTIVE_STATUS").equals("-1")) {
                returnData += "<option "+status+" value=\"" + ch.getString("id") + "\">&nbsp;&nbsp;&nbsp;" + ch.getString("Name") + "</option>";
 }
                returnData += get_Childrens_option(ch.getString("ID"),id);
                ndata = "";
            }
        }

        db.closeConNewcon(mycon2);
        //returnData += "<option class=\"mytitle\">" + parentID + "</option>";
        return returnData;


    }      
            

    String get_Childrens_option(String parentID,String id) throws java.sql.SQLException {




        String returnData = "";

        v.impactpathView(parentID);
        java.sql.Connection mycon = db.openDBConNewcon("");

        ResultSet ch = db.getDataNeWcon(XMLDataModel.SERVICE_DATA_VIEW, "distinct (NAME),nodes_ID ", "1=1 group by `nodes_ID` ", mycon);



        ndata += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;";
        while (ch.next()) {
            if (!ch.getString("TAG").equalsIgnoreCase("Start")
                    && !ch.getString("TAG").equalsIgnoreCase("End")
                    && !ch.getString("TAG").equalsIgnoreCase("service")
                    && !ch.getString("TAG").equalsIgnoreCase("insertion")
                    && !ch.getString("TAG").equalsIgnoreCase("collector")
                    && !ch.getString("TAG").equalsIgnoreCase("activity")
                    && !(ch.getString("TAG").equalsIgnoreCase("task") && ch.getString("TAG").equalsIgnoreCase("preperation"))) {


                
                String status = "";
                if (ch.getString("nodes_ID").equalsIgnoreCase(id)) {
                    status = "selected=\"selected\"";


                } else {
                    status = "";
                }
                
                returnData += "<option "+status+" value=\"" + ch.getString("nodes_ID") + "\">" + ndata + ch.getString("Name") + "</option>";
                returnData += get_Childrens_option(ch.getString("nodes_ID"),id);
                ndata = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;";

            }
        }



        // }

        db.closeConNewcon(mycon);
        return returnData;

    }
}