package lib.engine.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author es
 */
public class Control extends HttpServlet {

    String list = "";
    String mode = "";
    String name = "";
    String title = "";
    String categories = "";
    String parents = "";
    String morefields = "";
    String size = "";

    public Control(String mode, String list, String name, String title, String categories, String parents, String morefields, String size) {
        this.list = list;
        this.mode = mode;
        this.name = name;
        this.title = title;
        this.morefields = morefields;
        this.categories = categories;
        this.parents = parents;
        this.size = size;
    }

    public String getControl(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String ret = "";


        if (this.mode == "list") {
            lib.engine.admin.list returnData = new lib.engine.admin.list(this.name, this.list, this.title, this.categories, this.parents, this.size);
            ret = returnData.getData(request, response);

        } else if (this.mode == "add") {
            lib.engine.admin.Add returnData = new lib.engine.admin.Add(this.name, this.title, this.categories, this.parents, this.morefields);

            ret = returnData.getData(request, response);
        } else if (this.mode == "edit") {
            lib.engine.admin.Edit returnData = new lib.engine.admin.Edit(this.name, this.title, this.categories, this.parents, this.morefields);

            ret = returnData.getData(request, response);
        }
        return ret;





    }
}
