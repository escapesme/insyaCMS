/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tags.admin;


import javax.servlet.ServletException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.engine.admin.adminc;
import java.io.IOException;
import javax.servlet.jsp.PageContext;

/**
 *
 * @author es
 */
public class adminmian extends SimpleTagSupport {

    private String  createTagText(HttpServletRequest request, HttpServletResponse response) throws IOException, JspException {
      
        adminc Front = new adminc();
        String returnData="";
        try {
        
           returnData = Front.getThisCompopnent(request, response);
        
        } catch (ServletException ex) {
            //Logger.getLogger(mainTag.class.getName()).log(Level.SEVERE, null, ex);
        }

      return returnData;
    }

    public void doTag() throws JspException, IOException {

  JspWriter out = getJspContext().getOut();
     
          PageContext pageContext = (PageContext) getJspContext();
        try {
          
   //out.print(createTagText((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse()));
      
      
      
      pageContext.include(createTagText((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse()));
      

       
        } catch (ServletException ex) {
           // Logger.getLogger(mainTag.class.getName()).log(Level.SEVERE, null, ex);
            out.print(ex.getMessage());
        } catch (java.io.IOException ex) {
           // throw new JspException("Error in maintag tag", ex);
        }
    }
}
