<?php
session_start();
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_productes_cart($pro) {
    global $lib;


    $data = "<div class='mycart'>";

    $pros = explode(";;", $_SESSION[cart_productes]);
    $nums = explode(";;", $_SESSION[cart_nums]);



    $data .= "<table class='order_table'>";

    for ($i = 0; $i < count($pros); $i++) {
        if ($pros[$i] != "") {


            $data .="<tr><td class='createdelete' id='" . $nums[$i] . "__" . $pros[$i] . "'></d><td></td><td>" . $pros[$i] . "</td></tr>";
        }
    }
    $data .= "</table>";

    $data .= "</div><div class='cart_order'>شراء</div>
        <div class='od_order'><div class='data'></div>
        <div class='bt_close'></div></div>";

    return $data;
}
?>

<script>
    $(function(){
        




        $(".bt_close").click(function(){
            
            $(".od_order").hide("slow");
        })
        
        
        $(".cart_order").click(function(){
            var status2= sendAjax("productes/get_order","",".od_order .data");
            status2.done(function() {
   
                $(".od_order").show("slow");
            });
    
        })


        $(".createdelete").click(function(){
              

            var status=    sendAjax("productes/addtocart","item="+$(this).attr("id")+"&stat=delete",'.backstat2');
    
            status.done(function() {
         
                updateModule("order",".order_module",'<?= $_GET['alias'] ?>');
            });
     
        })
    })
</script>
<style>
   
    .order_table{
        direction: rtl;
        width:100%
            ;
         clear: both; margin-top: 35px;
    }
    
    .order_table td{
        
        border: solid 1px  #571C13;
       
    }
    
    
    .bt_close{
        width:16px;
        height:16px;
        background: #999;
        position: absolute;
        top:10px;
        right:10px;

    }
</style>