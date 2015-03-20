<?php 
ini_set('date.timezone', 'Africa/Cairo');
@set_time_limit(0);
 session_start();
 $url = $_SERVER['REQUEST_URI'];
include('mysql.php');
include('functions.php');
include("form_class.php");
include("gen_class.php");
// $conten_news = $db->get_data_query("select * from news ORDER BY `id` DESC liMIT 0,2 "." ".getjcity_home("where"));
?>
<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0038)faiz/quds.html -->
<html xmlns="http://www.w3.org/1999/xhtml" class="cufon-active cufon-ready">
<style>
 li  {
    list-style: none;
    padding: 1px;
 }
#myinn{
  padding-right: 25px;;
    padding-top :10px;
 
    background-repeat: repeat-y;

margin:0px 2px 0px  50px;
text-align:justify;
width:194px;
margin-bottom:0px;
padding-bottom:7px;

}
 .package-title_inn{
    
    
    
    width: 187px;
   height:33px;
  
    margin:auto;
    font-size:15px;
    padding-top: 37px;;
    margin:30px 2px 0px  50px;
    text-align: center;
}

   #myinn ul{
    padding-left :20px
   
} 
 #innend{
  
    width:187px;
    height: 60px;
    margin:0px 2px 0px  50px;
 }
   
   #myinn li{
    width: 130px;
     
     background-repeat: no-repeat;
     background-position: left;
border-bottom: 1px dashed #604426;
padding-left: 20px;
margin-bottom:0px;
} 


.nact{
     color: #663300;
     text-decoration: none;
} 
.aact{
    
     color: #ffcc66;
     font-weight: bold;
}
</style>


<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >

<title>Faiz-e-Haakimi <?= get_city_full(); ?></title>
    



<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen, projection"/>
<link rel="stylesheet" href="css/print.css" type="text/css" media="print"/>


<meta name="generator" content="E-Scapes Development"/>
<meta name="generator" content="E-Scapes Development"/>

<script type="text/javascript" src="js/jquery-1.5.2.min.js"></script>

<!--<script type="text/javascript" src="js/jquery.tools.min.js"></script>
-->


<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript" src="js/jquery.corner.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<style type="text/css">cufon{text-indent:0!important;}@media screen,projection{cufon{display:inline!important;display:inline-block!important;position:relative!important;vertical-align:middle!important;font-size:1px!important;line-height:1px!important;}cufon cufontext{display:-moz-inline-box!important;display:inline-block!important;width:0!important;height:0!important;overflow:hidden!important;text-indent:-10000in!important;}cufon canvas{position:relative!important;}}@media print{cufon{padding:0!important;}cufon canvas{display:none!important;}}</style>

<link rel="stylesheet" href="css/slide.css" type="text/css" media="screen" charset="utf-8"/>
<link href="css/faiz.css" rel="stylesheet" type="text/css"/>
<link href="css/custom.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="js/jquery.tooltip.css"/>
<link rel="stylesheet" href="css/humanity/jquery-ui-1.7.3.custom.css" type="text/css" /> 
 <script type="text/javascript" src="js/Trajan_Pro_400-Trajan_Pro_700.font.js"></script>
<script src="js/jquery.bgiframe.js" type="text/javascript"></script> 
 
<script src="js/jquery.tooltip.js" type="text/javascript"></script> 
<script src="js/jquery.dimensions.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.center.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script> 
<script type="text/javascript" src="js/jquery.validate.js"></script>
<?php
/*
*/

?>

<script type="text/javascript" src="js/maxlength.js"></script>

<!--[if IE 7]>
	<style>
	  #nav li ul{
	    margin-top:0px;
	    margin-left:-5px;
	  }
	  #nav{
	    height:85px;
	  }
	</style>
    
    
    
<![endif]-->

<link rel="stylesheet" type="text/css" href="css/transmenu.css"/>
<!--[if IE ]>
  <link rel="stylesheet" href="css/ie.css" type="text/css" >
<![endif]-->
<!--[if IE 7]>
  <link rel="stylesheet" href="css/ie7.css" type="text/css" media="screen, projection">
<![endif]-->
<style>





.transMenu .content{
    
   opacity:0.8;
    
}

