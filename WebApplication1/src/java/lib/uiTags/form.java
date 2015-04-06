/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.uiTags;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import lib.engine.front.front;

/**
 *
 * @author es
 */
public class form extends SimpleTagSupport {

    private String title = "";
    private String height = "";
    private String width = "";
    private String content = "";
    private String top = "";
    private String left = "";
    private String module = "";
    private String myClass = "";

    public void setmyClass(String myClass) {

        this.myClass = myClass;


    }

    public void setmodule(String module) {

        this.module = module;


    }

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

    public void settop(String top) {

        this.top = top;


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


             if (!this.module.equals("")) {
                getmodule(this.module);
                
                 out.print("<script>  $(function(){var ss=$(\".allString_"+this.module+"\").html(); $(\".allString_"+this.module+"\").html(\"\");   makeWinDows(\"" + this.title + "\", \"" + this.myClass + "\" ,ss, " + this.top + ", " + this.left + "," + this.width + ", " + this.height + "  );});</script>");
          
            }else{
             
             
         //    out.print("<script>  $(function(){    makeWinDows(\"" + this.title + "\", \"" + this.myClass + "\" ,"thid", " + this.top + ", " + this.left + "," + this.width + ", " + this.height + "  );});</script>");
          
             
             }
           

       

        } catch (java.io.IOException ex) {
            throw new JspException("Error in form tag", ex);
        }
    }

    private void getmodule(String po) {
        try {
            front Front = new front();
            PageContext pageContext = (PageContext) getJspContext();
            String[] returnData = Front.getThisModules((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse(), po);

JspWriter out = getJspContext().getOut();

out.print("<div style=\"display:none\" class=\"allString_"+po+"\" > ");

            for (int x = 1; x < returnData.length; x++) {



                String m_link = "/" + returnData[x];
               
              out.print(m_link);

           try {


              pageContext.include(m_link);


              } catch (ServletException ex) {
                    out.print(ex.getMessage());
                }
             
             
             
            }


out.print("</div>");

        } catch (ServletException ex) {
        } catch (IOException ex) {
        }

    }
}
