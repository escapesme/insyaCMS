<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.util.Arrays"%>
<%
    lib.engine.db.operations db = new lib.engine.db.operations();

    String[] fildes = request.getParameter("fildes").split(";");;
    String[] values = request.getParameter("values").split(";");;
    String[] Vls = request.getParameter("wvalues").split(";");
    String[] Fls = request.getParameter("wfildes").split(";");
    String table = request.getParameter("table");










    for (int i = 0; i < fildes.length; i++) {


        
    
        if (fildes[i].equalsIgnoreCase("LOCKED")) {
  

            if (values[i].equalsIgnoreCase("on")) {
                values[i] = "b'1'";


            } else {

                values[i] = "b'0'";
            }

        }

    }

    String[][] dbdata = {fildes, values};



    String wheredata = "";


    for (int i = 0; i < Fls.length; i++) {

        String myand = "";
        if (i > 0) {
            myand = " and ";
        }



 








        wheredata += myand + Fls[i] + "='" + Vls[i] + "'";

    }

  
  
if ( XMLDataModel.STATUS=="upper") {table=table.toUpperCase();}else{table=table.toLowerCase();}     
    
out.print (db.setUpdate(table, dbdata, wheredata));


%>