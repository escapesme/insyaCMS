/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tags;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import lib.Options.XMLDataModel;


/**
 *
 * @author es
 */
public class user extends SimpleTagSupport implements lib.Options.MyVariables {

    private String getData;
    private String status;

    public void setgetData(String getData) {

        this.getData = getData;
    }

    public void setstatus(String status) {

        this.status = status;
    }

    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        PageContext pageContext = (PageContext) getJspContext();
        HttpSession session = pageContext.getSession();
      
   
   String data=  session.getAttribute("user_id").toString();

  lib.engine.db.operations db=new lib.engine.db.operations();
   
db.openDBCon(lib.Options.DbInfo.connectionStringDef);
   String dd=db.getValueNocon(XMLDataModel.USER_TABLENAME,this.getData , "id=" +data);

 
    }
}
