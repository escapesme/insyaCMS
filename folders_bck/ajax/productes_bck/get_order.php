<?php
session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$data = "<div class='mycart' >";

$pros = explode(";;", $_SESSION[cart_productes]);
$nums = explode(";;", $_SESSION[cart_nums]);



$data .= "<table class='order_table' style='margin-top:25px;'>";

for ($i = 0; $i < count($pros); $i++) {
    if ($pros[$i] != "") {
        $data .="<tr><td class='createdelete' id='" . $nums[$i] . "__" . $pros[$i] . "'>delete</d>
            <td style='width:40px;'><input  style='width:40px;' class='number' value='1' name='number'  type='text'/></td><td>" . $pros[$i] . "</td></tr>";
    }
}
$data .= "</table>";
$data .= "<div class='allorder'>
    
<div class='field-label'>الاسم</div><div class='field-input'><input type='text' class='name' name='name'/></div>
<div class='field-label'>البريد الالكترونى</div><div class='field-input'><input type='text' class='email' name='email'/></div>
<div class='field-label'>التليفون</div><div class='field-input'><input type='text' class='phone' name='phone'/></div>

<div class='field-label'>أخرى </div><div class='field-input'><textarea class='other' name='other'></textarea></div>
<div class='field-label B'><input type='button' value='أرسال' class='order'> </div>


    </div>";
echo $data;
?>
<script>
    $(".order").click(function(){
    
        var name="name="+$(".name").val();
        var email="&email="+$(".email").val();
        var phone="&phone="+$(".phone").val();
       
        var vars=name+email+phone;
        
         var status= sendAjax("productes/do_roder",vars,".x");
        status.done(function() {
        // alert ()
            //updateModule("footer_left",".mycart",'<?= $_GET['alias'] ?>');
            
             $(".od_order").hide("slow");
             
        });
        
        
        
    
    })

</script>
<style>
    
    .mycart .label{
        
    }
    .allorder{
        
        
         direction: rtl; 
        padding :2px
    }
    
    
    .field-input,.field-label{
        
        float:right;
    width:70%;
    }
    .field-label{
        width:25%;
    }
    .field-input input , .field-input  textarea{
        width:80%;
        border-radius: 10px;
        padding: 5px;
        border: 1px #41150F solid;
        box-shadow: 2px 2px 2px  #41150F ;
    }

    .form_row.submit_p ,.form_row.reset_p {

        width:60px;
        float:left   
;margin-left: 10px;
    }
    
    .field-label.B{
        float:left
    }
    .order{
        
        cursor: pointer
        
    }
</style>