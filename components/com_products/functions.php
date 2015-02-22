<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();

function viewCats($data) {
    global $lib;
    $retdata = "<div class='subs'>";
    foreach ($data as $d) {


        $url = $lib->util->createURL("com_products", $d['alias']);

        $retdata .= "<div class='catBlock' >
            <a href='" . $url . "'>
      <div class='catBlock_image'><img src='/uploads/images/" . $d['image'] . "' />
       </div><div class='catBlock_title'>" . $d['name'] . "</div></a></div>";
    }

    $retdata .= "</div >";

    return $retdata;
}

function viewBlockoffers($pro, $da, $lang) {

    /* @var $lib  libs\libs */
    global $lib;



    $currency = $lib->util->cities->getCurrency();
    $imagePath = "/uploads/images/" . $da['th_image'];
    /* if (!is_file($imagePath)) {

      $imagePath = "/uploads/images/noimages.jpg";
      } */







    $dcat = $lib->db->get_row("com_products_categories", "", "id like'%" . $da['cat_id'] . "%'");




    $url = $lib->util->createURL("com_products", $dcat['alias'], $da['alias']);



    $returnData.= "<div id='" . $da['id'] . "' class='itemBlock offers'>";



    if (isset($pro['catPageViewTitle']) && $pro['catPageViewTitle'] == "1") {


        $returnData.="<div class='itemBlock_title'>" . $da['title'] . "</div>";
    }



    if (isset($pro['catPageViewBrand']) && $pro['catPageViewBrand'] == "1") {


        $returnData.="<div class='itemBlock_data  itemBlock_brand'><label>" . $lang['brand'] . "</label>" . $da['brand'] . "</div>";
    }






    if (isset($pro['catPageViewImage']) && $pro['catPageViewImage'] == "1") {

        $returnData.= "
  
       <div class='itemBlock_imgae_cont'>
<img  title=\"" . $da['dec'] . "\"  alt=\"" . $da['title'] . "\"  class=' itemBlock_imgae' src='" . $imagePath . "' />
    <div class='light img'></div></div>";
    }



    if (isset($pro['catPageViewDes']) && $pro['catPageViewDes'] == "1") {

        $returnData.= "<div class = 'itemBlock_des'>" . $da['intro'] . "</div>";
        $returnData.= "<div class = 'itemBlock_des ofintro'>" . $da['des'] . "</div>";
    }




    $price = $lib->util->cities->getproductsPrice($da['id']);

    $vprice = $lib->util->cities->getproductsVPrice($da['id']);
    $def = $vprice - $price;

    $pric = ($def / $vprice ) * 100;

    $returnData.=" <div id=\"inline-cart\" style='display: none;' ></div>
        <div class=\"tocart" . $da['id'] . "\" >
      <input type='hidden' value='" . $da['id'] . "' class='item_id'/>
        <input type='hidden' value='" . $da['title'] . "' class='item_name'/>
        <input type='button' value='Add to cart' class='tocart_add'/>

        <input type='input' value='1' class='tocart_num'/>";
    $url = $lib->util->createURL("com_products", "cart");
    $returnData.="<script>tocart('" . $da['id'] . "','" . $lang['addToCartMsg'] . "','" . $lang['deleteFromCartMsg'] . "','" . $lang['deleteFromCartConfirmMsg'] . "','" . $url . "');</script></div>";







    $returnData.= " <ul class='footerbr'>
     <li><label>Standard Price</label><div class='Per-Pric Pric'>" . $currency . "" . $vprice . "</div></li>
  <li><label>Value Price</label><div class=' Pric'>" . $currency . "" . $price . "</div></li>
        <li class='saveing'><div class=' Pric'>" . round($pric) . "%</div></li>
     
<ul>";

    $returnData.= " </div><style>.pro_cat_title{display: none;}</style>";


    return $returnData;
}

