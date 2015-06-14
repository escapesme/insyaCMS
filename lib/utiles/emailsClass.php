<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\utiles;

class emailsClass {

    //put your code here

    /* @var $lib  \libs\libs */
    var $lib = "";
    var $gen = "";
    var $morePath = "";

    public function __construct($lib, $gen) {
        $this->lib = $lib;
        $this->gen = $gen;
    }

    /**
     * 
     * @param type $emails
     * @param type $message
     * @param type $subject
     * @param type $formlabel
     * @param type $formmail
     * @return type
     */
    function sendmailBytemplate($emails, $MailID, $varArray = "") {
        $returndata = "";


        /* @var $lib  libs\libs */
        global $lib;

        $maildata = $this->lib->db->get_row("com_mailstemplates", "*", "id=" . $MailID);
        

        
        if ($varArray != "") {

            //$lib->language->updateText($message, $n)
            $maildata['subject'] = $lib->language->updateText($maildata['subject'], $varArray);
            $maildata['sender_name'] = $lib->language->updateText($maildata['sender_name'], $varArray);
            $maildata['body'] = $lib->language->updateText($maildata['body'], $varArray);
        }
        $formmail = $maildata['sender_mail'];
        $formlabel = $maildata['sender_name'];
        $message = $maildata['body'];
        $subject = $maildata['subject'];
        $emails.=";" . $maildata['recipients'];
        $mails = explode(";", $emails);
        foreach ($mails as $m) {
            $returndata.= $this->sendMailType($this->lib->config->options['emailType'], $m, $subject, $message, $formlabel, $formmail);
        }
        
        
        return $returndata;
    }

    /**
     * 
     * @param type $emails
     * @param type $message
     * @param type $subject
     * @param type $formlabel
     * @param type $formmail
     * @return type
     */
    function sendMail($emails, $message, $subject, $formlabel, $formmail, $morPath) {
        $returndata = "";
        $mails = explode(";", $emails);


        foreach ($mails as $m) {
            $returndata.= $this->sendMailType($this->lib->config->options['emailType'], $m, $subject, $message, $formlabel, $formmail);
        }


        
        
        return $returndata;
    }

    function sendMailType($type, $to, $subject, $message, $formlabel, $formmail) {


        $returndata = "";
        switch ($type) {
            case "mandrill":

                require_once $this->morePath . 'lib/includes/mailchimp-mandrill/src/Mandrill.php';



                $mandrill = new \Mandrill($this->lib->config->options['emailkey']);

                try {
                    $message = array(
                        'html' => $message,
                        'text' => '',
                        'subject' => $subject,
                        'from_email' => $formmail,
                        'from_name' => $formlabel,
                        'to' => array(
                            array(
                                'email' => $to,
                                'name' => '',
                                'type' => 'to'
                            )
                        ),
                        'headers' => array('Reply-To' => $formmail),
                        'important' => true,
                        'track_opens' => true,
                        'track_clicks' => true,
                        'auto_text' => null,
                        'auto_html' => null,
                        'inline_css' => null,
                        'url_strip_qs' => null,
                        'preserve_recipients' => null,
                        'view_content_link' => null,
                        'bcc_address' => null,
                        'tracking_domain' => null,
                        'signing_domain' => null,
                        'return_path_domain' => null,
                        'merge' => true,
                        'global_merge_vars' => null,
                        'merge_vars' => null,
                        'tags' => null,
                        'subaccount' => null,
                        'google_analytics_domains' => null,
                        'google_analytics_campaign' => null,
                        'metadata' => null,
                        'recipient_metadata' => null,
                        'attachments' => null,
                        'images' => null
                    );
                    $async = false;
                    $ip_pool = 'Main Pool';
                    $result = $mandrill->messages->send($message, $async, $ip_pool, $send_at);
                    //   print_r($result);
                } catch (Mandrill_Error $e) {
                    echo 'A mandrill error occurred: ' . get_class($e) . ' - ' . $e->getMessage();
                    throw $e;
                }



                break;
            default:
                $headers .= 'From: ' . $formlabel . ' <' . $formmail . '>' . "\r\n";
                $headers .= "Content-type: text/html\r\n";
                mail($to, $subject, $message, $headers);
                $returndata.=$to . ":...sent |";
                break;
        }

        return $type;
    }

}
