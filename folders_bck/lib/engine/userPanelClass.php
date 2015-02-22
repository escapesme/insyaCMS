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

    function createFaceBookLogin($defgroup, $title = "", $settingid = "",$goto="") {

        $returnData .= '<div class="fbloginAll">';
        if ($title != "") {
            $returnData .= '<h3 class="fbtitle title">' . $title . '</h3>';
        }



        $returnData .=''
                . '<div class="fbdata">'
                . '<div class="fblogin">fblogin</div>'
                . '<div id="fb-root"></div> '
                . '</div>'
                . '<script> createFBLogin("' . $defgroup . '","' . $settingid . '","'.$goto.'");</script>'
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


        $data.="
      
    <div class='userdata'> 
       <div>" . $lng['welcome'] . "</div>
       <div class='title'>" . $userData['name'] . "</div>
           
       <div class='image'><img  src='/uploads/images/" . $userData['image'] . "' /></div>";

        $data .= '<div id="uploaduserImage" >
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
            $data .= "  <li   data-show='$h' id='$h '>" . $lng[$h] . "</li>";
        }

        $data .= "  <li data-show='Datachange' ><a data-show='Datachange'  class='editpassword'>" . $lng['edit'] . " " . $lng['password'] . "</a></li>
                    <li data-show='Datachange' ><a data-show='Datachange'  class='editdata'>" . $lng['edit'] . " " . $lng['data'] . "</a></li>
                    
                    <li><a href='" . $logoutURL . "'>" . $lng ['logout'] . "</a></li></ul><div class='tabsbodys'>";


        foreach ($this->panleData as $d) {
            $data .= "<div class='dataRow'>" . $d . "</div>";
        }

        $data .= "

<div class='Datachange tabsbody'></div></div>
</div>


";


        return $data;
    }

    function loginform($lng, $to = "/") {
        global $lib;
        $returnData .= $lib->users->dologin($to);

        $returnData .= $lib->users->loginForm($lng);

        return $returnData;
    }

    function regform($lng, $pro,$to) {

        $setting = $this->getsetting($pro);
        global $lib;


       

      $returnDatas = $lib->userPanel->addToDB($pro, $lng, "login", $to);

      $returnData .= $lib->forms->getFiledsFormStrign("db", "com_form", $setting['regform'], "data");

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
            </ul>
     <div class='tabsbodys'>
        <div class='tabsbody login'>";
        $returnData .= $this->loginForm($lng);
        $returnData .= "</div> <div class='tabsbody register'>";
        $returnData .= $this->regform($lng, $pro,"/") . " </div>"
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
                $sataus = $lib->db->insert_row("com_users", $_POST);


                $userData = $lib->db->get_maxrow("com_users");





                $result = array_merge((array) $lng, (array) $userData);



                $result['myUploadsimagesurl'] = "http://fiz.qlegal.net/uploads/images/";
                $result['myimagesurl'] = "http://fiz.qlegal.net/templates/style/css/images/";
                $result['userurl'] = "http://fiz.qlegal.net/account/#login";





                $lib->util->sendHTMLMail($pro['mailto'] . ";" . $_POST ['email'], $pro['signupmail'], $pro['mailsubject'], $pro['mailfrom'], $pro['mailfrommail'], $result);




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

    function productData($d) {
        
    }

}
