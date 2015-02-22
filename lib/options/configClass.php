<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

namespace libs\options;

class configClass {

    var $setting = "";
    var $message = "";
    var $options = "";
    var $sms = "";

    function __construct() {
        global
        $setting,
        $message,
        $options,
        $sms;
        $this->options = $options;
        $this->message = $message;
        $this->setting = $setting;
        $this->sms = $sms;
    }

}

?>
