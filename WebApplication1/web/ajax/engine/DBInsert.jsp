<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Arrays"%>
<%
    String fildes = request.getParameter("fildes");
    String values = request.getParameter("values");
    String table = request.getParameter("table");
    lib.engine.db.operations db = new lib.engine.db.operations();
    String[] arrfiles = fildes.split(";");
    String[] arrvalues = values.split(";");
    String[][] dbdata = {arrfiles, arrvalues};
    
    if ( XMLDataModel.STATUS=="upper") {table=table.toUpperCase();}else{table=table.toLowerCase();}   
    
      out.print(Arrays.deepToString(arrvalues));
    out.print(db.setInsert(table, dbdata));
%>
