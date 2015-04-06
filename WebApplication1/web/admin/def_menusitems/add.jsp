<%@page import="com.sun.org.apache.bcel.internal.generic.LADD"%>
<div>
    <%! lib.tags.engine.adminBody dd = new lib.tags.engine.adminBody();%>
    <%@taglib uri="/WEB-INF/tlds/engine" prefix="engine"%>
    <%
                if (request.getParameter("link") != null || request.getParameter("link_type") != null) {

                    if (request.getParameter("link_type") != null) {%>
    <engine:adminBody mode="add" morefields='<div class="form_row"><lable class="input_title" for="link">link</lable><div class="form_input"><input type="text" class="me_text form_input link " id="link" name="link" value="http://" title="link"></div></div>' categories="true" parents="true" title="Menus Items:new" name="def_menusitems" />
    <%} else {
            lib.engine.menuOptions mu = new lib.engine.menuOptions();


            String mor = mu.getOptions(request.getParameter("link")) + "<div class=\"form_row\"><lable class=\"input_title\" for=\"link\">link</lable><div class=\"form_input\"><input type=\"text\" class=\"me_text form_input link \" id=\"link\" name=\"link\" value=\"" + request.getParameter("link") + "\" title=\"link\"></div></div>";

            lib.engine.admin.control cont = new lib.engine.admin.control("add", "", "def_menusitems", "menuss", "true", "true", mor, "");
            out.print(cont.getControl(request, response));


        }


    } else {%>
    <engine:adminMenuCom  />
    <%}%>

</div>

