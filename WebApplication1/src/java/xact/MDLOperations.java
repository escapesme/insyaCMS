/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

/**
 *
 * @author A7med
 */
public class MDLOperations {

    public String importMDL(java.lang.String proId, java.lang.String modelId, java.lang.String nodeId, java.lang.String modelFile) {
        xact.mdl.MDLImport_Service service = new xact.mdl.MDLImport_Service();
        xact.mdl.MDLImport port = service.getMDLImportPort();
        return port.importMDL(proId, modelId, nodeId,modelFile);
    }

    public static String exportModel(java.lang.String file, java.lang.String modelId) {
        model.operations.ModelOperations_Service service = new model.operations.ModelOperations_Service();
        model.operations.ModelOperations port = service.getModelOperationsPort();
        return port.exportModel(file, modelId);
    }

    public static String importModel(java.lang.String file, java.lang.String userName) {
        model.operations.ModelOperations_Service service = new model.operations.ModelOperations_Service();
        model.operations.ModelOperations port = service.getModelOperationsPort();
        return port.importModel(file, userName);
    }
    public  String removeServer(java.lang.String proID, java.lang.String modelId, java.lang.String nodeId) {
        xact.mdl.MDLImport_Service service = new xact.mdl.MDLImport_Service();
        xact.mdl.MDLImport port = service.getMDLImportPort();
        return port.removeServer(proID, modelId, nodeId);
    }

    public static String buildFromDB(java.lang.String proID, java.lang.String modelId, java.lang.String nodeId) {
        xact.mdl.MDLImport_Service service = new xact.mdl.MDLImport_Service();
        xact.mdl.MDLImport port = service.getMDLImportPort();
        return port.buildFromDB(proID, modelId, nodeId);
    }
/***
 * 
 * @param resultID
 * @return 
 */
    public static String buildCase(java.lang.String resultID) {
        xact.mdl.MDLImport_Service service = new xact.mdl.MDLImport_Service();
        xact.mdl.MDLImport port = service.getMDLImportPort();
        return port.buildCase(resultID);
    }
    
    
}