function viewBlock($pro, $da, $lang) {
    global $lib;

    $imagePath = "/uploads/images/" . $da['th_image'];
    /* if (!is_file($imagePath)) {

      $imagePath = "/uploads/images/noimages.jpg";
      } */







    $dcat = $lib->db->get_row("com_products_categories", "", "id like'%" . $da['cat_id'] . "%'");




    $url = $lib->util->createURL("com_products", $dcat['alias'], $da['alias']);



    $returnData.= "<div id='" . $da['id'] . "' class='itemBlock gen'>";



    if (isset($pro['catPageViewTitle']) && $pro['catPageViewTitle'] == "1") {


        $returnData.="<div class='itemBlock_title'>
            <a title='More' href='" . $url . "'>" . $da['title'] . "</a></div>";
    }
    if (isset($pro['catPageViewPric']) && $pro['catPageViewPric'] == "1") {


        $returnData.="<div class='itemBlock_imgae_pric'><label>" . $lang['pric'] . "</label>" . $da['pric'] . "</div>";
    }


    if (isset($pro['catPageViewBrand']) && $pro['catPageViewBrand'] == "1") {


        $returnData.="<div class='itemBlock_data  itemBlock_brand'><label>" . $lang['brand'] . "</label>" . $da['brand'] . "</div>";
    }






    if (isset($pro['catPageViewHist']) && $pro['catPageViewHist'] == "1") {


// $returnData.= $lib->plugins->importPlugin("com_products", "com_content_article;" . $da['id'] . ";getHits");
    }


    if (isset($pro['catPageViewImage']) && $pro['catPageViewImage'] == "1") {

        $returnData.= "
  
       <div class='itemBlock_imgae_cont'>
<img  title=\"" . $da['dec'] . "\"  alt=\"" . $da['title'] . "\"  class=' itemBlock_imgae' src='" . $imagePath . "' />
    <div class='light img'></div></div>";
    }



    if (isset($pro['catPageViewDes']) && $pro['catPageViewDes'] == "1") {

        $returnData.= "<div class = 'itemBlock_des'>" . $lib->util->data->getText($da['des'], "", $pro['viewDesNum']) . "</div>";
    }





    if ($pro['viewintro'] == "1" && ($pro['firstMainStyle'] == "0" || $i < 1)) {
        $returnData.="<div class='itemBlock_des'>
                    
                        " .
                $lib->util->data->getText($da['intro'], "", $pro['viewDesNum'])
                . "
                       
                    
<a href='" . $url . "' class=\"read_more\">Show Me</a>

</div>";
    }




    $returnData.= " </div>";



    return $returnData;
}

function com_products_getCat($id, $pro, $lang) {
    global $lib;
    $d = $lib->db->get_row("com_products_categories", "", "id=" . $id);
    $retdata = "<div class='this_cat'>
        <div class='pro_cat_img'><img src='/uploads/images/" . $d['image'] . "' /></div>
            <div class='pro_cat_title'>" . $d['name'] . "</div></a>
                </div>";



    $retdata .= com_products_getsubs($id);



    $retdata .= com_products_getitms($id, $pro, $lang);




    return $retdata;
}

function com_products_getItem($id, $lang) {
    global $lib;
    $d = $lib->db->get_row("com_products", "", "id=" . $id . "  ");



    $lib->util->updateTitle("Kwikheat " . $d['title'], $d['title']);


    $retdata = "<div class='this_cat'>
        <div class='pro_cat_img'><img src='/uploads/images/" . $d['th_image'] . "' /></div>
            <div class='pro_cat_title'>" . $d['title'] . "</div></a>
                </div>
                

";

    if ($d['image'] != null && trim($d['image']) != "") {
        $retdata .= "<div class='item_image'><img src='/uploads/images/" . $d['image'] . "' /></div>";
    }

    if ($d['image'] != null && trim($d['image']) != "") {
        $retdata .= "<div class='des'>" .
                $lib->util->data->getText($d['des'], "", $d['des']) . "</div>";
    }

    if ($d['imagegallery'] != null && trim($d['imagegallery']) != "") {


        $mpro['style'] = "com_products_Images theme-default";

        $retdata .= $lib->util->getImageGallery($d['imagegallery'], $mpro);
    }




    $lib->util->page->headerData($d['description'], $d['keywords'], $d['header']);

    $lib->util->page->chearTages($d['title'], $d['th_image'], "", $d['description'], "");





    $retdata .= $lib->forms->getTabelStrign("db", "com_products", $d['id'], "itme_data");






    $retdata.=com_products_addTocart($lang, $d['id']);
    return $retdata;
}

