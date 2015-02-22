<?php
session_start();
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */
require_once("adminconectore.php");
$lib->users->updateStatus("index");
$lib->users->logout();


$lib->adminEng->getTemplate();
?>
<style>
    .container_12  .listindx  .block-border{
        width:97%;
    }
      .container_12  .listindx .block-content{
        width:99.9%;
    }
    
    form.block-content .block-actions.top{
         border-radius:0 ;
      margin-top: -9px;
      margin-bottom: 10px;
        
    } form.block-content .block-actions input{
        margin-top: 10px;
        
    }
</style>