<%-- 
    Document   : aciPrios
    Created on : Feb 25, 2014, 1:57:22 PM
    Author     : Ahmed
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<% 
    String ac_id=request.getParameter("aci");
    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();
    ResultSet PrioritiesSet = db.getData(XMLDataModel.APPLICATION_PRIO_INST_TABLENAME, "*", "AC_INST_ID=" + ac_id);
    String Priorities = "";
    
    while (PrioritiesSet.next()) {

        String prio = PrioritiesSet.getString("INST_NAME") + ":" + PrioritiesSet.getString("LEVEL_NUM");
        Priorities += "<option value='" + ac_id + "'>" + prio + "</option>";

    }
    db.closeCon();
    out.print(Priorities);
%>