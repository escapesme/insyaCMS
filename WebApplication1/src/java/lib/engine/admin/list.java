/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.admin;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.tools.forms;
import org.w3c.dom.*;

/**
 *
 * @author es
 */
public class list extends HttpServlet implements lib.Options.MyVariables, lib.Options.AdminOptions {

    String name = "";
    String list = "";
    String title = "";
    String categories = "";
    String parents = "";
    String morcss = "";
    String size = "";
    forms form = new forms();
    lib.engine.db.operations db = new lib.engine.db.operations();

    public list(String name, String list, String title, String categories, String parents, String size) {
        this.name = name;
        this.list = list;
        this.title = title;
        this.categories = categories;
        this.parents = parents;
        this.size = size;

    }

    protected String getData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



        String XmlFile = siteUrl + adminFolder + "/" + this.name + "/mod_properties.xml";
        lib.tools.xml.readingXml getxml = new lib.tools.xml.readingXml(XmlFile, "field");
        NodeList Fildes = getxml.getListTags();
        
        return craetData(Fildes, request);


    }

    private String craetData(NodeList Fildes, HttpServletRequest request) {


        String moreWhere = "";
        String morelink = "";
        String categoriesMore = "";
        String returnData = "";
        String morelinkes = "";
          if (this.name.equalsIgnoreCase("styles")) {
                db.openCon();
            } else {

                db.openDBCon(lib.Options.DbInfo.connectionStringDef);

            }

        String startrow = "0";

        if (request.getParameter("page") != null) {


            startrow = Integer.toString(listNumberRows * (Integer.parseInt(request.getParameter("page")) - 1));

        } else {

            startrow = "0";
        }



        if (this.parents.equals("true")) {

            moreWhere = "and parent_id=" + request.getParameter("parent_id");
            morelink = "&parent_id=" + request.getParameter("parent_id");

        }

        if (this.categories.equals("true")) {

            moreWhere += " and cat_id=" + request.getParameter("cat_id");
            morelinkes += "&cat_id=" + request.getParameter("cat_id");
            morcss += "style=\"width: 70px;\"";
        }



        ResultSet ress = db.getData(this.name, "*", "1=1 " + moreWhere + " ORDER BY 'id' DESC limit  " + startrow + "," + listNumberRows);



        //"<li title=".ui-icon-arrowreturnthick-1-e" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-arrowreturnthick-1-e"></span></li>


        returnData += do_update(request);
        returnData += do_deleteM(request) + do_delete(request)
                + "<form  action=\"\" method=\"post\" class=\"  admin_list_form\" >"
                + "<div class=\"admin_list_all window-default\">"
                + "<input type=\"hidden\" value=\"\" name=\"th_status\" class=\"th_status\" /> "
                + "<input type=\"hidden\" name=\"del_one\" class=\"del_one\" value=\"-1\" />"
                + "<input type=\"hidden\" name=\"status\" class=\"status\" value=\"-1\" />"
                + "<div class=\"admin_list_title\">" + this.title + ""
                + "<div class=\"btd_clos button\">"
                + "<li class=\" \" title=\"\"><span class=\"ui-icon ui-icon-close\"></span></li>"
                + "</div><div class=\"btd_max button\">"
                + "<li class=\"ui-state-default ui-corner-all\" title=\"\"><span class=\"ui-icon ui-icon-newwin\"></span></li>"
                + "</div>"
                + "<div class=\"btd_min button\">"
                + "<li class=\"ui-state-default ui-corner-all\" title=\"\"><span class=\"ui-icon ui-icon-minus\"></span></li>"
                + "</div></div>"
                + "<div class=\"admin_list_cont\"><div class=\"admin_list_tools dark_bg\">"
                + "<ul id=\"icons\">"
                + "<li title=\".ui-icon-plus\" class=\"ui-state-default ui-corner-all \">"
                + "<a href=\"admin.jsp?alias=" + request.getParameter("alias") + morelink + morelinkes + "&" + showFile + "=add\"><span class=\"ui-icon ui-icon-plus\"></span></a></li>"
                + "<li title=\".ui-icon-trash\" class=\"ui-state-default ui-corner-all\">"
                + "<span class=\"ui-icon ui-icon-trash delete_many\">delete</span></li>"
                + "<li title=\".ui-icon-pin-w\" class=\"ui-state-default ui-corner-all\">"
                + "<span class=\"enable_bt ui-icon ui-icon-pin-w\"></span></li>"
                + "<li title=\".ui-icon-pin-s\" class=\"ui-state-default ui-corner-all\">"
                + "<span class=\"disable_bt ui-icon ui-icon-pin-s\"></span></li>"
                + "</u>"
                + "</div>"
                + "<table class=\"admin_table_list\"><thead><th>options</th><th>#</th>";



        String[] list_array = this.list.split(",");
        for (int s = 0; s < list_array.length; s++) {
            returnData += "<th>" + retTitle(Fildes, list_array[s], "title") + this.returncsubmit(retTitle(Fildes, list_array[s], "type"), list_array[s]) + "</th>";
        }


        returnData += "</thead>";
        try {
            String allnumber = ",";

            String one_class = "";
            while (ress.next()) {
                if (one_class.equals("")) {
                    one_class = "one_class";
                } else {
                    one_class = "";
                }

                allnumber += "," + ress.getString("id");
                if (this.categories.equals("true")) {

                    categoriesMore = "<li title=\".ui-icon-trash\" class=\"ui-state-default ui-corner-all\">"
                            + "<a href=\"?alias=" + request.getParameter("alias") + morelink + "&cat_id=" + ress.getString("id") + "\" ><span class=\"ui-icon ui-icon-arrowreturnthick-1-e \"></span></a></li>";


                }
                returnData += "<tr  class=\"" + one_class + "\"><td " + morcss + "class=\"td_options\"><ul id=\"icons\" class=\"\">"
                        + "<li title=\".ui-icon-trash\" class=\"ui-state-default ui-corner-all\">"
                        + "<span class=\"ui-icon ui-icon-trash del_one_bt\" id=\"" + ress.getString("id") + "\" ></span></li>"
                        + "<li title=\".ui-icon-pencil\" class=\"ui-state-default ui-corner-all\">"
                        + " <a href=\"admin.jsp?alias=" + request.getParameter("alias")
                        + morelink
                        + morelinkes + "&" + showFile + "=edit&th_id=" + ress.getString("id") + "\"><span class=\"ui-icon ui-icon-pencil\"></span></a></li>"
                        + categoriesMore + "</ul></td><td class=\"td_chrck\"><input name=\"ids[]\"type=\"checkbox\"value=\"" + ress.getString("id") + "\" /> </td>";

                for (int s = 0; s < list_array.length; s++) {
                    returnData += "<td>" + this.returnDataType(list_array[s], retTitle(Fildes, list_array[s], "type"), ress.getString(list_array[s]), ress.getString("id")) + "</td>";



                }
            }

            returnData += "<input type=\"hidden\" name=\"all_ids\" value=\"" + allnumber + "\" />";


            returnData += "</tr>";
        } catch (SQLException ex) {
            Logger.getLogger(list.class.getName()).log(Level.SEVERE, null, ex);

        }

        returnData += "</table>" + (this.creatNbar(request)) + "</div></form>";
        db.closeCon();
        returnData += do_javacript();
        return returnData;
    }

    private String returnDataType(String filed, String type, String value, String ID) {
        String returnData = value;
        String Stat = "";
        if (type.equals("checkbox")) {
            if (value.equals("1")) {
                Stat = "checked=\"checked\"";
            } else {
                Stat = "";
            }
            returnData = "<input " + Stat + "  name=\"checkbox_" + filed + "\" value=\"" + ID + "\" type=\"checkbox\" />";
        } else if (type.equals("number")) {


            returnData = getform("number", ID, value, "", "", "", "", "", "", "", "", "", "");


        }
        return returnData + "</div>";
    }

    private String getform(String type, String name, String value, String method, String myclass, String title,
            String selectQuery, String selectDataTable, String selectTexttField, String selectValueField, String selectData, String required, String data) {

        form.name = name;
        form.type = type;
        form.value = value;
        form.method = method;
        form.title = title;
        form.myclass = myclass;
        form.selectQuery = selectQuery;
        form.selectDataTable = selectDataTable;
        form.selectTexttField = selectTexttField;
        form.selectValueField = selectValueField;
        form.selectData = selectData;
        form.required = required;
        form.data = data;
        return form.getForm();
    }

    private String retrnattr(NodeList Fildes, int num, String attr) {
        String returnData = "";
        Node returnDatan = Fildes.item(num);
        if (returnDatan.getNodeType() == Node.ELEMENT_NODE) {
            Element getattr = (Element) returnDatan;
            returnData += getattr.getAttribute(attr);
        }

        return returnData;

    }

    private String returncsubmit(String Type, String myname) {

        String retuendata = "";


        if (Type.equals("checkbox")) {
            retuendata = "<a id=\"checkbox_" + myname + "\" class=\"up_date_clo\">+</a>";

        } else if (Type.equals("number")) {

            retuendata = "<a id=\"number_" + myname + "\" class=\"up_date_clo\">+</a>";

        }



        return retuendata;

    }

    private String retTitle(NodeList Fildes, String myname, String attr) {
        String title = "";
        for (int s = 0; s < Fildes.getLength(); s++) {

            if (retrnattr(Fildes, s, "name").equals(myname)) {
                title = retrnattr(Fildes, s, attr);
            }


        }



        return title;

    }

    private String creatNbar(HttpServletRequest request) {
      if (this.name.equalsIgnoreCase("styles")) {
                db.openCon();
            } else {

                db.openDBCon(lib.Options.DbInfo.connectionStringDef);

            }
        int all = db.getRowCountNocon(this.name, "1=1");
        db.closeCon();

        String ReturnData = "";
        String next = "2";
        String prv = "1";
        String next_status = "0";
        String prv_status = "1";

        if (request.getParameter("page") != null) {


            if (Integer.parseInt(request.getParameter("page")) == 1) {

                prv_status = "disable";
            } else {
                prv_status = "enable";

            }

            int men = listNumberRows - 1;

            if ((Integer.parseInt(request.getParameter("page"))) * listNumberRows > (all)) {

                next_status = "disable";
            } else {
                next_status = "enable";

            }


            next = Integer.toString(1 + Integer.parseInt(request.getParameter("page")));
            prv = Integer.toString(Integer.parseInt(request.getParameter("page")) - 1);



        } else {
            next = "2";
            prv = "1";
        }




        ReturnData += "<ul id=\"icons\" class=\"ui-widget ui-helper-clearfix\">"
                + "<a  class=\"" + prv_status + "\" href=\"admin.jsp?alias=" + request.getParameter("alias") + "&page=" + prv + "\">"
                + "<li title=\".ui-icon-arrowthick-1-w\" class=\"ui-state-default ui-corner-all\">"
                + "<span class=\"ui-icon ui-icon-arrowthick-1-w\"></span></li></a>"
                + "<a class=\"" + next_status + "\" href=\"admin.jsp?alias=" + request.getParameter("alias") + "&page=" + next + "\">"
                + "<li title=\".ui-icon-arrowthick-1-e\" class=\"ui-state-default ui-corner-all\">"
                + "<span class=\"ui-icon ui-icon-arrowthick-1-e\"></span></li></a>"
                + "</ul>";



        return ReturnData;


    }

    private String do_update(HttpServletRequest request) {

        String dd = "";
        if (request.getParameter("th_status") != null) {

            String stat = request.getParameter("th_status");
            String[] st = stat.split("_");

            String[] retall = getIds(request);


            if (!st[0].equals("")) {



                if (st[1] != null && !st[1].equals("") && st != null && stat != null) {

                    String[] filds = request.getParameterValues("checkbox_" + st[1]);

                    int index = 0;

                    String value = "";

                    if (filds != null) {
                        for (int i = 0; i < retall.length; i++) {
                            index = -1;


                            index = getarray(filds, retall[i]);
                            if (index == 0) {
                                value = "0";
                            } else {
                                value = "1";

                            }

                          if (this.name.equalsIgnoreCase("styles")) {
                db.openCon();
            } else {

                db.openDBCon(   lib.Options.DbInfo.connectionStringDef);

            }
                            db.setUpdateValueNocon(this.name, st[1], value, "id=" + retall[i]);
                            db.closeCon();


                        }
                    }


//
                }
            }
        }






        return dd;


    }

    private int getarray(String[] myarray, String value) {

        int retdata = 0;

        for (int i = 0; i < myarray.length; i++) {
            if (myarray[i].equals(value)) {
                retdata = 1;
            }
        }

        return retdata;

    }

    private String[] getIds(HttpServletRequest request) {

        String all_ids = request.getParameter("all_ids");
        all_ids = all_ids.replace(",,", "");
        String[] ff = all_ids.split(",");


        return ff;

    }

    private String do_delete(HttpServletRequest request) {
        String returndata = request.getParameter("del_one");

        String retstat = "";
        if (request.getParameter("del_one") != null && request.getParameter("del_one") != "" && request.getParameter("del_one") != "-1") {

        if (this.name.equalsIgnoreCase("styles")) {
                db.openCon();
            } else {

                db.openDBCon(lib.Options.DbInfo.connectionStringDef);

            }

            retstat = db.setDeleteNocon(this.name, Integer.parseInt(returndata = request.getParameter("del_one")));
            db.closeCon();

            returndata = "";
            if (retstat.equals("")) {
                returndata += adminDeleteMessage + "<meta http-equiv=\"refresh\" content=\"0\"> ";
            } else {
                returndata += adminDeleteMessageError + " " + retstat + "<meta http-equiv=\"refresh\" content=\"0\"> ";
            }


        }



        return returndata;
    }

    private String do_deleteM(HttpServletRequest request) {
        String returndata = "";

        String retstat = "";

        String retstat2 = "";


        if (request.getParameter("status") != null) {


            if (request.getParameter("status").trim().equals("delet_m")) {

                String[] variable = request.getParameterValues("ids[]");


                for (int i = 0; i < variable.length; i++) {
                   if (this.name.equalsIgnoreCase("styles")) {
                db.openCon();
            } else {

                db.openDBCon(lib.Options.DbInfo.connectionStringDef);

            }

                    retstat = db.setDeleteNocon(this.name, Integer.parseInt(variable[i]));
                    db.closeCon();


                    if (retstat.equals("")) {
                        returndata += adminDeleteMessage + "<meta http-equiv=\"refresh\" content=\"0\"> ";

                    } else {
                        returndata += adminDeleteMessageError + " " + returndata + "<meta http-equiv=\"refresh\" content=\"0\"> ";
                        ;
                    }

                }

            } else if (request.getParameter("status").trim().equals("enable")) {

                String[] variable = request.getParameterValues("ids[]");
                for (int i = 0; i < variable.length; i++) {

                    String[][] data = {{"enable"}, {"1"}};

               if (this.name.equalsIgnoreCase("styles")) {
                db.openCon();
            } else {

                db.openDBCon(lib.Options.DbInfo.connectionStringDef);

            }
                    retstat2 = db.setUpdateNocon(this.name, data, Integer.parseInt(variable[i]));
                    db.closeCon();

                }
                returndata = "en";



            } else if (request.getParameter("status").trim().equals("disable")) {

                String[] variable = request.getParameterValues("ids[]");



                for (int i = 0; i < variable.length; i++) {


                    String[][] data = {{"enable"}, {"0"}};
                if (this.name.equalsIgnoreCase("styles")) {
                db.openCon();
            } else {

                db.openDBCon(lib.Options.DbInfo.connectionStringDef);

            }
                    retstat2 = db.setUpdateNocon(this.name, data, Integer.parseInt(variable[i]));
                    db.closeCon();
                }

                returndata = "dis";

            }
            returndata += "<meta http-equiv=\"refresh\" content=\"0\">";
        }
        return returndata;

    }

    private String do_javacript() {
        String returndata = "";

        returndata = ""
                + "<script type=\"text/javascript\">jsForList();</script>";


        return returndata;
    }
}
