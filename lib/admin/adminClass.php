<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

namespace libs\admin;

require_once('adminactions.php');

class adminClass extends adminactions {

    var $thisXref;

    //put your code herepageinfo
    public function __construct($lib) {
        parent::__construct($lib);
    }

    var $numberOfColumns = 12;

    function crateBlockHtml($title, $data, $collapse = "", $class = "") {


        $c['blockplg']['class'] = $class;
        $c['blockplg']['type'] = 'block';
        $c['blockplg']['collapse'] = $collapse;
        $c['blockplg']['name'] = 'blockPorperites';
        $c['blockplg']['title'] = $title;
        $this->formes->filds = $c;
        $retdate .= $this->formes->_render_form();
        $this->formes->filds = null;

        $retdate.= $data;

        $c2['endblock']['type'] = 'endblock';
        $c2['endblock']['name'] = 'endblockPorperites';
        $this->formes->filds = $c2;
        $retdate .= $this->formes->_render_form();
        $this->formes->filds = null;


        return $retdate;
    }

    function get_html() {






        // $this->mode;
        if ($this->mode == "edit") {



            $this->edata = $this->mydb->get_row($this->table_name, "*", "id=" . $this->editID);

            $eNames = $this->changEditNames;
            $eValues = $this->changEditValues;

            $eNames = explode(";", $eNames);
            $eValues = explode(";", $eValues);


            for ($i = 0; $i < count($eNames); $i++) {

                if ($eNames[$i] != null && trim($eNames[$i]) != "") {
                    $this->edata[$eNames[$i]] = $eValues[$i];
                }
            }
        }


        $this->AddToFormName = str_replace("=", "", $this->listOptions['addtolink']);

        if ($this->options['mode']['status'] == "tabs" && $this->tabheader != false) {

            $html = "<div class='list_tabs datatabs'>"
                    . "<ul  class='tabstitles index'> <li data-show='index1'>" . $this->util->updatCodes($this->my_title) . "</li></ul>"
                    . "<div class='alltabsbody index'>"
            ;
        }


        switch ($this->mode) {



            case 'edit':

                if ($this->users->getUserPermission("canedit") == "1") {
                    $html.= $this->_render_edit();
                } else {


                    return $this->util->getAccessDenied();
                }

                break;
            case 'add':
                if ($this->users->getUserPermission("canadd") == "1") {

                    $html.= $this->_render_add();
                } else {
                    $html.= $this->util->getAccessDenied();
                }



                break;
            case 'list':
            case 'trash':
                if ($this->users->getUserPermission("candelete") == "1") {

                    $html.= $this->_render_list();
                } else {
                    $html.= $this->util->getAccessDenied();
                }
                break;
            case 'listBody':
                $html.= $this->listhtml();
                break;
            case 'viewList':

                break;
            case 'delete':
                break;
        }

        if ($this->options['mode']['status'] == "tabs" && $this->tabheader != false) {

            $html.="</div>";
        }


        $html .= "<textarea class='pageinfo'>" . str_replace("file=admin/update_list&", "", explode("?", $_SERVER['REQUEST_URI'])[1]) . "</textarea>";


        return $html;
    }

    function _render_add() {


        $this->updateNew();



        return $this->toolbar() . $this->mssages . $this->add_form();
    }

    function _render_edit() {


        $this->updateEdit();
        return $this->toolbar() . $this->mssages . $this->eidt_form();
    }

    // <editor-fold defaultstate="collapsed" desc="Home List">



    function getColwidtth($num) {
        if ($num == "0" || $num == null || $num == "" || empty($num)) {
            $num = 1;
        }



        $M = 100 / $this->numberOfColumns;


        $th_wid = $num * $M;

        return $th_wid . "%;";
    }

    function gteplugins($position = "list") {
        $r = "";



        foreach ($this->plugins as $k => $v) {

            if ($v['position'] == $position || $v['position'] == "all") {

                $name = $v['name'];
                $purl = $this->foldersMap->admin_plugins_folder . "/" . $name;

                $lng = $this->lib->util->importfilesFroAdmin($purl);


                require_once $purl . '/index.php';
                $options = $this->lib->util->data->updateStringTorray($v['options']);
                $field = $this->util->readXmlAttributes($purl . '/porperties.xml', $this->lib->variables->xml_fldestsgeTag);

                $r .= $name($options, $lng, $field);
            }
        }







        return $r;
    }

    function _render_list() {

        $myurl = $this->util->getmyurl("admin", $mode);


        $ordertype = "ASC";

        if (isset($_GET['ordertype']) && $_GET['ordertype'] == "ASC") {

            $ordertype = "DESC";
        }

        $orderby = $_GET["orderby"];



        $listID = $this->util->getUniqueId();

        if ($this->options['mode']['status'] == "lightbox") {

            $atatus = "ajax lightbox";
        } else if ($this->options['mode']['status'] == "tabs") {
            if ($this->tabheader != false) {
                $atatus = "ajax tabsstatus tabsbody";
            } else {

                $atatus = "ajax tabsstatus ";
            }
        } else {
            $atatus = "normal";
        }



        $html.="<div data-listid='" . $listID . "' "
                . " id='" . $listID . "' data-id='" . $listID . "'"
                . " data-name='list_form" . $this->table_name . $this->AddToFormName . "'  "
                . " data-table='" . $this->table_name . "'"
                . " class='index1 $listID $atatus' >";
        $this->mackupdate();


        $html.= $this->toolbar() . $this->mssages;
        $html.= $this->listhtml();
        $html.="<div class='clearfix'></div></div>";




        return $html;
    }

    function listhtml() {



        $html.="<div data-info='" . $this->util->getmyurl("admin") . "' data-id='" . $listID . "' id='" . $listID . "' class='aj listindxAll '>";


        $myurl = $this->util->getmyurl("admin", $mode);


        $ordertype = "ASC";

        if (isset($_GET['ordertype']) && $_GET['ordertype'] == "ASC") {

            $ordertype = "DESC";
        }

        $orderby = $_GET["orderby"];



        $html.= $this->gteplugins();

        $listID = $this->util->getUniqueId();




        $html.="<div data-info='" . $this->util->getmyurl("admin") . "' data-id='" . $listID . "' id='" . $listID . "' class='listindx '>
            
            

<div class='block-header'>
<h1>" . $this->util->updatCodes($this->my_title) . "</h1>
    <span></span>
    </div>
    
<div   class=' block-content'>

<div class=\"select_bar\">" . $this->getSelectData() . "</div>";
        $html.= '<form action="" id="list_form' . $this->table_name . $this->AddToFormName . '" class="' . $this->table_name . '"  method="post" >';





        $html.= '<div class=\'divTable  adminlisttyble\'><div class="divRow head">';


        $html.= '  
            <input type="hidden" class="updatefield"  name="updatefield" value="" />
            <input type="hidden" class="updatetable"  name="updatetable" value="" />
            <input type="hidden" class="updateids"  name="updateids" value="" />
            <input type="hidden" class="updatevalue"  name="updatevalue" value="" />';
//$this->table_properties[$list]['type']
// <editor-fold defaultstate="collapsed" desc="THS">


        $html.="<div class='levels divCell'></div>";

        $html.= "<div style='width:" . $this->getColwidtth(1) . "' class=\"chos_th divCell\">"
                . "<input type='checkbox' name=\"selectAllrows\"   id=\"selectAllrows\" class='selectAllrows checkbox scheckbox' />"
                . "<label for=\"selectAllrows\" class='forcheckbox'></label></div>";

        if ($_GET[$this->variables->url_mode] != 'trash' && $this->listOptions['actions'] != "false") {
            $html.="<div style='width:" . $this->getColwidtth(1) . "' class=\"optins_th actions divCell\">" . $this->variables->list_options_titles . "</div>";
        }

        $th_wid = "auto";




        foreach ($this->list as $list => $v) {
            if ($this->table_properties[$list]['type'] != "getXrefData") {
                // <editor-fold defaultstate="collapsed" desc="thtype">



                $myname = $this->table_properties[$list]['name'];
                $myname = str_replace("[]", "", $myname);
                $more = "";



                switch ($this->table_properties[$list]['type']) {
                    case "order" :
                        if ($this->users->getUserPermission("canedit") == "1") {
                            $more = "<div title='Save' id=\"" . $myname . "__order\"  data-table='" . $this->table_name . "'   data-field='" . $myname . "' class=\"thbutton __order doenable  " . $myname . "_order\">"
                                    . "<i class=\"fa fa-floppy-o\"></i></div>";
                        }

                        break;
                    case "enable_one" :
                    case "enable" :

                        if ($this->users->getUserPermission("canedit") == "1") {
                            $more = "<div title='Save' id=\"" . $myname . "__enable\"  data-table='" . $this->table_name . "'   data-field='" . $myname . "'  class=\"thbutton __enable doenable  " . $myname . "_enable\">"
                                    . "<i class=\"fa fa-floppy-o\"></i></div>";
                        }
                        break;
                }


                if ($this->table_properties[$list]['editable'] == "true") {

                    $more = "<div title='Save'   data-table='" . $this->table_name . "'  data-field='" . $myname . "' data-type='" . $this->table_properties[$list]['type'] . "'  class=\"thbutton save  doenable \">"
                            . "<i class=\"fa fa-floppy-o\"></i></div>";
                }

                $this->util->getmyurl("admin", "orderby,ordertype");
                // </editor-fold>


                if ($orderby == $myname) {
                    $moreClass = "selected";
                    if ($ordertype == "ASC") {
                        $orderTypeIcone = "<i class=\"fa fa-angle-up\"></i>";
                    } else {
                        $orderTypeIcone = "<i class=\"fa fa-angle-down\"></i>";
                    }
                } else {
                    $orderTypeIcone = "<i class=\"fa fa-angle-up\"></i>";

                    $moreClass = "";
                }





                $html.= "<div class='divCell $moreClass' id='$myname' class='adminlisttybleth'  style='width:" . $this->getColwidtth($v["list-width"]) . "'>"
                        . "<a   href='" . $this->util->getmyurl("admin", "orderby,ordertype") . "&orderby=" . $myname . "&ordertype=" . $ordertype . "'  > $orderTypeIcone</a>"
                        . "<div class=\"th_title\">" . $this->util->updatCodes($this->table_properties[$list]['title']) . "</div>"
                        . "" . $more . "</div>";
            }
        }
        // </editor-fold>




        $html.="</div><div class='divtbody'>";

        $numrow = 0;

        $html.=$this->get_trs();

        $this->thislistleve = 0;
        $html.="</div></div>";

        $html.="</form></div></div>   "
                . "<script>   "
                . "$(function(){ innert_update(\"list_form" . $this->table_name . $this->AddToFormName . "\"); "
                . "submit(\"list_form" . $this->table_name . $this->AddToFormName . "\");}) </script>" .
                $this->list_numder();

        $html.="<div class='clearfix'></div></div>";
        return $html;
    }

    var $riss;

