<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>
<%

    String retdata = "<div class='mydata'>";
    retdata += "<div class=\"frm_row do_left\">"
            + "<div class=\"frm_label\">Trajectory</div>"
            + "<div class=\"frm_input\"><select class='pb_id'>";

    lib.engine.db.operations db = new lib.engine.db.operations();

    String[] res_id = request.getParameter("res_id").split("__");

    String mod_id = res_id[1];

    if (mod_id == null || mod_id.equals("")) {


        mod_id = res_id[2];

    }

    retdata += mod_id;

    db.openCon();
    ResultSet rs = db.getData(XMLDataModel.BUSINESS_PROCESS_TABLENAME, "", "MODEL_ID=" + mod_id);


    while (rs.next()) {
        retdata += "<option value='" + rs.getString("ID") + "'>" + rs.getString("NAME") + "</option>";
    }
    retdata += "  </select></div></div></div>";

    db.closeCon();
    out.print(retdata);
%>
<div class="do_center">
    <input type="button" value="Chronograph" class="chr_ChronoWindows ">
    <input type="button" value="Cancel" class="Cancel_ChronoWindows  ">
</div>

<script>
    $(function(){
        
        $(".chr_ChronoWindows").click(function(){
        
            call(2,"#show_chronoview");
            var x2 = new Array(defajax);
            ajaxAbort(x2);
 
           
            defajax=loadAjax("ajax/results/chronograph/chrono.jsp?id="+$(".pb_id").val()+"&res_id=<%=request.getParameter("res_id")%>",".chronoview","start,main"); 
            
            showMyloading(".main","end");
            closeWindows("chronoWinwods");
        
        })  
          $(".Cancel_ChronoWindows").click(function(){
        
           
            closeWindows("chronoWinwods");
        
        })
        
    })
    
   
    
</script>