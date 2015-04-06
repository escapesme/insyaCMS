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
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import lib.engine.front.front;

/**
 *
 * @author es
 */
public class tabs extends SimpleTagSupport {

    private String type = "";
    private String content = "";
    private String name = "";
    private String module = "";
    private String myclass = "";

    public void setmyclass(String myclass) {
        this.myclass = myclass;
    }

    public void settype(String type) {
        this.type = type;
    }

    public void setcontent(String content) {

        this.content = content;


    }

    public void setname(String name) {

        this.name = name;


    }

    public void setmodule(String setmodule) {

        this.module = setmodule;


    }

    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();

        try {
            if (this.type.equals("head")) {

                out.print("<li  class=\" button " + this.myclass + "\" id=\"" + this.name + "\" class=\"act\">" + this.content);

                if (!this.module.equals("")) {
                    getmodule(this.module);
                };

                out.print("</li>");

            } else {

                out.print("  <div class=\"tabbody " + this.name + " " + this.myclass + "\">" + this.content);
                if (!this.module.equals("")) {
                    getmodule(this.module);
                };

                out.print("</div> ");
            }



        } catch (java.io.IOException ex) {
        }



    }

    private void getmodule(String po) {
        try {
            front Front = new front();
            PageContext pageContext = (PageContext) getJspContext();
            String[] returnData = Front.getThisModules((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse(), po);


            for (int x = 1; x < returnData.length; x++) {



                String m_link = "/" + returnData[x];


                //out.print("<textarea>"+m_link+"</textarea>");
                try {


                    pageContext.include(m_link);


                } catch (ServletException ex) {
                }
            }
        } catch (ServletException ex) {
        } catch (IOException ex) {
        }

    }
}