    function updateTdData($data, $dval) {

        $this->numrow++;

//
        $myname = $data['name'];
        $typestyle = $this->util->odd_or_even($this->numrow);

        $html = $this->getTags($dval["id"], $this->table_name, $data) . "<div class='tdata'>";

        switch ($data['type']) {
            case "order" :


                $filds = array(
                    $snam => array("type" => "input", "moreAttra" => "data-id='" . $dval['id'] . "'", "value" => $dval[$myname], "name" => $myname, "id" => $myname . "__" . $dval['id'], "class" => $myname . "__order input__" . $dval['id'])
                );
                $this->formes->filds = $filds;
                $html.= "<input type='hidden'   data-id='" . $dval['id'] . "' value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />"
                        . $this->formes->_render_form() . "";
                break;

            case "pic" :
            case "image":
                $th_width = '23px;';

                $src = $this->upload_to . $dval[$data['name']];


                if (!is_file($src)) {

                    $src = "images/photo_not_available.jpg";
                }

                $html.=


                        "
                            <input  type='hidden' data-id='" . $dval['id'] . "' value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />
                               <img class='imgcl' src=' " . $src . "' />";
                break;

            case "enable_one" :
            case "enable" :


                if ($dval[$myname] == "1") {
                    $s = 'checked="checked"';
                } else {
                    $s = '';
                }
                $html.= "<input type='hidden' data-id='" . $dval['id'] . "' value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />";
                $html.= ' <input type="checkbox" data-id="' . $dval['id'] . '"  name="' . $myname . '"  id = "' . $myname . "__" . $dval['id'] . '"  class="' . $myname . " " . $myname . "__enable input__" . $dval['id'] . ' ios" ' . $s . '/>';


                break;



            case "date" :





                $html.= "
                            <input  data-id='" . $dval['id'] . "' type='hidden' value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />
                              " . $slpn . $this->util->dateFromdb($dval[$data['name']]);

                break;

            case "editor" :





                $html.= "
                            <a id='" . $this->table_name . "__" . $data['name'] . "__" . $dval['id'] . "' class=\"show_body_html\">
                          <i class=\"fa fa-search-plus\"></i>
                                </a>
                                ";

                break;


            case "files" :
                $fs = $dval[$data['name']];
                $files = explode(",", $fs);

                foreach ($files as $d) {
                    if ($d != "") {
                        $html.="<a  style='margin:2px' target='_blank' href='/uploads/userdocs/$d'><i title='$d' class=\"fa fa-file-text\"></i></a>";
                    }
                }
                break;
            case "user_data" :



                $gdata = $this->mydb->get_row("com_users", "", "id='" . $dval[$data['name']] . "'");

                $gdata2 = $this->mydb->get_row("com_users_fiz", "", "user_id='" . $gdata["id"] . "'");


                $gdata = array_merge($gdata, $gdata2);
                $gs = explode(",", $data['get']);

                foreach ($gs as $g) {
                    $html.= "<span style='margin:2px'>" . $gdata[$g] . "</span>";
                }




                break;
            case "select" :



                if ($data['editable'] == "true") {
                    $data['value'] = $dval[$data['name']];
                    $data['getinput'] = "true";

                    $data['moreAttra'] = "data-id='" . $dval['id'] . "'";

                    $filds = array($data);
                    $this->formes->filds = $filds;
                    $html .= $this->formes->_render_form();
                } else {



                    if ($data['select_type'] == "DB" && $data['select_value'] != "") {
                        $gdata = $this->mydb->get_row($data['select_data'], "", $data['select_value'] . "='" . $dval[$data['name']] . "'");

                        $html.= "
                            <input  data-id='" . $dval['id'] . "'  type='hidden' value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />
                                
                                " . $slpn . " " . $gdata[$data['select_text']];
                    } else {
                        $html.= "
                            <input  data-id='" . $dval['id'] . "'  type='hidden' value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />
                               
                                " . $slpn . " " . $dval[$data['name']];
                    }
                }


                break;






            case "list" :
                if ($data['select_type'] == "DB" && $data['select_value'] != "") {
                    $html.= "
                            <input  data-id='" . $dval['id'] . "'  type='hidden' value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />
                                
                                " . $slpn;


                    $vals = explode(",", $dval[$data['name']]);


                    $i = 0;

                    foreach ($vals as $v) {
                        $i++;

                        $coma = ",";

                        if ($i == count($vals)) {
                            $coma = "";
                        }

                        $gdata = $this->mydb->get_row($data['select_data'], "", $data['select_value'] . "='" . $v . "'");
                        $html.= $gdata[$data['select_text']] . $coma . " ";
                    }
                } else {


                    $html.= "
                            <input  data-id='" . $dval['id'] . "' type='hidden' value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />
                                " . $slpn . " " . $dval[$data['name']];
                }
                break;

            case "getXrefData" :


                $html.= "</div>";

                $data = "<div>" . $this->getXerfDataInput($dval['id'], $data) . "</div>";

                $this->numrow++;
                $html.= "<div  data-id='" . $dval['id'] . "'  id='  tr__" . $dval['id'] . "' class=\"xrefRows divRow chtr_" . $id . " " . $typestyle . "  " . $islast . "  " . $class . " tr__" . $dval['id'] . "\" >";
                $html.= "<div class=' xrefdivCell divCell'>" . $data . "</div>"; //. "</div>";
                // $typestyle = $this->util->odd_or_even($this->numrow);
                break;






            default :


                switch ($data['view']) {

                    case "input" :
                        $html.= ' <input  data-id="' . $dval['id'] . '"  data-value="' . $dval[$data['name']] . '" '
                                . ' name="' . $myname . '"  id = "' . $myname . "__" . $dval['id'] . '"  class=" ' . $data['class'] . ' ' . $myname . "_input\"  "
                                . ' value ="' . $dval[$data['name']] . '"'
                                . ''
                                . ' />';


                        break;
                    default :
                        $html.= "
                            <input  data-id='" . $dval['id'] . "' data-type='" . $data['type'] . "'  type='hidden'   value='" . $dval['id'] . "__" . $myname . "__" . $data['type'] . "'    class='input__" . $dval['id'] . "__info' />
                                <span title='" . $dval[$data['name']] . "' />" . $slpn . " " . $dval[$data['name']] . "</span>";
                        break;
                }
        }
        $html.="</div>";
        return $html;
    }

    function getTags($id, $table, $alldata) {
        $r = "";

        if ($alldata['showTags'] == "true") {
            $dataTages = $this->mydb->get_data("sys_tags_xref", "*", "obj_id='" . $id . "' and `obj_alias`='" . $table . "'   order by `tag_id` ");

            $data = '<div class=\'_' . $id . ' tags\'>';




            foreach ($dataTages as $tag) {

                $d = $this->mydb->get_row('sys_tags', "*", "id=" . $tag['tag_id']);

//                $data .= '<li  style="background:#' . $d['color'] . '"  data-id="' . $d['id'] . '" id="' . $d['id'] . '" ><i  class="fa fa-tag"></i>' . $d['title'] . '</a></li>';

                $data .= '<li  style="background:#' . $d['color'] . '"  data-id="' . $d['id'] . '" id="' . $d['id'] . '" ><i  class="fa fa-tag"></i>' . $d['title'] . '</a></li>';
            }





            $data .= '</div>';
        }
        return $data;
    }

    function get_trs($id = "0", $class = "") {
        $data = $this->getdata("", $id);

        $html = "";




        ////  print_r($this->riss);

        if ($id != "0") {
            $slp = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='mlev __level" . $id . count($data) . " l__$id'></span>";
            for ($i = 1; $i <= $this->thislistleve; $i++) {
                $slp .= "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='mlev'></span>";
            }

            $slp .= "<i class=\"fa fa-minus\"></i><i class=\"fa fa-minus\"></i><i class=\"fa fa-chevron-right\"></i>";
        }


        $this->riss[$id] = 0;


        foreach ($data as $dval) {
            $this->numrow++;



            $typestyle = $this->util->odd_or_even($this->numrow);
            $islast = "";

            if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] = "yes"
            ) {


                echo '<style>td.levels ,th.levels{display:block;}</style>';

                $data_test = $this->mydb->get_row($this->table_name, " max(id) as mid ", "cat_id=" . $dval["cat_id"]);

                if ($data_test['mid'] == $dval["id"]) {
                    $islast = "last";
                } else {

                    $islast = "";
                }
            } else {

                $this->thislistleve = 0;
            }



            $moreClass = "";
            if ($this->listOptions["xrefopend"] == "true") {
                $moreClass = "opened";
            }


            $html.= "<div data-id='" . $dval['id'] . "' data-table='" . $this->table_name . "' id=' tr__" . $dval['id'] . "' class=\"divRow $moreClass chtr_" . $id . " " . $typestyle . "  " . $islast . "  " . $class . " tr__" . $dval['id'] . "\" >";

            $coll = "";


            if ($this->listOptions["xrefopend"] == "false") {

                $coll = "<li class=\" xrefopen fa fa-plus-square\"></li>";
            }
            $html.= "<div class='levels  divCell'></div>";

            $html.= "<div  style='width:" . $this->getColwidtth(1) . "' class=\"chos_th divCell\">" . $coll
                    . "<input type=\"checkbox\" id=\"__" . $dval['id'] . "\"  name=\"ids\" class=\"checkbox scheckbox ids\" value=\"" . $dval['id'] . "\" />"
                    . "<label for=\"__" . $dval['id'] . "\" class='forcheckbox'></label></div>";

            if ($_GET[$this->variables->url_mode] != 'trash' && $this->listOptions['actions'] != "false") {
                $html.= "<div  style='width:" . $this->getColwidtth(1) . "' class=\" divCell actions\" class=\"optins_th td__" . $dval['id'] . "\"> "
                        . "";

                // <editor-fold defaultstate="collapsed" desc="actions">

                if ($this->users->getUserPermission("canedit") == "1" && $this->listOptions['actions'] != "false") {


                    $moreurl = $this->util->getmyurl("admin", "") . "&" . $this->variables->url_mode . "=edit&" . $this->listOptions['addtolink'] . "&" . $this->variables->url_id . "=" . $dval['id'];


                    if ($this->options['mode']['status'] == "lightbox" || $this->options['mode']['status'] == "tabs") {


                        $moreurl = "getmian.php" . $moreurl;
                    }

                    $title = trim($this->util->updatCodes($this->my_title));


                    $html.= "   <a   data-title='" . trim($this->my_title) . " Edit' "
                            . " data-info='view=" . $_GET['view'] . "&mode=edit&id=" . $dval['id'] . "' href='" . $moreurl . "'"
                            . " id='edit__" . $dval['id'] . "' class='edit_option' "
                            . " title='" . trim($this->my_title) . " Edit' >
                " . "<li class=\"fa fa-pencil\"></li> "
                            . "</a>";
                }


                if ($this->users->getUserPermission("candelete") == "1" && $this->listOptions['actions'] != "false") {
                    $html.= "<a data-id='" . $dval['id'] . "'   id='del__" . $dval['id'] . "' class='delete_option' title='Delete' >"
                            . "<li class=\"fa fa-times\"></li>"
                            . "</a> ";
                }


                if ($this->children != "") {

                    $html.= "  <a  href=\"" . $this->util->getmyurl("admin", $this->variables->url_view) . $this->variables->url_view . "=" . "" . $this->children . "" . $this->listOptions['addtolink'] . "&" . $this->variables->url_parent . "=" . $this->table_name . "&" . $this->variables->url_parent_id . "=" . $dval['id'] . "\"  id=\"edit__" . $dval['id'] . "\" class=\"childe_option\" title='go to childe' >"
                            . "<i class=\"fa fa-level-down\"></i></a>";
                }


                if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] = "yes" && $this->users->getUserPermission("canadd") == "1") {



                    $html.= "  <a  href=\"" .
                            $this->util->getmyurl("admin", $this->variables->url_mode) . "" .
                            $this->listOptions['addtolink'] . "&" . $this->variables->url_mode . "=add&"
                            . "&" . $this->variables->url_cat_id . "=" . $dval['id'] . "\"  id=\"add__" . $dval['id'] . "\" "
                            . "class=\"add_option\" title='Add'><li class=\"fa fa-level-down\"></li></a>";
                }
