
<%@page import="xact.TableDetail"%>
<%
String descId=request.getParameter("descid");
String instanceId=request.getParameter("instanceid");
TableDetail td=new TableDetail();
out.print(td.tableData(descId, instanceId));
%>
<style>
    .tabledata{
        height: 250px;
        overflow: auto;
    }
    .tabledata legend{
        color: cornflowerblue;
        font-size: 10pt;
        font-weight: bolder;
    }
    
    
</style>
<script>
 $(function(){
        
        

        
        
        
        
  
        $(".tableinstances").change(function(){
             var indexInst=$(this).val();
              var  descId="<%=descId%>";
               $.get("ajax/tableDetail.jsp?descid="+descId+"&instanceid="+indexInst,function(mdata){
          
                $(".tabledata").html(mdata);
                
                    

            })
             })
        })
</script>