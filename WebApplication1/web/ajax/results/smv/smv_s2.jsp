<%@page import="xact.utils"%>
<%@page import="java.sql.SQLException"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.ResultSet"%>
<script>
    $(function(){
        
        function getmydata(id){
           $(".bt.Detail").css("color","#eee");
            $(".mysmvid").val(id);
            var x2 = new Array(defajax,defajax2);
            ajaxAbort(x2);
            defajax=loadAjax("ajax/results/smv/smvBody.jsp?id="+id+"&point=<%=request.getParameter("point")%>&res_id=<%=request.getParameter("res_id")%>&temp=<%=request.getParameter("template")%>",".smv_body","all,main") ;
        }
        
        $(".select_ch").change(function(){
            var id=$(this).val();
            getmydata(id); 
        }) 
        
        var id=  $(".select_ch").val();
        getmydata(id);
        
    }) 
</script>



<div class="smv">

    <div class="smv_top">

        <div><label for="select_ch"></label>
            <select class="select_ch" name="select_ch"> 
                <%
                    String temp = request.getParameter("template");


                    if (temp.equals("0")) {


                        out.print(fillcombo(request.getParameter("res_id").split("__")[1], request.getParameter("res_id").split("__")[2], request));


                    } else {


                        out.print(fillcomboTemp(request.getParameter("res_id").split("__")[1], request.getParameter("res_id").split("__")[2], request, temp));

                    }

                %>
            </select>

            <input type="button" value="Collapse All" class="bt Collapse_All"/>
            <input type="button"  value="Detail " class="bt Detail"/>
            <div class="Detailoding"></div>  
        </div>
        <div class="smv_body"> </div>



    </div>


</div>



<%!
 utils u = new utils();
    String fillcomboTemp(String modID,String sid, HttpServletRequest request, String Temp) {
        String retdata = "";


        lib.engine.db.operations db = new lib.engine.db.operations();

        String[] row = db.getRow(XMLDataModel.PATH_TEMPLATE_TABLENAME, "ID='" + Temp + "'");
        String[] path = row[2].split("__");
        for (int i = 0; i < path.length; i++) {
            String name = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + path[i])[2];
            String tag = db.getRow(XMLDataModel.SERVICE_PROCESS_NODES_TABLENAME, "ID=" + path[i])[1];
if (u.getISScenarioPram(modID, sid, path[i], "ACTIVE_STATUS").equals("-1")) {
            if (!tag.equalsIgnoreCase("Start")
                    && !tag.equalsIgnoreCase("End")
                    && !tag.equalsIgnoreCase("service")
                    && !tag.equalsIgnoreCase("insertion")
                    && !tag.equalsIgnoreCase("collector")
                    && !tag.equalsIgnoreCase("activity")
                    && !(tag.equalsIgnoreCase("task") && tag.equalsIgnoreCase("preperation"))) {
                retdata += "<option  value='" + path[i] + "' >" + name + "</option>";
            }
}
        }
        return retdata;


    }

    String fillcombo(String modID, String sid, HttpServletRequest request) throws SQLException {
       
        String retdata = "";
        xact.results.imapctPath im = new xact.results.imapctPath();
        lib.engine.db.operations db = new lib.engine.db.operations();
        db.openCon();
        ResultSet mynode = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "*", "MODEL_ID='" + modID + "'");


        while (mynode.next()) {

            String status = "";

            String mid = mynode.getString("ID");


            if (u.getISScenarioPram(modID, sid, mid, "ACTIVE_STATUS").equals("-1")) {


                if (mid.equalsIgnoreCase(request.getParameter("id"))) {
                    status = "selected=\"selected\"";


                } else {
                    status = "";
                }



                retdata += "<option " + status + " value='" + mynode.getString("ID") + "' >" + mynode.getString("Name") + "</option>";
                retdata += im.get_Childrens3option(mynode.getString("ID"), request.getParameter("id"),modID,sid);

            }
        }
        db.closeCon();
        return retdata;
    }
%>





</div>