<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of utilComponentsClass
 *
 * @author ismail
 */

namespace libs\utiles;

require_once('mobile/mobileClass.php');

class utilComponentsClass {

    //put your code here

    var $lib = "";
    var $gen = "";

    /**
     *
     * @var \mobileClass
     */
    var $mobile = "";

    public function __construct($lib, $gen) {

        $this->lib = $lib;
        $this->gen = $gen;



        $this->mobile = new \mobileClass($lib);
    }

    function getMenuAlias($data) {
        $d = $this->lib->db->get_row("menu_itmes", "*", "mei_main='" . $data . "' and `main_link`='1'");
        $returnData = $d['mei_alias'];
        if ($returnData == "") {
            $d = $this->lib->db->get_row("menu_itmes", "*", "mei_main='" . $data . "'");
            $returnData = $d['mei_alias'];
        }
        return $returnData;
    }

    function getPageNumber($rowNumbers, $allNumbers, $moreClas = "", $rowFrom = "", $tpy = "") {



        $data = "";


        if ($tpy != "") {
            if ($rowFrom == "") {
                if (isset($_GET['page'])) {
                    $rowFrom = $_GET['page'];
                } else {

                    $rowFrom = "0";
                }
            }

            $next = $rowFrom + $rowNumbers;
            $prv = $rowFrom - $rowNumbers;
            $pagesNum = floor($allNumbers / $rowNumbers);
            $lastpage = $rowNumbers * $pagesNum;





            if ($pagesNum >= 1) {

                $nextlink = "<a href='" . $this->gen->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->gen->getLanguageWord("next", "general") . "'>" . $this->gen->getLanguageWord("next", "general") . "</a>";
                $pervlink = "<a href='" . $this->gen->getModurl("page") . "_" . $prv . "/' class='prev' title='" . $this->gen->getLanguageWord("prev", "general") . "'>" . $this->gen->getLanguageWord("prev", "general") . "</a>";

                $first = "<a href='" . $this->gen->getModurl("page") . "_" . "0/' class='first' title='" . $this->gen->getLanguageWord("first", "general") . "' >" . $this->gen->getLanguageWord("first", "general") . "</a>";
                $last = "<a href='" . $this->gen->getModurl("page") . "_" . $lastpage . "/' class='last' title='" . $this->gen->getLanguageWord("last", "general") . "'>" . $this->gen->getLanguageWord("last", "general") . "</a>";
            }
            $pages = "";



            for ($i = 0; $i < $pagesNum; $i++) {
                $mypage = $i + 1;
                $mynum = $i * $rowNumbers;

                $mClass = "";
                if ($rowFrom == $mynum) {

                    $mClass = "act";
                }
                $pages.="<a href='" . $this->gen->getModurl("page") . "_" . $i * $rowNumbers . "/' class='pagenumber " . $mClass . "'>" . $mypage . "</a>";
            }




            if ($rowFrom < $rowNumbers) {
                $pervlink = "<a href='#' class='prev disable ' title='" . $this->gen->getLanguageWord("prev", "general") . "'>" . $this->gen->getLanguageWord("prev", "general") . "</a>";
            }
            if ($rowFrom + $rowNumbers > $allNumbers) {

                $nextlink = "<a href='#' class='next disable' title='" . $this->gen->getLanguageWord("next", "general") . "'>" . $this->gen->getLanguageWord("next", "general") . "</a>";
            }

            $data.="<div class='pagesBar " . $moreClas . "'>" . $first . $pervlink . $pages . $nextlink . $last . "</div>";
        } else {

            if ($rowFrom == "") {
                if (isset($_GET['page'])) {
                    $rowFrom = $_GET['page'];
                } else {

                    $rowFrom = "0";
                }
            }

            $next = $rowFrom + $rowNumbers;
            $prv = $rowFrom - $rowNumbers;

            if ($rowFrom < 0) {

                $rowFrom = 0;
            }

            if ($prv < 0) {

                $prv = 0;
            }

            if ($next < 0) {

                $next = 0;
            }


            if ($allNumbers > $rowNumbers) {


                $pageNumbers = $allNumbers / $rowNumbers;
                $thpage = $rowFrom / round($rowNumbers);


                $thpage+=1;

                if ($rowFrom > 0) {
                    $data.= "<div class='pagesbar'>";
                    if ($allNumbers > $next) {
                        $data.= "<a href='" . $this->gen->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->gen->getLanguageWord("next", "general") . "'>" . $this->gen->getLanguageWord("next", "general") . "</a>";
                    } else {
                        $data.= "<a  class='next disable' title='" . $this->gen->getLanguageWord("next", "general") . "'>" . $this->gen->getLanguageWord("next", "general") . "</a>";
                    }


                    $data.= "<a class='next fpage' title='" . $this->gen->getLanguageWord("next", "general") . "'>"
                            . $this->gen->getLanguageWord("page", "general")
                            . " - " . $thpage . ""
                            . "</a>";
                    $data.= "<a href='" . $this->gen->getModurl("page") . "_" . $prv . "/' class='prev' title='" . $this->gen->getLanguageWord("prev", "general") . "'>" . $this->gen->getLanguageWord("prev", "general") . "</a> </div>";
                } else {


                    $data.= "<div class='pagesbar'><a href='" . $this->gen->getModurl("page") . "_" . $next . "/' class='next' title='" . $this->gen->getLanguageWord("next", "general") . "'>" . $this->gen->getLanguageWord("next", "general") . "</a>
                       ";





                    $data.= "<a  class='next fpage' title='" . $this->gen->getLanguageWord("next", "general") . "'>"
                            . $this->gen->getLanguageWord("page", "general")
                            . " - 1"
                            . "</a></div>";
                }
            }
        }




        return $data;
    }

