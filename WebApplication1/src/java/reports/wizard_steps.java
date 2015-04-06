/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package reports;

import java.io.File;
import java.sql.ResultSet;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.jstl.sql.Result;
import lib.Options.XMLDataModel;
import java.util.Date;
import lib.Options.MyVariables;
import lib.tools.Utils;

/**
 *
 * @author ismail
 */
/**
 * <b><i>The class that creates the wizard steps.</i></b> <br>Getting
 * the type of input you need by calling getData() method with the correct type
 * as a parameter
 *
 *
 */
public class wizard_steps {

    inputs in = new inputs();
    public String folderName = MyVariables.imagesURL;
    public String ThisID = "";
    public String myfloderPath = MyVariables.imagesURL;

    /**
     * creates a directory with the name of the passed id
     *
     * @param request
     * @param id
     * @return string containing the folder path
     */
    public String creatFloder(HttpServletRequest request, String id) {
        String floderPath = myfloderPath + id;

        File file = new File(floderPath);


        if (!file.isDirectory()) {

            String strProjectDir = request.getRealPath(floderPath);
            File ProjectDir = new File(strProjectDir);
            if (!ProjectDir.exists()) {
                ProjectDir.mkdir();
            }
        }
        return floderPath;


    }

    /**
     * makes a formatted date of the current time
     *
     * @return
     */
    private String thisDate() {
        String returnDate = "";

        Date now = new Date();

        Format formatter;
        formatter = new SimpleDateFormat("dd/MM/yyyy");



        returnDate = "" + formatter.format(now);


        return returnDate;


    }

    /**
     *
     * @param id
     * @param setp
     * @param fildeName
     * @param myname
     * @return
     */
    private String getEditData(String id, String setp, String fildeName, String myname) {
        String returnData = "";
        String mysetp = getSetp(setp);
        String data[] = null;

        if (myname.equalsIgnoreCase("") || myname.equalsIgnoreCase("-")) {

            data = db.getRow(XMLDataModel.REPORT_DATA_TABLENAME, "data_type='" + mysetp + "' and report_id='" + id + "'");

        } else {


            data = db.getRow(XMLDataModel.REPORT_DATA_TABLENAME, "data_type='" + mysetp + "' and report_id='" + id + "' and name='" + myname + "'");

        }


        if (data[0] != null) {






            String[] dataNames = data[4].split("!split!");
            String[] dataVAlues = data[5].split("!split!");

            // returnData = dataVAlues[1];


            for (int mi = 0; mi < dataNames.length; mi++) {


                dataNames[mi] = dataNames[mi].replace("[", "");

                dataNames[mi] = dataNames[mi].replace("]", "");



                dataVAlues[mi] = dataVAlues[mi].replace("[", "");

                dataVAlues[mi] = dataVAlues[mi].replace("]", "");



                if (fildeName.equalsIgnoreCase(dataNames[mi])) {

                    returnData = dataVAlues[mi];
                }

            }
        }

        return returnData;
    }

