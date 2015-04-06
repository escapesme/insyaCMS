/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import lib.Options.XMLDataModel;

/**
 *
 * @author ismail
 */
public class scenarios {

    lib.engine.db.operations db = new lib.engine.db.operations();
    
    
    
    /*

    public String getSCENARIOPram(String MODEL_ID, String SCENARIO_ID, String OBJECT_ID, String S_PARAMETER, String OLDVAL, String Type) {
        String retunData = "";
        retunData = OLDVAL;
        String OBJECT_CLASS = lib.tools.Utils.getClassName(Type);

        String wgere = "";

        if (!SCENARIO_ID.equalsIgnoreCase("") && !SCENARIO_ID.equalsIgnoreCase("null") && SCENARIO_ID != null) {

            wgere = "MODEL_ID=" + MODEL_ID + " and SCENARIO_ID=" + SCENARIO_ID + " and OBJECT_ID=" + OBJECT_ID + " and S_PARAMETER='" + S_PARAMETER + "' and OBJECT_CLASS='" + OBJECT_CLASS + "'";



           
            
            String[] retd = db.getRowNocon(XMLDataModel.SCENARIO_PARAMETERS_TABLENAME, wgere);
            /*  if (!retd[6].equals( "") || retd[6] == null ||retd[6].equalsIgnoreCase("")  ||retd[6].equalsIgnoreCase("null") ) {
            retunData = OLDVAL;
            
            } else {
            
            retunData = retd[6];
            
            }
        }



        return wgere;
    }*/
}
