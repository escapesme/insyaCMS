/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tags.admin;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author es
 */
public class moduletitle extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        try {
            PageContext pageContext = (PageContext) getJspContext();
            out.print(pageContext.getRequest().getParameter("title"));
        } catch (java.io.IOException ex) {
        }
    }
}