    function createURL($alias, $cat, $item, $type) {

        $alias = $this->getMenuAlias($alias);

        $returnData = "";


        $returnData .= "/" . $alias . "/";




        if (isset($type) && trim($type) != "") {
            $returnData .= $type . "/";
        }


        if (isset($cat) && trim($cat) != "") {
            $returnData .= $cat . "/";
        }

        if (isset($item) && trim($item) != "") {
            $returnData .= $item . "/";
        }


        return $returnData;
    }

    function getXrefData($table, $catid, $more = "", $xreftable = "") {
        if ($xreftable == "") {

            $xreftable = $table . "_xref";
        }



        $catids = explode(",", $catid);
        $wherefcat_id = "";

        if (isset($catids[0]) && trim($catids[0]) != "") {
            $wherefcat_id = " and    $xreftable.cat_id=" . $catids[0];
        }

        $sqlString = "SELECT  
            $table.*
            From    $table 
            INNER JOIN $xreftable ON    
            $table.enabled='1' and 
            $table.delete='0'  and   
       
                $table.id=$xreftable.item_id " . $wherefcat_id . " " . $more;





        $datasql = $this->lib->db->get_data_query($sqlString);

        return $datasql;
    }

    function getCategoryData($table, $catid, $type, $where = "id") {



        $catids = explode(",", $catid);
        if ($type == "data") {
            $datasql = $this->lib->db->get_data($table, '', " `" . $where . "` ='" . $catids[0] . "'");
        } else {
            $datasql = $this->lib->db->get_row($table, '', " `" . $where . "` ='" . $catids[0] . "'");
        }


        return $datasql;
    }

    function _viewcatBlock($pro, $lang, $data, $Table) {

        $returnData = "";
        $url = $this->createURL($Table, $data['alias']);

        $returnData .= "<div class='catBlock' > \n 
        <a title='" . $data['alias'] . "' href='" . $url . "'>    \n 
              <div class='catBlock_image'>    \n 
                <img alt='" . $data['alias'] . "' src='/uploads/images/" . $data['image'] . "' />    \n 
            </div> \n
            <div class='catBlock_title'>" . $data['title'] . "</div>    \n 
          </a>    \n 
             </div>    \n ";



        return $returnData;
    }

