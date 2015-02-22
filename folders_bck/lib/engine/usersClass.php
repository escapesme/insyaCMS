<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

namespace libs\engine;

class usersClass {

//put your code here

    var $config;
    var $foldersMap;
    var $Messages;
    var $db;
    var $util;
    var $dmin;
    var $variables;
    /* @var $lib  \libs\libs */
    var $lib;
    var $msg = "";

    function __construct($lib) {
        $this->config = $lib->config;
        $this->foldersMap = $lib->foldersMap;
        $this->Messages = $lib->Messages;
        $this->db = $lib->db;
        $this->util = $lib->util;
        $this->admin = $lib->admin;
        $this->variables = $lib->variables;
        $this->lib = $lib;
    }

    function dologin($loction) {

   
        
        
        if (isset($_POST[login_email]) && $_POST["dologin"]) {
            $login = $this->db->get_row('com_users', '*', " email='$_POST[login_email]' and  password=MD5('$_POST[password]') ");
            if (is_array($login)) {
                if (($login['enabled']) != 0) {
                    $_SESSION['login'] = $login['id'];
                    $_SESSION['user_name'] = $login['user_name'];
                    echo '<script>window.location.href = "' . $loction . '";</script>';
                    $status = "login";
                    $this->msg = $this->Messages->login_secc;
                } else {

                    $this->msg = $this->Messages->login_error_user_disabel;
                    $status = "disabel";
                }
            }
        }
    }

    function login() {

        $status = "";


        if (isset($_POST[login_email]) ) {


            $login = $this->db->get_row('com_users', '*', "email='$_POST[login_email]' and  password=MD5('$_POST[password]')");




            if (is_array($login)) {
                if (($login['enabled']) == 0) {
                    $msg = $this->Messages->login_error_user_disabel;

                    $status = "disabel";
                } else if ($this->isadmin($login['g_id']) != "1") {

                    $msg = $this->Messages->login_error_user_notadmin;

                    $status = "notadmin";
                } else {


                    $_SESSION['login'] = $login['id'];
                    $_SESSION['user_name'] = $login['user_name'];

                    $this->updateStatus("/");


                    $status = "login";
                }
            } else {

                $status = "erorr";
                $msg = $this->Messages->login_error;
            }
        } else {

            $msg = "";
            $status = "";
        }




        $returnData['status'] = $status;
        $returnData['msg'] = $msg;


        return $returnData;
    }

    function generatePassword($length = 8, $type = "") {
        if ($type == "number") {

            $chars = '0123456789';
        } else {
            $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        }


        $count = mb_strlen($chars);

        for ($i = 0, $result = ''; $i < $length; $i++) {
            $index = rand(0, $count - 1);
            $result .= mb_substr($chars, $index, 1);
        }

        return $result;
    }

    function getpassword() {

        $returnData = "";
        if (isset($_POST[email]) && !empty($_POST[email])) {

            $lost = $this->db->get_row('com_users', '', "email='$_POST[email]' ");
            if (is_array($lost)) {



                $newpassword = $this->generatePassword();

                $ffl = array('password' => md5($newpassword));

                $this->db->update_data('com_users', $ffl, "id=" . $lost['id']);






                $message = "<h1>" . $this->config->setting["siteTitle"] . '</h1>
Your  User
<br/> user Name is :  ' . $lost['user_name'] . '  <br/> Password is: ' . $newpassword . ' <br/>
Thank you,<br>
Web Administrator<br>
    ';








                $this->util->sendMail($lost[email], $message, "Forgotten password", $this->config->setting["siteTitle"], $this->config->setting["admin_mail"]);






                $returnData[0] = "succes";
                $returnData[1] = $this->Messages->login_passwordSent;
            } else {


                $returnData[0] = "error";
                $returnData[1] = $this->Messages->login_mailnotExist;
            }
        }

        //  $returnData['status'] = $status;
        //  $returnData['msg'] = $msg;
        return $returnData;
    }

    function dologout($loction, $var) {
        $r = "";





        if ($_GET[$var] == 'logout') {
            unset($_SESSION['login']);
            unset($_SESSION['user_name']);



            echo '<script>$(function(){ 
               window.location ="' . $loction . '";    
})</script>';



            $r = '<script>$(function(){ 
               window.location =' . $loction . ';    
})
             
createFBLogout();</script>
                   
