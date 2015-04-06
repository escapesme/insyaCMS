/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tools;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import lib.Options.XMLDataModel;

/**
 *
 * @author ismail
 */
public class MXGraphUtils {

    lib.engine.db.operations db = new lib.engine.db.operations();

    public String returnStyle(String Type, String returnStyle, String pro_id) {

        String returnData = "";
        String sty[];

        sty = db.getRow(XMLDataModel.STYLES_TABLENAME,
                "TYPE='" + Type + "' and project=" + pro_id);
        if (sty[0] == null || sty[0].equals("")) {
            sty = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "' and allProjects=1");
        }

        returnData = " var " + returnStyle + "=null; "
                + returnStyle + "=makstyle("
                + "\"#" + sty[3] + "\","
                + "\"#" + sty[4] + "\","
                + "\"#" + sty[5] + "\","
                + "\"#" + sty[6] + "\","
                + "\"" + sty[7] + "\","
                + "\"" + sty[8] + "\","
                + "\"" + sty[9] + "\","
                + "\"" + sty[10] + "\","
                + "\"" + sty[11] + "\","
                + "\"" + sty[12] + "\","
                + "\"" + sty[14] + "\","
                + "" + sty[18] + ","
                + "\"" + sty[19] + "\","
                + "\"" + sty[17] + "\","
                + "\"images/" + sty[20] + "\" );";

        return returnData;
    }

    public String returnStyle(String Type, String returnStyle, String pro_id, String gradient, String fill) {

        String returnData = "";
        String sty[];

        sty = db.getRow(XMLDataModel.STYLES_TABLENAME,
                "TYPE='" + Type + "' and project=" + pro_id);
        if (sty[0] == null || sty[0].equals("")) {
            sty = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "' and allProjects=1");
        }

        returnData = " var " + returnStyle + "=null; "
                + returnStyle + "=makstyle("
                + "\"#" + gradient + "\","
                + "\"#" + fill + "\","
                + "\"#" + fill + "\","
                + "\"#" + sty[6] + "\","
                + "\"" + sty[7] + "\","
                + "\"" + sty[8] + "\","
                + "\"" + sty[9] + "\","
                + "\"" + sty[10] + "\","
                + "\"" + sty[11] + "\","
                + "\"" + sty[12] + "\","
                + "\"" + sty[14] + "\","
                + "" + sty[18] + ","
                + "\"" + sty[19] + "\","
                + "\"" + sty[17] + "\","
                + "\"images/" + sty[20] + "\" );";

        return returnData;
    }

    public Object[] getStyle(String Type, String retunrVar, String pro_id) {

        ArrayList<String> arr = new ArrayList<String>();
        arr.add(this.returnStyle(Type, retunrVar, pro_id));
        String stypp2[]=null;
        stypp2 = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "'");
        
        if(stypp2[0]==null){
            System.out.println("style="+stypp2[0]);
            stypp2 =null;
             stypp2 = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='be_default'");
             System.out.println("2ndstyle="+stypp2[0]);
        }
        arr.addAll(Arrays.asList(stypp2));

        return arr.toArray();

    }

    public Object[] getStyle(String Type, String retunrVar, String pro_id, String gradient, String fill) {

        ArrayList<String> arr = new ArrayList<String>();
        arr.add(this.returnStyle(Type, retunrVar, pro_id, gradient, fill));
        String stypp2[] = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "'");
        arr.addAll(Arrays.asList(stypp2));

        return arr.toArray();

    }

    public String returnStyletext(String Type, String returnStyle, String pro_id) {

        String returnData = "";
        String sty[];

        
        
        
        sty = db.getRow(XMLDataModel.STYLES_TABLENAME,
                "TYPE='" + Type + "' and project=" + pro_id);
        if (sty[0] == null || sty[0].equals("")) {
            sty = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "' and allProjects=1");
        }

        returnData = " var " + returnStyle + "=null; "
                + returnStyle + "=makstyletext("
                + "\"#" + sty[3] + "\","
                + "\"#" + sty[4] + "\","
                + "\"#" + sty[5] + "\","
                + "\"#" + sty[6] + "\","
                + "\"" + sty[7] + "\","
                + "\"" + sty[8] + "\","
                + "\"" + sty[9] + "\","
                + "\"" + sty[10] + "\","
                + "\"" + sty[11] + "\","
                + "\"" + sty[12] + "\","
                + "\"" + sty[14] + "\","
                + "\"" + sty[18] + "\","
                + "\"" + sty[19] + "\","
                + "\"" + sty[17] + "\","
                + "\"images/" + sty[20] + "\" );";

        return returnData;
    }

    public HashMap<String, String> returnStyleToMap(String Type,  String pro_id) {

        HashMap<String, String> m = db.getRowToMap(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "' and project=" + pro_id);

        if (m.get("id") == null || m.get("id").equals("")) {
            m = db.getRowToMap(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "' and allProjects=1");
        }
        return m;

    }

    public Object[] getStyletext(String Type, String retunrVar, String pro_id) {

        ArrayList<String> arr = new ArrayList<String>();
        arr.add(this.returnStyletext(Type, retunrVar, pro_id));

        String stypp2[] = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "'");

        arr.addAll(Arrays.asList(stypp2));

        return arr.toArray();

    }

}
