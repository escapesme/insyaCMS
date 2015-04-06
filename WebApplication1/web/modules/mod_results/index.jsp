<%@page  import="lib.Options.MyVariables" %>
<%
    String js_link = MyVariables.jsFolder;
%>


<script type="text/javascript" src="/Xact/<%=js_link%>jquery.js" ></script>


<link type="text/css" href="/Xact/<%=js_link%>jqueryui/css/cupertino/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<script type="text/javascript" src="/Xact/<%=js_link%>jqueryui/js/jquery-ui-1.8.13.custom.min.js" ></script>
<style> 
    #demo-frame > div.demo { padding: 10px !important; }
</style> 
<script> 
    $(function() {
        
        
        var xhr;
        xhr = $.get("/Xact/ajax/results/diagnosisRepair.jsp?poent=1",function(data){
            $(".getresuilt").html(data);
                    
        })
        
        $( "#slider-range-max" ).slider({
            range: "max",
            min: 1,
            max: 10,
            value: 1,
            slide: function( event, ui ) {
                
                
                         
                


                if(xhr && xhr.readystate != 4){
                    xhr.abort();
           
                } 
                xhr = $.get("/Xact/ajax/results/diagnosisRepair.jsp?poent="+ui.value,function(data){
                    $(".getresuilt").html(data);
                    
                })
                
                
                
                
                $( "#amount" ).val( ui.value );
            }
        });
        $( "#amount" ).val( $( "#slider-range-max" ).slider( "value" ) );
    });
</script> 









<div style="position:relative; padding: 5px;min-height: 50px; float: left;"class="getresuilt">cccc</div>






<div style="clear: both; width:300px;">
    <label for="amount">llpoint:</label> 
    <input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold;" /> 
    <div  id="slider-range-max"></div>
</div> 

























