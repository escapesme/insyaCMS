
<link href="/includes/uploader/fine-uploader.css" rel="stylesheet" type="text/css"/>
<script src="/includes/uploader/jquery.fine-uploader.js" type="text/javascript"></script>

<script type="text/template" id="qq-template">
    <div class="qq-uploader-selector qq-uploader">
    <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
    <span>Drop files here to upload</span>
    </div>
    <div class="qq-upload-button-selector qq-upload-button">
    <div>Upload a file</div>
    </div>
    <span class="qq-drop-processing-selector qq-drop-processing">
    <span>Processing dropped files...</span>
    <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
    </span>
    <ul class="qq-upload-list-selector qq-upload-list">
    <li>
    <div class="qq-progress-bar-container-selector">
    <div class="qq-progress-bar-selector qq-progress-bar"></div>
    </div>
    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
    <span class="qq-edit-filename-icon-selector qq-edit-filename-icon"></span>
    <span class="qq-upload-file-selector qq-upload-file"></span>
    <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
    <span class="qq-upload-size-selector qq-upload-size"></span>
    <a class="qq-upload-cancel-selector qq-upload-cancel" href="#">Cancel</a>
    <a class="qq-upload-retry-selector qq-upload-retry" href="#">Retry</a>
    <a class="qq-upload-delete-selector qq-upload-delete" href="#">Delete</a>
    <span class="qq-upload-status-text-selector qq-upload-status-text"></span>
    </li>
    </ul>
    </div>
</script>



<?php
/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */


global $ressettings;

function main($pro, $l) {
    global $lib, $ressettings;


    // $oid = "160";


    if (isset($_SESSION['razaOwnerID']) && $_SESSION['razaOwnerID'] != "") {






        $odata = $lib->coms->faiz->getUserDataByID($_SESSION['razaOwnerID']);



        $data .= "<div><h3>" . $l['lgointitle'] . $odata['FullName'] . " (" . $odata['Mumin_id'] . ") " . "</h3>";
        $data .= "<input  type = 'button' value = 'logout' class = 'logout_its'/>";




        $ressettings = $lib->db->get_row("fiz_reservation_settings");


        switch ($_GET['do']) {

            case "create":
                $data .= fiz_reservations_craeteData($pro, $l, $oid);
                break;
            case "view-raza":
                $data .= fiz_reservations_viewData($pro, $l, $oid);
                break;

            case "pkgs-raza":
                $data .= fiz_reservations_pkgs($pro, $l, $oid);
                break;

            case "send-raza":
            case "end-raza":

                $data .= fiz_reservations_endData($pro, $l, $oid);
                break;

            default :
                $data .= fiz_reservations_returnData($pro, $l, $oid, $odata);
                break;
        }
    } else {


        $data = fiz_reservations_login($pro, $l);
    }



    $data.="</div>";

    return $data;
}
?>


