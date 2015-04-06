/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import lib.Options.XMLDataModel;

/**
 *
 * @author A7med
 */
public class DeleteModel {

    private static final lib.engine.db.operations db = new lib.engine.db.operations();
    public static String delete(java.lang.String modelID) {
        delete.DeleteModel_Service service = new delete.DeleteModel_Service();
        delete.DeleteModel port = service.getDeleteModelPort();
        return port.delete(modelID);
    }
    public static String deleteProject(String projId){
            StringBuilder output=new StringBuilder();
            List<String> modelsList=new ArrayList<>();
            db.openCon();
        try {
        
            ResultSet models=db.getData(XMLDataModel.PMXREF_TABLENAME, "*", "pid="+projId);
            while(models.next()){
                modelsList.add(models.getString("mid"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DeleteModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.closeCon();
        for(String mid:modelsList){
            output.append("Model with id=").append(mid).append("results:").append(delete(mid)).append("/n");
        }
        db.setDelete(XMLDataModel.PROJECT_TABLENAME, "pid="+projId);
        return output.toString();
    }
    
       
}
