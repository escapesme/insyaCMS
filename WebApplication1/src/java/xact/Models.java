/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import lib.Options.XMLDataModel;

/**
 *
 * @author ismail
 */
public class Models {

    public String isDisabled(String title, String img) {
        return "<li class=\"disable\"><div class=\"Icon\"><img src=\"images/" + img + "\" /></div>" + title + "</li>";

    }

    public String isDisabled(String title) {
        return "<li class=\"disable\"><div class=\"Icon\"><img src=\"images/new.gif\" /></div>" + title + "</li>";

    }

    public String isEnabled(String id, String thclass, String img, String title) {
        return "<li id=\"" + id + "\" class=\"" + thclass + "\"><div class=\"Icon\"><img src=\"images/" + img + "\" /></div>" + title + "</li>";

    }
    lib.engine.db.operations db = new lib.engine.db.operations();

    public String computeStatus(String id) {
        String returndata = "";
        db.openDBCon(lib.Options.DbInfo.connectionStringRes);
        returndata = db.getValueNocon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "STATUS", "ID=" + id);
        return returndata;
    }

    public String getScenariorightMenu(HttpServletRequest request, String PARENT_ID, String ModID, String scenario_table, String computStatusFinish, String computStatusWorking, String computStatusFinishWerror, Boolean makeScenario, Boolean com_sataus, String SID, String proId) {
        String returndata = "";

        String[] rsdt = db.getRow(scenario_table, " ID=" + SID);

        String cl_scenario = rsdt[3];
        String cl_scenarioL = rsdt[5];
        String cl_scenarioID = rsdt[0];
        String cl_scenario_type = rsdt[7];

        String pmx_table = lib.Options.XMLDataModel.PMXREF_TABLENAME;
        String Computemenu = isDisabled("Compute");
        String resmenu ="";
        xact.users.users u = new xact.users.users();
        String Scenariosmenu = isDisabled("Scenarios");
        String Propertiesmenu = isDisabled("Properties");
        String cancelCompute = isDisabled("Restet Compute");
        Boolean canDelete = false;
        try {
            canDelete = u.userper(request, "delete");
        } catch (SQLException ex) {
            Logger.getLogger(Models.class.getName()).log(Level.SEVERE, null, ex);
        }
        String Deletemenu = isDisabled("Delete");
        String Detailmenu = isDisabled("Detail");
        String ComputeSinglemenu = "";
        String ComputeSeriesmenu = "";

        String EditParametersmenu = isDisabled("Edit Parameters");

        String ChronographMenu = isDisabled("Edit Parameters");
        String modleidmap = proId + "__" + ModID + "__" + cl_scenarioID;

        //  String cl = getScenario(request, cl_scenarioID, ModID, scenario_table, computStatusFinish, computStatusWorking, computStatusFinishWerror, makeScenario, com_sataus);
        if (com_sataus == true && thShow("", cl_scenario_type) != false) {

            Computemenu = isEnabled(modleidmap, "get_comput " + "__" + cl_scenario_type, "gear.gif", "Compute");

        }

        String computStatus = computeStatus(cl_scenarioID);

        String Compute_Logmenu = isEnabled(modleidmap, "get_log", "gear.gif", "Compute Log");

        if (computStatus == null || computStatus.equals("") || computStatus.equals("null")) {
            Compute_Logmenu = isDisabled("Compute Log");
        }

        if (computStatus.equals(computStatusFinish)) {

            resmenu += "<li  class=\"get_resuilt\"><div class=\"Icon\"><img src=\"images/gear.gif\" /></div>Results"
                    + "<ul class=\"submenu\">"
                    + this.isEnabled(modleidmap, "Diagnosis_Repair", "chart_pie.png", "Diagnosis & Repair")
                    + this.isEnabled(modleidmap, "Service_Result", "service managment.gif", "Service Management Results")
                    + this.isEnabled(modleidmap, "Resource_View", "resource managment.png", "Resource Management View")
                    + this.isEnabled(modleidmap, "financial_view", "Emblem-Money.png", "Financial View");
            if (cl_scenario_type.equals("6")) {
                resmenu += this.isEnabled(modleidmap, "chro_View", "resource managment.png", "Chronograph  View");
            }
            resmenu += this.isEnabled(modleidmap, "export_results", "Emblem-Money.png", "Export Detail Results")
                    + this.isEnabled(modleidmap, "export_throughput_results", "Emblem-Money.png", "Export Throughput Results")
                    + "</ul></li>";
        } else if (computStatus.equals(computStatusWorking)) {
            cancelCompute = isEnabled(modleidmap, "cancelCompute", "resetCompute.png", "Reset Compute");
        }
        if (canDelete) {
            Deletemenu = this.isEnabled(cl_scenarioID, "s_Delete", "implementation.png", "Delete");
        }
        if (!cl_scenario_type.equals("3") && !cl_scenario_type.equals("4")) {

            Detailmenu = this.isEnabled(cl_scenarioID, "view_Detail", "console.gif", "Detail");

            if ((cl_scenarioL.equals("1")) && !cl_scenario_type.equals("7") && makeScenario == true && thShow("", cl_scenario_type) != false) {

                Scenariosmenu = "<li><div class=\"Icon\"><img src=\"images/new.gif\" /></div>Scenarios<ul class=\"submenu\">"
                        + this.isEnabled("i_" + ModID + "__" + cl_scenarioID, "m_Implemention", "implementation.png", "Modify Implemention")
                        + this.isEnabled("p_" + ModID + "__" + cl_scenarioID, "m_Process", "business.png", "Modify Process/logic")
                        + this.isEnabled("m_" + ModID + "__" + cl_scenarioID, "m_Business", "business.png", "Modify Business")
                        + "</ul></li>";
            }

        }

        //  }
        if (cl_scenario_type.equals("3") || cl_scenario_type.equals("4")) {
            Computemenu = "";
            Scenariosmenu = "";
            Propertiesmenu = "";
            Detailmenu = "";
            ComputeSeriesmenu = "";
            ComputeSinglemenu = "";
            String otherName = "";
            if (cl_scenario_type.equals("3")) {
                otherName = cl_scenario.replace("_P_", "_A_");

            } else {

                otherName = cl_scenario.replace("_A_", "_P_");

            }

            String[] rs2 = db.getRow(scenario_table, " NAME='" + otherName + "'");

            String computStatusB = computeStatus(rs2[0]);

            if (computStatus.equals(computStatusFinish) && computStatusB.equals(computStatusFinish)) {

                modleidmap += "__" + rs2[0] + "__ops";
                ChronographMenu = this.isEnabled(modleidmap, "chronograph_View", "resource managment.png", "Chronograph View");

            } else {

                ChronographMenu = this.isDisabled("Chronograph View");

            }

            if (!cl_scenario_type.equals("7")) {
                EditParametersmenu = this.isEnabled(modleidmap, "EditParameters" + cl_scenario_type, "nothing.png", "Edit Parameters");

            }

            if (com_sataus == true) {

                if (!cl_scenario_type.equals("4")) {

                    ComputeSinglemenu += this.isEnabled(modleidmap, "EditParameters5", "nothing.png", "Compute Single ");
                    ComputeSeriesmenu += this.isEnabled(modleidmap, "EditParameters6", "nothing.png", "Compute Series");

                } else {

                    Computemenu += this.isEnabled(modleidmap, "EditParameters7", "nothing.png", "Compute");

                }

            }

        } else if (cl_scenario_type.equals("6")) {

            ChronographMenu = "";
            Computemenu = "";
            Deletemenu = this.isEnabled(cl_scenarioID, "timeboxDelete", "implementation.png", "Delete");
            ComputeSinglemenu = this.isEnabled(modleidmap, "ComputeSingle_6", "nothing.png", "Compute Single ");

//            if (PARENT_ID.equalsIgnoreCase(ModID)) {
//
//                ComputeSeriesmenu = this.isEnabled(modleidmap, "ComputeSeries_6", "nothing.png", "Compute Series");
//            }
            EditParametersmenu = this.isEnabled(modleidmap, "EditParameters_6", "properties.gif", "Edit Parameters");
            Propertiesmenu = "";
            String[] isch = db.getRow(XMLDataModel.SCENARIO_TABLENAME, "PARENT_ID=" + cl_scenarioID);
            if (isch[0] == null) {

                Scenariosmenu = this.isEnabled(modleidmap, "m_TimeBox", "time_box.png", "Time Box");

            } else {
                Scenariosmenu = isDisabled("Time Box");

            }

        } else if (cl_scenario_type.equals("1") || cl_scenario_type.equals("2") || cl_scenario_type.equals("0")) {
            ChronographMenu = "";
            Propertiesmenu = "";
            EditParametersmenu = "";
        }

        if (cl_scenario_type.equals("7")) {

            ChronographMenu = "";
            Scenariosmenu = "";
            Propertiesmenu = "";
            EditParametersmenu = "";
        }
         if (cl_scenario_type.equals("6")) {

            ComputeSeriesmenu = "";
        }

        returndata += "<ul>"
                + ChronographMenu
                + resmenu
                +(!computStatus.equals(computStatusWorking) ?Computemenu:"")  +(computStatus.equals(computStatusWorking) ?cancelCompute:"") 
                + Compute_Logmenu
                + ComputeSinglemenu
                + ComputeSeriesmenu
                + Scenariosmenu
                + Propertiesmenu
                + EditParametersmenu
                + Deletemenu
                + Detailmenu + "</u>";

        return returndata;
    }

    public String getScenario(HttpServletRequest request, String PARENT_ID, String ModID, String scenario_table, String computStatusFinish, String computStatusWorking, String computStatusFinishWerror, Boolean makeScenario, Boolean com_sataus) throws SQLException {

        String returndata = "";

        String clssdiv = "";
        String clssli = "";

        db.openCon();

        ResultSet rs = db.getData(scenario_table, "*", " PARENT_ID=" + PARENT_ID);
        xact.users.users user = new xact.users.users();
        Boolean timeBox = user.userper(request, "timebox");
        returndata += "<ul>";

        while (rs.next()) {
            String currentData = "";
            String cl_scenario = rs.getString("NAME");
            String cl_scenarioL = rs.getString("LOCKED");
            String cl_scenarioID = rs.getString("ID");
            String cl_scenario_type = rs.getString("SCENARIO_TYPE");
            String modleidmap = request.getParameter("pro_is") + "__" + ModID + "__" + cl_scenarioID;

            String cl = getScenario(request, cl_scenarioID, ModID, scenario_table, computStatusFinish, computStatusWorking, computStatusFinishWerror, makeScenario, com_sataus);

            String pub_menu = "<div class=\"pub_menu\"></div>";

            currentData += "<li class=\"  secnar " + clssli + "\">";

            //  returndata += "<div class=\"hitarea  " + clssdiv + "\"></div>";
            currentData += "<div class=\"hitarea  " + clssdiv + "\"></div>";

            currentData += "<span>"
                    + "<a id=\"" + modleidmap + "__" + cl_scenario_type + "\"   class=\" scenariolink  " + cl_scenarioID + " get_model\" href=\"?alias=" + request.getParameter("alias") + "&model_id=" + ModID + "&scen_id=" + cl_scenarioID + "&type=scenario \">";

            if (cl_scenario_type.equals("0")) {

                currentData += "<img class='scenarioImage' src=\"images/business.png\" />" + cl_scenario + "</a>" + pub_menu + "</span>" + cl;
            } else if (cl_scenario_type.equals("1")) {

                currentData += "<img class='scenarioImage'  src=\"images/implementation.png\" />" + cl_scenario + "</a>" + pub_menu + "</span>" + cl;
            } else if (cl_scenario_type.equals("2")) {

                currentData += "<img  class='scenarioImage'  src=\"images/process.png\" />" + cl_scenario + "</a>" + pub_menu + "</span>" + cl;
            } else if (cl_scenario_type.equals("3")) {

                currentData += "<img class='scenarioImage'  src=\"images/kexi.png\" />" + cl_scenario + "</a>" + pub_menu + "</span>" + cl;
            } else if (cl_scenario_type.equals("4")) {

                currentData += "<img class='scenarioImage'  src=\"images/ruota_dentata_2_architet.png\" />" + cl_scenario + "</a>" + pub_menu + "</span>" + cl;
            } else if (cl_scenario_type.equals("5")) {

                currentData += "<img class='scenarioImage'  src=\"images/kexi.png\" />" + cl_scenario + "</a>" + pub_menu + "</span>" + cl;
            } else if (cl_scenario_type.equals("6")) {
                // if (timeBox) {
                currentData += "<img class='scenarioImage'  src=\"images/time_box.png\" />" + cl_scenario + "</a>" + pub_menu + "</span>" + cl;
                /* }else{
                 currentData="";
                 }*/
            } else if (cl_scenario_type.equals("7")) {

                currentData += "<img class='scenarioImage'  src=\"images/businessVolume.png\" />" + cl_scenario + "</a>" + pub_menu + "</span>" + cl;
            }

            returndata += currentData;
        }
        returndata += "</ul></li>";

        db.closeCon();
        return returndata;

    }

    boolean thShow(String status, String Type) {
        boolean stat = true;

        if (!Type.equalsIgnoreCase("0") && !Type.equalsIgnoreCase("2") && !Type.equalsIgnoreCase("1") && !Type.equalsIgnoreCase("7")) {

            stat = false;

        }

        return stat;
    }
}
