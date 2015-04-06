/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tags.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author es
 */
public class adminMenu extends SimpleTagSupport implements lib.Options.MyVariables {

  lib.engine.db.operations DB = new lib.engine.db.operations();

    /**
     * Called by the container to invoke this tag. 
     * The implementation of this method is provided by the tag library developer,
     * and handles all tag processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();



        try {
            String returndata = "";

                String img=adminTemplatesFolder+ "/blue/css/image/tabs.gif";
            returndata += ""
                    + "<div class=\"adminbar\">"

                    + "<div class=\"spliter\"></div>" +
                    "<div class=\"menublock\">"
                    + "<img src=\""+img+"\" class=\"icon\" />Install"+getinstall()
                    + ""
                    + "</div>"
                    + "<div class=\"menublock\">"
                    + "<img src=\""+img+"\" class=\"icon\" />Menus";
                     returndata += getmenus() + "</div>"
                    + "<div class=\"menublock\">"
                    + "<img src=\""+img+"\" class=\"icon\" /> Users"
                    + ""
                    + "</div>"
                    + "<div class=\"menublock\">"
                    + "<img src=\""+img+"\" class=\"icon\" />content"
                    + ""
                    + "</div>"
                    + "<div class=\"menublock\"  ><img src=\""+img+"\" class=\"icon\" />Extensions" + getEX() + "</div></div>";

            out.print(returndata);


        } catch (java.io.IOException ex) {
        }
    }
   
    
    private String getinstall() {
    
    
        String returndata = "<div class=\"adminSubMenu\">";
    
    returndata += "<li><img href=\"\" ><a href=\"admin.jsp?alias=def_install\" />Install component</a></li>";
       returndata += "<li><img href=\"\" ><a href=\"admin.jsp?alias=def_install\" />Install module</a></li>";
          returndata += "<li><img href=\"\" ><a href=\"admin.jsp?alias=def_install\" />Install Template</a></li>";
           returndata += "<li><img href=\"\" ><a href=\"admin.jsp?alias=def_install\" />Install plugin</a></li>";

          return returndata + "</div>";
          
          
    }


    private String getEX() {

        String returndata = "<div class=\"adminSubMenu\">";
    DB.openDBCon(lib.Options.DbInfo.connectionStringDef);
     
        ResultSet res = DB.getData("def_install","*", "enable <>0 and type='com'");
        try {
            while (res.next()) {

                String img=adminTemplatesFolder+ "/blue/css/image/tabs.gif";
                returndata += "<li><img href=\""+img+"\" ><a href=\"admin.jsp?alias=" + res.getString("th_alias") + "\">" + res.getString("title") + "</a></li>";

            }
        } catch (SQLException ex) {
            Logger.getLogger(adminMenu.class.getName()).log(Level.SEVERE, null, ex);

        }



        DB.closeCon();

        return returndata + "</div>";


    }

    private String getmenus() {
        
        

        String returndata = "<div class=\"adminSubMenu\">";

        DB.openDBCon(lib.Options.DbInfo.connectionStringDef);
        ResultSet res = DB.getData("def_menus", " enable <> 0");
        try {
            while (res.next()) {

                returndata += "<li ><a href=\"admin.jsp?alias=def_menusitems&parent_id=" + res.getString("id") + "&cat_id=0\">" + res.getString("title") + "</a></li>";

            }
        } catch (SQLException ex) {
            Logger.getLogger(adminMenu.class.getName()).log(Level.SEVERE, null, ex);

        }



        DB.closeCon();

        return returndata + "</div>";


    }
}
