<%@page import="xact.DatabaseImport"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="lib.tools.Utils"%>
<%@page import="xact.MDLOperations"%>
<%
    xact.users.users us = new xact.users.users();
    lib.engine.db.operations db = new lib.engine.db.operations();
    DatabaseImport dbimports=new DatabaseImport();
    String status = request.getParameter("status");
   
     String urlfilePath = request.getParameter("filePath").trim();
        String filename = request.getParameter("name");
        File f = new File(urlfilePath + "/" + filename);
        String file=dbimports.readTable(f);
    if (status.equalsIgnoreCase("importTable")) {
       
        out.print(dbimports.saveData(dbimports.readTable(f)));
       
        
    }else if (status.equalsIgnoreCase("importIndex")) {
       
        out.print(dbimports.saveIndexData((file)));
       
        
    }
       else if (status.equalsIgnoreCase("importCache")) {
        
               String proid=request.getParameter("id").split("__")[0];
               out.print(dbimports.saveCacheData(file,proid));

        
    }else if (status.equalsIgnoreCase("importBuffer")) {
       String proid=request.getParameter("id").split("__")[0];
        out.print(dbimports.saveBufferData(file,proid));
       
        
    }

%>

<style>
    
    .data_grid{
        overflow: auto;
    }
</style>