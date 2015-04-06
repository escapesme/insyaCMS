<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<%

xact.results.imapctPath im = new xact.results.imapctPath();
lib.engine.db.operations db = new lib.engine.db.operations();
db.openCon();
  ResultSet mynode = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID='1312481377189'");
    out.print("<div id=\"imtree\" ><select class=\"getpp\">");
    while (mynode.next()) {
      
        out.print("<option>" + mynode.getString("Name") + "</option>");
      out.print(im.get_Childrens3option(mynode.getString("ID"),""));
  

    }
  out.print("</div>");
db.closeCon();
%>
        