<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
namespace libs\utiles;
class rssClass {

    var $siteurl = "http://www.test.egzsport.com";
    var $Feeds = "/";
    var $util = "";
    var $table = "";
    var $db = "";
    var $cat_id = "0";
    var $site_path = "";
    var $nums = "10000";

    public function __construct($getdb, $util) {
        $this->db = $getdb;
        $this->util = $util;
    }

    function createrss() {

        $more = 'order by id DESC  limit 0,' . $this->nums;
        $data = $this->util->data->getXrefData($this->table, $this->cat_id, $more);


        $now = date("D, d M Y H:i:s T");
        $output = "<?xml version='1.0' encoding=\"utf-8\"?> 
            <rss version=\"2.0\">
                <channel>
                    <title>videos</title>
                    <link>" . $this->site_path . "/RSS.php</link>
                    <description>RSS</description>
                    <language>en-us</language>
                    <pubDate>$now</pubDate>
                    <lastBuildDate>$now</lastBuildDate>
                    <docs>" . $this->site_path . "</docs>
                    <managingEditor>empcland@gmail.com</managingEditor>
                    <webMaster>empcland@gmail.com</webMaster>
            ";


        foreach ($data as $line) {

            $dbCat = $this->util->data->getCategoryData('com_video_gallery_categories', $this->cat_id);



            $url = $this->util->createURL($this->table, $dbCat['alias'], $line['alias']);
            $output .= "<item>
          <title>" . $line['title'] . "</title>
          <link>" . $this->site_path . $url . "</link>
          <img>" . $this->site_path . "/uploads/images/" . $line['th_image'] . "</img>
          <description>" . $line['des'] . "</description>
          </item>";
        }
        $output .= "</channel></rss>";

        return $output;
    }

}

?>