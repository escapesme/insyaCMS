<div>
    <%@taglib uri="/WEB-INF/tlds/engine" prefix="engine"%>

    <%! lib.engine.adminModuleGetMenu2 bb = new lib.engine.adminModuleGetMenu2();
        lib.engine.modulesOptions modoptions = new lib.engine.modulesOptions();


    %>
    <%
                if (request.getParameter("link") != null) {
                    String mor = bb.doTag2()+"<input type=\"hidden\" name=\"type\" value=" + request.getParameter("link") + " />"+ modoptions.getOptions(request.getParameter("link"));
                    lib.engine.admin.control cont = new lib.engine.admin.control("add", "", "def_modules", "menuss", "", "", mor, "");
                    out.print(cont.getControl(request, response));

                } else {

    %>
    <engine:adminModulesMenus />



    <%             }




    %>




</div>

