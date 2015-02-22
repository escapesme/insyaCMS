<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link type = "text/css" href =" templates/def/css/login.css" rel = "stylesheet" />
        <script src="templates/def/js/script.js" ></script>
        <title>Login</title>
    </head>
    <body>

        <?php
        global $lib;
        $returnData = "";



        if ($_POST['status'] == "getpass") {
            $returnData = $lib->users->getpassword();
        } else {

            $lib->users->updateStatus("logint");
            $ret = $lib->users->login();
        }


        //
        ?>

        <div id="container"> 
            <section id="login-box"> 
                <div class="block-border">
                    <div class="block-header">
                        <h1>Login</h1> </div> 
                    <form id="login-form" class="block-content form" action="" method="post">







                        <?php
                        if ($ret['status'] == "erorr" || $ret['status'] == "disabel" ||
                                $ret['status'] == "notadmin") {
                            ?>
                            <div id="alertBox-generated" style="" class="alert error no-margin top"><?= $ret['msg'] ?></div>

                        <?php } ?>





                        <?php if ($returnData[0] == "succes") { ?>
                            <div id="alertBox-generated" style="" class="alert  no-margin top"><?= $returnData[1] ?></div>

                        <?php } else if ($returnData[0] == "error") { ?>

                            <div id="alertBox-generated" style="" class="alert error no-margin top"><?= $returnData[1] ?></div>

                        <? } ?>











                        <div class='mylogin'>
                            <p class="inline-small-label"> 
                                <label for="username">Username</label> 
                                <input type="text" name="user_name" value="" class=" text"> </p>
                            <p class="inline-small-label">
                                <label for="password">Password</label> 
                                <input type="password" name="password" value="" class=" password"> </p> <p> <label>

                        </div>

                        <div style="display:none" class='mypassword'>

                            <label for="email">enter uers email</label> 
                            <input type="text" name="email" value="" class=" text"> </p>

                        </div>





                        <div class="clear">

                        </div> <div class="block-actions"> <ul class="actions-left"> <li>
                                    <a class="button recover_password" name="recover_password" >Recover Password</a></li> 
                                <li class="divider-vertical"></li> 
                                <li><input type='reset' class="button red" id="reset-login" ></li> </ul> 
                            <ul class="actions-right"> <li><input type="submit" class="  button Logindo" value="Login"></li><li><input type="submit" style='display:none' class="button recoverdo" value="recover"></li> </ul> </div> 

                        <input type='hidden' name='status'class='status' value='login'/>

                    </form> </div> </section> </div>




    </body>
</html>

<style>



</style>


