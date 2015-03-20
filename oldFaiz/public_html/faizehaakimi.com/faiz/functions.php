<?php

function get_pid($get = "pid") {

    $pid = "";
    if (isset($_GET[$get]) && ($_GET[$get] == "1" || $_GET[$get] == "0")) {

        $pid = "and pid ='" . $_GET[$get] . "'";
    } else {

        $pid = "and pid =0";
    }
    return $pid;
}

function get_pkg() {
    global $db;
    $ff = explode('/', $_GET['action']);
    $mm = $db->get_row('packges_config', '', 'pkg_dir=' . "'" . $ff[0] . "'");
    return $mm;
}

$pkg_config = get_pkg();

function getstat($seval, $th_val) {

    if ($seval == $th_val) {


        echo "selected='selected'";
    };
}

;

function betweenTowDays($data1, $data2) {



    $days = getdays($data1, $data2);

    $dtchin = explode('/', $data1);
    $chkout_h = $dtchin[1] . "/" . $dtchin[0] . "/" . $dtchin[2];


    for ($i = 0; $i < $days; $i++) {
        $ret[$i] = date('Y-m-d', strtotime($chkout_h . '+' . $i . ' day'));
    }

    return $ret;
}

function betweenTowDays2($data1, $data2) {



    $days = getdays($data1, $data2);

    $dtchin = explode('/', $data1);
    $chkout_h = $dtchin[1] . "/" . $dtchin[0] . "/" . $dtchin[2];


    for ($i = 0; $i < $days; $i++) {
        $ret[$i] = date('Y-m-d', strtotime($chkout_h . '+' . $i . ' day'));
    }

    return $ret;
}

function Datapordays($data, $num) {


    $dtchin = explode('/', $data);
    $chkout_h = $dtchin[1] . "/" . $dtchin[0] . "/" . $dtchin[2];

    return date('d/m/Y', strtotime($chkout_h . '' . $num . ' day'));
}

function getdays($d1, $d2) {
    $dtchin = explode('/', $d1);
    $chkin_h = $dtchin[1] . "/" . $dtchin[0] . "/" . $dtchin[2];
    $dtchin = explode('/', $d2);
    $chkout_h = $dtchin[1] . "/" . $dtchin[0] . "/" . $dtchin[2];

    $date2 = strtotime($chkout_h);
    $date4 = strtotime($chkin_h);

    $date5 = ($date2 - $date4) / (60 * 60 * 24);
    return $date5;
}

function getString($string, $start, $end) {
    if ($start == "") {
        $startpos = 0;
    } else {
        $startpos = strpos($string, $start);
    }
    $endpos = strpos($string, $end, $startpos);
    // echo $startpos-;
    return substr($string, $startpos, $endpos - $startpos + 1);
}

function genratedaynames($s1) {
    $days = array(0 => "Sat", 1 => "Sun", 2 => "Mon", 3 => "Tue", 4 => "Wed", 5 => "Thu", 6 => "Fri");
    $key = array_search($s1, $days);
}

function getweathers($url) {
    $doc = new DOMDocument();
    $doc->load($url);
    $arrFeeds = array();
    $result = array();
    foreach ($doc->getElementsByTagName('item') as $node) {
        $string.= $node->getElementsByTagName('description')->item(0)->nodeValue;
    }
    //echo $string."<br><br>";
    $current_weather_image = getString($string, "<img", ">");
    $new_string = ereg_replace("[^A-Za-z0-9.]", "", strip_tags(getString($string, "/><br />", "#")));
    $st1 = explode(".", $new_string);
    $current_temp = $st1[1] . "&deg;";
    $current_weather_name = $st1[0];
    $forecast = explode("%", (strip_tags(getString($string, "Today", "More information"), "<img>")));
    $re1 = array(":", ".");
    $re2 = array("Lo: ", "&#176;C");
    $re3 = array("Hi: ", "&#176;C");
    $result['current_temp'] = str_replace("&deg;", "", $current_temp);
    $sawimgpath = "images/weather/";
    $result['current_weather_image'] = str_replace("http://blst.msn.com/as/wea3/i/en-us/law/", $sawimgpath, $current_weather_image);
    $result['current_weather_image'] = str_replace("55", "45", $result['current_weather_image']);
    foreach ($forecast as $key => $val) {
        $result['dayname'][$key] = str_replace($re1, "", getString($val, "", ":"));
        $result['weather_name'][$key] = str_replace($re1, "", getString($val, ":", "."));
        $result['weather_image'][$key] = str_replace("http://blst.msn.com/as/wea3/i/en-us/saw/", $sawimgpath, getString($val, "<img", "/>") . ">");
        $result['weather_image'][$key] = str_replace('"35"', '"30"', $result['weather_image'][$key]);
        $result['weather_image'][$key] = str_replace('"21"', '"30"', $result['weather_image'][$key]);
        $result['lo'][$key] = str_replace($re2, "", getString($val, "Lo: ", "C."));
        $result['hi'][$key] = str_replace($re3, "", getString($val, "Hi: ", "C."));
    }
    genratedaynames(date("D"));
    return $result;
    //$current_temp = preg_replace("/[^0-9]/", '', getString($string,"/><br />","#"));
}

