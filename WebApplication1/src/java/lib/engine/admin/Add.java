/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.admin;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.w3c.dom.*;
import lib.tools.forms;
import lib.engine.db.operations;

import lib.engine.db.operations;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;

/**
 *
 * @author es
 */
public class Add extends HttpServlet implements lib.Options.MyVariables {

    String name = "";
    String title = "";
    forms form = new forms();
    operations DB = new operations();
    String categories = "";
    String parents = "";
    String morefields = "";

    public Add(String name, String title, String categories, String parents, String morefields) {
        this.name = name;
        this.title = title;
        this.categories = categories;
        this.parents = parents;
        this.morefields = morefields;
    }

    protected String getData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        //String moreWhere="";
        String morelink = "";

        if (this.parents.equals("true")) {

            morelink = "&parent_id=" + request.getParameter("parent_id");

        }

        if (this.categories.equals("true")) {

            morelink += "&cat_id=" + request.getParameter("cat_id");

        }


        String XmlFile = siteUrl + adminFolder + "/" + this.name + "/mod_properties.xml";


        lib.tools.xml.readingXml getxml = new lib.tools.xml.readingXml(XmlFile, "field");
        NodeList Fildes = getxml.getListTags();

        String topbar = "<div class=\"window-default\"> "
                + "<div class=\"admin_list_title\">" + this.title
                + "<div class=\"btd_clos button\">"
                + "<li class=\" \" title=\"\"><span class=\"ui-icon ui-icon-close\"></span></li>"
                + "</div><div class=\"btd_max button\">"
                + "<li class=\"ui-state-default ui-corner-all\" title=\"\"><span class=\"ui-icon ui-icon-newwin\"></span></li>"
                + "</div>"
                + "<div class=\"btd_min button\">"
                + "<li class=\"ui-state-default ui-corner-all\" title=\"\"><span class=\"ui-icon ui-icon-minus\"></span></li>"
                + "</div></div>"
                + "<div class=\"admin_list_tools dark_bg\">"
                + "<ul id=\"icons\" >"
                + "<li title=\".ui-icon-arrowreturnthick-1-\" class=\"ui-state-default ui-corner-all\">"
                + "<a href=\"admin.jsp?alias=" + request.getParameter("alias") + morelink + " \"><span class=\"ui-icon ui-icon-arrowreturnthick-1-w\"></span></a></li>"
                + "<li title=\".ui-icon-arrowreturnthick-1-\" class=\"ui-state-default ui-corner-all\"><span class=\"ui-icon ui-icon-circle-plus form_apply\"></span></li>"
                + "<li title=\".ui-icon-arrowreturnthick-1-\" class=\"ui-state-default ui-corner-all\"><span class=\"ui-icon ui-icon-disk\"></span></li>"
                + "</ul></div>";


