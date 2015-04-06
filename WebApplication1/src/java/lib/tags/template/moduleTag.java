/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tags.template;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.PageContext;   
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.engine.front.front;
import java.io.IOException;
      

/**
 *
 * @author es
 */
public class moduleTag extends SimpleTagSupport {

    private String position;

    public void setposition(String position) {
        this.position = position;
    }
    front Front = new front();

    private String[] createTagText(HttpServletRequest request, HttpServletResponse response, String mypo) throws IOException, JspException {

     
        
        
        String[] returnData = null;

        try {


            returnData = Front.getThisModules(request, response, mypo);


        } catch (ServletException ex) {
            Logger.getLogger(moduleTag.class.getName()).log(Level.SEVERE, null, ex);
        }

        return returnData;



        //out.print(request.getParameter("alias"));
    }

    @Override
    public void doTag() throws JspException {
        
        
        
        

        JspWriter out = getJspContext().getOut();

        try {

            PageContext pageContext = (PageContext) getJspContext();

            String[] returnData = createTagText((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse(), this.position);


            
            
          
            
            for (int x = 1; x < returnData.length; x++) {

                String m_link = "/" + returnData[x];
                
                
             //out.println(m_link);
                try {
                    pageContext.include(m_link);
                        
                    
                } catch (ServletException ex) {
                    Logger.getLogger(moduleTag.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            // out.print("<script type=\"text/javascript\" src=\"" + map.gettemplatesFolder()+"/"+ templateName+"/"+ this.foldername + "/" + this.filename + ".js\" ></script>");
        } catch (java.io.IOException ex) {
            throw new JspException("Error in importcss tag", ex);
        }



        
        
        
        
        

    }
}
