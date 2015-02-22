<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

////////////////////

function viewItem($id, $pro, $lng) {

    global $lib;

    $d = $lib->db->get_row('com_content_article', '', 'id=' . $id);






    $lib->util->headerData($d['description'], $d['keywords'], $d['header']);




    $urluser = $lib->util->createURL("com_content_article", $d['author'], "", "author");
    $urldate = $lib->util->createURL("com_content_article", $d['date'], "", "date");

    $urlprint = $lib->util->createURL("com_content_article", "", $d['alias'], "print");

    $urlcat = $lib->util->createURL("com_content_article", $catData['alias']);

    $up['hit'] = $d['hit'] + 1;

    $lib->db->update_row('com_content_article', $up, $id);

    $date = new DateTime($d['date']);

    $data .= "<div>\n ";








    $data .= $glls;




    $data.="<div class = 'itemBlock_imgae_cont'>";


    //   if (isset($pro['catPageViewImage']) && $pro['catPageViewImage'] == "1" && $pro['thimageinBody'] == "1") {

    $imagePath = " /uploads/images/" . $d['th_image'];
    if (isset($pro['catPageViewDate']) && $pro['catPageViewDate'] == "1") {

        $data.="<div class='itemBlock_date info'><div class='data'><span>" . $date->format('j') . "</span><span>" . $date->format('F') . " </span><span>" . $date->format('Y') . "</span></div><span class=\"triangle\"></span></div>";
    }
    $data.= "

    
    <img title = \"" . $d['dec'] . "\"  alt=\"" . $d['title'] . "\"  class=' itemBlock_imgae' src='" . $imagePath . "' />
    <div class='light img'></div></div>";
    //   }






    $data.= " <div class='blockinfo'><div class='icon'></div> ";
    if (isset($pro['catPageVieCat']) && $pro['catPageVieCat'] == "1") {
        $data.="<div class='itemBlock_cat'><a title='More' href='" . $urlcat . "'>" . $catData['name'] . "</a></div>";
    }

    if (isset($pro['catPageViewAuthor']) && $pro['catPageViewAuthor'] == "1") {
        $data.="<div class='itemBlock_author info'><a title='More' href='" . $urluser . "'>" . $d['author'] . "</a></div>";
    }

    if (isset($pro['catPageViewHist']) && $pro['catPageViewHist'] == "1") {



        $data.= $lib->plugins->importPlugin("plg_hits", "com_content_article;" . $d['id'] . ";getHits");
    }


    $data.= "</div> ";



//    if (isset($pro['catPageViewTitle']) && $pro['catPageViewTitle'] == "1") {


        $data.="<div class = 'itemBlock_title'><a title = 'More' href = '" . $url . "'>" . $d['title'] . "</a></div>";
//    }

    
    
    if ($pro['introInBody'] == "1") {

        $data.="<div class='art_intro'>" . $d['des'] . "</div>";
    }





    $data.="<div class='art_body'>" . $d['artbody'] . "</div>";

    $data.="</div>";


    return $data . $lib->util->getPlugins($id, "com_content_article");
}

//////////////////////



function getartsBywhere($wehre, $rowFrom, $rowNumbers, $lang, $pro) {
    /* @var $lib  libs\libs */
    global $lib;




    $datasql = $lib->db->get_data('com_content_article', '', " " . $wehre . " limit " . $rowFrom . "," . $rowNumbers);
    $llnum = $lib->db->get_data('com_content_article', '', "  " . $wehre . " ");

    $data = "<div  class='dataContenerAll'>";

    foreach ($datasql as $d) {


        $catData = $lib->util->data->getCategoryData('com_content_catgories', $d['cat_id']);

        $data.=$lib->util->com->mobile->viewItemsBlock($pro, $d, $catData);
    }
    $data.="</div>";

    $data .=$lib->util->getPageNumber_mobile($rowNumbers, count($llnum));

    return $data;
}

function getartsByCatID($catid, $rowFrom, $rowNumbers, $lang, $pro) {
    /* @var $lib  libs\libs */
    global $lib;

    $table = "com_content_article";
    $more = "order by `order` DESC  limit " . $rowFrom . "," . $rowNumbers;

    $datasql = $lib->util->getXrefData($table, $catid, $more);
    $llnum = $lib->util->getXrefData($table, $catid);
    $data = "<div data-demo-html=\"true\">
				<ul data-filter=\"true\" data-role=\"listview\" data-inset=\"true\">";
    foreach ($datasql as $d) {

        $catData = $lib->util->data->getCategoryData('com_content_catgories', $d['cat_id']);


        $data.=$lib->util->com->mobile->viewItemsBlock($pro, $d, $catData);
    }
    $data.="	</ul>
			</div>";

    $data .=$lib->util->getPageNumber_mobile($rowNumbers, count($llnum));

    return $data;
}

function getTypeData($type) {
    global $lib;
    switch ($type) {

        case "tage":
            $returnData = $lib->util->getTags("com_content_article", "10", "50");
            break;
        case "user":
            $returnData = $lib->util->getAuthor("com_content_article");
            break;

        case "tag":
            $returnData = $lib->util->getDate("com_content_article");
            break;
    }


    return $returnData;
}

?>
