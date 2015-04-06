/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tools;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author es
 */
public class forms extends HttpServlet implements lib.Options.MyVariables {

    public String mode = "";
    public String title = "";
    public String type = "";//[text,number,autocomp,date,time,password,checkbox,textarea,editor,select,radio,upload,pic,label,hidden ,$upload_to]
    public String name = "";
    public String myclass = "";
    public String selectQuery = "";
    public String selectDataTable = "";
    public String selectDataWhere = "";
    public String selectTexttField = "";
    public String selectValueField = "";
    public String selectData = "";
    public String required = "";
    public String method = "";
    public String action = "";
    public String data = "";
    public String value = "";

    private String mckEL() {

        if (required != "") {
            this.myclass += " required";
        }
        String myValue = this.value;
        String returnData = "";
        if (this.type == "form") {
            returnData = "<form ENCTYPE=\"" + this.value + "\"  action=\"" + this.action + "\"  method=\"" + this.method + "\"  id=\"" + this.name + "\" class=\"me_form form_input " + this.name + " " + this.myclass + "\">";
        } else if (this.type == "end form") {
            returnData = "</form>";
        } else if (this.type == "button") {
            returnData = "<input type=\"button\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_button form_input " + this.name + " " + this.myclass + "\" />";
        } else if (this.type == "reset") {
            returnData = "<input type=\"reset\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_reset form_input " + this.name + " " + this.myclass + "\" />";

        } else if (this.type == "line") {
            returnData = "<div class=\"myline\">" + this.title + "</div>";


        } else if (this.type == "submit") {
            returnData = "<input type=\"submit\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_submit form_input " + this.name + " " + this.myclass + "\" />";

        } else if (this.type == "select") {


            returnData = "<select title=\"" + this.title + "\"  name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_select form_input " + this.name + " " + this.myclass + "\" />"
                    + this.getselect(selectQuery, selectDataTable, selectTexttField, selectValueField, selectData, selectDataWhere)
                    + "</select>";
        } else if (this.type == "autocomplete") {
            returnData = "<input type=\"text\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_autocomplete form_input " + this.name + " " + this.myclass + "\" />"
                    + this.getautocomplete(selectQuery, selectDataTable, selectTexttField, selectValueField, data, selectDataWhere);
        } else if (this.type == "text") {
            returnData = "<input type=\"text\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_text form_input " + this.name + " " + this.myclass + "\" />";
        } else if (this.type == "hidden") {
            returnData = "<input type=\"hidden\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_hidden form_input " + this.name + " " + this.myclass + "\" />";
        } else if (this.type == "password") {
            returnData = "<input type=\"password\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_password form_input " + this.name + " " + this.myclass + "\" />";
        } else if (this.type == "date") {
            returnData = "<input type=\"text\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_date form_input " + this.name + " " + this.myclass + "\" />"
                    + "<script type=\"text/javascript\" >getDate(\"" + this.name + "\")</script>";
        } else if (this.type == "color") {
            returnData = "<input type=\"text\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_color form_input " + this.name + " " + this.myclass + "\" />"
                    + "<script type=\"text/javascript\" >getColorPicker(\"" + this.name + "\")</script>";
        } else if (this.type == "checkbox") {


            String stat = "";
            if (myValue.equals("1")) {
                stat = "checked";
            } else {
                stat = "";
            }

            if (myValue.equals("")) {
                myValue = "1";
            }




            returnData = "<input type=\"checkbox\" " + stat + " title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_password form_input " + this.name + " " + this.myclass + "\" />";
        } else if (this.type == "radio") {
            String stat = "";
            if (myValue.equals("1")) {
                stat = "checked";
            } else {
                stat = "";
            }

            returnData = "<input type=\"radio\" " + stat + " title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_password form_input " + this.name + " " + this.myclass + "\" />"
                    + "<script type=\"text/javascript\" >getColorPicker(\"" + this.name + "\")</script>";
        } else if (this.type == "number") {
            returnData = "<input type=\"text\" title=\"" + this.title + "\" value=\"0" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_password form_input " + this.name + " " + this.myclass + "\" />"
                    + "<script type=\"text/javascript\" >getNmuber(\"" + this.name + "\")</script>";
        } else if (this.type == "upload" || this.type == "image") {


           

            returnData = "<input type=\"file\" title=\"" + this.title + "\" value=\"" + myValue + "\" name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_password form_input " + this.name + " " + this.myclass + "\" />";
        } else if (this.type == "editor") {
            returnData = "<textarea type=\"password\" title=\"" + this.title + "\"  name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_password form_input " + this.name + " " + this.myclass + "\">" + myValue + "</textarea>"
                    + "<script type=\"text/javascript\" src=\"includes/js/jscripts/tiny_mce/tiny_mce.js\"></script> "
                    + "<script type=\"text/javascript\" >getEditor(\"" + this.name + "\");</script>";
        } else if (this.type == "textarea") {
            returnData = "<textarea type=\"password\" title=\"" + this.title + "\"  name=\"" + this.name + "\" id=\"" + this.name + "\" class=\"me_password form_input " + this.name + " " + this.myclass + "\">" + myValue + "</textarea>";

        }
        ;



        String ff = "";
        if (this.type.equals("form") || this.type.equals("end form") || this.type.equals("hidden") || this.type.equals("line")) {
            ff = returnData;

        } else {
            ff = "<div class=\"form_row\"><lable for=\"" + this.name + "\" class=\"input_title\">" + this.title + "</lable><div class=\"form_input\">" + returnData + "</div></div>";

        }
        return ff;
    }

