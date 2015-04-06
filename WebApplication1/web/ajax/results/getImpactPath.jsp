<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.tools.Utils"%>
<%@page import="lib.Options.XMLDataModel"%>

<link rel="stylesheet" type="text/css" href="includes/js/treeview/jquery.treeview.css" />

<script type="text/javascript" src="includes/js/treeview/jquery.treeview.js"></script>

<script type="text/javascript"> 
    $(function() {
        $("#imtree").treeview({
            collapsed: true,
            animated: "medium",
            control:"#sidetreecontrol",
            persist: "location"
        });
    })
		
</script> 
<%!    lib.engine.db.operations db = new lib.engine.db.operations();
%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%
    //   db.openCon();



//out.print(request.getParameter("name").split("^")[0]);

    String modelId=request.getParameter("modelid");
    String[] myrs = db.getRow(XMLDataModel.APPLICATION_COMPONENT_INST_TABLENAME, "INST_NAME= '" + request.getParameter("name").split(":")[0] + "' AND MODEL_ID="+modelId);

    db.openCon();
  

    ResultSet myact = db.getData(XMLDataModel.ACI2ACT_TABLENAME, "*", "AC_INST_ID=" + myrs[0]);

    String[] mynodes = null;
    ArrayList<String> ptparent = new ArrayList<String>();

    


    while (myact.next()) {
         
          
        String n = Utils.getbbid(myact.getString("SERVICE_ACTIVITY_ID"));
        if (!ptparent.contains(n)) {
            ptparent.add(n);

        }

    }



    db.closeCon();
    for (int i = 0; i < ptparent.size(); i++) {
      


        // String pid = get_parent(ptparent.get(i), ptparent);


        out.print("<ul id=\"imtree\">");
        db.openCon();
        String[] mynode = db.getRowNocon(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "id='" + ptparent.get(i) + "'");


        out.print("<ul>");

        out.print("<li>" + "<div class=\"mytitle\">" + mynode[3] + "</div>");

        out.print(get_Childrens3(ptparent.get(i)));


        out.print("</li>");


        out.print("</ul>");

    }








    db.closeCon();

    out.print("</ul>");


%>









<%!    String get_Childrens3(String parentID) throws java.sql.SQLException {
        String returnData = "";
        db.openCon();
        ResultSet ch = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + parentID);




        returnData += "<ul>";
        while (ch.next()) {
            if (!ch.getString("Name").equals("Start") && !ch.getString("Name").equals("End") && !ch.getString("TAG").equalsIgnoreCase("service") 
                       && !ch.getString("TAG").equalsIgnoreCase("Message") 
                    && !ch.getString("TAG").equalsIgnoreCase("insertion") 
                    && !ch.getString("TAG").equalsIgnoreCase("collector") 
                    && !ch.getString("TAG").equalsIgnoreCase("activity")
                    && !(ch.getString("Name").equalsIgnoreCase("task") && ch.getString("type").equalsIgnoreCase("preperation"))) {


                returnData += "<li>   " + "<div class=\"mytitle\">" + ch.getString("NAME") + "</div>";
                returnData += get_Childrens(ch.getString("ID"));
                returnData += "</li>";
            }
       }
        returnData += "</ul>";
        db.closeCon();
        return returnData;


    }

//xact.views v = new xact.views();
    String get_Childrens(String parentID) throws java.sql.SQLException {
      /*  xact.viewsClass v = new xact.viewsClass();

        v.impactpathView(parentID);

*/

          db.openCon();
        ResultSet ch = db.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME,"*", "PARENT_ID= "+parentID);



        //int ff = db.getRowCount(XMLDataModel.SERVICE_DATA_VIEW, "1=1");


        // if (ff > 2) {



        String returnData2 = "<ul>";
        while (ch.next()) {
            if (!ch.getString("TAG").equalsIgnoreCase("Start")
                    && !ch.getString("TAG").equalsIgnoreCase("Message") 
                    && !ch.getString("TAG").equalsIgnoreCase("End")
                    && !ch.getString("TAG").equalsIgnoreCase("service")
                    && !ch.getString("TAG").equalsIgnoreCase("insertion") && !ch.getString("TAG").equalsIgnoreCase("collector") && !ch.getString("TAG").equalsIgnoreCase("activity")
                    && !(ch.getString("TAG").equalsIgnoreCase("task") && ch.getString("type").equalsIgnoreCase("preperation"))) {




                returnData2 += "<li>  " + "<div class=\"mytitle\">" + ch.getString("Name") + "</div>";
                returnData2 += get_Childrens(ch.getString("ID"));
                returnData2 += "</li>";
            }
        }
        returnData2 += "</ul>";


        // }

         db.closeCon();
        return returnData2;

    }
    String returnData = "";

    String get_parent(String parentID, ArrayList<String> path) throws java.sql.SQLException {


        String LINKS[] = db.getRow(XMLDataModel.SERVICE_LINK_TABLENAME, "`TO_ID`=" + parentID + "  or `FROM_ID` =" + parentID);

        String[] mynodes = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + LINKS[5]);



        if (mynodes[1].equalsIgnoreCase("process")) {

            if (path.contains(mynodes[0])) {

                returnData = mynodes[3];
                path.remove(mynodes[0]);
            }


        } else {
            get_parent(mynodes[0], path);

        }



        return returnData;




    }

%>


























</li>
</ul>



