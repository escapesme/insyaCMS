/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tags.admin;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author es
 */
public class adminBody extends SimpleTagSupport {

    private String mode = "";
    private String list = "";
    private String name = "";
    private String title = "";
    private String size = "";
    private String parents = "";
    private String categories = "";
    private String morefields = "";

    public void setsize(String size) {
        this.size = size;

    }

    public void setmode(String mode) {
        this.mode = mode;

    }

    public void setmorefields(String morefields) {
        this.morefields = morefields;

    }

    public void setcategories(String categories) {
        this.categories = categories;

    }

    public void setparents(String parents) {
        this.parents = parents;

    }

    public void setlist(String list) {
        this.list = list;

    }

    public void setname(String name) {
        this.name = name;

    }

    public void settitle(String title) {
        this.title = title;

    }

    @Override
    public void doTag() throws JspException {


        try {
            PageContext pageContext = (PageContext) getJspContext();
            lib.engine.admin.Control cont = new lib.engine.admin.Control(this.mode, this.list, this.name, this.title, this.categories, this.parents, this.morefields, this.size);
            JspWriter out = getJspContext().getOut();
            out.print(cont.getControl((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse()));





        } catch (ServletException ex) {
        } catch (java.io.IOException ex) {
            throw new JspException("Error in adminBody tag", ex);
        }
    }
}
