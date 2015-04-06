/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lib.tags.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
//import org.apache.catalina.connector.Request;

/**
 *
 * @author es
 */
public class adminMenuCom extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. 
     * The implementation of this method is provided by the tag library developer,
     * and handles all tag processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
   PageContext pageContext = (PageContext) getJspContext();
      lib.engine.db.operations DB= new  lib.engine.db.operations();
        try {

            
       DB.openDBCon(lib.Options.DbInfo.connectionStringDef);
                out.print("<div><ul>");
         ResultSet rs=   DB.getData("def_install",""," type='com' and enable=1 ");
                
                 
                 String morlink="";
              if (pageContext.getRequest().getParameter("parent_id")!=null){
             morlink+="&parent_id="+pageContext.getRequest().getParameter("parent_id");
              
              }    
                       
          if (pageContext.getRequest().getParameter("cat_id")!=null){
             morlink+="&cat_id="+pageContext.getRequest().getParameter("cat_id");
              
              } 
          
            String linny="?alias="+ pageContext.getRequest().getParameter("alias")+morlink+"&link_type=link&show=add";
         
     
          
          out.print("<li><a href=\""+linny+"\" >Normal Link</a></li>");
         
         while (rs.next()){
              String lin="?alias="+ pageContext.getRequest().getParameter("alias")+morlink+"&link="+rs.getString("th_alias")+"&show=add";
             out.print("<li><a href=\""+lin+"\" > "+rs.getString("title")+"</a></li>");
             
         }    
         
         out.print("j</div></ul>");
         
         
         
              DB.closeCon();
            JspFragment f = getJspBody();
            if (f != null) f.invoke(out);

            // TODO: insert code to write html after writing the body content.
            // e.g.:
            //
            // out.println("    </blockquote>");

        } catch (SQLException ex) {
           // Logger.getLogger(adminMenuCom.class.getName()).log(Level.SEVERE, null, ex);
        } catch (java.io.IOException ex) {
            throw new JspException("Error in adminMenuCom tag", ex);
        }
    }

}
