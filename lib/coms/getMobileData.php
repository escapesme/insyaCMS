<?php

/**
 * Description of getmobileData
 *
 * @author empcl_000
 */

namespace libs\coms;

class getMobileData {

    var $lib;
    var $id;
    /*     * *
     * [query,html,form,Sesstion_data,images,videos,plugin,menu]
     */
    var $type;
    /*     * *
     * [['imagesCatId'],['videosCatId'],['pro']]
     */
    var $options;

    public function __construct($lib) {
        $this->lib = $lib;
    }

    function _render() {
        return $this->create();
    }

    function create() {


        $returnData = "";
        switch ($this->type) {
            case "query":
                $h = $this->renderQueryHTml();
                $returnData .=$h;
                $returnData .= $this->export($this->renderQueryHTml($this->options, "clear"), $this->renderQueryHTml($this->options, "full"));
                break;
            case "html":
                $returnData .= $this->html_render();
                break;
            case "form":
                $returnData .= $this->form_render();
                break;
            case "Sesstion_data":
                $returnData .= $this->Sesstion_data_render();
                break;
            case "images":
                $returnData .= $this->images_render();
                break;
            case "videos":
                $returnData .= $this->videos_render();
                break;
            case "plugin":
                $returnData .= $this->plugin_render();
                break;
            case "menu":
                $returnData .= $this->menu_render();
                break;
            case "mobile":
                $returnData .= $this->mobile_render();
                break;
        }
        return $returnData;
    }

    function _renderFromData() {

        $lib = $this->lib;

        $this->databulderData = $lib->db->get_row('sys_dataBluder', "*", "id='" . $this->id . "'");
        $valuesDatas = explode(";", $this->databulderData['data']);



        foreach ($valuesDatas as $d) {
            $valuesData = $lib->util->data->updateStringTorray($d);
            $this->type = $valuesData['type'];
            $this->options = $valuesData;
            $r.=$this->create();
        }
        return $r;
    }

// <editor-fold defaultstate="collapsed" desc="data">



    function plugin_render() {

        $lib = $this->lib;



        $pdata = urldecode($this->databulderData['plugins_options']);

        $parData = $lib->util->data->updateStringTorray($pdata);

        $parData = $lib->util->data->arrayVarUpdate($parData);
        $pdata = $lib->plugins->importFullPlugin($this->options['pluginTitle'], $parData);

        if ($this->options['returnType'] == "input") {
            $data = "<input type='hidden' value='" . $pdata . "' name='" . $this->options['returnTo'] . "' class='" . $this->options['returnTo'] . "' />";
        } else if ($this->options['returnType'] == "sesstion") {
            $_SESSION[$this->options['returnTo']] = $pdata;
        } else {

            $data = "<div><label>" . $this->options['returnTo'] . "</label>$pdata</div>";
        }



        return "<div class='type " . $this->options['pluginTitle'] . " plugintype'>" . $data . "</div>";
    }

    function images_render($pro) {
// $pro['effect']   $pro['Speed']  $pro['pauseTime'] $pro['directionNav'] $pro['pauseOnHover'] $pro['controlNavThumbs'] $pro['style']

        $lib = $this->lib;

        $more = " order by `order` DESC ";
        $datasql = $lib->util->getXrefData('com_images_gallery', $this->options['imagesCatId'], $more);
        $mydata = '<ul data-role="listview">';
        foreach ($datasql as $d) {
            $data = $d;
            $mydata .= $this->getImageDataBlock($this->options['pro'], $data);
        }
        $mydata .= '</ul>';
        return "<div class='type videostype'>" . $mydata . "</div>";
    }

    function getImageDataBlock($pro, $data) {

        $mydata .= ' 
        <div data-role="popup"  id="_' . $data['id'] . '"   data-corners="false">'
                . '<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>'
                . '<img class="popphoto" src=\'/uploads/images/' . $data['image'] . '\'  style="max-height:512px;" alt="Paris, France"> </div> ';


        $mydata .= '<li><a   data-rel="popup" data-transition="fade" class="_' . $data['title'] . '" href="#_' . $data['id'] . '"  >';
        $mydata .= ' <img rel="' . $data['title'] . '"   style=\'width:' . $pro['imageWidth'] . ';height:' . $pro['imageHeight'] . ';\' 
                  class=\'photo itemBlock_imgae\'
                src=\'/uploads/images/' . $data['image'] . '\' 
                alt=\'' . $data['title'] . '\'>';

        $mydata .= ' <h2 class=\'caption\' >' . $data['title'] . '</h2>';
        $mydata .= ' <p class=\'caption\' >' . $data['des'] . '</p>';
        $mydata .= '</a>';
        $mydata .= '</li>'
                . ''
        ;

        return $mydata;
    }

    function limit_text($text, $limit) {
        $words = explode(" ", $text);

        if (count($words) > $limit) {

            $text = implode(" ", array_splice($words, 0, $limit)) . "...";
        }

        return $text;
    }

