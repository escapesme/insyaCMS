<?php 
$thisisadmin=1;
session_start();
if (!$_SESSION['login']){
	header('location: login.php');
	exit;
}
if (isset($_GET['action']) ){
if(!strstr($_GET['action'],'admin/')){
	$_GET['action']='admin/'.$_GET['action'];
}

}


include('mysql.php');
include('functions.php');

$usR_info=$db->get_row('users',''," id=".$_SESSION['login']);


date_default_timezone_set("Africa/Cairo");
?>


<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="cufon-active cufon-ready">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin</title>
<link rel="stylesheet" href="autocomplete.css" type="text/css" media="screen" charset="utf-8" />



<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

<?php //<script type="text/javascript" src="js/prototype.js"></script> ?>
<?php //<script type="text/javascript" src="js/scriptaculous.js"></script>?>
<?php //<script type="text/javascript" src="js/autocomplete.js"></script>?>

<script type="text/javascript" src="js/myjs.js"></script>

<script type="text/javascript" src="js/lightbox/thickbox.js"></script>
<style type="text/css" media="all">@import "js/lightbox/thickbox.css";</style>


<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/humanity/jquery-ui-1.7.3.custom.css" />


<link href="css/admin_style.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
$(function(){
    
  $(".menu1").click(function(){
    $(".my2menu").slideUp();
    $(this).children(".my2menu").slideDown();
    
  })
  
    

    
    
})


</script>

</head>
<body>
	<table  class="maintable" width="100%">
		<tr>
			<td width="154" valign="top">
				
				
				<div class="main">Main Menu</div>
                
				<ul>
                
                <style>
                .my2menu li{
                    border:none;
                    
                }
                
                .my2menu li a{
                  font-size: 11px;;
                    
                }
                
                .my2menu{
                    display: none;
                }
                
                .search_bt{
                    float: right;
                    margin-right: 20px;
                  
                }
                .form_row{
                    font-size: 10pt;
                }
                
                .form_row_left{
                    float:left;
                }
                .form_row_right{
                    float:right
                }
                
                #my_ad{
         
               float:right;
               cursor: pointer;
                    margin-top:-13px;
                   background-color:gray;
                  -webkit-border-top-right-radius:5px;
                   -webkit-border-bottom-right-radius:5px;
                   -moz-border-radius-topright:5px;
                    -moz-border-radius-bottomright:5px;
                   
                }
                
                #my_ad img{
         
              height:70px;
                    
                    
                }
                
                
                #search_ad{
                    display: none;
                }
                
                </style>
                
                <?php 
                
                date_default_timezone_set("Africa/Cairo"); 
                
                
 function getuser23($val,$out){
global $db;
$aduser=$db->get_row('users','',"id=".$_SESSION['login']); 
$user_ar=explode(';',$aduser['lev']);  
  foreach ($user_ar as $user){
    if ($user ==$val){
      $ret= $out;    
    }
  }
  return $ret;
  
  
  
  
  }
  
 
 
 
 $adminmune=$db->get_data('admin_menu',''," sub_cat =\"0\"  ORDER BY ord  ");
                foreach ($adminmune as $adm){
                    
                         if (getuser23($adm['id'],"tr")=="tr"){
                            
                              
                            if ($adm['l_box']==1){
                    
                    
                              
                  echo ' <div class=menu1  ><li ><a href="'.$adm['url'].'&TB_iframe=true&height=500&width=1000" title="'.$adm['title'].'" class="thickbox" >'.$adm['title'].'</a></li>';	
                                  //   echo "<div class=menu1  ><li ><a href=\"".$adm['url']."\">".$adm['title']."</a></li>" ; 
                            }else{
                                
                              echo "<div class=menu1  ><li ><a href=\"".$adm['url']."\">".$adm['title']."</a></li>" ;    
                            }
               
                   
                      $adminmune2=$db->get_data('admin_menu',''," sub_cat =".$adm['id']."   order by ord"   );
                      echo "<div class=my2menu>";
                     
                     
                      foreach ($adminmune2 as $adm){ 
                      if (getuser23($adm['id'],"tr")=="tr"){  
                    echo "
                  
                    <li><a href=\"".$adm['url']."\">&nbsp;&nbsp;".$adm['title']."</a></li>
                    " ;
                  }
                  
                  
                  
                    }
                      echo "  <li class=\"lin\">------ ------ ------</li></div></div> <br>";
                    
                }
                    
                    }
                
                
                
                
                
                
           /*     
                
                 if($usR_info['re_lev']!=0){?>

                 <li class="lin">------ ------ ------</li>
                <li><a href="admin.php?action=admin/reservation/list">Reservation</a></li>    
					<li><a href="admin.php?action=admin/reception/list">Reception</a></li> 
                    <li><a href="admin.php?action=admin/Receipt/list"> Lawazim Receipt</a></li>
                    <li><a href="admin.php?action=admin/features/list">Voucher</a></li>
                   
					<li><a href="admin.php?action=admin/discount/list">Reservation Discount</a></li>
                    <li><a href="admin.php?action=admin/lwazim_calc/list">Reservation Prices</a></li>
                    
                    <li><a href="admin.php?action=admin/h_rooms/list">Hotel Rooms Type</a></li>
                 
                    	<li><a href="admin.php?action=admin/update_check_out/list">Check Out</a></li>
					<li><a href="admin.php?action=admin/a_detail/list">Hotel Title</a></li>
                    <li><a href="admin.php?action=admin/ex_days/list">Extra  Days</a></li>	                                                                                                     
                     <li><a href="admin.php?action=admin/reports/inx">Reports</a></li> 
                    <li><a href="admin.php?action=admin/DB_update/list">DB Update</a></li>
                    
                    <?php }?>
                  <?php  if($usR_info['l_rep']!=0){?>
                  <li><a href="admin.php?action=admin/reports/inx">Reports</a></li> 
                  
                  <?}?>
                  
                  
                    <?php  if($usR_info['w_lev']!=0){?>
                      <li class="lin">------ ------ ------</li>        
                         <li><a href="admin.php?action=admin/p_to_reservation/list">P to Reservation</a></li>            
					<li><a href="admin.php?action=admin/news/list">News</a></li>
					<li><a href="admin.php?action=admin/home_photos/list">Home Photos</a></li>
					<li><a href="admin.php?action=admin/packges/list">Packges</a></li>
					<li><a href="admin.php?action=admin/faq/list">F.A.Q</a></li>
					<li><a href="admin.php?action=admin/photos/list">Photo Gallery</a></li>
					<li><a href="admin.php?action=admin/photos_cat/list">Photo Gallery Cats</a></li>
                    
                    <li><a href="admin.php?action=admin/a_glance/list">Egypt at a Glance</a></li>
					<li><a href="admin.php?action=admin/a_glance_category/list">a glance category</a></li>
                    
					<li><a href="admin.php?action=admin/gbook/list">G Book</a></li>
                    <li><a href="admin.php?action=admin/gbook_f/list">G Book Formula</a></li>
                    
    	           <li><a href="admin.php?action=admin/feedback/list">Feedback</a></li>
					<li><a href="admin.php?action=admin/pages_cats/list">Menu</a></li>
					<li><a href="admin.php?action=admin/pages/list">Site Pages</a></li>
                    
                   	<li><a href="admin.php?action=admin/admin_menu/list">admin menu</a></li>
                          <li><a href="admin.php?action=admin/admin_menu_type/list">admin_menu_type</a></li>	
					<li><a href="admin.php?action=admin/users/list">Users</a></li>	
                     <?php }?>
                     <li class="lin">------ ------ ------</li>
                     <?php  if($usR_info['f_lev']!=0){?>	
                     <?php }*/?>	
				</ul>
