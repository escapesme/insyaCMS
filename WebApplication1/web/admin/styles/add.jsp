<script>
    $(function(){

        function ret_val(id){

            return $("#"+id).val();

        }

        function chkdo_val(id){
            var st=$("#"+id).attr("checked");
            var ret="";
            if (st==true){
                ret="1";
                
            }else{
                ret="";
            }
           
            return ret;
         

        }




        function dojx(){
        
            //function makstyle(STYLE_GRADIENTCOLOR,STYLE_STROKECOLOR,STYLE_FILLCOLOR,STYLE_FONTCOLOR,STYLE_FONTFAMILY,STYLE_SHADOW,STYLE_ROUNDED,STYLE_GLASS,STYLE_VERTICAL_ALIGN,STYLE_VERTICAL_LABEL_POSITION,STYLE_ROTATION){

            var data_send="?STYLE_FILLCOLOR="+ret_val("STYLE_FILLCOLOR")+
                "&STYLE_GRADIENTCOLOR="+ret_val("STYLE_GRADIENTCOLOR")+
                "&STYLE_STROKECOLOR="+ret_val("STYLE_STROKECOLOR")+
                "&STYLE_FILLCOLOR="+ret_val("STYLE_FILLCOLOR")+
                "&STYLE_FONTCOLOR="+ret_val("STYLE_FONTCOLOR")+
                "&STYLE_FONTFAMILY="+ret_val("STYLE_FONTFAMILY")+
                "&STYLE_SHADOW="+chkdo_val("STYLE_SHADOW")+
                "&STYLE_ROUNDED="+chkdo_val("STYLE_ROUNDED")+
                "&STYLE_GLASS="+chkdo_val("STYLE_GLASS")+
                "&STYLE_VERTICAL_ALIGN="+ret_val("STYLE_VERTICAL_ALIGN")+
                "&STYLE_HORIZONTAL="+ret_val("STYLE_HORIZONTAL")+
                "&STYLE_VERTICAL_LABEL_POSITION="+ret_val("STYLE_VERTICAL_LABEL_POSITION")+
                "&STYLE_LABEL_POSITION="+ret_val("STYLE_LABEL_POSITION")+
                
                "&HEIGHT="+ret_val("HEIGHT")+
                "&WIDTH="+ret_val("WIDTH")+
                "&SHAPE="+ret_val("SHAPE")+
                "&STYLE_ROTATION="+ret_val("STYLE_ROTATION");



            //  alert (data_send);
            $.get("ajax/admin/getStylePreview.jsp"+data_send,function(data){$(".preview_body").html(data);})

   alert (data);


//alert ("fsdfsdfsdf");
        }
        //dojx();




        $("input").click(function()
        {
            dojx();
        });
        /*$("input").change(function(){


       
            dojx();
        })*/

    })
</script>

<div>
    <%@taglib uri="/WEB-INF/tlds/engine" prefix="engine"%>
    <engine:adminBody mode="add" title="Styles" name="styles" morefields="<div class=\"preview_panel window-default\"><a ></a><div class=\"admin_list_title\">preview</div><div class=\"preview_body\"></div></div>" />


</div>
