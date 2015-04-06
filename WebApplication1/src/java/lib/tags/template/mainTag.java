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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.engine.front.front;
import java.io.IOException;
import javax.servlet.jsp.PageContext;

/**
 *
 * @author es
 */
public class mainTag extends SimpleTagSupport {

    private String createTagText(HttpServletRequest request, HttpServletResponse response) throws IOException, JspException {
        JspWriter out = getJspContext().getOut();
        front Front = new front();
        String returnData = "";
        try {

            returnData = Front.getThisCompopnent(request, response);




        } catch (ServletException ex) {
            Logger.getLogger(mainTag.class.getName()).log(Level.SEVERE, null, ex);
        }

        return returnData;
    }

    public void doTag() throws JspException, IOException {


        JspWriter out = getJspContext().getOut();
        PageContext pageContext = (PageContext) getJspContext();
        //   out.print(createTagText((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse()));


        try {

            front Front = new front();



            pageContext.include(createTagText((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse()));
            String style = Front.getThisPageMenu((HttpServletRequest) pageContext.getRequest(), "morecss");

            out.print(
                    "<style>" + style + "</style>");




            JspFragment f = getJspBody();
            if (f != null) {
                f.invoke(out);
            }
        } catch (ServletException ex) {
            Logger.getLogger(mainTag.class.getName()).log(Level.SEVERE, null, ex);
        } catch (java.io.IOException ex) {
            throw new JspException("Error in maintag tag", ex);
        }
    }
}
