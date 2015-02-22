<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function mod_search($pro, $lang) {
    global $lib;

    return "<div class='mod_search'><div class='mod_search_input input'>
        <input type='text' name='serach' 
        
        Value='" . $lang['searchInput'] . "'
        onblur=\"if (this.value=='') this.value='" . $lang['searchInput'] . "';\" 
        onclick=\" this.value='';\"
        
/></div><div class='mod_search_submit submit'><input  type='button' value='" . $lang['search'] . "'/></div></div>
    <script>searchActions('" . $lang['emmsg'] . "','" . $lang['searchInput'] . "')</script>
";


    global $lib;
}
?>


<script>



    function searchActions(emmsg,def) {





        function dosearch(emmsg) {
            var mydata = $.trim($(".mod_search_input input").val());


            if (mydata != ""&&def!=mydata) {

                /*    sendPAjax("ajax/variables/craeteURL", "alias=com_search&cat=" + mydata, function(data) {
                 window.location = $.trim(data);
                 
                 
                 })*/
                location = "/search/keyword=" + mydata + "/";

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