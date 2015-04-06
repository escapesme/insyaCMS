<%-- 
    Document   : financialExport
    Created on : Aug 19, 2013, 1:11:53 PM
    Author     : Ahmed
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="lib.tools.Utils"%>
<%@page import="xact.results.ResultsExport"%>
<%
    String csv = "";
    String values = request.getParameter("values");
    String modId = request.getParameter("modId");
    String modelName = Utils.getModName(modId);

    csv = new ResultsExport().exportXMLFinancialResults(0, 0, values);
    String[] fieldSet = values.split("/");
 //out.print(Arrays.deepToString(fieldSet) );
    //out.println(fieldSet.length);
    File f = new File(Utils.getModelFolder() + "/" + modelName + "_Financial_Results.xml");

    BufferedWriter writer = new BufferedWriter(new FileWriter(f));
    writer.write(csv);
    writer.flush();
    writer.close();

    RequestDispatcher ds = request.getRequestDispatcher("/files/downloadFile.jsp?file=" + modelName + "_Financial_Results.xml");
    ds.forward(request, response);

%>
