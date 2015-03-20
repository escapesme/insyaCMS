
<!--[if IE 7]>
  <link rel="stylesheet" href="css/ie7.css" type="text/css" media="screen, projection">
<![endif]-->
 <?php 

error_reporting(0);

?>

<script type="text/javascript">
$(function(){

$("#new_main li a").css("float","left");


})

</script>




<style>
.menu{
    border:2px solid #ffffff;
    
    width:70px;
    
    
}

</style>

<?
function mini($p){
	$px=strip_tags($p);
	$px=explode(' ',$px);
	foreach ($px as $w){
		$mini.=$w.' ';
		if($i==20){
			return $mini .' ...';
		}else{
			$i++;
		}
	}
	return $p;
}



?>


<link rel="stylesheet" type="text/css" href="css/contentslider.css" />
<script type="text/javascript" src="js/contentslider.js">
<script type="text/JavaScript" src="js/jquery.cross-slide.js"></script>
<div class="container" id="maincontainer"> 
 <div class="span-24" id="mheader"> 
  <div class="span-23" id="mheader1"> 
 
 <div  class="span-5" id="logotop"> 
 
 <?php 

if (isset($_GET['home'])){
    switch ($_GET['home']){
        case"q":
$log="images/logo_q.png";
 break; 
        case"s":
$log="images/sham_logo.png";
       break; 
       case"m":
 $log="images/logo_m.png";
       break; 
          case"c":
 $log="images/logo.png";
       break;    
}
}else{$log="images/logo.png"; }

?>
  		<a href="/" title="" class="logo"><img class="title" src="<?=$log?>" alt="Faiz Cairo" /></a> 
  	</div> 
    <div id="topmenu"> 
 
				<div class="nav"> 
                    <ul id="nav" class="clearfloat">						
    
    
<?
$mm=$db->get_data('pages_cats','','sub_cat=0   '." and `type`='top'  "." ".getjcity_home()." order by `order` " );

if (count($mm)!=0){
 $mm[count($mm)-1]['lastone']=1;   
 }

?>

<script type="text/JavaScript">

$(function(){
    $("#bt_news_n").click(function(){
        $("#mysl").attr('direction',"right");
        
    })
    
    
     $("#bt_news_p").click(function(){
        $("#mysl").attr('direction',"left");
        
    })
    
    
  
  $('.submenu2').hide();
  $('.submenu2 a').css("font-size","10pt");
  

  $('.tmenu li').mouseover(function(){
   var mym=  $(this).css("width");
 $(this).children('.submenu2').show(); 
 $(this).children('.links').addClass('myclass'); 

})



$('.tmenu li').mouseleave(function(){
    $(this).children('.links').removeClass('myclass');   
    $('.submenu2').hide(); 
    
})
})

</script>


<title>Faiz-e-Haakimi <?= get_city_full(); ?></title>

