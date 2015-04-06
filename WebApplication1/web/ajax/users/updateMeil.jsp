<%-- 
    Document   : usres
    Created on : Apr 21, 2013, 5:05:23 PM
    Author     : ismil
--%>

<%@page import="xact.utils"%>
<%@page import="lib.Options.MyVariables"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%@page import="xact.users.users"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();
    String uid = session.getAttribute("user_id").toString();
    db.openDBCon(lib.Options.DbInfo.connectionStringUsers);
    String test = uid;
    String[][] addnewDataupdate = {
        {"email"},
        {request.getParameter("email")}
    };
    utils u=new utils();
    db.setUpdateNocon(XMLDataModel.USER_TABLENAME, addnewDataupdate, "username='" + uid + "'");
    out.print(u.outProp("MAILCONFIG","emailUpdated"));
    db.closeCon();


%>

