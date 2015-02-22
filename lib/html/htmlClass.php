<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */


//$filds:{type,name,action,method ,class , morecss,required}
//filds->type{form end_form  number time get_data date Line submit reset button label password checkbox textarea textarea radio list  upload  pic autocomplete}
//
//
//cat_id
//$value:
//$selectData          [tabelName,dirName,xmlfileName]
//$select_type         [DB,DIR,XML,null is array]
//$select_field_text   [fieldname,filestypes,xmltag]
//$select_field_value  [fieldname,filestypes,xmltag]

namespace libs\html;

class htmlClass {

    var $filds;
    var $mode;
    var $data;
    var $lngFile;
    var $notLang;

    /**
     * @var dbClass
     */
    var $db;
    /* @var $lib  \libs\libs */
    var $lib;

    /**
     * @var utilClass
     */
    var $util;
    var $uploaddir;

    /**
     * @var  \options\variablesClass
     */
    var $variables;

    function __construct($lib) {
        $this->db = $lib->db;
        $this->util = $lib->util;
        $this->variables = $lib->variables;

        $this->foldersMap = $lib->foldersMap;

        $this->lib = $lib;
    }

    function _render_form() {

        return $this->CraetForm();
    }

    function CraetForm() {
        $html = "";



        foreach ($this->filds as $fild) {


//print_r($fild);



            $inputName = $fild['name'];


            $inputClass = "form_row txt rowfeild " . $fild['name'] . " " . $fild['type'] . " " . $fild['class'];
            $inputID = $fild['name'];
            $inputStyle = $fild['style'];
            $inputAction = $fild['action'];
            $inputMethod = $fild['method'];
            $selectData = $fild['select_data'];
            $select_field_value = $fild['select_value'];
            $select_field_text = $fild['select_text'];
            $inputValue = $fild['value'];
            $getdataTitle = $fild['getdataTitleValue'];
            $customData = $fild['customData'];
            $select_type = $fild['select_type'];
            $editor_type = $fild['editor_type'];
            $pclass = $fild['pclass'];
            $select_query = $fild['select_query'];
            $tree = $fild['tree'];
            $getDataBody = $fild['get_data_body'];



            if ($fild['type'] == "tinyeditor") {

                $fild['type'] = 'editor';

                $editor_type = "textarea";
            }


            $inputValue = $fild['value'];




            if ($this->notLang != "Y") {


//   $inputValue = $this->util->data->varUpdate($fild['value'], $this->lngFile);
                $fild['title'] = $this->util->data->varUpdate($fild['title'], $this->lngFile);
                $fild['moreAttra'] = $this->util->data->varDataUpdate($fild['moreAttra']);
            }



            $moreAttra = $fild['moreAttra'];


            if ($fild['required'] != "" && $fild['required'] != null && !empty($fild['required'])) {

                $required = "validate[required]    ";
            } else {

                $required = "";
            }











            if ($fild['id'] != "" && $fild['id'] != null) {

                $inputID = $fild['id'];
            }

            $inputClass .= "  " . $required . "  ";





            if (isset($_GET['lang'])) {


                $moreAttra .="  data-lang='" . $_GET['lang'] . "'";
            }

            switch ($fild['type']) {
                case 'line':
                    $input_html = $fild['actions'] . '<div ' . $moreAttra . ' style="' . $inputStyle . '"  id="' . $inputID . '"  class="' . $inputClass . '"   ></div>';

                    break;


                case 'plugin':
//  =  . '<div ' . $moreAttra . ' style="' . $inputStyle . '"  id="' . $inputID . '"  class="' . $inputClass . '"   ></div>';
                    $input_html = $this->lib->admin->getPlugin($fild['name'], $fild['title'], $fild['id'], $fild['block'], $fild['collapse']);
                    break;


                case 'form':



                    $input_html = '<form  ' . $moreAttra . '  enctype="multipart/form-data"   style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"    class="' . $inputClass . '"  method="' . $inputMethod . '" >';



                    if ($fild['novalidation'] != "1") {



                        $input_html .= '<script> setFormvalidation("' . $inputID . '" ,"","","' . $_GET['lang'] . '")</script>';
                    }




                    break;





                case 'endForm':
                    $input_html = '</form>';
                    break;
                case 'map':
// zoom="1" center="[30.04769908451693, 30.95947265625]" 

                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '"    type="hidden" />';

                    $input_html .= '
                        <div id="' . $inputID . '_map" class="' . $inputID . '_map gmap3"></div>
                        
<script>inputMap("' . $inputID . '","' . $inputValue . '",' . $fild['zoom'] . ',' . $fild['center'] . ');</script>
';

                    break;

                case 'html':

                    $data = "";

                    if ($fild['data'] != null) {
                        $data = $fild['data'];
                    }






                    $input_html = '<div  ' . $moreAttra . '  style="' . $inputStyle . '"  id="' . $inputID . '"  class="' . $inputClass . '"   >' . $fild['data_value'] . "</div>";
                    break;



                case 'getXrefData':

                    $data = "";

                    if ($fild['data'] != null) {
                        $data = $fild['data'];
                    }
                    $input_html = '<div  ' . $moreAttra . '  style="' . $inputStyle . '"  id="' . $inputID . '"  class="form_row getXrefData ' . $inputClass . '"   >' . $data . "</div>";
                    break;
                case 'div':


                    $more = "";
                    if ($fild['moreactions'] == "addmore") {

                        $more = '<script>getaddMore("#' . $inputID . '" )</script>';
                    }






                    $data = "";

                    if ($fild['data'] != null) {

                        $data = $fild['data'];
                    }

                    $input_html = $more . '<div  ' . $moreAttra . '  style="' . $inputStyle . '"  id="' . $inputID . '"  class="' . $inputClass . '"   >' . $data;




                    break;
                case 'endDiv':
                case 'enddiv':
                    $input_html = '</div>';
                    break;

                case 'label':
                    $inputValue = $this->util->data->varUpdate($fild['value'], $this->lngFile);
                    $input_html = '<div   ' . $moreAttra . '  style="' . $inputStyle . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  >' . $fild['title'] . '</div>';
                    break;

                case 'title':
                    $inputValue = $this->util->data->varUpdate($fild['value'], $this->lngFile);
                    $inputValueTitle = str_replace("com_", "", $inputValue);
                    $inputValueTitle = str_replace("mod_", "", $inputValueTitle);
                    $inputValueTitle = str_replace("plg_", "", $inputValueTitle);
                    $input_html = '<h2  ' . $moreAttra . '   style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  >' . str_replace("_", " ", $inputValueTitle) . '</h2>';
                    break;


//////////////////////////////////////////////
                case 'input':
                case 'text':
                case '':


                    $input_html = '<input  ' . $moreAttra . '   style="' . $inputStyle . '"  name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '"    type="text" />';



                    break;


                case 'getdata':

                    $input_html = '<div  ' . $moreAttra . '  class="getdata_all"><input '
                            . 'style="' . $inputStyle . '" '
                            . 'name="' . $inputName . '" '
                            . 'id="' . $inputID . '"  '
                            . 'class="' . $inputClass . '"  '
                            . 'value="' . $inputValue . '"    '
                            . 'type="hidden" '
                            . '/>'
                            . '<input type="text" data-input="' . $inputName . '" value="' . $getdataTitle . '" class="getdata_title"/>'
                            . '<div class="getdata_bt"></div>'
                            . '<div class="getdata_body">'
                            . '<div class="data">' . $getDataBody . '</div>'
                            . '</div></div>';
                    break;
                case 'date':


                    $mclass = $this->lib->util->getUniqueId();

                    $inputClass .=" " . $mclass;
                    if ($fild['styleMode'] == "inline") {

                        $input_html = '<div  ' . $moreAttra . '  style="' . $inputStyle . '"   id="' . $mclass . '"  class="' . $inputClass . '"  value="' . $inputValue . '"  ></div>';
                    } else {
                        $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '"  name="' . $inputName . '" id="' . $mclass . '"  class="inputdate ' . $inputClass . '"  value="' . $inputValue . '" type="text" />';
                    }







                    if ($fild['dateto'] == "") {

                        $fild['dateto'] = "x";
                    }
                    $input_html .= '<script>getDate(".' . $mclass . '" ,"' . $fild['styleMode'] . '",".' . $fild['dateto'] . '","' . $fild['minDate'] . '","' . $fild['maxDate'] . '" )</script>';
                    break;
                case 'color':
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="text" />';
                    $input_html .= '<script>$(function(){  getcolorInput("#' . $inputID . '" );
                                    
});</script>';

                    break;
                case 'number':
                    $inputClass .= "validate[custom[onlyNumberSp]]";
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="text" />';
                    break;
                case 'url':
                    $inputClass .= "validate[custom[url]]";
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="text" />';
                    break;
                case 'block':



                    $ico = "fa-minus-square";
                    if ($fild['collapse'] == "yes") {
                        $inputClass .= " collapse";
                        $ico = "fa-plus-square";
                    }



                    $input_html = '<div  ' . $moreAttra . '  style="' . $inputStyle . '"   class= "' . $inputName . " block " . $inputClass . '"  >'
                            . '<h3>' . $fild['title'] . '<li class=" blackbt fa ' . $ico . '"></li></h3> '
                            . '<div class=\'blockData\'>';

                    break;
                case 'endblock':
                    $input_html = '</div></div>';

                    break;


                case 'url':
                    $inputClass .= "validate[custom[url]]";
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="text" />';
                    break;
                case 'readData':
                    $input_html = "";
                    if ($inputValue != "") {
                        $m1 = explode(";", $inputValue);
                        $input_html .="<table>";
                        foreach ($m1 as $m) {

                            $m2 = explode("__", $m);
                            $input_html .="<tr>";
                            foreach ($m2 as $m3) {

                                $input_html .= "<td>" . $m3 . "</td>";
                            }
                        }
                        $input_html .="<tr>";
                        $input_html .="</table>";
                    }

                    break;


                case 'email':
                    $inputClass .= "validate[custom[email]]";
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="email" />';
                    break;

                case 'phone':
                    $inputClass .= "validate[custom[phone]]";
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="text" />';
                    break;

                case 'egphone':


                    $inputClass .= "validate[custom[phone]]";

                    $values = str_split($inputValue, 3);
                    $options = array(
                        "010" => "010",
                        "011" => "011",
                        "012" => "012",
                    );



                    $input_html = ''
                            . '<div  class="egphone_input">'
                            . '<input  value="' . substr($inputValue, 3) . '"  ' . $moreAttra . '  maxlength="8" style="margin:12px; max-width:190px; ' . $inputStyle . '" action="' . $inputAction . '"   class="phone_num ' . '"  '
                            . '  type="text" />'
                            . '<select   style="margin-right:5px; width:60px;" class="phone_perf" type="number" >'
                            . $this->arrayToOptions($options, $values[0]) .
                            '</select>'
                            . '<span style="margin:5px;" >2+</span>'
                            . '<input name="' . $inputName . '" value="' . $inputValue . '"  id="' . $inputID . '"  value type="hidden" class="egphone_input_data  ' . $inputID . '"  >'
                            . '</div><script>egphone_input_s()</script>';
                    break;




                case 'time':

                    $values = explode(":", $inputValue);
                    $options = array(
                        "00" => "00"
                        , "01" => "01"
                        , "02" => "02"
                        , "03" => "03"
                        , "04" => "04"
                        , "05" => "05"
                        , "06" => "06"
                        , "07" => "07"
                        , "08" => "08"
                        , "09" => "09"
                        , "10" => "10"
                        , "11" => "11"
                        , "12" => "12"
                        , "13" => "13"
                        , "14" => "14"
                        , "15" => "15"
                        , "16" => "16"
                        , "17" => "17"
                        , "18" => "18"
                        , "19" => "19"
                        , "20" => "20"
                        , "21" => "21"
                        , "22" => "22"
                        , "23" => "23"
                    );

                    /*


                     */



                    foreach ($options as $k => $v) {

                        if ((intval($fild['datamax']) >= intval($k) && intval($fild['datamin']) <= intval($k))
                        ) {



                            $new[$k] = $v;
                        }
                    }



                    $options = $new;



                    $input_html = '<div class="time_input">'
                            . '<select ' . $moreAttra . ' style="' . $inputStyle . '"  class="data_h" >'
                            . $this->arrayToOptions($options, $values['0']) .
                            '</select>';


                    $moptions = array(
                        "00" => "00",
                        "15" => "15",
                        "30" => "30",
                        "45" => "45"
                    );
                    $input_html .= '<select style="' . $inputStyle . '"  class=" data_m" >'
                            . $this->arrayToOptions($moptions, $values['1']) . '
                        </select>                       
                <input  value="' . $inputValue . '"   name="' . $inputName . '" id="' . $inputID . '"  type="hidden" class="time_input_data"  >'
                            . '<script>time_input_s()</script></div>';

                    break;
                case 'button':
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="button" />';
                    break;
                case 'submit':
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="submit" />';
                    break;
                case 'reset':
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="reset" />';
                    break;
                case 'hidden':
                    $inputValue = $this->util->data->varUpdate($fild['value'], $this->lngFile);
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="hidden" />';
                    break;
                case 'password':
                    $input_html = '<input  ' . $moreAttra . '  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="password" />';
                    break;


//////////////////////////////////////////////
                case 'check':
                case 'checkbox':

                    $more = "";
                    if (isset($fild['checked']) && $fild['checked'] != "") {
                        $more = "checked=" . $fild['checked'];
                    }


                    $input_html = '<input  ' . $moreAttra . '   ' . $more . '
                        style="' . $inputStyle . '"
                        action="' . $inputAction . '" 
                        name="' . $inputName . '"
                        id="' . $inputID . '"  
                        class="' . $inputClass . '"  
                        value="' . $inputValue . '"  
                        type="checkbox" 
                        />
                        <label for="' . $inputID . '" class="forcheckbox"></label>


';
                    break;

                case 'textarea':
                    $input_html = '<textarea  ' . $moreAttra . '   style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '">' . $inputValue . '</textarea>';
                    break;

                case 'readOnly':
                    $input_html = '<div  ' . $moreAttra . '   style="' . $inputStyle . '" action="' . $inputAction . '"  id="' . $inputID . '"  class="' . $inputClass . '">' . $inputValue . '</div>';
                    break;


                case 'fields':
                case 'data':

                    if ($fild['file'] == null) {

                        $fild['file'] = "b_data";
                    }
                    if ($fild['options'] == null) {

                        $fild['options'] = "html,form,endForm,egphone,div,html,endDiv,line,label,text,number,url,email,phone"
                                . ",time ,date ,color"
                                . ",hidden,password,textarea"
                                . ",editor,tinyeditor,radio"
                                . ",check,select,list"
                                . ",autocomplete,upload,pic"
                                . ",picAdvanced,uploadAjax,button"
                                . ",submit,reset";
                    }
                    $input_html = "

          <div class='f" . $inputName . "'>
              <textarea style='display:none;' name='" . $inputName . "' class='" . $inputName . " tsData'>" . $inputValue . " </textarea>
            <div  style='width:100%;min-height:1px;clear:both ;zoom: 1;' class='allsteps'>
            
            <div class=' add addstep'>
           
            <ul>
            <li title='Update To Text' class='ui-state-default ui-corner-all uToText'><span class='ui-icon ui-icon-newwin'></span></li>
            <li title='Update  From Text'  class=' ui-state-default ui-corner-all uFromText'><span class='ui-icon ui-icon-contact'></span></li>
            <li title=' Show/Hide Text'  class='ui-state-default ui-corner-all ToggelText'><span class='ui-icon ui-icon-document'></span></li>
            <li title='collapse All'  class='addStepBt ui-state-default ui-corner-all'><span class='ui-icon ui-icon ui-icon-plusthick'></span></li>
            </ul>
        </div>
        <div style='width:50%'>
        <div class='stepes'> </div> <div class='my_clearfix' > </div></div>
       
        </div>
        
        <script>
                UpdateFromBluder('.f" . $inputName . "','admin/" . $fild['file'] . "','" . $fild['options'] . "','" . $inputValue . "');
                getBluder('.f" . $inputName . "','admin/" . $fild['file'] . "','" . $fild['options'] . "');
        </script>";


                    break;

                case 'readfields':


                    $input_html = $this->getFiledsFormStrign("db", "com_pricing_items", "", "data", "", "", "", $this->variables->admin_datafields_prfx . "__" . $inputName, $inputValue); // $mydata[$fild['field']];


                    break;




                case 'table':


                    $input_html = '<textarea '
                            . ' style=\'display:block\' '
                            . ' style="' . $inputStyle . '"  name="' . $inputName . '"'
                            . ' id="' . $inputID . '" '
                            . ' class="' . $inputClass . '">' . $inputValue . '</textarea>';

                    $input_html .= ' <div><div class="divth" >Title</div><div class="divth" >Value</div> <div class="divth"></div></thead></div>';




                    $input_html.=' <div class="divth" > <div class = "form_row actions-left " >';
                    $input_html .= '<input style = "_25" class = "fileds_names_' . $inputID . '" type = "text" />';
                    $input_html.='</div>';





                    $input_html.='</div><div class="divth" ><div class = "form_row actions-left" >';
                    $input_html .= '<textarea style = "_25" class = " fileds_title_' . $inputID . '"  ></textarea>';
                    $input_html.='</div>';


                    $input_html.='</div><div class="divth bts" ><div class = "form_row actions-right" >';
                    $input_html .= '<input style = "_25" class = "fileds_add_' . $inputID . '" value = "add" type = "button" />';
                    $input_html.='</div></div></div>';







                    $input_html.='<div class = \'fileds_view_' . $inputID . '\'><div></div>'
                            . '<script>createTabelCraetor("' . $inputID . '");</script>';
                    break;

                case 'editor':
                    $input_html = '
                        <textarea  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '">' . $inputValue . '</textarea>';
                    $input_html .= "<script> createditor( '#$inputID','$editor_type');</script>";






                    break;
                case 'radio':


                    $more = "";
                    if (isset($fild['checked']) && $fild['checked'] != "") {
                        $more = "checked=" . $fild['checked'];
                    }


                    $input_html = '<input ' . $moreAttra . '   ' . $more . ' style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '" value="' . $inputValue . '"   type="radio" />';
                    break;
                case 'select':



                    $input_html = '<select  ' . $moreAttra . ' style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '">' . $this->getselectData($fild, $selectData, $select_type, $select_field_text, $select_field_value, $inputValue, $customData, $select_query, $tree) . '</select>';

                    if (isset($fild['showHide']) && trim($fild['showHide']) != "") {
                        $input_html .= '<script>ShowHideData("' . $fild['name'] . '","' . $fild['showHide'] . '","' . $inputValue . '")</script>';
                    }




                    break;

                case 'list':


                    $input_html = '<select  multiple="multiple"  style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '[]" id="' . $inputID . '"  class="' . $inputClass . '">' . $this->getselectData($fild, $selectData, $select_type, $select_field_text, $select_field_value, explode(",", $inputValue), $customData, $select_query, $tree) . '</select>';

                    if (isset($fild['showHide']) && trim($fild['showHide']) != "") {
                        $input_html .= '<script>ShowHideData("' . $fild['name'] . '","' . $fild['showHide'] . '","' . $inputValue . '")</script>';
                    }



                    break;
                case 'autocomplete':
                    $input_html = '<input style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="text" />';
                    break;
                case 'upload':

                    $input_html = '<input style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="file" />';
                    break;
                case 'image':
                case 'pic':




                    $input_html = '<div class="' . $inputName . ' imageInput"><div class=\'pic_preview\'>
                        ';
                    if ($inputValue != "") {

                        $input_html .= ' <img src="' . $this->uploaddir . "/" . $inputValue . '"  />'
                                . ''
                                . ''
                                . '<script>updateforvalue("' . $inputName . '" ,"' . $inputValue . '");</script>';
                    }

                    $input_html .= '   </div>
                        <div class="imageBar">
                        <input style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"   type="file" />'
                            . '<a class=\'imagebt deleteimg\'   title="Delete Image"><i class="fa fa-trash-o"></i></a>'
                            . '
	    <a  title="select from server " href="/includes/php/filemanager/dialog.php?type=1&amp;subfolder=&amp;editor=mce_0&amp;field_id=fieldID' . $inputName . '" class="btn imagebt iframe-btn"   type="button"><i class="fa fa-cloud"></i></a>
		    <input  class="imageurl" id="fieldID' . $inputName . '" type="hidden" value="">


'
                            . '</div></div>'
                            . ''
                            . '';
                    break;
                case 'uploadAdvanced':
                    $input_html = '<div class=\'pic_preview\'>
                        <img src="' . $this->uploaddir . "/" . $inputValue . '"  /></div><div id="' . $inputID . '" ><noscript><p>Please enable JavaScript to use file uploader.</p></noscript></div>';
                    $input_html .= '<script>creatmyupoloader(\'' + $inputID + '\')</script>';
                    break;

                case 'picAdvanced':
                    $input_html = '<div id="' . $inputID . '" ><noscript><p>Please enable JavaScript to use file uploader.</p></noscript></div>';
                    $input_html .= '<script>creatmyupoloader(\'' + $inputID + '\')</script>';
                    break;




                case 'uploadAjax':
                    $input_html = '<input name="MAX_FILE_SIZE" value="1048576" type="hidden" />    <input style="' . $inputStyle . '" action="' . $inputAction . '" name="' . $inputName . '" id="' . $inputID . '"  class="' . $inputClass . '"  value="' . $inputValue . '" type="file" />';
                    break;
            }


