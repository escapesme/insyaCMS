<%-- 
    Document   : opspram
    Created on : Dec 25, 2011, 2:57:09 PM
    Author     : ismail
--%>
<%@page import="xact.users.users"%>


<%@page import="java.sql.ResultSet"%>
<%@page import="lib.Options.XMLDataModel"%>





<%

    String mod_id = request.getParameter("mod_id");
    String pro_id = request.getParameter("pro_id");
    String Group_Name = request.getParameter("Group_Name");
    String defnum = request.getParameter("defnum");




    String des = request.getParameter("des");
    String winnum = request.getParameter("winnum");




    users u = new users();


    String print_id_b = request.getParameter("print_id_b");
    String print_id_a = request.getParameter("print_id_a");



    if (print_id_b != null && print_id_b.equals("")) {
        print_id_b = mod_id;
    }
    if (print_id_b != null && print_id_a.equals("")) {
        print_id_a = mod_id;
    }
%>



<script>
    
    $(function(){
        
        var num_id=0;
     
        $(".ops_Finish").click(function(){
            var Group_name="<%=Group_Name%>";
           
            var pro_id="<%=pro_id%>";
          
            var defnum="<%=defnum%>";
      
            var winnum="<%=winnum%>";
            
       
            winnum--;
            var des="<%=des%>";
            var mod_id="<%=mod_id%>";
            var print_id_b="<%=print_id_b%>";
            var print_id_a="<%=print_id_a%>";
            
            var ins_name=$(".ins_name").val();
            
            if($.trim(ins_name)!=""){
            
            
                var s1_name=Group_name +"_P_"+ ins_name;
                var s2_name=Group_name +"_A_"+ ins_name;   
            
                   
            
                var owner="<%=u.userReturn(request, "username")%>";
        
                var CLIENT_ID="<%=u.userReturn(request, "cid")%>";
                var GROUP_ID="<%=u.userReturn(request, "gid")%>";
            
            
            
            
            
            
            
            
            
            
                var fildes="MODEL_ID;PARENT_ID;NAME;DESCRIPTION;SCENARIO_TYPE;ID;OWNER;GROUP_ID;CLIENT_ID";
       
         
 
            
      
            
                $.get("ajax/engine/getID.jsp",function(id){
            
          
                    var values_1=<%=mod_id%>+";"+print_id_b+";"+s1_name+";"+des+";3;"+id+";"+owner+";"+GROUP_ID+";"+CLIENT_ID;
                
                    //   alert (fildes +"\n"+values_1);   
                
                    $.get("ajax/engine/DBInsert.jsp?table=<%=XMLDataModel.SCENARIO_TABLENAME%>&fildes="+fildes+"&values="+values_1,function(datakkkk1){
                                
       
                
                        $.get("ajax/engine/getID.jsp",function(ggid){
            
                            var values_2=<%=mod_id%>+";"+print_id_a+";"+s2_name+";"+des+";4;"+ggid+";"+owner+";"+GROUP_ID+";"+CLIENT_ID;
                            $.get("ajax/engine/DBInsert.jsp?table=<%=XMLDataModel.SCENARIO_TABLENAME%>&fildes="+fildes+"&values="+values_2,function(dataccccccc2){
                
                                do_prm(s1_name ,s2_name);
               
                                $(".mxWindow").remove();
                
                           
                                if (winnum>0){
                                    makeWinDows("Create Ops Compute2", "CreateOpsCompute2" ,Create_ops_compute2(pro_id,mod_id,Group_name,winnum,ggid,id,defnum,des),450, 150,400,null);
                
                                }else{
                                    uodatemodels(pro_id);  
                                }
                            
                
                
                
                
                            })
                
                        })
                    })
                })
            
        
            }else{
         
         
                alert ("Instance Name  cannot be empty!") ;
         
         
         
            }
        
      
        })
        
        
        
        
        
        
        
        $(".do_cancel").click(function(){
    
            $(".mxWindow").remove();})
    
            
    })
    

    function do_prm(s1_name ,s2_name){
          
          
        
            
        $(".bb_id").each(function(){
            var oldid=$(this).next(".Override").attr("id");
            var newid=$(this).next(".Override").val();
            var my_id=$(this).val();
            
                       
            if(newid!=oldid){
                do_data(s1_name,newid,oldid,my_id);
                do_data(s2_name,newid,oldid,my_id);
                
            };
        }) 
            
            
        $(".ins_id").each(function(){
                        
                        
            var oldid=$(this).next(".Override").attr("id");
            var newid=$(this).next(".Override").val();
            var my_id=$(this).val();
            if(newid!=oldid){
    
                do_data2(s1_name,newid,oldid,my_id);
                do_data2(s2_name,newid,oldid,my_id);
            
            }
        })
            
            
    }
    
   
    function do_data2(s1_name,newid,oldid,my_id){ 
    
        $.get("ajax/engine/returnValue.jsp?table=<%=XMLDataModel.SCENARIO_TABLENAME%>&filde=id&ofilde=name&id="+s1_name,function(dat22a){
                        
         
               
            $.get("ajax/engine/getID.jsp",function(myggid){
                
                var fildes="MODEL_ID;SCENARIO_ID;ID;OBJECT_ID;OBJECT_CLASS;S_PARAMETER;NEW_VALUE;OLD_VALUE";
                             
                var values=<%=mod_id%>+";"+dat22a+";"+myggid+";"+my_id+";com.acrtek.xact.data.bo.BoInsertion;OCCURENCE;"+newid+";"+oldid;
                          
                $.get("ajax/engine/DBInsert.jsp?table=<%=XMLDataModel.SCENARIO_PARAMETERS_TABLENAME%>&fildes="+fildes+"&values="+values,function(data2){
                                
                    //alert (data2);
                                
                });
                        
            });      
            
        });         
    }
    
    
    function do_data(s1_name,newid,oldid,my_id){ 
    
        $.get("ajax/engine/returnValue.jsp?table=<%=XMLDataModel.SCENARIO_TABLENAME%>&filde=id&ofilde=name&id="+s1_name,function(dat22a){
                        
         
               
            $.get("ajax/engine/getID.jsp",function(myggid){
           
                var fildes="MODEL_ID;SCENARIO_ID;ID;OBJECT_ID;OBJECT_CLASS;S_PARAMETER;NEW_VALUE;OLD_VALUE";
                             
                var values=<%=mod_id%>+";"+$.trim(dat22a)+";"+myggid+";"+my_id+";com.acrtek.xact.data.bo.BoBusinessEntity;number;"+newid+";"+oldid;
                
                
            
                $.get("ajax/engine/DBInsert.jsp?table=<%=XMLDataModel.SCENARIO_PARAMETERS_TABLENAME%>&fildes="+fildes+"&values="+values,function(data2){
                                
               
                                
                });
                        
            });          });         
    }
    
    
    
