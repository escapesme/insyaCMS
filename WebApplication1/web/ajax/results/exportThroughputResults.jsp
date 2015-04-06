<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="xact.results.ResultsExport"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="lib.tools.Utils"%>
<%@page import="xact.utils"%>
<%@page import="java.util.Arrays"%>
<%@page import="xact.NodeExtension"%>
<%
lib.engine.db.operations db = new lib.engine.db.operations();
    String ids = request.getParameter("ids");
    String fields = request.getParameter("list");
     String modelName=Utils.getModName(ids.split("__")[1], ids.split("__")[2]);
    String resultId=Utils.getResultID(ids.split("__")[1], ids.split("__")[2]);
     Date current = new Date();
    String format = DateFormat.getDateInstance(DateFormat.SHORT).format(current);
    int start=Integer.parseInt(request.getParameter("startPoint"));
    int end=Integer.parseInt(request.getParameter("endPoint"));
    String csv=new ResultsExport().exportThroughputResults(start, end, fields, resultId, modelName);
    String extension=".csv";
    if(request.getParameter("extension")!=null){
        if(request.getParameter("extension").equalsIgnoreCase("xml")){
            extension=".xml";
            csv=new ResultsExport().exportXMLThroughputResults(start, end, fields, resultId, modelName);
        }
    }
    //out.print(csv);
    String fileName = Utils.getLegalFileName(modelName + "_Throughput_Results_" + format + extension);
  File f=new File(Utils.getModelFolder() + "/" + fileName);
    
    BufferedWriter writer = new BufferedWriter(new FileWriter(f));
    writer.write(csv);
    writer.flush();
        writer.close();
     RequestDispatcher ds = request.getRequestDispatcher("/files/downloadFile.jsp?file=" + fileName);
        ds.forward(request, response);
    


%>
