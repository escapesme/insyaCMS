<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

function getCategories($id) {
    global $lib;
    $retdata = "<div class='subs'>";
    $data = $lib->util->data->getCategoryData('com_video_gallery_categories', $id, "data", "cat_id");
    foreach ($data as $d) {



        $url = $lib->util->createURL("com_video_gallery", $d['alias']);

        $retdata .= "<div class='catBlock' >
            <a title='" . $d['title'] . "' href='" . $url . "'>
      <div class='catBlock_image'><img src='/uploads/images/" . $d['image'] . "' />
       </div><div class='catBlock_title'>" . $d['title'] . "</div></a></div>";
    }

    $retdata .= "</div >";

    return $retdata;
}

function viewBlock($pro, $da) {




    $imagePath = "/uploads/images/" . $da['th_image'];
    /* if (!is_file($imagePath)) {

      $imagePath = "/uploads/images/noimages.jpg";
      } */

    global $lib;



    $dbCat = $lib->util->data->getCategoryData('com_video_gallery_categories', $da['cat_id']);

    $url = $lib->util->createURL("com_video_gallery", $dbCat['alias'], $da['alias']);


    $returnData.= "<div id='" . $da['id'] . "' class='itemBlock'>";

    if (isset($pro['viewResource']) && $pro['viewResource'] == "1") {
        $returnData.= $lib->util->getsource("com_video_gallery", $da['id']);
    }










    if (isset($pro['catPageViewTitle']) && $pro['catPageViewTitle'] == "1") {


        $returnData.="<div class='itemBlock_title'>
            <a title='" . $da['title'] . "' href='" . $url . "'>" . $da['title'] . "</a></div>";
    }

    if (isset($pro['catPageViewHist']) && $pro['catPageViewHist'] == "1") {

        //   $returnData.= "<div class = 'itemBlock_title'>" . $da['title'] . "</div>";
    }


    if (isset($pro['catPageViewImage']) && $pro['catPageViewImage'] == "1") {




        $returnData.= "<div  class='itemBlock_imgae_cont'>
            <div class='duration'>" . $da['duration'] . "</div>
                    <a title='" . $da['title'] . "' href='" . $url . "'>
                    <div class='hoverlight'><div class='hlightimg'></div></div>
                    



<img 
    alt='" . $da['title'] . "' 
    
    src='/images/pixel.gif'
    data-src='" . $imagePath . "'
    class='lazy  itemBlock_imgae'
    />
    </a> </div>";
    }



    if (isset($pro['catPageViewDes']) && $pro['catPageViewDes'] == "1") {

        $returnData.= "<div class = 'itemBlock_des'>" . $da['dec'] . "</div>";
    }

    $returnData .= " <div class='sharth'>" . $lib->plugins->importPlugin("plg_share", "3") . "</div>";
    $returnData.= " </div>";


    return $returnData;
}

function getItemstag($id, $rowFrom, $rowNumbers, $pro) {

    global $lib;

    $llnum = $lib->db->get_Data("com_video_gallery", "*", " tag like '%" . $id . "%' and `");
    $datasql = $lib->db->get_Data("com_video_gallery", "*", "tag like '%" . $id . "%'  limit " . $rowFrom . "," . $rowNumbers);

    $returnData .="<div class='allItemsBlock'>";
    foreach ($datasql as $da) {// ..coming_soon.png
        $returnData.=viewBlock($pro, $da);
    }




    $returnData .=$lib->util->getPageNumber($rowNumbers, count($llnum));
    $returnData.= "</div>";
    return $returnData;
}

function getItems($id, $rowFrom, $rowNumbers, $pro, $not = "") {



    global $lib;




    if (isset($id) && $id != "") {

        // $id = "0";
        if ($not != "") {


            $n = "and com_video_gallery.id<>" . $not;
        }
        $datasql = $lib->util->data->getXrefData("com_video_gallery", $id, $n . " order by `order` DESC limit " . $rowFrom . "," . $rowNumbers);
        $llnum = $lib->util->data->getXrefData("com_video_gallery", $id);
        $i = explode(",", $id);

        $returnData .=getCategories($i[0]);

        $returnData .="<div class='allItemsBlock'>";
        foreach ($datasql as $da) {
            $returnData.=viewBlock($pro, $da);
        }

        $returnData .=$lib->util->getPageNumber($rowNumbers, count($llnum));
        $returnData.= "</div>";
    } else {
        $lib->util->page->getTo404();
    }
    return $returnData;
}

function getsourceData($id, $rowFrom, $rowNumbers, $pro, $lang) {

    global $lib;
    $sdata = $lib->db->get_row("plg_rescores", "*", "alias='" . $id . "'");


    $lib->util->updateTitle($sdata['title'], $sdata['title']);


    $llnum = $lib->db->get_Data("com_video_gallery", "*", "  plugins_data like '%source__" . $sdata['id'] . "%'");
    $datasql = $lib->db->get_Data("com_video_gallery", "*", " plugins_data like '%source__" . $sdata['id'] . "%'  limit " . $rowFrom . "," . $rowNumbers);

    $returnData .="<div class='allItemsBlock'>";
    foreach ($datasql as $da) {
        $returnData.=viewBlock($pro, $da);
    }




    $returnData .=$lib->util->getPageNumber($rowNumbers, count($llnum));
    $returnData.= "</div>";
    return $returnData;
}

function vediogGetfile($id, $pro) {

    global $lib;

    $datasql = $lib->db->get_Row("com_video_gallery", "*", " `enabled`=1 and  `delete`=0 and `id`='" . $id . "' ");
    if (is_array($datasql)) {
        $returnDate = "<div class='block_main'><div class='videotitle maintitle title'>" . $datasql['title'] . " </div>";

        if ($datasql['type'] == "file") {
            $returnDate .= getPlayer($$datasql['file'], $datasql['image']);
        } else {
            $returnDate .= getyoutubePlayer($datasql['url'], $pro['videoPlayerWidth'], $pro['videoPlayerHeight']);
        }


        $returnDate .= "<div class='thshar'>" . $lib->plugins->importPlugin("plg_share", "2") . "</div>";
        $returnDate.="<div class='videodes  des'> " . $datasql['dec'] . "</div>";
        $returnDate.="</div>";

        $lib->util->page->headerData($datasql['description'], $datasql['keywords'], $datasql['header']);

        $lib->util->page->chearTages($datasql['title'], $datasql['th_image'], $datasql['url'], $datasql['title'], $url = "");


        $returnDate .= $lib->plugins->importPlugin("plg_hits", "com_video_gallery;" . $id . ";");
    } else {
        $lib->util->page->getTo404();
    }


    return $returnDate;
}

function getPlayer($file, $image, $width = "450", $height = "250") {
    global $lib;

    $data = '<video 
        src="' . $file . '" 
        height="' . $height . '" 
        id="container" 
        poster="' . $image . '" 
        width="' . $width . '">
</video>
<script type="text/javascript"> jwplayer("container").setup({
flashplayer: "' . $lib->foldersMap->fornt_includes_folder . '/jwplayer/player.swf" });


</script>;';




    return $data;
}

function getyoutubePlayer($file, $width = "480", $height = "360") {
    global $lib;
    return $lib->util->youtubePlay($file, $width, $height);
}

function com_vedios_getTags($lang) {
    global $lib;

    return $lib->util->getTags("com_video_gallery", "10", "50");
}

?>
