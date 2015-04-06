
<script type="text/javascript" src="includes/js/jquery.tablescroll.js" ></script>
<script>
    
    
    
    function aftergetcom(){
        
    
        $('.rmvbotton_left').tableScroll({top:50});
        
        function acdetail(data){
            $(".mxWindow").remove();
            return "<div class=\"mydata\"><table><thead><th>Server</th><th>Machine</th><th>Partition</th><th>Disk Name</th><th>Activity</th><th>RT</th><th>QT</th><th>a1</th><th>Contribution</th></thead>"+data+"</table></div>";     

        }
        
        
        $(".lv1").toggle(function(){
            
           
            $(".lv2").hide();
            
        },
        function(){
        
            $(".lv2").show();
        
        
        
        })
        
        
        
        
        $(".Detail").click(function(){
            
            var doid=$(".showtabel1.act").attr("id");
            showMyloading(".Detailoding","start","small");
            
                  
            var x2 = new Array(defajax,defajax2,defajax3);
            ajaxAbort(x2);
                  
            defajax=$.get("ajax/results/rmv/getACDetail.jsp?id="+doid+"&point=<%=request.getParameter("point")%>&modid=<%=request.getParameter("res_id").split("__")[1]%>&sid=<%=request.getParameter("res_id").split("__")[2]%>" ,function(data){
                $(".mxWindow").remove();
          
          
                makeWinDows("AC Detail", "AC_Dateil" ,acdetail(data),450, 150,600,null);
                showMyloading(".Detailoding","end","small");
            })
          
          
          
          
        })
        
        
        
        
      
        
        
      
            
            
            
        
       
        var mod_id="<%= request.getParameter("res_id").split("__")[1]%>";
        var s_id="<%=request.getParameter("res_id").split("__")[2]%>";
       
    
      
      
        $(".showtabel1").click(function(){
            $(".showtabel1").removeClass("act");
            $(this).addClass("act");
            $(".bt.Detail").css("color","#000");
        })
        
        
        
        $(".showtabel2").click(function(){
   
            
            var myid=$(this).attr("id");
        
            var myids="";
            $("."+myid+"ch").each(function(){
            
                myids+="_"+$(this).attr("id");;
            
            
            
            })
        
        
            
      
            /*
               var x2 = new Array(defajax,defajax2);
        ajaxAbort(x2);
        defajax=loadAjax("ajax/results/rmv/getRMVComponents.jsp?status=getAcValues_all&modid="+mod_id+"&ids="+myids+"&sid="+s_id,".acval","all,main")   
        
             */
        
        
        
        
            
    
            
            
            
            
            
            
            
            
           
        })
        
        
 
    
    }
    $(function(){
    
     
        $(".st_typs").change(function(){
            var mys=$(this).val();
            
            
            
            if (mys=="server"){ mys+=",terminal";$(".nots").show();  }else{
                
                $(".nots").hide();               
                
            }
            
            
            
            
         
    
      
        
        

    
        
            $.get("ajax/results/rmv/getRMVComponents.jsp?point=<%=request.getParameter("point")%>&modid=<%=request.getParameter("res_id").split("__")[1]%>&stype="+mys+"&sid=<%=request.getParameter("res_id").split("__")[2]%>",function(data){
                $(".st_names").html(data);
                $(".st_names").change();
            })
                
         
         
            
        })
        
        
        
        
        $(".st_names").change(function(){
            
            
            
            
           
            
            var mys=$(this).val();
            
            
            var ty=$(".st_typs").val();
 
            if (ty=="server"){
                
                
                
                $.get("ajax/results/rmv/getRMVComponents.jsp?point=<%=request.getParameter("point")%>&status=getComps&modid=<%=request.getParameter("res_id").split("__")[1]%>&val="+mys+"&sid=<%=request.getParameter("res_id").split("__")[2]%>",function(data){
                    $(".st_comps").html(data);
   
                   $(".st_comps").change();
                })
                
            }else{
                    
                    
                someevntes("0","0",$(".st_names").val(),$(".st_typs").val());
            }
            
            
            
            
        
        
        
        
            $(".st_comps").change(function(){
                var mys=$(this).val();
            
            
                var ty=$(".st_typs").val();
           
            
                var names=$(".st_names").val();
                if (ty=="server"){
                    
                    
                    
                    
                    
                    $.get("ajax/results/rmv/getRMVComponents.jsp?point=<%=request.getParameter("point")%>&status=getparttion&modid=<%=request.getParameter("res_id").split("__")[1]%>&val="+names+"&comps="+mys+"&sid=<%=request.getParameter("res_id").split("__")[2]%>",function(data){
               
               
                        $(".st_parttions").html(data);
                    
                    
                      $(".st_parttions").change();
                        
                        
                    })
                    
                    
                    
                }
            
            
            
            
            })
        
        
        
        
       
        
   
   
            $(".st_parttions").change(function(){
     
   
                mys=   $(".st_names").val();
                var ty=$(".st_typs").val();
                var mac=$(".st_comps").val();


                var part=   $(this).val();
                someevntes(mac,part,mys,ty);

            
            
            })
        
        


        })






        
        
    })
    
    
    $(".st_typs").change();
    
    $(".r1").click(function(){
        someevntes($(".st_comps").val(),$(".st_parttions").val(),$(".st_names").val(),$(".st_typs").val());
    
    })
    
    function someevntes(mac,part,mys,ty) {
        var myr1=$(".r1:checked").val();
    


        showMyloading(".main","start");
    
        $(".myifram").attr("src","ajax/results/rmv/rmvchart.jsp?point=<%=request.getParameter("point")%>&mac="+mac+"&modid=<%=request.getParameter("res_id").split("__")[1]%>&id="+mys+" &type="+ty+"&part="+part+"&sid="+<%=request.getParameter("res_id").split("__")[2]%>);

            
    
          
        var x2 = new Array(defajax,defajax2);
        ajaxAbort(x2);
        defajax=loadAjax("ajax/results/rmv/getRMVComponents.jsp?point=<%=request.getParameter("point")%>&status=TotalCom&mac="+mac+"&part="+part+"&modid=<%=request.getParameter("res_id").split("__")[1]%>&id="+mys+"&type="+ty+"&sid=<%=request.getParameter("res_id").split("__")[2]%>",".rmvmid_left .data22","start,main")   
        defajax2=   $.get("ajax/results/rmv/getRMVComponents.jsp?point=<%=request.getParameter("point")%>&type="+ty+"&rc="+myr1+"&status=getACTabel&mac="+mac+"&modid=<%=request.getParameter("res_id").split("__")[1]%>&sid=<%=request.getParameter("res_id").split("__")[2]%>&id="+mys+"&part="+part,function(data2){
            $(".actabel").html(data2);
            showMyloading(".main","end");
            
            aftergetcom();
        }) 
    }
    
    
    