function report_head($sql, $Stat = "") {
    global $db;


    $adminall = $db->get_data_query("$sql");
    $admin_ad = $db->get_data_query("$sql  $Stat adult_child_infant='A'");
    $admin_ch = $db->get_data_query("$sql  $Stat  adult_child_infant='C'");
    $admin_in = $db->get_data_query("$sql  $Stat  adult_child_infant='I'");


    echo "<div class=\"info\"><div><label>all :</label>" . count($adminall) . "</div>";
    echo " <div><label> A:</label>" . count($admin_ad) . "</div>";
    echo " <div><label> C:</label>" . count($admin_ch) . "</div>";
    echo "<div> <label>I:</label>" . count($admin_in) . "</div></div>";
}

function get_city() {
    $retcity;
    if (isset($_GET['home'])) {
        switch ($_GET['home']) {
            case"q":
                $retcity = "q";
                break;
            case"m":
                $retcity = "m";
                break;
            case"s":
                $retcity = "s";
                break;
            case"c":
                $retcity = "c";
                break;
            case"y":
                $retcity = "y";
                break;
        }
    } else {
        $retcity = "c";
    }
    return "home=" . $retcity . "&";
}

function getsun($lt, $nt, $im) {
  /*  $d = date("d");
    $m = date("m");
    echo "http://www.earthtools.org/sun/" . $lt . "/" . $nt . "/" . $d . "/" . $m . "/" . $im . "/0";
  
    $dom = new DomDocument();
    $dom->load("http://www.earthtools.org/sun/" . $lt . "/" . $nt . "/" . $d . "/" . $m . "/" . $im . "/0");
    $imageList = $dom->getElementsByTagName('sunrise');
    $imageCnt = $imageList->length;
    $imageList2 = $dom->getElementsByTagName('sunset');
    $imageCnt2 = $imageList2->length;
    $ds = str_split($imageList2->item(0)->nodeValue, 5);
    $dd = str_split($imageList->item(0)->nodeValue, 5);
    
    */
    /*sdfds30.036140530.036140530.036140530.0361405
     * 
     * Latitude: 38.4 North
Longitude: 9 West30.0361405,31.2036894
     */
    echo "<div id=\"sunries\"><br><br><div id=\"sun_num1\">" .date_sunrise(time(), SUNFUNCS_RET_STRING,$lt,$nt) . "</div></div>";
    echo "<div id=\"sunset\"><br><br><div id=\"sun_num\">" .  date_sunset(time(), SUNFUNCS_RET_STRING,$lt,$nt). "</div></div>";
}

function get_city_full() {
    $retcity = "cairo";
    if (isset($_GET['home'])) {
        switch ($_GET['home']) {
            case"q":
                $retcity = "quds";
                break;
            case"m":
                $retcity = "mutah";
                break;
            case"s":
                $retcity = "shaam";
                break;
            case"c":
                $retcity = "cairo";
                break;

            case"y":
                $retcity = "yemen";
                break;
        }
    }
    return $retcity;
}

function curPageURL() {
    $pageURL = 'http';
    if ($_SERVER["HTTPS"] == "on") {
        $pageURL .= "s";
    }
    $pageURL .= "://";
    if ($_SERVER["SERVER_PORT"] != "80") {
        $pageURL .= $_SERVER["SERVER_NAME"] . ":" . $_SERVER["SERVER_PORT"] . $_SERVER["REQUEST_URI"];
    } else {
        $pageURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
    }
    return $pageURL;
}