    /**
     *
     * @param id
     * @return
     */
    private String intro_step(String id) {

        String retData = "<form class='step_1_from' />";



        retData += in.getInput("text", "Title", "rep_title", getEditData(id, "intro", "rep_title", ""), "_50", "");



        retData += in.getInput("text", "Organization Name", "Organiztion_Name", getEditData(id, "intro", "Organiztion_Name", ""), "_50", "");
        /*
         * retData += in.getInput("readonly", "Date of Issue", "Date_of_Issue",
         * thisDate(), "_50");
         */

        retData += in.getInput("file", "Corporate Logo", "Corporate_Logo", getEditData(id, "intro", "Corporate_Logo", ""), "_50", myfloderPath + "____" + id);

        retData += in.getInput("text", "Owner", "Owner", getEditData(id, "intro", "Owner", ""), "_50", "");
        retData += in.getInput("text", "Program", "Program", getEditData(id, "intro", "Program", ""), "_50", "");
        retData += in.getInput("readonly", "Date Of Creation", "Date_Of_Creation", thisDate(), "_50", "");
        retData += in.getInput("text", "Author", "Author", getEditData(id, "intro", "Author", ""), "_50", "");




        retData += in.getInput("editor", "Executive Summary", "Executive_Summary", getEditData(id, "intro", "Executive_Summary", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "Introduction", "Introduction", getEditData(id, "intro", "Introduction", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "Purpose", "Purpose", getEditData(id, "intro", "Purpose", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "Scope", "Scope", getEditData(id, "intro", "Scope", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "Frequency of Update", "Frequency_of_Update", getEditData(id, "intro", "Frequency_of_Update", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "Findings", "Findings", getEditData(id, "intro", "Findings", ""), "_100", "");
        retData += "<br/>";
        retData += "</form>";
        return retData;

    }

    /**
     *
     * @param id
     * @return
     */
    private String analysis(String id) {

        String retData = "<form class='step_1_from' />";





        retData += in.getInput("editor", "Critical Analysis", "Critical_Analysis", getEditData(id, "analysis", "Critical_Analysis", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "Which axis are at risk", "Which_risk", getEditData(id, "analysis", "Which_risk", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "What are the main risk areas", "What_areas", getEditData(id, "analysis", "What_areas", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "How urgent the risk should be addressed", "How_addressed", getEditData(id, "analysis", "How_addressed", ""), "_100", "");
        retData += "<br/>";
        retData += in.getInput("editor", "Conclusion", "Conclusion", getEditData(id, "analysis", "Conclusion", ""), "_100", "");
        retData += "<br/>";

        retData += "</form>";
        return retData;

    }

    /**
     *
     * @param othdata_1
     * @param rq
     * @return
     */
    public String end_step(String othdata_1, HttpServletRequest rq) {


        String retData = ""
                + ""
                + "<script>"
                + "function dofinesh(st){ "
                + " \n  $.get('" + MyVariables.siteUrl + "ajax/results/reports/data.jsp?rp_id=" + othdata_1 + "&type=end&"
                + "status='+st,"
                + "\n function(data){"
                + " \n window.location='viewreport.jsp?id=" + othdata_1 + "'"
                + "\n })}"
                + " \n "
                + "$(function(){ "
                + "$('.spublish').click(function(){"
                + "dofinesh(1); });"
                + "$('.sunpublish').click(function(){ "
                + " dofinesh(0); "
                + "});"
                + "\n });"
                + "</script>";






        retData += "<div class='fiend spublish'><a  class='viewreport '>I am done with this report. Publish it. </a></div>  "
                + "<div class='fiend sunpublish'><a  class='viewreport '>I am still working on this report. Let me preview the report. </a></div>";


        return retData;

    }

    private String results_step(String othdata_1, String othdata_2) {



        String retData = in.getInput("crop", othdata_1, "results", "", "", "");;
        return retData;

    }

    private String results_data_step(String id, String myname) {


        String retData = "<form class='step_results_from' />";
        retData += in.getInput("editor", "results Data", "results_Data", getEditData(id, "results", "results_Data", myname), "_100", "");
        retData += "</form>";
        return retData;

    }

    /**
     *
     * @return
     */
    private String situation_step() {

        String retData = "situation";
        return retData;

    }
    lib.engine.db.operations db = new lib.engine.db.operations();

    /**
     *
     * @param Name
     * @param name
     * @return
     */
    private String getEdit(String Name, String name) {

        String retData = "";

        String setp = getSetp(Name);
        String sqldat[] = db.getRow(XMLDataModel.REPORT_IMAGES_TABLENAME, "report_id='" + this.ThisID + "' and data_type='" + setp + "' and "
                + " name='" + name + "'");

        if (sqldat[2] != null && !sqldat[2].equals("")) {
            retData += EditScript(Name) + ""
                    + "<div style='display:block;' Class='ShowTest " + Name + "mycrop_edit'>"
                    + "<div class='p_bar'>"
                    + "<input type='button' class='button edit_img' value='Replace this Screenshot' />"
                    + "</div>"
                    + "<img class='p_img' src=" + this.folderName + "/reporting/" + this.ThisID + "/" + sqldat[2] + ".jpg />"
                    + "</div>";
        }
        return retData;

    }

    /**
     *
     * @param name
     * @return
     */
    String EditScript(String name) {
        String returnData = "";
        returnData += "<script>"
                + "$(function(){"
                + "$('." + name + "mycrop_data').hide();"
                + "$('." + name + "mycrop_edit').show();"
                + "$('." + name + "mycrop_edit .edit_img').click(function(){"
                + "$('." + name + "mycrop_data').show();"
                + "$('." + name + "mycrop_edit').hide();"
                + "});"
                + "})"
                + "</script>";
        return returnData;



    }

    /**
     *
     * @param name
     * @param othdata_1
     * @param othdata_2
     * @param adMore
     * @return
     */
    private String corp_step(String name, String othdata_1, String othdata_2, String adMore) {



        String retData = "";
        retData += this.getEdit(name, adMore);
        retData += "<div class='" + name + "mycrop_data'>";
        retData += in.getInput("crop", othdata_1, name, "", "", "");;
        retData += "</div>";
        return retData;
    }

    /**
     *
     * @param name
     * @param id
     * @param myname
     * @return
     */
    private String get_data_step(String name, String id, String myname) {

        String retData = "<form class='step_group_from' />";
        retData += in.getInput("editor", name + " Data", name + "_Data", getEditData(id, name, name + "_Data", myname), "_100", "");
        retData += "</form>";
        return retData;
    }

    /**
     *
     * @param type
     * @param id
     * @param othdata_2
     * @param adMore
     * @return
     */
    public String returnSteps(String type, String id, String othdata_2, String adMore) {
        String retData = "";
        if (type.equalsIgnoreCase("intro")) {
            retData = this.intro_step(id);

        } else if (type.equalsIgnoreCase("analysis")) {
            retData = this.analysis(id);

        } else if (type.equalsIgnoreCase("corporate")) {

            retData = this.corp_step("corporate", id, othdata_2, adMore);

        } else if (type.equalsIgnoreCase("corporate_data")) {

            retData = get_data_step("corporate", id, adMore);

        } else if (type.equalsIgnoreCase("implementation")) {
            retData = this.corp_step("implementation", id, othdata_2, adMore);
        } else if (type.equalsIgnoreCase("implementation_data")) {
            retData = get_data_step("implementation", id, adMore);

        } else if (type.equalsIgnoreCase("group")) {
            retData = this.corp_step("group", id, othdata_2, adMore);
        } else if (type.equalsIgnoreCase("group_data")) {
            retData = get_data_step("group", id, adMore);

        } else if (type.equalsIgnoreCase("situation")) {
            retData = this.situation_step();
        } else if (type.equalsIgnoreCase("Dr")) {
            retData = corp_step("Dr", id, othdata_2, adMore);
        } else if (type.equalsIgnoreCase("Dr_data")) {
            retData = get_data_step("Dr", id, adMore);



        } else if (type.equalsIgnoreCase("end")) {
            // retData = this.end_step(id, othdata_2);
        } else if (type.equalsIgnoreCase("smv")) {
            retData = corp_step("smv", id, othdata_2, adMore);
        } else if (type.equalsIgnoreCase("smv_data")) {
            retData = get_data_step("smv", id, adMore);
        } else if (type.equalsIgnoreCase("rmv")) {
            retData = corp_step("rmv", id, othdata_2, adMore);
        } else if (type.equalsIgnoreCase("rmv_data")) {
            retData = get_data_step("rmv", id, adMore);
        } else if (type.equalsIgnoreCase("service")) {
            retData = corp_step("service", id, othdata_2, adMore);
        } else if (type.equalsIgnoreCase("service_data")) {
            retData = get_data_step("service", id, adMore);
        } else if (type.equalsIgnoreCase("ad")) {
            retData = corp_step("ad", id, othdata_2, adMore);
        } else if (type.equalsIgnoreCase("ad_data")) {
            retData = get_data_step("ad", id, adMore);
        } else if (type.equalsIgnoreCase("financial_Data")) {
            retData = get_data_step("financial", id, adMore);
        } else if (type.equalsIgnoreCase("financial")) {
            retData = corp_step("financial", id, othdata_2, adMore);
        }
        return retData;
    }

    /**
     *
     * @param Name
     * @return
     */
    public String getSetp(String Name) {


        String retData = "";
        if (Name.equalsIgnoreCase("corporate")) {
            retData = "2";
        } else if (Name.equalsIgnoreCase("service")) {
            retData = "3";
        } else if (Name.equalsIgnoreCase("implementation")) {
            retData = "4";
        } else if (Name.equalsIgnoreCase("group")) {
            retData = "5";
        } else if (Name.equalsIgnoreCase("Dr")) {
            retData = "6";
        } else if (Name.equalsIgnoreCase("ad")) {
            retData = "7";
        } else if (Name.equalsIgnoreCase("smv")) {
            retData = "8";
        } else if (Name.equalsIgnoreCase("rmv")) {

            retData = "9";
        } else if (Name.equalsIgnoreCase("intro")) {

            retData = "1";
        } else if (Name.equalsIgnoreCase("analysis")) {

            retData = "11";
        } else if (Name.equalsIgnoreCase("financial")) {

            retData = "10";
        }

        return retData;
    }
}
