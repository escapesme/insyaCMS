/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tags;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class forms extends SimpleTagSupport {
//[text,number,autocomp,date,time,password,checkbox,textarea,editor,select,radio,upload,pic,label,hidden ,$upload_to]
  
    private String title = "";
    private String type = "";
    private String name = "";
    private String myclass = "";
    private String selectQuery = "";
    private String selectDataTable = "";
    private String selectTexttField = "";
    private String selectValueField = "";
    private String selectData = "";
    private String required = "";
    private String method = "";
    private String action = "";
    private String data = "";
    private String value = "";

    public void settitle(String title) {
        this.title = title;
    }

    public void settype(String type) {
        this.type = type;
    }

    public void setname(String name) {
        this.name = name;
    }

    public void setmyclass(String myclass) {
        this.myclass = myclass;
    }

    public void setselectQuery(String selectQuery) {
        this.selectQuery = selectQuery;
    }

    public void setselectDataTable(String selectDataTable) {
        this.selectDataTable = selectDataTable;
    }

    public void setselectTexttField(String selectTexttField) {
        this.selectTexttField = selectTexttField;
    }

    public void setselectValueField(String selectValueField) {
        this.selectValueField = selectValueField;
    }

    public void setdata(String data) {
        this.data = data;
    }

    public void setaction(String action) {
        this.action = action;
    }

    public void setmethod(String method) {
        this.method = method;
    }

    public void setrequired(String required) {
        this.required = required;
    }

    public void setselectData(String selectData) {
        this.selectData = selectData;
    }

    public void setvalue(String value) {
        this.value = value;
    }
    
    
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();

        try {
            lib.tools.forms myx = new lib.tools.forms();
            myx.title = this.title;
            myx.type = this.type;//[text,number,autocomp,date,time,password,checkbox,textarea,editor,select,radio,upload,pic,label,hidden ,$upload_to]
            myx.name = this.name;
            myx.myclass = this.myclass;
            myx.selectQuery = this.selectQuery;
            myx.selectDataTable = this.selectDataTable;
            myx.selectTexttField = this.selectTexttField;
            myx.selectValueField = this.selectValueField;
            myx.selectData = this.selectData;
            myx.required = this.required;
            myx.method = this.method;
            myx.action = this.action;
            myx.data = this.data;
             myx.value = this.value;
            
            
       out.print(myx.getForm());
            JspFragment f = getJspBody();
            if (f != null) {
                f.invoke(out);
            }



        } catch (java.io.IOException ex) {
            throw new JspException("Error in forms tag", ex);
        }
    }
}
