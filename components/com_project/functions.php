<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();
global $projectSetting;

// <editor-fold defaultstate="collapsed" desc="query Update">

function upateQueryselect($data) {
    $r = "";
    /* @var $lib  libs\libs */
    global $lib;
    $s2 = explode("=", $data);
    $r = "";
    $type = $s2['0'];
    $value = $s2['1'];



    switch ($type) {
        case "don":
            //  $r = gettypeFromSetting("don", $value);
            break;
        case "date":
            //  $r = gettypeFromSetting("date", $value);
            break;
        case "update":
            //  $r = gettypeFromSetting("update", $value);
            break;
        case "keyword":
            ?> "

            <script>$(function() {
                    $(".selectBar").addClass("forserach");
                });</script>
            <style>
                .select_item{display: none !important;}
                .select_item.search{
                    display: block !important;  
                }
            </style>;
            <?php
            $r = " ( title like '%" . $value . "%' or  des like '%" . $value . "%' )";
            break;
        case "cat":



            $cats = $lib->db->get_row("com_project_catgories", "", "alias='" . trim($value) . "'");




            $ids = $lib->util->data->getXrefData("com_project", $cats['id']);


            $r = "";
            $q = "";
            $i = 0;
            foreach ($ids as $id) {
                if ($i == 0) {

                    $q .= " id='" . $id['id'] . "'  ";
                } else {
                    $q .= " or id='" . $id['id'] . "'  ";
                }

                $i++;
            }




            if ($q == "") {

                $r = "1<>1";
            } else {
                $r .="(" . $q . ")";
            }


            break;
    }


    return $r;
}

function com_project_getData($id) {


    /* @var $lib  libs\libs */
    global $lib;


    if (isset($_GET['search'])) {

        $ss = explode("-", $_GET['search']);
        $q = "";


        for ($i = 0; $i < count($ss); $i++) {

            $q .= upateQueryselect($ss[$i]);
        }



        $r = $lib->db->get_data("com_project", "*", $q);
    } else {
        if ($id != "") {
            $r = $lib->util->data->getXrefData("com_project", $id);
            
            
            
            
            
        } else {

            $r = $lib->db->get_data("com_project", "*", "");
        }
    }
    
    return $r;
}

// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Blocks">
// <editor-fold defaultstate="collapsed" desc="search Bar">

function getSelectloctions($t, $s) {

    /* @var $lib  libs\libs */
    global $lib;
    $r = "<option>$t</option>";

    $data = $lib->db->get_data("com_project_catgories");

    foreach ($data as $d) {
        $r.="<option value='" . $d['alias'] . "'>" . $d['title'] . "</option>";
    }

    return $r;
}

function getSelectupdates($t, $s) {

    /* @var $lib  libs\libs */
    global $lib;
    $r = "<option>$t</option>";
    $v = explode(",", $s['select_update_value']);
    $t = explode(",", $s['select_update_text']);
    for ($i = 0; $i < count($v); $i++) {
        $r.="<option value='" . $v[$i] . "'>" . $t[$i] . "</option>";
    }

    return $r;
}

function getSelectCata($t, $s) {

    /* @var $lib  libs\libs */
    global $lib;
    $r = "<option>$t</option>";

    $data = $lib->db->get_data("com_project_catgories");

    foreach ($data as $d) {
        $r.="<option value='" . $d['alias'] . "'>" . $d['title'] . "</option>";
    }

    return $r;
}

function getSelectdons($t, $s) {

    /* @var $lib  libs\libs */
    global $lib;
    $r = "<option>$t</option>";
    $v = explode(",", $s['select_don_value']);
    $t = explode(",", $s['select_don_text']);
    for ($i = 0; $i < count($v); $i++) {
        $r.="<option value='" . $v[$i] . "'>" . $t[$i] . "</option>";
    }
    return $r;
}

function gettypeFromSetting($type, $getvAlue) {
    global $projectSetting;

    $v = explode(",", $projectSetting['select_' . $type . '_value']);
    $t = explode(",", $projectSetting['select_' . $type . '_text']);

    for ($i = 0; $i < count($v); $i++) {

        if ($v[$i] == $getvAlue) {
            $r.= $t[$i];
        }
    }
    return $r;
}

