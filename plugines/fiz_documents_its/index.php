<script>



    $(document).ready(function () {


        $(document).on("click", ".documents_its", function () {
            $(".uploadid").val($(this).data("id"));
        });
        advuploader('.vuploader',
                function (event, id, name, response) {
                    sendPAjax("ajax/coms/fiz/reservations_actions", "name=" + name + "&status=visa_file" + "&id=" + $(".uploadid").val(), function (data) {

                        alert(data);

                    });
                });




        advuploader('.puploader',
                function (event, id, name, response) {
                    sendPAjax("ajax/coms/fiz/reservations_actions", "name=" + name + "&status=passport_file" + "&id=" + $(".uploadid").val(), function (data) {
                        alert(data);
                    });
                });
    });

</script>

<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

session_start();

function getRdata($id) {
    /* @var $lib  \libs\libs */
    global $lib;




    $myxrefData = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $id . "' ");




    $r .= "<input class='uploadid' />"
            . "<div class='vuploader'>Upload Visa Copy <div id=\"my-button\" class=\"qq-upload-button\">Select a file</div></div>"
            . "<div class='puploader'>Upload Passport Copy</div>"
            . "<table class='mainTabel '><thead><tr><th></th><th></th><th>Airport Clearance Status</th><th>Document Status</th><th>Action</th></tr></thead>";




    foreach ($myxrefData as $myxref) {


        //  $d = $lib->db->get_data("fiz_reservation", "*", "id = '" . $d['reservation_id'] . "' ");
        $ejdata = $lib->coms->faiz->getUserDataByMumin_id($myxref['its_id']);


        if ($myxref['passport_file'] == "" && $myxref['visa_file'] == "") {

            $dStatus = "Documents not uploade";
        } else {
            $dStatus = "Documents uploade";
        }



        $Status = "Pending";

        $r .= "<tr><td>" . $myxref['its_id'] . "</td>"
                . "<td>" . $ejdata['name'] . "</td>"
                . "<td>" . $Status . "</td>"
                . "<td>" . $dStatus . "</td>"
                . "<td>"
                . "<input data-id = '" . $myxref['id'] . "' type = 'button' value = 'Upload' class = 'documents_its'/>"
                . "</td></tr>";
    }

    $r .= "</table>";



    return $r;
}

function fiz_documents_its($data) {
    /* @var $lib  \libs\libs */
    global $lib;
    print_r($_GET['id']);
    return getRdata('75');
}
?>



