/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.results;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Calendar;
import lib.Options.XMLDataModel;


/**
 *
 * @author ismail
 */
public class advancedProjection {

    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     *
     * @param modin
     * @param scenario_id
     * @return
     * @throws SQLException
     */
    public String Servic_tabel(String modin ,String scenario_id) throws SQLException {
        String returndata = "";
        String serviceTime = "0";
        String scalability = "0";
        returndata = "<table style=\"width:100%;\">"
                + "<thead><th>Name</th><th>Service Time</th>"
                + "<th>Scalability</th>"
                + "<th>Availability</th></thead>";
        String mod_name="";

        db.openCon();
        String[] myID = db.getColumnNOCON(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "id", " MODEL_ID='" + modin + "'");
        String[] myName = db.getColumnNOCON(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "name", " MODEL_ID='" + modin + "'");
        db.closeCon();
        for (int i = 0; i < myName.length; i++) {


            db.openCon();
        double act = get_Childrens2(myID[i]);
            Calendar cal = Calendar.getInstance();
            double da = cal.DAY_OF_MONTH * 24 * 60 * 60;
            String all = Double.toString((da / act) * 100);
            if(Double.isInfinite(Double.parseDouble(all))||Double.isNaN(Double.parseDouble(all)))
                all="100";
            db.closeCon();

           
            
            if (!scenario_id.equalsIgnoreCase("0")) {

                mod_name = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "ID=" + scenario_id)[3];


            } else {

                mod_name = db.getRow(XMLDataModel.MODEL_TABLENAME, "id=" + modin)[4];



            } 
            

            db.openConres();
            
            
             
         

            
            
            
            
            String data[] = db.getRowNocon(XMLDataModel.NEW_BP_THROUGHPUT_RESULTS_TABLENAME, "TPR_KEY like'%" + myID[i].trim() + "%' and MOD_NAME ='"+mod_name.trim()+"_0'");
            String data2[] = db.getRowNocon( XMLDataModel.SP_RESULTS_TABLENAME  , "SP_ID like '%" + myID[i].trim() + "%' and NAME ='"+mod_name.trim()+"_0'");;
if(data2[9]!=null){
    serviceTime=data2[9];
}
if(data[8]!=null){
    scalability=data[8];
}
          returndata += "<tr><td>" + myName[i] + "</td><td>" +roundTwoDecimals(Double.parseDouble( serviceTime)) + "</td><td>" + roundTwoDecimals(Double.parseDouble( scalability)) + "</td><td>" +all+ "</td></tr>";
db.closeCon();  
        }
              
       
        

        returndata += "</table>";

   


        return returndata;


    }
    
    double roundTwoDecimals(double d) {
            DecimalFormat twoDForm = new DecimalFormat("#.#####");
        return Double.valueOf(twoDForm.format(d));
}

    double get_Childrens2(String parentID) throws java.sql.SQLException {
        String returnData = "";
        double du = 0;



        String myfrom = "((`"+XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME+"` inner join `"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"` on(`"+XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME+"`.`CHILD_ID` = `"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`ID`)) join `"+XMLDataModel.SERVICE_LINK_TABLENAME+"` on(`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`ID` = "+XMLDataModel.SERVICE_LINK_TABLENAME+".`FROM_ID` or `"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`ID` = "+XMLDataModel.SERVICE_LINK_TABLENAME+".`TO_ID`))";
        String mywhere = "`"+XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME+"`.`PARENT_ID`='" + parentID + "'  and `"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`TAG`=\"activity\"  ";
        String myGet = ""+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+".ID AS `nodes_ID`,"
                + "`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`Name` AS `Name`,"
                + "`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`TAG` AS `TAG`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`ID`AS `link_ID1`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`FROM_ID` AS `FROM_ID`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`PARENT_ID` AS `PARENT_ID`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`TO_ID` AS `TO_ID`,"
     
                
                
                + "`"+XMLDataModel.SERVICE_PROCESS_CHILDREN_TABLENAME+"`.`PARENT_ID` AS `PID`";
        ResultSet rs = db.getData(myfrom, myGet, mywhere);




        



        return du;

    }

   
}
