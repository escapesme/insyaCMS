<?php 
session_start();

if ($_POST['submit']){
include('mysql.php');

$login=$db->get_row('users','id,suspend,u_city',"username='$_POST[username]' AND password=MD5('$_POST[password]')");
if (is_array($login)){
				if ($login['suspend']){
					$msg='<p class="important">عفواً , تم إيقافك عن دخول النظام</p>';
				}else{
					$_SESSION['login']=$login['id'];
                    $_SESSION['login_city']=$login['u_city'];
					header('location: adfaiz.php');
				
                }
	}else{
		$msg='<p class="important">Invalid username or password</p>';
		
	}
}
if ($_GET['action']=='logout'){
	unset($_SESSION['login']);
	header('location: lgfaiz.php');
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ar" lang="ar" dir="rtl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>


<link rel='stylesheet' type='text/css' media='all' href='admin_style.css' />
</head>
<body>
	

<?if ($msg)echo $msg;?>
<br />
<br />
<br />
<br />
<br />
<center>
<form method="POST">
<table align="center">
<tr><td colspan="2" align="center"><strong>Login</strong></td></tr>
<tr><td>Username</td><td><input class="input" name="username" style="width:250px;" type="text" /></td></tr>
<tr><td>Password</td><td><input class="input" name="password" style="width:250px;" type="password" /></td></tr>
</table>
<br /><br /><br />
<input type="submit" value="Login" class="submit" name="submit" />
</center>

</form>

</body>
</html>