<?foreach ($mm as $menu){?>

<div class="gmymenu">
<div class="tmenu">

<li class="page_item
<?if($menu['lastone']){
   ?>
 lastone<?}?>"
id="menuitem_<?=$menu['id']?>">

<a class="links" href="<?if($menu['page_id'])
{?>index.php?<?= get_city()?>action=show_page&id=<?=$menu['page_id']?><?
}else{
?><?if($menu['url']){?><?=$menu['url']?><?}else{?>#<?}?><?}?>" class="menu"><?=$menu['title']?></a>


<div class="submenu2">


<?php
$mmsub=$db->get_data('pages_cats','',"sub_cat=".$menu['id']." "." ".getjcity_home(). " order by `order` ");
//$mmsub[count($mmsub)-1]['lastone']=1;
?><?foreach ($mmsub as $menu2){?>

<a class="slink"  href="<?if($menu2['page_id']){?>index.php?<?= get_city()?>action=show_page&id=<?=$menu['page_id']?><?}else{?><?if($menu2['url']){?>
index.php?<?php echo  get_city();echo str_replace("?","&",$menu2['url']); }else{?>#<?}?><?}?>"  class="slink"  style="font-size:small;"  ><?=$menu2['title']?></a>

<?php }?>




</div></li> 

</div>

</div>

<?}?>
</ul>
                   </div>
    <div class="span-16" id="topmidmenu">     
    <ul class="ul-topmidmenu"> 
    <?php
    
          $mynews=$db->get_data('pages_cats',''," `type`='middle'" ." ".getjcity_home(). " order by `order` ");

	 foreach($mynews as $hp){	   
    echo "<li><div id=\"topmidmenu-sep\"></div><a ";?>
    
    href="<?if($hp['page_id']!=0){?>index.php?<?= get_city()?>action=show_page&id=<?=$hp['page_id']?><?}else{?>
index.php?<?php echo  get_city();echo str_replace("?","&",$hp['url']); }?>" 
    <?php
    
    echo $hp['url'].get_city()." >".$hp['title']."</a></li>";       
       }

    ?>
     
         </ul>   </div> 




    </div> 
    </div> 
        <span id="e11" style="position: absolute;top: 0px;color: white;background-color: yellow;"></span> 
<div class="container span-24" id="mcontent"> 
<link rel="stylesheet" type="text/css" href="includes/js/contentslider.css" /> 
 
<script type="text/javascript" src="includes/js/contentslider.js"> 
<script type="text/JavaScript" src="includes/js/jquery.cross-slide.js"></script> 
<div class="span-24" id="section-1"> 
<div class="span-8" id="branches-select"><div id="branches-menu">  <ul class="ul-branches-menu"> 
     <li><a id="cairo_link" href="index.php">Cairo</a></li> 
    <!-- <li><a id="Quds_link" href="index.php?home=q">Quds</a></li>-->
  			
              	<li><a id="mutah_link" href="index.php?home=m">Mutah</a></li>
  			 <!--	<li><a id="shaam_link" href="index.php?home=s">Shaam</a></li>
                	<li><a id="shaam_link" >&nbsp;&nbsp;</a></li> -->
         </ul> </div></div> 
<div class="span-16" id="slideimages"> 
 
 
<div id="slide-runner"> 
            
	 <div id="slider1" class="sliderwrapper"> 
	
    <div class="label"><?= get_city_full(); ?></div>
    
 
    
     <?
     $myqu="city='" . get_city_full()."'";
     
	 $home_photos=$db->get_data('home_photos','',$myqu .'and `enable`=1'.getjcity_home());
	 foreach($home_photos as $hp){?>
	 
		<div class="contentdiv"> 
		<img alt="" src="uploads/<?=$hp['pic']?>" /> 
		</div> 
		<?}?>
	
</div> 
 
<div id="paginate-slider1" class="pagination" style="display:none;"> 

</div> 
 
<script type="text/javascript"> 
 
featuredcontentslider.init({
	id: "slider1",  //id of main slider DIV
	contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
	toc: "#increment",  //Valid values: "#increment", "markup", ["label1", "label2", etc]
	nextprev: ["", ""],  //labels for "prev" and "next" links. Set to "" to hide.
	revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
	enablefade: [true, 0.2],  //[true/false, fadedegree]
	autorotate: [true, 6000],  //[true/false, pausetime]
	onChange: function(previndex, curindex){  //event handler fired whenever script changes slide
		//previndex holds index of last slide viewed b4 current (1=1st slide, 2nd=2nd etc)
		//curindex holds index of currently shown slide (1=1st slide, 2nd=2nd etc)
	}
})
 
</script> 
   </div> 
 
</div> 
</div> 
<div class="span-24" id="section-2"> 

<div class="span-24" id="latest-clock"> 
<div class="span-12" id="latest-news"> 
        <div class="lwelcome">Latest News</div> 
        <div id="bt_news_p">
        </div>


<div id="new_main">
<style>
#new_main li{
    
    float: left;
}


</style>
<input type="hidden" value="0" id="mynewsh" />
<marquee  id="mysl"  height="20" onmouseover="this.setAttribute('scrollamount', 0, 0)" width="280" direction="left"  onmouseout="this.setAttribute('scrollamount', 6, 0)" >


