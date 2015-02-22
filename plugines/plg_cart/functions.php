<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// <editor-fold defaultstate="collapsed" desc="hleper">

function plg_cart_addTocart($data, $lang, $o, $noadd, $id = "") {

    /* @var $lib  libs\libs */
    global $lib;
    global $caetSettings;


    if ($id != "") {
        $o['id'] = $id;
    }
    $r = "<div>";
    if ($noadd != "1") {
        $r.= "<button class='addtocart' type=\"button\">" . $lang['addtocart'] . "</button>";
    }





    $url = $lib->util->createURL($o['type'], "showcart");

    $h = "<div>"
            . "<div class=' cartmsg'>" . $lang['cartmsg'] . "</div>"
            . "<div class='cboxClose cartmsgbt'>" . $lang['cartmsgClose'] . "</div>"
            . "<a href ='$url' class='cartmsgbt'>" . $lang['cartmsgshowcart'] . "</a>"
            . "</div>"
            . "";


    $r.= "<div class='addToCartMsg' type=\"button\"> $h</div>";




    $r.= "<input type='hidden' class='object_id'  value='" . $o['id'] . "'/> "
            . "<input type='hidden' class='object_type'  value='" . $o['type'] . "'/> "
            . "<input type='hidden'  class='object_price'  value='0'/> "
            . "<input type='hidden' class='add_type'  value='" . $caetSettings['multiItems'] . "'/> "
            . "<input type='hidden' class='add_setting'  value='" . $caetSettings['id'] . "'/> "
            . " </div>";
    return $r;
}

function viewinfo($title, $l) {
    /* @var $lib  libs\libs */
    global $lib;
    $a = $_SESSION[$title];
    //////////////////




    return $lib->util->dataBluder->arrayToHtml($a, $l);
}

function saveData($data, $o) {
    /* @var $lib  libs\libs */
    global $lib;

    global $myfromName;






    $d = $lib->db->insert_row("plugincart_order", $data);
    $mid = $lib->db->get_row("plugincart_order", "max(id) as mid");


    $carts = getCarts($o);
    foreach ($carts as $c) {
        $cs = explode(">>", $c);

        $data = array(
            "user_id" => $data['user_id'],
            "cart_id" => $mid['mid'],
            "price" => $cs['2'],
            "item_id" => $cs['1']
        );
    }


    $lib->db->insert_row("plugincart_order_item", $data);

    $data = $_SESSION[$myfromName];


    if ($data['pay-choice'] == "COD") {


        $userd = array(
            "newsletter" => $data['newsletter'],
            "city" => $data['city'],
            "area" => $data['area'],
            "country" => $data['country'],
            "street" => $data['street'],
            "building" => $data['building'],
            "floor" => $data['floor'],
            "flat" => $data['flat'],
            "shipping_note" => $data['shipping_note']
        );



        $lib->db->update_row("com_users", $userd, $data['user_id']);
    }
    return $mid['mid'];
}

function getCarts($o) {



    $carts = $_SESSION[cart_productes][$o['type']];

    return explode(";", $carts);
}

function destoryCart($o, $f) {


    unset($_SESSION[$f]);
    unset($_SESSION[cart_productes][$o['type']]);
}

// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="CanfirmMobile">

