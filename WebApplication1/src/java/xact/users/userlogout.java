/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author es
 */
public class userlogout extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. 
     * The implementation of this method is provided by the tag library developer,
     * and handles all tag processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();


        xact.users.users us = new xact.users.users();
        PageContext pageContext = (PageContext) getJspContext();
        us.userlogout((HttpServletRequest) pageContext.getRequest());


    }
}
