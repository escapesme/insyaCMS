<?php
session_start();
$myurl = "../";
?>
<script type = "text/javascript" src = "<?= $myurl ?>includes/js/jquery.js"></script>
<script type="text/javascript" src="<?= $myurl ?>includes/js/jscripts/tiny_mce/jquery.tinymce.min.js"></script>
<link type = "text/css" href =" //code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel = "stylesheet" />
<script type="text/javascript" src="/includes/js/jquery.lazyload.js"></script>
<link rel="stylesheet" media="screen" type="text/css" href="<?= $myurl ?>includes/js/colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css" media="screen" href="<?= $myurl ?>includes/js/upload/fileuploader.css"/>
<script type="text/javascript" src="<?= $myurl ?>includes/js/jqueryUi/jqueryui.js"></script>
<link href="<?= $myurl ?>includes/js/toolbar/jquery.toolbars.css" rel="stylesheet" type="text/css"/>
<link href="<?= $myurl ?>includes/js/toolbar/prettify.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<?= $myurl ?>includes/js/toolbar/prettify.js"></script>
<script type="text/javascript" src="<?= $myurl ?>includes/js/toolbar/jquery.toolbar.js"></script>

<script type="text/javascript" src="<?= $myurl ?>includes/js/colorpicker/js/colorpicker.js"></script>

<!--
<link type = "text/css" href = "<?= $myurl ?>includes/js/jqueryv/style.css" rel = "stylesheet" />

<script type="text/javascript" src="<?= $myurl ?>includes/js/jqueryv/languages/jquery.validationEngine-en.js"></script>
<script type="text/javascript" src="<?= $myurl ?>includes/js/jqueryv/jquery.validationEngine.js"></script>

-->

<link rel="stylesheet" href="/includes/js/lightbox/s3/colorbox.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<script src="/includes/js/lightbox/jquery.colorbox.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="<?= $myurl ?>includes/js/upload/fileuploader.js"></script>
<script type="text/javascript" src="<?= $myurl ?>lib/js/util.js"></script>
<script type="text/javascript" src="<?= $myurl ?>lib/js/forms_fornt.js"></script>
<script type="text/javascript" src="<?= $myurl ?>lib/js/dataBuilder.js"></script>
<script src="<?= $myurl ?>lib/js/admin.js"   ></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="<?= $myurl ?>includes/js/gmap3.min.js"></script>

<script type="text/javascript">




    $(function () {

        /*   $(document).on("click", ".addbt", function() {
         
         updatemain("&mode=add");
         return  false;
         });
         
         
         $(document).on("click", ".to_back", function() {
         
         updatemain();
         return  false;
         });
         
         
         */




    })

    function createbar() {





        bar("toolbar.cellvalue .tdata", "user-toolbar-options",
                function (event, ui) {

                    var id = $(this).parents(".divRow").data("id");

                    var table = $(this).parents(".divRow").data("table");
                    var field = $(this).parents(".cellvalue").data("field");


                    var action = $(ui).data("action");

                    $.colorbox({iframe: true, width: "50%", height: "50%", href: "/admin/getmian.php?view=" + table + "&lang=en&mode=edit&id=" + id + "&for=" + field, onClosed: function () {


                            updatemain();


                        }});




                    if (action === "toolbaredit") {




                    } else if (action === "toolbardelete") {


                    }




                })

    }
    function bar(item, bar, dodata) {


        $('.' + item).toolbar({
            content: "." + bar,
            position: 'top'
        });



        $('.' + item).on('toolbarItemClick', dodata);

    }
    $(document).ajaxComplete(function (event, xhr, settings) {
        $(".tool-container").css("opacity", "0");
        createbar();

    })
    jQuery(document).ready(function ($) {
        createbar();
    });
</script>
<div class="user-toolbar-options">
    <a data-action='toolbaredit' href="#"><li class="toolbaredit fa  fa-times-circle fa-fw"></li></a>
    <a data-action='toolbardelete' href="#"><li class="toolbardelete fa fa-pencil"></li></a>

</div>
<?php
ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);

echo "asdasd";
require_once($myurl . "lib/libs.php");

$lib->db->connect();
ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);

function this_Menu($data) {
    return $lib->adminEng->getMenu($data);
}

function creat_module($postion) {
    global $lib;
    $data = $lib->adminEng->getmodule($postion);


    // $data='hhh';

    return $data;
}

function creat_main() {
    global $lib;
    return $lib->adminEng->getMain();
}

function getTitle() {

    global $lib;
    return $lib->adminEng->getTitle();
}
?>