</script> 




<%
    xact.ArrivalRateCalculator a = new xact.ArrivalRateCalculator();


    lib.engine.db.operations db = new lib.engine.db.operations();
    db.openCon();
    ResultSet rs = db.getData(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "*", "model_id='" + mod_id + "'");




    out.print("<div class=\"obsTabel\"><div>Instance Name <input  name=\"ins_name\" class=\"ins_name\"/></div><h3>Businss Entity Override values <h3><table><thead><th>Name</th><th>RefModel</th><th>Override</th> <thead>");

    while (rs.next()) {
        String Override_val = lib.tools.Utils.getScenarioPram(mod_id, "", rs.getString("id"), "number", rs.getString("number"), "business_entity");
        out.print("<tr><td>" + rs.getString("name") + "</td><td>" + rs.getString("number") + "</td><td><input type=\"hidden\" class=\"bb_id\" name=\"obs_id\" value=\"" + rs.getString("id") + "\" ><input type=\"text\" style=\"width:98%;\" name=\"Override\" class=\"Override\" id=\"" + rs.getString("number") + "\" value=\"" + Override_val + "\" ></td></tr> ");
    }


    out.print("<table/>");



    ResultSet rs2 = db.getData(XMLDataModel.SERVICE_INSERTION_TABLENAME, "*", "model_id='" + mod_id + "'");




    out.print("<h3>Insertion Point Override values <h3><table><thead><th>Insertion Point</th><th>Collector</th><th>Override</th> <thead>");



    while (rs2.next()) {




        String[] rs3 = db.getRowNocon(XMLDataModel.SERVICE_COLLECTOR_TABLENAME, "id='" + rs2.getString("ATTRIB_ID") + "'");



        String Override_val = lib.tools.Utils.getScenarioPram(mod_id, "", rs2.getString("id"), "OCCURENCE", rs2.getString("OCCURENCE"), "Insertion");
        String inp = rs2.getString("id") + ":" + "OCCURENCE:" + rs2.getString("OCCURENCE");




        if (defnum.equals(winnum)) {

            inp = "<input type=\"text\" style=\"width:98%;\" name=\"Override\" class=\"Override\" id=\"" + rs2.getString("OCCURENCE") + "\" value=\"" + Override_val + "\" >";
        } else {

            inp = Override_val;



        }



        out.print("<tr><td>" + rs2.getString("name") + "</td><td>" + rs3[2] + "</td><td><input type=\"hidden\" class=\"ins_id\" name=\"obs_id\" value=\"" + rs2.getString("id") + "\" >" + inp + "</td></tr>  ");



    }


    out.print("<table/></div><div class=\"do_center\"><input type=\"button\" class=\" ops_Finish\"  value=\"Finish\">      <input type=\"button\" class=\"do_cancel\"  value=\"Cancel\">");



    db.closeCon();
%>




<style>

    .obsTabel th{

        border:2px #888 solid;
    }
    .obsTabel td{

        border:1px #888 solid;
    }

    .obsTabel table {
        width:100%;

    }
</style>
