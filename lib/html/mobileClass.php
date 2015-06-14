<?php

/**
 * Description of mobile
 *
 * @author empcl_000
 */

namespace libs\html;

class mobileClass {
    /* @var $lib  \libs\libs */

    var $lib;
    var $items;
    var $itemsTypes = [];

    function __construct($lib) {
        $this->lib = $lib;
        $this->updateType();
    }

    function _render() {




        return $this->create();
    }

    function addType($name, $des = "", $demo = "") {

        $this->itemsTypes[$name]['name'] = $name;
        $this->itemsTypes[$name]['des'] = $des;
        $this->itemsTypes[$name]['demo'] = $demo;
    }

    function updateType() {
        $this->addType("page", 'The page is the primary unit of interaction in jQuery Mobile and is used to group content into logical views'
                . ' that can be animated in and out of view with page transitions. A HTML document may start with a single '
                . '"page" and the Ajax navigation system will load additional pages on demand into the DOM as users navigate around.'
                . ' Alternatively, a HTML document can be built with multiple "pages" inside it and the framework will transition between'
                . ' these local views with no need to request content from the server.'
                , ' "pageTageName" => array("type" => "page", "name" => "aaaa")');

        $this->addType("list");

        $this->addType("header");
        $this->addType("content");
        $this->addType("footer");
        $this->addType("group", "", ' "group" => array(
            "type" => "group",
            "title" => "title",
            "groupType" => "horizontal"
        )');
        $this->addType("link");
        $this->addType("button", "", '"button" => array(
            "type" => "button",
            "target" => "myb",
             "data" => "",
            "icon" => "delete"
            ,"iconPosition"=>"top"
            , "corner" => "right"
            , "shadow" => true
            , "iconOnly" => true');


        $this->addType("form");
        $this->addType("endform");


        $this->addType("date");
        $this->addType("checkbox");
        $this->addType("endpage");
        $this->addType("endheader");
        $this->addType("endfooter");
        $this->addType("endcontent");
        $this->addType("endpanel");
        $this->addType("end");
        $this->addType("googlemap");

        $this->addType("togglebtn");

        $this->addType("endgroup");
        $this->addType("collapsible");
        $this->addType("endcollapsible");

        $this->addType("endcollapsiblegroup");

        $this->addType("collapsiblegroup");




        $this->addType("listview");

        $this->addType("text");
        $this->addType("number");
        $this->addType("month");
        $this->addType("time");
        $this->addType("week");
        $this->addType("datetime");
        $this->addType("tel");


        $this->addType("email");
        $this->addType("email");
        $this->addType("password");
        $this->addType("url");
        $this->addType("file");
        $this->addType("textarea");


        $this->addType("line");
        $this->addType("javascript");
        $this->addType("css");
        $this->addType("label");

        $this->addType("panel");
        $this->addType("popup");

        $this->addType("radio", "", '"radio" => array(
            "type" => "radio",
            "name" => "aaaa",
            "data" => "",
        )');
    }

    function getType($name) {


        return $this->itemsTypes[$name]['name'];
    }

    function getTypeinfo($name) {
        return $this->itemsTypes[$name];
    }

    function create() {




        $returnData = "";
        foreach ($this->items as $item) {


          //  print_r($_SESSION)
            ;


            switch (strtolower($item['type'])) {
                // <editor-fold defaultstate="collapsed" desc="cuontner">
                case $this->getType("endpage") :
                case $this->getType("endpage") :
                case $this->getType("endfooter") :
                case $this->getType("endcontent") :
                case $this->getType("endgroup") :
                case $this->getType("endheader") :
                case $this->getType("endcollapsible") :
                case $this->getType("endcollapsiblegroup") :
                case $this->getType("endpopup") :
                case $this->getType("endpanel") :
                case $this->getType("end") :

                    $returnData .= "</div>\n";
                    break;
                case $this->getType("page") :
                    $returnData .= "<div " . $this->getAttr($item['name'], "id") . "  data-role=\"page\">\n";
                    break;

                case $this->getType("form") :
                    $returnData .= "<form " . $this->getAttr($item['action'], "action", "") . "" . $this->getAttr($item['name'], "class", "") . " " . $this->getAttr($item['method'], "method", "post") . " >\n";

                    // if (isset($row['saveType']) && $row['saveType'] == "sesstion") {
                    $returnData .= '<script> setFormvalidation("' . $item['name'] . '" ,"addtosession","' . $item['saveTo'] . '","' . $_GET['lang'] . '")</script>';
                    //  $this->filds[0]['novalidation'] = "1";
                    //}

                    break;
                case $this->getType("endform") :
                    $returnData .= "</form >\n";
                    break;

                case $this->getType("popup") :
                    $returnData .= "<div "
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['position'], "data-position")//right,[left]
                            . $this->getAttr($item['display'], "data-display")//overlay,push,[reveal]
                            . $this->getAttr($item['position-fixed'], "position-fixed")//true
                            . "  data-role=\"popup\">\n" . $this->getTag($item['data'], "div");
                    break;

                case $this->getType("panel") :
                    $returnData .= "<div "
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['position'], "data-position")//right,[left]
                            . $this->getAttr($item['display'], " data-display")//overlay,push,[reveal]
                            . $this->getAttr($item['position-fixed'], "position-fixed")//true
                            . "  data-role=\"panel\">\n" . $this->getTag($item['data'], "div");
                    break;


                case $this->getType("header"):
                    $returnData .= "<div data-role=\"header\">" . $this->getTag($item['data'], "h1") . "\n";
                    break;
                case $this->getType("content"):
                    $returnData .= "<div role=\"main\" class=\"ui-content\">\n" . $this->getTag($item['data'], "div");
                    break;

                case $this->getType("collapsible"):
                    $returnData .= "<div role=\"\" data-role=\"collapsible\">\n" . $this->getTag($item['title'], "h4") . $this->getTag($item['data'], "div");
                    break;

                case $this->getType("collapsiblegroup"):
                    $returnData .= "<div  "
                            . $this->getAttr($item['theme'], "data-theme")
                            . $this->getAttr($item['content-theme'], "data-content-theme") .
                            " data-role=\"collapsibleset\" class=\"collapsible\">\n" . $this->getTag($item['title'], "h4") . $this->getTag($item['data'], "div");
                    break;





                case $this->getType("footer"):
                    $returnData .= "<div data-role=\"footer\">\n";
                    break;
                case $this->getType("group"):
                    $returnData .= "<div "
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['groupType'], "data-type")
                            . " data-role=\"controlgroup\">" . $this->getTag($item['title'], "legend") . "\n";
                    break;


                // </editor-fold>
// <editor-fold defaultstate="collapsed" desc="other">


                case $this->getType("link"):
                    if ($item['target'] != null) {
                        $href = "#" . $item['target'];
                    } else {
                        $href = $item['href'];
                    }
                    $returnData .= "<a  "
                            . $this->updateClass($item) . " ' "
                            . $this->getAttr($href, "href")
                            . $this->getAttr($item['rel'], "data-rel") //close,popup
                            . $this->getAttr($item['transition'], "data-transition") //none,pop,fade,flip,turn,flow,slide,slidefade,slideup,slidedown
                            . $this->getAttr($item['theme'], "data-theme") //a,b,c
                            . " >"
                            . $this->getTag($item['data'], "span") . "</a>\n";
                    break;

                case $this->getType("button"):

                    if ($item['target'] != null) {
                        $href = "#" . $item['target'];
                    } else {
                        $href = $item['href'];
                    }



                    $returnData .= "<a class='ui-btn  "
                            . $this->updateClass($item) . " ' "
                            . $this->getAttr($href, "href")
                            . $this->getAttr($item['rel'], "data-rel") //close,popup
                            . " >"
                            . $this->getTag($item['data'], "span") . "</a>\n";
                    break;


                case $this->getType("listview"):



                    $returnData .= "<fieldset data-role=\"controlgroup\">" . $this->getTag($item['title'], "legend") . $this->getList($item) . "</fieldset>\n";
                    break;
                /*
                 * 
                 *   <fieldset data-role="controlgroup">
                  <legend>Vertical:</legend>
                 */




                case $this->getType("checkbox"):
                    $returnData .= "<label><input   "
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['value'], "value")
                            . " type='checkbox'  " . $this->updateClass($item) . " ' />"
                            . $this->getTag($item['data'], "span") . "</label>\n";
                    break;



