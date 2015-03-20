<style>



.qu{
   font-size: 10pt;
    font-weight: bold;
    cursor: pointer;   
   color: #5e2b04;margin-left:10px;
}

.ans,.ans2{
   font-size: 10pt;
    font-weight: normal;  
   margin-left:20px;
   width:70%;
   margin-top: 10px;
    
}

</style>
<script type="text/javascript">



$(function(){
    

    
    
    
    $('.ans2').hide(); 
    $(".qu").toggle(function(){ 
        
      
 $(this).children(".marr").css('background-image','url(css/images/arrtclos.png)'); 
    $(this).children('.ans').hide('slow');  
    $(this).children('.ans2').show('slow');  
    },function(){
  $(this).children(".marr").css('background-image','url(css/images/arrto.png)'); 
    $(this).children('.ans').show('slow'); 
     $(this).children('.ans2').hide('slow');    
    })
    
    
    
})
</script>

<?php
if($_POST['submit']){
$db->insert_row('faq',$_POST);
}
$data=$db->get_data('faq','',"answer != ''" ." ".getjcity_home(). "ORDER BY `order` DESC");
?>
<h2>F.A.Q</h2>
<?if($_POST['submit']){?>
<center>
	<h3>Your question has been submited, Thanks</h3>
	</center>
<?}?>
<?foreach ($data as $row){?>
<h3 class="qu"><div class="marr"></div><?=$row['qustion']?>
<div class="ans"><?php //echo  substr($row['answer'],0,10)."..."?></div>
<div class="ans2"><?=$row['answer']?></div>
</h3>



<?}?>
<div style="text-align:center;margin-top:20px;margin-bottom:20px;"><img src="images/separetor.png" /></div>
<!--<h3>Add your question</h3>
<form method="POST">
<textarea name="qustion" style="background-color:#F2E6AA;border:0 none;"  style="width:90%;height:100px;"></textarea>
<center><input name="submit" value="Add" type="submit" /></center>
</form>-->