function getCanfirmMobile_setp_1($l, $o, $s) {
    /* @var $lib  libs\libs */
    global $lib;


    $user = $lib->users->getUser();



    $formdata = $lib->db->get_row("com_form", "", "id=" . $s['form']);
    $formname = $formdata['title'];

    // echo $_SESSION[$formname]['mobile'];






    $r = "<div class='poneactmain'><div class='image'></div>";
    $filds = array(
        "steptitle" => array(
            "type" => "label",
            "id" => "steptitle",
            "class" => " steptitle h3   ",
            "name" => " steptitle",
            "value" => $l['yourmobile'],
            "title" => $l['yourmobile']
        ),
        "name" => array(
            "type" => "egphone",
            "id" => "datapone",
            "class" => "datapone h4",
            "title" => $l['yourmobilemsg'],
            "value" => $_SESSION[$formname]['mobile'],
            "pclass" => "_50",
            "w" => "_50",
        ),
        "sendphone" => array(
            "type" => "button",
            "id" => "sendphone",
            "class" => " sendphone h3",
            "value" => $l['sendphone'],
            "pclass" => "_50",
            "w" => "_50",
        ), "loading" => array(
            "type" => "div",
            "id" => "loading",
            "class" => " loading",
        ), "loading_end" => array(
            "type" => "enddiv",
        )/* ,
              "mobilemsg" => array(
              "type" => "label",
              "id" => "mobilemsg",
              "class" => "info  mobilemsg",
              "name" => " mobilemsg ",
              "value" => $l['mobilemsg'],
              "title" => $l['mobilemsg']
              ) */
    );
    $lib->forms->filds = $filds;
    $r .= $lib->forms->_render_form();
    $lib->forms->filds = "";
    $r .="</div>";

    $r .= plg_cart_addTocart($s, $lang, $o, "1");







    return $r;
}

function getCanfirmMobile_setp_3($l, $o, $s) {
    $r = "";
    global $lib;

    global $lib;
    // if (isset($_POST['status']) && $_POST['status'] == "1") {
    global $lib;
    $r = "<div class='poneactmain step3'><div class='image'></div>";
    $filds = array(
        "form" => array(
            "type" => "form",
            "id" => "form",
            "method" => "post",
            "action" => "",
        ), "donmsgtitle" => array(
            "type" => "label",
            "id" => "donmsgtitle",
            "class" => " donmsgtitle",
            "name" => " donmsgtitle",
            "value" => $l['mobileactdoneMsgTitle'],
            "title" => $l['mobileactdoneMsgTitle']
        ), "donmsg" => array(
            "type" => "label",
            "id" => "donmsg",
            "class" => " donmsg",
            "name" => " donmsg",
            "value" => $l['mobileactdoneMsg'],
            "title" => $l['mobileactdoneMsg']
        )
        , "confrom" => array(
            "type" => "hidden",
            "id" => "confrom",
            "class" => " mobileConfirmBT",
            "name" => " confrom",
            "value" => "1",
        )
        , "sendphonecode" => array(
            "type" => "submit",
            "id" => "sendphonecode",
            "class" => " sendphonecode",
            "value" => $l['mobileConfirmBT'],
            "pclass" => "_50",
            "w" => "_50",
        )
        ,
        "myendform" => array(
            "name" => "myendform",
            "type" => "endForm"
        )
    );
    $lib->forms->filds = $filds;
    $r .= $lib->forms->_render_form();

    $r .="</div>";

    $lib->forms->filds = "";
    //}









    return $r;
}

function getCanfirmMobile_setp_2($l, $o, $s) {


    $r = "";



    /* @var $lib  libs\libs */
    if (isset($_POST['phone']) && $_POST['phone'] != "") {


        global $lib;


        $r = "<div class='poneactmain setp2'><div class='image'></div>";
        $k = $lib->users->generatePassword(5, "number");

        $lib->users->updateValue("mobile_confirm_code", $k);

        $lib->users->updateValue("mobile_confirm", "0");
        $lib->sms->MSMTitle = "Madad";

        $lib->sms->MSMtext = "Your MADAD verification code is " . $k;
        $lib->sms->MSMNumber = $_POST['phone'];

        $user = $lib->users->getUser();
        if ($user['mobile'] != $_POST['phone']) {
            $lib->users->updateValue("mobile", $_POST['phone']);
        }




        $smsSatsus = $lib->sms->sendSMS();

        if ($smsSatsus[0] != "0" || $smsSatsus[0] != "-10") {
            /*     $r = "<div class='info error'>" . $l['smsErrorMsg'] . "</div>";
              } else { */
            $filds = array(
                "phonecode" => array(
                    "type" => "text",
                    "id" => "phonecode",
                    "class" => "phonecode",
                    "title" => $l['yourmobilecode'],
                    "pclass" => "_50",
                    "w" => "_50",
                ), "sendphonecode" => array(
                    "type" => "button",
                    "id" => "sendphonecode",
                    "class" => " sendphonecode",
                    "value" => $l['mobileConfirmBT'],
                    "pclass" => "_50",
                    "w" => "_50",
                ), "steptitle" => array(
                    "type" => "label",
                    "id" => "steptitle",
                    "class" => " steptitle info   ",
                    "name" => " steptitle",
                    "value" => $l['mobilebackmsg'],
                    "title" => $l['mobilebackmsg']
                ),
            );
            $lib->forms->filds = $filds;
            $r .= $lib->forms->_render_form();

            $r .="<div class='phonecodeErorr hidden'>" . $l['phonecodeErorr'] . "</div></div>";

            $lib->forms->filds = "";
        }

        $r .= plg_cart_addTocart($s, $lang, $o, "1");
    }
    return $r;
}

