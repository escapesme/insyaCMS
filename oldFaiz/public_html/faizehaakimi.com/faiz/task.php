<?php

include_once 'mysql.php';
include_once 'admin.class.php';
include_once 'tables_specs.php';
include_once 'functions.php';

//include_once('actions/admin/rep_mail/arr_fun.php');
//include_once('actions/admin/rep_mail/gbook_fun.php');
//include_once('actions/admin/rep_mail/faq_fun.php');
error_reporting(E_ERROR);
include_once('actions/admin/rep_mail/faq_fun_bdf.php');
include_once('actions/admin/rep_mail/arr_pdf_fun.php');
include_once('actions/admin/rep_mail/gbook_pdf.php');
include_once('actions/admin/rep_resgroups/rep_groups_functions.php');
require_once('tcpdf/config/lang/eng.php');
require_once('tcpdf/tcpdf.php');
require_once('tcpdf/get_fun.php');




if ($handle = opendir('rep_s')) {
    while (false !== ($file = readdir($handle))) {
        if ($file != "." && $file != "..") {
            unlink("rep_s/" . $file);
        }
    }
    closedir($handle);
}


/*
  $admin=new admin();
  $currentDate = date("Y-m-d");
  $dateOneWeekAdded = strtotime(date("Y-m-d", strtotime($currentDate)) . " +1 week");
  $nweek=date('Y-m-d', $dateOneWeekAdded);

  //$myfiles=array("check_in_BETWEEN  $currentDate : $nweek"=>arr_fun('cairo'),'FAQ_without_answer'=>faq_fun(), 'gbooknot_approved'=>gbook_fun()  );
 */
arr_fun_pdf("", "", 7);
//faq_fun_pdf("");
//gbook_fun_pdf("");

send_mail_rep("");


echo "<h2>Send Mails ...Done</h2> <br/>";



  if ($handle = opendir('db_backup/')) {

  while (false !== ($file = readdir($handle))) {
  if ($file != "." && $file != "..") {
  $ff=$file;
  $file=str_replace('db-backup-','',$file);
  $file=str_replace('.sql','',$file);
  // echo "$file <br />";
  $currentDate = date("Y-m-d");

  $ffr =explode(" " ,$file);

  //print_r($ffr);
  $file= $ffr[1]." ".$ffr[2]." ".$ffr[3]." ".$ffr[4];

  $file=str_replace('of','',$file);


  $from2=strtotime(date("Y-m-d", strtotime($currentDate)) . " -25 day");
  $db_date= strtotime($file);


  if ($from2<$db_date){


  unlink("db_backup/".$ff);


  }





  }
  }
  closedir($handle);
  }




echo "<h2>db_backup clean ....Done</h2><br/>";



/*

  $ms=
  "check in BETWEEN  $currentDate : $nweek <br />".
  arr_fun('cairo').
  "FAQ  without  answer <br />".
  faq_fun().
  "gbook not approved <br />".
  gbook_fun();
  //task_time();
  send_mail_rep($ms ,"Cairo Daily Report ");
  /*send_mail_rep(arr_fun() ,"check in BETWEEN  $currentDate : $nweek");
  send_mail_rep(gbook_fun() ,'gbook not approved');

 */
?>


