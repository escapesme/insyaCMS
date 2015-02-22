<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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
    $sawimgpath = "/uploads/weather/";
   
    
    
    $result['current_weather_image'] = str_replace("http://blu.stc.s-msn.com/as/wea3/i/en-us/law/", $sawimgpath, $current_weather_image);
    $result['current_weather_image'] = str_replace("55", "45", $result['current_weather_image']);
    
      
    
    
    foreach ($forecast as $key => $val) {
        $result['dayname'][$key] = str_replace($re1, "", getString($val, "", ":"));
        $result['weather_name'][$key] = str_replace($re1, "", getString($val, ":", "."));
        
        
        $result['weather_image'][$key] = str_replace("http://blu.stc.s-msn.com/as/wea3/i/en-us/saw/", $sawimgpath, getString($val, "<img", "/>") . ">");
        $result['weather_image'][$key] = str_replace('"35"', '"30"', $result['weather_image'][$key]);
        $result['weather_image'][$key] = str_replace('"21"', '"30"', $result['weather_image'][$key]);
        $result['lo'][$key] = str_replace($re2, "", getString($val, "Lo: ", "C."));
        $result['hi'][$key] = str_replace($re3, "", getString($val, "Hi: ", "C."));
    }
    //genratedaynames(date("D"));
    return $result;
    //$current_temp = preg_replace("/[^0-9]/", '', getString($string,"/><br />","#"));
}

?>
