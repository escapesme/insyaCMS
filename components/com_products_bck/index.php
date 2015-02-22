<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

function main($pro, $lang) {
    /* @var $lib libs\libs */
    global $lib;





    // $setting = $lib->db->get_row("com_products_setting", "", "id='" . $pro['setting'] . "'");

    ;
    $settingsite = $lib->util->cities->getSitId();




    $setting = $lib->db->get_row("com_products_setting", "", "site='" . $settingsite . "'");


    $retusdata = "<div class='produect_main'><input class='settingsite' type='hidden'  value='" . $settingsite . "'/>";






    if (isset($_GET["show"]) && $_GET["show"] == "cat") {



        if (isset($_GET["id"]) && $_GET["id"] == "successful-purchase") {


            if (isset($_SESSION['order_id']) && $_SESSION['order_id'] != "") {
                $retusdata .=successfulPurchase($_SESSION['order_id'], $lang, $setting);
            }
        } else if (isset($_GET["id"]) && $_GET["id"] == "success") {
            $d = $lib->util->page->getREQUEST_URI();
            if ($d['credit_card_processed'] == "Y") {



                $_SESSION['pay_order_number'] = $d['order_number'];
                $retusdata.="<div>" . $lang['redirectMsge'] . "</div>";
                $url = $lib->util->createURL("com_products", "successful-purchase");
                echo ' <script>succFunction(\'' . $url . '\',"&pay_id=' . $d['order_number'] . '")</script>';
            } else {

                $retusdata.="<div>" . $lang['redirectMsgeErorr'] . "</div>";
            }
        } else if (isset($_GET['id']) && $_GET['id'] == "tag") {

            $retusdata .= com_products_getTags($_GET["id"], $lang);
        } else if (isset($_GET["id"]) && $_GET["id"] == "cart") {

            $retusdata .= com_products_showCart($_GET["id"], $lang, $setting);
        } else {
            $id = $lib->util->returnID("com_products_categories", $_GET['id']);
            $retusdata .= com_products_getCat($id, $pro, $lang);
        }
    } else if (isset($_GET["show"]) && $_GET["show"] == "item") {
        if (isset($_GET["catid"]) && $_GET["catid"] == "successful-purchase") {

            if (isset($_SESSION['order_id']) && $_SESSION['order_id'] != "") {
                $retusdata .=successfulPurchase($_SESSION['order_id'], $lang, $setting);
            }
        } else if (isset($_GET["catid"]) && $_GET["catid"] == "success") {



            $d = $lib->util->page->getREQUEST_URI();
            if ($d['credit_card_processed'] == "Y") {
                $_SESSION['pay_order_number'] = $d['order_number'];
                $retusdata.="<div>" . $lang['redirectMsge'] . "</div>";
                $url = $lib->util->createURL("com_products", "successful-purchase");
                echo ' <script>succFunction(\'' . $url . '\',"&pay_id=' . $d['order_number'] . '")</script>';
            } else {

                $retusdata.="<div>" . $lang['redirectMsgeErorr'] . "</div>";
            }
        } else if (isset($_GET["catid"]) && $_GET["catid"] == "cart") {

            $retusdata .= com_products_showCart($_GET["id"], $lang, $setting);
        } else if (isset($_GET['catid']) && $_GET['catid'] == "tag") {

            $retusdata .="<div class='fliter'>" . $lang['tag'] . "</div>";
            $retusdata .="<div class='fliterData'>" . $_GET['id'] . "</div>";

            $retusdata .= com_products_tags($_GET["id"], $pro, $lang);
        } else {


            $id = $lib->util->returnID("com_products", $_GET['id']);
            //  $retusdata .= $lib->plugins->importPlugin("plg_hits", "com_products;" . $id . ";");
            $retusdata .= $lib->plugins->importPlugin("plg_share", "1");



            $retusdata .= com_products_getItem($id, $lang);
        }
    } else {







        if ($pro['viewType'] == "cat" && !isset($_GET["id"])) {


            $id = $pro['cat_id'];
            $retusdata .= com_products_getCat($id, $pro, $lang);
        } else if ($pro['viewType'] == "item" || isset($_GET["id"])) {

            $id = $pro['item_id'];

            if (isset($_GET["id"]) && $_GET["id"] != "") {
                $id = $lib->util->returnID("com_products", $_GET['id']);
            }




            //   $retusdata .= $lib->plugins->importPlugin("plg_hits", "com_products;" . $id . ";");
            $retusdata .= $lib->plugins->importPlugin("plg_share", "1");

            $retusdata .= com_products_getItem($id, $lang);
            //  $retusdata .= $lib->plugins->importPlugin("plg_comments", "com_products;" . $id . "");
        } else {

            $retusdata .= com_products_getsubs("0");
        }
    }
    $retusdata .= "</div>";
    return $retusdata;
}
?>


