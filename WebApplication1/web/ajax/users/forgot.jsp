<%-- 
    Document   : usres
    Created on : Apr 21, 2013, 5:05:23 PM
    Author     : ismil
--%>

<%@page import="lib.Options.MyVariables"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%@page import="xact.users.users"%>
<%
    users u = new users();
    lib.engine.db.operations db = new lib.engine.db.operations();

    String myEmail = u.userReturnBy(request, "username", request.getParameter("usreName"), "email");
    String firstName = u.userReturnBy(request, "username", request.getParameter("usreName"), "firstname");
    String test = "";
    if (!myEmail.trim().equalsIgnoreCase("") && !myEmail.trim().equalsIgnoreCase("null") && myEmail != null) {

        String newPassword = u.randomString(8);

        db.openDBCon(lib.Options.DbInfo.connectionStringUsers);

        test = newPassword;

        String[][] addnewDataupdate = {
            {"password"},
            {u.hash(newPassword)}
        };
        db.setUpdateNocon(XMLDataModel.USER_TABLENAME, addnewDataupdate, "username='" + request.getParameter("usreName") + "'");
String content="<b>Dear "+firstName+"</b><br/><br/>We have received your request to reset your X-Act Web password."
        + "<br/>Your new password is: "+newPassword+"<br/><br/>We highly recommend that the password is changed after you have logged in successfully."
        + "<br/><br/>Best Regards,<br/>Accretive Team";
        String result = Utils.sendmail(myEmail, MyVariables.FROM_EMAIL, MyVariables.EMAIL_SUBJECT, content);

        out.print(result);

        db.closeCon();

    } else {

        String NullEmail = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We are unable to process your request.<a href='mailto:" + Utils.getAdminMail() + "'> Click here  </a> to contact administrator.";
        out.print(NullEmail);

    }

%>