function getCanfirmMobile($l, $o, $s, $step = "") {
    $r = "";
    // $r = getCanfirmMobile_setp_3($l, $o, $s);





    switch ($step) {
        case "2":
            $r = getCanfirmMobile_setp_2($l, $o, $s);

            break;
        case "3":
            $r = getCanfirmMobile_setp_3($l, $o, $s);
            break;
        default:
            $r = getCanfirmMobile_setp_1($l, $o, $s);
            break;
    }
    return $r;
}

// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="payment">

function getuserData() {
    /* @var $lib  libs\libs */
    global $lib;
    $user = $lib->users->getUser();
    if (isset($_SESSION['login'])) {

        $lastorderf = $lib->db->get_row("plugincart_order", "max(id) as mid", "user_id ='" . $_SESSION['login'] . "'");


        $end = $lib->db->get_row("plugincart_order", "*", "id ='" . $lastorderf['mid'] . "'");
        if (is_array($end)) {

            $_SESSION['userData'] = array_merge($user, $end);
        } else {

            $_SESSION['userData'] = $user;
        }

        /*
         * 
         * $data = array(
          "city" => "city",
          "area" => "area",
          "country" => "country",
          "street" => "street",
          "building" => "building",
          "floor" => "floor",
          "flat" => "flat",
          "shipping_note" => "shipping_note"
          );
         */


        $_SESSION['userData']['city'] = $user['city'];
        $_SESSION['userData']['area'] = $user['area'];
        $_SESSION['userData']['country'] = $user['country'];
        $_SESSION['userData']['street'] = $user['street'];
        $_SESSION['userData']['building'] = $user['building'];

        $_SESSION['userData']['floor'] = $user['floor'];
        $_SESSION['userData']['flat'] = $user['flat'];
        $_SESSION['userData']['shipping_note'] = $user['shipping_note'];
    }

    return $user;
}

