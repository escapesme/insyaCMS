<?php

/**
 * Description of mobile
 *
 * @author empcl_000
 */
//namespace libs\utiles\mobile;

class mobileClass {
    /* @var $lib  libs\libs */

    var $lib;

    public function __construct($lib) {
        $this->lib = $lib;
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

    function getCategories($pro, $lang, $catTable, $Table, $catID) {

        $data.="";
        if (isset($catID) && $catID != "") {
            $datasql = $this->getCategoryData($catTable, $catID, "data", "cat_id");
            $data.='<ul data-role="listview" data-inset="true">';
            foreach ($datasql as $d) {
                $data.= $this->viewcatBlock($pro, $lang, $d, $Table);
            }
            $data.="</ul>";
        }


        return $data;
    }

    function viewcatBlock($pro, $lang, $data, $Table) {

        $returnData = "";
        $url = $this->createURL($Table, $data['alias']);

        $returnData .= "<li class='catBlock' > \n
      <a title='" . $data['alias'] . "' href='" . $url . "'>    \n
      <div class='catBlock_image'>    \n
      <img alt='" . $data['alias'] . "' src='/uploads/images/" . $data['image'] . "' />    \n
      </div> \n
      <div class='catBlock_title'>" . $data['title'] . "</div>    \n
      </a>    \n
      </li>    \n ";



        return $returnData;
    }

    function viewItemsBlock($pro, $d, $catData) {
        /* @var $lib libs\libs */
        global $lib;




        $date = new DateTime($d['date']);



        $url = $lib->util->createURL("com_content_article", $catData['alias'], $d['alias']);

        $urluser = $lib->util->createURL("com_content_article", $d['author'], "", "author");
        $urldate = $lib->util->createURL("com_content_article", $d['date'], "", "date");
        $urlcat = $lib->util->createURL("com_content_article", $catData['alias']);

        $returnData.= "<li id='" . $d['id'] . "' class='itemBlock'>"
                . "";





        // if (isset($pro['catPageViewTitle']) && $pro['catPageViewTitle'] == "1") {
        //   }

        
        
                $returnData.="<h2 class = ' itemBlock_title info'>" . $d['title'] . "</h2>";

        if (isset($pro['catPageViewDate']) && $pro['catPageViewDate'] == "1") {

            $returnData.="<div class='itemBlock_date info'><div class='data'><span>" . $date->format('j') . "</span><span>" . $date->format('F') . " </span><span>" . $date->format('Y') . "</span></div><span class=\"triangle\"></span></div>";
        }
        
                $returnData.= " <a title='More' href='" . $url . "'>";
        if (isset($pro['catPageViewImage']) && $pro['catPageViewImage'] == "1") {
            $imagePath = "/uploads/images/" . $d['th_image'];
            $returnData.= "<img title = \"" . $d['title'] . "\"  alt=\"" . $d['title'] . "\"   class='lazy itemBlock_imgae'  data-original='" . $imagePath . "' src='/images/pixel.gif' />";
        }

 $returnData.= " </a>";
        if (isset($pro['catPageViewDes']) && $pro['catPageViewDes'] == "1") {
            $returnData.="<div class='itemBlock_des'>" . $lib->util->data->getText($d['des'], "", $pro['desLimit']) . "</div>";
        }






        $returnData.= "</a> <div class='blockinfo'><div class='icon'></div> ";
        if (isset($pro['catPageVieCat']) && $pro['catPageVieCat'] == "1") {
            $returnData.="<div class='itemBlock_cat'><a title='More' href='" . $urlcat . "'>" . $catData['name'] . "</a></div>";
        }




        if (isset($pro['catPageViewAuthor']) && $pro['catPageViewAuthor'] == "1") {
            $returnData.="<div class='itemBlock_author info'><a title='More' href='" . $urluser . "'>" . $d['author'] . "</a></div>";
        }

        if (isset($pro['catPageViewHist']) && $pro['catPageViewHist'] == "1") {



            $returnData.= $lib->plugins->importPlugin("plg_hits", "com_content_article;" . $d['id'] . ";getHits");
        }


        $returnData.= "</div> ";











        $returnData.= "</li>";



        return $returnData;
    }

    function _getItems($pro, $lang, $catID, $catTable, $table, $rowFrom, $rowNumbers, $not = "", $slideshow = "") {
        /* @var $lib  libs\libs */
        global $lib;
        if ($not != "") {
            $n = "and com_video_gallery.id<>" . $not;
        }
        $datasql = $lib->util->getXrefData($table, $catID, $n . " order by `order` DESC limit " . $rowFrom . "," . $rowNumbers);
        $llnum = $lib->util->getXrefData($table, $catID);
        $returnData = "";

        $i = explode(",", $catID);
        $catID = $i[0];

        $more = "";
        if (isset($slideshow) && $slideshow != "") {


            $more = "gallery";
        }


        $returnData .="    <div  class=\"ui-grid-a gallery\">";
        foreach ($datasql as $da) {


            $returnData.=$this->viewImagesBlock($pro, $lang, $da, $catTable, $table, $slideshow);
        }

        $returnData.= "</div>";

        return $returnData;
    }

    function viewImagesBlock($pro, $lang, $da, $catTable, $Table, $slideshow = "") {

        /* @var $lib  libs\libs */
        global $lib;

        $imagePath = "/uploads/images/" . $da['th_image'];
        $imagePathf = "/uploads/images/" . $da['image'];
        /* if (!is_file($imagePath)) {

          $imagePath = "/uploads/images/noimages.jpg";
          } */
        if ($this->mclass == "ui-block-a") {


            $this->mclass = "ui-block-b";
        } else {

            $this->mclass = "ui-block-a";
        }


        $dbCat = $this->getCategoryData($catTable, $da['cat_id']);

        $url = $lib->util->createURL($Table, $dbCat['alias'], $da['alias']);


        $returnData.= "\n <div class='" . $this->mclass . "'><div  class=\"ui-bar \" >";

        $returnData.=
                "<h5>" . $da['title'] . "</h5>"
                . "<a  href='" . $imagePath . "' rel=\"external\"  >\n";
        $returnData.= "<img alt='" . $da['title'] . "'   src='" . $imagePath . "' style='width:100%;'  class='  itemBlock_imgae' />\n";

        $returnData.= "</a></div></div>\n";






        return $returnData;
    }

    /*

      function viewImagesBlock($pro, $lang, $da, $catTable, $Table, $slideshow = "") {


      global $lib;

      $imagePath = "/uploads/images/" . $da['th_image'];
      $imagePathf = "/uploads/images/" . $da['image'];


      $dbCat = $this->getCategoryData($catTable, $da['cat_id']);

      $url = $lib->util->createURL($Table, $dbCat['alias'], $da['alias']);


















      $returnData.= "\n <div class='" . $this->mclass . "'>\n"
      . "<div class=\"ui-bar ui-bar-a \"  >";
      $returnData.= "<h3 class = 'itemBlock_title'>" . $da['title'] . "</h3>\n";
      $returnData.=
      "<a  href=\"#__" . $da['id'] . "\"  data-rel=\"popup\" data-position-to=\"window\" data-transition=\"flip\">\n";

      $returnData.= "<img alt='" . $da['title'] . "'   src='" . $imagePath . "' style='width:100%;'  class=' popphoto itemBlock_imgae' />\n";

      $returnData.= "</a></div>\n </div>";







      $returnData.= '<div data-role="popup" id="__' . $da['id'] . '" data-corners="false">';

      $returnData.= "<h3 class = 'itemBlock_title'>" . $da['title'] . "</h3>";
      $returnData.=' <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>';
      $returnData.= "<img   alt='" . $da['title'] . "'   src='" . $imagePath . "'  class=' popphoto itemBlock_imgae' />";

      $returnData.= " </div>";



      if ($this->mclass == "ui-block-a") {


      $this->mclass = "ui-block-b";
      } else {

      $this->mclass = "ui-block-a";
      }

      return $returnData;
      } */
}
