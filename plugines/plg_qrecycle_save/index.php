<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of index
 *
 * @author empcl_000
 */
function getsettings() {
    global $lib;

    return $lib->db->get_row("com_qrecycle_setting");
}

function plg_qrecycle_save($pro) {

    $seetting = getsettings();


    /* @var $lib  \libs\libs */
    global $lib;
    /*
     * Array ( [login] => 3 [user_name] => ismail [dumpsterCost] => 150 [regtype] => b [name] => [business_name] => myname [contact_person] => Contact Person [email] => email [fax_no] => fax_no 
     * [billing_address] => billing_address [mailing_address] => mailing_address [password] => 11111 [re-password] => 1111
     *  [url] => [setpform] => Array ( [map_address] => Unnamed Road, Cairo Governorate, Egypt [map_coordinates] => (29.961106676978027, 31.56646728515625) [dumpsters] => 1 [concrete] => 1 [hazardous] => 1 ) ) sssssss
     */
    $r = "";


    if ($_SESSION['password']) {
        $userdata = array(
            "password" => md5($_SESSION['password']),
            "email" => $_SESSION['email'],
            "name" => $_SESSION['name'],
            "user_name" => $_SESSION['name'],
            "g_ud" => "1"
        );


        $user = $lib->users->getAddUser($userdata);
        $data = array_merge($_SESSION, $_SESSION['setpform']);
        $data['user_id']=$user['id'];
        $lib->db->insert_row('com_qrecycle_qoute', $data);
        $r = $seetting["qoute_save"];
    }





    return $r;
//put your code here
}
