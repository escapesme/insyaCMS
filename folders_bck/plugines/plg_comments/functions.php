<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function addcomeent($data, $lang) {
    /* @var $lib  libs\libs */
    global $lib;


    $retuanData = "";
    if (isset($_POST['ob_type'])) {
        $_POST = $lib->util->dateTime->updateDBDates($_POST);

        $lib->db->insert_row("plg_comments", $_POST);

        if ($data["enabled"] == "1") {

            $retuanData.= "<div class='info success'>" . $lang['sendMessage'] . "</div>";
        } else {

            $retuanData.= "<div class='info'>" . $lang['disablesendMessage'] . "</div>";
        }
    }
    return $retuanData;
}

function getComments($data, $lng) {
    /* @var $lib  libs\libs */
    global $lib;
$moreData = " limit " . $data["limitfrom"] . "," . $data["limitnumber"];


    $sqlData = $lib->db->get_Data("plg_comments", "*", " ob_type='" . $data["ob_type"] . "' and  ob_id='" . $data["ob_id"] . "' " . $moreData);
    $retuanData = "";
    foreach ($sqlData as $s) {

        $more = "";

        $u = "";



        if ($data['users'] == "1") {


            $u = $lib->users->getUser("", $s['user_id']);

            if ($lib->users->isadmin($u['g_id']) == "1") {
                $more = "admin";
            }
        }






        $retuanData.="<div class='commentrow $more'>";
        if ($data['users'] == "1") {
            $s['com_name'] = $u['name'];
            $retuanData.="      <div class='com_img'><img  class='circle blur' src='" . $lib->foldersMap->fornt_upload_images . $u['image'] . "'  /> </div>";
        }
        $retuanData.="      <div class='com_name'>" . $s['com_name'] . "</div>
              <div class='com_date'><span>" . $lng['date'] . "</span>" . $lib->util->dateTime->dateFromdb($s['created']) . "</div>
                      <div class='com_title h3'>" . $s['com_title'] . "</div>
                      <div class='com_message'>" . $s['com_message'] . "</div>"
                . "</div>";
    }



    $retuanData.="<div class='getMore'>" . $lng["showmore"] . "</div><script>moreCommets('" . $data["limitfrom"] . "', '" . $data["limitnumber"] . "',  '" . $data["ob_type"] . "', '" . $data["ob_id"] . "', '" . $lng['date'] . "', '" . $data['users'] . "') </script><div class='clearfix'></div>";

    return $retuanData;
}

function createFrom($lang, $data) {
    /* @var $lib  libs\libs */
    global $lib;

    if ($data['users'] == "1" && !isset($_SESSION['login'])) {
        $returnData .="<div class='loginmsg'>" . $lang["loginmsg"] . "</div>";
    } else {

        $returnData .= "<form class='com_form'  method='post' action=''> " .
                "<input type='hidden' value='" . $data["enabled"] . "'   name='enabled'  /> " .
                "<input type='hidden' value='" . $data["ob_id"] . "'   name='ob_id'  /> ";

        if ($data['users'] == "1") {
            $uid = $lib->users->getUser("id");
            $returnData .= "<input type='hidden' value='" . $uid . "'   name='user_id'  /> ";
        }



        $returnData .= "<input type='hidden' value='" . $data["ob_type"] . "'   name='ob_type'  /><div> ";

        if ($data['users'] != "1") {

            $returnData .= "<labe for='com_name'>" . $lang['name'] . " </labe> <input class='inputtext'  name='com_name'  /></div>";
        }

        $returnData .= "<div><labe for='com_title'>" . $lang['title'] . " </labe> <input  class='inputtext'  name='com_title' /></div>";
        $returnData .= "<div><labe for='com_title'>" . $lang['message'] . " </labe> <textarea  name='com_message'></textarea> </div>
                    <input type='reset'  class='button' value='" . $lang['reset'] . "' >
                    <input type='submit' class='button' value='" . $lang['submit'] . "'>
                    </form> ";
    }

    return $returnData;
}
