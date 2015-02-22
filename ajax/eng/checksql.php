<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of checksql
 *
 * @author ismail

 */



//$_GET['data']
/* @var $lib  libs\libs */
global $lib;


 
    $status= $lib->db->query($_GET['data'],0,1);
    
    if ($status==0){
        $the_error .= "\n\nmySQL error: " . mysql_error() . "\n";
        $the_error .= "mySQL error code: " . mysql_errno() . "\n";
        
        echo $the_error;
        
    }else{
        
        echo "SQL correct";
    }

?>