                case $this->getType("googlemap"):


                    $id = $item['name'] . "map-canvas";

                    if ($item['address'] == "true") {

                        $returnData .=//map_coordinates

                                "<input  id='add" . $id . "'" . "  name ='" . $item['name'] . "_address'   type='text' value=''>";
                    }

                    $returnData .= "<div style=' width: 100%; height: 100%; padding: 0;min-height:350px;' id=\"" . $id . "\"></div>"
                            . "<input name ='" . $item['name'] . "_coordinates'  class='" . $id . "'  type='hidden' value='ss'>"
                            . "<script>loadGoogleMap('" . $id . "','" . $this->getAttr($item['address']) . "')</script>\n";


                    break;






                case $this->getType("radio"):
                    $returnData .= " <label >"
                            . $this->getTag($item['data'], "span")
                            . "<input type=\"radio\""
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['value'], "value")
                            . "> </label> \n";
                    break;

                case $this->getType("togglebtn"):




                    $returnData .= '      
                        <div class="containing-element">
	<label for="flip-min">' . $this->getTag($item['title'], "span") . '</label>
	<select
          ' . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['name'], "name") . ' data-role="slider">
		' . $this->getList($item) . '
	</select>
</div>';
                    break;







                case $this->getType("date"):


                    $returnData .= "<input type=\"text\" " . $this->getAttr($item['inline'], "data-inline") . "  data-role=\"date\"/>\n";
                    break;


                case $this->getType("text"):


                    $returnData .=  "<div " . $this->getAttr($item['name'] . "_p " . $this->getAttr($item['class'] . "_p"), "class") . "> <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['name'] . " " . $this->getAttr($item['class']), "class")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"text\"></div>"
                            . "\n";
                    break;

                case $this->getType("number"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['value'], "value")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['pattern'], "pattern") .
                            " type=\"number\">"
                            . "\n";
                    break;
                case $this->getType("month"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"month\">"
                            . "\n";
                    break;



                case $this->getType("week"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"week\">"
                            . "\n";
                    break;

                case $this->getType("time"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"time\">"
                            . "\n";
                    break;

                case $this->getType("datetime"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"datetime\">"
                            . "\n";
                    break;

                case $this->getType("tel"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"tel\">"
                            . "\n";
                    break;



                case $this->getType("email"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"email\">"
                            . "\n";
                    break;


                case $this->getType("url"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"url\">"
                            . "\n";
                    break;

                case $this->getType("password"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"password\">"
                            . "\n";
                    break;
                case $this->getType("color"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['value'], "value")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder") .
                            " type=\"color\">"
                            . "\n";
                    break;




                case $this->getType("file"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['data-clear-btn'], "clearBtn")
                            . $this->getAttr($item['mini'], "data-mini")
                            . $this->getAttr($item['disabled'], "disabled")
                            . $this->getAttr($item['enhanced'], "data-enhanced")
                            . $this->getAttr($item['Placeholder'], "Placeholder")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"file\">"
                            . "\n";
                    break;




                case $this->getType("hidden"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <input"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['value'], "value") .
                            " type=\"file\">"
                            . "\n";
                    break;








                case $this->getType("textarea"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <textarea"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['cols'], "cols")
                            . $this->getAttr($item['rows'], "rows")
                            . " type=\"text\"></textarea>"
                            . "\n";
                    break;

                /*
                 * 
                 * multiple="multiple" data-native-menu="false" data-icon="grid" data-iconpos="left"
                 */

                case $this->getType("select"):
                    $returnData .= " <label"
                            . $this->getAttr($item['name'], "for") . ">" . $this->getTag($item['title'], "span", $item['data']) . "</label>"
                            . " <select"
                            . $this->getAttr($item['name'], "name")
                            . $this->getAttr($item['name'], "id")
                            . $this->getAttr($item['menu'], "data-native-menu")
                            . $this->getAttr($item['icon'], "data-icon")
                            . $this->getAttr($item['iconpos'], "data-iconpos")
                            . $this->getAttr($item['multiple'], "multiple")
                            . " type=\"text\">" . $this->getOptions($item['options']) . "</select>"
                            . "\n";
                    break;
                case $this->getType("line"):
                    $returnData .="<div class='line'>" . $this->getTag($item['data'], "span") . "</div>";
                    break;
                case $this->getType("label"):
                    $returnData .="<div class='label'>" . $this->getTag($item['data'], "label") . "</div>";

                    break;
                case $this->getType("javascript"):
                    $returnData .="<script>" . urldecode($this->getAttr($item['data'])) . "</script>";


                    break;
                case $this->getType("css"):
                    $returnData .="<style>" . $this->getAttr($item['data']) . "</style>";

                    break;
// </editor-fold>
            }


            /*
             *   $this->addType("line");
              $this->addType("javascript");
              $this->addType("css");
              $this->addType("label");
             */
        }







        return $returnData;
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

    function getString($data, $item = "", $type = "") {
        $allf = explode(";", $data);



        foreach ($allf as $s) {



            /*
              if ($this->notLang != "Y") {

              $s = $this->util->data->TextVarUpdate("", $s, $lang);
              }
             */

            $row = $this->tarray($s);

            if (isset($row['inputtype'])) {
                $row['type'] = $row['inputtype'];
            }





            $this->items = array($row);


            $mydata.=$this->_render();
        }
        return $mydata;
    }

    function getStringArray($item) {
        $r = [];
        $i = 0;


        $data = $item['data'];


        if ($item['dataType'] == "db") {

            $mydata = $this->lib->db->get_Data($item['table'], "*", $this->getAttr($item['query']));




            foreach ($mydata as $d) {
                $i++;
                if ($item["fieldText"] == null) {
                    $item["fieldText"] = $item["fieldValue"];
                }


                $r[$i]['value'] = $d[$item["fieldValue"]];
                $r[$i]['text'] = $d[$item["fieldText"]];
            }
            // print_r($r);
        } else {
            $data = explode(";", urldecode($data));

            foreach ($data as $d) {
                $i++;
                $a = explode(">>", $d);
                if ($a[1] == null) {
                    $a[1] = $a[0];
                }

                $r[$i]['value'] = $a[0];
                $r[$i]['text'] = $a[1];
            }
        }


        return $r;
    }

    function getList($item = "") {



        $data = $this->getStringArray($item);


        $r = "";
        $i = 0;
        foreach ($data as $d) {
            switch ($item['listType']) {


                case "radio":
                    $r.="<input type=\"radio\" name=\"" . $item['name'] . "\"   class=\"" . $item['name'] . " " . $this->getAttr($item['class']) . "\" id=\"" . $item['name'] . "_$i\" value=" . $d["value"] . "><label for=\"" . $item['name'] . "_$i\" >" . $d["text"] . "</label>";
                    break;
                case "checkbox":
                    $r.="<input type=\"checkbox\" name=\"" . $item['name'] . "\" id=\"" . $item['name'] . "_$i\" value=" . $d["value"] . "><label for=\"" . $item['name'] . "_$i\" >" . $d["text"] . "</label>";

                    break;
                case "buttons":
                    $r.="<input type=\"button\" name=\"" . $item['name'] . "\" id=\"" . $item['name'] . "_$i\" value=" . $d["value"] . "><label for=\"" . $item['name'] . "_$i\" >" . $d["text"] . "</label>";

                    break;


                default :
                    $r.="<option value=\"" . $d["value"] . "\">" . $d["text"] . "</option>";
                    break;
            }

            $i++;
        }
        return $r;
    }

    function getOptions($data, $item = "", $type = "") {
        $data = $this->getStringArray($data, $item, $type);
        $r = "";
        foreach ($data as $d) {
            $r.="<option value=\"" . $d["value"] . "\">" . $d["text"] . "</option>";
        }
        return $r;
    }

    function updateClass($item) {

        $moreClass = "";

        $moreClass .=$item['class'];

        if ($item['corner'] != null) {
            $moreClass .= " ui-corner-" . $item['corner'];
        }
        if ($item['shadow'] == true) {
            $moreClass .= " ui-shadow";
        }
        if ($item['inline'] == true) {
            $moreClass .= " ui-btn-inline";
        }

        if ($item['theme'] != null) {
            $moreClass .= " ui-btn-" . $item['theme'];
        }

        if ($item['disabled'] == true) {
            $moreClass .= " ui-state-disabled ";
        }


        if ($item['disabled'] == true) {
            $moreClass .= " ui-state-disabled ";
        }

        if ($item['mini'] == true) {
            $moreClass .= " ui-mini ";
        }



        if ($item['iconShadow'] == true) {
            $moreClass .= " ui-shadow-icon ";
        }

        if ($item['iconPosition'] != null) {
            $moreClass .= " ui-btn-icon-" . $item['iconPosition'];
        }

        if ($item['icon'] != null) {
            $moreClass .= " ui-icon-" . $item['icon'];
            if ($item['iconPosition'] == null) {
                $moreClass .= " ui-btn-icon-left";
            }
        }
        if ($item['iconOnly'] == true) {

            $moreClass .= " ui-btn-icon-notext";
        }




        return $moreClass;
    }

    function getAttr($a, $t = "", $def = "") {
        $r = $a;
        if ($a != null && $a != "0") {

            if ($t != "") {
                $r = " " . $t . "=\"" . urldecode($a) . "\" ";
            } else {
                $r = $a;
            }
        } else {

            if ($def != "") {
                $r = " " . $t . "=\"" . urldecode($def) . "\" ";
            }
        }

        return $r;
    }

    function getTag($a, $t = "", $edf = "") {
        $r = $a;
        if ($a != null) {

            if ($t != "") {
                $r = "\n<" . $t . ">" . urldecode($a) . "</" . $t . ">\n";
            } else {
                $r = $a;
            }
        } else {


            if ($t != "") {
                $r = "\n<" . $t . ">" . urldecode($edf) . "</" . $t . ">\n";
            }
        }

        return $r;
    }

    /*
     * 
     * <div data-role="page">

      <div data-role="header">
      <h1>Page Title</h1>
      </div><!-- /header -->

      <div role="main" class="ui-content">
      <p>Page content goes here.</p>
      </div><!-- /content -->

      <div data-role="footer">
      <h4>Page Footer</h4>
      </div><!-- /footer -->
      </div><!-- /page -->
     */
}
