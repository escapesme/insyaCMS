<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

/*
  function plg_priceing($data, $lang) {
  // return plgig_gatData($data['imagegallery'], $data);
  }
 */

function plg_ejamaat($pdata, $lang) {


    $url = "http://www.its52.com/eJas/EjamaatServices.asmx?WSDL";
    $bool = false;
    $params = array(
        "EjamaatId" => $pdata['ejamaatId'],
        "strKey" => "Faizehaakimi231",
    );

    $client = new SoapClient($url, array(
        'trace' => true,
        'exceptions' => true));


    $response = $client->Faizehaakimi($params);



    $xml = str_replace(array("diffgr:", "msdata:"), '', $response->FaizehaakimiResult->any);


    $xml = "<package>" . $xml . "</package>";
    $data = simplexml_load_string($xml);
    
        

  
    
    
     //print_R($pdata);

    
    
    if (!empty($data)) {
 
        foreach ($data->diffgram->NewDataSet->children() as $child) {
            foreach ($child as $key0 => $value) {

                if ($pdata['getType'] == "data") {

                    $newdata[$key0] = (string) $value;
                } else {



                    $bool = true;
                }
            }
        }
    }






    if ($pdata['getType'] == "data") {

        return $newdata;
    } else {



        return $bool;
    }
}
?>


