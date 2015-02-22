<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */



function plg_priceing($data, $lang) {

    /* @var $lib  libs\libs */
    global $lib;





   // return plgig_gatData($data['imagegallery'], $data);
}





function plg_ejamaat($EjamaatId){
$params = array(
    "EjamaatId" =>$EjamaatId,
    "strKey" => "Faizehaakimi231",
);

$client = new SoapClient("http://www.its52.com/eJas/EjamaatServices.asmx?WSDL", array(
    'trace' => true,
    'exceptions' => true));


$response = $client->Faizehaakimi($params);


 $xml    = str_replace(array("diffgr:","msdata:"),'', $response->FaizehaakimiResult->any);
    $xml    = "<package>".$xml."</package>";
    $data   = simplexml_load_string($xml);
    
    
      foreach ($data->diffgram->NewDataSet->children() as $child) {
          
          
          foreach ($child as $key0 => $value) {
              $newdata[$key0] =(string)$value ;
                }
    
            
        }
  

       return $newdata; 
        
}
       
 



?>