function successfulPurchase($id, $lang, $setting) {

    $r = "";

    /* @var $lib libs\libs */
    global $lib;






    $r.="";
    $ordr = $lib->db->get_row("com_products_order", "", "order_id='" . $id . "'  ");




    $_GET['site'] = $ordr['site'];

    $tabelStyle = "width:95%; margin:auto; border: solid #e0e0e0 1.0pt; ;";

    $trstyle = "border-bottom: solid #e0e0e0 1.0pt;height:30px; ";
    $tdStyle = "style='border-bottom: dotted #cccccc 1.0pt; padding: 2.25pt 6.75pt 2.25pt 6.75pt;'";
    $thStyle = "background: #eaeaea; text-align:left";

    $divStyle = "font-size: 9.0pt;overflow:hidden;margin:20px;width: 243.75pt; float:left; border: solid #e0e0e0 1.0pt;height:280px;";

    $divStyleTitle = 'margin: 0px;width: 243.75pt; background: #eaeaea;padding: 3.75pt 6.75pt 4.5pt 6.75pt;';

    $itemStyle = "padding:5px;";
    $PStyle = "border: solid #e0e0e0 1.0pt; margin:auto;width:736px";

    $footerStyle = "background: #eaeaea;width:100%; height:20px;margin-top:10px;";





    $lang = $lib->util->data->TextVarUpdate($ordr, $lang);



    $r.="<div   style='" . $PStyle . " ;text-align:center' class='ordrMsg' >" . $lang['thanksMsg'] . "</div>

           <div style='" . $PStyle . "'> 
               
<div style='" . $divStyle . "'>
            <h3  style='" . $divStyleTitle . "'>Billing Information:</h3>
                    <div style='" . $itemStyle . "'>" . $ordr['card_holder_name'] . "</div>
                    <div  style='" . $itemStyle . "'>" . $ordr['street_address'] . "</div>
                    <div  style='" . $itemStyle . "'>" . $ordr['street_address2'] . "</div>
                    <div  style='" . $itemStyle . "'>" . $ordr['city'] . "</div>
                    <div  style='" . $itemStyle . "'>" . $ordr['state'] . "</div>
                    <div  style='" . $itemStyle . "'>" . $ordr['zip'] . "</div>
                    <div  style='" . $itemStyle . "'><a href='" . $ordr['email'] . "' target='_blank' >" . $ordr['email'] . "</a> </div>
                    <div  style='" . $itemStyle . "'><a href='TEl:" . $ordr['phone'] . "' target='_blank' >" . $ordr['phone'] . "</a> </div>
                
            </div>

           <div style='" . $divStyle . "'>
                <h3 style='" . $divStyleTitle . "'>Payment Method:</h3>
                 <div  style='" . $itemStyle . "'>" . $lang['paymethod'] . "</div> 
          </div>
          <div style='" . $divStyle . "'>
            <h3 style='" . $divStyleTitle . "'>Shipping Information:</h3>
                    <div  style='" . $itemStyle . "'>" . $ordr['ship_name'] . "</div>
                    <div  style='" . $itemStyle . "'>" . $ordr['ship_street_address'] . "</div>
                    <div style='" . $itemStyle . "'>" . $ordr['ship_street_address2'] . "</div>
                    <div style='" . $itemStyle . "'>" . $ordr['ship_city'] . "</div>
                    <div  style='" . $itemStyle . "'>" . $ordr['ship_state'] . "</div>   
                    <div  style='" . $itemStyle . "'>" . $ordr['ship_zip'] . "</div>
                    <div  style='" . $itemStyle . "'><a href='" . $ordr['email'] . "' target='_blank' >" . $ordr['email'] . "</a> </div>
                    <div  style='" . $itemStyle . "'><a href='TEl:" . $ordr['phone'] . "' target='_blank' >" . $ordr['phone'] . "</a> </div>

        </div>
        <div style='" . $divStyle . "'>
            <h3 style='" . $divStyleTitle . "'>Shipping Method:</h3>
                 <div  style='" . $itemStyle . "'>   " . $lang['shippingMsg'] . "</div>

        </div>
        


";






    $r.="
<table style='" . $tabelStyle . "'><tr>
    <th style='" . $thStyle . "'>Product</th>
    <th style='" . $thStyle . "'>Price</th>
    <th style='" . $thStyle . "'>Quantity</th>    
    <th style='" . $thStyle . "'>Sub total</th>
</tr>";

    $pro = $lib->db->get_data("com_products_order_xref", "", "order_id='" . $id . "'  ");






    foreach ($pro as $c) {

// $price = $lib->util->cities->getproductsPrice($c['']);
        $currency = $lib->util->cities->getCurrency();

        $all = $c['price'] * $c['quantity'];

        $r.="<tr style='" . $trstyle . "' ><td $tdStyle>" . $c['name'] . "</td> <td $tdStyle>" . $currency . $c['price'] . "</td><td $tdStyle >" . $c['quantity'] . "</td><td $tdStyle>" . $currency . $all . "</td></tr>";

        $tp+=$all;
    }
    $r.="<tr><td></td> <td></td><td>Grand Total</td><td>" . $currency . $tp . "</td></tr>";



    $r.="</table><div style='" . $footerStyle . "'></div></div>";
    $r.="";




    $datatangible = "";
    $dataType = "";






    sendmailes($r, $setting, "file;status;settingsite;checkbox" . $datatangible . $dataType, $ordr['email'], $ordr);

    $s = "";
    $_SESSION['order_id'] = "";
    $_SESSION['cart_productes'] = "";
    unset($_SESSION['order_id']);
    unset($_SESSION['cart_productes']);




    return $r;
}

