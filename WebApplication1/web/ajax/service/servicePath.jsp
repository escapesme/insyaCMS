<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="xact.views.ServicePath"%>
<%@page import="java.util.Arrays"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();
    String[] ids = request.getParameter("ids").split("__");
     String name = request.getParameter("name");
    ServicePath sp = new ServicePath();

  


    if (sp.isAllSameLevel(ids)) {

        if (sp.isAllConnected(ids)) {
            String path = sp.createPath(ids);
            String modelId = ids[1].split("/")[3];
            String id=Utils.getNewID();
            String inData[][] = {{"ID","NAME", "MODEL_ID", "PATH"}, {id,name, modelId, path}};

           out.print( db.setInsert(XMLDataModel.PATH_TEMPLATE_TABLENAME, inData));
            out.print("The path '"+name+"' is successfuly saved");
            
        } else {
            
            out.print("The selected nodes don't form a path");
        }

    } else {
        
     //   out.print(sp.test);
       out.print("The selected nodes are not in the same level or have diiferent parents");
    }





    for (String id : ids) {
        String[] idData = id.split("/");
    }




%>

