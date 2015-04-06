/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lib.tags.admin;


import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author es
 */
public class modulebody extends SimpleTagSupport {
    @Override
    public void doTag() throws JspException  , IOException  { 
        JspWriter out = getJspContext().getOut();

       try {
   
            PageContext pageContext = (PageContext) getJspContext();
          
   String ff="/modules/" + pageContext.getRequest().getParameter("type") + "/index.jsp?properties="+ pageContext.getRequest().getParameter("properties") ; 
    

   

          
   
 
  pageContext.include(ff);
      } catch (ServletException ex) {
         
        } catch (java.io.IOException ex) {
           
        }
    }

}
