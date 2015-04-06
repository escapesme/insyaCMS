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
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.PageContext;


import javax.servlet.http.HttpServletRequest;

import lib.engine.front.front;
import java.io.IOException;

/**
 *
 * @author esinclude
 */
public class importcss extends SimpleTagSupport {

    private String filename = "style";
    private String foldername = "css";

    public void setFilename(String filename) {

        this.filename = filename;



    }

    public void setFoldername(String foldername) {


        this.foldername = foldername;



    }

    private String createTagText(HttpServletRequest request) throws IOException, JspException {
        JspWriter out = getJspContext().getOut();
        front Front = new front();
        String returnData = "";
        try {
            returnData = Front.getThisTemplate(request);
        } catch (ServletException ex) {
            Logger.getLogger(importcss.class.getName()).log(Level.SEVERE, null, ex);
        }


        return returnData;        //out.print(request.getParameter("alias"));
    }

    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();

        try {
          
            PageContext pageContext = (PageContext) getJspContext();
        lib.engine.foldersMap map=new lib.engine.foldersMap();
            JspFragment f = getJspBody();
            if (f != null) {
                f.invoke(out);
            }
            String templateName=createTagText((HttpServletRequest)pageContext.getRequest());
            out.print("<link rel=\"stylesheet\" href=\"" + map.getTemplatesFolder()+"/"+ templateName+"/"+ this.foldername + "/" + this.filename + ".css\" type=\"text/css\"  />");
        } catch (java.io.IOException ex) {
            throw new JspException("Error in importcss tag", ex);
        }
    }
}