<ul>
	
		

	
	
</ul>
</td>
	<td style="padding-left:20px;" valign="top" dir="ltr">

<div id="header">Administration Interface  -     :  <?php echo "Welcome :  ".$usR_info['username']?> 
<div class="top_main"><a href="login.php?action=logout">Logout</a></div>
<div class="top_main"><a href="admin.php">Admin home</a></div>
<div class="top_main"><a href="index.php">site home</a></div>

<div class="top_main"><a ><?=$_SESSION['login_city']?></a></div></div>

<div id="content" style="width:90%;" dir="ltr">



<?if ($saved)echo $saved;?>
<br /><br />
<?php 


if (isset($_GET['action']) ){
include('actions/'.$_GET['action'].'.php');
}else{

echo "<cenert><h2>welcome :  ".$usR_info['username'].":::".$_SESSION['login_city']." in FaizeHaakimi Control Panel</h2></cenert>";













 $adminmune=$db->get_data('admin_menu',''," sub_cat ='0' order by ord");
                foreach ($adminmune as $adm){
                    
                         if (getuser23($adm['id'],"tr")=="tr"){
                    echo "<div class=web_a  ><li ><a href=\"".$adm['url']."\">ll".$adm['title']."</a></li>" ;
               
                   
                      $adminmune2=$db->get_data('admin_menu',''," sub_cat =".$adm['id']." order by ord");
                      echo "<div class=web_a2>";
                     
                     echo "  <li class=\"lin\">------ ------ ------</li>";
                      foreach ($adminmune2 as $adm){ 
                      if (getuser23($adm['id'],"tr")=="tr"){  
                    echo "
                  
                    <li><a href=\"".$adm['url']."\">&nbsp;&nbsp;".$adm['title']."</a></li>
                    " ;
                  }
                  
                  
                  
                    }
                      
                      echo "</div></div>";
                }
                
              
                    
                    }
                
                
                
}
                
                date_default_timezone_set("Africa/Cairo"); 
                
                
              
              
              
              
                

?>
</div>
</td>
</tr>
</table>
<div id="footer">
<style>
.lin{
    color:red;
    
    height: 4px;
    overflow: hidden;
    background-color: #eee;
    
    
}
li{
    list-style: none;
}
.web_a{
    width:30%;
    border:1px #eee solid;
    margin: 5px;
    padding: 5px;
    height: 120px;
    overflow: auto;
}


.web_a2 a{
  text-decoration: none;
  font-size: 11px;
  color:#fff;
  
  
}


</style>
</div>
</body>
</html>