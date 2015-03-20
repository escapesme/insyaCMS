<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\engine;

class userPanelClass {
    /* @var $lib  \libs\libs */

    var $lib;
    var $msg = "";

    function __construct($lib) {
        
    }

    var $panleheader = array();
    var $panleData = array();
    var $plgData = array();

    function getsetting($pro) {

        global $lib;
        $e = $lib->db->get_row("com_users_settings", "*", " id=" . $pro['settings']);

        return $e;
    }

    function messagesPanle() {
        $title = "messages";
        $data = "<div  class='tabsbody $title' >messages</div>";
        array_push($this->panleData, $data);
        array_push($this->panleheader, $title);
    }

    function dataPanle() {


        $title = "data";
        $data = "<div  class='tabsbody $title userinData' ></div>";

        array_push($this->panleData, $data);
        array_push($this->panleheader, $title);
    }

    function createFaceBookLogin($defgroup, $title = "", $settingid = "", $goto = "") {

        $returnData .= '<div class="fbloginAll">';
        if ($title != "") {
            $returnData .= '<h3 class="fbtitle title">' . $title . '</h3>';
        }

        /* @var $lib  \libs\libs */
        global $lib;

        $returnData .=''
                . '<div class="fbdata">'
                . '<div ' . $lib->util->gteLangDataAttr() . ' class="fblogin">fblogin</div>'
                . '<div id="fb-root"></div> '
                . '</div>'
                . '<script> createFBLogin("' . $defgroup . '","' . $settingid . '","' . $goto . '");</script>'
                . '</div>';
        return $returnData;
    }

    function ursStatus($pro, $lng) {

        global $lib;

        /* $this->messagesPanle(); */
        $this->dataPanle();


        $setting = $this->getsetting($pro);
        $userData = $lib->users->getUser("all");

        global $lib;
        $alias = $lib->util->getMenuAlias("com_users");





        $data = " <div class='message'>";

        $data.= " <div style='display:none'  class='error msg reppassword'>"
                . "" . $setting['reppassword'] . "</div>
        </div>";




        $logoutURL = $lib->util->createURL("com_users", "logout");


        /*     $data.="


          <div>" . $lng['welcome'] . "</div>
          <div class='title'>" . $userData['name'] . "</div>

          <div class='image'><img  src='/uploads/images/" . $userData['image'] . "' /></div>"; */

        $data .= ' <div class="userdata"><div id="uploaduserImage" >
                        <noscript><p>Please enable JavaScript to use file uploader.</p></noscript>
                        </div>';
        $data .= '<script> creatPicUploader(\'uploaduserImage\', \'change Image\', function(){

})</script>';
        $data .= "
           


       </div>
   
  

<div class='data'> <div class='datalabel'></div> <div class='datavalue'>" . date("F j, Y, g:i a") . "</div></div>
   
<div data-animation='fade' class='datatabs userToolsBar'>
<ul class='tabstitles'> ";
        foreach ($this->panleheader as $h) {
            $data .= "  <li " . $lib->util->gteLangDataAttr() . "   data-show='$h' id='$h '>" . $lng[$h] . "</li>";
        }

        $data .= " "
                . ""
                . "                    <li data-show='Datachange' ><a  data-show='Datachange' " . $lib->util->gteLangDataAttr() . " class='editdata'>" . $lng['edit'] . " " . $lng['data'] . "</a></li>
"
                . " <li " . $lib->util->gteLangDataAttr() . " data-show='Datachangep' ><a data-show='Datachangep' " . $lib->util->gteLangDataAttr() . "  class='editpassword'>" . $lng['edit'] . " " . $lng['password'] . "</a></li>
                    
                    <li " . $lib->util->gteLangDataAttr() . " ><a " . $lib->util->gteLangDataAttr() . "   href='" . $logoutURL . "'>" . $lng ['logout'] . "</a></li></ul><div class='tabsbodys'>";


        foreach ($this->panleData as $d) {
            $data .= "<div class='dataRow'>" . $d . "</div>";
        }

        $data .= "

<div class='Datachange tabsbody'></div>

<div class='Datachangep tabsbody'></div>
</div>
</div>


