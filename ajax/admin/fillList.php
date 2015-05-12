<?php

$status = $_GET['status'];
$selectData = $_GET['selectData'];
$select_field_text = $_GET['select_field_text'];
$perfix = $_GET['prefx'];

global $lib;



switch ($status) {
    case "DIR":

        $vdata = $lib->files->readFilesNames($selectData, "dir", $perfix);
        asort($vdata);
        foreach ($vdata as $value) {
            $out.="<option >" . $value . "</option>";
        }
        break;

    case "countries":
        $file = "/libs/" . $lib->foldersMap->lib_folder . "xml/countries.xml";
        echo $file;
        $out.=$lib->files->xmlToOptionsVal($file, "countries", $inputdefault, $select_field_value);
        break;
    /* case "xml":
      case "XML":
      $out.= $lib->files->xmlToOptions($selectData, $select_field_text, $inputdefault);
      break;

      case "template_classs":
      $mydata = $lib->db->get_row("com_install", "", "ins_type='template' and enabled='1' and `delete`='0' ");
      $file = "../" . $lib->foldersMap->fornt_templates_folder . $mydata['ins_alias'] . "/" . $this->variables->porpertiesFile . ".xml";
      $out.= $this->xmlToOptions2($file, $lib->variables->xml_classs, $inputdefault);

      break;
      case "template_positions":
      $mydata = $lib->db->get_row("com_install", "", "ins_type='template' and enabled='1' and `delete`='0' ");
      $file = "../" . $lib->foldersMap->fornt_templates_folder . $mydata['ins_alias'] . "/" . $this->variables->porpertiesFile . ".xml";
      $out.= $this->xmlToOptions2($file, $lib->variables->xml_positions, $inputdefault);
      break;

      case "usstates":
      $file = $stringmyurl . $lib->foldersMap->lib_folder . "xml/usstates.xml";
      $out.=$lib->xmlToOptionsVal($file, "ussates", $inputdefault, $select_field_value);

      break;
      case "egstates":


      $file = $stringmyurl . $lib->foldersMap->lib_folder . "xml/egstates_" . $this->util->siteSetting['lang'] . ".xml";
      $out.=$lib->files->xmlToOptionsVal($file, "egstates", $inputdefault, $select_field_value);

      break;
      case "countries":

      $file = $stringmyurl . $lib->foldersMap->lib_folder . "xml/countries.xml";
      $out.=$lib->files->xmlToOptionsVal($file, "countries", $inputdefault, $select_field_value);
      break;
      case "countries2CO":
      $file = $stringmyurl . $lib->foldersMap->lib_folder . "xml/countries2CO.xml";
      $out.=$lib->files->xmlToOptionsVal($file, "countries2CO", $inputdefault, $select_field_value);
      break;


      case "days":
      $file = $stringmyurl . $lib->foldersMap->lib_folder . "xml/days.xml";
      $out.=$lib->files->xmlToOptionsVal($file, "days", $inputdefault, $select_field_value);
      break;
      case "months":
      $file = $stringmyurl . $lib->foldersMap->lib_folder . "xml/months.xml";
      $out.=$lib->files->xmlToOptionsVal($file, "months", $inputdefault, $select_field_value);
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
      $mydatatest = $lib->db->get_Data($selectData, $c, $select_query);
      if ($tree == "yes") {
      $mydata = $lib->db->get_row($selectData, "min(cat_id) as cat_id");
      $out.= $lib->getoptionsFormDBCat($selectData, $mydata['cat_id'], $select_field_text, $select_field_value, $inputdefault, $customData, $select_query);
      } else {



      $mydata = $lib->db->get_Data($selectData, $c, $select_query);
      foreach ($mydata as $mdata) {
      $val = $mdata[$select_field_text];
      if (isset($select_field_value) && $select_field_value != "") {
      $val = $mdata[$select_field_value];
      }
      $out.="<option  " . $val . " value=\"" . $val . "\">" . $mdata[$select_field_text] . "</option>";
      }
      }
      break;
      default :


      $out.=$this->arrayToOptions($selectData, $inputdefault);

      break; */
}


echo $out;
