<?php

function dosearch($pro, $lang, $word) {

    $returnData = "<div class='tabs'>
        <ul>";

    if ($pro['news'] == "1") {
        $returnData .="<li id=\"tab1\">" . $lang['news'] . " </li>";
    }

    if ($pro['products'] == "1") {
        $returnData .="<li id=\"tab2\">" . $lang['products'] . " </li>";
    }


    if ($pro['images'] == "1") {
        $returnData .="<li id=\"tab3\">" . $lang['images'] . " </li>";
    }

    if ($pro['videos'] == "1") {
        $returnData .="<li id=\"tab4\">" . $lang['videos'] . " </li>";
    }


    $returnData .="</ul>";



    if ($pro['news'] == "1") {
        $returnData .="<div  class=\" tab1 tabsbody\">" . newsSearch($word) . "</div>";
    }

    if ($pro['products'] == "1") {
        $returnData .=" <div  class=\"tab2  tabsbody\">" . productsSearch($word) . "</div>";
    }


    if ($pro['images'] == "1") {
        $returnData .=" <div  class=\"tab3 tabsbody\">" . imagesSearch($word) . "</div>";
    }

    if ($pro['videos'] == "1") {
        $returnData .=" <div class=\"tab4 tabsbody\">" . videosSearch($word) . "</div>";
    }

    $returnData .="</div>";


    return $returnData;
}

function videosSearch($word) {
    $data = "";

    $thisTable = "com_video_gallery";
    $catTabel = "com_video_gallery_categories";




    global $lib;
    $dataa = $lib->db->get_data($thisTable, "", " (`title` like '%" . $word . "%' or `dec` like '%" . $word . "%') ");

    foreach ($dataa as $d) {





        $dcat = $lib->util->data->getCategoryData($catTabel, $d['id'], "data", "cat_id");

        $url = $lib->util->createURL($thisTable, $dcat['alias'], $d['alias']);



        $data .= "<div class='myitem' >
<div class='serachrow' ><a href='" . $url . "'>
    <div class='serachtitle'>" . $d['title'] . "</div>
<div class='serachimg'><img src='/uploads/images/" . $d['th_image'] . "' /></div></a>
<div class='serachdes'>" . $d['dec'] . "</div>
</div></div>";
    }
    return $data;
}

function imagesSearch($word) {
    $data = "";

    $thisTable = "com_images_gallery";
    $catTabel = "com_images_gallery_categories";


    global $lib;
    $dataa = $lib->db->get_data($thisTable, "*", " (`title` like '%" . $word . "%' or `dec` like '%" . $word . "%') ");



    foreach ($dataa as $d) {



        $dcat = $lib->util->data->getCategoryData($catTabel, $d['cat_id'], "data");

        $url = $lib->util->createURL($thisTable, $dcat['alias'], $dcat[0]['alias']);


        $data .= "<div class='myitem' >
<div class='serachrow' ><a href='" . $url . "'>
    <div class='serachtitle'>" . $d['title'] . "</div>
<div class='serachimg'><img src='/uploads/images/" . $d['th_image'] . "' /></div></a>
<div class='serachdes'>" . $d['dec'] . "</div>
</div></div>";
    }
    return $data;
}

function productsSearch($word) {
    $data = "";

    $thisTable = "com_products";
    $catTabel = "com_products_categories";


    global $lib;
    $dataa = $lib->db->get_data($thisTable, "", " (`title` like '%" . $word . "%' or `des` like '%" . $word . "%') ");

    foreach ($dataa as $d) {



        $dcat = $lib->util->data->getCategoryData($catTabel, $d['id'], "data");

        $url = $lib->util->createURL($thisTable, $dcat['alias'], $d['alias']);

        $data .= "<div class='myitem' >
<div class='serachrow' ><a href='" . $url . "'>
    <div class='serachtitle'>" . $d['title'] . "</div>
<div class='serachimg'><img src='/uploads/images/" . $d['th_image'] . "' /></div></a>
<div class='serachdes'>" . $d['des'] . "</div>
</div></div>";
    }
    return $data;
}

function newsSearch($word) {
    $data = "";
    $thisTable = "com_content_article";
    $catTabel = "com_content_catgories";
    global $lib;
    $dataa = $lib->db->get_data($thisTable, "", " (`title` like '%" . $word . "%' or  `intro` like '%" . $word . "%' or  `artbody` like '%" . $word . "%' )  and `delete`=0");


    foreach ($dataa as $d) {


        $catData = $lib->util->data->getCategoryData('com_content_catgories', $d['cat_id']);
        $pro['catPageViewDes'] = "1";
        $pro['catPageViewImage'] = "1";
        $pro['catPageViewAuthor'] = "1";
        $pro['catPageViewDate'] = "1";


        $data.="<div class='serch_data'>";
        $data.=$lib->util->com->mobile->viewItemsBlock($pro, $d, $catData);
        $data.="</div>";
    }
    $data.="<div class='height_1 clearfixdata  toclear'></div>";
    return $data;
}




function htmlSearch($word) {
    $data = "";
    /*
      global $lib;
      $data = $lib->db->get_data("com_products", "", " `title` like '%" . $word . "%'  and `delete`=0");


      foreach ($data as $d) {

      $data .= "<div class='myitem' >

      <div class='serachrow' ><a href='/products--" . $id . "--" . $d['id'] . ".html'><div class='serachtitle'>" . $d['title'] . "</div><div class='serachimg'><img src='/uploads/images/" . $d['th_iamge'] . "' /></div></a>

      <div class='serachdes'>" . $d['des'] . "</div>
      </div></div>";
      } */
    return $data;
}

function serachFrom($word, $lang) {




    $data = "<div class='serachform'>
        <input type='button' class='dosreach button' value='" . $lang['search'] . "'  />
<input name='data' type='text' 
onblur=\"if (this.value=='') this.value='" . $lang['searchInput'] . "';\" class='serachValue' value='" . $word . "' />  
</div>  ";







    return $data;
}
?>



