<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of queryBluderClass
 *
 * @author empcl_000
 */

namespace libs\utiles;

class queryBluderClass {

    //put your code here
    //put your code here
    var $filterData = "";
    var $filterType = "and";
    var $queryID = "";
    var $dataID = "";
    var $queryData = "";
    var $databulderData = "";
    var $tabel = "sys_report";
    var $querytabel = "";
    var $EditTypeData = "";
    var $allcount = "";
    var $addlinkData = "";
    var $status = "";

    public function __construct($lib, $gen) {

        $this->lib = $lib;
        $this->gen = $gen;
    }

    function QuerygetData($valuesData, $status) {


        /* @var $lib  libs\libs */
        global $lib;
        $this->status = $status;
        $this->pages = $valuesData['pages'];

        if ($this->status == "full") {

            $this->pages = 0;
        }

        $this->ValuesData = $valuesData;
        $this->addlinkData = $valuesData['addlinkDVlaues'];
        $this->EditTypeData = $valuesData['editDVlaues'];


        $this->queryID = $valuesData['queryid'];
        if ($this->queryID != "") {


            $this->queryData = $lib->db->get_row('sys_query', "*", "id='" . $this->queryID . "'");
        }


        if (isset($_GET['fitlerdata'])) {


            $this->filterData = $_GET['fitlerdata'];
        } else {

            $d = "";
            $filterDVlaues = explode(",", $valuesData['filterDVlaues']);

            foreach ($filterDVlaues as $filterDVlaue) {
                $v = explode(">", $filterDVlaue);

                if ($v[0]) {


                    $d .= $this->getFieldFullTitle($v[0]) . "__" . $v[1] . ";";
                }
            }


            $this->filterData = $d;
        }
    }

    function getProperty($pro) {

        global $lib;

        $dt = $lib->util->data->updateStringTorray($this->databulderData['data']);
        return explode(",", $dt[$pro]);
    }

    function isProperty($pro, $field) {

        global $lib;
        $returnData = false;
        $pros = $this->getProperty($pro);
        foreach ($pros as $p) {
            if ($p == $field) {
                $returnData = true;
            }
        }
        return $returnData;
    }

    function renderQuery($type = "", $Datatype = "") {

        $rows = $this->UpdateQuery($this->queryData['data']);

        $d = "";
        switch ($type) {

            case "chart":

                $chartCor = "corechart";
                if ($this->ValuesData['chartType'] == "tabel") {
                    $chartCor = "tabel";
                } else if ($this->ValuesData['chartType'] == "Gauge") {
                    $chartCor = "gauge";
                }


                $d = $this->reChart("xxxxx", $rows, $Datatype, $chartCor);

                break;
            case "list":
                $d = $this->relist($rows);
                break;
            default :
                $d = $this->reTabel($rows);

                break;
        }



        return $d;
    }

