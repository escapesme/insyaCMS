
<%@page import="lib.Options.MyVariables"%>
<%@page import="lib.Options.XMLDataModel"%>
<%    String js_link = "../" + MyVariables.jsFolder;%>
<script type="text/javascript" src="<%=js_link%>jquery.js" ></script>
<%


    out.print("<div class=\"debug_all\"><select class=\"typeselect\">");
    for (int i = 0; i < XMLDataModel.DEBUGTYPE.length; i++) {
        out.print("<option> " + XMLDataModel.DEBUGTYPE[i] + "</option>");
    }
    out.print("</select><input class=\"typeselecttxt\"  />"
            + "<input type=\"button\" class=\"goupdate\" value=\"GO\" /></div>"
            + "<iframe class=\"typeShow\" src=\"\"></iframe>");





%>
<script>
    
    function typeUpdate(type){
        
        $(".typeShow").attr("src","debugBody.jsp?type="+type);
        
        
    }
    
    
    
    $(function(){
        
        

        $(".typeselect").change(function(){
        
            typeUpdate($(this).val());
        
        })
    
        $(".goupdate").click(function(){
        
            typeUpdate($(".typeselecttxt").val());
        
        })
        
        
        $(".typeselecttxt").keypress(function(e) {
            if(e.keyCode == 13) {
                typeUpdate($(this).val());
            }
        });
        
        
    })
</script>
<style>

    .debug_all{
        width:100%;
        clear: both;
        background: #888;
        border:1px solid #888;

    }
    iframe{


        width: 100%;
        height: 550px;  
        border:1px solid #888;
        overflow: auto

    }

</style>