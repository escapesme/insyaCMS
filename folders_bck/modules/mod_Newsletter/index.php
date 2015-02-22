<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mod_Newsletter($pro, $lang) {
    $returnData = "";

    global $lib;

    $n = $lib->db->get_data("com_newsLetter");


    $returnData .="<div class='submun'>" . $lang['subnum'] . ":<span>" . count($n) . "</span></div>";


    $returnData .= mod_newsLetter_getForm($pro, $lang);
    $returnData .="<script>mod_newsLetter_getval('" . $lib->util->mylink("module", "mod_Newsletter") . "/sub','" . $lang['subMsg'] . "','" . $lang['subMsgTitle'] . "','" . $lang['msgbuttonTitle'] . "','" . $pro['group'] . "','" . $pro['emailTemplate'] . "');</script>";

    return $returnData;
}
?>


<script>


    function  mod_newsLetter_getval(url, msg,msgTitle,msgbuttonTitle, group, emailTemplate) {
        $(function() {



            $(".mod_newsLetter_search").click(function() {
            
                var mydom = "email=" + $(".mod_newsLetter_email").val() + "&group=" + group + "&emailTemplate=" + emailTemplate;

                sendPAjax(url, mydom, function(data) {

                    F_sendMassge("", msgTitle, msg,msgbuttonTitle)

                });


            });
        })
    }

</script>



