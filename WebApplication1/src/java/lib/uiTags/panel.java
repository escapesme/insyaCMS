/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.uiTags;

import java.io.IOException;
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
import lib.engine.front.front;

/**
 *
 * @author es
 */
public class panel extends SimpleTagSupport implements lib.Options.MyVariables {

    private String module = "";
    private String position = "";
    private String title = "";
    private String height = "";
    private String width = "";
    private String content = "";
     private String add = "";
    private String positionX = "";
    private String positionY = "";
    private String myClass = "";
    private String addNewButton = "";

    public void setmyClass(String myClass) {

        this.myClass = myClass;

    }
 public void setAdd(String add) {

        this.add = add;

    }
    
    public void setaddNewButton(String addNewButton) {
        this.addNewButton = addNewButton;
    }

    public void setpositionX(String positionX) {

        this.positionX = positionX;

    }

    public void setmodule(String module) {

        this.module = module;

    }

    public void setposition(String position) {

        this.position = position;

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

    public void setpositionY(String positionY) {

        this.positionY = positionY;

    }

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException, IOException {

        JspWriter out = getJspContext().getOut();

        try {
            if (this.position == "bottom") {
                out.print("<div id=\"main_panle\" class=\"footer1 panel " + this.myClass + "\" style=\"width:" + this.width + "; left:" + this.positionX + ";  height:" + this.height + ";\" > "
                        + "<div class=\"label_footer label  light_bg\"> <span class=\"label_title\">" + this.title
                        + "</span><div class=\"close_footer tools_bt\"></div> </div>"
                        + this.content);
                if (!this.module.equals("")) {
                    getmodule(this.module);
                }

                out.print("</div> ");
            } else if (this.position == "top") {

                out.print("<div id=\"main_panle\" class=\"top_panle panel " + this.myClass + "\"  style=\"width:" + this.width + "; left:" + this.positionX + ";   height:" + this.height + ";\" >"
                        + "<div class=\"cont_body\">" + this.content);
                if (!this.module.equals("")) {
                    getmodule(this.module);
                }
                ;
                out.print("</div> "
                        + " <div id=\"main_panle\" class=\"label_top label light_bg\"> "
                        + "<span class=\"label_title\">" + this.title + "</span>"
                        + "<div class=\"close_top tools_bt\">"
                        + "</div> </div></div>");

            } else if (this.position == "right") {
                out.print("<div id=\"main_panle\" class=\"right_panel panel " + this.myClass + "\" style=\"width:" + this.width + "; top:" + this.positionY + ";   height:" + this.height + ";\" >"
                        + "<div class=\"label_right label light_bg\"> <span class=\"label_title\">" + this.title
                        + "</span><div class=\"close_right tools_bt\"></div> "
                        + "</div><div class=\"cont_body\">" + this.content);

                if (!this.module.equals("")) {
                    getmodule(this.module);
                }
                ;
                out.print("</div> </div>");

            } else if (this.position == "left") {
                out.print("<div id=\"main_panle\" class=\"left_panel panel " + this.myClass + "\"   style=\" width:" + this.width + "px;  top:" + this.positionY + ";   height:" + this.height + ";\">"
                        + "<div class=\"label_left  label light_bg\"> <span class=\"label_title\">" + this.title
                        + "</span><div class=\"close_min_left tools_bt\">"
                        + "</div></div>"
                        + "<div class=\"cont_body\">" + this.content);

                if (!this.module.equals("")) {
                    getmodule(this.module);
                }
                ;

                out.print("</div>  "
                        + "</div>");

            } else if (this.position == "leftbar") {

                out.print("<div id=\"main_panle\" class=\"left_bottom panel " + this.myClass + "\"  style=\"height:" + this.height + ";\">"
                        + " <div class=\"left_bottom_label label light_bg\">"
                        + "<div class=\"label_title_bar\">" + this.title + "</div>"
                        + "<div class=\"bttom_close_left tools_bt\"></div>");
                if (this.add.equalsIgnoreCase("true")) {
                    out.print("<div title='Add Model' class=\"bttom_add_left tools_bt\">+</div>");
                }

                out.print("</div>"
                        + "<div class=\"cont\">"
                        + this.content);
                if (!this.module.equals("")) {
                    getmodule(this.module);
                }
                ;
                out.print("</div></div>");

            }

        } catch (java.io.IOException ex) {
            throw new JspException("Error in panel tag", ex);

        }
    }

    private void getmodule(String po) {
        try {
            front Front = new front();
            PageContext pageContext = (PageContext) getJspContext();
            String[] returnData = Front.getThisModules((HttpServletRequest) pageContext.getRequest(), (HttpServletResponse) pageContext.getResponse(), po);

            for (int x = 1; x < returnData.length; x++) {

                String m_link = "/" + returnData[x];
                JspWriter out = getJspContext().getOut();

                //out.print(m_link);
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
