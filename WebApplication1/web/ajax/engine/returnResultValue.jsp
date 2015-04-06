<%@page import="lib.Options.XMLDataModel"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();
    String dd = "";

    String table = request.getParameter("table");
    if (XMLDataModel.STATUS == "upper") {
        table = table.toUpperCase();
    } else {
        table = table.toLowerCase();
    }
   
     db.openDBCon(lib.Options.DbInfo.connectionStringRes);
    if (request.getParameter("ofilde") == null && request.getParameter("id") != null) {

       
           
            dd = db.getValue(table, request.getParameter("filde"), Integer.parseInt(request.getParameter("id")));


    } else if (request.getParameter("ofilde") == null && request.getParameter("id") == null) {


       
            dd = db.getValueNocon(table, request.getParameter("filde"), "1=1");
        





    } else {




            dd = db.getValueNocon(table, request.getParameter("filde"), "`" + request.getParameter("ofilde") + "`" + "='" + request.getParameter("id") + "'");

           
        
 } db.closeCon();
%>
<%=dd%>