    public String getForm() {

        return this.mckEL();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        } finally {
            out.close();
        }
    }

    private String getautocomplete(String selectQuery_vr, String selectDataTable_vr, String selectTextTfild_vr, String selectValueFild_vr, String Data_vr, String selectDataWhere_vr) {

        String retdata = "";
        if (!Data_vr.equals("")) {

            retdata = Data_vr;
        } else if (!selectDataTable_vr.equals("") && !selectTextTfild_vr.equals("")) {

       lib.engine.db.operations db = new lib.engine.db.operations();
           db.openDBCon(lib.Options.DbInfo.connectionStringDef);



            String where = "";
            if (!selectDataWhere_vr.equals("") && selectDataWhere_vr != null) {
                where += "where " + selectDataWhere_vr;


            }

            ResultSet rs = db.getData(selectDataTable_vr, where);
            try {
                while (rs.next()) {

                    retdata += "," + rs.getString(selectTextTfild_vr);
                }
            } catch (SQLException ex) {
                Logger.getLogger(forms.class.getName()).log(Level.SEVERE, null, ex);
            }
        }




        return "<script type=\"text/javascript\" >getAutocomplete(\"" + this.name + "\",\"" + retdata + "\")</script>";

    }

    private String getselect(String selectQuery_vr, String selectDataTable_vr, String selectTextTfild_vr, String selectValueFild_vr, String selectData_vr, String selectDataWhere_vr) {
        String returndata = "<option value=\"\"></option>";

        if (!selectData_vr.equals("")) {

            String[] frarray = selectData_vr.split(",");
            for (int i = 0; i < frarray.length; i++) {

                String[] frarray2 = frarray[i].split("/");
                String stat = "";
                if (selectValueFild_vr.equals(frarray2[0])) {
                    stat = "selected";
                } else {
                    stat = "";

                }



                returndata += "<option " + stat + " value=\"" + frarray2[0] + "\">" + frarray2[1] + "</option>";
            }

        } else if (!selectDataTable_vr.equals("") && !selectTextTfild_vr.equals("")) {

            lib.engine.db.operations db = new lib.engine.db.operations();


            String where = "";
            if (!selectDataWhere_vr.equals("") && selectDataWhere_vr != null) {
                where += selectDataWhere_vr;
            }


            //  returndata += "<option value=\"" +where + "\">" + where + "</option>";

            db.openCon();
            String[] srs = db.getColumnNOCON(selectDataTable_vr, selectTextTfild_vr, where);
            String[] srv = db.getColumnNOCON(selectDataTable_vr, selectValueFild_vr, where);
            db.closeCon();

            for (int i = 0; i < srs.length; i++) {
                returndata += "<option value=\"" + srv[i] + "\">" + srs[i] + "</option>";
            }

        }
        return returndata;
    }
}
