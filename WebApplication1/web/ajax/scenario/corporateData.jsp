<%-- 
    Document   : corporateData
    Created on : Feb 13, 2013, 1:01:53 PM
    Author     : ismil
--%>

<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%   lib.engine.db.operations db = new lib.engine.db.operations();
    String[] Datamodel = db.getRow(XMLDataModel.CORPORATE_TABLENAME, "MODEL_ID=" + request.getParameter("mod_id"));
    out.print(Arrays.deepToString(Datamodel));
%>