function sendmailes($sendData, $setting, $not, $moremaile, $vars) {

    global $lib;




    $lib->util->sendMailData($setting['ordermails'] . ";" . $moremaile, $setting['mailtemplate'], "", $sendData, $vars);
}

function saveCartData($setting) {

    /* @var $lib  libs\libs */
    global $lib;


    /*
      if (isset($_POST['status'])) {

      sendmailes($_POST, $setting);
      } */
}

function com_products_showCart($id, $lang, $setting) {


    /* @var $lib  libs\libs */
    global $lib;

    saveCartData($setting);

    $carts = $_SESSION['cart_productes'];
    $carts = explode(";", $carts);
    $carts = array_filter($carts);

    if ($setting['shipping'] != "0") {
        $chData = $lib->util->cities->getData("plg_shipping_setting");
    }


    $retdata .= $lib->util->updateTitle($lang['ShoppingTitle'], $lang['ShoppingTitle']);



    /*
      $setting="";
      if ($chData['']) */












    if ($setting['PaymentType'] == "2") {
        $retdata .= $lib->plugins->importPlugin("plg_2checkout", "header");
    } else {

        $url = $lib->util->createURL("com_products", "success");

        $retdata .="
            <form name='saveForm'id='order' method='post' action='" . $url . "'>
            <input name='status' value='save' type='hidden'/>
";
    }





    $retdata .= "<table class='chtabel'><tr><th class='pro_title'>Product</th><th class='pro_Quantity' >Quantity</th><th class='pro_Price' >Price</th><th class='pro_delete' >Remove</th></tr>";
    $btVald = $lang['delet'];

    $tPric = 0;

    $twight = 0;
    $proData = 0;



    foreach ($carts as $c) {




        $currency = $lib->util->cities->getCurrency();



        $c = explode("___", $c);
        if ($c[1] != "undefined" && $c[1] != "") {
            $d = $lib->db->get_row("com_products", "", "id=" . $c[1]);
            $price = $lib->util->cities->getproductsPrice($c[1]);


            $pr = $c[0] * $price;
            $supWight = $c[0] * $d['wight'];

            $retdata .= "
                
<script>tocart('" . $d['id'] . "','" . $lang['addToCartMsg'] . "','" . $lang['deleteFromCartMsg'] . "','" . $lang['deleteFromCartConfirmMsg'] . "','" . $url . "');</script>
                <tr class='tocart" . $d['id'] . "'><td class='pro_title' >" . $d['title'] . "</td>
                <td class='pro_Quantity' >
                <input  readonly='readonly' type='input' value='" . $c[0] . "' class='tocart_num'/>
                 

                </td>
                    <td class='pro_Price' >" . $currency . "<span class='proViewPric" . $d['id'] . "'>
                        " . $pr . "
                            </span>
                          <input type='hidden' class='prosumPric prosumPric" . $d['id'] . "' value=" . $pr . " /></td>
                              <td class='pro_delete' >
                        <input type='hidden' value='" . $d['id'] . "' class='item_id'/>
<input type='button' value='" . $btVald . "' class='tocart_delete'/></td></tr>";
            $proData++;
            $tPric+=$pr;
            $twight += $supWight;

            $retdata .= $lib->plugins->importPlugin("plg_2checkout", "product;" . $proData . ";" . $d['title'] . ";" . $c[0] . ";" . $price . ";" . $d['id']);
        }
    }



    $proData++;






    $retdata .= "</table>";

    if (count($carts) > 0) {

        $retdata.="<input name='Sub_Total' type='hidden' value='" . $tPric . "' /><div class='tpric pinfo'><label>Sub-Total:</label> " . $currency . " <span class='SubTotalPric'>" . $tPric . "</div></div>";






        if ($setting['shipping'] != "0") {

            $retdata.= $lib->plugins->importPlugin("plg_chapening", $lang['shippingTitle'] . ";" . $chData['des'] . ";" . $lang['shippingValueTitle'] . ";" . $twight . ";" . $tPric . ";" . $proData . ";" . $chData['inputType']);

            $retdata.="<div class='tpric pinfo'><label>Delivery:</label> " . $currency . "<span class='devPric'>0</span></div>";
        } else {

            $retdata.= $lib->plugins->importPlugin("plg_chapening", $lang['shippingTitle'] . ";" . $chData['des'] . ";" . $lang['shippingValueTitle'] . ";" . $twight . ";" . $tPric . ";" . $proData . ";" . $chData['inputType'] . ";0");

            $retdata.="<span style='display:none' class='devPric'>0</span>";
        }






        $retdata.="<input name='Total_Pric' type='hidden' value='" . $tPric . "' /> <div class='tpric pinfo'><label>Your Grand Total is:</label> " . $currency . " <span class='totalPric'>" . $tPric . "</span></div>";

        if ($setting['coupon'] != "0") {
            $retdata.= $lib->plugins->importPlugin("plg_copun", $lang['copunTitle'] . ";" . $lang['copunintro'] . ";" . $lang['copunEndintro'] . ";" . $lang['copunValueTitle'] . ";" . $lang['copunErrorMsg']);
        }

        $retdata .= $lib->forms->getFiledsFormStrign("db", "com_products_setting", $setting['id'], "requstcartFields");

        $url = $lib->util->createURL("com_products", "success");
        if ($setting['PaymentType'] == "2") {
            $retdata .= $lib->plugins->importPlugin("plg_2checkout", "footer;" . $lib->util->siteSetting['site_link'] . $url);
        } else {

            $retdata .='</form>';
        }
    } else {
        $retdata = "<div class='cartEmpty'>" . $lang['cartEmpty'] . "</div>";
    }
    return $retdata;
}

