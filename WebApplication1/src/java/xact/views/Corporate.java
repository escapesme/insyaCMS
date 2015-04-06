/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package xact.views;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import lib.Options.XMLDataModel;
import lib.tools.test;
import xact.utils;

/**
 *
 * @author ismail
 */
public class Corporate {

    lib.engine.db.operations db = new lib.engine.db.operations();
    lib.tools.MXGraphUtils mxutil = new lib.tools.MXGraphUtils();
    xact.drawing.mxgraph mx = new xact.drawing.mxgraph();
    xact.scenarios sce = new xact.scenarios();
    ArrayList<String> cot = new ArrayList<String>();
    ArrayList<String> cotother = new ArrayList<String>();
    ArrayList<String> cot2 = new ArrayList<String>();
    ArrayList<String> cot3 = new ArrayList<String>();
    public String testOut = "";

    ArrayList<String> cototherb = new ArrayList<String>();

    public String leveb(String id, String mod_id, String mode, String pro_id, String SCENARIOID, Connection mycoo, HttpServletRequest rq) throws SQLException {
        String returndata = "";

        ResultSet rs = db.getDataNeWcon(XMLDataModel.BE_BP_TABLENAME, "*", "MODEL_ID=" + mod_id + " and BE_FROM_ID=" + id, mycoo);

        // Object[] stypp = mxutil.getStyle("business_process", "mystyle227", pro_id);
        int myint = 0;
        utils u = new utils();
        while (rs.next()) {

            myint++;
            String bn22[] = db.getRowNewCon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "MODEL_ID=" + mod_id + " and ID=" + rs.getString("BP_TO_ID"), mycoo);

            //    if (!SCENARIOID.equals("") && SCENARIOID != null) {
            Object[] stypp = null;
            stypp = mxutil.getStyle("business_process", "mystyle227", pro_id);

            if (!SCENARIOID.equals("") && SCENARIOID != null) {

                String[] sedata = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "ID='" + SCENARIOID.trim() + "' ");

                if (sedata[7].equals("6")) {

                    if (!u.getISScenarioPram(mod_id, sedata[0], bn22[0], "ACTIVE_STATUS").equalsIgnoreCase("-1")) {

                        stypp = mxutil.getStyle("business_process", "mystyle227", pro_id, "0a1657", "CFCFCF");
                    }
                }
            }

            if (!cot.contains(bn22[0]) && bn22[0] != null) {
                cot.add(bn22[0]);
                test.addMessage("corporate,be to bp", "C-be2bp", "Creating BE TO BP Node", "BE to BP Node:" + bn22[3] + "(" + bn22[0] + ") created", XMLDataModel.successClass);

                returndata += stypp[0] + "  AllIDs.push('" + bn22[0] + "'); "
                        + "  var l_bp" + bn22[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_PROCESS_TABLENAME + "/" + bn22[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn22[3].replace(" ", "<br/>") + "\",0,40,\"" + stypp[16] + "\"," + stypp[17] + ",mystyle227);";

                double num = 0;

                if (!rs.getString("UTILIZATION_FREQUENCY").equals("") && rs.getString("UTILIZATION_FREQUENCY") != null) {

                    num = Math.round(Double.parseDouble(lib.tools.Utils.getScenarioPram(mod_id, SCENARIOID, rs.getString("id"), "UTILIZATION_FREQUENCY", rs.getString("BP_TO_ID"), XMLDataModel.BE_BP_TABLENAME)) * 100);
                }
                returndata += "   var ed_" + myint + " = creatE(corporateGraph ,l_" + id + " ,l_bp" + rs.getString("BP_TO_ID") + ",\"" + rs.getString("UTILIZATION_FREQUENCY") + "%\",\"" + mode + "\",\"BE_BP/" + rs.getString("id") + "/" + SCENARIOID + "/" + mod_id + "\");\n";
            }

        }

        return returndata;
    }

    public String getOther(String id, String mod_id, String mode, String pro_id, String SCENARIOID, Connection mycoo, HttpServletRequest rq) throws SQLException {
        String returndata = "";
        returndata += otherleve(id, mod_id, mode, pro_id, SCENARIOID, rq, mycoo);

        returndata += levebOther(id, mod_id, mode, pro_id, SCENARIOID, mycoo, rq);
        return returndata;

    }

