/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.engine.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.Options.XMLDataModel;
import lib.engine.db.operations;
import lib.engine.foldersMap;
/*
//import javax.servlet.annotation.WebServlet;
/*import javax.servlet.RequestDispatcher;
import javax.servlet.RequestDispatcher;
import java.util.*;
import lib.engine.foldersMap;
 */

/**
 *
 * @author es
 */
public class adminc extends HttpServlet implements lib.Options.MyVariables {

    operations db = new operations();
    foldersMap mab = new foldersMap();

    private String getGetValue(HttpServletRequest request, String value) throws ServletException, IOException {
        return request.getParameter(value);
    }

    private String getPostValue(HttpServletRequest request, String value) throws ServletException, IOException {
        return request.getParameter(value);
    }

    public String getThisPageMenu(HttpServletRequest request, String filedName) throws ServletException, IOException {

        db.openDBCon(lib.Options.DbInfo.connectionStringDef);
        String returnData = db.getValueNocon("def_menusitems", filedName, " th_alias='" + this.getGetValue(request, mab.getUrlAlias()) + "'");

        db.closeCon();
        return returnData;
    }

    public String getThisTemplate(HttpServletRequest request) throws ServletException, IOException {
        String returnData = "";
        db.openDBCon(lib.Options.DbInfo.connectionStringDef);
        returnData = db.getValueNocon(XMLDataModel.DEF_TEMPLATES_TABLENAME, "th_alias", "enable=1 and type='admin'");
        db.closeCon();
        return returnData;
    }

    
    
    
    
    
    
    
    public String getThisCompopnent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        db.openDBCon(lib.Options.DbInfo.connectionStringDef);
       
 String returnData = db.getValueNocon(XMLDataModel.DEF_INSTALL_TABLENAME, "th_alias", "th_alias='" + this.getGetValue(request, "alias") + "'");


        String DefFile = "index";
        if (this.getGetValue(request, showFile) != null && this.getGetValue(request, showFile) != "") {
            
            DefFile = this.getGetValue(request, showFile);
        }

        if (returnData.equals("")) {
            returnData = "def_home";
        }

        String mylink = "/" + adminFolder + "/" + returnData + "/" + DefFile + ".jsp";

        db.closeCon();




        return mylink;
    }
    foldersMap map = new foldersMap();

    public String[] getThisModules(HttpServletRequest request, HttpServletResponse response, String position) throws ServletException, IOException {
        String menu_id = getThisPageMenu(request, "id");

        String moduleData = "";
        db.openDBCon(lib.Options.DbInfo.connectionStringDef);
        String[] returnData = db.getColumnNOCON("def_menurel", "ex_id", " menu_id=" + menu_id + " and ex_type='mod'");
        db.closeCon();

        //PrintWriter out = response.getWriter();

        String temp = this.getThisTemplate(request);

        for (int i = 0; i < returnData.length; i++) {

            //int mod_num = db.getRowCount("def_modules", "id", "id=" + returnData[i] + " and position='" + position + "'");
            String[] modData = db.getRow("def_modules", "id=" + returnData[i] + " and position='" + position + "'");
            String returnData2 = db.getValue("def_install", "alias", "id=" + modData[2]);


            if (modData[0] != null) {
                moduleData += ";" + map.getTemplatesFolder() + "/" + temp + "/classes/" + modData[4] + ".jsp?type=" + returnData2 + "&title=" + modData[1] + "&properties=" + modData[9];
            }



        }




        String[] s_array = moduleData.split(";");




        return s_array;



    }
}
