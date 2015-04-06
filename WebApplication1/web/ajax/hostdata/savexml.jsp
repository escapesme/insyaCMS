
<%
    String ids = request.getParameter("ids");
    String[] s = ids.split(";");

    for (String e : s) {

        lib.tools.XML x = new lib.tools.XML(lib.Options.urls.complexWebserviec + "/" + e);
        x.setModelId(request.getParameter("modelId"));
        x.setServerId(request.getParameter("serverId"));
       // x.readAllTags();
        
        out.print(x.readAllTags()+"<br>");
    }


%>