<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String status = request.getParameter("status");
    lib.engine.db.operations db = new lib.engine.db.operations();
    String id = request.getParameter("id");
    if (status.equalsIgnoreCase("line")) {
        String[] Data = db.getRow(XMLDataModel.LINE_TABLENAME, " `id`='" + id + "'");
        out.print(Arrays.deepToString(Data));
    } else if (status.equalsIgnoreCase("group_node")) {
        String[] Data = db.getRow(XMLDataModel.NODE_TABLENAME, " `ID`='" + id + "'");
        out.print(Arrays.deepToString(Data));
    }
    else if (status.equalsIgnoreCase("hasMDL")) {
        String[] Data = db.getRow(XMLDataModel.SERVER_INST_TABLENAME, " `NODE_ID`='" + id + "'");
        out.print(Data[0]!=null);
    }


        
 


%>