// </editor-fold>
                $html.= "</div>";
            }
            $null = 0;
            $slpn = $slp; //. $this->thislistleveCout . $this->numrow2;
            // print_r($this->list);

            foreach ($this->list as $list => $v) {
                $null++;
                $slpn .= " " . $this->adddivp($dval['id'], $null);

                //$slpn .=  $this->thislistleve . $this->thislistleveCout;

                if ($null > 1) {
                    $slpn = "";
                }
                $myname = $this->table_properties[$list]['name'];
                $this->table_properties[$list]['name'] = str_replace("[]", "", $this->table_properties[$list]['name']);


                /* $th_width = "auto";  */
                if (isset($this->table_properties[$list]['xref'])) {
                    if ($this->table_properties[$list]['xrefType'] == "o2m") {

                        $this->table_properties[$list] = $this->updatexrefValue($this->table_properties[$list], $dval["id"]);

                        $dval[$this->table_properties[$list]['name']] = $this->table_properties[$list]['value'];
                    }
                }




                $m = "";
                if ($this->table_properties[$list]['toolbar'] == "true") {
                    $m = "toolbar";
                }

                $html.="<div   style='width:" . $this->getColwidtth($v["list-width"]) . "'   data-type='" . $data['type'] . "' class=\"$myname divCell  " . " list_data\">"
                        . "<label class='cellTitle'>" . $this->table_properties[$list]['title'] . "</label><div  data-field='$myname' class=' $m  cellvalue'>"
                        . "";

                $html.= $this->updateTdData($this->table_properties[$list], $dval);

                $html.= "</div></div>";
            }


            $html.="</div>";


            if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] = "yes"
            ) {


                $html.=$this->get_trs($dval["id"], "rowChiled pareatrow_" . $dval["id"]);
            } else {
                $html.="<style>.levels{display:none}</style>";
            }
        }


        if ($id != "0") {
            // $html.="</div>";
        }
        return $html;
    }

    function isfor($name) {
        $r = true;
        if (isset($_GET['for'])) {
            if ($name == $_GET['for']) {
                $r = true;
            } else {
                $r = false;
            }
        }
        return $r;
    }

    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Add Page">
    function add_form() {

        $this->formes->notLang = "Y";
        $retdate = "";
        $retdate.= '<div class=\'block-border\'> <div class="block-header"><h1>' . $this->my_title . '</h1><span></span></div>';



        $form = array(
            "formstart" => array(
                "name" => "formstart",
                "type" => "form",
                "acton" => "",
                "method" => "post",
                "moreAttra" => "data-info='" . $this->util->getmyurl("admin") . "'",
                "novalidation" => "1",
                "name" => $this->table_name . "addForm",
                "class" => $this->table_name . "addForm  block-content"
            )
        );







        $this->formes->filds = $form;
        $retdate .= $this->formes->_render_form();



        $form2 = array(
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => "Add",
                'class' => 'button actions-right'
            ),
            "myreset" => array(
                "name" => "myreset",
                "type" => "reset",
                "value" => "reset",
                'class' => 'button red actions-right'
            ),
        );


        $this->formes->filds = $form2;
        $datform = $this->formes->_render_form();
        $retdate .="<div class='block-actions top'>" . $datform . '</div>';






        $this->formes->filds = $this->updateModeFileds();
        $retdate .= $this->formes->_render_form();

        $retdate .= $this->moreHtml;


        // 

        $retdate .= $this->getplugins_html();
        $retdate .= $this->gteplugins("add");

        $mproperties = $this->getmpropreties("");

        if (is_array($mproperties) || is_array($this->cshow)) {

            if (is_array($mproperties)) {

                $this->formes->filds = $mproperties;
                $retdate .= $this->crateBlockHtml("properties", $this->formes->_render_form(), "", "col-6");
            }


            if (is_array($this->cshow)) {

                foreach ($this->cshow as $thiscshow) {

                    $cData = $this->mydb->get_row("plg_cshow_categories", "*", "title='" . $thiscshow['type'] . "'");
                    $chowName = str_replace(" ", "_", $thiscshow['title']);
                    $llCalss = $chowName . "all";
                    $chowCalss = $chowName;


                    echo "<script>
          $(document).ready(function() {  selectAllList('" . $llCalss . "_" . $cData['id'] . "', '" . $chowCalss . "_" . $cData['id'] . "'); })"
                    . "</script>";


                    $retdate.= "


          <h3 class=\"ui-accordion-header ui-helper-reset ui-state-active ui-corner-top\">
          <span class=\"ui-icon ui-icon-triangle-1-s\" ></span>
          <a href=\"#\">" . $thiscshow['title'] . "</a>
          </h3><div class=\"ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom\">";




                    $myendform = array(
                        "cshowall" => array(
                            "name" => $llCalss,
                            "pclass" => $llCalss . "_" . $cData['id'],
                            "type" => "checkbox",
                            "title" => "All " . $thiscshow['title'],
                            "checked" => "checked",
                            "value" => "1"
                        )
                        ,
                        "cshow" => array(
                            "name" => $chowCalss,
                            "type" => "list",
                            "pclass" => $chowCalss . "_" . $cData['id'],
                            "select_type" => "DB",
                            "select_data" => "plg_cshow",
                            "select_text" => "data",
                            "select_value" => "id",
                            "select_query" => "type=" . $cData['id']
                        )
                    );

                    $this->formes->filds = $myendform;
                    $retdate .= $this->formes->_render_form();
                    $retdate .="</div>";
                }
            }




            $retdate .="</div>";
        }

        ///////////////////////////////properties













        $myendform = array(
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => "add",
                "class" => "button actions-right"
            ),
            "myreset" => array(
                "name" => "myreset",
                "type" => "reset",
                "value" => "reset",
                "class" => "button red actions-right"
            ),
            "status" => array(
                "name" => "status",
                "type" => "hidden",
                "value" => "add"
            ),
            "myendform" => array(
                "name" => "myendform",
                "type" => "endForm"
            )
        );







        $this->formes->filds = $myendform;


        $retdate .=$this->addToForm;



        $retdate .="<div class='block-actions bottom'>";


        $retdate .= $this->formes->_render_form();

        $retdate.= '</div>';
        $retdate.= '<div class="clearfix"></div></div>';
        $this->formes->notLang = "";
        return $retdate;
    }

// </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Edit Page">
    function eidt_form() {


        $this->formes->notLang = "Y";
        $edata = $this->mydb->get_row($this->table_name, "*", "id=" . $this->editID);



        $eNames = $this->changEditNames;
        $eValues = $this->changEditValues;

        $eNames = explode(";", $eNames);
        $eValues = explode(";", $eValues);


        for ($i = 0; $i < count($eNames); $i++) {

            if ($eNames[$i] != null && trim($eNames[$i]) != "") {
                $edata[$eNames[$i]] = $eValues[$i];
            }
        }



        $mproperties = $this->getmpropreties($this->editID);

        $retdate = "";

        $retdate.= '<div class=\'block-border\'>
            <div class=\'block-content\'>
<div class="block-header">
<h1>' . $this->my_title . '</h1><span></span></div>

';
        $form = array(
            "formstart" => array(
                "name" => "formstart",
                "type" => "form",
                "acton" => "",
                "method" => "post",
                "novalidation" => "1",
                "name" => $this->table_name . "editForm"
                ,
                "class" => $this->table_name . "editForm  block-content"
            ),
            "this_formdata" => array(
                "name" => "this_formdata",
                "type" => "hidden",
                "value" => $this->table_name,
                "moreAttra" => "data-id='$this->editID'",
            )
        );





//get start form tag
        $this->formes->filds = $form;
        $retdate .= $this->formes->_render_form();



        $form2 = array(
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => "update",
                'class' => 'button actions-right'
            ),
            "myreset" => array(
                "name" => "myreset",
                "type" => "reset",
                "value" => "reset",
                'class' => 'button red actions-right'
            ),
        );




        $retdate .="<div class='block-actions top'>";
        $this->formes->filds = $form2;
        $retdate .= $this->formes->_render_form();
        $retdate.= '</div>';

//$edata['properties']

        $dataupdate = $this->updateModeFileds($edata);




        //  print_r($dataupdate);

        $this->formes->filds = $dataupdate;


        $this->formes->uploaddir = $this->upload_to;
        $retdate .= $this->formes->_render_form();
        $retdate .= $this->moreHtml;

        $retdate.= $this->getplugins_html($this->editID);
        $retdate .= $this->gteplugins("edit");

        if (is_array($mproperties) || is_array($this->cshow)) {




///////////////////////////////chow

            if (is_array($mproperties)) {





                $this->formes->filds = $mproperties;
                $retdate .= $this->crateBlockHtml("properties", $this->formes->_render_form(), "", "col-6");
            }



            if (is_array($this->cshow)) {

                foreach ($this->cshow as $thiscshow) {

                    $cData = $this->mydb->get_row("plg_cshow_categories", "*", "title='" . $thiscshow['type'] . "'");
                    $chowName = str_replace(" ", "_", $thiscshow['title']);

                    $llCalss = $chowName . "all";
                    $chowCalss = $chowName;


                    echo "<script>
                  $(document).ready(function() {  selectAllList('" . $llCalss . "_" . $cData['id'] . "', '" . $chowCalss . "_" . $cData['id'] . "'); })</script>";


                    $retdate.= "
               

<h3 class=\"ui-accordion-header ui-helper-reset ui-state-active ui-corner-top\">
    <span class=\"ui-icon ui-icon-triangle-1-s\" ></span>
    <a href=\"#\">" . $thiscshow['title'] . "</a>
  </h3><div class=\"ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom\">";


                    $varcheck = "";

                    if ($edata[$llCalss] == "1") {
                        $varcheck = "checkbox";
                    }

                    $myendform = array(
                        "cshowall" => array(
                            "name" => $llCalss,
                            "pclass" => $llCalss . "_" . $cData['id'],
                            "type" => "checkbox",
                            "title" => "All " . $thiscshow['title'],
                            "checked" => $varcheck,
                            "value" => "1"
                        )
                        ,
                        "cshow" => array(
                            "name" => $chowCalss,
                            "type" => "list",
                            "pclass" => $chowCalss . "_" . $cData['id'],
                            "select_type" => "DB",
                            "select_data" => "plg_cshow",
                            "select_text" => "data",
                            "select_value" => "data",
                            "select_query" => "type=" . $cData['id'],
                            "value" => $edata[$chowCalss]
                        )
                    );

                    $this->formes->filds = $myendform;
                    $this->formes->uploaddir = $this->upload_to;
                    $retdate .= $this->formes->_render_form();
                    $retdate .="</div>";
                }
            }


            $retdate .="</div>";
        }




        //get proreties




        $myendform = array(
            "mysubmit" => array(
                "name" => "mysubmit",
                "type" => "submit",
                "value" => "update",
                'class' => 'button actions-right'
            ),
            "myreset" => array(
                "name" => "myreset",
                "type" => "reset",
                "value" => "reset",
                'class' => 'button red actions-right'
            ),
            "status" => array(
                "name" => "status",
                "type" => "hidden",
                "value" => "edit"
            ),
            "myendform" => array(
                "name" => "myendform",
                "type" => "endForm"
            )
        );


        $retdate .=$this->addToForm;

        $retdate .="<div class='block-actions bottom'>";

        $this->formes->filds = $myendform;

        $retdate .= $this->formes->_render_form();

        $retdate.= '</div></div>';
        $retdate.="<div class='clearfix'></div></div>";

        $this->formes->notLang = "";
        return $retdate;
    }