function getjcity_home($secon = " and ") {

    return " $secon city='" . get_city_full() . "'  and `delete` ='0'";
}

function get_my_stat() {
    global $db;
    $mys = $db->get_row('my_status', '', 'id<>0');
    return $mys['title'];
}

function getjcity($secon = " and ", $_mys = "",$city="") {
    $_mor = "";

    $ddtabels = array(
        'trans_voucher',
        'reservation', 'lwazim_calc', 'ex_reservation'
    );

    foreach ($ddtabels as $tabel) {

        if ($_mys == $tabel) {
            $_mor = " and `my_status` = '" . get_my_stat() . "'";
        }
    }

  $returndata=" $secon `city`='" . $_SESSION['login_city'] . "' " . $_mor;;  


if ($city!=""){
  $returndata=" $secon `city`='" . $city . "' " . $_mor;;  
    
}

    return $returndata;
}

function print_img($hight = "700", $width = "900") {

    echo "<a href=\"#\"><img  onClick=\"myPopup2()\" width=30 height=25 src=images/print.png />";
    ?>

    <script type="text/javascript">
        function myPopup2() {
            window.open( ""<?php echo "actions/admin/rep_chkin_s/list_print.php?g_id=" . $_GET['g_id'] ?>"", "Print V", 
            "status = 1, height =<?= $hight ?>, width=<?= $width ?>, resizable = 0" )
        }
    </script>

    <?php
}

function data_to_db($data) {
    $newdate = explode('/', $data);

    $dd = $newdate[2] . "-" . $newdate[1] . "-" . $newdate[0];
    $dd = str_replace('--', '', $dd);
    return $dd;
}

function data_from_db($data) {
    $newdate = explode('-', $data);
    $dt = $newdate[2] . "/" . $newdate[1] . "/" . $newdate[0];

    $dt = str_replace('//', '', $dt);

    return $dt;
}

function creat_pdf($title, $MyWords) {

    $pdf = pdf_new(); // ????? ??? ???? ??? ?????????

    pdf_open_file($pdf, "/my_pdf.pdf"); // ????? ??? ???? ?? ?????? ?????? ????? ??? ????? ?????? ??? ????????
    // ?????? ?? ???? ????? ?????

    pdf_set_info($pdf, "Author", "FaizeHaakimi"); // ???? ?? ????? ?????? ?? ????? ??? ????? ???? ?? ??? ????? ??? ??????
    pdf_set_info($pdf, "Title", $title); // ????? ?????
    pdf_set_info($pdf, "Creator", "faizehaakimi.com"); //   ????? ??????
    pdf_set_info($pdf, "Subject", "$title"); // ????? ???????

    pdf_begin_page($pdf, 595, 842); // ??? ????? ??????? ?? 595* 842  /* A4 is 595 x 842, Letter is 612 x 792 and Legal is 612 x 1008.    */

    $arial = pdf_findfont($pdf, "Arial", "host", 1);   // ??? ???? ????????
    pdf_setfont($pdf, $arial, 14);

    pdf_show_xy($pdf, "<$MyWords>", 50, 400); // ????? ???? ????? ?????? ?? ????? ???????  " ???? ???????" ???? ??????

    $gif_image = pdf_open_gif($pdf, "pic.gif");  // ?????? ???? ???????????  

    pdf_place_image($pdf, $gif_image, 200, 300, 1.0); // ??? ?????? ????????? ?????? ??????? ?? ?????? ????? ?????? ?????????? ?? ?????

    pdf_close_image($pdf, $gif_image); // ??? ????? ??? ?????? 

    pdf_end_page($pdf); // ??? ????? ????? ??? ????????? 
    pdf_close($pdf); // ????? ?????? ??? ??? ?????????

    echo "<A HREF=\"my_pdf.pdf\" TARGET=\"_blank\">Open pdf in a new window </A>";

// ???? ??? ????? ???? pdf.php 
}