function getSelectdates($t, $s) {

    /* @var $lib  libs\libs */
    global $lib;
    $r = "<option>$t</option>";
    $v = explode(",", $s['select_date_value']);
    $t = explode(",", $s['select_date_text']);
    for ($i = 0; $i < count($v); $i++) {
        $r.="<option value='" . $v[$i] . "'>" . $t[$i] . "</option>";
    }
    return $r;
}

function getfTitle($type, $value) {
    /* @var $lib  libs\libs */
    global $lib;
    $r = "";
    switch ($type) {
        case "keyword":
            $r = $value;
            break;
        case "don":
            $r = gettypeFromSetting("don", $value);
            break;
        case "date":
            $r = gettypeFromSetting("date", $value);
            break;
        case "update":
            $r = gettypeFromSetting("update", $value);
            break;


        case "cat":


            $cats = $lib->db->get_row("com_project_catgories", "", "alias='" . $value . "'");


            $r = $cats['title'];



            break;
            $r = gettypeFromSetting($type, $value);

        default:
            break;
    }





    return $r;
}

function getfiltervar($l, $s) {

    if (isset($_GET['search'])) {
        $d = $_GET['search'];


        $ss = explode("-", $d);

        for ($i = 0; $i < count($ss); $i++) {


            $s2 = explode("=", $ss[$i]);

            if ($s2[0] == $l) {

                $t = $s2[1];
            }
        }
        if ($t != "") {

            $r = "<div class='label'>" . getfTitle($l, $t) . " <i  data-type='$l' class=\"labelclose\"></i></div>";
        }
    }
    return $r;
}

function com_project_getsearchBar($l, $s) {
    /* @var $lib  libs\libs */
    global $lib;

    $r = "";

    $r = "<script>updateQselect('" . $_GET['alias'] . "', '" . $_GET['search'] . "');</script>"
            . "<div class='selectBar'><div class='select_item'>"
            . "<label>" . $l['selectcat'] . "</label>"
            . "<div><select data-type='cat' class='selectq cat'>" . getSelectCata($l['selectcat'], $s) . "</select>" . getfiltervar("cat") . "</div>"
            . "</div>";
    $r .= "<div class='select_item'>"
            . "<label>" . $l['selectloction'] . "</label>"
            . "<div><select data-type='location' class='selectq cat'>" . getSelectloctions($l['selectloction'], $s) . "</select>" . getfiltervar("location") . "</div>"
            . "</div>";

    $r .= "<div class='select_item'>"
            . "<label>" . $l['selectdon'] . "</label>"
            . "<div><select data-type='don' class='selectq cat'>" . getSelectdons($l['selectdon'], $s) . "</select>" . getfiltervar("don") . "</div>"
            . "</div>";

    $r .= "<div class='select_item'>"
            . "<label>" . $l['selectdate'] . "</label>"
            . "<div><select data-type='date'  class='selectq cat'>" . getSelectdates($l['selectdate'], $s) . "</select>" . getfiltervar("date") . "</div>"
            . "</div>";

    $r .= "<div class='select_item'>"
            . "<label>" . $l['selectupdate'] . "</label>"
            . "<div><select data-type='update' class='selectq cat'>" . getSelectupdates($l['selectupdate'], $s) . "</select>" . getfiltervar("update") . "</div>"
            . "</div>"
            . "";

    $r .= "<div class='select_item search'>"
            . "<label>" . $l['search'] . "</label>"
            . "<div><div><input class='prosearch' type='text' value='' />"
            . "<input type='button' class='buttton dosearch'  value='" . $l['search'] . "' />"
            . "</div><span>" . $l['searchmsg'] . " \" " . trim(getfiltervar("keyword")) . " \"</span></div>"
            . "</div>"
            . "";

    $r .= "</div>";


    return $r;
}

// </editor-fold>
// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Item">

