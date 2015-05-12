<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_favorites() {

    global $lib;

    $datasql = $lib->db->get_data('mod_favorites', " distinct(title ) as title ", ' enabled=1 and `delete`=0 ');

    $data = '<div class=\'data\'><div class=\'block-border\'><div class="block-content">';




    foreach ($datasql as $d2) {


        $d = $lib->db->get_row('mod_favorites', "", " title='" . $d2['title'] . "'");

        if (!is_file($d['icon'])) {


            $d['icon'] = 'images/page_edit.png';
        }

        $data .= '<li class=\'fufli\' id="' . $d['id'] . '" title="' . $d['title'] . '" ><a href=\'' . $d['linke'] . '\'><img src=\'' . $d['icon'] . '\' />' . $d['title'] . '</a></li>';
    }

    $data .= '</div></div></div>';




    return $data;
}
?>


<style>



    #fuf .loder{
        width:100%;
        height:100%;
        position: absolute;
        z-index: 100000;


        background: no-repeat url("images/loading3.gif")  center #fff;
    }

    #fuf.drop-hover .block-content{

        background: #DDD;
        border:#9BA6AB dotted 2px ;

    }

    #fuf.drop-active .block-content{


        background: #fff;
        border:dotted 2px #333;


    }



</style>

<script>



    $(function(){
    
    
    
    
   
        $( ".submenu li,.edit_option ").draggable({
      
            helper: "clone",
            cursor: "move"
            ,
            start: function() {
				   
                $("#fuf").show("slow");}

        }




    );
                
                
      
        
                
        dore();
                
        $("#fuf").droppable({
                     
            activeClass: "drop-hover",
            hoverClass: "drop-active",
            drop: function( event, ui ) {              
                var title =ui.draggable.text(); 
                
                if (ui.draggable.attr("title")=="Edit"){
                    var link = ui.draggable.attr("href");
                    var img = "images/b_edit.png"; 
                }else{
                 
                    var link = ui.draggable.children("a").attr("href");
                    var img = ui.draggable.children("a").children("img").attr("src");    
                 
                }
                
                link=link.replace("&&","&");
                    
                link=link.replace("&&","&");
                    
                var vals=  $.trim(convert(link)) +","+$.trim(img)+","+$.trim(title)+",1" ;   
                var slink= "../getajax.php?file=eng/db_insert&table=mod_favorites&fields=linke,icon,title,enabled&values="+vals;

            
                $.get(slink,function(retdata){
               
              
                    reloadfuf();
                  
                  
                })
               
           
            
            }
                        
                        
                        
                        
                        
                        
        }); 
        
        
        function convert(str)
        {
            
            str = str.replace(/=/g, "%3D");
            str = str.replace('?', "%3F");
            str = str.replace('&', "%26");
            
            str = str.replace('&', "%26");
            
            return str;
        }
        
                
                
        function recycleImage( $item ) {
            $item.fadeOut(function() {
                $item
                .find( "a.ui-icon-refresh" )
                .remove()
                .end()
                .css( "width", "96px")
                .append( trash_icon )
                .find( "img" )
                .css( "height", "72px" )
                .end()
                .appendTo( $gallery )
                .fadeIn();
            });
        }
        
        
        
        
        
        
       
        
        
     
        
       
        
    
    
        $(".showfuf").click(function(){
            $("#fuf").animate({ height: 'toggle'})
        })
    
    
    })



    function addloader(status){
        if (status=="start"){
            $("#fuf .loder").remove(); 
            $("#fuf .block-content").append("<div class='loder'></div>");   
        }else{
     
            $("#fuf .loder").remove(); 
        
        
        }
    
 

       
    
    }

    function reloadfuf(){
            
        var slink= "../getajax.php?file=admin/mod_favorites";
        //  alert ($("#fuf .block-content").width());
        //  $("#fuf li").fadeOut('fast',function(){
        addloader("start");
                    
                    
        $.get(slink,function(retdata){
            $("#fuf  .data").html(retdata);
            //  $("#fuf li").fadeIn('fast');
            addloader("end");
            dore();
                  
        })
                
                
                    
        //})
   
               
               
            
    }
    
    
    
    function dore(){
            
        $("#fuf li ").draggable({
            cancel: "a.ui-icon", 
            revert: "invalid", 		
            helper: "clone",
            cursor: "move"
        });    
                
        $("#main-content").droppable({
                     
              
            drop: function( event, ui ) {      
                
                if (ui.draggable.hasClass('fufli')){
                    var linkid = ui.draggable.attr("title");
                    var slink= "../getajax.php?file=eng/db_delete&table=mod_favorites&field=title&id="+linkid;
                    $.get(slink,function(retdata){
                         
                        reloadfuf();  
                          
                    })}}});        
                
    }
</script>
