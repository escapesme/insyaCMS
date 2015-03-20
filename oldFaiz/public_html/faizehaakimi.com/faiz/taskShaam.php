<?php

include_once 'mysql.php';
include_once 'admin.class.php';
include_once 'tables_specs.php';
include_once 'functions.php';

//include_once('actions/admin/rep_mail/arr_fun.php');
//include_once('actions/admin/rep_mail/gbook_fun.php');
//include_once('actions/admin/rep_mail/faq_fun.php');
error_reporting(E_ERROR);/*
include_once('actions/admin/rep_mail/faq_fun_bdf.php');
include_once('actions/admin/rep_mail/arr_pdf_fun.php');
include_once('actions/admin/rep_mail/gbook_pdf.php');*/


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







$currentDate = date("Y-m-d");

$dateOneWeekAdded2 = strtotime(date("Y-m-d", strtotime($currentDate)) . " +6 day");
$nweek = date('d/m/Y', $dateOneWeekAdded2);


 $mydata=getreport(date('d/m/Y'), $nweek, "shaam");


 echo $mydata;

do_re($mydata, 'Shaam', "Daily Report","shaam");


send_mail_rep_shaam() ;
///rep_s_shaam//
echo "<h2>Send Mails ...Done</h2> <br/>";



echo "<h2>db_backup clean ....Done</h2><br/>";




?>