<style>
    .ordrMsg{

        width:100% ;
        text-align: center;
        font-weight: bold  ;
        margin: 22px 0px;
    }
    .otabel{
        width:95%;
        margin: auto;
        color:#111;
        border: 1px solid #999;
        margin-bottom: 10px;
    }
    .otabel th {
        text-align:  left ;


    }
</style>


<script>

    function dolintitle(title) {
        $("maintitle").title("")
    }





    function updatOrdereData() {

        var odata = "";
        $(".tocart").each(function() {
            odata += $(this).children(".item_id").val() + "__" + $(this).children(".item_name").val() + "__" + $(this).children(".tocart_num").val() + ";";


        })

        $(".orderData").val(odata);

    }


    $(function() {



        $(".submit").click(function() {

            updatOrdereData();







        })
    })

    function doclass() {

        $.prettyPhoto.close();

    }
    function gotocart(carturl) {
        window.location = carturl;

    }


    function tocart(id, tocatMsg, deleteMsg, deletConfrim, carturl) {

        $(function() {


            var pclass = ".tocart" + id;
            $(pclass + " .tocart_Plus").click(function() {

                $(pclass + " .tocart_num").val(parseFloat($(pclass + " .tocart_num").val()) + 1);
            })


            $(pclass + "  .tocart_mien").click(function() {
                var mynum = parseFloat($(pclass + " .tocart_num").val());
                if (mynum > 1) {
                    $(pclass + " .tocart_num").val(mynum - 1);
                }

            })

            /* $(pclass + "  .wupdate.tocart_mien," + pclass + " .wupdate.tocart_Plus").click(function() {
             
             var status = sendAjax("productes/addtocart", "&item=" + $(pclass + " .tocart_num").val() + "___" + $(pclass + " .item_id").val(), pclass + " tocart_updateData");
             status.done(function() {
             
             
             
             //Done Here//
             
             
             //Done Here//
             
             
             
             });
             });
             */




            function updataPage() {

                document.location.reload(true);
            }




            $(pclass + "  .tocart_delete").click(function() {
                // alert ("ddddddddd");

                var answer = confirm(deletConfrim);
                if (answer) {
                    var status = sendAjax("productes/addtocart", "&stat=delete&item=" + $(pclass + " .tocart_num").val() + "___" + $(pclass + " .item_id").val(), pclass + " tocart_updateData");
                    status.done(function() {

                        $(pclass + " .tocart_updateData").text(deleteMsg);


                        updateModule("cart", ".cart", '<?= $_GET['alias'] ?>', '<?= $_GET['site'] ?>');
                        updataPage();
                    });
                }
            })



            $(pclass + "  .tocart_add").click(function() {



                var num = $(pclass + " .tocart_num").val();

                var item = $(pclass + " .item_name").val();

                var msg = num + " " + item + "" + tocatMsg;

                var status = sendAjax("productes/addtocart", "&item=" + $(pclass + " .tocart_num").val() + "___" + $(pclass + " .item_id").val(), pclass + " tocart_updateData");
                status.done(function() {

                    var allmsg = "<div>\n\
            <div class='cartlogo'></div><div class='cartmsg'>" + msg + "</div>\n\
            <input onclick=\"gotocart('" + carturl + "')\" type='button' class='checkout'  value='Checkout'/>\n\
                    <input onclick='doclass()' type='button' class='countinue_shopping'  value='Countinue Shopping'/></div>";

                    $("#inline-cart").html(allmsg);

                    updateModule("cart", ".cart", '<?= $_GET['alias'] ?>', '<?= $_GET['site'] ?>');


                    $.prettyPhoto.open("#inline-cart");


                    $(pclass + " .tocart_updateData").text(tocatMsg);
                    updatOrdereData();

                });
            })
        })
    }






</script>

