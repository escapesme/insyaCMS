/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tags.admin;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;

import javax.servlet.jsp.JspException;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.PageContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;

/**
 *
 * @author es
 */
public class adminStructure extends SimpleTagSupport {
    

    private String createTagText(HttpServletRequest request, HttpServletResponse response) throws IOException, JspException {
        lib.engine.admin.AdminStructure pageStructure = new lib.engine.admin.AdminStructure();

        JspWriter out = getJspContext().getOut();
        String returnData = "";
        try {
            returnData = pageStructure.processRequest(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(adminStructure.class.getName()).log(Level.SEVERE, null, ex);
        }
        return returnData;

    }

    @Override
    public void doTag() throws JspException, IOException {


        PageContext pageContext = (PageContext) getJspContext();

        // JspWriter out = getJspContext().getOut();

        // out.print(createTagText((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse()));         

        createTagText((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse());
    }
}
