/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package xact;

import com.sun.faces.util.CollectionsUtils;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;
import lib.tools.Utils;

/**
 *
 * @author empcl_000
 */
public class BusinessProcessManager {
    lib.engine.db.operations db = new lib.engine.db.operations();
    public HashMap<String,String>getBPList(String modelId){
        HashMap<String,String> list=new CollectionsUtils.ConstMap<String,String>();
        db.openCon();
        ResultSet rs=db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID="+modelId);
        try {
            while(rs.next()){
                list.put(rs.getString("ID"), rs.getString("NAME"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BusinessProcessManager.class.getName()).log(Level.SEVERE, null, ex);
        }    db.closeCon();
        return list;
        
        
        
        
        
        
        
        
    }
    public String getRate(String businessId,String modelId,String scenarioId){
        double rate=0;
        ArrivalRateCalculator arc=new ArrivalRateCalculator();
        BigDecimal value=BigDecimal.ZERO;
        String data="";
        try {
          value=value.add(arc.compCAR(businessId, modelId, "be_bp", scenarioId));
           
          data=Utils.getScenarioPram(modelId, scenarioId, businessId, "ARRIVAL_RATE", ""+value, "com.acrtek.xact_services.data.bo.BoBusinessProcess");
         
        } catch (SQLException ex) {
            Logger.getLogger(BusinessProcessManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        rate=value.doubleValue();
        return data;
    }
    public String getOriginalRate(String businessId,String modelId,String scenarioId){
        double rate=0;
        ArrivalRateCalculator arc=new ArrivalRateCalculator();
        BigDecimal value=BigDecimal.ZERO;
        
        try {
          value=value.add(arc.compCAR(businessId, modelId, "be_bp", scenarioId));
          
        } catch (SQLException ex) {
            Logger.getLogger(BusinessProcessManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        rate=value.doubleValue();
        return ""+value;
    }
}
