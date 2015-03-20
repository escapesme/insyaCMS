

<?

//include_once("functions.php");
/* Admin.class V0.4 By Ahmed Abdellatif
 * 
 * 
 * 
 * table_specs{
 *  	type	[input,date,time,password,checkbox,textarea,richeditor,select,radio,upload,pic]
 *  	name
 *  	title
 *  	class
 *  	select_query
 *  	select_data_table
 *  	select_data
 * 	 	select_title_fild
 * 		select_id_fild
 *  	required
 *  	select_data
 *  }
 */
class admin {

    var $cattype;
    var $table_name;
    var $table_specs;
    var $imageslink;
    var $edit_id;
    var $mode;
    var $list_action_add;
    var $list_action_edit;
    var $list_action_delete;
    var $list_extra_actions;
    var $list;
    var $order;
    var $ost;
    var $list_query;
    var $extra_form_html;
    var $show_delet;
    var $allcity;

    function get_html() {
        switch ($this->mode) {
            case 'add':
            case 'edit':
                return $this->_render_form();
                break;
            case 'list':
                return $this->_render_list();
                break;
            case 'delete':
                break;
        }
    }

    function doit() {
        global $db;
        foreach ($this->table_specs as $fild) {
            if ($fild['type'] == 'checkbox') {
                if ($_POST[$fild['name'] . '_check_']) {
                    if (!$_POST[$fild['name']]) {
                        $_POST[$fild['name']] = '0';
                    }
                }
            }
            if ($fild['type'] == 'upload' || $fild['type'] == 'pic') {
                $uploadfile = 'uploads/' . basename($_FILES[$fild['name']]['name']);
                move_uploaded_file($_FILES[$fild['name']]['tmp_name'], $uploadfile);
                $_POST[$fild['name']] = basename($_FILES[$fild['name']]['name']);
            }
            if ($fild['type'] == 'password') {
                $_POST[$fild['name']] = md5($_POST[$fild['name']]);
            }
            if ($fild['type'] == 'autocomplete') {
                $row = $db->get_row($fild['select_table'], 'id', "title LIKE '" . $_POST[$fild['name']] . "'");
                $_POST[$fild['name']] = $row['id'];
            }
        }
        foreach ($_POST as $k => $v) {
            $fdata[$k] = mysql_real_escape_string($v);
        }
        switch ($this->mode) {
            case 'add':
                $db->insert_row_city($this->table_name, $fdata);
                break;
            case 'edit':
                $db->update_row($this->table_name, $fdata, $this->edit_id);
                break;
            case 'delete':
                //	$db->delete_row($this->table_name,$this->edit_id);

                $fda = array('delete' => '1');
                $db->update_row($this->table_name, $fda, $this->edit_id);


                echo '<meta http-equiv="refresh" content="0;url=' . $_SESSION['mybakurl'] . '" />';
                break;
        }
    }