function com_products_addTocart($lang, $id, $num = "1", $Status = "") {
    global $lib;



    $currency = $lib->util->cities->getCurrency();


    $_SESSION['currency'] = $currency;
    $d = $lib->db->get_row("com_products", "", "id=" . $id . "  ");
    $url = $lib->util->createURL("com_products", "cart");


    $retData = "<script>tocart('" . $id . "','" . $lang['addToCartMsg'] . "','" . $lang['deleteFromCartMsg'] . "','" . $lang['deleteFromCartConfirmMsg'] . "','" . $url . "');</script>
        <div class='tocart tocart" . $id . "'>";

    $btVal = $lang['tocart'];
    $btVald = $lang['delet'];
    if ($Status != "") {
        $btVal = $lang['update'];
    }


    $retData.=" <div id=\"inline-cart\" class=\"hide\" style='display:none'></div>


      <input type='hidden' value='" . $id . "' class='item_id'/>";

    $retData.="<input type='hidden' value='" . $d['title'] . "' class='item_name'/>";


    $retData.="<input type='button' value='" . $btVal . "' class='tocart_add'/>";
    $retData.="<div class='tocart_numCont'><label >" . $lang['Quantity'] . "</label>
        <input type='input' value='" . $num . "' class='tocart_num'/>";
    $retData.="<input type='button' value='+' class='tocart_Plus'/>";
    $retData.="<input type='button' value='-' class='tocart_mien'/></div>";
    $price = $lib->util->cities->getproductsPrice($d['id']);


    $retData.="<div class='pricCont'>
      <label class=''>" . $lang['pric'] . " : </label>
      <div class='pricData'> <div>" . $currency . " " . $price . "</div>
          <label  class=\"pricData\"> Ships for Free!</label>

</div></div>";



    if ($Status == "") {

        $url = $lib->util->createURL("com_products", "cart");
        $retData.="<a class='showcart' href='" . $url . "'>" . $lang['showCart'] . "</a>";
    } else {

        $retData.="<input type='button' value='" . $btVald . "' class='tocart_delete'/>";
    }

    $retData.="<div class='tocart_updateData updateData'></div>";


    $retData.="</div>";

    return $retData;
}