<?php
 $mynews=$db->get_data('news','',' `enable`=1'.getjcity_home());
 
	 foreach($mynews as $hp){

if ($hp['url']==""){

	  

	 echo "<a  href=\"index.php?";
     echo get_city();
     echo  "action=newsp&newsid=".$hp['id']."\" >".$hp['title']."</a>"; 
}else{







echo "<a  href=\"".$hp['url']."\" >".$hp['title']."</a>";



}
		 }?>



</marquee>
</div>

<div id="bt_news_n"></div>
        
        
	
        
</div> 

<div class="span-12" id="weather-clock"> 
	<div class="span-6" id="weather" >
		<?php
        
        $eg="EGXX0004";
        
        
        
        if (isset($_GET['home'])){
    
    
    
    
    

  switch ($_GET['home']){
        
        case"q":
      
        
        $eg="isxx0010";
    
       break; 
        case"s":
        
        $eg="syxx0004";
     
       break; 
       case"m":
      
    
         $eg="joxx0002";
       break; 
       
        case"c":
      
    
       $eg="EGXX0004";
       break; 
        
        
    }
    
 
  }else{
    
           $eg="EGXX0004";
  }
        
       


        
     //   $weather=getweathers("http://weather.msn.com/RSS.aspx?wealocations=wc:".$eg."&weadegreetype=C");
        

        
        ?>
		<div class="weather-current-image" ><?=$weather['current_weather_image'];?></div>
		<div class="weather-current-temp"><?=$weather['current_temp'];?></div>
		<div class="weather-current-dayname"><?echo date("l");?></div>
                <div class="weather-current-hi-lo">Lo: <span class='lovalue'></span> Hi:  <span class='hivalue'></span> </div>
	</div>
	<!--<div id="tooltip"> 
		<div class="span-6 weather-more" id="">
			<div class="weather-more-image" ><?=$weather['weather_image'][1];?></div><div class="weather-more-dayname"><?echo date('D', strtotime('+1 day'));?></div>
			<div class="weather-more-hi-lo">Lo: <?echo $weather['lo'][1]; ?> Hi: <?echo $weather['hi'][1]; ?> </div>
		</div>
		<div class="span-6 weather-more" id="">
			<div class="weather-more-image" ><?=$weather['weather_image'][2];?></div><div class="weather-more-dayname"><?echo date('D', strtotime('+2 day'));?></div>
			<div class="weather-more-hi-lo">Lo: <?echo $weather['lo'][2]; ?> Hi: <?echo $weather['hi'][2]; ?> </div>
		</div>
		<div class="span-6 weather-more" id="">
			<div class="weather-more-image" ><?=$weather['weather_image'][3];?></div><div class="weather-more-dayname"><?echo date('D', strtotime('+3 day'));?></div>
			<div class="weather-more-hi-lo">Lo: <?echo $weather['lo'][3]; ?> Hi: <?echo $weather['hi'][3]; ?> </div>
		</div>
		<div class="span-6 weather-more-no-border" id="">
			<div class="weather-more-image" ><?=$weather['weather_image'][4];?></div><div class="weather-more-dayname"><?echo date('D', strtotime('+4 day'));?></div>
			<div class="weather-more-hi-lo">Lo: <?echo $weather['lo'][4]; ?> Hi: <?echo $weather['hi'][4]; ?> </div>
		</div>
	</div>

-->
<?php

$todayDate = date("Y-m-d g:i a");// current date
$currentTime = time($todayDate); //Change date into time
$timeAfterOneHour = ($currentTime-60);
?>
	<div class="span-6" id="clock"><div class="clock-image"></div><div class="current-time" id="current-time">
<div class="current-hourstime" style="width:80px;margin:15px 0 0 5px;float: left;color:#FDE69A;font-size: 36px;">