    function _render_form() {


        echo '<div id=back_bt ><a href=' . $_SESSION['mybakurl'] . '> <<< Back </a> <div>';

        global $db;

        $fclass = "form_row";
        if ($this->mode == 'edit') {
            $data = $db->get_row($this->table_name, '', 'id=' . $this->edit_id);
        }
        foreach ($this->table_specs as $fild) {
            if ($fild['required']) {
                $req = 'required';
            } else {
                $req = '';
            }
            switch ($fild['type']) {


                case 'input':

                case 'time':
                    $input_html = '<input  class="form_text" name="' . $fild['name'] . '" id="' . $fild['name'] . '" value="' . $data[$fild['name']] . '" class="' . $req . ' ' . $fild['class'] . '" type="input" />';
                    break;

                case 'date':

                    $input_html = '<input  class="form_text" name="' . $fild['name'] . '" id="' . $fild['name'] . '" value="' . $data[$fild['name']] . '" class="' . $req . ' ' . $fild['class'] . '" type="input" />
                    
                    <script>$(function(){ $(\'#' . $fild['name'] . '\').datepicker({dateFormat:\'dd/mm/yy\'});})</script>
                    ';
                    break;
                case 'password':
                    $input_html = '<input class="form_text" name="' . $fild['name'] . '" id="' . $fild['name'] . '" class="' . $req . ' ' . $fild['class'] . '" type="password" />';
                    break;
                case 'checkbox':
                    if ($data[$fild['name']] == 1) {
                        $checked = ' checked';
                    } else {
                        $checked = '';
                    }
                    $input_html = '<input name="' . $fild['name'] . '" id="' . $fild['name'] . '" value="1" class="' . $req . ' ' . $fild['class'] . '" type="checkbox" ' . $checked . ' /><input name="' . $fild['name'] . '_check_" value="1" type="hidden" />';
                    break;
                case 'textarea':
                    $fclass = "form_row_texterea";
                    $input_html = '<textarea class="form_texteara" style="width:500px;height:300px;" name="' . $fild['name'] . '" id="' . $fild['name'] . '" class="' . $req . ' ' . $fild['class'] . '">' . $data[$fild['name']] . '</textarea>';
                    break;
                case 'richeditor':
                    $fclass = "form_row";
                    $input_html = '<textarea class="form_texteara" name="' . $fild['name'] . '" id="' . $fild['name'] . '" class="' . $req . ' ' . $fild['class'] . '">' . $data[$fild['name']] . '</textarea>';
                    break;
                case 'select':
                    $input_html = '<select  class="form_text" name="' . $fild['name'] . '" id="' . $fild['name'] . '" class="' . $req . ' ' . $fild['class'] . '">';
                    $input_html.=$this->_get_select_data($fild, $data[$fild['name']]);
                    $input_html.='</select>';
                    break;


                case 'list':
                    $input_html = '<select  multiple="multiple" class="form_text" name="' . $fild['name'] . '" id="' . $fild['name'] . '" class="' . $req . ' ' . $fild['class'] . '">';
                    $input_html.=$this->_get_select_data($fild, $data[$fild['name']]);
                    $input_html.='</select>';
                    break;





                case 'autocomplete':
                    $input_html = '<input class="form_text" name="' . $fild['name'] . '" id="' . $fild['name'] . '" class="' . $req . ' ' . $fild['class'] . '" />';


                    $input_html.="<script language=\"javascript\">
					window.onload = function ()
            		{
               			 data_" . $fild['name'] . " = [" . $this->_get_ac_data($fild, $data[$fild['name']]) . "].sort();
        
            	    	AutoComplete_Create('" . $fild['name'] . "', data_" . $fild['name'] . ");
            }
					</script>";
                    break;


                case 'radio':
                    $input_html = '<select name="' . $fild['name'] . '" id="' . $fild['name'] . '" class="' . $req . ' ' . $fild['class'] . '">';
                    $input_html.=$this->_get_radio_data($fild, $data[$fild['name']]);
                    $input_html = '</select>';
                    break;
                case 'upload':
                case 'pic':
                    $input_html = '';
                    if ($data[$fild['name']]) {
                        if ($fild['type'] == 'pic') {
                            $input_html = '<br /><a  href="uploads/' . $data[$fild['name']] . '"><img  class="form_pic" src="uploads/' . $data[$fild['name']] . '"></a>';
                        } else {
                            $input_html = '<a href="uploads/' . $data[$fild['name']] . '">' . $data[$fild['name']] . '</a>';
                        }
                        $req = '';
                    }
                    $input_html.='<br /><input class="form_file" name="' . $fild['name'] . '" id="' . $fild['name'] . '" class="' . $req . ' ' . $fild['class'] . '" type="file" />';
                    break;
            }


            $html.='<div class="' . $fclass . '">
							<div class="field-label"><label for="' . $fild['name'] . '">' . $fild['title'] . '</label>:</div>
							<div class="field-widget">' . $input_html . '</div>
						</div>';
        }
        if ($this->mode == 'edit') {
            $html.='<center><input name="submit" class="form_update" value="Update" type="submit" /></center>';
        } else {
            $html.='<center><input name="submit" class="form_Add"  value="Add" type="submit" /></center>';
        }




        return '<form  enctype="multipart/form-data" name="' . $this->table_name . '_form" id="' . $this->table_name . '_form" method="POST">' . $html . $this->extra_form_html . '</form>
		<script type="text/javascript">
						
					//	var valid = new Validation(\'' . $this->table_name . '_form\', {immediate : true});

					</script>
		';
    }

    function _get_select_data($fild, $value) {
        global $db;
        $html.='<option></option>';
        if (!$fild['select_title_fild']) {
            $fild['select_title_fild'] = 'title';
        }
        if (!$fild['select_id_fild']) {
            $fild['select_id_fild'] = 'id';
        }
        if ($fild['select_data']) {
            $data = $fild['select_data'];
        } else {
            
              if ($this->allcity != null and $this->allcity != "") {
                  
                  
              }
            
            if ($fild['select_query']) {
                $data = $db->get_data_query($fild['select_query']);
            } else {
                $data = $db->get_data($fild['select_data_table'], '', 'id <>0 ' . getjcity(" and ", $this->table_name));
            }
        }



        foreach ($data as $k => $row) {
            if ($row['id'] == $value) {
                $selected = ' selected';
            } else {
                $selected = '';
            }
            if ($fild['select_data']) {
                $html.='<option value="' . $k . '" ' . $selected . '>' . $row . '</option>';
            } else {
                $html.='<option value="' . $row[$fild['select_id_fild']] . '" ' . $selected . '>' . $row[$fild['select_title_fild']] . '</option>';
            }
        }
        return $html;
    }

    function _get_ac_data($fild, $value) {
        global $db;

        if (!$fild['select_title_fild']) {
            $fild['select_title_fild'] = 'title';
        }
        if (!$fild['select_id_fild']) {
            $fild['select_id_fild'] = 'id';
        }
        if ($fild['select_data']) {
            $data = $fild['select_data'];
        } else {
            if ($fild['select_query']) {
                $data = $db->get_data_query($fild['select_query']);
            } else {
                $data = $db->get_data($fild['select_data_table']);
            }
        }
        foreach ($data as $k => $row) {

            $html.="'" . $row[$fild['select_title_fild']] . "',";
        }
        $html = $html . ';';
        $html = str_replace("';", '', $html);
        return $html;
    }

    function _render_list() {

        $_SESSION['mybakurl'] = curPageURL();



        global $db;


        if (isset($_POST['submit_order_x'])) {


            for ($i = 0; $i < count($_POST['myidord']); $i++) {
                $mm = array('order' => $_POST['orderval'][$i]);
                $db->update_data($this->table_name, $mm, "id=" . $_POST['myidord'][$i]);
            }
        } elseif (isset($_POST['submit_enable_x'])) {
            for ($i = 0; $i < count($_POST['myidord']); $i++) {

                $mm = array($_POST['input_name'] => $_POST['enable'][$i]);
                $db->update_data($this->table_name, $mm, "id=" . $_POST['myidord'][$i]);
            }
        }



        $html.= '<form action=""  method="post">';
        $od = "";
        $city = getjcity();
        
      

        if ($this->allcity != null and $this->allcity != "") {
            $city = "";
        }


        if (isset($_GET['ord_n'])) {
            $od = 'ORDER BY ' . $_GET['ord_n'] . ' ASC';
        } else {


            $od = 'ORDER BY id DESC';
        }

        if ($this->list_query) {
            $data = $db->get_data_query($this->list_query);
        } else {
            if ($show_delet == "") {


                $data = $db->get_data($this->table_name, '', "1=1 " . $city . $od);
            } else {

                $data = $db->get_data($this->table_name, '', "1=1 " . $city . " and `delete` ='0' " . $od);
            }
        }








        $html.='<table width="98%" border="1" dir="ltr">';
        $html.='<thead>';
        if ($this->list_action_edit || $this->list_action_delete) {
            $html.='<th class="tdoptions" >Options</th>';
        }



        foreach ($this->list as $col) {

            $html.='<th id=\"' . $this->table_specs[$col]['title'] . '\" >';
            if ($this->order != 1) {
                $html.='<a href="?action=' . $_GET['action'] . '&g_id=' . $_GET['g_id'] . '&g_id2=' . $_GET['g_id2'] . '&g_id3=' . $_GET['g_id3'] . '&ord_n=' . $this->table_specs[$col]['name'] . '" >' . $this->table_specs[$col]['title'] . '</a>';
            } else {

                $html.=$this->table_specs[$col]['title'];
            }

            if ($this->table_specs[$col]['title'] == 'Order') {
                $html.= ' <input alt="save"  name="submit_order"    type="image" src="images/save.png"/> ';
            } else if ($this->table_specs[$col]['type'] == 'checkbox') {

                $html.= ' <input alt="save" name="submit_enable"  type="image" src="images/save.png"/> ';
            }


            $html.= '</th>';
        }




        $html.='</thead>';
        $html.='<tbody>';
        if ($data) {
            foreach ($data as $row) {
                $html.='<tr>';

                if ($this->list_action_edit || $this->list_action_delete || $this->list_extra_actions) {
                    $html.='<td class="tdoptions" width="15%">';
                }
                if ($this->list_action_edit) {
                    $html.='<a href="' . $this->list_action_edit . $row[id] . '"><img src="' . $this->imageslink . '/faiz/images/edit.gif" alt="edit" /></a>&nbsp;';
                }
                if ($this->list_action_delete) {
                    $html.='&nbsp;<a  onclick="if(confirm(\'Are you sure you want to delete ?\')){return true;}else{return false;}" href="' . $this->list_action_delete . $row[id] . '"><img src="' . $this->imageslink . '/faiz/images/delete.gif" alt="delete" /></a>';
                }
                if ($this->list_extra_actions) {
                    foreach ($this->list_extra_actions as $lnk) {
                        $html.='&nbsp;<a  href="' . $lnk['link'] . $row[id] . '">' . $lnk['title'] . '</a>';
                    }
                }

                if ($this->list_action_edit || $this->list_action_delete || $this->list_extra_actions) {
                    $html.='</td>';
                }



                foreach ($this->list as $col) {

                    if ($this->table_specs[$col]['name'] == 'order') {
                        $html.='<td><input  value="' . $row[id] . '"  type="hidden"  name="myidord[]"    /> <input  value="' . $row[$col] . '" style="text-align: center;"  size="5"  name="orderval[]"    /> </td>';
                    } else {


                        switch ($this->table_specs[$col]['type']) {
                            case 'date':
                                $html.='<td>' . data_from_db($row[$col]) . '</td>';
                                break;
                            case 'time':
                                $html.='<td>' . date('h:i', $row[$col]) . '</td>';
                                break;
                            case 'textarea':
                                $html.='<td>' . nl2br($row[$col]) . '</td>';
                                break;
                            case 'checkbox':
                                $html.='<td>
                        
                        <input  value="' . $this->table_specs[$col]['name'] . '"  type="hidden"  name="input_name"    /> 
                        <input  value="' . $row[id] . '"  type="hidden"  name="myidord[]"    /> 
                        <select name="enable[]"  ><option ';

                                if ($row[$col] == 1) {
                                    $html.=' selected="selected" ';
                                }
                                $html.=' value=1 >Yes</option> <option ';

                                if ($row[$col] == 0) {
                                    $html.=' selected="selected" ';
                                }

                                $html.= ' value=0 >No</option>';
                                //($row[$col]?Yes:No)
                                // 


                                $html.='</select></td>';
                                break;
                            case 'select':
                                if ($this->table_specs[$col]['select_data']) {
                                    $sel_row = $this->table_specs[$col]['select_data'][$row[$col]];
                                } else {

                                    if ($this->cattype == 'title') {


                                        $sel_row = $db->get_row($this->table_specs[$col]['select_data_table'], '', 'title=' . "'" . $row[$col] . "'");
                                    } else {

                                        $sel_row = $db->get_row($this->table_specs[$col]['select_data_table'], '', 'id=' . $row[$col]);
                                    }
                                }
                                if (!$fild['select_title_fild']) {
                                    $fild['select_title_fild'] = 'title';
                                }

                                $html.='<td>' . $sel_row[$fild['select_title_fild']] . '</td>';
                                break;
                            case 'pic':
                                $html.='<td><a href="uploads/' . $row[$col] . '"><img width="80" height="80" src="uploads/' . $row[$col] . '" /></a></td>';
                                break;
                            default:
                                $html.='<td>' . ($row[$col]) . '</td>';
                                break;
                        }
                    }
                }

                $html.='</tr>';
            }
        }
        $html.='</tbody>';
        $html.='</table>';
        $html.= '</form>';

        return $html;
    }

}
?>