function com_products_getsubs($id) {
    global $lib;
    $data = $lib->db->get_data("com_products_categories", "", "cat_id like '%" . $id . "%'  and `delete`=0");
    $retdata = viewCats($data);
    return $retdata;
}

function com_products_tags($id, $pro, $lang) {

    global $lib;
    $rowNumbers = "6";
    if ($pro['nums'] != null) {
        $rowNumbers = $pro['nums'];
    }

    if (isset($_GET['page'])) {
        $rowFrom = $_GET['page'];
    } else {
        $rowFrom = "0";
    }


    $data = $lib->db->get_data('com_products', '', "`delete`=0 and  `enabled`=1 and tags like '%" . $id . "%' limit " . $rowFrom . "," . $rowNumbers);

//$llnum = $lib->db->get_data('com_content_article', '', "`delete`=0 and  `enabled`=1 and `cat_id`='" . $id . "'");



    $llnum = $lib->db->get_data("com_products", "", "`delete`=0 and  `enabled`=1 and tags like '%" . $id . "%' ");

    $retdata = "<div class='items'>";

    foreach ($data as $d) {

        $retdata .=viewBlock($pro, $d, $lang);
    }


    $retdata .= "</div >";


    $retdata .=$lib->util->getPageNumber($rowNumbers, count($llnum));
    return $retdata;
}

function com_products_getitms($id, $pro, $lang) {

    global $lib;
    $rowNumbers = "6";
    if ($pro['nums'] != null) {
        $rowNumbers = $pro['nums'];
    }

    if (isset($_GET['page'])) {
        $rowFrom = $_GET['page'];
    } else {
        $rowFrom = "0";
    }



    $datasql = $lib->util->getXrefData("com_products", $id, "order by `order` limit " . $rowFrom . "," . $rowNumbers);
    $llnum = $lib->util->getXrefData("com_products", $id);






    $retdata = "<div class='items'>";

    foreach ($datasql as $d) {

        if ($pro['offerstyle'] == "1") {

            $retdata .=viewBlockoffers($pro, $d, $lang);
        } else {


            $retdata .=viewBlock($pro, $d, $lang);
        }
    }


    $retdata .= "</div >";


    $retdata .=$lib->util->getPageNumber($rowNumbers, count($llnum));
    return $retdata;
}

function com_products_getTags($tag, $lang) {
    global $lib;

    return $lib->util->getTags("com_products", "10", "50");
}
?>

<script>
    $(function() {

        $("#order").submit(function() {

            var dt = "";
            $("#order input").each(function() {
                dt += $(this).attr("name") + "=" + $(this).val() + "&";
            })

        })

    })


</script>