        return do_javacript() + topbar + craetData(Fildes, request);


    }

    private String craetData(NodeList Fildes, HttpServletRequest request) {
        String returnData = "";

        returnData += getform("form", "", "multipart/form-data", "post", "", "", "", "", "", "", "", "", "", "");
        for (int s = 0; s < Fildes.getLength(); s++) {


            // 
            String type = (String) this.retrnattr(Fildes, s, "type");
            String[] filds = {"text", "editor", "number", "autocomplete", "date", "time", "password", "checkbox", "textarea", "select", "radio", "upload", "pic", "label", "hidden", "image", "color", "line"};
            for (int i = 0; i < filds.length; i++) {
                if (type.equals(filds[i])) {
                    type = filds[i];
                }
            }


            returnData += getform(type, this.retrnattr(Fildes, s, "name"), "", "", this.retrnattr(Fildes, s, "class"), this.retrnattr(Fildes, s, "title"),
                    this.retrnattr(Fildes, s, "selectQuery"),
                    this.retrnattr(Fildes, s, "selectDataTable"),
                    this.retrnattr(Fildes, s, "selectTexttField"),
                    this.retrnattr(Fildes, s, "selectValueField"),
                    this.retrnattr(Fildes, s, "selectData"),
                    this.retrnattr(Fildes, s, "required"),
                    this.retrnattr(Fildes, s, "data"),
                    this.retrnattr(Fildes, s, "selectDataWhere"));


        }


        String moreWhere = "";
        String st = "";

        if (this.parents.equals("true")) {

            moreWhere = getform("hidden", "parent_id", request.getParameter("parent_id"), "", "", "", "", "", "", "", "", "", "", "");
            st = "";

        }
        if (this.categories.equals("true")) {

            moreWhere += getform("hidden", "cat_id", request.getParameter("cat_id"), "", "", "", "", "", "", "", "", "", "", "");
            st = "";
        }


        returnData += this.morefields + moreWhere + getform("hidden", "add_submit", "save", "", "", "", "", "", "", "", "", "", "", "");
        returnData += getform("end_from", "", "", "", "", "", "", "", "", "", "", "", "", "");


        returnData += do_save(request) + "</div>";
        return returnData;

    }

    private String getform(String type, String name, String value, String method, String myclass, String title,
            String selectQuery, String selectDataTable, String selectTexttField, String selectValueField, String selectData, String required, String data, String selectDataWhere) {

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
        form.selectDataWhere = selectDataWhere;

        return form.getForm();
    }

    private String retrnattr(NodeList Fildes, int num, String attr) {
        String returnData = "";
        Node returnDatan = Fildes.item(num);
        if (returnDatan.getNodeType() == Node.ELEMENT_NODE) {
            Element getattr = (Element) returnDatan;
            returnData = (String) getattr.getAttribute(attr);
        }
        return returnData;
    }

    private String do_save(HttpServletRequest request) {
        String selext = "";
        String text_ret = "";
        String return_data = "";
        String getprNames = "fr";
        String getprvalues = "fr";
        String FileServerPath = "\\images\\uploads\\";
        String mod_options = ";";
        String com_options = ";";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
        } else {


            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);



            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();

            while (itr.hasNext()) {

                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();

                    String[] supname = item.getFieldName().split("@@");

                    if (supname[0].equals("menus_options")) {
                        com_options += "," + supname[1] + "@@" + value;



                    } else if (supname[0].equals("module_options")) {
                        mod_options += "," + supname[1] + "@@" + value;



                    } else if (!"page".equals(name) && !"admin_module_menu".equals(name) && !"th_id".equals(name) && !"add_submit".equals(name) && !"alias".equals(name) && !"show".equals(name)) {

                        xact.users.users us = new xact.users.users();

                        if (name.equals("password")) {
                            value = us.hash(value);
                        }
                        getprNames += ";" + name;
                        getprvalues += ";" + value;
                    } else if ("admin_module_menu".equals(name)) {


                        selext += "," + value;


                    }

                } else {
                    try {
                        String itemName = item.getName();

                        String name = item.getFieldName();

                        getprNames += ";" + name;
                        getprvalues += ";" + itemName;
                        File savedFile = new File(sitePath + FileServerPath + itemName);
                        item.write(savedFile);
                        //  returnData += "<tr><td><b>Your file has been saved at the loaction:</b></td></tr><tr><td><b>" + sitePath + "uploadedFiles" + "\\" + itemName + "</td></tr>";
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }





            }









            com_options = com_options.replace(";,", "");
            mod_options = mod_options.replace(";,", "");


            if (!com_options.equals("") && !com_options.equals(";")) {
                getprNames += ";properties";

                getprvalues += ";" + com_options;
                //  text_ret="com"+com_options;

            } else if (!mod_options.equals("") && !mod_options.equals(";")) {
                getprNames += ";properties";
                getprvalues += ";" + mod_options;
                // text_ret="mod"+com_options;

            } else {

                getprNames += ";properties";
                getprvalues += ";id@@-1";
            }








            getprNames = getprNames.replace("fr;", "");

            String[] filds = getprNames.split(";");

            getprvalues = getprvalues.replace("fr;", "");

            String[] values = getprvalues.split(";");





            String[][] inputdata = {filds, values};




            int inmode = 1;
            if (this.name.equalsIgnoreCase("styles")) {
                DB.openCon();
            } else {

                DB.openDBCon(lib.Options.DbInfo.connectionStringDef);

            }



            return_data += DB.setInsertNocon(this.name, inputdata);
            DB.closeCon();

            if (inmode == 1) {

                if (!selext.equals("")) {
                    return_data += this.updateMenu(";" + selext, mod_options);
                }
                return_data += adminAddMessage;

            } else {

                return_data += adminAddMessageError;

            }
        }


//return_data += Arrays.deepToString(inputdata);
        return return_data + text_ret;

    }

    private String updateMenu(String value, String pro) {

        value = value.replace(";,", "");

        pro = pro.replace(";,", "");

        String[] Sp = value.split(",");



        lib.engine.db.operations db = new lib.engine.db.operations();
        for (int i = 0; i < Sp.length; i++) {
            DB.openDBCon(lib.Options.DbInfo.connectionStringDef);
            String ex_id = DB.getValueNocon(this.name, "max(id)", "");

            DB.closeCon();

            if (!Sp[i].equals("-1")) {

                if (!pro.equals("") && !pro.equals(";")) {

                    String[][] data = {{"menu_id", "ex_id", "ex_type", "ex_properties"}, {Sp[i], ex_id, "mod", pro}};
                    value = db.setInsert("def_menurel", data);
                } else {
                    String[][] data = {{"menu_id", "ex_id", "ex_type"}, {Sp[i], ex_id, "mod"}};
                    value = db.setInsert("def_menurel", data);
                }



            }
        }

        return value;



    }

    private String getmyper(String retname, HttpServletRequest request) {


        String return_data = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
        } else {


            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);



            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();

            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();
                    if (name.equals(retname)) {
                        return_data += value;


                    }

                }





            }


        }
        return return_data + "";

    }

    private String do_javacript() {
        String returndata = "";

        returndata = "<script type=\"text/javascript\">jsEditAndDelete();</script>";


        return returndata;
    }
}
