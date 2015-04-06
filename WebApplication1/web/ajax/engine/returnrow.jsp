<%@page  import="java.util.Arrays" %>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();
    String[] dd = db.getRow(request.getParameter("table").toUpperCase(), "ID=" + (request.getParameter("id")));
    String data="";
    for(int i=0;i<dd.length;i++){
        data+=dd[i]+"__";
    }
 
    out.print(data);
%>