    function _getCats($pro, $lang, $catTable, $Table, $catID) {



        if (isset($catID) && $catID != "") {
            $datasql = $this->getCategoryData($catTable, $catID, "data", "cat_id");

            foreach ($datasql as $d) {

                $data.= $this->_viewcatBlock($pro, $lang, $d, $Table);
            }
        }


        return $data;
    }

    function getsource($table, $id) {

        $plginData = $this->getPlginData($table, $id);


        $sourcedatasql = $this->db->get_Row("plg_rescores", "*", " `id`='" . $plginData['source'] . "' ");

        $urls = $this->createURL($table, "source", $sourcedatasql['alias']);

        $imagePaths = "/uploads/images/" . $sourcedatasql['image'];



        $returnData.= "<div class='source_title'>
           <a title='" . $sourcedatasql['title'] . "' href='" . $urls . "'>
                <img  alt=\"" . $sourcedatasql['title'] . "\"   class='lazy source_image' data-src='" . $imagePaths . "'   src='/images/pixel.gif' />
                    <span>" . $sourcedatasql['title'] . "</span></a></div>";




        return $returnData;
    }

    function _viewBlock($pro, $lang, $da, $catTable, $Table, $slideshow = "") {



        $imagePath = "/uploads/images/" . $da['th_image'];
        $imagePathf = "/uploads/images/" . $da['image'];
        /* if (!is_file($imagePath)) {

          $imagePath = "/uploads/images/noimages.jpg";
          } */

        $dbCat = $this->getCategoryData($catTable, $da['cat_id']);

        $url = $this->createURL($Table, $dbCat['alias'], $da['alias']);


        $returnData.= "<div id='" . $da['id'] . "' class='itemBlock'>";

        if (isset($pro['viewResource']) && $pro['viewResource'] == "1") {
            $returnData.= $this->getsource($Table, $da['id']);
        }


        if (isset($pro['catPageViewTitle']) && $pro['catPageViewTitle'] == "1") {


            $returnData.="<div class='itemBlock_title'>
            <a title='" . $da['title'] . "' href='" . $url . "'>" . $da['title'] . "</a></div>";
        }

        if (isset($pro['catPageViewHist']) && $pro['catPageViewHist'] == "1") {

            // $returnData.= "<div class = 'itemBlock_title'>" . $da['title'] . "</div>";
        }






        if (isset($pro['catPageViewImage']) && $pro['catPageViewImage'] == "1") {
            $more = "";
            if (isset($slideshow) && $slideshow != "") {


                $more = "rel='prettyPhoto[gallery]' class='lightbox-slideshow'";

                $url = $imagePathf;
            }





            $returnData.= "<div  class='itemBlock_imgae_cont'>
                    <a " . $more . " title='" . $da['des'] . "' href='" . $url . "'>
                    <div class='hoverlight'><div class='hlightimg'></div></div>
                    <div class='duration'>" . $da['duration'] . "</div>
<img   alt='" . $da['title'] . "'   src='/images/pixel.gif' data-src='" . $imagePath . "' class='lazy  itemBlock_imgae' />
    </a> </div>";
        }



        if (isset($pro['catPageViewDes']) && $pro['catPageViewDes'] == "1") {

            $returnData.= "<div class = 'itemBlock_des'>" . $da['des'] . "</div>";
        }

        //    $returnData .= " <div class='sharth'>" . $this->lib->plugins->importPlugin("plg_share", "3") . "</div>";
        $returnData.= " </div>";

        return $returnData;
    }

