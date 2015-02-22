<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function main($pro, $lang) {
    echo "fdfsdfsdf";

    global $lib;

    print_r($_GET);

    $word =  str_replace("keyword=", "", $_GET['search']);

//
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



 


 

        function dosearch(emmsg) {
            var mydata = $.trim($(".serachValue").val());


            if (mydata != "") {

                sendPAjax("ajax/variables/craeteURL", "alias=com_search&cat=" + mydata, function(data) {
                    window.location = $.trim(data);
                })


            } else {


             //   alert(emmsg);
            }
        }


     
    
    
    
       $(function() {

            $('.serachValue').keypress(function(e) {
                if (e.which == 13) {
                    dosearch("");
                }
            });


            $(".dosreach").click(function() {

                dosearch("");

            })


        })
</script>