function cstep_itemTable($s, $lang, $o, $data, $step) {


    /* @var $lib  libs\libs */
    global $lib;

    $carts = getCarts($o);






    if (count($carts) >= 0) {


        $r .= "<table class='chekoutTabel'><thead>"
                . "<tr>"
                . "<th class='th_pro_image'>Image</th>"
                . "<th class='th_pro_title'>Product</th>"
                . "<th class='th_pro_Quantity' >Quantity</th>"
                . "<th class='th_pro_Price' >Price</th>"
                . "<th class='th_pro_delete' >Remove</th>"
                . "</tr></thead>";
        $allp = 0;

        $num = 0;

        foreach ($carts as $c) {
            $cs = explode(">>", $c);
            if ($cs[0] == $o['type']) {
                if (trim($cs['1']) != "" && trim($cs['1']) != "o") {
                    $num++;

                    $price = $cs['2'];
                    $allp+= $cs['2'];
                    $idate = $lib->db->get_row($o['type'], "*", "id=" . $cs['1']);

                    $c = $lib->coms->project->com_pro_retuncolorFrom_cat($idate['main_cat']);
                    $r .= ""
                            . "<tr>"
                            . "<td class='td_pro_image'><img src='/uploads/images/" . $idate['image'] . "'/></td>"
                            . "<td class='td_pro_title'>" . $idate['title'] . "<div class='des'>" . $idate['short_des'] . "</div>"
                            . "<div class='updatep'> <span class='h5'>" . $lang['updatePriceValue'] . "</span>"
                            . "<input type='text' class='myprice' value='" . $price . "' />"
                            . "<input type='button' class='button updateValue' value='" . $lang['updateValue'] . "'/>"
                            . plg_cart_addTocart($s, $lang, $o, "1", $idate['id'])
                            . " <div class='loading'></div></div></td>"
                            . "<td class='td_pro_Quantity' >1</td>"
                            . "<td class='td_pro_Price' ><div style='background:" . $c . ";' class='viewmypric'>"
                            . "<span><i>" . $price . "</i>" . $lang['currency'] . "</span></div>"
                            . "<input type='hidden' class='thisp' value='" . $price . "' /></td>"
                            . "<td class='td_pro_delete' >"
                            . "<div>"
                            . "<button class='delitem' >" . $lang['delete'] . "</button>"
                            . "<input value='$c' type='hidden' class='itemData' />"
                            . "</div></td>"
                            . "</tr>";
                }
            }
        }

        if ($num == 0) {

            $r .= "<div class='info error'>" . $lang['emptyCartMsg'] . "</div>";
        }


        $r .= "</table>";


        if ($num != 0) {

            $formdata = $lib->db->get_row("com_form", "", "id=" . $s['form']);
            $formname = $formdata['title'];

            if ($_SESSION[$formname]['collection-fee'] != null && $_SESSION[$formname]['collection-fee'] != "0" && $step == "view") {


                $r .= "<div class='collectionFeeData'><span class='collectionMsg' > " . $lang['collectionFeeMsg'] . "</span> <span class='collection-fee' >" . $_SESSION[$formname]['collection-fee'] . "" . $lang['currency'] . "</span></div>";


                $allp+=$_SESSION[$formname]['collection-fee'];
            }

            $r .= "<div class='allpric'>"
                    . "<span class="
                    . ""
                    . ""
                    . "'alltext'>" . $lang['all'] . "</span><div class='data'><span><input readonly type='text' class='allpcire' value='" . $allp . "' />" . $lang['currency'] . "</span></div>"
                    . "</div>";
        }
    } else {


        $r = "<div class='info error'>" . $lang['emptyCartMsg'] . "</div>";
    }

    return $r;
}

function cstep_save($s, $lang, $o, $data) {
    /* @var $lib  libs\libs */
    global $lib;
    global $caetSettings;
    $r = "";




    $formdata = $lib->db->get_row("com_form", "", "id=" . $caetSettings['form']);

    if ($caetSettings['users'] == "1") {


        $user = $lib->users->getUser();
    }








    if (($user['mobile_confirm'] == "0" || $user['mobile'] != $_SESSION[$formdata['title']]['mobile']) &&
            $caetSettings['mobile_confirm'] == "1" &&
            $caetSettings['users'] == "1") {


        $r .= getCanfirmMobile($lang, $o, $caetSettings);
    } else {


        $_SESSION[$formdata['title']]['user_id'] = $lib->users->getUser("id");


        $r .="<div class='info success $data'> " . $lang['saveDataMsg'] . "</div>";

        $r .="<a href='/' class='button backtohome'> " . $lang['backtohome'] . "</a>";





        myemail($lang, $caetSettings, $o);
        saveData($_SESSION[$formdata['title']], $o);
        destoryCart($o, $formdata['title']);
    }




    return $r;
}

