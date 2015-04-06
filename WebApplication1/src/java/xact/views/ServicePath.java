/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.views;

import java.sql.SQLException;
import java.util.ArrayList;
import lib.Options.XMLDataModel;
import lib.tools.Utils;

/**
 *
 * @author ismail
 */
public class ServicePath {

    lib.engine.db.operations db = new lib.engine.db.operations();
    public String test="";
/**
 * Checks if all nodes passed in the array are on the same level of hierarchy.
 * @param ids collective ids of the selected nodes for the path
 * @return boolean value shows if the nodes in the same path or not.
 */
    public boolean isAllSameLevel(String[] ids) {
        boolean returnData = true;

        String prevLevel = "";
        String prevParent = "";

        for (String id : ids) {

            if (!id.equals("")) {
                String[] idData = id.split("/");

                String currentid = idData[1];
                String modelId = idData[3];
                String[] row = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + currentid + " AND MODEL_ID=" + modelId);

                String currentLevel = row[15];
                String currentParent = row[3];
                String cuurentTag=row[1];
                test+=currentLevel+"::"+currentParent+"::"+currentid+"<br>";

                if (prevLevel.equals("")) {
                    prevLevel = currentLevel;
                }
                if (prevParent.equals("")) {
                    prevParent = currentParent;
                }
                //start, end and service nodes always have level value of one. So they are excluded from that check
                if(cuurentTag.equalsIgnoreCase("start")||cuurentTag.equalsIgnoreCase("end")||cuurentTag.equalsIgnoreCase("service")){
                     if (!prevParent.equals(currentParent)) {

                    returnData = false;

                }
                }
                else
                if (!prevLevel.equals(currentLevel) || !prevParent.equals(currentParent)) {

                    returnData = false;

                }


            }
        }




        return returnData;



    }
/**
 * Checks if the nodes form a path with each other.
 * <br>This is done by getting both the node's right and left neighbors and check if any of them are in the nodes in the path.
 * @param ids
 * @return boolean value if the nodes are connected together or not
 * @throws SQLException 
 */
    public boolean isAllConnected(String[] ids) throws SQLException {
        boolean returnData = true;



        ArrayList<String> jIds = new ArrayList<String>();

        for (String id : ids) {
            if (!id.equals("")) {
                String[] idData = id.split("/");

                jIds.add(idData[1]);
            }

        }
        for (String id : ids) {
          if (!id.equals("")) {
                
                String[] idData = id.split("/");


                if (!jIds.contains(Utils.previousNode(idData[1])) &&
                        !jIds.contains(Utils.nextNode(idData[1]))) {


                    returnData = false;
                }

               
            }
        }

        return returnData;



    }
    /**
     * prepares the list of the ids to be saved in the database
     * @param ids
     * @return a string contains all the ids of the nodes in the path separated by "__"
     */
    public String createPath(String[]ids){
        String out="";
         for (String id : ids) {

            if (!id.equals("")) {
                String[] idData = id.split("/");

                String currentid = idData[1];
                out+=currentid+"__";
            }}
        return out;
    }
}
