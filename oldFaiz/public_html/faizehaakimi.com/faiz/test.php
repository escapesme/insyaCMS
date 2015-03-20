<?php
include_once 'mysql.php';
include_once 'admin.class.php';
include_once 'tables_specs.php';
include_once 'functions.php';
include_once('actions/admin/rep_mail/faq_fun_bdf.php');
include_once('actions/admin/rep_mail/arr_pdf_fun_test.php');
include_once('actions/admin/rep_mail/gbook_pdf.php');
require_once('tcpdf/config/lang/eng.php');
require_once('tcpdf/tcpdf.php');
require_once('tcpdf/get_fun.php');
//error_reporting(E_ALL);


/*
if ($handle = opendir('rep_s')) {
    while (false !== ($file = readdir($handle))) {
        if ($file != "." && $file != "..") {
            unlink("rep_s/".$file);
        }
    }
    closedir($handle);
}



arr_fun_pdf("","plus1");
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






*/
?>