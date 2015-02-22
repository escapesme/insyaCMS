<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

function plg_captcha() {

    global $lib;


    //$captcha = new $lib->captchaClass;


    

echo '<img src="class.lib/utiles/captchaClass.php" />'; 

   // echo '<img src="'.include'lib/utiles/captchaClass.php'.'" />';
    ?> 
    <form action="example.php?act=ok" method="POST"> 
        Token: <input type="text" name="token"> 
        <input type="submit" value="Check"> 
    </form> 
    <?php
    if ($_GET['act'] == "ok") {
        if ($_SESSION['token'] == $_POST['token']) {
            echo 'ok';
        } else {
            echo 'bad';
        }
    }
}
?>