// </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Bars">
    function toolbar() {
        $returndata = "";
        $mode = $this->variables->url_mode;
        $url_steps = $this->variables->url_steps;


        if ($this->options['mode']['status'] == "lightbox" || $this->options['mode']['status'] == "tabs") {


            $more = "getmian.php";
        }




        $myurl = $this->util->getmyurl("admin", $mode . "," . $url_steps . "," . 'com,cat_id');
        $myurlt = $this->util->getmyurl("admin", $mode . "," . $url_steps . "," . 'com,cat_id,listnum');

        $myurlt = $more . $myurlt;
        $myurl = $more . $myurl;


        $returndata .="<ul class=\"tools_bar  \">";


        $mymode = $this->mode;


        if ($mymode == "" || $this->util->getmenuItem($mode) == "trash") {

            $mymode = $this->util->getmenuItem($mode);
        }


//actions



        switch ($mymode) {

            case "add":


                // getmian.php?view=menu_itmes&mode=edit&id=




                $returndata .= "<a href=\"" . $myurl . "&" . $this->listOptions['addtolink'] . "\" class='to_back' \">"
                        . "<i class=\"fa fa-arrow-circle-o-left\"></i>"
                        . "" . $this->util->getLangWord("admin", "back") . "</a>";

                break;
            case "edit":
                $returndata .= ""
                        . "<a href=\"" . $myurl . "&" . $this->listOptions['addtolink'] . "\" class='to_back'>"
                        . "<i class=\"fa fa-arrow-circle-o-left\"></i>"
                        . "" . $this->util->getLangWord("admin", "back") . "</a>";
                break;


            case "trash"://

                $returndata .= "<li title='Back'><a href=\"" . $myurl . "&" . $this->listOptions['addtolink'] . "\" class='to_back'><i class=\"fa  fa-arrow-left fa-fw\"></i>" . $this->util->getLangWord("admin", "back") . "</a></li>";
                $returndata .= "<li title='Remove'><a id=\"list_form" . $this->table_name . $this->AddToFormName . "__remove_all\"  class=\"remove_all\"><i class=\"fa  fa-times  fa-fw\"></i>" . $this->util->getLangWord("admin", "remove") . "</a></li>";
                $returndata .= "<li title='Restore'><a id=\"list_form" . $this->table_name . $this->AddToFormName . "__restore_all\"  class=\"restore_all\"><i class=\"fa  fa-reply fa-fw\"></i>" . $this->util->getLangWord("admin", "restore") . "</a></li>";

                $returndata .= "<li title='Remove All'><a id=\"list_form" . $this->table_name . $this->AddToFormName . "__remove_alls\"  class=\"remove_alls\"><i class=\"fa   fa-times-circle  fa-fw\"></i>" . $this->util->getLangWord("admin", "removeAll") . "</a></li>";
                $returndata .= "<li title='Restore All'>"
                        . "<a id=\"list_form" . $this->table_name . $this->AddToFormName . "__restore_alls\"  class=\"restore_alls\"><i class=\"fa  fa-mail-reply-all fa-fw\"></i>" . $this->util->getLangWord("admin", "restoreAll") . "</a></li>";


                $returndata .="<script>
                    mulit_remove('list_form" . $this->table_name . $this->AddToFormName . "'); 
                    mulit_restore('list_form" . $this->table_name . $this->AddToFormName . "') ;
                    all_remove('list_form" . $this->table_name . $this->AddToFormName . "'); 
                    all_restore('list_form" . $this->table_name . $this->AddToFormName . "') ;
                                </script>";



                break;
            case "view":
                $returndata .= "<li><li class=\"fa  fa-arrow-left fa-fw\"></li><a href=\"" . $myurl . "&" . $this->listOptions['addtolink'] . "\" class='to_back'>" . $this->util->getLangWord("admin", "back") . "</a></li>";

                break;
            case "viewList":
                break;
            default :

                if ($this->mode != "viewList") {



                    if ($this->users->getUserPermission("canadd") == "1" && $this->listOptions['actions'] != "false") {


                        $addmoreattrs = "";
                        if ($this->options['addlink']['usercheck'] == "true") {
                            $addmoreattrs = "data-usercheck='true'";
                        }



                        $returndata .=
                                "<a data-title='" . $this->util->updatCodes($this->my_title) . " Add ' "
                                . " title='" . $this->util->updatCodes($this->my_title) . " Add '"
                                . "data-info='" . $myurl . "&" . $mode . "=add&" . $this->listOptions['addtolink'] . "' "
                                . $addmoreattrs . " class=' addbt'  href='" . $myurl . "&" . $mode . "=add&" . $this->listOptions['addtolink'] . "' >"
                                . "<li class='fa   fa-plus-square fa-fw' ></li>"
                                . "" . $this->util->getLangWord("admin", "add") . ""
                                . "</a>";
                    }
                    if ($this->users->getUserPermission("candelete") == "1" && $this->listOptions['actions'] != "false") {
                        $returndata .= "<a title='Delete' id=\"list_form" . $this->table_name . $this->AddToFormName . "__delete_all\" class=\"delete_all\">"
                                . "<li class=\"fa  fa-times-circle fa-fw\"></li>"
                                . "" . $this->util->getLangWord("admin", "delete") . "</a>";
                    }
                    if ($this->users->getUserPermission("canedit") == "1") {
                        $returndata .= "<a  title='Enable' id=\"list_form" . $this->table_name . $this->AddToFormName . "__enable_all\"  class=\"enable_all\">"
                                . "<li class=\"fa  fa-check-circle-o fa-fw\"></li>" . $this->util->getLangWord("admin", "enable") . "</a>";
                    }
                    if ($this->users->getUserPermission("canedit") == "1") {
                        $returndata .= "<a title='Disable' id=\"list_form" . $this->table_name . $this->AddToFormName . "__disable_all\"  class=\"disable_all\">"
                                . "<li class=\"fa  fa-circle-o fa-fw\"></li>"
                                . "" . $this->util->getLangWord("admin", "disable") . "</a>";
                    }
                    if ($this->users->getUserPermission("canedit") == "1" && $this->listOptions['actions'] != "false") {
                        $returndata .= "<a title='Copy' id=\"list_form" . $this->table_name . $this->AddToFormName . "__Copy_all\"  class=\"Copy_all\">"
                                . "<li class=\"fa  fa-files-o fa-fw\"></li>"
                                . $this->util->getLangWord("admin", "copy") . "</a>";
                    }
                    if ($this->users->getUserPermission("candelete") == "1") {
                        $returndata .= "<a title='trash' href=\"" . $myurlt . "&" . $mode . "=trash&" . $this->listOptions['addtolink'] . "\" class='trash'>"
                                . "<li class=\"fa  fa-trash-o fa-fw\"></li>"
                                . "" . $this->util->getLangWord("admin", "trash") . "</a>";
                    }
                    $returndata .="<script>
                    mulit_enable('list_form" . $this->table_name . $this->AddToFormName . "'); 
                    mulit_disable('list_form" . $this->table_name . $this->AddToFormName . "') ;
                    mulit_delete('list_form" . $this->table_name . $this->AddToFormName . "'); 
                    mulit_copy('list_form" . $this->table_name . $this->AddToFormName . "');   

                                </script>";
                }

                break;
        }

        $returndata.="</ul>";





        $view_url = $this->variables->url_view;
        $url_parent = $this->variables->url_parent;
        $url_orderby = $this->variables->url_orderby;


        $myurl = $this->util->getmyurl("admin", $mode . "," . $url_steps . "," . $view_url . "," . $url_parent . "," . $url_orderby);



        $returndata .="<div class=\"group_bar\">";

        if (isset($_GET['from']) && $_GET['from'] != "") {

            $returndata .= "<a href=\"" . $myurl . "&" . "&" . $view_url . "=" . $_GET['from'] . "\">" . str_replace("com_", "", $_GET['from']) . "</a>";
        }



        if (is_array($this->group)) {



            foreach ($this->group as $k => $v) {
                $moreClass = '';
                if ($_GET[$view_url] == $k) {
                    $moreClass = 'act';
                } else {


                    $moreClass = '';
                }

///        if ($this->parent == "") {
                $myurl = "index.php?";

                if (isset($this->group[$k]['parent']) && $this->group[$k]['parent'] == "yes") {
                    $returndata .= "<a "
                            . "data-title='" . $this->util->updatCodes($this->group[$k]['title']) . "'"
                            . "class='$moreClass' "
                            . "href=\"" . $myurl . $view_url . "=" . $k . "\"  "
                            . "data-info=\"" . $myurl . $view_url . "=" . $k . "\"  "
                            . " >" . $this->util->updatCodes($this->group[$k]['title']) . "</a>";
                } else if (isset($this->group[$k]['parent']) && $this->group[$k]['parent'] == "usersplugin") {



                    $returndata .= "<a "
                            . "data-title='" . $this->util->updatCodes($this->group[$k]['title']) . "'"
                            . "class='$moreClass' "
                            . "href=\"" . $myurl . $view_url . "=" . $k . "&parent=usersplugin\"  "
                            . "data-info=\"" . $myurl . $view_url . "=" . $k . "\"  "
                            . " >" . $this->util->updatCodes($this->group[$k]['title']) . "</a>";
                } else {

                    $myparent = $_GET[$url_parent];

                    if (!isset($_GET[$url_parent])) {

                        $myparent = $_GET[$view_url];
                    }


                    $purl = $url_parent . "=" . $myparent;


                    if (isset($this->group[$k]['notchild']) && $this->group[$k]['notchild'] == "1") {



                        $purl = "from" . "=" . $myparent;
                        $myurl = "";
                    }


                    $returndata .= "<a class='$moreClass' "
                            . "data-title='" . $this->util->updatCodes($this->group[$k]['title']) . "'"
                            . "data-info=\"" . $myurl . "&" . $purl . "&" . $view_url . "=" . $k . "\""
                            . "href=\"" . $myurl . "&" . $purl . "&" . $view_url . "=" . $k . "\">"
                            . "" . $this->util->updatCodes($this->group[$k]['title']) . "</a>";
                }
            }
        }

        $returndata.="</div>";

        return $returndata;
    }

