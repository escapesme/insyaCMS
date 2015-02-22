<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mod_searchFordomain($pro, $lang) {
    $returnData = "";

    global $lib;



    $returnData .= mod_searchFordomain_From($pro, $lang);
    $returnData .="<script>getval('" . $lib->util->mylink("module", "mod_searchFordomain") . "/checkDomain');</script>";


    return $returnData;
}
?>

<script>
    function  getval(url) {

        $(".mod_searchFordomain_search").click(function() {

            var mydom = "domain=" + $(".mod_searchFordomain_domain").val() + "." + $(".mod_searchFordomain_type").val();



            sendPAjax(url, mydom, function(data) {


                $(".mod_searchFordomain_UpdateData").html(data);
            });


        });
    }

</script>