#TransMenu0{
    
    background:none ;
    
}
.items{
    
    width:150px;
    opacity:0.8;
 -moz-border-radius-topright: 15px;
 
 -moz-border-radius-bottomright: 15px;
  -moz-border-radius-bottomleft: 15px;

 -webkit-border-top-right-radius: 15px;
 -webkit-border-top-left-radius: 15px;
  -webkit-border-bottom-right-radius: 15px;

background-color:#50290A ;
    
}

</style>
	

</head>
<div id="myhtml">
<body  onload="init();">
<div id="mybody">


<script type="text/javascript">

   

  
 
Cufon.replace('.frm_row,.package-title_inn ,.ul-branches-menu li a,.time-city,h2,.label,#title,.mydes,.ul-topmenu li,.ul-topmidmenu li,.weather-current-dayname,.lwelcome,h2,#sun_num1,#sun_num,.tmenu li a,.package-title,.last', {
	hover: true
});
  Cufon.replace('.frm_row,.package-title_inn,.weather-current-temp,.time-city,#title,.ampm,.label,.weather-current-hi-lo,.ul-branches-menu li a,.ul-topmenu li,.ul-topmidmenu li,.weather-current-dayname,.lwelcome,h2,.package-title,.weather-more-hi-lo,.weather-more-dayname,.slink,.current-hourstime,.last', { fontFamily: 'Trajan Pro' });

  

 var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-18497224-1']);
  _gaq.push(['_setDomainName', '.faizehaakimi.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();





</script>

    
    
<?php 

if (isset($_GET['home'])){
    switch ($_GET['home']){
        
        case"q":
        
        
        ini_set('date.timezone', 'Asia/Jerusalem');
        echo '
<link rel="stylesheet" type="text/css" href="css/style_q.css" />   
        <style>#cairo_link {
color:#9A5F25;
} </style> ';
$log="images/logo_q.png";


       break; 
        case"s":
        ini_set('date.timezone', 'Asia/Damascus');
        echo '
<link rel="stylesheet" type="text/css" href="css/style_s.css" />   
        <style>#cairo_link {
color:#9A5F25;
} </style> ';
$log="images/logo_s.png";
       break; 
       case"m":
       ini_set('date.timezone', 'Asia/Amman');
        echo '
     
<link rel="stylesheet" type="text/css" href="css/style_m.css" />

   
        <style>#cairo_link {
color:#9A5F25;
} </style>
 ';
 $log="images/logo_m.png";
       break; 
       
       case"c":
 $log="images/logo.png";
       break;  
        
        
    }
    
    
    
    
}else{
    
    
  $log="images/logo.png";   
    
    
    
}

?>
<?if ($_GET['action']){?>



 <div class="span-24" id="mheader">
 
 
 
 
 
  


  
      


    

          
  
   
	

	  	      
	  <h2 style="padding:10px;"></h2> 

	  <div id="tabsbg"></div> 
	  <div class="scroll-pane">
	  <div style="padding:10px;">

 <?
}
//style="background:url('../images/section-2-bg.jpg') ;" 
if (isset($_GET['action']) && file_exists('actions/'.$_GET['action'].'.php'))
			{
			include('actions/'.$_GET['action'].'.php');
			}else if(isset($_GET['action'])) {
			 	
                 
                 echo "<br><div class=last> Unfortunately, the page you requested does not exist </div>";
                
                }else{
				include('actions/home.php');
		        }
		        if ($_GET['action']){
		       ?>
</div>                                 
</div>	    
	  </div> 
                      
  





  

<?}?>
	
    
    
    
    
    
    
    
    
  
<?php 

if (isset($_GET['home'])){
    switch ($_GET['home']){
        
        case"q":
        ini_set('date.timezone', 'Jerusalem');
        echo '
<link rel="stylesheet" type="text/css" href="css/style_q.css" />   
        <style>#cairo_link {
color:#9A5F25;
} </style> ';
       break; 
        case"s":
        ini_set('date.timezone', 'Asia/Damascus');
        echo '
<link rel="stylesheet" type="text/css" href="css/style_s.css" />   
        <style>#cairo_link {
color:#9A5F25;
} </style> ';
       break; 
       case"m":
       ini_set('date.timezone', 'Asia/Amman');
        echo '
     
<link rel="stylesheet" type="text/css" href="css/style_m.css" />

   
        <style>#cairo_link {
color:#9A5F25;
} </style>
 ';
       break; 
       
        
        
        
    }
    
    
    
    
}

?>  
    

</div>


</body></div></html>
    


    
    
    