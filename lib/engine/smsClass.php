<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\engine;

class smsClass {

//put your code here


    /* @var $lib  \libs\libs */
    var $lib;
    var $MSMtext = "";
    var $MSMTitle = "";
    var $MSMUrl = "";
    var $MSMUserName = "";
    var $MSMNumber = "";
    var $MSMPassword = "";
    var $MSMLang = "";

    function __construct($lib) {
        $this->lib = $lib;
        $this->MSMPassword = $lib->config->sms['password'];
        $this->MSMUserName = $lib->config->sms['userName'];
        $this->MSMLang = $lib->config->sms['lang'];
        $this->MSMUrl = $lib->config->sms['MSMUrl'];
    }

    function sendSMS() {

        try {

            $params = array(
                "UserName" => $this->MSMUserName,
                "Password" => $this->MSMPassword,
                "SMSText" => $this->MSMtext,
                "SMSLang" => $this->MSMLang,
                "SMSSender" => $this->MSMTitle,
                "SMSReceiver" => $this->MSMNumber
            );

          ///  print_r($params);




            $client = new \SoapClient($this->MSMUrl, array(
                'trace' => true,
                'exceptions' => true));


            $response = $client->SendSMS($params);





            $a[$response->SendSMSResult] = $this->getStatus($response->SendSMSResult);
        } catch (SoapFault $e) {
            //echo '<h1>SoapFault: ' . $e->getMessage() . '</h1>';
           // echo '<pre>' . $e->getTraceAsString() . '</pre>';
        }




  //      print_r($a);

        return $a;
    }

    function getStatus($code) {
        $r = "";

        /*
         * 
         * 0 -> The SMS is sent successfully.

           -1 -> Invalid username or password.

           -5 -> out of credit.

           -10 -> Queued Message, no need to send it again.

           -11 -> Invalid language.

           -12-> SMS empty.

           -13 -> fake sender exceed 12 chars or empty.

           -25 -> sending rate greater than receiving rate (only for send/receive

          accounts).

           -100 -> other error.
         */

        switch ($code) {
            case "-1":
                $r = "Invalid username or password.";
                break;
            case "-5":
                $r = "out of credit.";
                break;
            case "-10":
                $r = "Queued Message, no need to send it again.";
                break;
            case "-11":
                $r = "Invalid language.";
                break;
            case "-12":
                $r = "SMS empty.";
                break;
            case "-13":
                $r = "fake sender exceed 12 chars or empty.";
                break;
            case "-25":
                $r = "sending rate greater than receiving rate (only for send/receive accounts).";
                break;
            case "-100":
                $r = "other error.";
                break;
            default:
                $r = "The SMS is sent successfully.";
                break;
        }
        return $r;
    }

}
