<%-- 
    Document   : dbDumb
    Created on : Sep 10, 2013, 3:01:28 PM
    Author     : Ahmed
--%>
<%@page import="lib.Options.DbInfo"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="lib.tools.Utils"%>
<%
 
    
    String extension = ".sql";
   
    String fileName = Utils.getLegalFileName("_backUp_" + extension);
    File f = new File(Utils.getModelFolder() + "/" + fileName);
    Runtime.getRuntime().exec("mysql -u <"+DbInfo.connectionStringUsers+"> -p<"+DbInfo.connectionStringDefdbPassword+"> <xact_ostia> <  <"+f+">");
   /* BufferedWriter writer = new BufferedWriter(new FileWriter(f));
    
    writer.flush();
    writer.close();*/
    RequestDispatcher ds = request.getRequestDispatcher("/files/downloadFile.jsp?file=" + fileName);
    ds.forward(request, response);
    %>