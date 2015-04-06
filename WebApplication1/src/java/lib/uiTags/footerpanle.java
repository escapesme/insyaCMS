/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.uiTags;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author es
 */
public class footerpanle extends SimpleTagSupport {

 
      
    
    private String title = "";
    private String height = "";
    private String width = "";
    private String content = "";

    private String left = "";

    public void settitle(String title) {

        this.title = title;


    }

    public void setcontent(String content) {

        this.content = content;


    }

    public void setheight(String height) {

        this.height = height;


    }

    public void setwidth(String width) {

        this.width = width;


    }



    public void setleft(String left) {

        this.left = left;


    }

    /**
     * Called by the container to invoke this tag. 
     * The implementation of this method is provided by the tag library developer,
     * and handles all tag processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();

        try {

            
            
                 
          

            out.print(""
                    + "<div class=\"footer1\"style=\" width:" + this.width + ";width:" + this.height + "; left:" + this.left + " > "
                    + "<div class=\"label_footer label\">"+ this.title
                    + "<div class=\"close_footer tools_bt\"></div> </div>"
                    + "<div class=\"cont_body\">"+ this.content 
                    + "</div> </div>");
                    
                    
                    
        } catch (java.io.IOException ex) {
            throw new JspException("Error in form tag", ex);
        }
    }
}