    function _getItems($pro, $lang, $catID, $catTable, $table, $rowFrom, $rowNumbers, $not = "", $slideshow = "") {

        if ($not != "") {
            $n = "and com_video_gallery.id<>" . $not;
        }
        $datasql = $this->getXrefData($table, $catID, $n . " order by `order` DESC limit " . $rowFrom . "," . $rowNumbers);
        $llnum = $this->getXrefData($table, $catID);
        $returnData = "";

        $i = explode(",", $catID);
        $catID = $i[0];

        $more = "";
        if (isset($slideshow) && $slideshow != "") {


            $more = "gallery";
        }


        $returnData .="<div class='" . $more . " allItemsBlock'>";
        foreach ($datasql as $da) {
            $returnData.=$this->_viewBlock($pro, $lang, $da, $catTable, $table, $slideshow);
        }
        $returnData .=$this->getPageNumber($rowNumbers, count($llnum));
        $returnData.= "</div>";

        return $returnData;
    }

    function get_modData_categories($pro, $all, $table, $catTable) {



        $returnData.= "<div class='" . $table . " modig_all'>";
        for ($i = 0; $i < $pro['numberView']; $i++) {
            if (isset($all[$i]['id']) && trim($all[$i]['id']) != "") {

                $url = $this->createURL($table, $all[$i]['alias']);

                $imagePath = "/uploads/images/" . $all[$i]['image'];
                /*  if (!is_file($imagePath)) {

                  $imagePath = "/uploads/images/noimages.jpg";
                  } */
                $returnData.= "<div id='" . $all[$i]['id'] . "' class='mod_block'>";


                if ($pro['viewTitle'] == "1") {

                    $returnData.= "<div class='modig_blocTitle'> <a title='More' href='" . $url . "'>" . $all[$i]['title'] . "</a></div>";
                }



                if ($pro['viewImage'] == "1") {

                    $returnData.= "<div  class='mod_image'><a title='More' href='" . $url . "'>
                    <img src='" . $imagePath . "'  class='mod_image'/></a> </div>";
                }


                if ($pro['viewDes'] == "1") {

                    $returnData.= "<div class='modig_blockdes'><a title='More' href='" . $url . "'>" . $all[$i]['des'] . "</a></div>";
                }

                $returnData.= "</div>";
            }
        }

        $returnData.= "</div>";
        return $returnData;
    }

    function get_modData_items($pro, $all, $thisTable, $thiscatgoriesTable) {


        if (!isset($pro['maxTitle']) || $pro['maxTitle'] == "") {
            $pro['maxTitle'] = 1000;
        }


        if (!isset($pro['maxdes']) || $pro['maxdes'] == "") {
            $pro['maxdes'] = 16;
        }

        $returnData.= "<div class='" . $thisTable . " modig_all'>";
        for ($i = 0; $i < $pro['numberView']; $i++) {
            if (isset($all[$i]['id']) && trim($all[$i]['id']) != "") {



                $imagePath = "/uploads/images/" . $all[$i]['th_image'];


                if ($thiscatgoriesTable != "") {
                    $datacat = $this->lib->db->get_row($thiscatgoriesTable, "*", "`id`='" . $all[$i]['cat_id'] . "'");



                    $url = $this->createURL($thisTable, $datacat['alias'], $all[$i]['alias']);
                }

                //  if (!is_file($imagePath)) {
                // $imagePath = "/uploads/images/noimages.jpg";
                //  } 
                $returnData.= "<div id='" . $all[$i]['id'] . "' class='mod_block'>";
                $returnData.= "";
                if (isset($pro['viewResource']) && $pro['viewResource'] == "1") {
                    $returnData.=$this->getsource("com_video_gallery", $all[$i]['id']);
                }



                if ($pro['viewTitle'] == "1") {

                    $returnData.= "<div class='modig_blocTitle'>  
                    
<a title='" . $all[$i]['title'] . "' href='" . $url . "'>" . $this->gen->limit_text($all[$i]['title'], $pro['maxTitle']) . "</a></div>";
                }



                if ($pro['viewMViews'] == "1" && ($pro['firstMainStyle'] == "0" || $i < 1)) {
                    // $returnData.= $lib->plugins->importPlugin("plg_hits", $thisTable . ";" . $all[$i]['id'] . ";getHits");
                }



                if ($pro['viewImage'] == "1" && ($pro['firstMainStyle'] == "0" || $i < 1)) {
                    $returnData.= "<div  class='mod_image'>
                    <a title='" . $all[$i]['title'] . "' href='" . $url . "'>
                    <div class='hoverlight'><div class='hlightimg'></div></div>
                    <div class='duration'>" . $all[$i]['duration'] . "</div>

                    <img  alt='" . $all[$i]['title'] . "'  src='/images/pixel.gif'  data-src='" . $imagePath . "'  class='lazy mod_image'  /></a> </div>";
                }



                if ($pro['viewDes'] == "1" && ($pro['firstMainStyle'] == "0" || $i < 1)) {

                    $returnData.= "<div class='modig_blockdes'><a title='" . $all[$i]['title'] . "'  href='" . $url . "' >" . $this->gen->limit_text($all[$i]['des'], $pro['maxdes']) . "</a></div>";
                }

                $returnData.= "</div>";
            }
        }


        $returnData.= "</div>";
        return $returnData;
    }

