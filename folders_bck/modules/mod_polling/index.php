<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_polling($pro, $lang) {
    global $lib;



    $as = $lib->db->get_data("com_poll_answers", "*", "`q_id`='" . $pro['q_id'] . "'");


    $q = $lib->db->get_row("com_poll_questions", "*", "`id`='" . $pro['q_id'] . "'");


    $returnData .= "<div class='PollingContener'><div>" . $q['questions'] . "</div>";

    foreach ($as as $a) {
        $returnData .= "<div><input type='radio' value='" . $a['id'] . "' name='ans' class='ans'>" . $a['answers'] . "</div>";
    }



    $url = $lib->util->mylink("module", "mod_polling") . "/p_data";
    $urlr = $lib->util->mylink("module", "mod_polling") . "/p_result";
    $returnData .= "<input class='button poll_vote' type='button' value='" . $lang['vote'] . "' /> 
        <input  type='button' class='button poll_result'    value='" . $lang['result'] . "' /> 
            <script>
         $(function(){
         
 
poolingActions('" . $_SESSION['polling' . $pro['q_id']] . "','" . $pro['q_id'] . "','" . $url . "','" . $urlr . "','" . $lang['votemsg'] . "','" . $lang['votemsgr'] . "'
    ,'" . $lang['votemsgTitle'] . "','" . $lang['votemsgButton'] . "','" . $lang['back'] . "','" . $lang['result'] . "','" . $pro['myid'] . "');

}) 
</script></div>
";



    return $returnData;
}
?>

<script>

    function poolingActions(ss, q_id, url, urlr, msg, votemsgr, msgTitle, msgbuttonTitle, back, res, mod_id) {


        if (ss == "done") {


            getre();

        }






        $(".poll_vote").click(function() {

            if ($(".ans:checked").val() != null && $(".ans:checked").val() != undefined) {




                var ansid = $(".ans:checked").val();

                var mydom = "ans=" + ansid + "&q_id=" + q_id;

         
                    sendPAjax(url, mydom, function(data) {

                        if ($.trim(data) == "done") {

                            F_sendMassge("", msgTitle, votemsgr, msgbuttonTitle);
                        } else {



                            F_sendMassge("", msgTitle, msg, msgbuttonTitle);

                            getre();
                        }



                    });
                }
                else {
                    F_sendMassge("", msgTitle, votemsgr, msgbuttonTitle);



                
            }

        })


        function getre() {
            sendPAjax(urlr, "q_id=" + q_id + "&back=" + back + "&res=" + res + "&mod_id=" + mod_id, function(data) {


                $(".PollingContener").html(data);
            });




        }

        $(".poll_result").click(function() {

            getre();

        })


    }



</script>

