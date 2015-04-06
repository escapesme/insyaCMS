<%@page import="java.util.Arrays"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();


    //  String scenario_table = lib.Options.XMLDataModel.SCENARIO_TABLENAME;

  
    
    
    out.print("<ul>");
    String[] cl_pmxref = db.getColumn(lib.Options.XMLDataModel.PMXREF_TABLENAME, "mid", " pid=" + request.getParameter("id"));

    out.print("</ul>");

    for (int B = 0; B < cl_pmxref.length; B++) {



        String[] cl_model_STATUS = db.getColumn(lib.Options.XMLDataModel.MODEL_TABLENAME, "MODEL_NAME", " id=" + cl_pmxref[B]);

        for (int m = 0; m < cl_model_STATUS.length; m++) {
            out.print("<li>" + cl_model_STATUS[m] + "</li>");
        }

    }
    out.print("</ul>");
    db.closeCon();
%>