function cstep_from($s, $lang, $o, $data) {
    /* @var $lib  libs\libs */
    global $lib;
    global $caetSettings;



    $carts = getCarts($o);


    if (count($carts) >= 0 && $carts[count($carts) - 1] != null) {
        $r = "";

        $user = "-1";
        $formdata = $lib->db->get_row("com_form", "", "id=" . $s['form']);
        $mys = $_SESSION[$formdata['title']];
        if ($caetSettings['users'] == "1") {

            $user = getuserData();
        }


        if ($user == "-1" && $caetSettings['users'] == "1") {

            $data['settings'] = "1";





            $u['settings'] = $caetSettings['users'];




            $r .="<div class='reguser_all'><div class='reguser'>"
                    . "<div class='loginmsg'>" . $lang['loginmsg'] . "</div>"
                    . "<div data-get='regform' class='reg'>" . $lang['reg'] . ""
                    . "</div>"
                    . "<div data-get='loginform'  class='login'>" . $lang['login'] . "    </div>"
                    . "</div></div>";

            $r .= "<div class='regform hidden'><div class='logo'></div>"
                    . $lib->userPanel->regform($lang, $data, "/" . $_GET['alias'] . "/" . $_GET['id'] . "/")
                    //  $lib->userPanel->addToDB($u, $lng, "login", "/" . $_GET['alias'] . "/" . $_GET['id'] . "/")
                    .
                    $lib->userPanel->createFaceBookLogin("1", $lng['titlefb'], $caetSettings['users'], "/" . $_GET['alias'] . "/" . $_GET['id'] . "/")
                    . "</div>";
            $r .= "<div class='loginform hidden'><div class='loginData'>"
                    . "<div class='logo'></div>"
                    . $lib->userPanel->loginform($lang, "/" . $_GET['alias'] . "/" . $_GET['id'] . "/") . $lib->userPanel->createFaceBookLogin("1", $lng['titlefb'], $caetSettings['users'], "/" . $_GET['alias'] . "/" . $_GET['id'] . "/")
                    . "<div class=' form_row orlabel'>" . $lang['login_or'] . "</div></div></div>";
        } else {


            date_default_timezone_set('Africa/Cairo');
            $ndate = strtotime("now");



            $date = getdaySatust($ndate);
            $newDay = date('d', $date);
            $month = date('m', $date);
            $year = date('Y', $date);


            $data = array(
                "name" => "name",
                "mobile" => "mobile"
                , "email" => "email", "street" => "street", "building" => "building", "floor" => "floor", "flat" => "flat", "shipping_note" => "shipping_note"
            );

            updateSesstionVar($data);






            $r .="<script> $(function(){updaetData($newDay, $month-1, $year)}) </script>";
            $r .= $lib->forms->getFiledsFormStrign("db", "com_form", $s['form'], "data", "", $lang);
            $r .= "<script>$(function(){ pricActions('" . $s['price-limit'] . "', '" . $s['collection-fee'] . "', '.updateValue','.allpcire', '.collection-fee');})</script>";
        }
    }
    return $r;
}

function updateSesstionVar($names) {
    global $myfromName;








    foreach ($names as $k => $n) {

        if (!isset($_SESSION[$myfromName][$k]) && $_SESSION[$myfromName][$k] == null && $_SESSION[$myfromName][$k] == "") {
            $_SESSION[$myfromName][$k] = $_SESSION['userData'] [$n];
        }
    }
}

function getdaySatust($sdate) {

    /*
     * 
     * If today is Sunday (Before 5pm) -->Tuesday onwards selectable
      If today is Sunday (After5pm) -->Wednesday onwards selectable
      If today is Monday (Before 5pm) -->Wednesday onwards selectable
      If today is Monday (After5pm)-->Thursday onwards selectable
      If today is Tuesday (Before 5pm)-->Thursday onwards selectable
      If today is Tuesday (After5pm)-->Saturday onwards selectable
      If today is Wednesday (Before 5pm)-->Saturday onwards selectable
      If today is Wednesday (After 5pm)-->Sunday onwards selectable
      If today is Thursday -->Sunday onwards selectable
      If today is Friday -->Monday onwards selectable
      If today is Saturday (Before 5pm)-->Monday onwards selectable
      If today is Saturday (After5pm) -->Tuesday onwards selectable
     */




    $dayTitle = date('l', $sdate);

    $h = date('H', $sdate);





    $r = "0";
    switch ($dayTitle) {
        case "Sunday":
            if ($h >= 17) {

                $r = "3";
            } else {
                $r = "2";
            }
            break;
        case "Monday":
            if ($h >= 17) {
                $r = "3";
            } else {
                $r = "2";
            }
            break;
        case "Tuesday":
            if ($h >= 17) {
                $r = "4";
            } else {
                $r = "2";
            }
            break;
        case "Wednesday":
            if ($h >= 17) {
                $r = "4";
            } else {
                $r = "3";
            }
            break;
        case "Thursday":
            if ($h > 17) {
                $r = "3";
            } else {
                $r = "3";
            }
            break;
        case "Friday":
            if ($h >= 17) {
                $r = "2";
            } else {
                $r = "2";
            }
            break;
        case "Saturday":
            if ($h >= 17) {
                $r = "3";
            } else {
                $r = "2";
            }
            break;

        default:
            break;
    }




    return strtotime(date('Y-m-d', $sdate) . ' + ' . $r . ' days');
    ;
}