    function Sesstion_data_render() {
        if ($this->options ['SesstionType'] == "var") {
            $data.="<div><label>" . $this->options ['SesstionName'] . "</label>" . $_SESSION[$this->options ['SesstionName']] . "</div>";
        } else {

            $data.=$this->arrayToHtml($_SESSION[$this->options ['SesstionName']]);
            return "<div class='type DataType'>" . $data . "</div>";
        }
    }

    function videos_render() {
// $pro['effect']   $pro['Speed']  $pro['pauseTime'] $pro['directionNav'] $pro['pauseOnHover'] $pro['controlNavThumbs'] $pro['style']

        $lib = $this->lib;

        $more = " order by `order` DESC ";
        $datasql = $lib->util->getXrefData('com_video_gallery', $this->options['videosCatId'], $more);
        $mydata = '<ul data-role="listview">';
        foreach ($datasql as $d) {
            $data = $d;
            $mydata .= $this->getvideosDataBlock($this->options['pro'], $data);
        }
        $mydata .= '</ul>';

        return "<div class='type videostype'>" . $mydata . "</div>";
    }

    function getvideosDataBlock($pro, $data) {



        $mydata .= ' 
        <div data-role="popup"  id="_' . $data['id'] . '"   data-corners="false">'
                . '<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>' .
                $this->lib->util->youtubePlay($data['url'], "450", "250") . '</div> ';


        $mydata .= '<li><a   data-rel="popup" data-transition="fade" class="_' . $data['title'] . '" href="#_' . $data['id'] . '"  >';
        $mydata .= ' <img rel="' . $data['title'] . '"   style=\'width:' . $pro['imageWidth'] . ';height:' . $pro['imageHeight'] . ';\' 
                  class=\'photo itemBlock_imgae\'
                src=\'/uploads/images/' . $data['image'] . '\' 
                alt=\'' . $data['title'] . '\'>';

        $mydata .= ' <h2 class=\'caption\' >' . $data['title'] . '</h2>';
        $mydata .= ' <p class=\'caption\' >' . $data['des'] . '</p>';
        $mydata .= '</a>';
        $mydata .= '</li>'
                . ''
                . '';

        return $mydata;
    }

    function form_render() {
        $lib = $this->lib;




        if ($this->options['renderType'] == "results") {
            $datar = $lib->db->get_row('com_form', '', 'ID=' . $this->options['formid']);


            $data.=$this->arrayToHtml($_SESSION[$datar['title']]);
        } else {

            $datar = $lib->db->get_row('com_form', '', 'ID=' . $this->options['formid']);
            $data.=$datar['des'];


           // $data.="<script>formToSeesstion('" . $datar['title'] . "');</script>";


            $data.= $lib->forms->getFiledsFormStrign("db", "com_form", $this->options['formid'], "data", "0");
        }

        return "<div class='type formtype'>" . $data . "</div>";
    }

    function mobile_render() {
        /* @var $lib  \libs\libs */
        global $lib;


        $datar = $lib->db->get_row('sys_mobile_application', '', 'ID=' . $this->options['mobileid']);
        $data.=$datar['des'];
       // $data.="<script>formToSeesstion('" . $datar['title'] . "');</script>";



        $data.= $lib->getMobileHTML->getString($datar["data"]);



        return "<div class='type formtype'>" . $data . "</div>";
    }
    
   
    function html_render() {

        $lib = $this->lib;
        $data = $lib->db->get_row('com_html', '', 'ID=' . $this->options['hmlid']);


        return "<div class='type htmltype'>" . $data['my_body'] . "</div>";
    }

    function menu_render() {

        $datasql = $this->lib->db->get_data('menu_itmes', '', 'cat_id=0  and parent_id=' . $this->options['menuId'] . "  `show`='1'  Order by `order` ");
        $data = "<div class='menu menu" . $pro['selecmenu'] . "'><ul>";
        foreach ($datasql as $d) {


            $pPermission = $this->lib->users->getMenuPermission();
            if (
                    $d['permission_all'] == "1" || $this->lib->util->chkInPermission($d['id'], $pPermission) == true
            ) {

                if ($this->lib->util->cities->getIsInSite($d['id'], $d['all_site'], "menu") == true) {







                    if ($d['openType'] == "1") {

                        $moreClass = "lightbox-url";
                    } else {

                        $moreClass = "";
                    }




                    if (trim($d['mei_main']) == "com_link") {

                        $href = $d['com_link'];
                    } else {

                        $href = $lib->util->createURLAL($d['mei_alias']);
                    }


                    if (trim($d['mei_alias']) == "Products") {

                        $href = "#";
                    }


                    $moreact = "";

                    if ($_GET['alias'] == $d['mei_alias']) {
                        $moreact = "li_active ";
                    } else {


                        $moreact = "";
                    };






                    $data .= '<li >
            <a  data-transition="' . $pro['pages_transition'] . '" class=\'' . $moreClass . '  __' . $d['id'] . ' my_menu_itm \' href=\'' . $href . '\'>';


                    if ($pro['viewImage'] == "1") {

                        $data .="<img src='/uploads/images/" . $d['mei_image'] . "'/>";
                    }

                    $data .= $d['mei_title'] . "</a></li>";
                }
            }
        }
        return $data;
    }

// </editor-fold>
}
?>


