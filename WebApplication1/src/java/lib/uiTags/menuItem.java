/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.uiTags;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author es
 */
public class menuItem extends SimpleTagSupport {

    private String href = "";
    private String title = "";
    private String myclass = "";

    public void setmyclass(String myclass) {
        this.myclass = myclass;
    }

    public void sethref(String href) {
        this.href = href;




    }

    public void settitle(String title) {
        this.title = title;




    }

    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();




        try {

            out.print("<li class=\" button " + this.myclass + "\"><a href=\"" + this.href + "\">" + this.title + "</a></li>");



        } catch (java.io.IOException ex) {
        }
    }
}