// </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="DB Update">
    function updateEdit() {




        $this->updatetypes();






        $_POST['modified'] = date("Y-m-d H:i:s");



        if (isset($_POST['status']) && $_POST['status'] == "edit") {

            $this->savePluginData($_POST, $this->editID);

            $this->lib->colltions->savePropertiesData($_POST, $this->editID, $this->table_name);

            if ($this->listOptions['history'] == "yes") {

                $this->mackhistory($this->editID);
            }



            $oldData = $this->mydb->get_row($this->table_name, "*", "id=" . $this->editID);
            $testdata = $this->mydb->update_row($this->table_name, $_POST, $this->editID);
















            ///////////////////
            $xi = 0;
            foreach ($_POST as $k => $v) {
                $MYNAME = $this->table_properties[$k]['name'];






                IF ($_POST[$MYNAME] != $oldData[$MYNAME]) {
                    $this->actionsOnUpdates($this->editID, $this->table_properties, "onChange", "changeCondition");
                }

                $this->actionsOnUpdates($this->editID, $this->table_properties, "onEdit", "editCondition");

                $name = str_replace("[]", "", $this->table_properties[$k]['name']);








                if (isset($this->table_properties[$k]['xref'])) {
                    if ($this->table_properties[$k]['xrefType'] == "o2m") {




                        if ($this->thisXref[$xi]["table"] != $this->table_properties[$k]['xref']) {

                            $xi++;
                        }
                        $this->thisXref[$xi]["table"] = $this->table_properties[$k]['xref'];
                        $this->thisXref[$xi]["item_id"] = $this->editID;
                        $this->thisXref[$xi][$name] = $v;
                        ///////////////
                    } else {


                        $datacat = explode(",", $v);




                        $this->mydb->delete_data($this->table_properties[$k]['xref'], "item_id=" . $this->editID);

                        foreach ($datacat as $d) {
                            if ($d != null || $d != "") {
                                $arrdata = array(
                                    "cat_id" => $d,
                                    "item_id" => $this->editID
                                );



                                $this->mydb->insert_row($this->table_properties[$k]['xref'], $arrdata);
                            }
                        }
                    }
                }
            }




            $this->savexRef("edit");

            if ($testdata == 1) {
                $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
            }
        }
    }

    function actionsOnUpdates($id, $table_properties, $type = "onAdd", $c = "addCondition") {

        /* @var $lib  \libs\libs */
        global $lib;



        if (isset($table_properties[$type])) {





            $onAddActions = explode(",", $table_properties[$type]);





            foreach ($onAddActions as $a) {
                $data = $lib->util->data->updateStringTorray($a);
                switch ($data['type']) {

                    case "sendEmail":
                        if (isset($table_properties[$c])) {

                            $do = FALSE;
                            $value = $_POST[$table_properties['name']];


                            $Conditions = str_split($table_properties['addCondition'], 2);


                            if ($Conditions[0] == "==") {

                                if ($value == $Conditions[1]) {
                                    $do = TRUE;
                                }
                            } else if ($Conditions[0] == "!=") {
                                if ($value != $Conditions[1]) {
                                    $do = TRUE;
                                }
                            } else if ($Conditions[0] == ">=") {
                                if ($value >= $Conditions[1]) {
                                    $do = TRUE;
                                }
                            } else if ($Conditions[0] == "<=") {
                                if ($value <= $Conditions[1]) {
                                    $do = TRUE;
                                }
                            } else if (trim($Conditions[0]) == ">") {
                                if ($value > $Conditions[1]) {
                                    $do = TRUE;
                                }
                            } else if (trim($Conditions[0]) == "<") {
                                if ($value < $Conditions[1]) {
                                    $do = TRUE;
                                }
                            }

                            if ($do) {







                                $lib->util->sendHTMLMail($data['copyto'], $data['templateID'], $data['subject'], $data['senderName'], $data['senderEmail'], $_POST, "../");
                            }
                        } else {

                            $lib->util->sendHTMLMail($data['copyto'], $data['templateID'], $data['subject'], $data['senderName'], $data['senderEmail'], $_POST, "../");
                        }



                        break;
                }
            }
        }
    }

    function updateNew() {








        $this->updatetypes();





        if (isset($_GET[$this->variables->url_parent_id])) {




            $_POST['parent_id'] = $_GET[$this->variables->url_parent_id];
        }

        $_POST['created'] = date("Y-m-d H:i:s");



        $xi = 0;
        if (isset($_POST['status']) && $_POST['status'] == "add") {



            $testdata = $this->mydb->insert_row($this->table_name, $_POST);
            $mymaxid = $this->mydb->get_row($this->table_name, "max(id) as mid")['mid'];





            $this->savePluginData($_POST, $mymaxid);

//            $this->lib->colltions->savePropertiesData($_POST, $this->editID, $this->table_name);

            $this->lib->colltions->savePropertiesData($_POST, $mymaxid, $this->table_name);

            if ($_GET['xrefid']) {
                $arrdata = array(
                    $_GET["xrefmyid"] => $_GET["xrefid"],
                    $_GET["xrefotherid"] => $mymaxid['mid']
                );
                $this->mydb->insert_row($_GET["xreftable"], $arrdata);
            }






            foreach ($_POST as $k => $v) {


                $this->actionsOnUpdates($mymaxid, $this->table_properties[$k]);


                $name = str_replace("[]", "", $this->table_properties[$k]['name']);

                if (isset($this->table_properties[$k]['xref'])) {


                    $datacat = explode(",", $v);


                    if ($this->table_properties[$k]['xrefType'] == "o2m") {
                        if ($this->thisXref[$xi]["table"] != $this->table_properties[$k]['xref']) {

                            $xi++;
                        }
                        $this->thisXref[$xi]["table"] = $this->table_properties[$k]['xref'];
                        $this->thisXref[$xi]["item_id"] = $mymaxid['mid'];
                        $this->thisXref[$xi][$name] = $v;
                    } else {

                        $this->mydb->delete_data($this->table_properties[$k]['xref'], "item_id=" . $mymaxid['mid']);


                        foreach ($datacat as $d) {
                            if ($d != null || $d != "") {


                                $arrdata = array(
                                    "cat_id" => $d,
                                    "item_id" => $mymaxid['mid']
                                );





                                $this->mydb->insert_row($this->table_properties[$k]['xref'], $arrdata);
                            }
                        }
                    }
                }
            }


            $this->savexRef();


            if (isset($this->options['addtocat'])) {
                
            }



            if ($testdata == 1) {
                $this->creatmsg($this->config->setting["succeedClass"], $this->config->message['updateData']);
            }
        }
    }

    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Helper">


    var $thislistleve = 0;

    function updatexrefValue($list, $id, $data) {


        $this->mydb->opt->order_a = "id";


        $xdata = $this->mydb->get_data($list['xref'], "*", "item_id='" . $id . "'");
        $d = "";

        $this->mydb->opt->order_a = "";
        $name = str_replace("[]", "", $list['name']);

        $md = 0;

        foreach ($xdata as $x) {
            if ($md == 0) {
                $d .= $x[$name];
            } else {


                $d .="," . $x[$name];
            }



            $md++;
        }

        $list['value'] = $d;

        if ($data != null && $data != "") {
            
        }

        return $list;
    }

    var $thislistleveCout = "0";

    function adddivp($id, $null) {
        if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] == "yes") {
            $datach = $this->getdata("", $id);
            $chids = "";
            /* foreach($data as $d){
              $chids.
              } */
            if (is_array($datach) && isset($datach[0])) {

                $this->numrow2 = 0;

                $this->l = 0;
                $this->getparents($id);
                $this->thislistleve = $this->l;

                $this->thislistleveCout = count($datach);

                if ($null > 1) {
                    $divp = "";
                } else {


                    $divp = "<span data data-count='" . count($datach) . "'  data-leve='" . $this->thislistleve . "' class='leve" . $this->thislistleve . " div_levels'><span class='div_levels_line'></span><i class=\"fa fa-minus-square\"></i> </span>";
                }
            } else {
                
            }
        }
        return $divp;
    }

    var $l = 0;

    function getparents($id) {
        $data = $this->mydb->get_row($this->table_name, '*', "id=" . $id);
        if ($data['cat_id'] != "0") {
            $this->l++;
            $this->getparents($data['cat_id']);
        }
    }

    function updatetypes() {


        foreach ($_POST as $k => $v) {


            if (is_array($v)) {



                $d = "";
                foreach ($v as $item) {
                    if (is_array($item)) {
                        $d.="," . $item[0];
                    } else {

                        $d.="," . $item;
                    }
                }



                $_POST[$k] = str_replace("Array,", "", $d);
            }



            $names = explode("__", $k);

            if ($names[0] == $this->variables->admin_datafields_prfx) {

                $_POST[$names[1]] .= $names[2] . "=>" . $v . "__";
            }
        }



        foreach ($this->table_properties as $f) {


            if ($f['type'] == "pic" || $f['type'] == "upload") {
                if (isset($_FILES[$f['name']]['name']) && $_FILES[$f['name']]['name'] != "") {
                    $path_parts = pathinfo($_FILES[$f['name']]['name']);
                    $extension = $path_parts['extension'];
                    $filename = $this->util->getUniqueId() . "." . $extension;
                    $uploadfile = $this->upload_to . $filename;

                    move_uploaded_file($_FILES[$f['name']]['tmp_name'], $uploadfile);

                    $_POST[$f['name']] = $filename;
                }
            } else if ($f['type'] == "enable_one") {

                if (isset($_POST[$f['name']]) && $_POST[$f['name']] == "1") {
                    $updatedata = array($f['name'] => "0");
                    $this->mydb->update_data($this->table_name, $updatedata, "1=1");
                }
            } else if ($f['type'] == "order") {


                if (isset($_POST[$f['name']]) && $_POST[$f['name']] == "") {

                    $mymax = $this->mydb->get_row($this->table_name, "max(`" . $f['name'] . "`) as maxor");


                    $_POST[$f['name']] = $mymax['maxor'] + 1;
                }
            } else if ($f['type'] == "password") {




                if ($_POST[$f['name']] == "") {
                    if ($this->mode == "edit") {

                        $edata = $this->mydb->get_row($this->table_name, "*", "id=" . $this->editID);

                        $_POST[$f['name']] = $edata[$f['name']];
                    }
                } else {


                    $_POST[$f['name']] = md5($_POST[$f['name']]);
                }
            } else if ($f['type'] == "date") {
                $_POST[$f['name']] = $this->util->dateTodb($_POST[$f['name']]);
            } else if ($f['type'] == "editor") {
                $_POST[$f['name']] = addslashes($_POST[$f['name']]);
            } else if ($f['type'] == "plugins_data") {
                
            } else







            if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] = "yes"
            ) {
                if (!isset($_POST["cat_id"]) || trim($_POST["cat_id"]) == "") {
                    if (isset($_GET[$this->variables->url_cat_id]) && trim($_GET[$this->variables->url_cat_id]) != "") {

                        $_POST["cat_id"] = $_GET[$this->variables->url_cat_id];
                    }
                }
            }
        }

        // print_r($_POST);
    }

    function savexRef($status) {

//                $urlMore = "&xrefid=" . $this->editID . "&xreftable=" . $data['xrefTable']. "&xrefmyid=" . $data['xrefmyid']. "&xrefotherid=" . $data['xrefotherid'];
        //if (isset(xrefid))


        if (trim($this->thisXref[1]['item_id']) != "") {
            $this->mydb->delete_data($this->thisXref[1]['table'], "item_id=" . $this->thisXref[1]['item_id']);
        }
        foreach ($this->thisXref as $x) {


            foreach ($x as $k => $v) {
                $d = explode(",", $v);


                $t = 0;


                foreach ($d as $cv) {

                    if (trim($cv) != "") {
                        $dt[$t]['table'] = $x['table'];
                        $dt[$t]['item_id'] = $x['item_id'];
                        $dt[$t][$k] = $cv;
                        $t++;
                    }
                }
            }

            foreach ($dt as $t) {
                $this->mydb->insert_row($t['table'], $t);
            }
        }
    }

    function pluginsUpdateData($data, $id = "", $sfile = "") {



        if ($id != "") {

            $Value = $this->lib->colltions->getCollectionData("sys_pugins_data", $this->table_name, $id);
        }



        foreach ($data as $list => $V) {
            $name = str_replace("[]", "", $data[$list]['name']);

            if (trim($Value[$name]) != "") {
                $data[$list]['moreAttra'] = " data-val='" . $Value[$name] . "'";
                $data[$list]['value'] = $Value[$name];
            }



            $data[$list]['name'] = 'pluginData__' . $data[$list]['name'];
        }
        //  print_r($data);







        return $data;
    }

    function getmpropreties($id = "") {

        if ($id != "") {
            $mpro = $this->lib->colltions->getCollectionData("sys_properies_data", $this->table_name, $id);
        }



        if ($this->addproreties != "") {

            $mypro = $this->proreties;
//print_r($mypro);
            foreach ($mypro as $my) {



                if (trim($mpro[$mypro[$my['name']]['name']]) != "") {

                    $mypro[$my['name']]['value'] = $mpro[$mypro[$my['name']]['name']];
                }

                $mypro[$my['name']]['name'] = "property__" . $mypro[$my['name']]['name'];

                if ($mypro[$my['name']]['type'] == "order") {
                    $mypro[$my['name']]['type'] = 'number';
                } else if ($mypro[$my['name']]['type'] == "getdata") {
                    $mypro[$my['name']]['get_data_body'] = '';
                } else if ($mypro[$my['name']]['type'] == "enable" || $mypro[$my['name']]['type'] == "enable_one") {
                    $mypro[$my['name']]['type'] = 'select';
                    $mypro[$my['name']]['select_data'] = array("1" => "yes", "0" => "No");
                } else if ($mypro[$my['name']]['type'] == "select") {




                    if (!isset($mypro[$my['name']]['select_type']) || $mypro[$my['name']]['select_type'] == "") {


                        $mret = "";
                        $mydata = explode(";", $mypro[$my['name']]['select_data']);
                        foreach ($mydata as $fm) {
                            $dd = explode(">>", $fm);
                            $mret[$dd[0]] = $dd[1];
                        }


                        $mypro[$my['name']]['select_data'] = $mret;
                    }
                }
            }
        }



        return $mypro;
    }

    function getplugins_html($d = "") {
        /*    $retdate .="


          <div class='getplugins_data block-border'>
          <div class=\"block-header\">
          <h1><getplugins data/h1><span></span></div>
          <div class='getplugins_data block-content'>"; */


        $retdate .= $this->getplugins_data($d);

        //$retdate .="</div></div></div>";

        return $retdate;
    }

    function creatmsg($type, $txt) {
        if (isset($txt) && $txt != "") {
            $this->mssages = "<div class=\"adminmsg " . $type . "msg\">" . $txt . "<div class='closemsg'><i class=\"fa fa-times-circle\"></i></div></div>";
        }
    }

    function updateModeFileds($edata) {


        $dataupdate = $this->table_properties;

        foreach ($dataupdate as $list => $V) {


            /// print_R(($dataupdate[$list]));



            if (!$this->isfor($dataupdate[$list]['name'])) {
                unset($dataupdate[$list]);

                unset($this->table_properties[$list]);
            }
        }


        foreach ($dataupdate as $list => $V) {





            if ($dataupdate[$list]['type'] == "plugin") {

                $dataupdate[$list]['id'] = $edata['id'];
            }if ($dataupdate[$list]['type'] == "order") {
                $dataupdate[$list]['type'] = 'number';
            } else if ($dataupdate[$list]['type'] == "enable" || $dataupdate[$list]['type'] == "enable_one") {
                $dataupdate[$list]['type'] = 'select';
                $dataupdate[$list]['select_data'] = array("1" => "yes", "0" => "No");

                if ($dataupdate[$list]['type'] == null) {


                    $dataupdate[$list]['value'] = "1";
                }
            } else if ($dataupdate[$list]['type'] == "getdata") {
                $dataupdate[$list]['get_data_body'] = $this->getDataInput($dataupdate[$list]);
            } else if ($dataupdate[$list]['type'] == "getXrefData") {

                $dataupdate[$list]['data'] = "<div>" . $this->getXerfDataInput($this->editID, $dataupdate[$list]) . "</div>";




                //    $dataupdate[$list]['get_data_body'] = $this->getXerfDataInput($dataupdate[$list]);
            } else if ($dataupdate[$list]['type'] == "select") {

                if (!isset($dataupdate[$list]['select_type']) || $dataupdate[$list]['select_type'] == "") {


                    $mret = "";
                    $mydata = explode(";", $dataupdate[$list]['select_data']);
                    foreach ($mydata as $fm) {
                        $dd = explode(">>", $fm);
                        $mret[$dd[0]] = $dd[1];
                    }


                    $dataupdate[$list]['select_data'] = $mret;
                }
            } else if ($dataupdate[$list]['type'] == "plugins_data") {
                
            }





            if ($dataupdate[$list]['type'] != "password") {
                if ($edata[$list] != null) {

                    $dataupdate[$list]['value'] = $edata[$list];
                }
            } else if ($dataupdate[$list]['type'] == "date") {
                $dataupdate[$list]['value'] = $this->util->dateFromdb($dataupdate[$list]['value']);
            }




            if ($dataupdate[$list]['type'] == "getdata") {



                $d = $this->mydb->get_row($this->table_name, "*", "" . $dataupdate[$list]['getDataValue'] . "='" . $dataupdate[$list]['value'] . "'");



                $dataupdate[$list]['getdataTitleValue'] = $d[$dataupdate[$list]['getDataTitle']];
            }




            if (isset($dataupdate[$list]['xref'])) {
                if ($dataupdate[$list]['xrefType'] == "o2m") {
                    if ($this->editID != null && $this->editID != "") {
                        $dataupdate[$list] = $this->updatexrefValue($dataupdate[$list], $this->editID);
                    }
                }
            }
        }




        return $dataupdate;
    }

    function getcomponentData() {

        return $this->mydb->get_row("com_install", "*", "ins_alias='" . $this->table_name . "'");
    }

    function getSelectData() {

        $dda = "";



        $remore = "";
        foreach ($this->selectlist as $slist) {



            if (isset($this->selectlistoptions[$slist]) && $this->selectlistoptions[$slist]["type"] == 'alone') {





                $in = $this->selectlistoptions[$slist];



                $snam = $slist;
                $remore .="," . $slist;
                $filds = array(
                    $snam => array("type" => "text",
                        "value" => $_GET[$snam],
                        "name" => $snam,
                        "title" => $in['title'],
                        "select_text" => $snam,
                        "id" => $snam,
                        "select_data" => $this->table_name,
                        "class" => "selectbardataonly")
                );




                $this->formes->filds = $filds;
                $out.= $this->formes->_render_form();

                $ddaonly = $slist;
            } else {


                $snam = $this->table_properties[$slist]['name'];
                $stitle = $this->table_properties[$slist]['title'];



                $snam = str_replace("[]", "", $snam);
                /* $filds = array(
                  $snam => array("type" => "select", "name" => $myname, "id" => $myname . "__" . $dval['id'], "class" => $myname . "__enable input__" . $dval['id'], "select_data" => array("1" => "yes", "0" => "no"), "value" => $dval[$myname])
                  ); */


                $select_value = $this->table_properties[$slist]['select_value'];


                $custemData = "*";
                if ($this->table_properties[$slist]['connect']) {

                    $select_value = $this->table_properties[$slist]['select_text'];

                    $custemData = "DISTINCT " . $select_value;
                }



                if ($this->table_properties[$slist]['type'] == "enable") {

                    $more = "";




                    $filds = array(
                        $snam => array("type" => "select",
                            "value" => $this->getselectFvalue($slist),
                            "select", $this->table_properties[$slist]['select'],
                            "title" => $this->table_properties[$slist]['title'],
                            "select_text" => $this->table_properties[$slist]['select_text'],
                            "id" => $snam,
                            "name" => $slist,
                            "select_data" => array("1" => "yes", "0" => "no"),
                            "select_value" => $select_value,
                            "class" => "selectbardata")
                    );
                } else if ($this->table_properties[$slist]['type'] == "select") {

                    $more = "";

                    $filds = array(
                        $snam => array("type" => "select",
                            "select_type" => $this->table_properties[$slist]['select_type'],
                            "customData" => $this->table_properties[$slist]['customData'],
                            "value" => $this->getselectFvalue($slist),
                            "select", $this->table_properties[$slist]['select'],
                            "title" => $this->table_properties[$slist]['title'],
                            "select_text" => $this->table_properties[$slist]['select_text'],
                            "id" => $snam,
                            "name" => $slist,
                            "select_data" => $this->table_properties[$slist]['select_data'],
                            "select_value" => $select_value,
                            "custemData" => $custemData,
                            "class" => "selectbardata")
                    );
                } else if ($this->table_properties[$slist]['type'] == "list") {

                    $filds = array(
                        $snam => array("type" => "select",
                            "select_type" => $this->table_properties[$slist]['select_type'],
                            "customData" => $this->table_properties[$slist]['customData'],
                            "value" => $this->getselectFvalue($slist),
                            "select", $this->table_properties[$slist]['select'],
                            "title" => $this->table_properties[$slist]['title'],
                            "select_text" => $this->table_properties[$slist]['select_text'],
                            "id" => $snam,
                            "name" => $slist,
                            "select_data" => $this->table_properties[$slist]['select_data'],
                            "select_value" => $select_value,
                            "custemData" => $custemData,
                            "class" => "selectbardata")
                    );

                    $more = "list&xref=" . $this->table_properties[$slist]['xref'];
                } else {


                    $filds = array(
                        $snam => array("type" => "text",
                            "select_type" => "DB",
                            "customData" => "distinct(" . $snam . ")",
                            "value" => $this->getselectFvalue($slist),
                            "select", "name" => $snam,
                            "title" => $stitle,
                            "select_text" => $snam,
                            "id" => $snam,
                            "select_data" => $this->table_name,
                            "class" => "selectbardata")
                    );
                }



                $this->formes->filds = $filds;
                $out.= $this->formes->_render_form();

                $dda = $slist;
            }
        }
        if ($dda != "") {



            $this->util->getmyurl("admin", "fnames,fvalues,listnum");
            $data = $this->util->getmyurl("admin", "fnames,fvalues,listnum");



            $out.=" <script>$(function(){  selectbar('selectbardata','" . $data . "','" . $more . "')})</script>  ";
        }

        if ($ddaonly != "") {
            $data = $this->util->getmyurl("admin", $remore);
            $out.=" <script>$(function(){  selectbaronly('selectbardataonly','" . $data . "','" . $more . "')})</script>  ";
        }

        return $out . "<a href='" . $this->util->getmyurl("admin", "fnames,fvalues") . "' class='refrech'></a>";
    }

    function getselectFvalue($name) {
        $myfnames = explode(",", $_GET['fnames']);
        $myfvalues = explode(",", $_GET['fvalues']);
        $out = "";
        for ($i = 0; $i < count($myfnames); $i++) {


            if ($myfnames[$i] == $name) {


                $out = $myfvalues[$i];
            }
        };

        return $out;
    }

    function getsqlreturn() {


        $myfnames = explode(",", $_GET['fnames']);
        $myfvalues = explode(",", $_GET['fvalues']);

        for ($i = 0; $i < count($myfnames); $i++) {

            if (isset($myfnames[$i]) && $myfnames[$i] != "" && $myfvalues[$i] != "-1") {
                $spliter = " and ";

                if ($_GET['xref'] && $_GET['xref'] != "") {


                    if (isset($this->table_properties[$myfnames[$i]]['xref'])) {


                        $getDatas = $this->mydb->get_data($_GET['xref'], "*", "`" . $myfnames[$i] . "`='" . $myfvalues[$i] . "'");

                        $outd = "";

                        $in = 0;


                        $spliterin = "";

                        foreach ($getDatas as $getData) {
                            $in++;
                            if ($in == 1) {
                                $outd .= $spliter . "(";
                            }


                            $outd .= $spliterin . " `id`='" . $getData['item_id'] . "'";
                            $spliterin = " or ";

                            if ($in == count($getDatas)) {
                                $outd .= ")";
                            }
                        }


                        $out.= $outd;
                    } else {

                        $out .= $spliter . "`" . $myfnames[$i] . "` like '%" . $myfvalues[$i] . "%'";
                    }
                } else if (isset($this->table_properties[$myfnames[$i]]['connect'])) {



                    $mydata = $this->table_properties[$myfnames[$i]];

                    $getDatas = $this->mydb->get_data($mydata['select_data'], "*", "`" . $mydata['select_text'] . "`='" . $myfvalues[$i] . "'");

                    $outd = "";

                    $in = 0;


                    $spliterin = "";

                    foreach ($getDatas as $getData) {
                        $in++;
                        if ($in == 1) {
                            $outd .= $spliter . "(";
                        }


                        $outd .= $spliterin . " `" . $mydata['name'] . "`='" . $getData['id'] . "'";
                        $spliterin = " or ";

                        if ($in == count($getDatas)) {
                            $outd .= ")";
                        }
                    }


                    $out.= $outd;
                } else {
                    $myvs = explode(";", $myfvalues[$i]);


                    foreach ($myvs as $myv) {
                        $out .= $spliter . "`" . $myfnames[$i] . "` like '%" . $myfvalues[$i] . "%'";
                    }
                }
            }
        };




        return $out;
    }

    function getdata($withoutlimit = "", $cat_id = "", $moresql = "", $withoutsearch = "") {
        $this->listNumber = $this->util->siteSetting['admin_list_limit'];



        $ln = $this->getListStartNumber();
        $od = $this->getListOrder();

        $out = $this->getsqlreturn();


        /* @var $lib  \libs\libs */
        global $lib;




        /*
         * 
         * 
         *  =
          =
         */

        $this->where = $lib->util->data->TextVarUpdate("", $this->listOptions['view']);




        if ($this->listOptions['viewvalues'] != "" && $this->listOptions['viewfields'] != "") {

            $value = $lib->util->data->TextVarUpdate("", $this->listOptions['viewvalues']);

            $vs = explode(",", $value);
            $i = 0;


            $dm = " ( ";
            foreach ($vs as $v) {
                $mor = "";

                if ($i > 0) {
                    $mor = " or ";
                }

                $dm .= $mor . " " . $this->listOptions['viewfields'] . "='" . $v . "'";

                $i++;
            }

            $dm .= " ) ";

            $this->where = $dm;
        }







        if ($this->where == "") {

            $this->where = "1=1";
        }

        if ($_GET[$this->variables->url_mode] == 'trash') {
            $this->where .=" and `delete`='1' ";
        } else {
            $this->where .=" and `delete`='0' ";
        }

        if (isset($_GET[$this->variables->url_parent_id])) {

            $this->where.=" and parent_id='" . $_GET[$this->variables->url_parent_id] . "'";
        }


        if (isset($this->listOptions['multiLevel']) && $this->listOptions['multiLevel'] = "yes" && $cat_id != ""
        ) {



            $this->where.=" and cat_id='" . $cat_id . "'";
        }










        if (isset($withoutsearch) && $withoutsearch != "") {
            $where = $this->where . "  " . $moresql . "  ";
        } else if ((isset($withoutlimit) && $withoutlimit != "") || $this->listOptions['nolimit'] == "true") {
            $where = $this->where . $out . "  " . $moresql . "  " . $od;
        } else {
            $where = $this->where . $out . "  " . $moresql . "  " . $od . " LIMIT " . $ln . "," . $this->listNumber;
        }


        if ($_GET[$this->variables->url_mode] == 'trash') {

            $this->mydb->getDleleted = 1;
        }


        $this->mydb->getEnable = 1;





        if ($this->dbdata != "") {

            $data = $this->dbdata;
        } else {
            $this->mydb->getEnable = FALSE;

            $data = $this->mydb->get_data($this->table_name, '', $where);
        }

echo  $this->mydb->returnSQL;






        return $data;
    }

    function getListOrder() {

        $o = " ID ";
        if (isset($_GET['orderby'])) {

            $o = "`" . $_GET['orderby'] . "`";
        } else if (isset($this->listOptions['orderBy']) && $this->listOptions['orderBy'] != "") {

            $o = "`" . $this->listOptions['orderBy'] . "`";
        } else {


            $o = "`id`";
        }

        $ordertype = "ASC";
        if (isset($_GET['ordertype']) && $_GET['ordertype'] == "ASC") {

            $ordertype = "DESC";
        } else if (isset($this->listOptions['orderType']) && $this->listOptions['orderType'] != "") {
            $ordertype = $this->listOptions['orderType'];
        }

        $o.=" " . $ordertype;


        return "order by " . $o . "";
    }

    function getListStartNumber() {
        if (isset($_GET['listnum'])) {
            $ln = $_GET['listnum'];
        } else {
            $ln = 0;
        }
        return $ln;
    }

    function list_numder() {
        $this->listNumber = $this->util->siteSetting['admin_list_limit'];
        $all = $this->getdata("x", "0");



        $thisNum = $this->getListStartNumber();

        $thisNum++;
        $u = $this->util->getmyurl("admin", "listnum");

        if ($this->listNumber < count($all) && $this->listOptions['nolimit'] != "true") {


            $myto = $this->getListStartNumber() + ($this->listNumber);
            if ($myto > count($all)) {

                $myto = count($all);
            }


            $ret = '<div class="pagination">'
                    . '<div class=\'info\'>Showing ' . $thisNum . ' to  ' . ($myto) . ' of ' . count($all) . ' entries</div>'
                    . '<ul>';



            $perv = $thisNum - $this->listNumber;
            if ($perv < $this->listNumber) {

                $perv = "0";
            }

            if ($this->listNumber <= $thisNum) {


                $ret.= '<li class=\'previous\' ><a   href="' . $u . '&listnum=' . $perv . '" > <i class="fa fa-chevron-left"></i>previous</a></li>';
            } else {

                $ret.= '<li class=\'previous disable\'><a><i class="fa fa-chevron-left"></i>previous</a></li>';
            }


            $umn = count($all) / $this->listNumber;


            for ($i = 0; $i < $umn; $i++) {

                $r = $i + 1;

                $ll = $i * $this->listNumber;

                $thp = ( $thisNum / $this->listNumber) + 1;
                $morClass = "";
                if ($thp == $r) {
                    $morClass = "selected";
                }

                $ret.= '<li class=" ' . $morClass . ' li_list_num"><a href="' . $u . '&listnum=' . $ll . '" >' . $r . '</a></li>';
            }

            $rty = count($all) - $this->listNumber;
            $next = $thisNum + $this->listNumber;
            if ($thisNum < $rty) {

                $ret.= ' <li class=\'next \' ><a   href="' . $u . '&listnum=' . $next . '" ><i class="fa fa-chevron-right"></i>Next</a></li>';
            } else {

                $ret.= '<li class=\'next disable\'><a><i class="fa fa-chevron-right"></i>Next</a></li>';
            }


            $ret.= ' </ul></div>';
        }




        return $ret;
    }

    function mackupload() {

        if ($fild['type'] == 'upload' || $fild['type'] == 'pic') {

            if ($fild['upload_to'] != "") {
                $this->upload_to = $fild['upload_to'];
            };

            $uploadfile = $this->upload_to . basename($_FILES[$fild['name']]['name']);
            move_uploaded_file($_FILES[$fild['name']]['tmp_name'], $uploadfile);
            $_POST[$fild['name']] = basename($_FILES[$fild['name']]['name']);
        }
    }

    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="getData Input">
    function getDataSelectBar() {
        
    }

    function getSelectDataForInput($select) {

        $dda = "";


        //  print_R($select);
        foreach ($select as $slist) {




            $snam = $this->table_properties[$slist]['name'];
            $stitle = $this->table_properties[$slist]['title'];


            $snam = str_replace("[]", "", $snam);




            if ($this->table_properties[$slist]['type'] == "enable") {

                $more = "";

                $filds = array(
                    $snam => array("type" => "select",
                        "value" => $this->getselectFvalue($snam),
                        "select", $this->table_properties[$slist]['select'],
                        "title" => $this->table_properties[$slist]['title'],
                        "select_text" => $this->table_properties[$slist]['select_text'],
                        "id" => $snam,
                        "name" => $slist,
                        "select_data" => array("1" => "yes", "0" => "no"),
                        "select_value" => $this->table_properties[$slist]['select_value'],
                        "class" => "selectbardata")
                );
            } else if ($this->table_properties[$slist]['type'] == "select") {

                $more = "";

                $filds = array(
                    $snam => array("type" => "select",
                        "select_type" => $this->table_properties[$slist]['select_type'],
                        "customData" => $this->table_properties[$slist]['customData'],
                        "value" => $this->getselectFvalue($snam),
                        "select", $this->table_properties[$slist]['select'],
                        "title" => $this->table_properties[$slist]['title'],
                        "select_text" => $this->table_properties[$slist]['select_text'],
                        "id" => $snam,
                        "name" => $snam,
                        "select_data" => $this->table_properties[$slist]['select_data'],
                        "select_value" => $this->table_properties[$slist]['select_value'],
                        "class" => "selectbardata")
                );
            } else if ($this->table_properties[$slist]['type'] == "list") {

                $filds = array(
                    $snam => array("type" => "select",
                        "select_type" => $this->table_properties[$slist]['select_type'],
                        "customData" => $this->table_properties[$slist]['customData'],
                        "value" => $this->getselectFvalue($snam),
                        "select", $this->table_properties[$slist]['select'],
                        "title" => $this->table_properties[$slist]['title'],
                        "select_text" => $this->table_properties[$slist]['select_text'],
                        "id" => $snam,
                        "name" => $slist,
                        "select_data" => $this->table_properties[$slist]['select_data'],
                        "select_value" => $this->table_properties[$slist]['select_value'],
                        "class" => "selectbardata")
                );

                $more = "list&xref=" . $this->table_properties[$slist]['xref'];
            } else {


                $filds = array(
                    $snam => array("type" => "text",
                        "select_type" => "DB",
                        "customData" => "distinct(" . $snam . ")",
                        "value" => $this->getselectFvalue($snam),
                        "select", "name" => $slist,
                        "title" => $stitle,
                        "select_text" => $snam,
                        "id" => $snam,
                        "select_data" => $this->table_name,
                        "class" => "selectbardata")
                );
            }



            $this->formes->filds = $filds;
            $out.= $this->formes->_render_form();

            $dda = $slist;
        }
        if ($dda != "") {



            $this->util->getmyurl("admin", "fnames,fvalues,listnum");
            $data = $this->util->getmyurl("admin", "fnames,fvalues,listnum");


            $out.=" <script>$(function(){  selectbarforInput('selectbardata','" . $data . "','" . $more . "')})</script>  ";
        }

        return $out; // . "<a href='" . $this->util->getmyurl("admin", "fnames,fvalues") . "' class='refrech'></a>";
    }

    /////////
    function getXerfDataInput($myid, $data, $x = "") {
        $this->mydb->getEnable = 1;

        $myid = str_replace("undefined", "", $myid);
        $data['table_name'] = $this->table_name;


        $thistable_properties = $this->table_properties;

        $out = "";
        if ($data['xrefmyid'] == null) {
            $data['xrefmyid'] = "item_id";
        }

        if ($data['xrefotherid'] == null) {
            $data['xrefotherid'] = "cat_id";
        }




        $pfile = $this->variables->porpertiesFile;

        if ($data['porpertiesfile']) {
            $pfile = $data['porpertiesfile'];
        } else {
            $pfile = $this->variables->porpertiesFile;
        }


        if ($data['thisTabel'] == null || $data['thisTabel'] == "") {

            $data['thisTabel'] = $this->table_name;
        }


        if ($data['child'] == "true") {
            $parent = $data['thisTabel'];
        }



        $xmlfile = $x . $this->foldersMap->admin_components_folder . $parent . "/" . $data['getData'] . "/" . $pfile . ".xml";

        $this->table_name = $data['getData'];


        $table_properties = $this->util->readXmlAttributes($xmlfile, $this->variables->xml_fldestsgeTag);
        $xml_listfields = $this->util->readXmlnames($xmlfile, $this->variables->xml_listfields);
        $select = $this->util->readXmlnames($xmlfile, $this->variables->xml_selectfields);
        $out.=$this->getSelectDataForInput($select);


        $out.=
                "<div class='__" . $myid . " getxrefdata'>"
                . "<script>$(function(){getxrefDataInput('.__" . $myid . "','" . $myid . "')})</script>"
                . "<input value='" . implode(', ', array_keys($data)) . ";" . implode(', ', $data) . "' type='hidden' class='thisdata' />"
                . ""
                . "<input value='" . $data['getDataValue'] . "," . $data['getDataTitle'] . "' type='hidden' class='getDataInfo' />"
                . "<div class=' getxrefdata_table'>"
                . "<table>";


        $out.= "<thead>";

        $out.= "<th class='thisId'>"
                . "id </th>";


        foreach ($xml_listfields as $h) {


            $out.= "<th>" . $table_properties [$h] ['title'] . "</th>";
        }
        $out.= "</thead>";

        $out.= "<tbody>";


        $getid = $myid;


        if ($data['xrefType'] == "o2m") {



            if ($data['xrefIdField']) {


                $mthisData = $this->mydb->get_row($data['thisTabel'], "*", "id='" . $myid . "'");

                $getid = $mthisData[$data['xrefIdField']];
            }





            $ds = $this->mydb->get_data($data['getData'], "*", $data['xrefmyid'] . "='" . $getid . "'");


            //    echo "<textarea>".$this->mydb->returnSQL . "</textarea><br/>";

            foreach ($ds as $d) {





                $out.= "<tr class='divRow' data-id='" . $d['id'] . "' data-table='" . $this->table_name . "' >";
                $out.= "<td class='thisId'>" . count($ds) . $getid . $data['xrefmyid']
                        . "<input value='" . $d['id'] . "' type='hidden' class='thisrowid' />"
                        . "<input value='" . $d[$data['getDataValue']] . "' type='hidden' class='thisvalue'/>" .
                        "<input data-value='" . $d[$data['getDataValue']] . "' value='" . $d[$data['getDataTitle']] . "' type='hidden' class='thistitle'/>" . "</td>";



                foreach ($xml_listfields as $h) {

                    $out.= "<td>" . $this->updateTdData($table_properties [$h], $d) . "</td>";
                }
                $out.= "</tr>";
            }
        } else {

            if ($data['xrefIdField']) {


                $thisData = $this->mydb->get_row($data['table_name'], "*", 'id' . "='" . $myid . "'");
                $getid = $thisData[$data['xrefIdField']];
            }


            $ds = $this->mydb->get_data($data['xrefTable'], "*", $data['xrefmyid'] . "='" . $getid . "'");
            foreach ($ds as $ddata) {
                $d = $this->mydb->get_row($data['getData'], "*", "id='" . $ddata[$data['xrefotherid']] . "'");


                $out.= "<tr>";
                $out.= "<td class='thisId'>"
                        . "<input value='" . $d['id'] . "' type='hidden' class='thisrowid' />"
                        . "<input value='" . $d[$data['getDataValue']] . "' type='hidden' class='thisvalue'/>" .
                        "<input data-value='" . $d[$data['getDataValue']] . "' value='" . $d[$data['getDataTitle']] . "' type='hidden' class='thistitle'/>" . "</td>";



                foreach ($xml_listfields as $h) {



                    $out.= "<td>" . $data['type'] . $this->updateTdData($table_properties [$h], $d) . "</td>";
                }
                $out.= "</tr>";
            }
        }







        $out.= "<tbody>";
        $out.= "</table></div>";



        if ($data['editable'] != "false") {

            $urlMore = "&xreftable=" . $data['xrefTable'] . "&xrefmyid=" . $data['xrefmyid'] . "&xrefotherid=" . $data['xrefotherid'];




            if ($data['xrefType'] == "o2m") {
                $urlMore = "&addxrefid=" . $getid;
            } else {

                $urlMore = "&xrefid=" . $getid;
            }








            $parent = "";
            if ($data['child'] == "true") {
                $parent = "parent=" . $data['thisTabel'];
            }




            $out.= "<div class=\"tools_bar\">"
                    . "<a class='addaction'title='Add' href=\"/admin/getmian.php?$parent&view=" . $data['getData'] . "&mode=add" . $urlMore . "\"><i class=\"fa fa-plus\"></i></a>"
                    . "<a class='editaction' title='Edit' href=\"/admin/getmian.php?$parent&view=" . $data['getData'] . "" . $urlMore . "&mode=edit&id=\"><i class=\"fa fa-pencil\"></i></a>"
                    . "<a id=\"delaction \" title='Delete'  class=\" delaction delete_all\"><i class=\"fa fa-times-circle-o\"></i></a>"
                    . "<a id=\"refreshaction\" title='Refresh' class=\"refreshaction  edit\"><i class=\"fa fa-refresh\"></i></a>"
                    . "</div>";
        }

        $out.= " </div>";



        $this->table_properties = $thistable_properties;


        $this->table_name = $data['table_name'];

        $this->mydb->getEnable = 0;
        return $out;
    }

    function getDataInput($data, $x = "") {

        $out = "";




        $pfile = $this->variables->porpertiesFile;

        if ($data['porpertiesfile']) {
            $pfile = $data['porpertiesfile'];
        } else {
            $pfile = $this->variables->porpertiesFile;
        }

        $xmlfile = $x . $this->foldersMap->admin_components_folder . $this->parent . "/" . $data['getData'] . "/" . $pfile . ".xml";

        $this->table_name = $data['getData'];


        $this->table_properties = $this->util->readXmlAttributes($xmlfile, $this->variables->xml_fldestsgeTag);
        $table_properties = $this->table_properties;


        $xml_listfields = $this->util->readXmlnames($xmlfile, $this->variables->xml_listfields);
        // prit_r($Cshow);


        $select = $this->util->readXmlnames($xmlfile, $this->variables->xml_selectfields);

        $out.=$this->getSelectDataForInput($select);



        $out.= "<script>$(function(){getdDataInput('')})</script><input value='" . implode(', ', array_keys($data)) . ";" . implode(', ', $data) . "' type='hidden' class='thisdata' />"
                . ""
                . "<input value='" . $data['getDataValue'] . "," . $data['getDataTitle'] . "' type='hidden' class='getDataInfo' />"
                . "<div class='getdata_table'>" . "<table>";


        $out.= "<thead>";

        $out.= "<th class='thisId'>"
                . "id </th>";
        foreach ($xml_listfields as $h) {


            $out.= "<th>" . $table_properties [$h] ['title'] . "</th>";
        }
        $out.= "</thead>";

        $out.= "<tbody>";


        $ds = $this->mydb->get_data($data['getData'], "*", " 1=1 " . $this->getsqlreturn());

        foreach ($ds as $d) {
            $out.= "<tr>";
            $out.= "<td class='thisId'>"
                    . "<input value='" . $d['id'] . "' type='hidden' class='thisrowid' />"
                    . "<input value='" . $d[$data['getDataValue']] . "' type='hidden' class='thisvalue'/>" .
                    "<input data-value='" . $d[$data['getDataValue']] . "' value='" . $d[$data['getDataTitle']] . "' type='hidden' class='thistitle'/>" . "</td>";



            foreach ($xml_listfields as $h) {
                $out.= "<td>" . $this->lib->util->gen->limit_text($d[$h], 10) . "</td>";
            }
            $out.= "</tr>";
        }



        $out.= "<tbody>";

        $out.= "</table></div>"
        ;
        if ($data["editable"] != "false") {
            $out.= "<div class=\"tools_bar\">"
                    . "<a class='addaction'title='Add' href=\"/admin/getmian.php?view=" . $data['getData'] . "&mode=add\"><i class=\"fa fa-plus\"></i></a>"
                    . "<a class='editaction' title='Edit' href=\"/admin/getmian.php?view=" . $data['getData'] . "&mode=edit&id=\"><i class=\"fa fa-pencil\"></i></a>"
                    . "<a id=\"delaction \" title='Delete'  class=\" delaction delete_all\"><i class=\"fa fa-times-circle-o\"></i></a>"
                    . "<a id=\"refreshaction\" title='Refresh' class=\"refreshaction  edit\"><i class=\"fa fa-refresh\"></i></a>"
                    . ""
                    . "</div>";
        }


        return $out;
    }

