<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function modueseData($lng) {
    global $lib;
    $alias = $lib->util->getMenuAlias("com_users");


    $data = "<form action='' method='post'><div><div>" . $lng['name'] . "</div><div><input type='text' class='inputtext' name='user_name'/></div></div>";
    $data.="<div><div>" . $lng['password'] . "</div><div><input type='password' class='inputtext' name='password'/></div></div>";
    $data.="<div><input type='submit' class='button' name='" . $lng['submit'] . "'/></div>";

    $data.="<div class='reglinks'><a href='/show/forget/" . $alias . ".html'>" . $lng['forget'] . "</a></div><div class='reglinks'><a href='/registry.html'>" . $lng['newreg'] . "</a></div></form>";

    return $data;
}

function modueselogData($lng, $user) {
    $userData = $user->getUser("all");

    global $lib;
    $alias = $lib->util->getMenuAlias("com_users");
    $data.="
        

         <div>" . $lng['welcome'] . "</div>


        <div class='title'>" . $userData['name'] . "</div>

  <div class='image'>" . $userData['image'] . "</div>
      
     <div class='data'> 
     <div class='datalabel'>" . $lng['messages'] . "</div>
     <div class='datavalue'>0</div>
     </div>
 
   <div class='data'> 
 <div class='datalabel'>" . $lng['news'] . "</div> 
     <div class='datavalue'>0</div>
     </div>

<div class='data'> <div class='datalabel'>" . $lng['date'] . "</div> <div class='datavalue'>" . date("F j, Y, g:i a") . "</div></div>
    



<div class='reglinks'><a href='/show/logout/" . $alias . ".html'>" . $lng['logout'] . "</a></div>";



    return $data;
}

?>
