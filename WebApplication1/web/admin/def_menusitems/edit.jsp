<div>
<%@taglib uri="/WEB-INF/tlds/engine" prefix="engine"%>

<% lib.engine.db.operations db =new lib.engine.db.operations();

String ret_link =db.getValue("def_menusitems", "link", "id="+ request.getParameter("th_id"));
String mor="<div class=\"form_row\"><lable class=\"input_title\" for=\"link\">link</lable><div class=\"form_input\"><input type=\"text\" class=\"me_text form_input link \" id=\"link\" name=\"link\" value=\""+ret_link+"\" title=\"link\"></div></div>";
    lib.engine.admin.control cont = new lib.engine.admin.control("edit", "", "def_menusitems", "menuss", "true", "true",mor);
 out.print( cont.getControl(request, response));
%>

  </div>