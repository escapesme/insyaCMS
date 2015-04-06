<%--
    Document   : Googlemap
    Created on : May 25, 2011, 1:33:52 PM
    Author     : Sayed Taha
--%>

<%@page import="lib.Options.XMLDataModel"%>
<script>

    $(function(){

        $("#myseoutlineContainer_con").html("");
        $("#myseoutlineContainer_con").html("<div id=\"seoutlineContainer_con\"style=\" z-index:1;position:absolute;overflow:hidden;top:30px;left:5px;width:200px;height:120px;background:transparent;\"></div>");
    })
</script>


<%@page  import="java.sql.ResultSet,java.util.Arrays" %>
<%
/*
    lib.engine.db.operations mydb = new lib.engine.db.operations();
    xact.mxgraph mx = new xact.mxgraph();
    mydb.openCon();
    ResultSet rs = mydb.getData(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "*", "PARENT_ID=" + request.getParameter("process_id"));
    out.print("<script type=\"text/javascript\"> $(function(){");
    out.print("if (!mxClient.isBrowserSupported()){ mxUtils.error('Browser is not supported!', 200, false);}"
            + "else{var gra =makGService(\"xactsev\");dooutline(gra); layoutService(gra, \"leftToRight\"); try{" + "");
    while (rs.next()) {
        String sty22[] = mydb.getRowNocon(XMLDataModel.STYLES_TABLENAME, "TYPE='" + "service_" + rs.getString("TAG") + "'");
        out.print(mx.returnStyle("service_" + rs.getString("TAG"), "style"));


        out.print("\n var l_node" + rs.getString("id") + " =creatDService(gra,\"\",\"" + rs.getString("id") + "\",\"" + rs.getString("Name") + "\",80,190,100,110,100,style);\n");
        out.print(get_ajax(rs.getString("id")));

    }
    rs.beforeFirst();
    while (rs.next()) {
        String s212[] = mydb.getRowNocon(XMLDataModel.SERVICE_LINK_TABLENAME, "FROM_ID=" + rs.getString("id"));


        if (s212[0] != null) {
            out.print("\n var ed_" + rs.getString("id") + " = creatEService(gra ,\"\",l_node" + s212[3] + " ,l_node" + s212[4] + " ,\"leftToRight\",\"\");\n");

        }

    }






    out.print("}finally {  layoutService(gra, \"leftToRight\");   gra.getModel().endUpdate();dooutline(gra);  } }");
    out.print(" ServiceEvents(gra); })</script>");


    mydb.closeCon();*/



%>

<div id="xactsev" style=" margin-top: 30px;  overflow:hidden;width:100%;top:0px;bottom:-2px; background:url('editors/images/grid.gif');cursor:default;"></div>





