<script>
    /* $(document).on("click", ".upload_filesdata", function () {
     $(".mylightboxbg").show("fast");
     $(".mylightboxbg").data("id", $(this).data("id"));
     $(".qq-upload-success").remove();
     updateFileTable();
     });*/
    $(document).on("click", "#cboxClose", function () {
        $(".mylightboxbg").hide("fast");
    });



    $(document).ready(function () {
        var status = "";
        var uid = "";
        var myidex = "";
        var datastatus = "";

        var size = "";

//

        $(document).on("click", ".deleteFile", function () {
            var o = $(this);
            sendPAjax("ajax/coms/fiz/reservations_actions", "save_status=" + o.data("save_status") + "&status=" + o.data("status") + "&id=" + $(this).data("id") + "&name=" + $(this).data("name"), function (adata) {

                sendPAjax("ajax/coms/fiz/reservations_actions", "datastatus=" + o.data("datastatus") + "&type=" + o.data("type") + "&save_status=" + o.data("save_status") + "&status=setdocument_status" + "&id=" + o.data("id") + "&value=1&size=" + size, function (dstatus) {

                    myobj.parent("td").parent("tr").find(".dStatus").html(dstatus);

                    o.parents("li").remove();
                })


            });


        });


        var myobj = null;

        $(document).on("click", ".documents_its", function () {
            $(".uploadid").val($(this).data("id"));
            status = $(this).data("save_status");
            uid = $(this).data("id");
            myidex = $(this).parent("td").parent("tr").index();

            datastatus = $(this).data("status");
            var cuntry = $(this).data("cuntry");


            myobj = $(this);
            size = $(this).parent("td").parent("tr").size();

            sendPAjax("ajax/coms/fiz/reservations_actions", "save_status=" + status + "&status=getpassport_file" + "&id=" + $(".uploadid").val() + "&uid=" + uid, function (adata) {
                var a = adata.split(",");
                var ah = "<ul  class='qq-upload-list'>";
                for (var i = 0; i < a.length; i++) {
                    if ($.trim(a[i]) !== "" && a[i] !== null) {
                        ah += "<li>" + $.trim(a[i]) + " <span data-save_status='" + status + "' data-datastatus='" + datastatus + "'  data-id='" + uid + "'  data-name='" + $.trim(a[i]) + "'    data-status='delpassport_file'   data-type='passport_file'   class=' deleteFile'>X</span></li>";
                    }
                }
                ah += "</ul>";
                $(".passport_files").html(ah);
                ah = "<ul>";
                ;

                sendPAjax("ajax/coms/fiz/reservations_actions", "save_status=" + status + "&status=getvisa_file" + "&id=" + $(".uploadid").val() + "&uid=" + uid, function (bdata) {
                    var b = $.trim(bdata).split(",");


                    var ah = "<ul class='qq-upload-list'>";
                    for (var i = 0; i < b.length; i++) {
                        if ($.trim(b[i]) !== "" && b[i] !== null) {
                            ah += "<li>" + $.trim(b[i]) + " <span data-save_status='" + status + "' data-datastatus='" + datastatus + "'  data-id='" + uid + "'    data-name='" + $.trim(b[i]) + "'   data-status='delvisa_file' data-type='visa_file'   class=' deleteFile'>X</span></li>";
                        }
                    }
                    ah += "</ul>";
                    $(".visa_files").html(ah);
                })
                if (datastatus === "ppOnly") {
                    $(".uploadMsg").html(cuntry + " nationals are required to submit only their passport copies.");
                    $(".Passportcont").hide();
                } else {
                    $(".uploadMsg").html(cuntry + " Nationals are required to submit passport copy and Visa copy.");
                    $(".Passportcont").show();
                }
                $(".mylightboxbg").show("fast");
                $(".mylightboxbg").data("id", $(this).data("id"));
                $(".qq-upload-success").remove();



            });


        });




        advuploader('.vuploader',
                function (event, id, name, response) {
                    sendPAjax("ajax/coms/fiz/reservations_actions", "save_status=" + status + "&name=" + name + "&status=visa_file" + "&id=" + $(".uploadid").val() + "&uid=" + uid, function (data) {



                        sendPAjax("ajax/coms/fiz/reservations_actions", "datastatus=" + datastatus + "&type=visa_file&save_status=" + status + "&status=setdocument_status&id=" + $(".uploadid").val() + "&value=1&size=" + size, function (dstatus) {

                            myobj.parent("td").parent("tr").find(".dStatus").html(dstatus);
                        })




                        //  alert(data);

                    });
                });
        advuploader('.puploader',
                function (event, id, name, response) {
                    sendPAjax("ajax/coms/fiz/reservations_actions", "save_status=" + status + "&name=" + name + "&status=passport_file" + "&id=" + $(".uploadid").val() + "&uid=" + uid, function (data) {
                        sendPAjax("ajax/coms/fiz/reservations_actions", "datastatus=" + datastatus + "&type=passport_file&save_status=" + status + "&status=setdocument_status&id=" + $(".uploadid").val() + "&value=1&size=" + size, function (dstatus) {
                            myobj.parent("td").parent("tr").find(".dStatus").html(dstatus);
                        })
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

function getRdata($id, $edit) {
    /* @var $lib  \libs\libs */
    global $lib;

    if (!$edit) {
        echo "<style>"
        . ".setpesBar{display:none;}"
        . "</style>";
    }

    $myform = 'faiz-new-reservation';
    $myxrefData = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $id . "' ");
    $ressettings = $lib->db->get_row("fiz_reservation_settings");
    $countries_exempted = explode(",", $ressettings['countries_exempted']);
    $countries = explode(",", $_SESSION[$myform]['country']);

    $r .= "<div style ='display:none;' class='mylightboxbg'>"
            . "<div   class=' mylightbox'>"
            . "<div id='cboxClose'></div>"
            . "<div   class='mylightboxdata'>"
            . "<div class='uploadMsg'></div>"
            . "<input type='hidden'class='uploadid' />"
            . "<div class=' toright Passportcont'><h4>Upload Visa Copy</h4>"
            . "<div class='vuploader'>Upload Visa Copy</div> <div class=' visa_files'></div></div>"
            . "<div class='toleft'><h4>Upload  Passport Copy</h4><div class='puploader'>Upload Passport Copy</div><div class='passport_files'></div> </div>"
            . "</div>"
            . "</div>"
            . "</div>";

    $r .= "<table class='mainTabel '><thead><tr><th></th><th></th><th>Airport Clearance Status</th><th>Document Status</th><th>Action</th></tr></thead>";

    $i = 0;




    $passport_file = explode(",", $_SESSION['passport_file']);
    $visa_file = explode(",", $_SESSION['visa_file']);




    if (!isset($_SESSION['faiz-new-reservation']['document_status']) || trim($_SESSION['faiz-new-reservation']['document_status']) !== "") {
        $document_statusdb = "";
        foreach ($myxrefData as $myxref) {
            if (trim($myxref['its_id']) != "") {

                $mm = ",";
                if ($document_statusdb == "") {
                    $mm = "";
                }


                if ($myxref['approved_status'] == "0") {

                    $myxref['approved_status'] = "1";
                }
                $document_statusdb .= $mm . $myxref['approved_status'];
            }
        }
        $_SESSION['faiz-new-reservation']['document_status'] = $document_statusdb;
    }

    $document_status = explode(",", $_SESSION['faiz-new-reservation']['document_status']);


    foreach ($myxrefData as $myxref) {

        if (trim($myxref['its_id']) != "") {
            $uploadStatus = "all";
            if (in_array($countries[$i], $countries_exempted) && $countries[$i] != "") {
                $uploadStatus = "ppOnly";
            }
            if (!isset($approved_status[$i])) {
                $approved_status[$i] = 0;
            }
            $Status = $lib->db->get_row("fiz_approved_status", "*", "id='" . $myxref['approved_status'] . "'")['title'];
            $ejdata = $lib->coms->faiz->getUserDataByMumin_id($myxref['its_id']);


            if (!isset($document_status[$i]) || trim($document_status[$i]) == "" || trim($document_status[$i]) == "0") {

                $document_status[$i] = 1;
            }
            $document_statusTitle = $lib->db->get_row("fiz_document_status", "*", "id='" . $document_status[$i] . "'")['name'];



            $r .= "<tr><td>" . $myxref['its_id'] . "</td>"
                    . "<td>" . $ejdata['name'] . "</td>"
                    . "<td>" . $Status . "</td>"
                    . "<td class='dStatus'>" . $document_statusTitle . "</td>"
                    . "<td>"
                    . "<input data-id = '" . $myxref['id'] . "' data-status='$uploadStatus' datafile=''  data-cuntry='" . $lib->files->readXmlvalue("lib/xml/countries.xml", $countries[$i], "countries") . "' type = 'button' value = 'Upload' class = 'documents_its'/>"
                    . "</td></tr>";

            $i++;
        }
    }

    $r .= "</table><br/>"
            . "";

    if (!$edit) {
        $r .= "<a class='button' href='/site/cairo/Reservations/'>Back</a>";
    }

    return $r;
}

function getRdataSesstion($id) {
    /* @var $lib  \libs\libs */
    global $lib;



    $myform = 'faiz-new-reservation';
    // $myxrefData = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $id . "' ");
//$US nationals are required to submit only their passport copies.
    $ressettings = $lib->db->get_row("fiz_reservation_settings");

    $countries_exempted = explode(",", $ressettings['countries_exempted']);
    $countries = explode(",", $_SESSION[$myform]['country']);


    $passport_file = explode(",", $_SESSION['passport_file']);
    $visa_file = explode(",", $_SESSION['visa_file']);

    $r .= "<div style ='display:none;' class='mylightboxbg'>"
            . "<div   class=' mylightbox'>"
            . "<div id='cboxClose'></div>"
            . "<div   class='mylightboxdata'>"
            . "<div class='uploadMsg'></div>"
            . "<input type='hidden'class='uploadid' />"
            . "<div class=' toright Passportcont'><h4>Upload Visa Copy</h4>"
            . "<div class='vuploader'>Upload Visa Copy</div> <div class=' visa_files'></div></div>"
            . "<div class='toleft'><h4>Upload  Passport Copy</h4><div class='puploader'>Upload Passport Copy</div><div class='passport_files'></div> </div>"
            . "</div>"
            . "</div>"
            . "</div>";

    $r .= "<table class='mainTabel '><thead><tr><th>IT</th><th>Name</th><th>Airport Clearance Status</th><th>Document Status</th><th>Action</th></tr></thead>";




    $i = 0;



    $ejs = explode(",", $_SESSION['faiz-new-reservation']['Mumin_ids']);

    /*  $passport_file = explode(",", $_SESSION['passport_file']);
      $visa_file = explode(",", $_SESSION['visa_file']); */
    $approved_status = explode(",", $_SESSION['approved_status']);

    $xrefids = explode(",", $_SESSION['faiz-new-reservation']['xrefids']);




    foreach ($ejs as $j) {
        if (trim($j) != "") {
      $myxref = $lib->coms->faiz->getUserDataByMumin_id($j);
            
            
            
            if (!isset($xrefids[$i])) {
                $xrefids[$i] = 0;
            } else {

                $myxrefData = $lib->db->get_row("fiz_reservation_users_xref", "*", "id = '" . $xrefids[$i] . "' ");

                if (!isset($_SESSION['faiz-new-reservation']['document_status'][$myxref['id']]) || trim($_SESSION['faiz-new-reservation']['document_status'][$myxref['id']]) == "") {
                    $_SESSION['faiz-new-reservation']['document_status'][$myxref['id']] = $myxrefData['document_status'];
                }
            }


            
            
      
            $uploadStatus = "all";
            if (in_array($countries[$i], $countries_exempted) && $countries[$i] != "") {
                $uploadStatus = "ppOnly";
            }

            $ejdata = $lib->coms->faiz->getUserDataByMumin_id($myxref['its_id']);


            if (!isset($approved_status[$i])) {
                $approved_status[$i] = 0;
            }


            if (!isset($myxrefData['approved_status'])) {
                $myxrefData['approved_status'] = 0;
            }
            $Status = $lib->db->get_row("fiz_approved_status", "*", "id='" . $myxrefData['approved_status'] . "'")['title'];


            if (!isset($_SESSION['faiz-new-reservation']['document_status'][$myxref['id']]) || trim($_SESSION['faiz-new-reservation']['document_status'][$myxref['id']]) == "" || trim($_SESSION['faiz-new-reservation']['document_status'][$myxref['id']]) == "0") {
                $_SESSION['faiz-new-reservation']['document_status'][$myxref['id']] = 1;
            }
            $document_statusTitle = $lib->db->get_row("fiz_document_status", "*", "id='" . $_SESSION['faiz-new-reservation']['document_status'][$myxref['id']] . "'")['name'];

            $r .= "<tr><td>" . $j . "</td>"
                    . "<td>" . $myxref['name'] . "</td>"
                    . "<td>" . $Status . "</td>"
                    . "<td class='dStatus'>" . $document_statusTitle . "</td>" . "<td>"
                    . "<input data-id = '" . $myxref['id'] . "' data-status='$uploadStatus'  data-cuntry='" . $lib->files->readXmlvalue("lib/xml/countries.xml", $countries[$i], "countries") . "' type = 'button' value = 'Upload' data-save_status='session' class = 'documents_its'/>"
                    . "</td></tr>";

            $i++;
        }
    }
    $r .= "</table>";



    return $r;
}

function fiz_documents_its($data) {
    /* @var $lib  \libs\libs */
    global $lib;



    if (isset($_SESSION['reservation_document'])) {

        $r = getRdata($_SESSION['reservation_document']);
    } else

    if (isset($_SESSION['w_status_id'])) {

        $r = getRdataSesstion($_SESSION['w_status_id']);
    } else {
        $_SESSION['approved_status'] = 0;
        $r = getRdataSesstion('0');
    }
    return $r;
}
?>