    public String addOther(String mod_id, String SCENARIOID, String pro_id) throws SQLException {
        String returndata = "";
        db.openCon();

        int num = 0;
        ResultSet rs222 = db.getData(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "", "MODEL_ID=" + mod_id + "");
        returndata += "var mynum=0; var newIDS=[]; ";

        ArrayList<String> aids = new ArrayList<String>();
        while (rs222.next()) {

            num++;

            int y = 50 * num;

            String bn[] = db.getRowNocon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "ID=" + rs222.getString("ID"));

            if (bn[5].equalsIgnoreCase("Line of Business") && !bn[4].equals("-1")) {
                Object[] sty = mxutil.getStyle("lobm", "mystykl", pro_id);
                returndata += sty[0] + "\n if(AllIDs.indexOf('" + bn[0] + "')==-1){  "
                        + "mynum++;  "
                        + " newIDS.push('" + bn[0] + "');"
                        + "var l_" + bn[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bn[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn[3] + "\",mynum*50,50," + sty[16] + "," + sty[17] + ",mystykl); }\n";

            } else {
                Object[] sty = mxutil.getStyle(bn[5], "mystykl", pro_id);
                returndata += sty[0] + "\n  if(AllIDs.indexOf('" + bn[0] + "')==-1){  "
                        + " mynum++;"
                        + " newIDS.push('" + bn[0] + "');"
                        + " var l_" + bn[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bn[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn[3] + "\",mynum*50,50," + sty[16] + "," + sty[17] + ",mystykl); }\n";

            }

            aids.add(bn[0]);

        }

        ResultSet rs2 = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "", "MODEL_ID=" + mod_id + "");

        Object[] stypp = mxutil.getStyle("business_process", "mystyle227", pro_id);
        while (rs2.next()) {
            num++;

            int y = 50 * num;
            String bn22[] = db.getRowNocon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "ID=" + rs2.getString("ID"));

            aids.add(bn22[0]);
            if (bn22[0] != null) {

                test.addMessage("corporate,be to bp", "C-be2bp", "Creating BE TO BP Node", "BE to BP Node:" + bn22[3] + "(" + bn22[0] + ") created", XMLDataModel.successClass);
                returndata += stypp[0] + " if (AllIDs.indexOf('" + bn22[0] + "')==-1){ "
                        + " newIDS.push('" + bn22[0] + "');"
                        + " mynum++;  var l_" + bn22[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_PROCESS_TABLENAME + "/" + bn22[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn22[3].replace(" ", "<br/>") + "\",mynum*50,mynum*50,\"" + stypp[16] + "\"," + stypp[17] + ",mystyle227);}";

            }
        }

        db.closeCon();

        db.openCon();

        int myi = 0;

        for (int i = 0; i < aids.size(); i++) {

            //  String[] s_setting = db.getRowNocon(XMLDataModel.CORPORATE_SETTING_TABLENAME, 1);
            double num22 = 0;
            ResultSet rs = db.getData(XMLDataModel.BE_BE_TABLENAME, "*", "MODEL_ID=" + mod_id + " and  BE_FROM_ID=" + aids.get(i));
            while (rs.next()) {

                /*   if (rs.getString("UTILIZATION_FREQUENCY") != null && !rs.getString("UTILIZATION_FREQUENCY").equals("")) {
                 num22 = Math.round(Double.parseDouble(lib.tools.Utils.getScenarioPram(mod_id, SCENARIOID, rs.getString("ID"), "UTILIZATION_FREQUENCY", rs.getString("UTILIZATION_FREQUENCY"), XMLDataModel.CORPORATE_BE_TABLENAME)) * 100);
                 }*/
                returndata += "if (newIDS.indexOf('" + rs.getString("BE_TO_ID") + "')!=-1){ "
                        + "  var ed_" + myi + " = creatE(corporateGraph ,l_" + rs.getString("BE_FROM_ID") + ",l_" + rs.getString("BE_TO_ID") + ",\"" + rs.getString("UTILIZATION_FREQUENCY") + "%\",\"\",\"BE_BP/" + rs.getString("id") + "/" + SCENARIOID + "/" + mod_id + "\");"
                        + " corporateGraph.updateCellSize(l_" + rs.getString("BE_TO_ID") + ");"
                        + "}\n";

            }

        }

        db.closeCon();

        db.openCon();

        for (int i = 0; i < aids.size(); i++) {
            double num22 = 0;
            ResultSet rs = db.getData(XMLDataModel.BE_BP_TABLENAME, "*", "MODEL_ID=" + mod_id + " and  BE_FROM_ID=" + aids.get(i));
            while (rs.next()) {

                if (aids.contains(rs.getString("BP_TO_ID"))) {

                    returndata
                            += "  if (newIDS.indexOf('" + rs.getString("BP_TO_ID") + "')!=-1){ "
                            + "  var ed_" + myi + " = creatE(corporateGraph ,l_" + rs.getString("BE_FROM_ID") + " ,l_" + rs.getString("BP_TO_ID") + ",\"" + num22 + "%\",\"\",\"" + XMLDataModel.CORPORATE_BE_TABLENAME + "/" + rs.getString("id") + "/" + SCENARIOID + "/" + mod_id + "\");"
                            + " corporateGraph.updateCellSize(l_" + rs.getString("BP_TO_ID") + ");"
                            + ""
                            + ""
                            + ""
                            + " var layout = new mxHierarchicalLayout(corporateGraph);\n"
                            + "            layout.execute(corporateGraph.getDefaultParent());"
                            + "}\n";

                }
            }

        }

        db.closeCon();

        return returndata;

    }

    public String leve(String id, String mod_id, String mode, String pro_id, String SCENARIOID, HttpServletRequest rq, Connection coo) throws SQLException {
///
        String returndata = "";
        if (!cot3.contains(id)) {
            cot3.add(id);

            ResultSet rs55 = db.getDataNeWcon(XMLDataModel.BE_BE_TABLENAME, "*", "MODEL_ID=" + mod_id + " and BE_FROM_ID=" + id, coo);
            int rowc = db.getRowCountNewcon(XMLDataModel.BE_BE_TABLENAME, "MODEL_ID=" + mod_id + " and BE_FROM_ID=" + id, coo);

            // returndata += "alert(\"" + rowc + "\");";
            if (rowc > 0) {

                int myint = 0;

                while (rs55.next()) {

                    String bn[] = db.getRowNewCon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "MODEL_ID=" + mod_id + " and ID=" + rs55.getString("BE_TO_ID"), coo);

                    int rowc2 = db.getRowCountNewcon(XMLDataModel.BE_BE_TABLENAME, "MODEL_ID=" + mod_id + " and BE_FROM_ID=" + bn[0], coo);

                    double num = 0;

                    if (bn[0] != null) {

                        if (!cot2.contains(bn[0])) {
                            cot2.add(bn[0]);
                            myint++;
                            if (!rs55.getString("UTILIZATION_FREQUENCY").equals("") && rs55.getString("UTILIZATION_FREQUENCY") != null) {
                                // num =  Math.round(Double.parseDouble(lib.tools.Utils.getScenarioPram(mod_id, SCENARIOID, rs.getString("id"), "UTILIZATION_FREQUENCY", rs.getString("BP_TO_ID"), XMLDataModel.BE_BP_TABLENAME)) * 100);
                            }

                            if (bn[4].equals("-1")) {
                                Object[] sty = mxutil.getStyle("lobm", "mystykl", pro_id);
                                returndata += sty[0] + "\n AllIDs.push('" + bn[0] + "');  var l_" + bn[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bn[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn[3] + "\",0,0," + sty[16] + "," + sty[17] + ",mystykl);\n";

                            } else {
                                Object[] sty = mxutil.getStyle("Business Function", "mystyle227", pro_id);

                                returndata += sty[0] + "\n AllIDs.push('" + bn[0] + "');   var l_" + bn[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bn[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn[3] + "\",0,0," + sty[16] + "," + sty[17] + ",mystyle227);\n";
                            }
                            lib.tools.test.addMessage("corporate,be to be", "C-be2be", "Creating BE TO BE Node", "BE to BE Node:" + bn[3] + "(" + bn[0] + ")  created", XMLDataModel.successClass);

                        }

                        returndata += "var ed_" + myint + " = creatE(corporateGraph ,l_" + id + " ,l_" + rs55.getString("BE_TO_ID") + ",\"" + num + "%\",\"" + mode + "\",\"be_be/" + rs55.getString("id") + "/" + SCENARIOID + "/" + mod_id + "\"); "
                                + "corporateGraph.updateCellSize(l_" + rs55.getString("BE_TO_ID") + ");\n";
                        if (rowc2 > 0) {
                            returndata += leve(bn[0], mod_id, mode, pro_id, SCENARIOID, rq, coo);
                            returndata += leveb(bn[0], mod_id, mode, pro_id, SCENARIOID, coo, rq);
                        } else {
                            returndata += leveb(bn[0], mod_id, mode, pro_id, SCENARIOID, coo, rq);
                        }
                    }

                }

            } else {
                returndata += leveb(id, mod_id, mode, pro_id, SCENARIOID, coo, rq);
            }
        }

        return returndata;
    }

    public String otherleve(String id, String mod_id, String mode, String pro_id, String SCENARIOID, HttpServletRequest rq, Connection coo) throws SQLException {

        String returndata = "";
        //if (!cot3.contains(id)) {
        //cot3.add(id);

        ResultSet rs55 = db.getDataNeWcon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "*", "MODEL_ID=" + mod_id, coo);

        int myint = 0;

        while (rs55.next()) {

            String bn[] = db.getRowNewCon(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "ID=" + rs55.getString("ID") + "", coo);

            double num = 0;

            if (bn[0] != null) {

                testOut += bn[0];
                testOut += Arrays.deepToString(cot2.toArray()) + "---";
                testOut += Arrays.deepToString(cot3.toArray()) + "----";
                testOut += Arrays.deepToString(cot.toArray()) + "------------------------------------";

                if (!cot2.contains(bn[0]) && !cot3.contains(bn[0]) && !cotother.contains(bn[0]) && !cot.contains(bn[0])) {
                    cotother.add(bn[0]);
                    myint++;

                    if (bn[4].equals("-1")) {
                        Object[] sty = mxutil.getStyle("lobm", "mystykl", pro_id);
                        returndata += sty[0] + "\n  AllIDs.push('" + bn[0] + "');  var l_" + bn[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bn[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn[3] + "\",2,"+((myint+10)*50)+"," + sty[16] + "," + sty[17] + ",mystykl);\n";

                    } else {
                        Object[] sty = mxutil.getStyle("Business Function", "mystyle227", pro_id);

                        returndata += sty[0] + "\n  AllIDs.push('" + bn[0] + "');   var l_" + bn[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_ENTITY_TABLENAME + "/" + bn[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn[3] + "\",2,"+((myint+10)*50)+"," + sty[16] + "," + sty[17] + ",mystyle227);\n";
                    }
                    lib.tools.test.addMessage("corporate,be to be", "C-be2be", "Creating BE TO BE Node", "BE to BE Node:" + bn[3] + "(" + bn[0] + ")  created", XMLDataModel.successClass);

                }

            }
        }

        return returndata;
    }

    public String levebOther(String id, String mod_id, String mode, String pro_id, String SCENARIOID, Connection mycoo, HttpServletRequest rq) throws SQLException {
        String returndata = "";

        ResultSet rs = db.getDataNeWcon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID=" + mod_id, mycoo);

        // Object[] stypp = mxutil.getStyle("business_process", "mystyle227", pro_id);
        int myint = 0;
        utils u = new utils();
        while (rs.next()) {

           
            String bn22[] = db.getRowNewCon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "MODEL_ID=" + mod_id + " and ID=" + rs.getString("ID"), mycoo);

            if (!cot2.contains(bn22[0]) && !cot3.contains(bn22[0]) && !cotother.contains(bn22[0]) && !cot.contains(bn22[0]) && !cototherb.contains(bn22[0])) {
                cototherb.add(bn22[0]);
 myint++;
                Object[] stypp = null;
                stypp = mxutil.getStyle("business_process", "mystyle227", pro_id);

                if (!SCENARIOID.equals("") && SCENARIOID != null) {

                    String[] sedata = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "ID='" + SCENARIOID.trim() + "' ");

                    if (sedata[7].equals("6")) {

                        if (!u.getISScenarioPram(mod_id, sedata[0], bn22[0], "ACTIVE_STATUS").equalsIgnoreCase("-1")) {

                            stypp = mxutil.getStyle("business_process", "mystyle227", pro_id, "0a1657", "CFCFCF");
                        }
                    }
                }

                if (!cot.contains(bn22[0]) && bn22[0] != null) {
                    cot.add(bn22[0]);
                    test.addMessage("corporate,be to bp", "C-be2bp", "Creating BE TO BP Node", "BE to BP Node:" + bn22[3] + "(" + bn22[0] + ") created", XMLDataModel.successClass);

                    returndata += stypp[0] + "  AllIDs.push('" + bn22[0] + "'); "
                            + "  var l_bp" + bn22[0] + " = creatD(corporateGraph ,\"" + XMLDataModel.BUSINESS_PROCESS_TABLENAME + "/" + bn22[0] + "/" + SCENARIOID + "/" + mod_id + "\",\"" + bn22[3].replace(" ", "<br/>") + "\",150,"+((myint+10)*50)+",\"" + stypp[16] + "\"," + stypp[17] + ",mystyle227);";

                }

            }
        }

        return returndata;
    }

    String alert(String s) {

        return "alert('" + s + "');";
    }
}
