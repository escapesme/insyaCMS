<?php
global $lib;

$lib->adminEng->addproreties = "add";
$lib->adminEng->proretiesType = "menu";

$mode = $_GET['mode'];
$setpes = $_GET['steps'];



if ($mode == "add" && $setpes != "step2") {
    echo getcommponent();
} else if ($mode == "add" && $setpes == "step2") {

    $lib->adminEng->proretiesdir = $_GET['com'];

    echo $lib->adminEng->getComponentMain("", "", "add");

    echo "<script>$(function(){ chDataCom('" . $lib->util->getmyurl("admin", "steps") . "steps=step1" . "') })</script>";
} else {


    if ($mode == "edit" && $setpes == "step1") {


        echo getcommponent();
    } else if ($mode == "edit") {



        $d = $lib->db->get_row('menu_itmes', "", "id=" . $_GET[$lib->variables->url_id]);



        //   print_r($d['mei_main']); //mei_main
        $comtitle = $d['mei_main'];

        if (isset($_GET["com"])) {

            $d['mei_main'] = $_GET["com"];
            $lib->adminEng->changEditNames = 'mei_main;mei_main';
            $lib->adminEng->changEditValues = $_GET["com"] . ";" . $_GET["com"];

            $comtitle = $_GET["com"];
        }



        $comtitle = str_replace("com_", "", $comtitle);
        $comtitle = str_replace("mod_", "", $comtitle);
        $comtitle = str_replace("plg_", "", $comtitle);
        $comtitle = str_replace("_", " ", $comtitle);


        echo "<script>$(function(){ chDataComForEdit('" . $comtitle . "','" . $lib->util->getmyurl("admin", "steps") . "steps=step1" . "') })</script>";


        $lib->adminEng->proretiesdir = $d['mei_main'];
    }




    echo $lib->adminEng->getComponentMain();
}

function getcommponent() {
    global $lib;
    $mdata = $lib->db->get_data("com_install", "", " ins_type='component' and `delete`=0");
    $dir = "../" . $lib->foldersMap->fornt_components_folder;

    $foldert = $lib->util->readFilesNames($dir, "dir");
    $file = $lib->util->is_thatimage($fulldir . "/" . $d . ".png");

    $returndata = "<div class='block-border'> <div class='block-content'><ul class='shortcut-list'>";

    $returndata.="<li><a href='" . $lib->util->getmyurl("admin", "steps") . "steps=step2&com=com_link' ><img src='" . $file . "'/>Link</a></li>";


    foreach ($foldert as $d) {
        $fulldir = $dir . "/" . $d;
        $file = $lib->util->is_thatimage($fulldir . "/" . $d . ".png");


        $dtitle = str_replace("com_", "", $d);

        $dtitle = str_replace("_", " ", $dtitle);
        $returndata.="<li><a href='" . $lib->util->getmyurl("admin", "steps") . "steps=step2&com=" . $d . "' ><img src='" . $file . "'/>" . $dtitle . "</a></li>";
    }

    $returndata.="</ul></div></div>";
    return $returndata;
}
?>
<script>
    $("#mei_title").change(function() {
        $("#mei_alias").val($.trim($(this).val()).replaceAll(" ", "-"));


    })




    function chCom(e) {

        window.location.assign(e);
    }


    function chDataCom(url) {



        $(".meiTitle").append("<input onclick=\"chCom('" + url + "')\" style='width:150px; margin-left:10px;' class='button' type='button' value='Change'>");

    }


    function chDataComForEdit(title, url) {


        $(".meiTitle").text(title);



        $(".meiTitle").append("<input onclick=\"chCom('" + url + "')\" style='width:150px; margin-left:10px;' class='button' type='button' value='Change'>");

    }

</script>