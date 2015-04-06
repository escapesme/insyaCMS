<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%
lib.engine.db.operations db = new lib.engine.db.operations();
    String ids = request.getParameter("mid");
    String resultId=Utils.getResultID(ids.split("__")[1], ids.split("__")[2]);
    db.openConres();
    out.print(db.getValueNocon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "IN_CNT", "ID="+resultId));
    db.closeCon();
    
    



%>