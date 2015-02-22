<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_users($pro, $lng) {
    global $lib;


    $data = "<div class='mydir regmod' >";

    if (isset($_SESSION['login']) && !empty($_SESSION['login'])) {

        $data .= $lib->users->dologout("/", "show");
        

        $data .=modueselogData($lng, $lib->users);
    } else {



        $data .= $lib->users->dologin("/");
        $data .=modueseData($lng);
    }



    $data .="</div>";



    return $data;
}

?>