function cstep_view($s, $lang, $o, $data) {
    /* @var $lib  libs\libs */
    global $lib;
    global $caetSettings;
    $r = "";

    $formdata = $lib->db->get_row("com_form", "", "id=" . $s['form']);

    $mys = $_SESSION[$formdata['title']];






    if ($mys['pay-choice'] == "COD") {


        echo "<style>._pay-chioce-collection-point,.collection-msg,.collection-point-label ,.request-collection ,._pay-chioce-collection,._RequestLabel_request-collection,._Collection-Point ,._Collection-Point-selected,._RedLabel_collection-msg "
        . "{display: none !important;}</style>";

        echo "<style>._RequestLabel_request,._COD, ._RequestLabel_address-label, ._building, ._flat, ._floor, ._street,._shipping_note"
        . "{display: block !important;}</style>";
    } else {
        echo "<style>._RequestLabel_request-collection,._Collection-Point ,._Collection-Point-selected,._RedLabel_collection-msg "
        . "{display: block !important;}</style>";

        echo "<style>.request-fill,._RequestLabel_request-fill,._COD, ._RequestLabel_address-label, ._building, ._flat, ._floor, ._street,._shipping_note"
        . "{display: none !important;}</style>";
    }





    $r .="<form action='' class='cartinfo' method='post'>";
    $r .= viewinfo($formdata['title'], $lang);

    $user = $lib->users->getUser();


    $r .="<div class='line form_row'></div>";





    $bttitle = "";



    //echo $user['mobile'] . "==" . $_SESSION[$formdata['title']]['mobile'];
    // 
    if (($user['mobile_confirm'] == "1" && $user['mobile'] == $_SESSION[$formdata['title']]['mobile'] ) ||
            $caetSettings['mobile_confirm'] == "0" ||
            $caetSettings['users'] == "0") {

        $bttitle = $lang['payBT'];
    } else {



        $r .="<div class='info'>" . $lang['mobileConfirmMsg'] . "</div>";

        $bttitle = $lang['mobileConfirmBT'];
    }






    $s = $formdata['title'] . "." . 'go-to-save';


    $r .="<div class='line form_row'></div>"
            . "<div class='tocenter'><input type='button' class='fromgback' value='" . $lang['back'] . "' name='back'/>"
            . "<input type='submit' class='submit' value='$bttitle' name='confrom'/></div>"
            . "</form><script>setSession('.fromgback','$s','','reload')</script>";

    return $r;
}

function cstep_empty($s, $lang, $o, $data) {
    /* @var $lib  libs\libs */
    global $lib;
    $r = "";
    $r = "xxxxxxxxxxxxxxxxx";
    return $r;
}

function cartPaymentStepes($s, $lang, $o, $data, $step, $wtabel = "") {

    $r = "<div class='step $step'>";

    if ($wtabel != "" && $step != "save") {

        $r .=cstep_itemTable($s, $lang, $o, $data, $step);
    }
    switch ($step) {
        case "view":
            $r .= cstep_view($s, $lang, $o, $data);






            

            break;
        case "save":
            $r .= cstep_save($s, $lang, $o, "");
            break;

        case "empty":
            $r .= cstep_empty($s, $lang, $o, $data);
            break;
        default:


            $r .= cstep_from($s, $lang, $o, $data);
            break;
    }

    $r.="</div>";
    return $r;
}