<%!  /* lib.engine.db.operations mydb = new lib.engine.db.operations();



String get_ajax(String parentID)throws java.sql.SQLException{

String returnData = "";


 String[] ch2 = mydb.getRow(XMLDataModel.SERVICE_LINK_TABLENAME, "PARENT_ID='" + parentID + "'");
if (ch2[0]!=null){




 returnData += " \n var l_nodeajax" + parentID + " = creatDService_ajax(gra ,l_node" + parentID + ",\"" + parentID + "\",\"ggggg\",0,20,100,110,\"" + parentID + "\",\"\");  gra.updateCellSize(l_node" + parentID + ") ;     gra.getModel().setCollapsed(l_node" + parentID + ", true);updatesize(gra , l_node" + parentID + ");\n";
  }
 
 return returnData;
}
        
        
        
        


    String get_Childrens(String parentID) throws java.sql.SQLException {
        String returnData = "";

        int me = 0;
        String myfrom = "(`"+XMLDataModel.SERVICE_LINK_TABLENAME+"` join `"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"` on(`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`ID` = "+XMLDataModel.SERVICE_LINK_TABLENAME+".`FROM_ID` or `"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`ID` = "+XMLDataModel.SERVICE_LINK_TABLENAME+".`TO_ID`))";
        String mywhere = "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`PARENT_ID`='" + parentID + "' group by  `"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`ID`";
        String myGet = ""+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+".ID AS `nodes_ID`,"
                + "`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`Name` AS `Name`,"
                + "`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`TAG` AS `TAG`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`ID`AS `link_ID1`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`FROM_ID` AS `FROM_ID`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`PARENT_ID` AS `PARENT_ID`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`TO_ID` AS `TO_ID`";
        returnData += mydb.creatview(XMLDataModel.MYDD252_TABLENAME, myGet, myfrom, mywhere);
        mydb.openCon();
        ResultSet ch = mydb.getData(XMLDataModel.MYDD252_TABLENAME, "*", "NAME='start'");

        xact.mxgraph mx = new xact.mxgraph();
        int arr_num = 0;


        while (ch.next()) {
            returnData += mx.returnStyle("service_" + ch.getString("Tag"), "style22");
            returnData += " \n var l_node" + ch.getString("nodes_ID") + " = creatDService(gra ,l_node" + parentID + ",\"" + ch.getString("nodes_ID") + "\",\"" + ch.getString("Name") + "\"," + me + ",20,100,110,\"" + ch.getString("nodes_ID") + "\",style22);layoutServicech(l_node" + parentID + ");\n";
            returnData += get_Childrens_all(ch.getString("TO_ID"), parentID, ch.getString("nodes_ID"), me);
        }


        return returnData;

    }

    String get_Childrens_all(String id_from, String parentID, String afterID, int me) throws java.sql.SQLException {
        me += 0;

        String returnData = "";

        String[] ch2 = mydb.getRowNocon(XMLDataModel.MYDD252_TABLENAME, "FROM_ID='" + id_from + "'");

        
        
        
        
        if (ch2[0] != null) {
            xact.mxgraph mx = new xact.mxgraph();
            String sty22[] = mydb.getRowNocon(XMLDataModel.STYLES_TABLENAME, "TYPE='" + "service_" + ch2[2] + "'");
            returnData += mx.returnStyle("service_" + ch2[2], "style");

            returnData += "var l_node" + ch2[0] + " = creatDService(gra ,l_node" + parentID + ",\"" + ch2[0] + "\",\"" + ch2[2] + "\"," + me + ",20,100,110,\"" + ch2[0] + "\",style);layoutServicech(l_node" + parentID + ");";


            returnData += "var ehhhhhhd_" + ch2[0] + " = creatEService(gra ,l_node" + parentID + ", l_node" + afterID + " ,l_node" + ch2[0] + " ,\"leftToRight\",\"\");";



            // returnData += "ar" + id + "[" + arr_num22 + "]= l_" + ch2[0] + ";";
            // returnData += "var ehhhhhhd_" + ch2[0] + " = creatE(gra , l_" + id_f + " ,l_" + ch2[0] + " ,\"leftToRight\",\"\");";
            returnData += get_Childrens_all(ch2[6], parentID, ch2[0], me);

            returnData += get_Childrens(ch2[0]);

            //  returnData += get_ch(ch2[0]);

        } else {
            me = 0;
        }
        return returnData;
    }

    String get_ch(String id) throws java.sql.SQLException {




        String returnData = "";
        int me = 0;
        String myfrom = "(`"+XMLDataModel.SERVICE_LINK_TABLENAME+"` join `"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"` on(`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`ID` = service_process_links.`FROM_ID` or `"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`ID` = service_process_links.`TO_ID`))";
        String mywhere = "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`PARENT_ID`='" + id + "' group by  `"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`ID`";
        String myGet = "service_process_nodes.ID AS `nodes_ID`,"
                + "`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`Name` AS `Name`,"
                + "`"+XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME+"`.`TAG` AS `TAG`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`ID`AS `link_ID1`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`FROM_ID` AS `FROM_ID`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`PARENT_ID` AS `PARENT_ID`,"
                + "`"+XMLDataModel.SERVICE_LINK_TABLENAME+"`.`TO_ID` AS `TO_ID`";
        returnData += mydb.creatview(XMLDataModel.MYDD252_TABLENAME, myGet, myfrom, mywhere);


        

        mydb.openCon();
        ResultSet ch = mydb.getData(XMLDataModel.MYDD252_TABLENAME, "*", "NAME='start'");
        xact.mxgraph mx = new xact.mxgraph();
        int arr_num = 0;


        while (ch.next()) {

            returnData += "var ar" + id + "=new Array();";
            returnData += mx.returnStyle("service_" + ch.getString("Tag"), "style22");
            returnData += " var l_node" + ch.getString("nodes_ID") + " = creatDService(gra ,\"\",\"" + ch.getString("nodes_ID") + "\",\"" + ch.getString("Name") + "\",0,20,100,110,\"" + ch.getString("nodes_ID") + "\",style22);";
            returnData += "ar" + id + "[" + arr_num + "]= l_node" + ch.getString("nodes_ID") + ";";
            returnData += retch(ch.getString("TO_ID"), ch.getString("nodes_ID"), id, me, ch.getString("nodes_ID"), arr_num);
            returnData += "  makeGroupService(gra ,l_node" + id + ",ar" + id + ");";



            // returnData += get_ch(ch.getString("nodes_ID"));


        }


        return returnData;

    }
    int numer = 0;

    
    
    
    String retch(String id_from, String id_f, String id, int me, String ch, int arr_num22) throws java.sql.SQLException {
        me += 0;
        numer++;
        arr_num22++;

        String returnData = "";


        String[] ch2 = mydb.getRowNocon(XMLDataModel.MYDD252_TABLENAME, "FROM_ID='" + id_from + "'");

        if (ch2[0] != null) {
            xact.mxgraph mx = new xact.mxgraph();

            String sty22[] = mydb.getRowNocon(XMLDataModel.STYLES_TABLENAME, "TYPE='" + "service_" + ch2[2] + "'");
            returnData += mx.returnStyle("service_" + ch2[2], "style");

            returnData += "var l_node" + ch2[0] + " = creatDService(gra ,\"\",\"" + ch2[0] + "\",\"" + ch2[2] + "\"," + me + ",20,100,110,\"" + ch2[0] + "\",style);";
            returnData += "ar" + id + "[" + arr_num22 + "]= l_node" + ch2[0] + ";";
            returnData += "var ehhhhhhd_" + ch2[0] + " = creatEService(gra ,\"\" ,l_node" + id_f + " ,l_node" + ch2[0] + " ,\"leftToRight\",\"\");";
            returnData += retch(ch2[6], ch2[0], id, me, ch2[0], arr_num22);
            returnData += get_ch(ch2[0]);

        } else {
            me = 0;
        }
        return returnData;

    }
*/
%>

<style>
    
    
    
    
    .ajax_con{
        overflow: visible;
            
    
    }
    
    .ajax_con_con{
        
          z-index: 1000000000001;  
         background: wheat;
         position: absolute;
         width:100%;
         top: 150px;
         height:300px;
        
    }
    
    DIV.ajax_con_be{
       height: 1000px;
width: 1500px;
position: absolute;
opacity: 0.5;
background: black;
z-index: 1000000000000;
top: 0px;
right: 0px;
left: 0px;
bottom: 0px;
    }
    
    Div.closs_bt{
          z-index: 1000000000001; 
        position: absolute;
        top:10px;
        right:10px;
        width: 15px;
        height:15px;
        background: #000;
        color:#000;
        padding: 3PX;
        
        background-color: #CBDAEF;
background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #DDE7F5), color-stop(100%, #CBDAEF));

    }
</style>