            if (isset($fild['getinput']) && $fild['getinput'] == "true") {

                $html.=$input_html;
            } else {

                switch ($fild['type']) {
                    case'submit':
                    case'reset':
                    case'button':
                    case'hidden':
                        $html.='<div  class="form_row actions-right ' . $fild['type'] . "_p " . $pclass . " " . '_parent" >' . $input_html . '</div>';
                        break;
                    case'form':
                    case'end_form':
                    case'div':
                    case'endDiv':
                    case'enddiv':
                    case'endForm':
                    case'line':
                    case'block':
                    case'endblock':
                    case'html':
                    case'label':
                    case'getXrefData':


                        if ($fild['lang'] == "true") {

                            $more = "<input data=olddata='$inputValue'  type='button' data-input='  $inputName ' value='lnag' class='updateLang' />";
                        } else {

                            $more = "";
                        }
                        $html.=$input_html . $more;
                        break;


                    default:



                        if ($fild['lang'] == "true") {

                            $more = "<div class='langBar'>";



                            foreach ($this->lib->site->allLangs() as $ldata) {

                                $deg = "";
                                if ($this->lib->util->siteSetting['lang'] == $ldata['title']) {
                                    $deg = "Default";
                                }
                                $more .= "<div title='" . $ldata['title'] . "[" . $deg . "]'   data-olddata='$inputValue' data-inputtype='" . $fild['type'] . "'  data-lang='" . $ldata['title'] . "' data-langid='" . $ldata['id'] . "'  data-input='$inputName'  class='updateLang' >"
                                        . "<img src='" . $this->lib->foldersMap->fornt_upload_images . $ldata['l_image'] . "' /></div>";
                            }


                            $more .= "</div>";
                        } else {

                            $more = "";
                        }



                        $html.='<div id= "' . $fild['type'] . '_count"  class="form_row ' . $fild['type'] . " " . str_replace("[]", "", $fild['name']) . "_p " . $pclass . " " . '_parent" >';
                        if (isset($fild['title']) && $fild['title'] != "") {
                            $html.='<div class="field-label"><label for="' . $fild['name'] . '">' . $fild['title'] . '</label>';

                            if ($fild['comment'] != "") {
                                $html.='<span title="' . $fild['comment'] . '" class="info">?<span>';
                            }




                            $html.='</div>';
                        }






                        $html.='<div class="field-input" >' . $input_html . $more . '</div>';

                        /*  if (isset($fild['comment']) && $fild['comment'] != "") {

                          $html.='<div class="field-comment" >' . $fild['comment'] . '</div>';
                          }
                         */

                        $html.= '</div>';
                        break;
                }
            }
        }
        return $html;
    }