function plg_cart_showCart($s, $lang, $o, $data) {


    /* @var $lib  libs\libs */
    global $lib;

    $carts = getCarts($o);

    if (count($carts) >= 0) {


        $formdata = $lib->db->get_row("com_form", "", "id=" . $s['form']);



        if ($_POST['confrom']) {

            $r .= cartPaymentStepes($s, $lang, $o, $data, "save", "0");
        } else if ($_SESSION[$formdata['title']]['go-to-save'] == "yes") {
            $r .= cartPaymentStepes($s, $lang, $o, $data, "view", "1");
        } else {
            $r .= cartPaymentStepes($s, $lang, $o, $data, "", "1");
        }
    } else {


        $r .= cartPaymentStepes($s, $lang, $o, $data, "empty", "");
    }

    return$r;
}

function myemail($lang, $s, $o) {

    /* @var $lib  libs\libs */
    global $lib;

    $lang['myimagesurl'] = $lib->util->siteSetting['site_link'] . "/templates/style/css/images/";
    $lang['myUploadsimagesurl'] = $lib->util->siteSetting['site_link'] . "/uploads/images/";

    $carts = getCarts($o);

    global $myfromName;

    $mys = $_SESSION[$myfromName];


    foreach ($carts as $c) {
        $cs = explode(">>", $c);
        if ($cs['1'] != "") {
            $_SESSION['projcetData'] = $lib->db->get_row("com_project", "", "id=" . $cs['1']);
            $_SESSION['projcetData']['amount'] = $cs['2'];

            $_SESSION['projcetData']['collection-fee'] = $_SESSION['Madad-Checkout']['collection-fee'];
            $_SESSION['projcetData']['all'] = $_SESSION['Madad-Checkout']['collection-fee'] + $cs['2'];


            $p = $lib->colltions->getPluginData("com_project", $cs['1']);

            $w = $lib->util->data->arraytwhere($p['source'], "id", "string");

            $_SESSION['projcetData']['rescores'] = "";
            $all = $lib->db->get_data("plg_rescores", "*", $w);
            foreach ($all as $a) {
                $_SESSION['projcetData']['rescores'] .= $a['title'] . " ، ";
            }
        }
    }



    if ($mys['pay-choice'] == "COD") {

        $_SESSION['projcetData']['address'] = $lang['street'] . " : " . $mys['street'] . "<br />" .
                $lang['building'] . " : " . $mys['building'] . "<br />" .
                $lang['floor'] . " : " . $mys['floor'] . "<br />" .
                $lang['flat'] . " : " . $mys['flat'] . "<br />" .
                $lang['shipping_note'] . " : " . $mys['shipping_note'] . "<br />"
        ;
    } else {

        $lang["mailiAddresTitle"] = $lang["mailiAddresTitleCollectionPoint"];
        $lang["mailDateTitle"] = $lang["mailDateTitleCollectionPoint"];
        $_SESSION['projcetData']['address'] = $lang[$mys['Collection-Point']];
    }


    $_SESSION['projcetData']['rightside'] = $lang['date'] . " : " . $mys['date'] . "<br />" .
            $lang['time'] . " : " . $mys['time'] . "<br />" .
            $lang['mobile'] . " : " . $mys['mobile'] . "<br />"

    ;




    if ($_SESSION['projcetData']['collection-fee'] == "") {
        $_SESSION['projcetData']['collection-fee'] = "0 &nbsp;";
    }





    $sp = $lib->util->data->TextVarUpdate($lang, $s['mailsubject']);

    $lib->util->sendHTMLMail($s['mailto'] . ";" . $mys['email'], $s['signupmail'], $sp, $s['mailfrom'], $s['mailfrommail'], $lang);
}

// </editor-fold>
?>