function com_project_item($id, $l, $settings) {

    /* @var $lib  libs\libs */
    global $lib;


    $data = $lib->db->get_row("com_project", "*", "alias='" . $id . "'");

    $catdata = $lib->db->get_row("com_project_catgories", "*", "id='" . $data['id'] . "'");


    $catp = $lib->colltions->getPluginData("com_project_catgories", $catdata['id']);

    $p = $lib->colltions->getPluginData("com_project", $data['id']);





    $lib->util->page->updateTitle($data['title'], "<div class='forpage'><div class='pageTitleimage'><img src='/uploads/images/" . $data['image'] . "' alt='" . $data['title'] . "' /></div>" . $data['title'] . "<div class='d-now'></div></div>", "title-web");






    $r .=' <div class="project_all datatabs">'
            . '<ul class="tabstitles projectData">'
            . '<li data-show="project">' . $l['project'] . '</li>'
            . '<li data-show="comment">' . $l['comment'] . '</li>'
            . '</ul>';



    $r .= '<div class="tabsbodys">';






    $r .= '<div class="project  tabsbody">';

    $r .= "<div class='itemTitle'>" . $data['title'] . "</div>";
    $r .=com_project_vidioBlock($data, $l);


    $lib->plugins->importPlugindB("plg_PageData", $p, $o);
    $r .=com_project_getPrices($p, $l, $id);

    $r .= "<div class='item'>";
    $r .= "<div class='blackImage'><img src='/uploads/images/" . $data['image'] . "' alt='" . $data['title'] . "' /></div>";
    $r .= "<div class='itemlocation'>" . $data['location'] . "</div>";


    $o['type'] = "com_project";
    $o['id'] = $data['id'];
    $o['cart'] = $settings['cart'];
    $r.= $lib->plugins->importPlugin("plg_cart", $settings, $o);


    $r .= "<div class='itemDes'>" . $data['des'] . "</div>";

    $r .= getmodules($data, $l, $p);

    $r .= "</div>";



    $r .= "<div class='clearfix'></div>";

    $r .= "</div>";






    $r .= '<div class="comment tabsbody">';

    echo "plg_comments", "enabled__" . $settings['commet_users'] . ";users__" . $settings['commet_type'] . ";mytype__" . $settings['cart'] . ";ob_type__com_project;ob_id__" . $data['id'];

    $r .=$lib->plugins->importPlugin("plg_comments", "enabled__" . $settings['commet_users'] . ";users__" . $settings['commet_users'] . ";mytype__" . $settings['commet_type'] . ";ob_type__com_project;ob_id__" . $data['id']);




    $r .= "<div class='clearfix'></div>";

    $r .= "</div>";


    $r .= "</div>";
    return $r;
}

function getmodules($data, $l, $p) {
    $r .="<div class='pro_models'>";
    $r .=pro_mod_char();


    $r .=pro_mod_sourec($l, $p);
    $r .=pro_mod_map($data['map_position'], $data['zoom'], $l);
    $r .=pro_mod_don();
    $r .=pro_mod_users($data['id'], $l);


    $r .="</div>";
    return $r;
}

function pro_mod_map($p, $z, $lng) {
    $inputID = "map1";







    $newp = str_replace(";", "", $p);

    $newp = str_replace("(", "[", $newp);

    $newp = str_replace(")", "]", $newp);


    $r = '<div class="pro_model map">'
            . '<div class="title">' . $lng['map'] . '</div>'
            . '<div style="width:100%;height:100%" id="' . $inputID . '_map" class="' . $inputID . '_map gmap3"></div>          
<script>viewMap("' . $inputID . '","' . $p . '",' . $z . ',' . $newp . ');</script></div>
';
    return $r;
}

function pro_mod_char($data) {
    /* @var $lib  libs\libs */
    global $lib;



    $data = $lib->plugins->importPlugin("plg_share", "share__1;sharfacebook__1;shartwitter__1;sharinlink__1;shargoogle__1");



    $r = '<div class="pro_model">' . $data . '</div>';
    return $r;
}

