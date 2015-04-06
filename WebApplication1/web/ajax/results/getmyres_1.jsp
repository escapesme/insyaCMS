<%@page import="java.sql.SQLException"%>
<%@page import="lib.Options.XMLDataModel"%>

<%!    lib.engine.db.operations db = new lib.engine.db.operations();
   // xact.advancedProjection ad = new xact.advancedProjection();

    

    String getchartsData2(String ID, HttpServletRequest rq, String point, String col) throws SQLException, Exception {

        String retdata = "";
        for (int i = 0; i <= 20; i++) {


            String data[] = db.getRowNocon(XMLDataModel.SP_RESULTS_TABLENAME, "SP_ID='" + ID + "' and NAME ='ReferenceModel_" + i + "'");


            if (col.equalsIgnoreCase("ELONGATION")) {

                retdata += data[10] + ";";

            } else if (col.equalsIgnoreCase("SERVICE_TIME")) {
                
                
                
                
                double du = 0;
                if (data[8] != "null" && data[8] != "" && data[8] != null && data[9] != "null" && data[9] != "" && data[9] != null) {

                    du = Double.parseDouble(data[8]) / Double.parseDouble(data[9]);
                      
                }

              retdata += du + ";";



            }


        }





        return retdata;
    }


%>
<%


db.openConres();


      out.print(getchartsData2(request.getParameter("id"), request, request.getParameter("point"), request.getParameter("type")));



 

db.closeCon();


%>