//$selectData          [tabelName,dirName,xmlfileName]
//$select_type         [DB,DIR,XML,null is array]
//$select_field_text   [fieldname,filestypes,xmltag]
//$select_field_value  [fieldname,filestypes,xmltag]

    var $moreout = "";

    function isSelect($inputdefault, $i) {

        $selected = "";




        if (is_array($inputdefault)) {

            foreach ($inputdefault as $d) {
                if ($d == $i) {
                    $selected = "selected";
                }
            }
        } else {

            if ($inputdefault == $i) {
                $selected = "selected";
            } else {

                $selected = "";
            }
        }
        return $selected;
    }

    function xmlToOptions($file, $tag, $inputdefault) {
        $pos = $this->util->readXmlDataString($file, $tag);



        asort($pos);
        foreach ($pos as $p => $v) {
            $more = "";
            foreach ($v as $attr => $attrv) {
                if ($attr != "value") {

                    $more.= $attr . "='" . $attrv . "'";
                }
            }



            $out.="<option  " . $this->isSelect($inputdefault, $p) . " value='$p'  $more >" . $v['value'] . "</option>";
        }



        return $out;
    }

    function xmlToOptions2($file, $tag, $inputdefault) {
        $pos = $this->util->readXmlvalues($file, $tag);




        asort($pos);
        foreach ($pos as $p => $v) {
            $out.="<option  " . $this->isSelect($inputdefault, $v) . " value='$v'>" . $v . "</option>";
        }

        return $out;
    }

    function xmlToOptionsVal($file, $tag, $inputdefault, $select_field_value) {
        $pos = $this->util->readXmlvaluesString($file, $tag);



        $names = $this->util->readXmlnamesString($file, $tag);
        $n = 0;


        foreach ($pos as $p) {

            $n++;

            $val = $names[$n];
            if (isset($select_field_value) && $select_field_value != "") {
                $val = $names[$n];
            }


            $out.="<option " . $this->isSelect($inputdefault, $val) . " value='" . $names[$n] . "' >" . $p . "</option>";
        }

        return $out;
    }

    function getselectData($fild, $selectData, $select_type, $select_field_text, $select_field_value, $inputdefault, $customData, $select_query, $tree) {



        $out = "";
        $stringmyurl = $this->util->siteSetting['site_link'] . "/lib/";
        $out.="<option value=\"0\"></option>";

        $selected = "";
        if ($fild['depend_on'] != null && $fild['depend_on'] != "") {

            $out.="<script>selectdepend_on('" . $fild['depend_on'] . "' ,'" . $fild['name'] . "','" . $fild['depend_source'] . "','" . $inputdefault . "');</script>";
        } else {



            if (isset($_GET['lang'])) {


                $this->util->siteSetting['lang'] = $_GET['lang'];
            } else {


                $_GET['lang'] = $this->util->siteSetting['lang'];
            }


            $selectData = $this->util->data->TextVarUpdate("", $selectData);





            switch ($fild['select_type']) {



                case "DIR":
                    $vdata = $this->util->readFilesNames($selectData, $select_field_text);
                    asort($vdata);
                    foreach ($vdata as $value) {
                        $out.="<option " . $this->isSelect($inputdefault, $value) . " >" . $value . "</option>";
                    }
                    break;
                case "xml":
                case "XML":





                    $out.= $this->xmlToOptions($selectData, $select_field_text, $inputdefault);
                    break;

                case "template_classs":
                    $mydata = $this->db->get_row("com_install", "", "ins_type='template' and enabled='1' and `delete`='0' ");
                    $file = "../" . $this->foldersMap->fornt_templates_folder . $mydata['ins_alias'] . "/" . $this->variables->porpertiesFile . ".xml";
                    $out.= $this->xmlToOptions2($file, $this->variables->xml_classs, $inputdefault);

                    break;
                case "template_positions":
                    $mydata = $this->db->get_row("com_install", "", "ins_type='template' and enabled='1' and `delete`='0' ");
                    $file = "../" . $this->foldersMap->fornt_templates_folder . $mydata['ins_alias'] . "/" . $this->variables->porpertiesFile . ".xml";
                    $out.= $this->xmlToOptions2($file, $this->variables->xml_positions, $inputdefault);
                    break;

                case "usstates":
                    $file = $stringmyurl . $this->foldersMap->lib_folder . "xml/usstates.xml";
                    $out.=$this->xmlToOptionsVal($file, "ussates", $inputdefault, $select_field_value);

                    break;
                case "egstates":


                    $file = $stringmyurl . $this->foldersMap->lib_folder . "xml/egstates_" . $this->util->siteSetting['lang'] . ".xml";
                    $out.=$this->xmlToOptionsVal($file, "egstates", $inputdefault, $select_field_value);

                    break;
                case "countries":

                    $file = $stringmyurl . $this->foldersMap->lib_folder . "xml/countries.xml";
                    $out.=$this->xmlToOptionsVal($file, "countries", $inputdefault, $select_field_value);
                    break;
                case "countries2CO":
                    $file = $stringmyurl . $this->foldersMap->lib_folder . "xml/countries2CO.xml";
                    $out.=$this->xmlToOptionsVal($file, "countries2CO", $inputdefault, $select_field_value);
                    break;


                case "days":
                    $file = $stringmyurl . $this->foldersMap->lib_folder . "xml/days.xml";
                    $out.=$this->xmlToOptionsVal($file, "days", $inputdefault, $select_field_value);
                    break;
                case "months":
                    $file = $stringmyurl . $this->foldersMap->lib_folder . "xml/months.xml";
                    $out.=$this->xmlToOptionsVal($file, "months", $inputdefault, $select_field_value);
                    break;
                case "DB":

                    $c = "*";



                    if (isset($fild['custemData'])) {


                        $c = $fild['custemData'];
                    }
                    if (isset($customData) && $customData != "") {

                        $c = $customData;
                    }
                    if ($select_query == "") {

                        $select_query = " `delete`='0' ";
                    } else {

                        $select_query .=" and `delete`='0' ";
                    }
                    $mydatatest = $this->db->get_Data($selectData, $c, $select_query);
                    if ($tree == "yes") {
                        $mydata = $this->db->get_row($selectData, "min(cat_id) as cat_id");
                        $out.= $this->getoptionsFormDBCat($selectData, $mydata['cat_id'], $select_field_text, $select_field_value, $inputdefault, $customData, $select_query);
                    } else {



                        $mydata = $this->db->get_Data($selectData, $c, $select_query);
                        foreach ($mydata as $mdata) {
                            $val = $mdata[$select_field_text];
                            if (isset($select_field_value) && $select_field_value != "") {
                                $val = $mdata[$select_field_value];
                            }
                            $out.="<option  " . $this->isSelect($inputdefault, $val) . " value=\"" . $val . "\">" . $mdata[$select_field_text] . "</option>";
                        }
                    }
                    break;
                default :


                    $out.=$this->arrayToOptions($selectData, $inputdefault);

                    break;
            }
        }



        return $out;
    }

    function arrayToOptions($selectData, $value) {

        if (!is_array($selectData)) {
            $mydata = explode(";", $selectData);
            foreach ($mydata as $fm) {
                $dd = explode(">>", $fm);
                $mret[$dd[0]] = $dd[1];
            }


            $selectData = $mret;
        }


        foreach ($selectData as $i => $v) {
            $out.="<option " . $this->isSelect($value, $i) . " value=\"" . $i . "\">" . $v . "</option>";
        }

        return $out;
    }

    function getoptionsFormDBCat($selectData, $id, $select_field_text, $select_field_value, $inputdefault, $customData, $select_query) {
// $select_query
        $mydata = $this->db->get_Data($selectData, "*", "cat_id=" . $id);
        if (is_array($mydata[0])) {
            $this->moreout.="&ensp; ";
        }




        $out = "";

        foreach ($mydata as $mdata) {



            $val = $mdata[$select_field_text];
            if (isset($select_field_value) && $select_field_value != "") {
                $val = $mdata[$select_field_value];
            }


            $du = "";
            $du = $this->moreout . "|_";

            $out.="<option  " . $this->isSelect($inputdefault, $val) . " value=\"" . $val . "\">" . $du . $mdata[$select_field_text] . "</option>";



            $out.= $this->getoptionsFormDBCat($selectData, $mdata['id'], $select_field_text, $select_field_value, $inputdefault, $customData, $select_query);
        }





        return $out;
    }

    function getTabelStrign($type, $data, $id, $filed) {
        $returnData = "";

        $returnData.="<table>";

        if ($type == "db") {
            $mydata = $this->db->get_Row($data, "*", "id=" . $id);
            $allf = explode(";", $mydata[$filed]);
            foreach ($allf as $s) {


                $sData = explode("__", $s);

                $title = $this->util->getLangVar($sData[0]);
                $value = $this->util->getLangVar($sData[1]);

                $clreaTitle = str_replace("lang[", "", $sData[0]);
                $clreaTitle = str_replace("]", "", $clreaTitle);

                $clreaTitle = str_replace(" ", "_", $clreaTitle);

                $returnData.="<tr class='provaluestr " . $clreaTitle . "'><td class='provaluestd1 " . $clreaTitle . "' >" . $title . "</td><td class='provaluestd2 " . $clreaTitle . "' >" . $value . "</td></tr>";
            }
//   print_r($allf);
        }


        $returnData.="</table>";


        return $returnData;
    }

    function getFiledsFormStrign_bck($type, $data, $id, $filed, $save) {
        $REDATA = "";


        if ($type == "db") {

            $mydata = $this->db->get_Row($data, "*", "id=" . $id);


            $allf = explode(";", $mydata[$filed]);

            $formname = "";


            foreach ($allf as $s) {


                $row = explode("__", $s);
                if (trim($row[2]) != "" && $row[2] != null) {


                    if ($row[2] == "form") {

                        $formname = $row[0];
                    }


                    $title = $this->util->getLangVar($row[1], $formname);
                    $value = $this->util->getLangVar($row[3], $formname);
                    $this->filds[0]['name'] = $row[0];
                    $this->filds[0]['title'] = $title;
                    $this->filds[0]['type'] = $row[2];
                    $this->filds[0]['value'] = ">>>" . urldecode($value);
                    ;
                    $this->filds[0]['action'] = "";
                    $this->filds[0]['method'] = "post";

                    if (trim($row[4]) == "required") {
                        $this->filds[0]['class'] = "required";
                    }




                    $this->filds[0]['type'] = $row[2];




                    switch ($row[2]) {
                        case 'select':

                            $this->filds[0]['select_type'] = $row[5];
                            if ($row[5] != "DB" && $row[5] != "XML" && $row[5] != "DIR") {
                                $this->filds[0]['select_type'] = "";

                                $values = explode(",", $row[7]);
                                $texts = explode(",", $row[8]);
                                $dd = "";
                                for ($i = 0; $i < count($values); $i++) {
                                    $dd[$texts[$i]] = $values[$i];
                                }

                                $this->filds[0]['select_data'] = $dd;
                            } else {

                                $this->filds[0]['select_data'] = $row[6];
                                $this->filds[0]['select_value'] = $row[7];
                                $this->filds[0]['select_text'] = $row[8];
                            }





                            break;
                    }


                    $REDATA.= $this->CraetForm();




                    if ($row[2] == "form") {



                        if (isset($_POST['formName']) && $save != "0") {


                            $msgtitle = "lang[" . $_POST['formName'] . "MsgTitle]";
                            $msgBosy = "lang[" . $_POST['formName'] . "MsgBody]";
                            $_POST['password'] = md5($_POST['password']);

                            $mydata = $this->db->insert_row($_POST['formName'], $_POST);
//   $this->util->sendMassage("succ", $this->util->getLangVar($msgtitle), $this->util->getLangVar($msgBosy));
                        }


                        $this->filds[0]['name'] = "formName";
                        $this->filds[0]['type'] = "hidden";
                        $this->filds[0]['value'] = $row[3];
                        $REDATA.= $this->CraetForm();
                    }
                }
            }
        }




        return $REDATA;
    }

    function tarray($ds) {
        $d = "";
        $d1 = str_replace("=>", "=", $ds);
        $r = explode("__", $d1);

        foreach ($r as $k => $v) {
            if (isset($v) && trim($v) != "") {
                $vs = explode("=", $v);
                $d[$vs[0]] = $vs[1];
            }
        }
        return $d;
    }

    function getFiledsFormStrign($type, $data, $id = "", $filed = "", $save = "", $lang = "", $sendmail = "", $prf = "", $values = "") {
        $REDATA = "";
        $this->filds = "";





        $values = $this->tarray($values);



        if ($type == "db") {
            $more = "";
            if ($id) {
                $more = " id='" . $id . "' and";
            }
            $datas = $this->db->get_data($data, "*", $more . "   enabled='1' and `delete`='0'");



            if ($prf != "") {


                $prf = $prf . "__";
            }
            //  print_R($mydata);






            IF ($lang != "") {

                $this->lngFile = $lang;
                $formname = $lang;
            }



            foreach ($datas as $mydata) {


                $allf = explode(";", $mydata[$filed]);



                foreach ($allf as $s) {




                    if ($this->notLang != "Y") {

                        $s = $this->util->data->TextVarUpdate("", $s, $lang);
                    }



                    $row = $this->tarray($s);
                    //      print_r($row);




                    if (trim($row['type']) != "" && $row['type'] != null) {
                        if ($row['type'] == "form") {

                            $formname = $row['name'];
                        }







                        //    $title = $this->util->data->varUpdate($row['title'], $formname);
                        // $title = $this->util->data->TextVarUpdate($lang, $row['title']);
                        //  $title = $this->util->data->varUpdate($row['title'], $lang);



                        if (isset($values[$row['name']])) {


                            $row['value'] = $values[$row['name']];
                        }



                        if ($this->notLang != "Y") {



                            $title = $this->util->data->varUpdate($row['title'], $lang);
                            $value = $this->util->data->varUpdate($row['value'], $lang);

                            $row['title'] = $this->util->data->varUpdate($row['title'], $lang);
                            $row['value'] = $this->util->data->varUpdate($row['value'], $lang);
                        }






                        $this->filds[0] = $row;
                        $this->filds[0]['name'] = $prf . $row['name'];
                        //      $this->filds[0]['title'] = $title;
                        $this->filds[0]['type'] = $row['type'];
                        //  $this->filds[0]['value'] = $value;
                        $this->filds[0]['action'] = "";
                        $this->filds[0]['method'] = "post";
                        $this->filds[0]['moreactions'] = $row['moreactions'];
                        $this->filds[0]['pclass'] = $row['widthmode'];

                        $this->filds[0]['styleMode'] = $row['styleMode'];

                        $this->filds[0]['dateto'] = $row['dateToinput'];
                        $this->filds[0]['minDate'] = $row['minDate'];
                        $this->filds[0]['maxDate'] = $row['maxDate'];





                        $this->filds[0]['m'] = $row['name'];


                        if (trim($row['required']) == "required") {
                            $this->filds[0]['class'] = "required";
                        }




                        $this->filds[0]['type'] = $row['type'];




                        switch ($row['type']) {
                            case 'select':

                                $this->filds[0]['select_type'] = $row['type'];
                                if ($row['select_type'] != "DB" && $row['select_type'] != "XML" && $row['select_type'] != "DIR" && $row['select_type'] != "months" && $row['select_type'] != "days" && $row['select_type'] != "countries" && $row['select_type'] != "countries2CO" && $row['select_type'] != "usstates"
                                ) {
                                    $this->filds[0]['select_type'] = "";



                                    if ($this->notLang != "Y") {




                                        $row['select_text'] = $this->util->data->varUpdate($row['select_text'], $lang);
                                        $row['select_value'] = $this->util->data->varUpdate($row['select_value'], $lang);
                                    }





                                    $row['select_text'] = urldecode($row['select_text']);
                                    $row['select_value'] = urldecode($row['select_value']);

                                    $row['select_text'] = $this->util->data->TextVarUpdate("", $row['select_text'], $lang);

                                    $row['select_value'] = $this->util->data->TextVarUpdate("", $row['select_value'], $lang);


                                    $values = explode(",", $row['select_value']);
                                    $texts = explode(",", $row['select_text']);




                                    $dd = "";
                                    for ($i = 0; $i < count($values); $i++) {
                                        $dd[$values[$i]] = $texts[$i];
                                    }

                                    $this->filds[0]['select_data'] = $dd;
                                } else {

                                    $this->filds[0]['select_type'] = $row['select_type'];
                                    $this->filds[0]['select_data'] = $row['select_data'];
                                    $this->filds[0]['select_value'] = $row['select_value'];
                                    $this->filds[0]['select_text'] = $row['select_text'];
                                }








                                break;


                            case 'form':
                                if (isset($row['saveType']) && $row['saveType'] == "sesstion") {
                                    $REDATA .= '<script> setFormvalidation("' . $row['name'] . '" ,"addtosession","' . $row['saveTo'] . '","' . $_GET['lang'] . '")</script>';
                                    $this->filds[0]['novalidation'] = "1";
                                }




                                $this->lngFile = $row['name'];
                                break;
                            case 'submit':
                                $this->filds[0]['value'] = $title;

                                break;
                        }


                        $REDATA.= $this->CraetForm();




                        if ($row["type"] == "form") {

                            $REDATA.="<script>$(function(){" . urldecode($row['javascript']) . "})</script>";
                            $REDATA.="<style>" . urldecode($row['css']) . "</style>";

                            if ($row['php'] != "") {

                                $row['php']();
                            }




                            if (isset($_POST['formName']) && isset($row['saveType']) && $row['saveType'] == "DBTabel") {
                                $_POST['created'] = date("Y-m-d H:i:s");

                                $_POST['password'] = md5($_POST['password']);

                                $mydata = $this->db->insert_row($row['saveTo'], $_POST);



                                if ($row['phpAfterSave'] != "") {

                                    $row['phpAfterSave']();
                                }



                                if ($mydata == "1") {
                                    $this->util->sendMassage("smsg", "", $this->util->getLangVar($row['SMsg']));
                                } else {
                                    $this->util->sendMassage("fmsg", "", $this->util->getLangVar($row['FMsg']));
                                }
                            } else if (isset($_POST['formName']) && isset($row['saveType']) && $row['saveType'] == "sesstion") {
                                
                            }









                            $this->filds[0]['name'] = "formName";
                            $this->filds[0]['type'] = "hidden";
                            $this->filds[0]['value'] = $row['value'];


                            $REDATA.= $this->CraetForm();
                        }
                    }
                }
            }
        }




        return $REDATA;
    }

}

?>