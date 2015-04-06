/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.Options.XMLDataModel;
import lib.engine.db.operations;
import lib.engine.foldersMap;

/**
 *
 * @author es
 */
public class front extends HttpServlet implements lib.Options.MyVariables {

    operations db = new operations();
    foldersMap mab = new foldersMap();

    private String getGetValue(HttpServletRequest request, String value) throws ServletException, IOException {
        return request.getParameter(value);
    }

    private String getPostValue(HttpServletRequest request, String value) throws ServletException, IOException {
        return request.getParameter(value);
    }

    public String getThisPageMenu(HttpServletRequest request, String filedName) throws ServletException, IOException {

        String returnData = "";
        db.openDBCon(lib.Options.DbInfo.connectionStringDef);
        
        
        
        if (this.getGetValue(request, urlAlias) == null || this.getGetValue(request, urlAlias).equals("")) {

            returnData = db.getValueNocon(XMLDataModel.DEF_MENUSITEMS_TABLENAME, filedName, "home='1'");


        } else {

            returnData = db.getValueNocon(XMLDataModel.DEF_MENUSITEMS_TABLENAME, filedName, " th_alias='" + this.getGetValue(request, urlAlias) + "'");


        }
        db.closeCon();

        /*  PrintWriter out = response.getWriter();
        out.print(Arrays.deepToString(returnData));*/
        return returnData;
    }

    public String getThisTemplate(HttpServletRequest request) throws ServletException, IOException {
        // String menu_id = getThisPageMenu(request, "id");
        String template_id = getThisPageMenu(request, "template");
        String returnData = template_id;

        //   db.getValue("def_menurel", "ex_id", "menu_id=" + menu_id + " and ex_type='temp'");







        db.openDBCon(lib.Options.DbInfo.connectionStringDef);




        if (template_id.equals("0")) {


            returnData = db.getValueNocon(XMLDataModel.DEF_TEMPLATES_TABLENAME, "th_alias", " enable=1 and type='fornt'");
        } else {


            returnData = db.getValueNocon(XMLDataModel.DEF_TEMPLATES_TABLENAME, "th_alias", "id=" + template_id);
            if (returnData.equals("")) {
                returnData = db.getValueNocon(XMLDataModel.DEF_TEMPLATES_TABLENAME, "th_alias", " enable=1 and type='fornt'");
            }
        }
        db.closeCon();
        return returnData;
    }

    public String getThisCompopnent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String menu_id = getThisPageMenu(request, "link");

        String properties = getThisPageMenu(request, "properties");


        String DefFile = "index";
        if (this.getGetValue(request, mab.getShowFile()) != null && this.getGetValue(request, mab.getShowFile()) != "") {
            DefFile = this.getGetValue(request, mab.getShowFile());
        }



        String mylink = "/" + mab.getfrontFolder() + "/" + menu_id + "/" + DefFile + ".jsp?properties=" + properties + "-" + request.getParameter("pro_id");





        return mylink;
    }
    foldersMap map = new foldersMap();

    public String[] getThisModules(HttpServletRequest request, HttpServletResponse response, String position) throws ServletException, IOException {
        String menu_id = getThisPageMenu(request, "id");

        String moduleData = "";

        // String[] returnData = db.getColumn("def_menurel", "ex_id", " menu_id=" + menu_id + " and ex_type='mod'");
        //  String[] returnpro= db.getColumn("def_menurel", "ex_properties", " menu_id=" + menu_id + " and ex_type='mod'");



        PrintWriter out = response.getWriter();
        String temp = this.getThisTemplate(request);
        try {




            db.openDBCon(lib.Options.DbInfo.connectionStringDef);
            ResultSet rs = db.getData("def_menurel", "*", "menu_id=" + menu_id + " and ex_type='mod'");

            while (rs.next()) {
                String[] modData = db.getRowNocon(XMLDataModel.DEF_MODULES_TABLENAME, "id=" + rs.getString("ex_id") + " and position='" + position + "' and showinall=0 and  enable=1");
                String returnData2 = db.getValueNocon(XMLDataModel.DEF_INSTALL_TABLENAME, "th_alias", "id=" + modData[8]);
              
               
                
                if (modData[0] != null) {
                    moduleData += ";" + map.getTemplatesFolder() + "/" + temp + "/classes/" + modData[4] + ".jsp?type=" + returnData2 + "&title=" + modData[1] + "&properties=" + rs.getString("ex_properties");

                }

            }
            db.closeCon();








    

            db.openDBCon(lib.Options.DbInfo.connectionStringDef);

            ResultSet rs2 = db.getData("def_modules", "*", " position='" + position + "' and showinall=1 and  enable=1");
            

            while (rs2.next()) {


                String returnData2 = db.getValueNocon("def_install", "th_alias", "id=" + rs2.getString("type"));

                moduleData += ";" + map.getTemplatesFolder() + "/" + temp + "/classes/" + rs2.getString("class") + ".jsp?type=" + returnData2 + "&title=" + rs2.getString("title") + "&properties=" + rs2.getString("properties");
            }


            db.closeCon();




        } catch (SQLException ex) {
        }
        String[] s_array = moduleData.split(";");
        return s_array;



    }
}