function send_mail_rep($title) {

    include("mailer.class.php");

    global $db;

    $mails = $db->get_data('rep_mail', '', " `delete` ='0' and city='cairo'");
    //print_r($mails);
    foreach ($mails as $ma) {
        $filename = $title . '.html';
        $tott = $ma['mail'];
//$tott="empcland@gmail.com";
//$tott="azizms@gmail.com";	

        $subject = $title;
        $message = "Cairo Daily Report";
        $mailer = new mailer($tott, "Cairo Daily Report", $message, "From: faiz_reports@faizehaakimi.com");
        $mailer->dir("rep_s");
        $test = $mailer->send();
    }
}



function send_mail_rep_shaam($title) {

    include("mailer.class.php");

    global $db;

    $mails = $db->get_data('rep_mail', '', " `delete` ='0' and city='shaam'");
    
   
    //print_r($mails);
    foreach ($mails as $ma) {
        $filename = $title . '.html';
       echo  $tott = $ma['mail'];
//$tott="empcland@gmail.com";
//$tott="azizms@gmail.com";	

        $subject = $title;
        $message = "Shaam Daily Report";
        
      
        $mailer = new mailer($tott, "Shaam Daily Report", $message, "From: faiz_reports@faizehaakimi.com");
        $mailer->dir("rep_s_shaam");
        $test = $mailer->send();
    }
}




function task_time() {
    $myh = date("h");
    backup_tables('*', 'Sql', $codestat);
    echo "DB_Backup Working....";
    if ($myh != 12) {
        $_SESSION['did'] = 0;
    }




    //  backup_tables('*' ,'Sql',$codestat);
}

function backup_tables($tables = '*', $file_es, $codestat) {



    //get all of the tables
    if ($tables == '*') {
        $tables = array();
        $result = mysql_query('SHOW TABLES');
        while ($row = mysql_fetch_row($result)) {
            $tables[] = $row[0];
        }
    } else {
        $tables = is_array($tables) ? $tables : explode(',', $tables);
    }

    //cycle through
    foreach ($tables as $table) {
        $result = mysql_query('SELECT * FROM ' . $table);
        $num_fields = mysql_num_fields($result);

        $return.= 'DROP TABLE ' . $table . ';';
        $row2 = mysql_fetch_row(mysql_query('SHOW CREATE TABLE ' . $table));
        $return.= "\n\n" . $row2[1] . ";\n\n";

        for ($i = 0; $i < $num_fields; $i++) {
            while ($row = mysql_fetch_row($result)) {
                $return.= 'INSERT INTO ' . $table . ' VALUES(';
                for ($j = 0; $j < $num_fields; $j++) {
                    $row[$j] = addslashes($row[$j]);
                    $row[$j] = ereg_replace("\n", "\\n", $row[$j]);
                    if (isset($row[$j])) {
                        $return.= '"' . $row[$j] . '"';
                    } else {
                        $return.= '""';
                    }
                    if ($j < ($num_fields - 1)) {
                        $return.= ',';
                    }
                }
                $return.= ");\n";
            }
        }
        $return.="\n\n\n";
    }

    //save file

    $ddd = 'db-backup-' . date('l jS \of F Y h:i:s A') . '.sql';
    $handle = fopen("db_backup/" . $ddd, 'w+');
    fwrite($handle, $return);
    fclose($handle);

    if ($codestat == 'show') {

        echo '<textarea class=sho > ' . $return . '</textarea>';
    } else {


        echo "<br /><br/> <a  href=\"db_backup/" . $ddd . "\" >db_backup/" . $ddd . "</a>";
    }
}

