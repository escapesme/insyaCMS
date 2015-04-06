/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.drawing;

import lib.Options.XMLDataModel;

/**
 *
 * @author ismail
 */
public class mxgraph {

    lib.engine.db.operations db = new lib.engine.db.operations();

    public String returnStyle(String Type, String returnStyle) {

        String returnData = "";
        String sty[] = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "'");

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

    public String returnStyle(String Type, String returnStyle, String pro_id) {

        String returnData = "";
        String sty[];


        sty = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "' and project=" + pro_id);
        if (sty[0] == null || sty[0].equals("")) {
            sty = db.getRow(XMLDataModel.STYLES_TABLENAME, "TYPE='" + Type + "' and allProjects=1");
        }



        returnData = " \n var " + returnStyle + "=null; "
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
                + "\"images/" + sty[20] + "\" );\n";

        return returnData;
    }
}
