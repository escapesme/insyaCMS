<?php
include_once 'mysql.php';
include_once 'admin.class.php';
include_once 'tables_specs.php';
include_once 'functions.php';

include_once('actions/admin/rep_mail/arr_fun.php');
include_once('actions/admin/rep_mail/gbook_fun.php');
include_once('actions/admin/rep_mail/faq_fun_bdf.php');




$admin=new admin();
$currentDate = date("Y-m-d");
$dateOneWeekAdded = strtotime(date("Y-m-d", strtotime($currentDate)) . " +1 week");
$nweek=date('Y-m-d', $dateOneWeekAdded);


creat_pdf("dfdzfsdfsd" ,"fffffl");


/*
task_time();  
send_mail_rep(faq_fun() ,"FAQ  without  answer ");
send_mail_rep(arr_fun() ,"check in BETWEEN  $currentDate : $nweek");
send_mail_rep(gbook_fun() ,'gbook not approved');


*/




?>