function search_rs($thislink = 'admin/reception/list', $table = 'reservation', $action = "1") {

    if ($action == "1") {
        ?>
        <form method="get" action="admin.php?pid=<?= $_GET['pid'] ?>">


            <input type="hidden" value="<?= $thislink ?>" name="action"/>

    <?php } else {
        ?>
            <form method="get" action="">

    <?php } ?>


            <script type="text/javascript"> 


                $(function(){
                    $('#chk_from').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {	}});
                    $('#chk_to').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {}});
                    $('#chk_out_from').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {	}});
                    $('#chk_out_to').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {}});



                    $("#my_ad").toggle(
                    function(){
        
                        $("#my_ad img").attr('src','/faiz/images/bt_ad_m.png');
        
                        $("#search_ad").show('slow');
        
        
        
                    }
                    ,function(){
                        $("#my_ad img").attr('src','/faiz/images/bt_ad.png');
        
                        $("#search_ad").hide('slow');
        
                    }

                )
        
                })

            </script>



            <div class="form_row">
                <div class="form_row_left">
                    Search Value &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Search In<br />
                    <input  name="g_id" />
                    <select name="se_f" > 
                        <option value="id_group">Group ID</option>
                        <option value="ejamaat">ejamaat ID</option>
                        <option value="name">Name</option>
                        <option value="name">Name</option>
                        <option value="wiz_id">wizard id </option>
                        <option value="mor">More </option>
                    </select>




                    Package Type
                    <select name="g_id8" >
                        <option >ALL</option>

                        <option  <?php if ($_GET['pid'] != "1") {
        echo "selected";
    } ?> value="0">Faiz</option>

                        <option <?php if ($_GET['pid'] == "1") {
        echo "selected";
    } ?> value="1">LB</option>
                    </select>
                    <input name="pid" type="hidden" value="<?= $_GET['pid'] ?>" />
                    <br />

                    <input type="checkbox" value="exact" name="g_id5" /> exact
                </div>

                <br />
                <div id="my_ad"><img  src="/faiz/images/bt_ad.png"/></div>
                <input class="search_bt" type="submit" value="search" /> 


            </div>
            <div id="search_ad" class="form_row">

                <div class="form_row_left">
                    gender &nbsp;&nbsp;&nbsp; A/C/I<br />
                    <select name="gender"> 
                        <option value="All">All</option>
                        <option value="Male" >Male</option>
                        <option value="Female">Female</option>
                    </select>
                    <select name="aci" > 
                        <option value="All">All</option>
                        <option  value="A" >Adult</option>
                        <option value="C"  >Child</option>
                        <option value="I">Infant</option>
                    </select><br />
                    <input type="checkbox" value="l_paid" name="g_id4" /> Lawazim paid 
                </div>

                <div class="form_row_right">
                    Check In From  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   Check In To<br />


                    <input type="text" name="chk_from" id="chk_from" size="12" title="Check In From" />&nbsp;&nbsp; 
                    <input size="12" type="text" name="chk_to" id="chk_to"  title="Check In To" /><br />


                    Check Out From  &nbsp;&nbsp; &nbsp;&nbsp;  Check Out To<br />
                    <input type="text" name="chk_out_from" id="chk_out_from" size="12" title="Check Out From" />&nbsp;&nbsp; 
                    <input size="12" type="text" name="chk_out_to" id="chk_out_to" title="Check Out To" /><br />

                </div>



            </div>




        </form>
    <?php
    if ($_GET['g_id']) {
        $sef = "id_group";
        $sef = $_GET['se_f'];

        $seval = explode(";", $_GET['g_id']);



        foreach ($seval as $es) {
            if ($es != "" && $seval != "") {
                if (isset($_GET['g_id5']) && $_GET['g_id5'] == 'exact') {
                    $mysearch.= "OR $sef = '" . $es . "' ";
                } else {
                    $mysearch.= "OR $sef like '%" . $es . "%' ";
                }
            }
        }
        $en = substr_replace($mysearch, '', 0, 2);


        $sql_where = "";


        if (isset($_GET['res_num'])) {
            $sql_where .=" and `lawazim_paid`=1 ";
        }
        if (isset($_GET['gender']) && $_GET['gender'] != "All") {
            $sql_where .=" and `gender`='" . $_GET['gender'] . "'";
        }
        if (isset($_GET['aci']) && $_GET['aci'] != "All") {
            $sql_where .=" and `adult_child_infant`='" . $_GET['aci'] . "'";
        }
        if (isset($_GET['chk_from']) && $_GET['chk_from'] != "Check In From") {
            $sql_where .=" and `check_in` BETWEEN '" . data_to_db($_GET['chk_from']) . "' AND '" . data_to_db($_GET['chk_to']) . "' ";
        }
        if (isset($_GET['chk_out_from']) && $_GET['chk_out_from'] != "Check Out From") {
            $sql_where .=" and `check_out` BETWEEN '" . data_to_db($_GET['chk_out_from']) . "' AND '" . data_to_db($_GET['chk_out_to']) . "' ";
        }
        if (isset($_GET['g_id4']) && $_GET['g_id4'] == "l_paid") {
            $sql_where .=" and  `lawazim_paid`='1'";
        }



        if (isset($_GET['g_id8']) && $_GET['g_id8'] != "ALL") {
            if ($_GET['g_id8'] == "1") {

                $sql_where .=" and  ( `pid`=" . $_GET['g_id8'] . " or `pid`=2 )";
            } else {

                $sql_where .=" and  `pid`=" . $_GET['g_id8'];
            }
        }


        // echo $_GET['chk_from']."<br />".$_GET['chk_out_from'];
        $mysql = "SELECT * FROM $table WHERE $en  and `delete` ='0' $sql_where  " . getjcity('and', $table) . "order by $sef ";
    } else {
        $mysql = "SELECT * FROM $table WHERE id_group=-1 " . getjcity('and', $table);
    }








