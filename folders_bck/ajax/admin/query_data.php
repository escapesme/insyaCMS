<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */










$outData = "";

$updateSelect = ''
        . '<li class=" updateSelect " title="UpdaetSelect">'
        . '<i class="fa fa-refresh"></i></li>';






$typ = $_GET['status'];

$value = $_GET['value'];



$sqlcdataRorw = '

<div class="cdataRow">

<div class="line">
</div>
    <li style="width:20px; height:20px; cursor: pointer; clear:both" title="Delete ROW" class="deleteRow ">
      <i class="fa fa-trash-o"></i> 
    </li>';


$sqlcdataRorw .= createRadio("data", "Data");
$sqlcdataRorw .= createRadio("sum", "Sum");
$sqlcdataRorw .= createRadio("last", "Last");
$sqlcdataRorw .= createRadio("max", "Max");
$sqlcdataRorw .= createRadio("min", "Min");
$sqlcdataRorw .= createRadio("len", "Len");
$sqlcdataRorw .= createRadio("ROUND", "ROUND");
$sqlcdataRorw .= createRadio("COUNT", "COUNT");
$sqlcdataRorw .= createRadio("AVG", "AVG");
$sqlcdataRorw .= createRadio("UCASE", "UCASE");
$sqlcdataRorw .= createRadio("LCASE", "LCASE");
$sqlcdataRorw .='
    
<div title = "" class = "form_row    _parent col-2">
<div class = "field-label"><span><input type = "checkBox" class = "foredit" /></span><label> For Edit</label></div>

</div>

<div title = "" class = "form_row checkbox data_p  _parent _50 ">
<div class = "field-label"><label>Field</label></div>
<div class = "field-input"><select class = "addFileds"></select>' . $updateSelect . '</div>


</div>


<div title = "" class = "form_row   data_p  _parent _50 ">
<div class = "field-label"><label>Edit Field Name</label></div>
<div class = "field-input"><input type="text"class = "Filedas" /></div>


</div> 







</div>

';
$SqlCadatHrml = '
<div id = "textarea_count" title = "" class = "form_row radio data_p  _parent">
<div class = "field-input"><input type = "radio" value = "all" checked = \'checked\'  name="cdataType" class="cdataType checkbox"/></div>
    <div class="field-label"><label>All</label></div>
</div>


<div class=\'cDatarows \'>
    <li style="width:20px; height:20px; cursor: pointer; clear:both" title="Add Cdata" class="labelData addcdata ">
        <i class="fa fa-plus"></i>
    </li>
    ' . $sqlcdataRorw . '
</div>

<div class=\'clearfix\'></div>

';



$sqlwhereRowData = '

<div class="whereRow">
<div class="line">
</div>
    <li style="width:20px; height:20px; cursor: pointer; clear:both" title="Delete Row" class="deleteRow ">
<i class="fa fa-trash-o"></i> 
    </li>
    <div title=""   class="form_row select  disnone _parent  _50">
        <div class="field-label"><label>operation Type</label></div>
        <div class="field-input">
            <select class=" mor">
                <option>AND</option>
                <option>OR</option>

            </select>

        </div>



    </div>


    <div title=""   class="form_row select  disnone _parent _50">
        <div class="field-label"><label>Value Type</label></div>
        <div class="field-input">
            <select class=" whare_valueType">
                <option>text</option>
                <option>DBfield</option>

            </select>

        </div>



    </div>


    <div title="" class="form_row select   _parent _33">
        <div class="field-label"><label>Field</label></div>
        <div class="field-input"><select class="addFileds wherefileds"></select>' . $updateSelect . '</div>
    </div>


    <div title="" class="form_row select   _parent _33">
        <div class="field-label"><label>Operator</label></div>
        <div class="field-input">
            <select class="opr">
                <option>=</option>
                <option><></option>
                <option>=></option>
                <option>=<</option>
                <option>LIKE</option>
                <option>BETWEEN</option>
            </select></div>
    </div>

    <div title="" class="form_row select   _parent _33">
        <div class="field-label"><label>Value</label></div>
        <div class="whare_valuedata">
            <div class="text field-input"><input type="text" name="cwhereType"  class="textwhererow" /></div>
            <div class="DBfield field-input"><select class="addFileds selectwhererow "></select>' . $updateSelect . '</div>
        </div>


    </div>

<div class=\'clearfix\'></div>
</div>';


$sqlbracketsData = '
   <div class="Brackets">
    <li style="width:20px; height:20px; cursor: pointer; clear:both" title="Delete Brackets" class="deleteRow ">
      <i class="fa fa-trash-o"></i> 
    </li>
    <li style="width:20px; height:20px; cursor: pointer; clear:both" title="Add Cdata" class="labelData addwhere">
     <i class="fa fa-plus"></i>
    </li>

    ' . $sqlwhereRowData . '

</div>';

$SqlWhereHrml = '

<li style="width:20px; height:20px; cursor: pointer; clear:both" title="Add Brackets" class=" labelData addbrackets ">
<i class="fa fa-code"></i>
</li>

' . $sqlbracketsData . '

<div class=\'clearfix\'></div>
';


$sqljoinTypeOptionData = array(
    "JOIN" => "JOIN", "INNER JOIN" => "INNER JOIN", "OUTER JOIN" => "OUTER JOIN", "RIGHT JOIN" => "RIGHT JOIN", "FULL JOIN" => "FULL JOIN"
);


$sqljoinData = '
    <div class="joinRow">
    