";


        return $data;
    }

    function loginform($lng, $to = "/") {
        global $lib;
        $returnData .= $lib->users->dologin($to);

        $returnData .= $lib->users->loginForm($lng);
        $returnData .="<div class='red'><a class='forgotpassword red' href='#forgotpassword'>&nbsp;&nbsp;&nbsp;&nbsp;" . $lng['forgotPassword'] . "</a></div>";
        return $returnData;
    }

    function forgotpassword($lng, $pro, $to) {

        $setting = $this->getsetting($pro);
        global $lib;



        $filds = array(
            "forgotpassword_msg" => array(
                "type" => "label",
                "title" => "<h4>" . $lng['forgotpassword_msg'] . "</h4>",
                "name" => "forgotpassword_msg",
                "class" => "",
            ),
            "forgotpassword_email" => array(
                "type" => "email",
                "title" => "&nbsp;",
                "name" => "forgotpassword_email"
            ),
            "forgotpassword_send" => array(
                "type" => "button",
                "value" => $lng['sendemail'],
                "name" => "forgotpassword_send"
            ), "forgotpassword_sendmsg" => array(
                "type" => "label",
                "title" => "<div class='info success'>&nbsp;&nbsp;&nbsp;&nbsp;" . $lng['forgotpassword_sendmsg'] . "</div>",
                "name" => "forgotpassword_sendmsg",
                "class" => "hidden",
            ), "forgotpassword_errormsg" => array(
                "type" => "label",
                "title" => "<div class='info error'>&nbsp;&nbsp;&nbsp;&nbsp;" . $lng['forgotpassword_errormsg'] . "</div>",
                "name" => "forgotpassword_errormsg",
                "class" => "hidden",
            )
        );



        $lib->forms->filds = $filds;
        $returnData = "<div class='updateData'>" . $lib->forms->_render_form() . "</div>";


        return $returnData;
    }

    function regform($lng, $pro, $to) {

        $setting = $this->getsetting($pro);
        global $lib;






        $returnDatas = $lib->userPanel->addToDB($pro, $lng, "login", $to);



        $returnData .= $lib->forms->getFiledsFormStrign("db", "com_form", $setting['regform'], "data", "", $lng);

        if ($returnDatas != "") {
            $returnData .= "<div  class='error msg username '>" . $lib->util->data->varUpdate($returnDatas) . "</div>";
        }

        $returnData .= ""
                . "<div class='message'>"
                . "<div style='display:none' class='error msg username '>" . $lib->util->data->varUpdate($setting['chkMessage']) . "</div>"
                . "<div style='display:none'  class='error msg reppassword'>" . $lib->util->data->varUpdate($setting['reppassword']) . "</div>"
                . "</div>";





        return $returnData;
    }

    function gustStatus($pro, $lng, $setting) {
        global $lib;
        global $panleData;
        $returnData .=
                "<div class='datatabs'>
        <ul class='tabstitles'>
        <li  data-show='login'>" . $lng['login'] . "</li>
        <li  data-show='register'> " . $lng['req'] . "</li>
              <li  data-show='forgotpassword'> " . $lng['forgotpassword'] . "</li>
            </ul>
     <div class='tabsbodys'>
        <div class='tabsbody login'>";
        $returnData .= $this->loginForm($lng);

        $returnData .= $lib->userPanel->createFaceBookLogin($setting['defgroup'], $lng['login_titlefb'], $pro['settings'], "/");
        $returnData .= "</div> "
                . "";
        $returnData .= "<div class='tabsbody register'>" . $this->regform($lng, $pro, "/") .
                $lib->userPanel->createFaceBookLogin($setting['defgroup'], $lng['reg_titlefb'], $pro['settings'], "/")
                .
                " </div>" .
                "<div class='tabsbody forgotpassword'>" . $this->forgotpassword($lng, $pro, "/") . " </div>"
                . "</div>";

        return $returnData;
    }

    function addToDB($p, $lng, $login = "", $reloadTo = "/") {



        global $lib;
        $sataus = "";
        $returnData = "";

        $pro = $this->getsetting($p);


        if (isset($_POST['name'])) {
            $_POST['password'] = md5($_POST['password']);
            $_POST['created'] = date("Y-m-d H:i:s");
            $chkData = $lib->db->get_Data("com_users", "*", " `email` = '" . $_POST['email'] . "'");
            if (is_array($chkData[0])) {
                $sataus = "3";
            } else {
                $newfilename = time() . "_" . $_FILES['image']['name'];
                $uploadDir = "uploads/images/";
                $uploadfile = $uploadDir . basename($newfilename);
                move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile);
                $_POST ['image'] = basename($newfilename);
                $_POST['enabled'] = $pro['uenabled'];
                $_POST['g_id'] = $pro['defgroup'];

                if (isset($_GET['lang'])) {
                    $_POST['lang'] = $_GET['lang'];
                }



                $sataus = $lib->db->insert_row("com_users", $_POST);


                $userData = $lib->db->get_maxrow("com_users");





                $result = array_merge((array) $lng, (array) $userData);




                $result['myUploadsimagesurl'] = $lib->util->siteSetting['site_link'] . "/uploads/images/";
                $result['myimagesurl'] = $lib->util->siteSetting['site_link'] . "/templates/style/css/images/";
                $result['userurl'] = $lib->util->siteSetting['site_link'] . "/account/#login";






                $mailsubject = $lib->language->getText("com_users_settings", "mailsubject", $pro['id'], $pro['mailsubject']);

                $mailfrommail = $lib->language->getText("com_users_settings", "mailfrommail", $pro['id'], $pro['mailfrommail']);

                $mailfrom = $lib->language->getText("com_users_settings", "mailfrom", $pro['id'], $pro['mailfrom']);

                $signupmail = $lib->language->getText("com_users_settings", "signupmail", $pro['id'], $pro['signupmail']);




                $lib->util->sendHTMLMail($pro['mailto'] . ";" . $_POST ['email'], $signupmail, $mailsubject, $mailfrom, $mailfrommail, $result);




                if ($sataus == 1 && $login != "") {

                    $mid = $lib->db->get_row("com_users", "max(id) as id")['id'];
                    $lib->users->loginUsers($mid, $reloadTo);
                }
            }
        }


        if ($sataus == "1") {
            $returnData = $pro['sendMessage'];
            if ($_POST['enabled'] == "0") {
                
            }
        } else if ($sataus == "0") {
            $returnData = $pro['errorMessage'];
        } else if ($sataus == "3") {
            $returnData = $pro['chkMessage'];
        }
        return $returnData;
    }

    function getdata($val) {
        $retData = "";
        if (isset($_POST[$val])) {
            $retData = $_POST[$val];
        } else {

            $retData = "";
        }
        return $retData;
    }

    // <editor-fold defaultstate="collapsed" desc="new">


    function getadmingroups() {
        global $lib;

        foreach ($this->plgData as $h) {
            $l = $lib->foldersMap->admin_plugins_folder . "typ_users/" . $h['ins_alias'];

            if (is_dir($l)) {

                $r[$h['ins_alias']] = Array(
                    "data_value" => "usersplugin",
                    "title" => $h['ins_title'],
                    "parent" => "usersplugin"
                );
            }
        }


        return $r;
    }

    function getUsrsData() {
        global $lib;

        $r = "<div class='datatabs'><ul class='tabstitles'>";
        foreach ($this->plgData as $h) {
            $r .="<li  data-show='" . $h['ins_alias'] . "'>" . $lib->language->getText("com_install", "ins_title", $h['id'], $h['ins_title']) . "</li>";
        }


        $r .= "</ul><div class='tabsbodys'>";
        foreach ($this->plgData as $h) {
            $r .="<div class='tabsbody " . $h["ins_alias"] . "' >" . $lib->plugins->importPlugin($h["ins_alias"], "", "", "typ_users") . "</div>";
        }
        $r .= "</div>"
                . "</div>";
        return $r;
    }

    function updatePlugins() {
        global $lib;
        $plugins = $lib->db->get_data("com_install", "*", "ins_type='plugin' and  type='typ_users'");

        foreach ($plugins as $p) {
            array_push($this->plgData, $p);
            //echo $data;
        }
        // </editor-fold>
    }

    //  function getplugin
}
