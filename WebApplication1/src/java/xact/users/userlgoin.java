/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact.users;

import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import net.sf.javainetlocator.InetAddressLocatorException;

/**
 *
 * @author es
 */
public class userlgoin extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException {
        xact.users.users us = new xact.users.users();
        PageContext pageContext = (PageContext) getJspContext();
        try {
            try {
                us.userLogin((HttpServletRequest) pageContext.getRequest());
            } catch (ParseException ex) {
                Logger.getLogger(userlgoin.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (InetAddressLocatorException ex) {
            Logger.getLogger(userlgoin.class.getName()).log(Level.SEVERE, null, ex);
        }


    }
}
