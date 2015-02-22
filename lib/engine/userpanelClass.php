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

    function ursStatus($pro, $lng) {

        global $lib;

        $this->messagesPanle();
        $this->dataPanle();


        $setting = $this->getsetting($pro);
        $userData = $lib->users->getUser("all");

        global $lib;
        $alias = $lib->util->getMenuAlias("com_users");



        $data = " <div class='message'>";

        $data.= " <div style='display:none'  class='error msg reppassword'>" . $setting['reppassword'] . "</div>
        </div>";




        $logoutURL = $lib->util->createURL("com_users", "logout");


        $data.="
      
    <div class='userdata'> 
       <div>" . $lng['welcome'] . "</div>
       <div class='title'>" . $userData['name'] . "</div>
           
       <div class='image'><img  src='uploads/images/" . $userData['image'] . "' /></div>";

        $data .= '<div id="uploaduserImage" >
                        <noscript><p>Please enable JavaScript to use file uploader.</p></noscript>
                        </div>';
        $data .= '<script> creatPicUploader(\'uploaduserImage\', \'change Image\', function(){

})</script>';







        $data .= "
           


       </div>
   
  

<div class='data'> <div class='datalabel'></div> <div class='datavalue'>" . date("F j, Y, g:i a") . "</div></div>
   
<div class='tabs'>
<ul> ";
        foreach ($this->panleheader as $h) {
            $data .= "  <li  class='tabTitle' id='$h'>" . $lng[$h] . "</li>";
        }

        $data .= "</ul>";


        foreach ($this->panleData as $d) {
            $data .= $d;
        }

        $data .= "


</div>
<div class='Datachange'></div>


<div class='userToolsBar'>
<ul>
<li><a class='editpassword'>" . $lng['edit'] . " " . $lng['password'] . "</a></li>
<li><a class='editdata'>" . $lng['edit'] . " " . $lng['data'] . "</a></li>
<li><a class='messages'>" . $lng['last'] . " " . $lng['messages'] . "</a></li>
<li><a href='" . $logoutURL . "'>" . $lng ['logout'] . "</a></li>
    </ul>
    

    </div>";


        return $data;
    }

    function gustStatus($pro, $lng) {
        global $lib;
        global $panleData;
        $setting = $this->getsetting($pro);

        $returnData .= $lib->users->dologin("/");

        $returnData .=

                "<div class='tabs'>
        <ul>
        <li class='tabTitle' id='login'>login</li>
        <li class='tabTitle' id='regtab'>req</li>
        
        </ul>
     
<div class='tabsbody login'>";
        $returnData .= $lib->users->loginForm($lng);
        $returnData .= "</div>
         <div class='tabsbody regtab'>
        <div class='message'>";
        $returnData.= "  <div style='display:none' class='error msg username '>" . $setting['chkMessage'] . "</div>
        <div style='display:none'  class='error msg reppassword'>" . $setting['reppassword'] . "</div>
     </div>";
        $returnData.= $lib->forms->getFiledsFormStrign("db", "com_form", $setting['regform'], "data");
        $returnData .= "</div></div>";

        return $returnData;
    }

    function addToDB($p, $lng) {



        global $lib;
        $sataus = "";
        $returnData = "";

        $pro = $this->getsetting($p);


        if (isset($_POST['name'])) {
            $_POST['password'] = md5($_POST['password']);

            $chkData = $lib->db->get_Data("com_users", "*", " `name`='" . $_POST['name'] . "' or `email`='" . $_POST['email'] . "'");


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
