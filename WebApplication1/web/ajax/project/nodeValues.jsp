<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%    
    lib.engine.db.operations db = new lib.engine.db.operations();
    String[] ids = request.getParameter("id").split("/");
    String type = ids[0];
    String id = ids[1];
    
    
    String[] row=null;
    
    if (type != null) {
        if (type.equalsIgnoreCase("BUSINESS_PROCESS")) {
              String[] rows = db.getRow(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "id=" + id);
              double num=Double.parseDouble(rows[6]);
              int days=(int)num/86400;
              out.print(num);
              double reminder=num%86400;
              int hrs=(int)reminder/3600;
             reminder=reminder%3600;
             int mins=(int)reminder/60;
             double seconds=reminder%60;
             row=new String[]{rows[0],rows[1],rows[2],rows[3],rows[4],rows[5],rows[6],""+days,""+hrs,""+mins,""+seconds};
        } else if (type.equalsIgnoreCase("BUSINESS_ENTITY")) {
            row = db.getRow(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "id=" + id);
            
        } else if (type.equalsIgnoreCase("corporate")) {
            row = db.getRow(XMLDataModel.CORPORATE_TABLENAME, "id=" + id);
            
        }
    }
    out.print(Arrays.deepToString(row));    
%>