';
        }
        return $r;
    }

    function logout() {

        if ($_GET[$this->variables->url_view] == 'logout') {
            unset($_SESSION['login']);
            $this->updateStatus();
        }
    }

    function loginUsers($id, $reloadTo = "") {

        $d = $this->getUserBay("id", $id);
        $_SESSION['login'] = $id;
        $_SESSION['user_name'] = $d['user_name'];
        if ($reloadTo != "") {

            echo '<script>'
                    . 'window.location.href = "' . $reloadTo . '";'
                    . '</script>';
        }
    }

    function getAddUser($data) {


        return $this->db->insert_row('com_users', $data);
    }

    function getUserBay($field, $value) {
        return $this->db->get_row('com_users', "", $field . "=" . $value);
        
        
        
        
        
    }

    function getUser($f = "", $id = "") {




        $myid = "";

        if ($id != "") {

            $myid = $id;
        } else {
            $myid = $_SESSION['login'];
        }




        if (isset($_SESSION['login']) || $id != "") {
            $sqldata = $this->getUserBay("id", $myid);


            $retdata = "";
            if ($f == "all" || $f == "") {

                $retdata = $sqldata;
            } else {


                $retdata = $sqldata[$f];
            }
        } else {
            $retdata = "-1";
        }

        return $retdata;
    }

    function isadmin($g_id) {

        $p = $this->getPermission($g_id);



        return $p['isadmin'];
    }

    function getAdminPermission() {

        $per_id = $this->getUserPermission("id");


        $p = $this->db->get_data('com_users_groups_xref', "", "`item_id`='" . $per_id . "'");

        return $p;
    }

    function getModulePermission() {

        $per_id = $this->getUserPermission("id");

        $p = $this->db->get_data('com_modules_permission_xref', "", "`item_id`='" . $per_id . "'");

        return $p;
    }

    function getMenuPermission() {
        $per_id = $this->getUserPermission("id");

        return $this->db->get_data('menu_itmes_permission_xref', "", "`cat_id`='" . $per_id . "'");
    }

    function getUserPermission($filed) {
        $returnData = "-1";
        if ($_SESSION['login'] != null || $_SESSION['login'] != "") {

            $g_id = $this->getUser("g_id");

            $group = $this->db->get_row('com_users_groups ', '*', "id=" . $g_id);



            if ($filed == "all") {

                $returnData = $group;
            } else {
                $returnData = $group[$filed];
            }
        }

        return $returnData;
    }

    function getPermission($g_id) {

        if ($g_id != null || $g_id != "") {

            $group = $this->db->get_row('com_users_groups ', '*', "id=" . $g_id);
        }
        return $group;
    }

    function updateValue($field, $value, $id = "") {

        $ffl = array($field => $value);

        if ($id == "") {
            $id = $this->getUser("id");
        }

        $this->db->update_data('com_users', $ffl, "id=" . $id);
    }

    function checkValue($field, $value, $id = "") {

        if ($id == "") {
            $id = $this->getUser("id");
        }
        $d = $this->db->get_row('com_users', $field, "id=" . $id);

        $r = "0";

        if ($d[$field] == $value) {

            $r = "1";
        }
        return $r;
    }

    function updateStatus($mythis = "") {



        if (isset($_SESSION['login']) && $_SESSION['login'] != "") {

            $g_id = $this->getUser("g_id");



            if ($this->isadmin($g_id) == "1") {


                if ($mythis != "index") {
                    echo '<script>window.location = "index.php";</script>';
                }
            } else {



                if ($mythis == "index") {
                    echo '<script>window.location = "login.php";</script>';
                }
            }
        } else {


            if ($mythis != "logint") {
                echo '<script>window.location = "login.php";</script>';
            }
        }
    }

    function loginForm($lng) {
        $form = array(
            "loginform" => array(
                "name" => "loginform",
                "type" => "form",
                "acton" => "",
                "method" => "post",
                "class" => "loginform",
                "novalidation" => "1"
            )
            ,
            "dologin" => array(
                "name" => "dologin",
                "type" => "hidden",
                "value" => "dologin",
                'class' => ''
            ),
            "user_name" => array(
                "name" => "login_email",
                "type" => "text",
                "title" => $lng['login_email'],
                'class' => '',
                'required' => 'required'
            ),
            "password" => array(
                "name" => "password",
                "type" => "password",
                "title" => $lng['password'],
            ),
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => $lng['login_submit'],
                'class' => 'button'
            ),
            "myendform" => array(
                "name" => "myendform",
                "type" => "endForm"
            )
        );
        $this->lib->forms->filds = $form;
        return $this->lib->forms->_render_form();

        $this->lib->forms->filds = "";
    }

}

?>
