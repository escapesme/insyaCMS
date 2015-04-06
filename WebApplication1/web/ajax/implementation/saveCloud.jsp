<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.tools.Utils"%>
<%
    String rerData = "";
    lib.engine.db.operations db = new lib.engine.db.operations();

    String title = request.getParameter("title");
    String color = request.getParameter("color");
    String Description = request.getParameter("Description");
    String status = request.getParameter("status");
    String icon = request.getParameter("icon");

    String modID = request.getParameter("modID");

    String CID = Utils.getNewID();
    String[][] data = {{"ID", "MODEL_ID", "NAME", "COLOR", "LOGO", "DESCRIPTION","private", "LOGOWIDTH", "LOGOHIGHT"},
        {CID, modID, title, color, icon, Description, status, "48", "48"}
    };


    rerData += db.setInsert(XMLDataModel.CLOUD_TABLENAME, data)+"\n";;






    String loctionId = request.getParameter("loctionId");
    String[] Lids = loctionId.split(",");

    for (String Lid : Lids) {
        
        
        if (!Lid.trim().equals("")) {
            
            rerData+=Lid+"\n";
            
            String[][] dataxre = {{ "CLOUD_ID", "LOCATION_ID", "MODEL_ID"},
                { CID, Lid,modID}
            };
            
               rerData +=Arrays.deepToString(dataxre) +"\n";;
            rerData += db.setInsert(XMLDataModel.CLOUD_LOC_XREF_TABLENAME, dataxre)+"\n";;
        }
    }

  out.print(rerData);

%>