    function reChart($title, $rows, $chartType = "ColumnChart", $core = "corechart") {
        $data = '
    <script type="text/javascript">';

        if ($chartType != "tabel") {

            $data .= '

    
      google.load("visualization", "1", {packages:["' . $core . '"]});
       google.setOnLoadCallback(drawChart);
     ';

            $data .= '
function drawChart() {

        var data = google.visualization.arrayToDataTable([
         ' . $this->getChartdatat($rows) . '
        ]);
';




            $data .= '
        var options = {
          title: \'  ' . $title . '\'
        };
                var chart = new google.visualization.' . $chartType . '(document.getElementById(\'chart\'));
  
     chart.draw(data, options);  }

  ';
        } else {

            $data .= '
     google.load("visualization", "1", {packages:["table"]});
      google.setOnLoadCallback(drawTable);
   

function drawTable() {
        var data = new google.visualization.DataTable();
        
' . $this->getChartdatatTabel($rows) . '

        var table = new google.visualization.Table(document.getElementById("chart"));
        table.draw(data, {showRowNumber: true});
}
';
        }


        $data.='
    </script>
    <div id="chart" style="width: 100%; height: 100%;"></div>';

        return $data;
    }

    function getChartdatatTabel($rows) {
        $i = 0;


        $c = 0;




        foreach ($rows[0] as $k => $v) {
            $d .="data.addColumn(\"string\", '" . $k . "');\n";

            $c++;
        }



        $d .= "data.addRows([";






        foreach ($rows as $cols) {
            $c = 0;
            if ($i > 0) {

                $d .=",";
            }
            $d .= "\n[";



            foreach ($cols as $k => $v) {

                if ($c > 0) {

                    $d .=",";
                }

                $d .= "\"" . $v . "\"";
                $c++;
            }
            $d .= "]";
            $i++;
        }
        $d .= "]);";

        return $d;
    }

    function getChartdatat($rows) {
        $i = 0;
        foreach ($rows as $cols) {

            $c = 0;
            if ($i > 0) {

                $d .=",";
            } else {


                $d .= "[";
                foreach ($cols as $k => $v) {

                    if ($c > 0) {

                        $d .=",";
                    } else {
                        
                    }


                    $d .="\"";

                    $d .= $k;


                    $d .="\"";


                    $c++;
                }


                $d .= "],\n";
            }




            $c = 0;

            $d .= "[";



            foreach ($cols as $k => $v) {

                if ($c > 0) {

                    $d .=",";
                } else {

                    $d .="\"";
                }




                $d .= $v;


                if ($c == 0) {

                    $d .="\"";
                }



                $c++;
            }


            $d .= "]\n";

            $i++;
        }

        return $d;
    }

    function returnWhere($mro) {



        $where = "";
        if ($this->filterData != "") {

            $fds = explode(";", $this->filterData);
            $i = 0;
            foreach ($fds as $fd) {
                $ds = explode("__", $fd);
                if ($ds[0] != "" && $ds[1] != "") {
                    $mor = "";
                    /* if ($i != 0) {
                      $mor = $this->filterType;
                      } */
                    $where.=$mor . "`$ds[0]`='$ds[1]'";
                    $i = 1;
                }
            }
        }



        //$_GET['page']
        //

        return $where . $mro;
    }

    function UpdateQuery($sql) {
        global $lib;
        
        $lib->db->query("CREATE or REPLACE  VIEW " . $this->tabel . " AS " . $lib->util->data->TextVarUpdate("", $sql));
        $lib->db->getEnable = "1";
        $lib->db->getDleleted = "1";


        $mwhere = "";
        if ($this->pages > 0) {


            $form = "0";
            if (isset($_GET['page'])) {

                $form = $_GET['page'];
            }
            $mwhere = "   limit " . $form . "," . $this->pages;
        }



        $rows = $lib->db->get_data($this->tabel, "*", " 1=1 " . $this->returnWhere($mwhere));
        $ll = $lib->db->get_data($this->tabel, "*", " 1=1 " . $this->returnWhere());
        $this->allcount = count($ll);
        $lib->db->getEnable = "";
        $lib->db->getDleleted = "";

        return $rows;
    }

    function getFieldAlias($filed) {
        $returnData = "";
        $cs = explode(";", $this->queryData['sql_cdata']);
        foreach ($cs as $c) {
            $cD = explode("__", $c);
            if ($cD[2] == $filed) {


                $returnData = $cD[1];
            }
        }

        return $returnData;
    }

    function arrayToHtml($array, $l) {
        $data = "";
        
        
       
        /* @var $lib  \libs\libs */
        global $lib;
        $array = $lib->util->data->updateArray($array);
        foreach ($array as $k => $v) {
            if (is_array($v)) {

                $ml = $k;
                if (isset($l[$k])) {


                    $ml = $l[$k];
                }


                $data.= "<div class='arraryRow'>"
                        . "<div class='arraryRowhader'>$ml</div>" . $this->arrayToHtml($v) . "</div>";
            } else {
                $ml = $k;
                if (isset($l[$k])) {


                    $ml = $l[$k];
                }


                $data.="<div class='sessarray _$k _$v'><label>$ml</label><div class='value'>$v</div></div>";
            }
        }
        return $data;
    }

    function getFieldTitle($filed) {
        $returnData = "";
        $cs = explode(";", $this->queryData['sql_cdata']);


        //print_r($filed);
        foreach ($cs as $c) {
            $cD = explode("__", $c);
            $p = $cD[1];
            $ps = explode(".", $cD[1]);

            if (isset($ps[1])) {
                $p = $ps[1];
            }

            if ($p == $filed) {


                $returnData = $cD[2];
            }
        }




        return $returnData;
    }

    function getFieldFullTitle($filed) {
        $returnData = "";
        $cs = explode(";", $this->queryData['sql_cdata']);


        //print_r($filed);
        foreach ($cs as $c) {
            $cD = explode("__", $c);


            if ($cD[1] == $filed) {


                $returnData = $cD[2];
            }
        }




        return $returnData;
    }

    function getQueryTabel($field) {

        $field = $this->getFieldAlias($field);
        $fs = explode(".", $field);
        if (isset($fs[1])) {

            $querytabel = $fs[0];
        } else {

            $querytabel = $this->queryData['sql_table'];
        }



        return $querytabel;
    }

// <editor-fold defaultstate="collapsed" desc="Rnder HTML">


    function renderEditableHeahderHtml($field) {

        $returndata = "<div id='" . $field . "__" . $this->getFieldAlias($field) . "' class='updateData'>S</div>";

        return $returndata;
    }

    function renderEditableBodyHtml($field, $id, $value) {
        /* @var $lib  \libs\libs */
        global $lib;

        $oField = $this->getFieldAlias($field);
        $qtable = $this->getQueryTabel($field);
        $ftype = $lib->util->data->getFieldType($qtable, $this->getFieldAlias($field));
        $ftypes = explode("(", $ftype);
        $returndata = $ftypes[0];

        switch ($ftypes[0]) {


            case "tinyint":
                $checked = "";

                if ($value == "1") {
                    $checked = "checked";
                }


                $returndata = "<input id='$id'  class='$field data' $checked type='checkbox' value='1' />";




                break;



            case "text":





                $returndata = "<textarea id='$id'  class='$field data'  />$value</textarea>";
                break;


            case "datetime":



            /*
              $returndata = "<input  name='$id' id='$id' class='$field data'  value=' " . $lib->util->dateFromdb($value) . "' type='datetime' />";

              break; */
            case "date":
                $returndata = "<input  name='$id' id='$id' class='$field data'  value='" . $lib->util->dateFromdb($value) . "' type='input' />";
                $returndata .= '<script>$(function(){  $( "#' . $id . '" ).datepicker({ dateFormat: "dd/mm/yy" });    });</script>';
                break;



            case "int":
                $chrlimt = str_replace(")", "", $ftypes[1]);
                $returndata = "<input id='$id' class='$field data'  maxlength='$chrlimt' value='$value' type='number' />";
                break;
            default:



                $typeDes = "";

                $editDVlaues = explode(",", $this->EditTypeData);



                foreach ($editDVlaues as $editDVlaue) {
                    $v = explode(">", $editDVlaue);

                    if ($v[0]) {
                        if ($field == $this->getFieldFullTitle($v[0])) {

                            $typeDes = $v[1];
                        } else {
                            
                        }
                    }
                }


                $chrlimt = str_replace(")", "", $ftypes[1]);

                if ($typeDes == "comboBox") {





                    $returndata = "<select id='$id' class='$field data'  maxlength='$chrlimt'  >";

                    $rows = $lib->db->get_data($qtable, "DISTINCT " . $oField . " as myDIS");




                    foreach ($rows as $v) {

                        $select = ''
                        ;
                        if ($v['myDIS'] == $value) {

                            $select = 'selected'
                            ;
                        }
                        $returndata .= " <option  $select >" . $v['myDIS'] . "</option>";
                    }


                    $returndata .= " </select>";
                } else {

                    $returndata = "<input id='$id' class='$field data'  maxlength='$chrlimt' value='$value' type='text' />";
                }





                break;
        };
        return $returndata;
    }

    var $rowNumber = "";

    function updatehtml($k, $value, $allrow) {

        $this->rowNumber++
        ;
        $returndata = $value;
        /* @var $lib  \libs\libs */
        global $lib;

        $al = $this->getFieldAlias($k);
        $als = explode(".", $al);
        if (isset($als[1])) {

            $al2 = $als[1];
        }


        $qtable = $this->getQueryTabel($k);
        $ftype = $lib->util->data->getFieldType($qtable, $al2);


        if (($al2 == "delete" || $al2 == "enabled") && $value == "1") {
            $returndata = "yes";
        } else if (($al2 == "delete" || $al2 == "enabled")) {
            $returndata = "No";
        } else
        if (($al2 == "image" || $al2 == "img" || $al2 == "pic")) {

            $returndata = "<img src='/uploads/images/" . $value . "'/>";
        } else if ($ftype == "date" || $ftype == "datetime") {
            $returndata = $lib->util->dateFromdb($value);
        }


        $link = "";
        $linktype = "";


        $editDVlaues = explode(",", $this->addlinkData);

        foreach ($editDVlaues as $editDVlaue) {
            $v = explode(">", $editDVlaue);



            if ($v[0]) {


                if ($al == $v[0]) {

                    $link = $v[1];
                    $linktype = $v[2];
                } else {
                    
                }
            }
        }

        $class = $k . "" . $this->rowNumber;

        if ($link != "") {
            $mor = "";
            $moreLink = "";
            $moreBefor = "";
            if ($linktype == "lightbox") {
                $mor = "lightbox-url";
                $moreLink = "?iframe=true&width=100%&height=100%";
            } else if ($linktype == "tooltip") {


                $mor = "toolTip-url";
            }




            $data = $moreBefor . "<a  class='" . $class . " " . $mor . "' href='" . $lib->util->data->TextVarUpdate($allrow, $link) . "$moreLink'>" . $returndata . "</a>";
        } else {


            $data = $returndata;
        }




        return $data;
    }

    function getEidtable($field, $id, $value, $status = "", $allrow = "") {
        $returndata = $value;

        /* @var $lib  \libs\libs */
        global $lib;


        $isTotal = $this->isProperty("editable", $this->getFieldAlias($field));
        if ($isTotal && $lib->users->getUserPermission("canedit") == "1" && ( $this->status != "clear" && $this->status != "full")) {
            switch ($status) {
                case "h":
                    $returndata = $this->renderEditableHeahderHtml($field);
                    break;
                default :
                    $returndata = $this->renderEditableBodyHtml($field, $id, $value);
                    break;
            }
        } else {
            if ($status != "h") {

                $returndata = $this->updatehtml($field, $value, $allrow);
            }
        }
        return $returndata;
    }

    function getFilter($k) {


        /* @var $lib  \libs\libs */

        global $lib;
        $d .= " <select class='filterData'>";
        $lib->db->getEnable = "1";
        $lib->db->getDleleted = "1";

        $rows = $lib->db->get_data($this->tabel, "DISTINCT `" . $k . "` as myDIS");

        $d .= " <option value='-1'> </option>";



        foreach ($rows as $v) {
            $val = $k . "__" . $v['myDIS'];


            if ($this->filterData != "") {

                $fds = explode(";", $this->filterData);
                $selected = "";
                foreach ($fds as $fd) {

                    if ($fd == $val) {





                        $selected = " selected ";
                    }
                }
            }

            $selectText = $v['myDIS'];




            $al = $this->getFieldAlias($k);
            $als = explode(".", $al);
            if (isset($als[1])) {

                $al = $als[1];
            }
            if (($al == "delete" || $al == "enabled") && $v['myDIS'] == "1") {
                $selectText = "yes";
            } else if (($al == "delete" || $al == "enabled")) {
                $selectText = "No";
            }





            $d .= " <option $selected value='" . $val . "'>" . $selectText . "</option>";
        }
        $d .= " </select>";
        $lib->db->getEnable = "";
        $lib->db->getDleleted = "";
        return $d;
    }

    function getTotal($rows) {

        /* @var $lib  \libs\libs */
        global $lib;
        $d .= "<tr>";
        foreach ($rows[0] as $k => $v) {
            $isTotal = $this->isProperty("total", $this->getFieldAlias($k));
            if ($isTotal) {
                $mysum = $lib->db->get_row($this->tabel, "sum(`" . $k . "`) as mysum", $this->returnWhere());

                $d .= "<th class='" . $k . "_total'>" . $mysum['mysum'] . "</th>";
            } else {
                $d .= "<th></th>";
            }
        }
        $d .= "</tr>";
        return $d;
    }

    function reTabel($rows, $status) {
        global $lib;
        if ($status != "tabelBody") {
            $d .= "<table>";
        }

        $i = 0;
        foreach ($rows as $cols) {


            if ($i == 0) {


                $d .= "<thead><tr>";
                foreach ($cols as $k => $v) {
                    $ishidden = explode("_", $k);
                    if ($ishidden[0] != "hidden") {

                        $label = $k . $this->getEidtable($k, "", "", "h", "", $status);
                        $d .= "<th class='" . $k . "_th'>" . $status . $label . "<input value='" . $this->getQueryTabel($k) . "' type='hidden' class='query_tabel' /></th>";
                    }
                }
                $d .= "</tr></thead><tbody class='tbodyData'>";
                if ($this->status != "clear" && $this->status != "full") {
                    $d .= "<tr>";
                    foreach ($cols as $k => $v) {
                        $ishidden = explode("_", $k);
                        if ($ishidden[0] != "hidden") {
                            $isFilter = $this->isProperty("filter", $this->getFieldAlias($k));
                            if ($isFilter) {
                                $label = $this->getFilter($k);
                                $d .= "<th class='" . $k . "_filter'>" . $label . "</th>";
                            } else {
                                $d .= "<th class='" . $k . "_filter empty'></th>";
                            }
                        }
                    }
                    $d .= "</tr>";
                }
                $i++;
            }


            $d .= "<tr>";

            foreach ($cols as $k => $v) {

                $ishidden = explode("_", $k);
                if ($ishidden[0] != "hidden") {


                    $rtitle = $this->getFieldAlias($k);



                    $idfield = explode(".", $rtitle);

                    $idfield = "hidden_" . $idfield[0] . "@id";

                    $d .= "<td class=\"" . $k . "_td \">" . $this->geteidtable($k, $cols[$idfield], $v, "", $cols, $status) . "</td>";
                }
            }
            $d .= "</tr>";
        }


        $d .= $this->getTotal($rows);


        if ($status != "tabelBody") {
            $d .= "</tbody>";
            $d .= "</table>";
        }


        if ($this->pages > 0 && ( $this->status != "clear" && $this->status != "full")) {

            $d .= $lib->util->getPageNumber($this->pages, $this->allcount);
        }



        return $d;
    }

    function relist($rows) {
        $d .= "<ul>";

        $i = 0;
        foreach ($rows as $cols) {
            if ($i == 0) {


                $d .= "<ul class='keys'>";
                foreach ($cols as $k => $v) {
                    $d .= "<li class='key " . $k . "_li'>" . $k . "</li>";
                }
                $d .= "</ul>";
            }
            $i++;
            $d .= "<ul>";
            foreach ($cols as $k => $v) {
                $d .= "<li class='" . $k . "_li'><label>" . $k . "</label>" . $v . "</li>";
            }
            $d .= "</ul>";
        }

        $d .= "</ul>";
        return $d;
    }

// </editor-fold>
}

?>