<div class="line"></div>
    <li style="width:20px; height:20px; cursor: pointer; clear:both" title="Delete ROW" class="deletejoin ">
      <i class="fa fa-trash-o"></i> 
    </li>
    <div title="" class="form_row select   _parent _50">
        <div class="field-label"><label>JOIN Type</label></div>
        <div class="field-input">
            <select class="joinetype"> 
               ' . createSelectoption($sqljoinTypeOptionData, '') .
        '
            </select></div></div>
        <div title="" class="form_row checkbox data_p  _parent _50 ">
            <div class="field-label"><label>Field</label></div>
            <div class="field-input"><select  class=\'jointables tables\'>' . getAllTable() . '</select></div>
       
    </div>  
</div>
    ';




$SqlTaqblesHrml = '


<div title="" class="form_row checkbox data_p  _parent ">
    <div class="field-label"><label>Field</label></div>
    <div class="field-input"><select  class=\'tables\'>' . getAllTable() . '</select></div>
</div>


<div class="joinData_row labelData">
<div title="" class="form_row joinData_p   _parent ">
    <div class="field-label"><psn><input type="checkbox" name="climit"  id="innerc" class="joinData checkData" /></span><label>JOIN</label> </div>
    
</div>

<li style="width:20px; height:20px; cursor: pointer; clear:both" title="Add Inner" class="addinner">
    <i class="fa fa-plus"></i>
</li>
</div>




<div style="display:none" class="innerc disData">
    ' . $sqljoinData . '
</div>

<div class=\'clearfix\'></div>

';


/* * * */
$SqlMoreHrml = '
<div title="" class="moreRow">
  
<div class=" labelData">

<div title="" class="form_row select   _parent">
        <div class="field-label">
        <span><input type="checkbox" name="climit"  id="orderc" class="orderl checkData" /></span> 
        <label>orderBy</label></div>
   
    </div>
    
    </div>

    <div class="line"></div>



    <div class="orderc disData orderlData">
        <div title=""  class="form_row checkbox data_p  _parent _50">
            <div class="field-label"><label>Field</label></div>
            <div class="field-input"><select class="addFileds"></select>' . $updateSelect . '</div>
        </div>


        <div title="" class="form_row select   _parent _50">
            <div class="field-label"><label>sort</label></div>
            <div class="field-input">
                <select class="orderType">
                    <option>ASC</option>
                    <option>DESC</option>

                </select></div>
        </div>
    </div>

    <div title="" class="moreRow">




<div class=" labelData">
        <div title="" class="form_row select    _parent ">
            <div class="field-label"> <span><input type="checkbox" name="climit"  id="limitc" class=" limitl checkData" /></span><label>Value</label></div>
           
        </div>
           </div>


            <div class="line"></div>
        <div class="limitc disData limitlData">   
            <div title="" class="form_row select   _parent _50">
                <div class="field-label"><label>From</label></div>
                <div class="field-input"><input type="text" name="limitFrom"  class=" limitFrom textwhererow" /></div>
            </div>

            <div title="" class="form_row select   _parent _50">
                <div class="field-label"><label>number</label></div>
                <div class="field-input"><input type="text" name="climit"  class="limitNumber textwhererow" /></div>
            </div>

        </div>
    </div>
</div>




<div class=\'clearfix\'></div>
                        ';






switch ($typ) {



    case "getTableOptions":
        $outData.=getAllTable($value);
        break;
    case "jointypeOption":
        $outData.= createSelectoption($sqljoinTypeOptionData, $value);



        break;
    case "cdatarow":
        $outData.=$sqlcdataRorw;
        break;
    case "whereRow":
        $outData.=$sqlwhereRowData;
        break;

    case "brackets":
        $outData.=$sqlbracketsData;
        break;
    case "joinhtml":
        $outData.=$sqljoinData;
        break;
    case "wherehtml":
        $outData.=$SqlWhereHrml;
        break;

    case "all":
        $outData.=$SqlTaqblesHrml . "__" . $SqlCadatHrml . "__<div id=\"cwhererows1\" class='cwhererows'>" . $SqlWhereHrml . "</div>__" . $SqlMoreHrml;
        break;


    default :
        $outData.=$SqlTaqblesHrml . "__" . $SqlCadatHrml . "__<div id=\"cwhererows1\" class='cwhererows'>" . $SqlWhereHrml . "</div>__" . $SqlMoreHrml;
        break;
}

//getAllTable();

function getAllTable($select) {
    /* @var $lib  libs\libs */
    global $lib;
    $ds = $lib->util->data->getTablesNames();
    return createSelectoption($ds, $select);
    ;
}

function createSelectoption($array, $select = "") {
    /* @var $lib  libs\libs */
    global $lib;





    $returnData = "";
    foreach ($array as $k => $v) {
        $more = "";
        if ($select == $k) {
            $more = 'selected="selected"';
        }

        $returnData.="<option $more value='" . $k . "'>" . $v . "</option>";
    }
    return $returnData;
//  print_r(getfildes("com_products_order"));
}

function getfildes($tabel) {
    /* @var $lib  libs\libs */
    global $lib;
    return $lib->db->get_table_fields($tabel);
}

function createRadio($title, $val) {


    return '  
        <div  title="" class="form_row checkbox data_p  _parent col-2">
        <div class="field-label">
        <span><input type="radio"  value="' . $val . '"  name="cdataType" class="cdataType checkbox"/></span>
        <label>' . $title . '</label>
        </div>
    </div>';
}

print_r($outData);
?>





