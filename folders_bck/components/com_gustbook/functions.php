<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function getform($pro, $lng) {
    $data = "";
    global $lib;
    if (isset($_POST['title'])) {
        $data .="<div class='msg'>". $lng['addmsg']."<div>";



        $lib->db->insert_row("com_gustbook", $_POST);
    }
    $en = "0";
    if ($pro['enabledMsgs'] == "1") {

        $en = "1";
    }
    $data .= '
<form name="" method="post">
<label>Name :</label><br>
<input name="enabled" type=\'hidden\' vlaue="' . $en . '" style="background-color:#F2E6AA;border:0 none;">
<input name="title" class="forminput" style="background-color:#F2E6AA;border:0 none;"><br>
<label>Country :</label><br>
<input name="country" class="forminput" style="background-color:#F2E6AA;border:0 none;"><br>
<label>Comment :</label><br>
<textarea name="msg"  class="formtext"></textarea><br>
<input name="submit" name="value"  class="button"   src="images/send_but.png" type="submit">
</form>';
    return $data;
}

function getmessages($pro, $lng) {
    $rowNumbers = "6";

    global $lib;
    if ($pro['nums'] != null) {
        $rowNumbers = $pro['nums'];
    }

    if (isset($_GET['page'])) {
        $rowFrom = $_GET['page'];
    } else {
        $rowFrom = "0";
    }
    $llnum = $lib->db->get_data('com_gustbook', '', "1=1");

    $datasql = $lib->db->get_data('com_gustbook', '', "1=1  order by `order`limit " . $rowFrom . "," . $rowNumbers);
    $retData = "";
    foreach ($datasql as $d) {
        $retData.="<div class='comment-block'>
                   <div class='comment-text'>" . $d['msg'] . "</div>
                  
                   <div class='comment-info'>
                   <div class='comment-name'>" . $d['title'] . "</div>
                   <div class='comment-con'> " . $lng['from'] . $d['country'] . "</div>
                   <div class='comment-date'>" . $d['data'] . "</div>
                 </div>
            </div>";
    }

    $retData .=$lib->util->getPageNumber($rowNumbers, count($llnum));


    return $retData;
}
?>