function pro_mod_sourec($l, $p) {

    /* @var $lib  libs\libs */
    global $lib;



    $w = $lib->util->data->arraytwhere($p['source'], "id", "string");


    $all = $lib->db->get_data("plg_rescores", "*", $w);
    $data = "<div class='resorce'>";
    $data .= "<h3 class='title'>" . $l['sorcetitle'] . "</h3>";
    foreach ($all as $a) {


        $data .= "<div class='row'><h3 class='title'>" . $a['title'] . "</h3>";
        $data .= "<div><img class='images'  src='/uploads/images/" . $a['image'] . "' /></div>";
        if ($a['url'] != "") {
            $data .= "<div > <a  href='/main/do/" . $a['id'] . "/res/ '  class='lightbox-url'>" . $l['gomore'] . "</a></div></div>";
        }
    }
    $data.="</div>";
    $r = '<div class="pro_model">' . $data . '</div>';
    return $r;
}

function pro_mod_users($id, $lng) {
    $data = "";
    /* @var $lib  libs\libs */
    global $lib;




    $all = $lib->db->get_data("plugincart_order_item", "*", "item_id=" . $id . " limit 0,4");





    foreach ($all as $l) {



        $u = $lib->users->getUserBay("id", $l['user_id']);
        $data .="<div class='urow'><div class='name'>" . $u['name'] . "</div>";
        $data .="<div class='created'>" . $l['created'] . "</div>";


        $data .="<div class='image'><img src='/uploads/images/" . $u['image'] . "' /></div></div>";
    }




    if (is_array($all) && count($all) > 0) {

        $r = '<div class="pro_model"><div class="title">ll' . $lng['users'] . '</div>' . $data . '</div>';
    }





    return $r;
}

function pro_mod_don() {
    $data = "<div class='gatdon'></div>";
    $r = '<div class="pro_model nobb">' . $data . '</div>';
    return $r;
}

function com_project_vidioBlock($data, $l) {


    /* @var $lib  libs\libs */
    global $lib;



    $datashaer = $lib->plugins->importPlugin("plg_share", "share__1;sharfacebook__1;shartwitter__1;sharinlink__1;shargoogle__1");



    $r = '<div class="videodataShaer hidden">'
            . '<div class="videodataShaerdata tocenter"><br/>'
            . "<div class='VideoShaerMsg'>".$l['videoShaerMsg'] . '</div>'.
            
            $datashaer
            . "<div class='line'></div>"
            . "<div class='closeVideoShaerMsg'><div class='meclose doclose'></div>" . $l['closeVideoShaerMsg'] . '</div>
                </div>
                </div>';

    $r .= "<div class='videodata'>"
            . "<a href='" . $lib->util->youtubereturneurl($data['video']) . "' class='lightbox-videome ply_bt'></a>";
    $r .= "<div class='dec'>" . $lib->plugins->importPlugin("plg_projectdata", "id__" . $data['id'] . ";type__all") . "</div>";
    $img = "/uploads/images/" . $data['th_image'] . "";
    $r .= "<div class='video' style='width:100%;height:100%'>";



    $r .=" <img  style='width:100% ;height:100%' src='$img' />";


    $r.="</div>";
    $r.="</div>";
    return $r;
}

function com_project_getPrices($p, $l, $id) {

    $prs = explode(",", $p["price"]);
    $dec = explode(",", $p["des"]);
    $act = explode(",", $p["act"]);

    $r = "<h3 class='priceTitle'>" . $l['priceTitle'] . "</h3>";


    
    



    $r.="<div class='pricing'>";
    $i = 0;


    foreach ($prs as $pr) {
        if ($pr != "") {

            $m = "";
            if ($act[$i+1] == "1") {
                $m = "act";
            } else {
                $m = "";
            }

            
            $mydes=$dec[$i+1];
            $r.="<div class='$m price update'>"
                    . "<input type='hidden' class='dec' value='$mydes'/>"
                    . "<span class='p'> $pr </span><br /> ج.م"
                    . "<div class='parrow'></div></div>";
            $i++;
        }
    }


    $r.="<div class='price more'>"
            . "" . $l["more"] . ""
            . "<div style='display:none' class='addData'>"
            . "" . $l["moremsg1"] . "<input type='text' class='moreprice' value='0' />" . $l["moremsg2"] . ""
            . "</div>"
            . "<div class='parrow'></div></div>";

    $r.="</div>";



    $r .= "<div  data-item='$id' class='pricemsg'>"
            . "<div class='loading'></div>"
            . "<div class='data'></div></div>";

    return $r;
}

// </editor-fold>