</script>




<div class="rmvTop" > 
    <div class="rmvcomTop"><label>Type</label>

        <select class="st_typs">
            <option>    </option>
            <option selected value="server">Server</option>
            <option>Human</option>
            <option>Vehicle</option>
            <option>Machine</option>
        </select></div>
    <div class="rmvcomTop"><label>Name</label><select class="st_names"><option></option></select></div>
    <div class="rmvcomTop nots"><label>Machine</label><select class="st_comps"><option></option></select></div>
    <div class="rmvcomTop nots"><label>Instance</label><select class="st_parttions" ><option></option></select></div>

    <input  class="rmvcomTop bt CollapseAll" type="button" name="CollapseAll"   value="Collapse All" />
    <input  class="rmvcomTop bt Detail" type="button" name="Detail"   value="Detail" />
    <div class="Detailoding"></div>  

</div>



<div class="rmvmid" > 
    <div class="rmvmid_left">

        <div class="data22"></div>
        <input type="radio" checked name="ri" class="r1" value="uz" />Utilization <br/> Resource Consumed
        <br/> <input  type="radio" name="ri" class="r1"  value="di" />Distribution  <br /> Resource Consumed /Total Resource Consumed
    </div>

    <div class="rmvmid_right">


        <div class="Showchart">





            <iframe class="myifram"  scrolling="no" style="border: none; overflow: auto; width:400px ;height:180px" >



            </iframe>



        </div>  

    </div>


</div>


<div class="rmvbotton" > 

    <div class="actabel"></div>

</table>



<!--<table class="rmvbotton_right">

  <thead><th>Throughput</th><th>Response time</th><td>Resource utilization</th><th>a1= Conflicts contentions</th><th>a2= Availability delays</th><th>a3= Database impact on server</th><th>a4= Incidental</th></thead>
 <tbody class="acval"></tbody>
</table>-->


</div>
<style>


    .showtabel1.act{
        text-decoration: underline;
        font-weight: bolder;


    }

    .lv1{

        background-color: lightgreen
    }

    .lv2 {
        background-color: lightyellow
    }

    .rmvbotton th {
        border: none;
        font-size: 10pt;
        font-weight: bold;
        color: #343434;
        border-left: #D9DADE solid 1px;
        padding: 2px;
        height: 50px;
        border-image: initial;
    }


    .rmvbotton thead {
        height: 50px;
        background: #DDDBDB;



    }


    .rmvbotton,
    .rmvmid,
    .rmvTop{

        width:100%;
        clear: both;

    }
    .rmvbotton{

        position: absolute;
        top:220px;
        bottom:0px;
        width:96%;overflow: auto;


    }
    .rmvbotton_right,

    .rmvmid_right{
        float:right;
        width:49%;



    }



    .rmvmid_left ,.rmvmid_right{
        border:1px #333 solid;
        float:left;
        margin: 8px;
        padding :5px;
        height:150px;
        width:70%;
        border-radius: 18px 18px 18px 18px;

        font-size: 10pt; 

    }

    .rmvmid_right{
        float:right;
        border:none;
        width:23%;
    }


    .rmvmid_right .Showchart{



        width: 100%;
        text-align: center;
        overflow: hidden;
        height: 166px;

    }
    .rmvbotton_right {
        float:right;
    }


    .rmvbotton_left,
    rmvmid_left{
        float:left;
        width:100%;
    }
    .rmvbotton_left{
        border: 1px #DDDBDB solid;
        margin-top: 5px;
    }


    .rmvcomTop {
        float:left;
        margin: 7px;
        border: 1px solid #eee;

    }




    *{

        font-family: "arial";
        font-size:  8pt;
    }


</style>