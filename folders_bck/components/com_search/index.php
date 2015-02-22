<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function main($pro, $lang) {


    global $lib;



    $word = $_GET['id'];
    $retusdata = "<div class='mySerach' >";
    $retusdata .= serachFrom($word, $lang);

    if (isset($word)) {

        $retusdata .=dosearch($pro, $lang, $word);
    }

    $retusdata.="</div> <script>searchActions('" . $lang['emmsg'] . "')</script>";

    return $retusdata;
}
?>


<script>



    function searchActions(emmsg) {





        function dosearch(emmsg) {
            var mydata = $.trim($(".mod_search_input input").val());


            if (mydata != "") {

                sendPAjax("ajax/variables/craeteURL", "alias=com_search&cat=" + mydata, function(data) {
                    window.location = $.trim(data);
                })


            } else {


                alert(emmsg);
            }
        }


        $(function() {

            $('.mod_search_input input').keypress(function(e) {
                if (e.which == 13) {
                    dosearch(emmsg);
                }
            });


            $(".mod_search_submit input").click(function() {

                dosearch(emmsg);

            })


        })
    }
</script>

