<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%





    lib.engine.db.operations db = new lib.engine.db.operations();
    String id=request.getParameter("results_id");
    String []ids=id.split("__");
    String resultsId=Utils.getResultID(ids[1], ids[2]);
    db.openConres();
    out.print(db.setDeleteNocon(XMLDataModel.COMPUTE_CONTROL_TABLENAME, "ID="+resultsId));
     out.print(db.setDeleteNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, "ID="+resultsId));
     out.print(db.setDeleteNocon(XMLDataModel.CAPACITY_PLAN_TABLENAME, "ID="+resultsId));

%>