// </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Colltions">

    function getPlugin($alias, $title, $id = "", $block = "", $blockstatus = "") {

        $Data = "";
        if (isset($alias) && $alias != '') {

            $r = rand(5, 15);
            $r2 = rand(5, 15);

            $xmlfile = "../" . $this->foldersMap->admin_plugins_folder . "/" . $alias . "/" . "porperties.xml";

            $plgsData = $this->util->readXmlAttributes($xmlfile, $this->variables->xml_fldestsgeTag);

            if ($block != "no") {
                $c['blockplg']['type'] = 'block';
                $c['blockplg']['collapse'] = $blockstatus;


                $c['blockplg']['name'] = 'blockplg' . $r;
                $c['blockplg']['title'] = $title;
                $this->formes->filds = $c;
                $Data .= $this->formes->_render_form();
                $this->formes->filds = null;
            }

            $form2 = array(
                "pluginData__name" => array(
                    "name" => "pluginData__||name" . $r2,
                    "type" => "text",
                    "value" => $alias
                )
            );


            $this->formes->filds = $form2;
            $Data .= $this->formes->_render_form();



            $this->formes->filds = null;



            $pForm = $this->pluginsUpdateData($plgsData, $this->editID, $xmlfile);

            if ($alias === "plg_moreData" && $id != "") {


                $pForm['moreData']['value'] = $this->lib->colltions->getCollectionDataRowFromDB("sys_more_data", $this->table_name, $id);
            }




            $this->formes->filds = $pForm;


            $Data .= $this->formes->_render_form();
            $this->formes->filds = null;

            if ($block != "no") {
                $c2['endblock']['type'] = 'endblock';
                $c2['endblock']['name'] = 'endblock' . $r;
            }
            $this->formes->filds = $c2;
            $Data .= $this->formes->_render_form();
        }
        return $Data;
    }

    function getplugins_data($id = "") {

        $thData = $this->getcomponentData();
        $plugins = $this->mydb->get_data("plugins_xref", "*", "cat_id='" . $thData['id'] . "'");




        foreach ($plugins as $p) {

            $pData = $this->mydb->get_row("com_install", "*", "id='" . $p['item_id'] . "'");


            $Data.= $this->getPlugin($pData['ins_alias'], $pData['ins_title'], $id, "", "yes");
        }

        return $Data;
    }

    /**
     * 
     * @param type $type
     * @param type $id
     * @param type $Data
     * @param type $title
     */
    function savePluginData($data, $id) {
        $rs = explode("||", $this->lib->colltions->setFormatCollectionDataToDB($data, "pluginData"));
        $this->mydb->delete_data("sys_pugins_data", "com_id='" . $id . "' and com_type='" . $this->table_name . "'");
        foreach ($rs as $r) {
            $rs2 = explode(";", $r);
            if (count($rs2[0]) > 0) {
                $rs3 = explode("__", $rs2[0]);

                if ($rs3[1] != "plg_moreData") {

                    $this->lib->colltions->saveColltionData("sys_pugins_data", $this->table_name, $id, $r, $rs3[1]);
                } else {


                    $m = str_replace($rs2[0], "", $r);
                    $m2 = explode("__", $m);
                    // print_r($m2);

                    $m = str_replace($m2[0] . "__", "", $m);
                    $m = str_replace($m2[0] . "", "", $m);
                    $m = str_replace("||", "", $m);

                    $this->lib->colltions->savemoreData($m, $id, $this->table_name);
                }
                //  
            }
        }
        return "";
    }

// </editor-fold>
}

?>