    function get_modData_fromOther($pro, $thisTable, $thiscatgoriesTable) {
        //$_GET['show'] == 'cate'
        global $lib;
        $where = "";

        if ($pro['fromother'] == "1") {



            $dataMain = $lib->front->getmainProreties();
            $al = $lib->front->getmenu('mei_main');

            if ($_GET['show'] != 'cat' && $al == $thisTable && isset($dataMain['cat_id']) && $dataMain['cat_id'] != "") {


                $where = 'and ' . $thisTable . '.cat_id<>' . $dataMain['cat_id'];
            } else if ($_GET['show'] == 'cat') {

                $where = 'and ' . $thisTable . '.cat_id<>' . $_GET['id'];
            }
        }



        return $where;
    }

    function get_modData_getdynamic($pro, $thisTable, $thiscatgoriesTable) {
        //$_GET['show'] == 'cate'
        global $lib;
        $where = "";
        if ($pro['dynamic'] == "1") {
            $dataMain = $lib->front->getmainProreties();
            $al = $lib->front->getmenu('mei_main');

            if ($_GET['show'] != 'cat' && $al == $thisTable && isset($dataMain['cat_id']) && $dataMain['cat_id'] != "") {


                $where = 'and ' . $thisTable . '.cat_id=' . $dataMain['cat_id'];
            } else if ($_GET['show'] == 'cat') {

                $where = 'and ' . $thisTable . '.cat_id=' . $_GET['id'];
            }
        }



        return $where;
    }

    function get_modData_getAllItems($pro, $type, $thisTable, $thiscatgoriesTable) {



        $data = "";


        $where = "";


        $where .= $this->get_modData_getdynamic($pro, $thisTable, $thiscatgoriesTable);

        $where .= $this->get_modData_fromOther($pro, $thisTable, $thiscatgoriesTable);


        if ($type == "cat") {

            $data = $this->lib->db->get_Data($thiscatgoriesTable, "*", "`enabled`=1 and  `delete`=0  " . $where . " ORDER BY `id`");
        } else if ($type == "art") {
            $more = " order by `order` DESC ";



            if ($pro['random'] == "1") {
                $more = " order by `order` DESC limit 0," . $pro['randomof'];

                $data2 = $this->getXrefData($thisTable, $pro['cat_id'], $where . $more);
                $w = ""
                ;
                foreach ($data2 as $d) {
                    $w .= $d['id'] . ",";
                };
                $w.="0";

                $data = $this->lib->db->get_Data($thisTable, "*", " id  IN(" . $w . ")ORDER BY RAND()");
            } else {

                $more = " order by `order` DESC ";

                $data = $this->getXrefData($thisTable, $pro['cat_id'], $where . $more);
            }
        }



        return $data;
    }

}

?>