//echo $mysql;
    return $mysql;
}

function search_rs_g($thislink = 'admin/reception/list', $table = 'reservation', $action = "1") {
    ?>
        <form method="post" action="">




            <script type="text/javascript"> 


                $(function(){
                    $('#chk_from').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {	}});
                    $('#chk_to').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {}});
        
                })

            </script>



            <div class="form_row">
                <div class="form_row_left">
                </div>
                From  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;    To<br />
                <input type="text" name="chk_from" id="chk_from" size="12" title="Check In From" />&nbsp;&nbsp; 
                <input size="12" type="text" name="chk_to" id="chk_to"  title="Check In To" /><br />
                <input type="submit" value="show" />
        </form></div><div class="tall_rep">
    <?php
    $retdata = "";

    global $db;
    if (isset($_POST['chk_from'])) {

        $ddd = betweenTowDays($_POST['chk_from'], $_POST['chk_to']);

        foreach ($ddd as $d) {
            echo "<div style=\"with:100%; clear:both\" class=\"reorow\">" . date("D d/m", strtotime($d));


            echo "<table width=100%><thead><th>res id</th> <th>Group Code</th><th>Group Name</th><th>A/C/I</th><td>Rooms</td><th>A/D/Checked</th><th>Time</th><th>Air/Bus</th><th>Fight Num</th><th>Air Line</th></thead>";

            $mm = $db->get_data('reservation_groups', '', "ar_date='" . $d . "'");

            foreach ($mm as $m) {
                $cc = $db->get_row('clients', '', "code='" . $m['gorup_code'] . "'");
                if ($m['anyways'] == "1") {
                    $style = "color:red;";
                } else {

                    $style = "";
                }

                echo "<tr style=\"$style\"><td  style=\"$style\">" . $m['autoid'] . "</id><td  style=\"$style\">" . $m['gorup_code'] . "</td><td  style=\"$style\">" . $cc['name'] . "</td><td  style=\"$style\"> 
 " . $m['no_adults'] . "/ " . $m['no_children'] . "/ " . $m['no_infant'] . "</td> <td style=\"$style\"> " . $m['room_Single'] . "/" . $m['room_Double'] . "/" . $m['room_Triple'] . "/" . $m['room_Quad'] . "</td><th>A</td><td> " . $m['ar_time'] . "</td><td  style=\"$style\">" . $m['ar_type'] . "</td><td  style=\"$style\"> " . $m['ar_f_number'] . "</td><th  style=\"$style\" > " . $m['ar_airline'] . "</td></tr>";
            }

            $mm = $db->get_data('reservation_groups', '', "de_date='" . $d . "'");

            foreach ($mm as $m) {

                if ($m['anyways'] == "1") {
                    $style = "color:red;";
                } else {

                    $style = "";
                }
                $cc = $db->get_row('clients', '', "code='" . $m['gorup_code'] . "'");
                echo "<tr  style=\"$style\"><td  style=\"$style\">" . $m['autoid'] . "</id><td style=\"$style\" >" . $m['gorup_code'] . "</td><td style=\"$style\" >" . $cc['name'] . " </td>
 <td style=\"$style\"> " . $m['no_adults'] . "/ " . $m['no_children'] . "/ " . $m['no_infant'] . "</td>
 <td style=\"$style\"> " . $m['room_Single'] . "/" . $m['room_Double'] . "/" . $m['room_Triple'] . "/" . $m['room_Quad'] . "</td><th style=\"$style\">D</td><td style=\"$style\"> " . $m['de_time'] . "</td><td style=\"$style\">" . $m['de_type'] . "</td><td style=\"$style\"> " . $m['de_f_number'] . "</td><th style=\"$style\"> " . $m['de_airline'] . "</td></tr>";
            }


            $mm = $db->get_data('reservation_groups', '', "de_date>'" . $d . "' and ar_date<'" . $d . "'");

            foreach ($mm as $m) {

                if ($m['anyways'] == "1") {
                    $style = "color:red;";
                } else {

                    $style = "";
                }

                $cc = $db->get_row('clients', '', "code='" . $m['gorup_code'] . "'");
                echo "<tr  style=\"$style\"><td  style=\"$style\">" . $m['autoid'] . "</id><td  style=\"$style\">" . $m['gorup_code'] . "</td><td  style=\"$style\">" . $cc['name'] . "</td><td  style=\"$style\"> " . $m['no_adults'] . "/ " . $m['no_children'] . "/ " . $m['no_infant'] . "</td>
 <td style=\"$style\"> " . $m['room_Single'] . "/" . $m['room_Double'] . "/" . $m['room_Triple'] . "/" . $m['room_Quad'] . "</td>
 <th  style=\"$style\">Checked</td><td  style=\"$style\"> -</td><td >-</td><td> -</td><th>-</td></tr>";
            }


            echo "</table></div>";
        }
        echo "</div>";
    }
}

