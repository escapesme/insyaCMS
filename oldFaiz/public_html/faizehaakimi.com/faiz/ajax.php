<?
/*
if (!$_SESSION['login']){
	header('location: login.php');
	exit;
}
*/
include('mysql.php');


$settings_data=$db->get_data('settings');
foreach ($settings_data as $k=>$v){
	$settings[$v['name']]=$v['value'];
}



ob_start();
?>
<?if ($_GET['action']){?>
<?include('actions/'.$_GET['action'].'.php');?>
<?}else{
	include('actions/home.php');
	
}?>