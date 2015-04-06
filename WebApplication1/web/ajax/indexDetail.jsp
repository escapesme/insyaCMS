
<%@page import="xact.IndexDetail"%>
<%
String descId=request.getParameter("descid");
String instanceId=request.getParameter("instanceid");
IndexDetail id=new IndexDetail();
out.print(id.indexTable(descId, instanceId));
%>
<style>
    .indexdata{
        height: 250px;
        overflow: auto;
    }
    
  .indexdata legend{
        color: cornflowerblue;
        font-size: 10pt;
        font-weight: bolder;
    }
</style>
<script>
    
     $(function(){
        
        

        
        
        
        
  
        $(".indexinstances").change(function(){
             var indexInst=$(this).val();
             alert(indexInst);
              var  descId="<%=descId%>";
               $.get("ajax/indexDetail.jsp?descid="+descId+"&instanceid="+indexInst,function(mdata){
          
                $(".indexdata").html(mdata);
                
         
             

            })
             })
        })
</script>