function search_rs_groups2($thislink = 'admin/reception/list', $table = 'reservation_groups', $action = "1") {

    if ($action == "1") {
        ?>
            <form method="get" action="admin.php">


                <input type="hidden" value="<?= $thislink ?>" name="action"/>

        <?php } else {
            ?>
                <form method="get" action="">

        <?php } ?>


                <script type="text/javascript"> 


                    $(function(){
                        $('#chk_from').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {	}});
                        $('#chk_to').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {}});
                        $('#chk_out_from').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {	}});
                        $('#chk_out_to').datepicker({dateFormat:'dd/mm/yy',onSelect: function(selectedDate) {}});



                        $("#my_ad").toggle(
                        function(){
        
                            $("#my_ad img").attr('src','/faiz/images/bt_ad_m.png');
        
                            $("#search_ad").show('slow');
        
        
        
                        }
                        ,function(){
                            $("#my_ad img").attr('src','/faiz/images/bt_ad.png');
        
                            $("#search_ad").hide('slow');
        
                        }

                    )
        
                    })

                </script>



                <div class="form_row">
                    <div class="form_row_left">
                        Search Value &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Search In<br />
                        <input  name="g_id" />
                        <select name="se_f" > 
                            <option value="gorup_code">Group code</option>
                            <option value="ar_date">ar date</option>
                            <option value="de_date">de Date</option>
                            <option value="ar_type">ar Type</option>
                            <option value="de_type">de Type</option>
                            <option value="mor">More</option>
                            <option value="anywar_nots">anywar  nots</option>
                        </select>



                        <br />

                        <input type="checkbox" value="exact" name="g_id5" /> exact
                    </div>

                    <br />
                    <div id="my_ad"><img  src="/faiz/images/bt_ad.png"/></div>
                    <input class="search_bt" type="submit" value="search" /> 


                </div>
                <div id="search_ad" class="form_row">
                    <!--
                    <div class="form_row_left">
                    gender &nbsp;&nbsp;&nbsp; A/C/I<br />
                    <select name="gender"> 
                    <option value="All">All</option>
                    <option value="Male" >Male</option>
                    <option value="Female">Female</option>
                    </select>
                    <select name="aci" > 
                    <option value="All">All</option>
                    <option  value="A" >Adult</option>
                    <option value="C"  >Child</option>
                    <option value="I">Infant</option>
                    </select><br />
                    <input type="checkbox" value="l_paid" name="g_id4" /> Lawazim paid 
                    </div>
                    
                    <div class="form_row_right">
                    Check In From  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   Check In To<br />
                    
                    
                    <input type="text" name="chk_from" id="chk_from" size="12" title="Check In From" />&nbsp;&nbsp; 
                    <input size="12" type="text" name="chk_to" id="chk_to"  title="Check In To" /><br />
                    
                    
                    Check Out From  &nbsp;&nbsp; &nbsp;&nbsp;  Check Out To<br />
                    <input type="text" name="chk_out_from" id="chk_out_from" size="12" title="Check Out From" />&nbsp;&nbsp; 
                    <input size="12" type="text" name="chk_out_to" id="chk_out_to" title="Check Out To" /><br />
                    
                    </div>
                    
                    -->

                </div>




            </form>
        <?php
        if ($_GET['g_id']) {
            $sef = "id_group";
            $sef = $_GET['se_f'];

            $seval = explode(";", $_GET['g_id']);



            foreach ($seval as $es) {

                if (isset($_GET['g_id5']) && $_GET['g_id5'] == 'exact') {
                    $mysearch.= "OR $sef = '" . $es . "' ";
                } else {
                    $mysearch.= "OR $sef like '%" . $es . "%' ";
                }
            }
            $en = substr_replace($mysearch, '', 0, 2);


            $sql_where = "";


//if (isset($_GET['res_num'])){ $sql_where .=" and `lawazim_paid`=1 ";}
//if (isset($_GET['gender'])  && $_GET['gender']!= "All" ){ $sql_where .=" and `gender`='".$_GET['gender']."'" ;}   
//if (isset($_GET['aci'])  && $_GET['aci']!= "All" ){ $sql_where .=" and `adult_child_infant`='".$_GET['aci']."'" ;}  
            if (isset($_GET['chk_from']) && $_GET['chk_from'] != "Check In From") {
                $sql_where .=" and `check_in` BETWEEN '" . data_to_db($_GET['chk_from']) . "' AND '" . data_to_db($_GET['chk_to']) . "' ";
            }
//if (isset($_GET['chk_out_from']) && $_GET['chk_out_from']!="Check Out From" ){ $sql_where .=" and `check_out` BETWEEN '".data_to_db($_GET['chk_out_from'])."' AND '".data_to_db($_GET['chk_out_to'])."' " ;}        
//if(isset($_GET['g_id4']) && $_GET['g_id4']=="l_paid" ){ $sql_where .=" and  `lawazim_paid`='1'" ;}      
            // echo $_GET['chk_from']."<br />".$_GET['chk_out_from'];
            $mysql = "SELECT * FROM $table WHERE $en  and `delete` ='0' $sql_where  " . getjcity('and', $table) . "order by $sef ";
        } else {
            $mysql = "SELECT * FROM $table WHERE gorup_code=-1 " . getjcity('and', $table);
        }








