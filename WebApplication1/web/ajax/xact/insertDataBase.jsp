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
   
 
    DatabaseImport dbimports=new DatabaseImport();
    String status = request.getParameter("status");
    String values = request.getParameter("values");
    
    if (status.equalsIgnoreCase("saveTable")) {
       
        out.print(dbimports.saveData(values));
       
        
    }else if (status.equalsIgnoreCase("saveIndex")) {
       
        out.print(dbimports.saveIndexData((values)));
       
        
    }
       else if (status.equalsIgnoreCase("saveCache")) {
        String proid=request.getParameter("id").split("__")[0];
               out.print(dbimports.saveCacheData(values,proid));

        
    }else if (status.equalsIgnoreCase("saveBuffer")) {
      String proid=request.getParameter("id").split("__")[0];
        out.print(dbimports.saveBufferData(values,proid));
       
        
    }

%>