<?=date('h:i',$timeAfterOneHour-2);?></div><div class="time-city"style="height:18px;width:70px;float:left;font-size:15px;font-weight:bold;margin:15px 0 0 20px;"><?= get_city_full(); ?></div><div class="ampm"style="height:10px;width:70px;float:left;font-size:12px;margin:0px 0 0 20px;">
<?=date('A')?></div>
</div> </div> </div>

<script>
//$(".weather-current-image").corner();
</script>
<script>
$(document).ready(function() { 
    // enable tooltip for "download" element. use the "slide" effect 
    $("#weather").tooltip({ 
        position: "bottom left", 
        offset: [0, 443], 
        opacity: 0.7, 
        delay: 1000
        }); 
         
});</script>
</div> 
<script language="javascript">


</script> 
<div class="span-20" id="main-section-2"> 
  <div class="span-20" id="packahesmenu">     
    <ul class="ul-packages"> 
     
     <?php
     $packs=$db->get_data('packges','','`enable`=1'." ".getjcity_home(). " order by `order` ");
     
     IF (count($packs)==0)
     
     {
        
        echo '<style> #main-section-2{ height:60px;}#bottom-section { margin-top:0px; } #section-2 {height:100px;}</style>';
     }
    
    
      function getpgurl($url,$id){
        $oup=  "index.php?".get_city()."action=show_packge&id=$id";
        if ($url=="" || empty($url)){
          $oup=  "index.php?".get_city()."action=show_packge&id=$id";
            
        }else{
            
          $oup= $url; 
            
        }
        
       
        return $oup;
        
     }
     
    
     foreach ($packs as $p){
     
   
     
     ?>
     
     <li><div class="span-6" id="faiz-package"> 
		<div class="package-title"> 
        
      
		<a href="<?=getpgurl($p['url'],$p['id'])?>"> 
		<?=$p['title']?>		
		</a> 
		</div> 
		<div class="package-short-text"> 
		<?=mini($p['post'])?>
		</div> 
	</div> 
	</li> 
	
	<?}?>
	
	 
         </ul>   </div> 
</div> 
  <div class="span-24" id="bottom-section">   <div class="span-6" id="prayer-times">  
    
    	 
 <?php
 
 
     $mmsun=$db->get_data('site_setting',"","id=1");
 if (isset($_GET['home'])){
    
    
    








  switch ($_GET['home']){
        
        case"q":
      
        
        getsun ('31.47','35.12', $mmsun[0]['sun_q']);
    
       break; 
        case"s":
        
        getsun ('33.30','36.18', $mmsun[0]['sun_s']);
     
       break; 
       case"m":
      
    
        getsun ('31.57','35.52',$mmsun[0]['sun_m']);
       break; 
       
        case"c":
      
    
      getsun ('30.2','31.21', $mmsun[0]['sun_c']);
       break; 
        
        
    }
    
 
  }else{
    
        getsun ('30.2','31.21', $mmsun[0]['sun_c']);
  }



?>






             </div> 
             
             <style>
             
             
             </style>
    
   <?PHP
   
    $mynews=$db->get_data('pages_cats',''," `type`='bottom' "." ".getjcity_home(). " order by `order` ");
 echo "<div id=mymeny>";
		 foreach($mynews as $hp){	   
    echo "<li><div id=\"topmidmenu-sep\"></div><a ";?>
    
    href="<?if($hp['page_id']!=0){?>index.php?<?= get_city()?>action=show_page&id=<?=$hp['page_id']?><?}else{?>
index.php?<?php echo  get_city();echo str_replace("?","&",$hp['url']); }?>" 
    <?php
    
    echo $hp['url'].get_city()." >".$hp['title']."</a></li>";       
       }
   echo "</div>";
   
   ?>
      
             
             
             <div class="span-24" id="footer"> 
   </a> <span> Copyright &copy; 2010 Faiz-e-Haakimi. All rights reserved, Site Developed by</span>
       
          <a target="_blank" href="http://www.e-scapes.me">E-Scapes</a> 
  	</div> 
          
    </div> 
       </div> 
</div> 
 </div>   
 
 
 
 
 