//echo $mysql;
        return $mysql;
    }

//db func

    function get_cat_value($tabel, $id_val, $fld_title = 'title', $fld_id = 'id') {

        global $db;
        $myret = $db->get_row($tabel, '', $fld_id . "=" . $id_val);
        //print_r($myret);
        return $myret[$fld_title];
    }
    
    
    
    
    function getvarsmailtamplet($table) {
    global $db;




    $data = $db->get_row($table);

    echo '<table STYLE="WIDTH:80% ; MARGIN:AUTO"><tr><th>Meaning</th><th>Variable</th></tr>';



    foreach ($data as $k => $val) {
        echo "<tr><td>" . $k . "</td>" . "<td>[" . $k . "]</td></tr>";
    }

    echo "</tabel>";
}

function updatemail($table, $mdata, $values) {
   global $db;
    $data = $db->get_row($table);
    
    foreach ($data as $k => $val) {

        $mdata = str_replace("[" . $k . "]", $values[$k], $mdata);
        
    }
 
 

   
   
    return $mdata;
}       
    
  






function sendmail($mails, $subject, $message, $From = "\"Faizehaakimi\" <info@faizehaakimi.com>\n") {


    $returndata = "";

    $mails = $mails . split(";");

    if (is_array($mails)) {



        foreach ($mails as $m) {


            $headers .= "From: " . $From;
            $headers .= "Content-type: text/html\r\n";
            mail($m, $subject, $message, $headers);

            $returndata.=$m . ":...snet |";
        }
    } else {
        $headers .= "From: \"Faizehaakimi\" <info@faizehaakimi.com>\n";
        $headers .= "Content-type: text/html\r\n";
        mail($mails, $subject, $message, $headers);
        $returndata.=$mails . ":...snet |";
    }


    return $returndata;
}
    ?>



