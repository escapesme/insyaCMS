/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lib.engine.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author es
 */
public class AdminModuleGetMenu extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. 
     * The implementation of this method is provided by the tag library developer,
     * and handles all tag processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();

        try {
       
           lib.engine.db.operations db= new   lib.engine.db.operations ();
      
            db.openCon();
           
          ResultSet res= db.getData("def_menus");
            try {
                while(res.next()){
               
                    out.print("<script>$(function(){ $(.form_apply).click("
                            + "function(){"
                            + "$(admin_menu_form).submit();"
                            + "} })"
                            + "</script><form id=\"admin_menu_form\" method=\"post\" name=\"menu_app\" action=\"\">"
                            + "<select name=\"drop1\" id=\"Select1\" size=\"4\" multiple=\"multiple\">");
                       out.print("<option value=\"-1\">"+res.getString("title")+"</option>");
                       
                       
                       
                   
                    
                        ResultSet res_m= db.getData("def_menusitems" ,"*","id="+res.getString("id") );
                       
                        while(res_m.next()){
                        
                    
                            out.print("<option value=\""+ res_m.getString("id")+"\">>>"+res_m.getString("title")+"</option>");
                        
                        }
                        
                           out.print("</select></form>");
                        
                        

   
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    
                    
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminModuleGetMenu.class.getName()).log(Level.SEVERE, null, ex);
            }
          
           
           db.closeCon();

        } catch (java.io.IOException ex) {
           
        }
    }

}
