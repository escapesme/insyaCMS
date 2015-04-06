function getDate(my_input){
    $( "#" +my_input ).datepicker({
        dateFormat:"dd/mm/yy"
    });

}



$(function(){


    $(".window-default").draggable();




    $(".startbt").click(function () {

        $(this).toggleClass("act");
        $(".startdiv").slideToggle("fast");

    });






})
$(function(){


    $(".menublock").click(function(){

        $(".adminSubMenu").slideUp("fast");
        $(this).children(".adminSubMenu").slideToggle("fast");



    })
/* $(".menublock").hover(function(){
    
        $(this).children(".adminSubMenu").fadeIn();
    },
    function(){
    
        $(this).children(".adminSubMenu").fadeOut();
    }
    )*/

})

function jsEditAndDelete(){
    
    
    $(function(){
        $(".form_apply").click(function(){
           
      
           
           
            $(".form_input").submit();
        })
    })
    
}
     
$(function(){
    $(".up_date_clo").click(function(){
          
     
        var myff=$(this).attr("id")
          
          
        $(".th_status").val(myff);
    
        $(".admin_list_form").submit();

    })
})
function jsForList(){
    

    $(function(){
       
        $(".enable_bt").click(function(){
            $(".status").val("enable");
            $(".admin_list_form").submit();
        })
           
           
           
           
        $(".disable_bt").click(function(){
           
            $(".status").val("disable");
            $(".admin_list_form").submit();
        })
       
       
      
        $(".delete_many").click(function(){
           
           
           
            $(".status").val("delet_m");
            $(".admin_list_form").submit();
        })
        $(".del_one_bt").click(function(){
     
            var answer = confirm("Are you sure you want to delete ?")
            if (answer){
		  
                var myId= $(this).attr("id");

                $(".del_one").val(myId);
       
                $(".admin_list_form").submit();
      
            }
	
        
    
      
        })
  
    })
  
  
}
  
  
  
  

      


function getAutocomplete(my_input,data){
    
 

    
    $(function() {
        var availableTags = data.split(",");
        $( "#"+my_input ).autocomplete({
            source: availableTags
        });
	
  
    })   
}



function getUploder(my_input){
   

    function createUploader(){            
        new qq.FileUploader({
            element: document.getElementById(my_input),
            action: 'ajax/OctetStreamReader.jsp',
            debug: true
        });           
    }
    window.onload = createUploader;



}
function getColorPicker(my_input){
    $('#'+my_input).ColorPicker({
        onSubmit: function(hsb, hex, rgb, el) {
            $(el).val(hex);
            $(el).ColorPickerHide();
        },
        onBeforeShow: function () {
            $(this).ColorPickerSetColor(this.value);
        }
    })
    .bind('keyup', function(){
        $(this).ColorPickerSetColor(this.value);
    });
}
function getNmuber(my_input){
    // $("#number,#decimal,#hour,#alpha,#alphanumeric,#email,#date").jsfield({ type: "number,decimal,hour,alpha,alphanumeric,email,date" }); 
    $("#"+my_input).jsfield({
        type: "number"
    }); 

}
function getEditor(id){

    tinyMCE.init({
        // General options
        mode : "exact",
        elements : ""+id+"",
        theme : "advanced",
        plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",

        // Theme options
        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,

        // Example content CSS (should be your site CSS)
        content_css : "css/content.css",

        // Drop lists for link/image/media/template dialogs
        template_external_list_url : "lists/template_list.js",
        external_link_list_url : "lists/link_list.js",
        external_image_list_url : "lists/image_list.js",
        media_external_list_url : "lists/media_list.js",

        // Replace values for the template plugin
        template_replace_values : {
            username : "Some User",
            staffid : "991234"
        }
    });
    
    
   
  



}
/*

function showloading(url,myclass){
    
    
    var xhr;
    
    //$("."+myclass).append("<div class=\"loading\"><img src=\"/Xact/images/ajax-loader.gif\" /> </div>");
    
    if(xhr && xhr.readystate != 4){
        xhr.abort();
           
    } 
                
                
    xhr = $.get(url,function(data){
        $("."+myclass).html(data);
                    
    })
        
    
    
    
}
*/





